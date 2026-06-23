*** Settings ***
Resource    ../../resources/keywords/common_resources.robot
Resource    ../../resources/pages/home_page.robot
Resource    ../../resources/pages/transfer_funds_page.robot
Resource    ../../resources/pages/open_new_account_page.robot

Suite Setup       Load Environment
Test Setup        Open Application
Test Teardown     Close Application

*** Test Cases ***
TC_NEG_TF_UI-03
    [Documentation]    Verify UI Validation for Blank Amount in Transfer Form Error Message
    login    ${USER_ID}    ${USER_PWD}

    # Step 1: Open a Checking Account
    Click Open New Account
    Select Account Type    0
    Click Open Account Button
    ${checking_id}=    Get New Account Number

    # Step 2: Open a Savings Account
    Click Open New Account
    Select Account Type    1
    Click Open Account Button
    ${savings_id}=    Get New Account Number

    # Step 3: Go to Transfer Funds
    Click Transfer Funds
    Wait Until Location Contains    transfer    10s

    Select From Account    ${checking_id}
    Select To Account    ${savings_id}
    Click Transfer Button
    Wait Until Page Contains    Error    10s
