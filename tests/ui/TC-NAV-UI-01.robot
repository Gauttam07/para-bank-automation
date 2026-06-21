*** Settings ***
Resource    ../../resources/keywords/common_resources.robot
Resource    ../../resources/pages/home_page.robot

Suite Setup       Load Environment
Test Setup        Open Application
Test Teardown     Close Application

*** Test Cases ***
TC-NAV-UI-01
    [Documentation]    Verify Navigation Flow and Menu Link Integrity
    login    ${USER_ID}    ${USER_PWD}

    Click Open New Account
    Wait Until Location Contains    openaccount    10s

    Click Transfer Funds
    Wait Until Location Contains    transfer    10s