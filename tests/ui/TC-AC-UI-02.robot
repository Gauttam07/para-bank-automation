*** Settings ***
Resource    ../../resources/keywords/common_resources.robot
Resource    ../../resources/pages/home_page.robot
Resource    ../../resources/pages/open_new_account_page.robot

Suite Setup       Load Environment
Test Setup        Open Application
Test Teardown     Close Application

*** Test Cases ***
TC-AC-UI-01
    [Documentation]    Create Savings Account
    login    ${USER_ID}    ${USER_PWD}
    Click Open New Account
    Sleep    1s
    Location Should Contain    openaccount

    Select Account Type    1
    Select Funding Account ID    13344
    Sleep    1s

    Click Open Account Button

    Page Should Contain    Account Opened!
    Page Should Contain    Your new account number
    Log To Console    Saving account created successfully