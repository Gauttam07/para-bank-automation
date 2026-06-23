*** Settings ***
Resource    ../../resources/keywords/common_resources.robot
Resource    ../../resources/pages/home_page.robot
Resource    ../../resources/pages/transfer_funds_page.robot
Resource    ../../resources/pages/open_new_account_page.robot

Suite Setup       Load Environment
Test Setup        Open Application
Test Teardown     Close Application

*** Test Cases ***
TC_NEG_TF_UI-01
    [Documentation]    Verify UI Validation for Negative Amount in Transfer Form Error Message
    [Tags]    negative    UI    known-bug
    login    ${USER_ID}    ${USER_PWD}


    Click Open New Account
    Select Account Type    0
    Click Open Account Button
    ${checking_id}=    Get New Account Number

    Click Open New Account
    Select Account Type    1
    Click Open Account Button
    ${savings_id}=    Get New Account Number

    Click Transfer Funds
    Wait Until Location Contains    transfer    10s

    Enter Amount    -100
    Select From Account    ${checking_id}
    Select To Account    ${savings_id}
    Click Transfer Button

    Wait Until Page Does Not Contain    Transfer Complete!   10s
    Log To Console    Negative amount transfer is Not Possible

    

