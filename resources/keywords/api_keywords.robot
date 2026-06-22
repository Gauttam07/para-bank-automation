*** Settings ***
Library  RequestsLibrary
Library  Collections

Resource  ../../variables/api_variables.robot
Resource  ../keywords/common_resources.robot

*** Keywords ***
Create Session To API
    Create Session  parabank  ${API_BASE_URL}

Get Customer Accounts
    [Arguments]  ${customerId}
    ${headers}=  Create Dictionary    Accept=application/json
    ${response}=    GET On Session    parabank   /customers/${customerId}/accounts  expected_status=any  headers=${headers}
    RETURN    ${response}

Get Account Details
    [Arguments]  ${accountId}    ${expected_status}=200
    ${headers}=  Create Dictionary    Accept=application/json
    ${response}=    GET On Session    parabank   /accounts/${accountId}  headers=${headers}  expected_status=${expected_status}
    RETURN    ${response}

Verify Response Code
    [Arguments]  ${response}  ${code}
    Should Be Equal As Integers    ${response.status_code}    ${code}

Verify Response not Empty
    [Arguments]  ${response}
    Should Not Be Empty    ${response.text}


Transfer Funds API
    [Arguments]    ${fromAccount}    ${toAccount}    ${amount}

    ${response}=    POST On Session
    ...    parabank
    ...    /transfer
    ...    params=fromAccountId=${fromAccount}&toAccountId=${toAccount}&amount=${amount}
    ...    expected_status=any

    RETURN    ${response}

Create Account API
    [Arguments]    ${customerId}    ${accountType}    ${fromAccountId}
    ${headers}=  Create Dictionary    Accept=application/json
    ${response}=    POST On Session
    ...    parabank
    ...    /createAccount
    ...    params=customerId=${customerId}&newAccountType=${accountType}&fromAccountId=${fromAccountId}
    ...    headers=${headers}
    ...    expected_status=any
    RETURN    ${response}

Verify Account Balance
    [Arguments]    ${accountId}    ${expectedBalance}
    ${response}=    Get Account Details    ${accountId}
    Verify Response Code    ${response}    200
    ${details}=    Set Variable    ${response.json()}
    ${balance}=    Set Variable    ${details['balance']}
    Should Be Equal As Numbers    ${balance}    ${expectedBalance}

Login API
    [Arguments]    ${username}    ${password}
    ${response}=    GET On Session    parabank    /login/${username}/${password}    expected_status=any
    RETURN    ${response}