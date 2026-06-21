*** Settings ***
Resource    ../../resources/keywords/common_resources.robot
Resource    ../../resources/keywords/api_keywords.robot
Resource    ../../resources/pages/home_page.robot
Resource    ../../resources/pages/open_new_account_page.robot
Resource    ../../resources/pages/transfer_funds_page.robot

Suite Setup      Setup E2E
Test Setup       Open Application
Test Teardown    Close Application

*** Test Cases ***
TC_E2E_04 Create New Account and Transfer Funds to It
    [Documentation]    End-to-End creation of two accounts and transfer between them, verified via API
    [Tags]    e2e
#    login    ${USER_ID}    ${USER_PWD}
    Ensure User Is Logged In

    # Step 1: Open a Checking Account
    Click Open New Account
    Select Account Type    0
    Click Open Account Button
    ${source_account}=    Get New Account Number

    # Step 2: Open a Savings Account
    Click Open New Account
    Select Account Type    1
    Click Open Account Button
    ${destination_account}=    Get New Account Number

    # Step 3: Fetch starting balance of destination account via API
    ${response_dest}=    Get Account Details    ${destination_account}
    Verify Response Code    ${response_dest}    200
    ${dest_details}=    Set Variable    ${response_dest.json()}
    ${starting_balance}=    Set Variable    ${dest_details['balance']}

    # Step 3: Transfer $25 to the new account from source account
    Click Transfer Funds
    Enter Amount    25
    Select From Account    ${source_account}
    Select To Account    ${destination_account}
    Click Transfer Button
    Wait Until Page Contains    Transfer Complete!    10s

    ${expected}=    Evaluate    float(${starting_balance}) + 25
    Wait Until Keyword Succeeds    10s    1s    Verify Account Balance    ${destination_account}    ${expected}
