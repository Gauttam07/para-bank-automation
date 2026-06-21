*** Settings ***
Library  SeleniumLibrary
Library  ../../config/env_loader.py
#Library  ../../env_loader
Resource    api_keywords.robot
Resource    ../pages/login.robot
Resource    ../pages/registration_pages.robot

*** Variables ***
${BROWSER}  chrome
${ENV}  qa

*** Keywords ***

Load Environment
    Load Env  ${ENV}

    ${url}=  Get Env    baseurl
#    ${api_url}=  Get Env    api_baseurl
    ${id}=  Get Env    user_id
    ${pwd}=  Get Env    user_password

    Set Global Variable  ${BASE_URL}  ${url}
#    Set Global Variable  ${API_BASE_URL}  ${api_url}
    Set Global Variable  ${USER_ID}  ${id}
    Set Global Variable  ${USER_PWD}  ${pwd}

Open Application
    [Documentation]  opens the application
    Open Browser  ${BASE_URL}  ${BROWSER}
    Maximize Browser Window

Close Application
    [Documentation]  closes the application
    Close All Browsers

Setup E2E
    Load Environment
    Create Session To API
Ensure User Is Logged In
    Login User
    ${login_success}=    Run Keyword And Return Status
    ...    Wait Until Page Contains    Accounts Overview    10s

    IF    not ${login_success}
        Go To    ${BASE_URL}
        Register User
    END

