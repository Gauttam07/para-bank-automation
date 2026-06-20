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
    Sleep    1s
    Location Should Contain    openaccount

    Click Transfer Funds
    Sleep    1s
    Location Should Contain    transfer