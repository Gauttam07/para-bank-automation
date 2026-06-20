*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary
Resource    ../../variables/negative_locators.robot

*** Keywords ***
Login With Invalid Credentials
    [Documentation]    Attempt login with a username that does not exist in the system
    Input Text    ${login_username}    invalidUser_xyz999
    Input Text    ${login_password}    wrongpassword123
    Click Element    ${login_button}

Verify Login Error Is Shown
    [Documentation]    Retry Get Text every second until the error element is populated
    Wait Until Keyword Succeeds    15s    1s    Login Error Should Have Text

Login Error Should Have Text
    ${msg}=    Get Text    ${error_message}
    Should Not Be Empty    ${msg}
    Log To Console    Login error shown: ${msg}

Submit Blank Transfer Amount
    [Documentation]    Go to transfer page and submit without entering an amount
    Click Element    ${transfer_funds_link}
    Wait Until Page Contains    Transfer Funds    10s

    Wait Until Page Contains Element    ${transfer_from_dropdown}    10s
    Wait Until Page Contains Element    ${transfer_to_dropdown}    10s

    Wait Until Keyword Succeeds    10s    1s
    ...    Verify From Dropdown Has Options

    Select From List By Index    ${transfer_from_dropdown}    0
    # index 0 for both — negative tests only care about amount validation
    Select From List By Index    ${transfer_to_dropdown}    0

    # leaving amount blank intentionally — should trigger validation error
    Click Element    ${transfer_button}

Submit Transfer With Negative Amount
    [Documentation]    Enter a negative amount and submit — app should block this (DEF-001)
    Click Element    ${transfer_funds_link}
    Wait Until Page Contains    Transfer Funds    10s

    Wait Until Page Contains Element    ${transfer_from_dropdown}    10s
    Wait Until Page Contains Element    ${transfer_to_dropdown}    10s

    Wait Until Keyword Succeeds    10s    1s
    ...    Verify From Dropdown Has Options

    Input Text    ${transfer_amount_input}    -100
    Select From List By Index    ${transfer_from_dropdown}    0
    Select From List By Index    ${transfer_to_dropdown}    0

    Click Element    ${transfer_button}
    Log To Console    Submitted transfer with negative amount -100

Submit Transfer With Amount Greater Than Balance
    [Documentation]    Enter 999999 — way more than any demo account balance (DEF-002)
    Click Element    ${transfer_funds_link}
    Wait Until Page Contains    Transfer Funds    10s

    Wait Until Page Contains Element    ${transfer_from_dropdown}    10s
    Wait Until Page Contains Element    ${transfer_to_dropdown}    10s

    Wait Until Keyword Succeeds    10s    1s
    ...    Verify From Dropdown Has Options

    Input Text    ${transfer_amount_input}    999999
    Select From List By Index    ${transfer_from_dropdown}    0
    Select From List By Index    ${transfer_to_dropdown}    0

    Click Element    ${transfer_button}
    Log To Console    Submitted transfer with amount 999999 (way above balance)

Verify Transfer Error Is Shown
    [Documentation]    Verify the transfer was rejected by checking Transfer Complete! did NOT appear.
    ...    TC-NEG-03/04 (DEF-001, DEF-002): ParaBank processes invalid transfers and shows
    ...    Transfer Complete! — so this keyword will FAIL there, correctly proving the bug.
    Sleep    2s
    Page Should Contain    Error!
    Log To Console    Transfer correctly rejected — Transfer Complete did not appear

Verify From Dropdown Has Options
    ${items}=    Get List Items    ${transfer_from_dropdown}
    Log To Console    From dropdown options: ${items}
    Should Not Be Empty    ${items}