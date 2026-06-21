*** Settings ***
Resource    ../../resources/keywords/common_resources.robot
Resource    ../../resources/keywords/api_keywords.robot
Resource    ../../resources/pages/home_page.robot
Resource    ../../resources/pages/open_new_account_page.robot

Suite Setup      Setup E2E
Test Setup       Open Application
Test Teardown    Close Application

*** Test Cases ***
TC_E2E_01 Create Savings Account and Verify details via API
    [Documentation]    End-to-End Savings Account UI creation & API verification
    [Tags]    e2e
#    login    ${USER_ID}    ${USER_PWD}
    Ensure User Is Logged In
    Click Open New Account
    Select Account Type    1
    Click Open Account Button
    ${account_id}=    Get New Account Number
    ${response}=    Get Account Details    ${account_id}
    Verify Response Code    ${response}    200
    Should Contain    ${response.text}    SAVINGS
    Should Contain    ${response.text}    ${account_id}