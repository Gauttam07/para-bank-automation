*** Settings ***
Resource    ../../resources/keywords/api_keywords.robot

Suite Setup  Create Session To API

*** Test Cases ***
TC_API_05 Validate Source Account Balance After Transfer
    [Documentation]    Validate source account balance after transfer
    [Tags]    api

    ${TRANSFER_AMOUNT}=    Set Variable    10

    # Step 1: Open checking and savings accounts via API
    ${source_response}=    Create Account API    ${CUSTOMER_ID}    0    ${ACCOUNT_ID}
    Should Be Equal As Integers    ${source_response.status_code}    200
    ${source_json}=    Set Variable    ${source_response.json()}
    ${source_account}=    Set Variable    ${source_json['id']}

    ${dest_response}=    Create Account API    ${CUSTOMER_ID}    1    ${ACCOUNT_ID}
    Should Be Equal As Integers    ${dest_response.status_code}    200
    ${dest_json}=    Set Variable    ${dest_response.json()}
    ${destination_account}=    Set Variable    ${dest_json['id']}

    # Step 2: Fetch details of source account before transfer
    ${response_source}=    Get Account Details    ${source_account}
    ${source_details}=    Set Variable    ${response_source.json()}
    ${source_before}=    Set Variable    ${source_details['balance']}

    Log To Console    SOURCE=${source_account}
    Log To Console    DEST=${destination_account}
    Log To Console    BEFORE=${source_before}

    # Step 3: Transfer funds
    ${transfer_response}=    Transfer Funds API  ${source_account}  ${destination_account}  ${TRANSFER_AMOUNT}


    Log To Console    ${transfer_response.status_code}
    Log To Console    ${transfer_response.text}

    # Step 4: Fetch source balance after transfer and verify
    ${response_after}=    Get Account Details    ${source_account}
    ${source_details_after}=    Set Variable    ${response_after.json()}
    ${source_after}=    Set Variable    ${source_details_after['balance']}

    Log To Console    AFTER=${source_after}

    ${expected}=    Evaluate  float(${source_before}) - float(${TRANSFER_AMOUNT})


    Log To Console    EXPECTED=${expected}

    Should Be Equal As Numbers  ${source_after}   ${expected}
