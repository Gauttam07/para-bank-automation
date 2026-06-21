*** Settings ***
Resource    ../../resources/keywords/common_resources.robot
Resource    ../../resources/keywords/api_keywords.robot
Resource    ../../resources/pages/home_page.robot
Resource    ../../resources/pages/transfer_funds_page.robot
Resource    ../../resources/pages/open_new_account_page.robot

Suite Setup      Setup E2E
Test Setup       Open Application
Test Teardown    Close Application

*** Test Cases ***
TC_E2E_03 Transfer Funds via UI and Verify Balances via API
    [Documentation]    End-to-End Funds Transfer via UI and verification via API
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

    # Step 3: Fetch starting balance of source account via API
    ${response}=    Get Account Details    ${source_account}
    Verify Response Code    ${response}    200
    ${source_details}=    Set Variable    ${response.json()}
    ${source_before}=    Set Variable    ${source_details['balance']}

    # Step 4: Transfer $10 from Checking to Savings via UI
    Click Transfer Funds
    Enter Amount    10
    Select From Account    ${source_account}
    Select To Account    ${destination_account}
    Click Transfer Button
    Wait Until Page Contains    Transfer Complete!    10s

    ${expected}=    Evaluate    float(${source_before}) - 10
    Log To Console    Expected = ${expected}
    Wait Until Keyword Succeeds    10s    1s    Verify Account Balance    ${source_account}    ${expected}
