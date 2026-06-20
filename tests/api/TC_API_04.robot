*** Settings ***
Resource    ../../resources/keywords/api_keywords.robot

Suite Setup  Create Session To API

*** Test Cases ***
TC_API_04 Capture Pre-Transfer Balances
    [Documentation]  capture current balances before transfer
    [Tags]  api

    ${response}=  Get Customer Accounts    ${CUSTOMER_ID}
    Should Be Equal As Integers    ${response.status_code}    200

    ${body}=    Set Variable    ${response.json()}

    ${source_account}=  Set Variable    ${body[0]['id']}
    ${destination_account}=  Set Variable    ${body[1]['id']}
    ${source_balance}=  Set Variable    ${body[0]['balance']}
    ${destination_balance}=  Set Variable    ${body[1]['balance']}

    Set Suite Variable    ${SOURCE_ACCOUNT}    ${source_account}
    Set Suite Variable    ${DESTINATION_ACCOUNT}    ${destination_account}
    Set Suite Variable    ${SOURCE_BALANCE}    ${source_balance}
    Set Suite Variable    ${DESTINATION_BALANCE}    ${destination_balance}

    Log To Console    ${SOURCE_BALANCE}
    Log To Console    ${DESTINATION_BALANCE}

    Set Suite Variable    ${TRANSFER_AMOUNT}    15