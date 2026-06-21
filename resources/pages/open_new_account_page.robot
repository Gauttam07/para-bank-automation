*** Settings ***
Library    SeleniumLibrary
Resource    ../../variables/open_new_account_variables.robot

*** Keywords ***
Dropdown Should Have Options
    [Arguments]    ${locator}
    ${items}=    Get List Items    ${locator}
    Should Not Be Empty    ${items}

Select Account Type
    [Arguments]    ${account_type}
    Wait Until Element Is Visible    ${ACCOUNT_TYPE_DROPDOWN}    10s
    Wait Until Element Is Visible    ${ACCOUNT_ID_DROPDOWN}    10s
    Wait Until Keyword Succeeds    10s    1s    Dropdown Should Have Options    ${ACCOUNT_ID_DROPDOWN}
    Select From List By Value    ${ACCOUNT_TYPE_DROPDOWN}    ${account_type}

Select Funding Account ID
    [Arguments]    ${account_id}
    Wait Until Element Is Visible    ${ACCOUNT_ID_DROPDOWN}    10s
    Wait Until Keyword Succeeds    10s    1s    Select From List By Value    ${ACCOUNT_ID_DROPDOWN}    ${account_id}

Click Open Account Button
    Wait Until Element Is Visible    ${OPEN_ACCOUNT_BUTTON}    10s
    Click Element    ${OPEN_ACCOUNT_BUTTON}
    Wait Until Page Contains    Account Opened!    10s

Click Account Details Link
    Wait Until Element Is Visible    ${ACCOUNT_DETAILS_LINK}    10s
    Click Element    ${ACCOUNT_DETAILS_LINK}
    Wait Until Location Contains    account.htm    10s

Click Accounts Overview Link
    Wait Until Element Is Visible    ${ACCOUNTS_OVERVIEW}    10s
    Click Element    ${ACCOUNTS_OVERVIEW}
    Wait Until Page Contains    Balance    10s

Verify Account Details Page
    Location Should Contain    accountdetails

Get New Account Number
    Wait Until Element Is Visible    ${ACCOUNT_DETAILS_LINK}    timeout=20s

    ${account_id}=    Get Text    ${ACCOUNT_DETAILS_LINK}

    Log To Console    Account ID = ${account_id}

    RETURN    ${account_id}