*** Settings ***
Library    SeleniumLibrary
Resource    ../../variables/home_variables.robot

*** Keywords ***
Click Open New Account
    Click Element    ${OPEN_NEW_ACCOUNT_URL}

Click Transfer Funds
    Click Element    ${TRANSFER_FUNDS_URL}