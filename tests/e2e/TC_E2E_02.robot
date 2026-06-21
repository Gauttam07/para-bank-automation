*** Settings ***
Resource    ../../resources/keywords/common_resources.robot
Resource    ../../resources/keywords/api_keywords.robot
Resource    ../../resources/pages/home_page.robot
Resource    ../../resources/pages/open_new_account_page.robot

Suite Setup      Setup E2E
Test Setup       Open Application
Test Teardown    Close Application

*** Test Cases ***
TC_E2E_02 Create Checking Account and Verify Customer Accounts via API
    [Documentation]    End-to-End Checking Account UI creation & API verification
    [Tags]    e2e
#    login    ${USER_ID}    ${USER_PWD}
    Ensure User Is Logged In
    Click Open New Account
    Select Account Type    0
    Click Open Account Button
    ${account_id}=    Get New Account Number
    ${account_details}=    Get Account Details    ${account_id}
    Verify Response Code    ${account_details}    200
    ${account_json}=    Set Variable    ${account_details.json()}
    ${cust_id}=    Set Variable    ${account_json['customerId']}
    ${response}=    Get Customer Accounts    ${cust_id}
    Verify Response Code    ${response}    200
    Should Contain    ${response.text}    ${account_id}
