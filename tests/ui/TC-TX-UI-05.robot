*** Settings ***
Resource    ../../resources/keywords/common_resources.robot
Resource    ../../resources/pages/home_page.robot
Resource    ../../resources/pages/transfer_funds_page.robot

Suite Setup       Load Environment
Test Setup        Open Application
Test Teardown     Close Application

*** Test Cases ***
TC-TX-UI-05
    [Documentation]    Verify UI Error Message for Transfer Amount Exceeding Available Balance
    login    ${USER_ID}    ${USER_PWD}

    Click Transfer Funds
    Sleep    1s
    Location Should Contain    transfer

    Input Text    ${AMOUNT_FIELD}    100000000
    Select From List By Value  ${FROM_ACCOUNT_DROPDOWN}   13344
    Select From List By Index  ${TO_ACCOUNT_DROPDOWN}   1
    Click Transfer Button
    Sleep    2s

    Page Should Contain    Error