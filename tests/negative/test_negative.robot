*** Settings ***
Library    RequestsLibrary
Resource    ../../resources/pages/negative.robot
Resource    ../../resources/pages/login.robot
Resource    ../../resources/keywords/common_resources.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Variables ***
${API_BASE}    https://parabank.parasoft.com/parabank/services/bank

*** Test Cases ***
TC-NEG-01 Login with Non Existent User
    [Documentation]    Verify that logging in with a username that doesnt exist shows an error
    [Tags]    negative    UI
    Login With Invalid Credentials
    Verify Login Error Is Shown

TC-NEG-02 Blank Transfer Amount
    [Documentation]    Submit the transfer form without entering an amount and check for validation
    [Tags]    negative    UI
    Ensure User Is Logged In
    Submit Blank Transfer Amount
    Verify Transfer Error Is Shown

TC-NEG-03 Transfer Negative Amount
    [Documentation]    Enter -100 as transfer amount — app should reject it with an error
    ...    NOTE: This test is expected to FAIL — ParaBank processes the transfer
    ...    without showing any error (logged as DEF-001)
    [Tags]    negative    UI    known-bug
    Ensure User Is Logged In
    Submit Transfer With Negative Amount
    Verify Transfer Error Is Shown

TC-NEG-04 Transfer Amount Greater Than Balance
    [Documentation]    Enter 999999 as amount — far more than any demo account holds
    ...    NOTE: This test is expected to FAIL — ParaBank completes the transfer
    ...    instead of blocking it (logged as DEF-002)
    [Tags]    negative    UI    known-bug
    Ensure User Is Logged In
    Submit Transfer With Amount Greater Than Balance
    Verify Transfer Error Is Shown

TC-NEG-05 Invalid Account ID via API
    [Documentation]    Call GET /accounts/000000 with a fake account ID — expect a 4xx response
    [Tags]    negative    API
    [Setup]    NONE
    [Teardown]    NONE
    ${auth}=    Create List    john    demo
    Create Session    parabank    ${API_BASE}    auth=${auth}    verify=${False}
    ${response}=    GET On Session    parabank    /accounts/000000
    ...    expected_status=any
    Log To Console    Response status: ${response.status_code}
    Should Not Be Equal As Integers    ${response.status_code}    200

TC-NEG-06 Login API with Invalid Credentials
    [Documentation]    Call login API with wrong credentials — expect a non-200 response
    [Tags]    negative    API
    [Setup]    NONE
    [Teardown]    NONE
    Create Session    parabank    ${API_BASE}    verify=${False}
    ${response}=    GET On Session    parabank    /login/baduser_xyz/wrongpass123
    ...    expected_status=any
    Log To Console    Response status: ${response.status_code}
    Should Not Be Equal As Integers    ${response.status_code}    200
