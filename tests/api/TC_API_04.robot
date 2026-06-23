*** Settings ***
Resource    ../../resources/keywords/api_keywords.robot

Suite Setup  Create Session To API

*** Test Cases ***
TC_API_04 Capture Pre-Transfer Balances
    [Documentation]  capture current balances before transfer
    [Tags]  api
    ${source_response}=    Create Account API    ${CUSTOMER_ID}    0    ${ACCOUNT_ID}
    Should Be Equal As Integers    ${source_response.status_code}    200
    ${source_json}=    Set Variable    ${source_response.json()}
    ${source_account}=    Set Variable    ${source_json['id']}

    ${dest_response}=    Create Account API    ${CUSTOMER_ID}    1    ${ACCOUNT_ID}
    Should Be Equal As Integers    ${dest_response.status_code}    200
    ${dest_json}=    Set Variable    ${dest_response.json()}
    ${destination_account}=    Set Variable    ${dest_json['id']}

    ${response_source_details}=    Get Account Details    ${source_account}
    ${source_details}=    Set Variable    ${response_source_details.json()}
    ${source_balance}=    Set Variable    ${source_details['balance']}

    ${response_dest_details}=    Get Account Details    ${destination_account}
    ${dest_details}=    Set Variable    ${response_dest_details.json()}
    ${destination_balance}=    Set Variable    ${dest_details['balance']}



    Log To Console    ${source_account}
    Log To Console    ${destination_balance}

