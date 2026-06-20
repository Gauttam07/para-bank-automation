*** Settings ***
Resource    ../../resources/keywords/api_keywords.robot

Suite Setup  Create Session To API

*** Test Cases ***
TC_API_06 Validate Destination Account Balance After Transfer
    [Documentation]    Validate destination account balance after transfer
    [Tags]    api

    ${TRANSFER_AMOUNT}=    Set Variable    10

    ${response}=    Get Customer Accounts    ${CUSTOMER_ID}
    ${accounts}=    Set Variable    ${response.json()}

    ${source_account}=         Set Variable    ${accounts[0]['id']}
    ${destination_account}=    Set Variable    ${accounts[1]['id']}

    ${destination_before}=     Set Variable    ${accounts[1]['balance']}

    ${transfer_response}=    Transfer Funds API  ${source_account}  ${destination_account}  ${TRANSFER_AMOUNT}

    ${response}=    Get Customer Accounts    ${CUSTOMER_ID}
    ${accounts}=    Set Variable    ${response.json()}

    ${destination_after}=    Set Variable    ${accounts[1]['balance']}

    ${expected}=    Evaluate  float(${destination_before}) + float(${TRANSFER_AMOUNT})

    Should Be Equal As Numbers  ${destination_after}  ${expected}
