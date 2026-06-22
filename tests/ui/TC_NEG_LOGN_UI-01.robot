*** Settings ***
Resource    ../../resources/keywords/common_resources.robot
Resource    ../../resources/pages/login.robot

Suite Setup       Load Environment
Test Setup        Open Application
Test Teardown     Close Application

*** Test Cases ***
TC_NEG_LOGN_UI-01
    [Documentation]    Verify that logging in with a username that doesnt exist shows an error
    [Tags]    negative    UI
    Login With Credentials    invalidUser_xyz999    wrongpassword123
    Verify Login Error Is Shown
