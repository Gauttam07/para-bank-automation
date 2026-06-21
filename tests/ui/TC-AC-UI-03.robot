*** Settings ***
Resource    ../../resources/keywords/common_resources.robot
Resource    ../../resources/pages/home_page.robot
Resource    ../../resources/pages/open_new_account_page.robot

Suite Setup       Load Environment
Test Setup        Open Application
Test Teardown     Close Application

*** Test Cases ***
TC-AC-UI-03
    [Documentation]    Create Multiple Accounts for Same User
    login    ${USER_ID}    ${USER_PWD}
    Click Open New Account
    Wait Until Location Contains    openaccount    10s

    Select Account Type    1
    Select Funding Account ID    13344

    Click Open Account Button

    Page Should Contain    Account Opened!
    Page Should Contain    Your new account number
    Log To Console    Saving account created successfully

    Click Open New Account
    Wait Until Location Contains    openaccount    10s

    Log To Console    Open_Account

    Select Account Type    0
    Select Funding Account ID    13344

    Click Open Account Button

    Page Should Contain    Account Opened!
    Page Should Contain    Your new account number
    Log To Console   Checking Account Opened Successfully

    Click Accounts Overview Link

