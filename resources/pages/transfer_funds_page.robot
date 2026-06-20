*** Settings ***
Library    SeleniumLibrary
Resource    ../../variables/transfer_funds_variables.robot

*** Keywords ***
Select From Account
    [Arguments]    ${from_account}
    Select From List By Value    ${FROM_ACCOUNT_DROPDOWN}    ${from_account}
    Sleep    1s

Select To Account
    [Arguments]    ${to_account}
    Select From List By Value    ${TO_ACCOUNT_DROPDOWN}    ${to_account}
    Sleep    1s

Enter Amount
    [Arguments]    ${amount}
    Input Text    ${AMOUNT_FIELD}    ${amount}
    Sleep    1s

Click Transfer Button
    Click Element    ${TRANSFER_BUTTON}
    Sleep    2s