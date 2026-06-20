*** Settings ***
Library    SeleniumLibrary
Resource    ../../variables/login_locators.robot

*** Keywords ***
Login User
    Input Text    ${login_username}    Harsh
    Input Text    ${login_password}    Gauttam
    Click Button    ${login_button}

login
    [Arguments]    ${id}    ${pwd}
    Input Text    ${login_username}    ${id}
    Sleep    1s
    Input Text    ${login_password}    ${pwd}
    Sleep    1s
    Click Button    ${login_button}
    Sleep    1s