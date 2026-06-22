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

Login With Credentials
    [Arguments]    ${username}    ${password}
    Wait Until Element Is Visible    ${login_username}    10s
    Input Text    ${login_username}    ${username}
    Input Text    ${login_password}    ${password}
    Click Button    ${login_button}

Verify Login Error Is Shown
    Wait Until Element Is Visible    ${LOGIN_ERROR_MESSAGE}    10s
    ${msg}=    Get Text    ${LOGIN_ERROR_MESSAGE}
    Should Not Be Empty    ${msg}