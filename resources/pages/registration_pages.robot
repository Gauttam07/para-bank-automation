*** Settings ***
Library    SeleniumLibrary
Library    String
Resource    ../../variables/registration_variables.robot

*** Keywords ***
Register User
    ${url}=    Get Location
    Log To Console    Current URL: ${url}
    Wait Until Element Is Visible    ${REGISTER_LINK}    10s
    Click Element    ${REGISTER_LINK}

    ${rand_suffix}=    Generate Random String    6    [NUMBERS]
    ${dynamic_username}=    Set Variable    Harsh${rand_suffix}
    Set Suite Variable    ${REGISTERED_USERNAME}    ${dynamic_username}

    Input Text    ${FIRST_NAME}    King
    Input Text    ${LAST_NAME}    Smith
    Input Text    ${ADDRESS}    123 Main Street
    Input Text    ${CITY}    Ahmedabad
    Input Text    ${STATE}    Gujarat
    Input Text    ${ZIPCODE}    380001
    Input Text    ${PHONE}    9876543215
    Input Text    ${SSN}    123-45-6789
    Input Text    ${USERNAMEFIELD}    ${dynamic_username}
    Input Text    ${PASSWORDID}    Gauttam
    Input Text    ${CONFIRM_PASSWORD}    Gauttam
    Click Element    ${REGISTER_BTN}

    Wait Until Page Contains    Your account was created successfully. You are now logged in.    10s
    Log To Console    User registered successfully: ${dynamic_username}