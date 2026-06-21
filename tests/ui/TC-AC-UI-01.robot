*** Settings ***
Resource    ../../resources/keywords/common_resources.robot
Resource    ../../resources/pages/home_page.robot
Resource    ../../resources/pages/open_new_account_page.robot

Suite Setup       Load Environment
Test Setup        Open Application
Test Teardown     Close Application

*** Test Cases ***
TC-AC-UI-02
    [Documentation]    Create New Account with Valid Data
    login    ${USER_ID}    ${USER_PWD}

    Click Open New Account
    Wait Until Location Contains    openaccount    10s

    Log To Console    Open_Account

    Select Account Type    0
    Select Funding Account ID    13344
    Click Open Account Button

    Page Should Contain    Account Opened!
    Page Should Contain    Your new account number
    Log To Console    Account Opened Successfully