*** Settings ***
Resource    ../../resources/keywords/api_keywords.robot

Suite Setup  Create Session To API

*** Test Cases ***
TC_API_06 Validate Destination Account Balance After Transfer
    [Documentation]    Validate destination account balance after transfer
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

    # Step 2: Fetch details of destination account before transfer
    ${response_dest}=    Get Account Details    ${destination_account}
    ${dest_details}=    Set Variable    ${response_dest.json()}
    ${destination_before}=    Set Variable    ${dest_details['balance']}

    # Step 3: Transfer funds
    ${transfer_response}=    Transfer Funds API  ${source_account}  ${destination_account}  ${TRANSFER_AMOUNT}

    # Step 4: Fetch destination balance after transfer and verify
    ${response_after}=    Get Account Details    ${destination_account}
    ${dest_details_after}=    Set Variable    ${response_after.json()}
    ${destination_after}=    Set Variable    ${dest_details_after['balance']}

    ${expected}=    Evaluate  float(${destination_before}) + float(${TRANSFER_AMOUNT})

    Should Be Equal As Numbers  ${destination_after}  ${expected}
