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
    [Documentation]    End-to-End creation of a checking account and transfer to it, verified via API
    [Tags]    e2e
    login    ${USER_ID}    ${USER_PWD}

    # Step 1: Create a checking account
    Click Open New Account
    Sleep    1s
    Select Account Type    0
    Click Open Account Button
    ${new_account_id}=    Get New Account Number

    # Step 2: Fetch its starting balance
    ${response_new}=    Get Account Details    ${new_account_id}
    Verify Response Code    ${response_new}    200
    ${new_account_details}=    Set Variable    ${response_new.json()}
    ${starting_balance}=    Set Variable    ${new_account_details['balance']}

    # Step 3: Transfer $25 to the new account from default funding account
    Click Transfer Funds
    Sleep    1s
    Enter Amount    25
    Select From Account    ${ACCOUNT_ID}
    Select To Account    ${new_account_id}
    Click Transfer Button
    Page Should Contain    Transfer Complete!

    # Step 4: Verify the balance has increased
    ${response_after}=    Get Account Details    ${new_account_id}
    Verify Response Code    ${response_after}    200
    ${new_account_details_after}=    Set Variable    ${response_after.json()}
    ${after_balance}=    Set Variable    ${new_account_details_after['balance']}

    ${expected}=    Evaluate    float(${starting_balance}) + 25
    Should Be Equal As Numbers    ${after_balance}    ${expected}
