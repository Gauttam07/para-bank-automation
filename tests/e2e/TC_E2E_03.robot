*** Settings ***
Resource    ../../resources/keywords/common_resources.robot
Resource    ../../resources/keywords/api_keywords.robot
Resource    ../../resources/pages/home_page.robot
Resource    ../../resources/pages/transfer_funds_page.robot

Suite Setup      Setup E2E
Test Setup       Open Application
Test Teardown    Close Application

*** Test Cases ***
TC_E2E_03 Transfer Funds via UI and Verify Balances via API
    [Documentation]    End-to-End Funds Transfer via UI and verification via API
    [Tags]    e2e
    login    ${USER_ID}    ${USER_PWD}
    ${response}=    Get Customer Accounts    ${CUSTOMER_ID}
    Verify Response Code    ${response}    200
    ${accounts}=    Set Variable    ${response.json()}
    ${source_account}=    Set Variable    ${accounts[0]['id']}
    ${destination_account}=    Set Variable    ${accounts[1]['id']}
    ${source_before}=    Set Variable    ${accounts[0]['balance']}

    Click Transfer Funds
    Sleep    1s
    Enter Amount    10
    Select From Account    ${source_account}
    Select To Account    ${destination_account}
    Click Transfer Button
    Page Should Contain    Transfer Complete!

    ${response_after}=    Get Customer Accounts    ${CUSTOMER_ID}
    ${accounts_after}=    Set Variable    ${response_after.json()}
    ${source_after}=    Set Variable    ${accounts_after[0]['balance']}
    Log To Console    ${source_after}

    ${expected}=    Evaluate    float(${source_before}) - 10
    Log To Console    ${expected}
    Should Be Equal As Numbers    ${source_after}    ${expected}  precision=1
