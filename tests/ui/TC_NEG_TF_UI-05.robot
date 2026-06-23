*** Settings ***
Resource    ../../resources/keywords/common_resources.robot
Resource    ../../resources/pages/home_page.robot
Resource    ../../resources/pages/transfer_funds_page.robot
Resource    ../../resources/pages/open_new_account_page.robot

Suite Setup       Load Environment
Test Setup        Open Application
Test Teardown     Close Application

*** Test Cases ***
TC_NEG_TF_UI-06
    [Documentation]    Validate transfer funds to same account give error message
    login    ${USER_ID}    ${USER_PWD}

    Click Open New Account
    Select Account Type    1
    Click Open Account Button
    ${savings_id}=    Get New Account Number


    Click Transfer Funds
    Wait Until Location Contains    transfer    5s

    Enter Amount    100
    Select From Account    ${savings_id}
    Select To Account    ${savings_id}
    Click Transfer Button
    Wait Until Page Does Not Contain   Transfer Complete!    5s
    Log To Console    Transfer to same account is Not Possible
