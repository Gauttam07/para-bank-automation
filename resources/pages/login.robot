*** Settings ***
Library    SeleniumLibrary
Resource    ../../variables/login_locators.robot

*** Keywords ***
Login User
    Wait Until Element Is Visible    ${login_username}    10s
    Input Text    ${login_username}    Harsh
    Input Text    ${login_password}    Gauttam
    Click Button    ${login_button}

login
    [Arguments]    ${id}    ${pwd}
    Wait Until Element Is Visible    ${login_username}    10s
    Input Text    ${login_username}    ${id}
    Input Text    ${login_password}    ${pwd}
    Click Button    ${login_button}
    Wait Until Page Contains    Accounts Overview    10s