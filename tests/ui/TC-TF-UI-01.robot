*** Settings ***
Resource    ../../resources/keywords/common_resources.robot
Resource    ../../resources/pages/home_page.robot
Resource    ../../resources/pages/transfer_funds_page.robot

Suite Setup       Load Environment
Test Setup        Open Application
Test Teardown     Close Application

*** Test Cases ***
TC-TF-01
    [Documentation]    Transfer Funds Between Two Accounts
    login    ${USER_ID}    ${USER_PWD}

    Click Transfer Funds
    Sleep    1s
    Location Should Contain    transfer

    Input Text    ${AMOUNT_FIELD}    50
    Select From List By Value  ${FROM_ACCOUNT_DROPDOWN}   13344
    Select From List By Index  ${TO_ACCOUNT_DROPDOWN}   1
    Click Transfer Button
    Sleep    2s

    Page Should Contain    Transfer Complete!