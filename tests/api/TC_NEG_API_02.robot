*** Settings ***
Resource    ../../resources/keywords/api_keywords.robot

Suite Setup  Create Session To API

*** Test Cases ***
TC_NEG_API_07 Login API with Invalid Credentials
    [Documentation]    Call login API with wrong credentials — expect a non-200 response
    [Tags]    negative    API
    
    ${response}=    Login API    baduser_xyz    wrongpass123
    Log To Console    Response status: ${response.status_code}
    Should Not Be Equal As Integers    ${response.status_code}    200
