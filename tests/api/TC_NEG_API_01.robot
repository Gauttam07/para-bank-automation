*** Settings ***
Resource    ../../resources/keywords/api_keywords.robot

Suite Setup  Create Session To API

*** Test Cases ***
TC_NEG_API_06 Invalid Account ID via API
    [Documentation]    Call GET /accounts/000000 with a fake account ID — expect a 4xx response
    [Tags]    negative    API
    
    ${response}=    Get Account Details    000000    expected_status=any
    Log To Console    Response status: ${response.status_code}
    Should Not Be Equal As Integers    ${response.status_code}    200