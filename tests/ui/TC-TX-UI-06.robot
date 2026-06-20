*** Settings ***
Resource    ../../resources/keywords/common_resources.robot
Resource    ../../resources/pages/home_page.robot
Resource    ../../resources/pages/transfer_funds_page.robot

Suite Setup       Load Environment
Test Setup        Open Application
Test Teardown     Close Application

*** Test Cases ***
TC-TX-UI-06
    [Documentation]    Validate transfer funds to same account
    login    ${USER_ID}    ${USER_PWD}

    Click Transfer Funds
    Sleep    1s
    Location Should Contain    transfer

    Input Text    ${AMOUNT_FIELD}    100
    Select From List By Value  ${FROM_ACCOUNT_DROPDOWN}   13344
    Select From List By Value  ${TO_ACCOUNT_DROPDOWN}   13344
    Click Transfer Button
    Sleep    2s


    Page Should Contain    Transfer Complete!
    Log To Console    Transfer to same account is successful

