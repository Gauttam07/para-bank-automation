*** Settings ***
Resource    ../../resources/pages/registration_pages.robot
Resource    ../../resources/keywords/common_resources.robot
Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
TC-REG-01 Register User with Valid Details
    [Documentation]    Test user registration with valid details
    [Tags]    functional
    Register User
    Page Should Contain    Welcome Harsh
    Log To Console    Successfully Registered User with Valid Details