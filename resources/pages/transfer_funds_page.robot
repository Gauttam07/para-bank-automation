*** Settings ***
Library    SeleniumLibrary
Resource    ../../variables/transfer_funds_variables.robot

*** Keywords ***
Dropdown Should Have Options
    [Arguments]    ${locator}
    ${items}=    Get List Items    ${locator}
    Should Not Be Empty    ${items}

Select From Account
    [Arguments]    ${from_account}
    Wait Until Element Is Visible    ${FROM_ACCOUNT_DROPDOWN}    10s
    Wait Until Keyword Succeeds    10s    1s    Select From List By Value    ${FROM_ACCOUNT_DROPDOWN}    ${from_account}

Select To Account
    [Arguments]    ${to_account}
    Wait Until Element Is Visible    ${TO_ACCOUNT_DROPDOWN}    10s
    Wait Until Keyword Succeeds    10s    1s    Select From List By Value    ${TO_ACCOUNT_DROPDOWN}    ${to_account}

Enter Amount
    [Arguments]    ${amount}
    Wait Until Element Is Visible    ${AMOUNT_FIELD}    10s
    Input Text    ${AMOUNT_FIELD}    ${amount}

Click Transfer Button
    Wait Until Element Is Visible    ${TRANSFER_BUTTON}    10s
    Click Element    ${TRANSFER_BUTTON}