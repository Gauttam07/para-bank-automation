*** Settings ***
Resource    ../../resources/keywords/common_resources.robot
Resource    ../../resources/pages/home_page.robot
Resource    ../../resources/pages/transfer_funds_page.robot

Suite Setup       Load Environment
Test Setup        Open Application
Test Teardown     Close Application

*** Test Cases ***
TC-TX-UI-03
    [Documentation]    Verify UI Validation for Blank Amount in Transfer Form
    login    ${USER_ID}    ${USER_PWD}

    Click Transfer Funds
    Sleep    1s
    Location Should Contain    transfer

    Select From List By Value  ${FROM_ACCOUNT_DROPDOWN}   14010
    Select From List By Index  ${TO_ACCOUNT_DROPDOWN}   1
    Click Transfer Button
    Sleep    2s

    Page Should Contain    Error