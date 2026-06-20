*** Settings ***
Resource    ../../resources/keywords/api_keywords.robot

Suite Setup  Create Session To API

*** Test Cases ***
TC_API_05 Validate Source Account Balance After Transfer
    [Documentation]    Validate source account balance after transfer
    [Tags]    api

    ${TRANSFER_AMOUNT}=    Set Variable    10

    ${response}=    Get Customer Accounts    ${CUSTOMER_ID}
    ${accounts}=    Set Variable    ${response.json()}

    ${source_account}=    Set Variable    ${accounts[0]['id']}
    ${destination_account}=    Set Variable    ${accounts[1]['id']}

    ${source_before}=    Set Variable    ${accounts[0]['balance']}

    Log To Console    SOURCE=${source_account}
    Log To Console    DEST=${destination_account}
    Log To Console    BEFORE=${source_before}

    ${transfer_response}=    Transfer Funds API  ${source_account}  ${destination_account}  ${TRANSFER_AMOUNT}


    Log To Console    ${transfer_response.status_code}
    Log To Console    ${transfer_response.text}

    ${response}=    Get Customer Accounts    ${CUSTOMER_ID}
    ${accounts}=    Set Variable    ${response.json()}

    ${source_after}=    Set Variable    ${accounts[0]['balance']}

    Log To Console    AFTER=${source_after}

    ${expected}=    Evaluate  float(${source_before}) - float(${TRANSFER_AMOUNT})


    Log To Console    EXPECTED=${expected}

    Should Be Equal As Numbers  ${source_after}   ${expected}
