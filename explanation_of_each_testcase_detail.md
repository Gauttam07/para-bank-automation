# ParaBank Automated Test Suite - Detailed Line-by-Line Execution Report

> **Report Goal**: This document explains every single line of code executed in each test case, making the automation workflow extremely simple and clear for developers, QA engineers, and business stakeholders alike. It also integrates information on the Page Objects and Locators files utilized in each step.

## Table of Contents
- [API Tests](#api-tests)
  - [TC_API_01 Verify Accounts](#tc-api-01-verify-accounts)
  - [TC_API_02 verify newly created account](#tc-api-02-verify-newly-created-account)
  - [TC_API_03 Validate account details](#tc-api-03-validate-account-details)
  - [TC_API_04 Capture Pre-Transfer Balances](#tc-api-04-capture-pre-transfer-balances)
  - [TC_API_05 Validate Source Account Balance After Transfer](#tc-api-05-validate-source-account-balance-after-transfer)
  - [TC_API_06 Validate Destination Account Balance After Transfer](#tc-api-06-validate-destination-account-balance-after-transfer)
  - [TC_API_04 Invalid Customer ID](#tc-api-04-invalid-customer-id)
- [UI Tests](#ui-tests)
  - [TC-AC-UI-02](#tc-ac-ui-02)
  - [TC-AC-UI-01](#tc-ac-ui-01)
  - [TC-AC-UI-03](#tc-ac-ui-03)
  - [TC-NAV-UI-01](#tc-nav-ui-01)
  - [TC-REG-01 Register User with Valid Details](#tc-reg-01-register-user-with-valid-details)
  - [TC-TF-01](#tc-tf-01)
  - [TC-TX-UI-01](#tc-tx-ui-01)
  - [TC-TX-UI-03](#tc-tx-ui-03)
  - [TC-TX-UI-04](#tc-tx-ui-04)
  - [TC-TX-UI-05](#tc-tx-ui-05)
  - [TC-TX-UI-06](#tc-tx-ui-06)
- [End-to-End (E2E) Tests](#end-to-end-e2e-tests)
  - [TC_E2E_01 Create Savings Account and Verify details via API](#tc-e2e-01-create-savings-account-and-verify-details-via-api)
  - [TC_E2E_02 Create Checking Account and Verify Customer Accounts via API](#tc-e2e-02-create-checking-account-and-verify-customer-accounts-via-api)
  - [TC_E2E_03 Transfer Funds via UI and Verify Balances via API](#tc-e2e-03-transfer-funds-via-ui-and-verify-balances-via-api)
  - [TC_E2E_04 Create New Account and Transfer Funds to It](#tc-e2e-04-create-new-account-and-transfer-funds-to-it)
- [Negative Tests](#negative-tests)
  - [TC-NEG-01 Login with Non Existent User](#tc-neg-01-login-with-non-existent-user)
  - [TC-NEG-02 Blank Transfer Amount](#tc-neg-02-blank-transfer-amount)
  - [TC-NEG-03 Transfer Negative Amount](#tc-neg-03-transfer-negative-amount)
  - [TC-NEG-04 Transfer Amount Greater Than Balance](#tc-neg-04-transfer-amount-greater-than-balance)
  - [TC-NEG-05 Invalid Account ID via API](#tc-neg-05-invalid-account-id-via-api)
  - [TC-NEG-06 Login API with Invalid Credentials](#tc-neg-06-login-api-with-invalid-credentials)

---

## API Tests

This section details all the test suites and test cases in the **API Tests** category.

### `TC_API_01 Verify Accounts`
- **Source Test File**: [api/TC_API_01.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/tests/api/TC_API_01.robot)
- **Test Suite Category**: `API Tests`
- **Objective**: Verify accounts API
- **Environment Lifecyle Configuration**:
  - **Suite Setup (Runs once per suite)**: `Create Session To API`
  - **Test Setup (Runs before this test)**: `None`
  - **Test Teardown (Runs after this test)**: `None`
- **Tags**: `api`

#### Detailed Line-by-Line Execution Walkthrough:
##### Line 1: `${response}=  Get Customer Accounts    ${CUSTOMER_ID}`
- **What this line does**: Saves the result in a variable named `${response}` after performing: Sends a GET request to the customer accounts API (`/customers/${CUSTOMER_ID}/accounts`) to fetch all associated accounts.

##### Line 2: `Should Be Equal As Integers    ${response.status_code}    200`
- **What this line does**: Asserts that the integer `${response.status_code}` is equal to the expected integer `200`.

##### Line 3: `${body}=    Set Variable    ${response.json()}`
- **What this line does**: Saves the result in a variable named `${body}` after performing: Assigns the value `${response.json()}` to the target variable.

##### Line 4: `Should Not Be Empty    ${body}`
- **What this line does**: Asserts that the variable `${body}` is not null, blank, or empty.

##### Line 5: `Log To Console    ${body}`
- **What this line does**: Prints the message or value `${body}` directly to the execution console.

##### Line 6: `Log To Console    ${response.status_code}`
- **What this line does**: Prints the message or value `${response.status_code}` directly to the execution console.

##### Line 7: `Log To Console    API_BASE_URL=${API_BASE_URL}`
- **What this line does**: Prints the message or value `API_BASE_URL=${API_BASE_URL}` directly to the execution console.


---

### `TC_API_02 verify newly created account`
- **Source Test File**: [api/TC_API_02.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/tests/api/TC_API_02.robot)
- **Test Suite Category**: `API Tests`
- **Objective**: Verify newly created account API
- **Environment Lifecyle Configuration**:
  - **Suite Setup (Runs once per suite)**: `Create Session To API`
  - **Test Setup (Runs before this test)**: `None`
  - **Test Teardown (Runs after this test)**: `None`
- **Tags**: `api`

#### Detailed Line-by-Line Execution Walkthrough:
##### Line 1: `${response}=  Get Customer Accounts    ${CUSTOMER_ID}`
- **What this line does**: Saves the result in a variable named `${response}` after performing: Sends a GET request to the customer accounts API (`/customers/${CUSTOMER_ID}/accounts`) to fetch all associated accounts.

##### Line 2: `Should Be Equal As Integers    ${response.status_code}    200`
- **What this line does**: Asserts that the integer `${response.status_code}` is equal to the expected integer `200`.

##### Line 3: `${body}=    Set Variable    ${response.json()}`
- **What this line does**: Saves the result in a variable named `${body}` after performing: Assigns the value `${response.json()}` to the target variable.

##### Line 4: `Should Not Be Empty    ${body}`
- **What this line does**: Asserts that the variable `${body}` is not null, blank, or empty.

##### Line 5: `Should Contain    ${response.text}    ${ACCOUNT_ID}`
- **What this line does**: Asserts that the text or data `${response.text}` contains the expected value `${ACCOUNT_ID}`.

##### Line 6: `Log To Console    ${body}`
- **What this line does**: Prints the message or value `${body}` directly to the execution console.

##### Line 7: `Log To Console    ${response.status_code}`
- **What this line does**: Prints the message or value `${response.status_code}` directly to the execution console.


---

### `TC_API_03 Validate account details`
- **Source Test File**: [api/TC_API_03.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/tests/api/TC_API_03.robot)
- **Test Suite Category**: `API Tests`
- **Objective**: Validate account details and response schema
- **Environment Lifecyle Configuration**:
  - **Suite Setup (Runs once per suite)**: `Create Session To API`
  - **Test Setup (Runs before this test)**: `None`
  - **Test Teardown (Runs after this test)**: `None`
- **Tags**: `api`

#### Detailed Line-by-Line Execution Walkthrough:
##### Line 1: `${response}=  Get Customer Accounts    ${CUSTOMER_ID}`
- **What this line does**: Saves the result in a variable named `${response}` after performing: Sends a GET request to the customer accounts API (`/customers/${CUSTOMER_ID}/accounts`) to fetch all associated accounts.

##### Line 2: `Should Be Equal As Integers    ${response.status_code}    200`
- **What this line does**: Asserts that the integer `${response.status_code}` is equal to the expected integer `200`.

##### Line 3: `${body}=    Set Variable    ${response.json()}`
- **What this line does**: Saves the result in a variable named `${body}` after performing: Assigns the value `${response.json()}` to the target variable.

##### Line 4: `Should Not Be Empty    ${body}`
- **What this line does**: Asserts that the variable `${body}` is not null, blank, or empty.

##### Line 5: `${account}=  Set Variable    ${body[0]}`
- **What this line does**: Saves the result in a variable named `${account}` after performing: Assigns the value `${body[0]}` to the target variable.

##### Line 6: `Dictionary Should Contain Key    ${account}    id`
- **What this line does**: Validates that the dictionary `${account}` contains the key named 'id'.

##### Line 7: `Dictionary Should Contain Key    ${account}    customerId`
- **What this line does**: Validates that the dictionary `${account}` contains the key named 'customerId'.

##### Line 8: `Dictionary Should Contain Key    ${account}    balance`
- **What this line does**: Validates that the dictionary `${account}` contains the key named 'balance'.

##### Line 9: `Dictionary Should Contain Key    ${account}    type`
- **What this line does**: Validates that the dictionary `${account}` contains the key named 'type'.

##### Line 10: `Log To Console    ${account}`
- **What this line does**: Prints the message or value `${account}` directly to the execution console.


---

### `TC_API_04 Capture Pre-Transfer Balances`
- **Source Test File**: [api/TC_API_04.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/tests/api/TC_API_04.robot)
- **Test Suite Category**: `API Tests`
- **Objective**: capture current balances before transfer
- **Environment Lifecyle Configuration**:
  - **Suite Setup (Runs once per suite)**: `Create Session To API`
  - **Test Setup (Runs before this test)**: `None`
  - **Test Teardown (Runs after this test)**: `None`
- **Tags**: `api`

#### Detailed Line-by-Line Execution Walkthrough:
##### Line 1: `# Step 1: Open a Checking Account via API`
- **What this line does**: **Comment**: "Step 1: Open a Checking Account via API" (This is a note in the code for developers, not an action).

##### Line 2: `${source_response}=    Create Account API    ${CUSTOMER_ID}    0    ${ACCOUNT_ID}`
- **What this line does**: Saves the result in a variable named `${source_response}` after performing: Sends a POST request to open a new **Checking (Type 0)** account funded by account `${ACCOUNT_ID}` for customer `${CUSTOMER_ID}`.

##### Line 3: `Should Be Equal As Integers    ${source_response.status_code}    200`
- **What this line does**: Asserts that the integer `${source_response.status_code}` is equal to the expected integer `200`.

##### Line 4: `${source_json}=    Set Variable    ${source_response.json()}`
- **What this line does**: Saves the result in a variable named `${source_json}` after performing: Assigns the value `${source_response.json()}` to the target variable.

##### Line 5: `${source_account}=    Set Variable    ${source_json['id']}`
- **What this line does**: Saves the result in a variable named `${source_account}` after performing: Assigns the value `${source_json['id']}` to the target variable.

##### Line 6: `# Step 2: Open a Savings Account via API`
- **What this line does**: **Comment**: "Step 2: Open a Savings Account via API" (This is a note in the code for developers, not an action).

##### Line 7: `${dest_response}=    Create Account API    ${CUSTOMER_ID}    1    ${ACCOUNT_ID}`
- **What this line does**: Saves the result in a variable named `${dest_response}` after performing: Sends a POST request to open a new **Savings (Type 1)** account funded by account `${ACCOUNT_ID}` for customer `${CUSTOMER_ID}`.

##### Line 8: `Should Be Equal As Integers    ${dest_response.status_code}    200`
- **What this line does**: Asserts that the integer `${dest_response.status_code}` is equal to the expected integer `200`.

##### Line 9: `${dest_json}=    Set Variable    ${dest_response.json()}`
- **What this line does**: Saves the result in a variable named `${dest_json}` after performing: Assigns the value `${dest_response.json()}` to the target variable.

##### Line 10: `${destination_account}=    Set Variable    ${dest_json['id']}`
- **What this line does**: Saves the result in a variable named `${destination_account}` after performing: Assigns the value `${dest_json['id']}` to the target variable.

##### Line 11: `# Step 3: Fetch starting balances`
- **What this line does**: **Comment**: "Step 3: Fetch starting balances" (This is a note in the code for developers, not an action).

##### Line 12: `${response_source_details}=    Get Account Details    ${source_account}`
- **What this line does**: Saves the result in a variable named `${response_source_details}` after performing: Sends a GET request to the accounts API (`/accounts/${source_account}`) to retrieve database details.

##### Line 13: `${source_details}=    Set Variable    ${response_source_details.json()}`
- **What this line does**: Saves the result in a variable named `${source_details}` after performing: Assigns the value `${response_source_details.json()}` to the target variable.

##### Line 14: `${source_balance}=    Set Variable    ${source_details['balance']}`
- **What this line does**: Saves the result in a variable named `${source_balance}` after performing: Assigns the value `${source_details['balance']}` to the target variable.

##### Line 15: `${response_dest_details}=    Get Account Details    ${destination_account}`
- **What this line does**: Saves the result in a variable named `${response_dest_details}` after performing: Sends a GET request to the accounts API (`/accounts/${destination_account}`) to retrieve database details.

##### Line 16: `${dest_details}=    Set Variable    ${response_dest_details.json()}`
- **What this line does**: Saves the result in a variable named `${dest_details}` after performing: Assigns the value `${response_dest_details.json()}` to the target variable.

##### Line 17: `${destination_balance}=    Set Variable    ${dest_details['balance']}`
- **What this line does**: Saves the result in a variable named `${destination_balance}` after performing: Assigns the value `${dest_details['balance']}` to the target variable.

##### Line 18: `Set Suite Variable    ${SOURCE_ACCOUNT}    ${source_account}`
- **What this line does**: Registers the variable `${SOURCE_ACCOUNT}` with the value `${source_account}` at the suite scope, making it available to all test cases in this file.

##### Line 19: `Set Suite Variable    ${DESTINATION_ACCOUNT}    ${destination_account}`
- **What this line does**: Registers the variable `${DESTINATION_ACCOUNT}` with the value `${destination_account}` at the suite scope, making it available to all test cases in this file.

##### Line 20: `Set Suite Variable    ${SOURCE_BALANCE}    ${source_balance}`
- **What this line does**: Registers the variable `${SOURCE_BALANCE}` with the value `${source_balance}` at the suite scope, making it available to all test cases in this file.

##### Line 21: `Set Suite Variable    ${DESTINATION_BALANCE}    ${destination_balance}`
- **What this line does**: Registers the variable `${DESTINATION_BALANCE}` with the value `${destination_balance}` at the suite scope, making it available to all test cases in this file.

##### Line 22: `Log To Console    ${SOURCE_BALANCE}`
- **What this line does**: Prints the message or value `${SOURCE_BALANCE}` directly to the execution console.

##### Line 23: `Log To Console    ${DESTINATION_BALANCE}`
- **What this line does**: Prints the message or value `${DESTINATION_BALANCE}` directly to the execution console.

##### Line 24: `Set Suite Variable    ${TRANSFER_AMOUNT}    15`
- **What this line does**: Registers the variable `${TRANSFER_AMOUNT}` with the value `15` at the suite scope, making it available to all test cases in this file.


---

### `TC_API_05 Validate Source Account Balance After Transfer`
- **Source Test File**: [api/TC_API_05.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/tests/api/TC_API_05.robot)
- **Test Suite Category**: `API Tests`
- **Objective**: Validate source account balance after transfer
- **Environment Lifecyle Configuration**:
  - **Suite Setup (Runs once per suite)**: `Create Session To API`
  - **Test Setup (Runs before this test)**: `None`
  - **Test Teardown (Runs after this test)**: `None`
- **Tags**: `api`

#### Detailed Line-by-Line Execution Walkthrough:
##### Line 1: `${TRANSFER_AMOUNT}=    Set Variable    10`
- **What this line does**: Saves the result in a variable named `${TRANSFER_AMOUNT}` after performing: Assigns the value `10` to the target variable.

##### Line 2: `# Step 1: Open checking and savings accounts via API`
- **What this line does**: **Comment**: "Step 1: Open checking and savings accounts via API" (This is a note in the code for developers, not an action).

##### Line 3: `${source_response}=    Create Account API    ${CUSTOMER_ID}    0    ${ACCOUNT_ID}`
- **What this line does**: Saves the result in a variable named `${source_response}` after performing: Sends a POST request to open a new **Checking (Type 0)** account funded by account `${ACCOUNT_ID}` for customer `${CUSTOMER_ID}`.

##### Line 4: `Should Be Equal As Integers    ${source_response.status_code}    200`
- **What this line does**: Asserts that the integer `${source_response.status_code}` is equal to the expected integer `200`.

##### Line 5: `${source_json}=    Set Variable    ${source_response.json()}`
- **What this line does**: Saves the result in a variable named `${source_json}` after performing: Assigns the value `${source_response.json()}` to the target variable.

##### Line 6: `${source_account}=    Set Variable    ${source_json['id']}`
- **What this line does**: Saves the result in a variable named `${source_account}` after performing: Assigns the value `${source_json['id']}` to the target variable.

##### Line 7: `${dest_response}=    Create Account API    ${CUSTOMER_ID}    1    ${ACCOUNT_ID}`
- **What this line does**: Saves the result in a variable named `${dest_response}` after performing: Sends a POST request to open a new **Savings (Type 1)** account funded by account `${ACCOUNT_ID}` for customer `${CUSTOMER_ID}`.

##### Line 8: `Should Be Equal As Integers    ${dest_response.status_code}    200`
- **What this line does**: Asserts that the integer `${dest_response.status_code}` is equal to the expected integer `200`.

##### Line 9: `${dest_json}=    Set Variable    ${dest_response.json()}`
- **What this line does**: Saves the result in a variable named `${dest_json}` after performing: Assigns the value `${dest_response.json()}` to the target variable.

##### Line 10: `${destination_account}=    Set Variable    ${dest_json['id']}`
- **What this line does**: Saves the result in a variable named `${destination_account}` after performing: Assigns the value `${dest_json['id']}` to the target variable.

##### Line 11: `# Step 2: Fetch details of source account before transfer`
- **What this line does**: **Comment**: "Step 2: Fetch details of source account before transfer" (This is a note in the code for developers, not an action).

##### Line 12: `${response_source}=    Get Account Details    ${source_account}`
- **What this line does**: Saves the result in a variable named `${response_source}` after performing: Sends a GET request to the accounts API (`/accounts/${source_account}`) to retrieve database details.

##### Line 13: `${source_details}=    Set Variable    ${response_source.json()}`
- **What this line does**: Saves the result in a variable named `${source_details}` after performing: Assigns the value `${response_source.json()}` to the target variable.

##### Line 14: `${source_before}=    Set Variable    ${source_details['balance']}`
- **What this line does**: Saves the result in a variable named `${source_before}` after performing: Assigns the value `${source_details['balance']}` to the target variable.

##### Line 15: `Log To Console    SOURCE=${source_account}`
- **What this line does**: Prints the message or value `SOURCE=${source_account}` directly to the execution console.

##### Line 16: `Log To Console    DEST=${destination_account}`
- **What this line does**: Prints the message or value `DEST=${destination_account}` directly to the execution console.

##### Line 17: `Log To Console    BEFORE=${source_before}`
- **What this line does**: Prints the message or value `BEFORE=${source_before}` directly to the execution console.

##### Line 18: `# Step 3: Transfer funds`
- **What this line does**: **Comment**: "Step 3: Transfer funds" (This is a note in the code for developers, not an action).

##### Line 19: `${transfer_response}=    Transfer Funds API  ${source_account}  ${destination_account}  ${TRANSFER_AMOUNT}`
- **What this line does**: Saves the result in a variable named `${transfer_response}` after performing: Sends a POST request to the transfer API endpoint to move `$${TRANSFER_AMOUNT}` from account `${source_account}` to account `${destination_account}`.

##### Line 20: `Log To Console    ${transfer_response.status_code}`
- **What this line does**: Prints the message or value `${transfer_response.status_code}` directly to the execution console.

##### Line 21: `Log To Console    ${transfer_response.text}`
- **What this line does**: Prints the message or value `${transfer_response.text}` directly to the execution console.

##### Line 22: `# Step 4: Fetch source balance after transfer and verify`
- **What this line does**: **Comment**: "Step 4: Fetch source balance after transfer and verify" (This is a note in the code for developers, not an action).

##### Line 23: `${response_after}=    Get Account Details    ${source_account}`
- **What this line does**: Saves the result in a variable named `${response_after}` after performing: Sends a GET request to the accounts API (`/accounts/${source_account}`) to retrieve database details.

##### Line 24: `${source_details_after}=    Set Variable    ${response_after.json()}`
- **What this line does**: Saves the result in a variable named `${source_details_after}` after performing: Assigns the value `${response_after.json()}` to the target variable.

##### Line 25: `${source_after}=    Set Variable    ${source_details_after['balance']}`
- **What this line does**: Saves the result in a variable named `${source_after}` after performing: Assigns the value `${source_details_after['balance']}` to the target variable.

##### Line 26: `Log To Console    AFTER=${source_after}`
- **What this line does**: Prints the message or value `AFTER=${source_after}` directly to the execution console.

##### Line 27: `${expected}=    Evaluate  float(${source_before}) - float(${TRANSFER_AMOUNT})`
- **What this line does**: Saves the result in a variable named `${expected}` after performing: Evaluates the Python mathematical expression `float(${source_before}) - float(${TRANSFER_AMOUNT})` and calculates the result.

##### Line 28: `Log To Console    EXPECTED=${expected}`
- **What this line does**: Prints the message or value `EXPECTED=${expected}` directly to the execution console.

##### Line 29: `Should Be Equal As Numbers  ${source_after}   ${expected}`
- **What this line does**: Asserts that the numeric value `${source_after}` is equal to the expected value `${expected}`.


---

### `TC_API_06 Validate Destination Account Balance After Transfer`
- **Source Test File**: [api/TC_API_06.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/tests/api/TC_API_06.robot)
- **Test Suite Category**: `API Tests`
- **Objective**: Validate destination account balance after transfer
- **Environment Lifecyle Configuration**:
  - **Suite Setup (Runs once per suite)**: `Create Session To API`
  - **Test Setup (Runs before this test)**: `None`
  - **Test Teardown (Runs after this test)**: `None`
- **Tags**: `api`

#### Detailed Line-by-Line Execution Walkthrough:
##### Line 1: `${TRANSFER_AMOUNT}=    Set Variable    10`
- **What this line does**: Saves the result in a variable named `${TRANSFER_AMOUNT}` after performing: Assigns the value `10` to the target variable.

##### Line 2: `# Step 1: Open checking and savings accounts via API`
- **What this line does**: **Comment**: "Step 1: Open checking and savings accounts via API" (This is a note in the code for developers, not an action).

##### Line 3: `${source_response}=    Create Account API    ${CUSTOMER_ID}    0    ${ACCOUNT_ID}`
- **What this line does**: Saves the result in a variable named `${source_response}` after performing: Sends a POST request to open a new **Checking (Type 0)** account funded by account `${ACCOUNT_ID}` for customer `${CUSTOMER_ID}`.

##### Line 4: `Should Be Equal As Integers    ${source_response.status_code}    200`
- **What this line does**: Asserts that the integer `${source_response.status_code}` is equal to the expected integer `200`.

##### Line 5: `${source_json}=    Set Variable    ${source_response.json()}`
- **What this line does**: Saves the result in a variable named `${source_json}` after performing: Assigns the value `${source_response.json()}` to the target variable.

##### Line 6: `${source_account}=    Set Variable    ${source_json['id']}`
- **What this line does**: Saves the result in a variable named `${source_account}` after performing: Assigns the value `${source_json['id']}` to the target variable.

##### Line 7: `${dest_response}=    Create Account API    ${CUSTOMER_ID}    1    ${ACCOUNT_ID}`
- **What this line does**: Saves the result in a variable named `${dest_response}` after performing: Sends a POST request to open a new **Savings (Type 1)** account funded by account `${ACCOUNT_ID}` for customer `${CUSTOMER_ID}`.

##### Line 8: `Should Be Equal As Integers    ${dest_response.status_code}    200`
- **What this line does**: Asserts that the integer `${dest_response.status_code}` is equal to the expected integer `200`.

##### Line 9: `${dest_json}=    Set Variable    ${dest_response.json()}`
- **What this line does**: Saves the result in a variable named `${dest_json}` after performing: Assigns the value `${dest_response.json()}` to the target variable.

##### Line 10: `${destination_account}=    Set Variable    ${dest_json['id']}`
- **What this line does**: Saves the result in a variable named `${destination_account}` after performing: Assigns the value `${dest_json['id']}` to the target variable.

##### Line 11: `# Step 2: Fetch details of destination account before transfer`
- **What this line does**: **Comment**: "Step 2: Fetch details of destination account before transfer" (This is a note in the code for developers, not an action).

##### Line 12: `${response_dest}=    Get Account Details    ${destination_account}`
- **What this line does**: Saves the result in a variable named `${response_dest}` after performing: Sends a GET request to the accounts API (`/accounts/${destination_account}`) to retrieve database details.

##### Line 13: `${dest_details}=    Set Variable    ${response_dest.json()}`
- **What this line does**: Saves the result in a variable named `${dest_details}` after performing: Assigns the value `${response_dest.json()}` to the target variable.

##### Line 14: `${destination_before}=    Set Variable    ${dest_details['balance']}`
- **What this line does**: Saves the result in a variable named `${destination_before}` after performing: Assigns the value `${dest_details['balance']}` to the target variable.

##### Line 15: `# Step 3: Transfer funds`
- **What this line does**: **Comment**: "Step 3: Transfer funds" (This is a note in the code for developers, not an action).

##### Line 16: `${transfer_response}=    Transfer Funds API  ${source_account}  ${destination_account}  ${TRANSFER_AMOUNT}`
- **What this line does**: Saves the result in a variable named `${transfer_response}` after performing: Sends a POST request to the transfer API endpoint to move `$${TRANSFER_AMOUNT}` from account `${source_account}` to account `${destination_account}`.

##### Line 17: `# Step 4: Fetch destination balance after transfer and verify`
- **What this line does**: **Comment**: "Step 4: Fetch destination balance after transfer and verify" (This is a note in the code for developers, not an action).

##### Line 18: `${response_after}=    Get Account Details    ${destination_account}`
- **What this line does**: Saves the result in a variable named `${response_after}` after performing: Sends a GET request to the accounts API (`/accounts/${destination_account}`) to retrieve database details.

##### Line 19: `${dest_details_after}=    Set Variable    ${response_after.json()}`
- **What this line does**: Saves the result in a variable named `${dest_details_after}` after performing: Assigns the value `${response_after.json()}` to the target variable.

##### Line 20: `${destination_after}=    Set Variable    ${dest_details_after['balance']}`
- **What this line does**: Saves the result in a variable named `${destination_after}` after performing: Assigns the value `${dest_details_after['balance']}` to the target variable.

##### Line 21: `${expected}=    Evaluate  float(${destination_before}) + float(${TRANSFER_AMOUNT})`
- **What this line does**: Saves the result in a variable named `${expected}` after performing: Evaluates the Python mathematical expression `float(${destination_before}) + float(${TRANSFER_AMOUNT})` and calculates the result.

##### Line 22: `Should Be Equal As Numbers  ${destination_after}  ${expected}`
- **What this line does**: Asserts that the numeric value `${destination_after}` is equal to the expected value `${expected}`.


---

### `TC_API_04 Invalid Customer ID`
- **Source Test File**: [api/TC_API_07.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/tests/api/TC_API_07.robot)
- **Test Suite Category**: `API Tests`
- **Objective**: Verify accounts API with invalid customer ID
- **Environment Lifecyle Configuration**:
  - **Suite Setup (Runs once per suite)**: `Create Session To API`
  - **Test Setup (Runs before this test)**: `None`
  - **Test Teardown (Runs after this test)**: `None`
- **Tags**: `api negative`

#### Detailed Line-by-Line Execution Walkthrough:
##### Line 1: `${response}=  Get Customer Accounts    ${INVALID_ID}`
- **What this line does**: Saves the result in a variable named `${response}` after performing: Sends a GET request to the customer accounts API (`/customers/${INVALID_ID}/accounts`) to fetch all associated accounts.

##### Line 2: `Should Be Equal As Integers    ${response.status_code}    400`
- **What this line does**: Asserts that the integer `${response.status_code}` is equal to the expected integer `400`.

##### Line 3: `Log To Console    ${response.text}`
- **What this line does**: Prints the message or value `${response.text}` directly to the execution console.

##### Line 4: `Log To Console    ${response.status_code}`
- **What this line does**: Prints the message or value `${response.status_code}` directly to the execution console.


---

## UI Tests

This section details all the test suites and test cases in the **UI Tests** category.

### `TC-AC-UI-02`
- **Source Test File**: [ui/TC-AC-UI-01.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/tests/ui/TC-AC-UI-01.robot)
- **Test Suite Category**: `UI Tests`
- **Objective**: Create New Account with Valid Data
- **Environment Lifecyle Configuration**:
  - **Suite Setup (Runs once per suite)**: `Load Environment`
  - **Test Setup (Runs before this test)**: `Open Application`
  - **Test Teardown (Runs after this test)**: `Close Application`
- **Tags**: *None*

#### 🗂️ Page Objects & Locators Integrated Usage:
- **Page Object File**: [login.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/resources/pages/login.robot)
  - Locators imported from: [variables/login_locators.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/variables/login_locators.robot)
    - `${login_username}` ➡️ `xpath=//input[@name="username"]`
    - `${login_password}` ➡️ `xpath=//input[@name="password"]`
    - `${login_button}` ➡️ `xpath=//input[@value="Log In"]`
- **Page Object File**: [home_page.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/resources/pages/home_page.robot)
  - Locators imported from: [variables/home_variables.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/variables/home_variables.robot)
    - `${OPEN_NEW_ACCOUNT_URL}` ➡️ `xpath=//a[contains(@href,'openaccount.htm')]`
- **Page Object File**: [open_new_account_page.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/resources/pages/open_new_account_page.robot)
  - Locators imported from: [variables/open_new_account_variables.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/variables/open_new_account_variables.robot)
    - `${ACCOUNT_TYPE_DROPDOWN}` ➡️ `xpath=//select[@id="type"]`
    - `${ACCOUNT_ID_DROPDOWN}` ➡️ `xpath=//select[@id="fromAccountId"]`
    - `${OPEN_ACCOUNT_BUTTON}` ➡️ `xpath=//input[@value="Open New Account"]`

#### Detailed Line-by-Line Execution Walkthrough:
##### Line 1: `login    ${USER_ID}    ${USER_PWD}`
- **What this line does**: Logs in to the ParaBank web interface using username `${USER_ID}` and password `${USER_PWD}`.

##### Line 2: `Click Open New Account`
- **What this line does**: Clicks on the side menu option labeled 'Open New Account'.

##### Line 3: `Wait Until Location Contains    openaccount    10s`
- **What this line does**: Waits for up to 10s until the browser's current URL contains the word 'openaccount'.

##### Line 4: `Log To Console    Open_Account`
- **What this line does**: Prints the message or value `Open_Account` directly to the execution console.

##### Line 5: `Select Account Type    0`
- **What this line does**: Selects the account type as **Checking (Type 0)** from the dropdown menu.

##### Line 6: `Select Funding Account ID    13344`
- **What this line does**: Selects the account ID `13344` from the dropdown to fund this new account.

##### Line 7: `Click Open Account Button`
- **What this line does**: Clicks the button to submit and open the new account.

##### Line 8: `Page Should Contain    Account Opened!`
- **What this line does**: Asserts (verifies) that the text 'Account Opened!' is visible on the current webpage.

##### Line 9: `Page Should Contain    Your new account number`
- **What this line does**: Asserts (verifies) that the text 'Your new account number' is visible on the current webpage.

##### Line 10: `Log To Console    Account Opened Successfully`
- **What this line does**: Prints the message or value `Account Opened Successfully` directly to the execution console.


---

### `TC-AC-UI-01`
- **Source Test File**: [ui/TC-AC-UI-02.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/tests/ui/TC-AC-UI-02.robot)
- **Test Suite Category**: `UI Tests`
- **Objective**: Create Savings Account
- **Environment Lifecyle Configuration**:
  - **Suite Setup (Runs once per suite)**: `Load Environment`
  - **Test Setup (Runs before this test)**: `Open Application`
  - **Test Teardown (Runs after this test)**: `Close Application`
- **Tags**: *None*

#### 🗂️ Page Objects & Locators Integrated Usage:
- **Page Object File**: [login.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/resources/pages/login.robot)
  - Locators imported from: [variables/login_locators.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/variables/login_locators.robot)
    - `${login_username}` ➡️ `xpath=//input[@name="username"]`
    - `${login_password}` ➡️ `xpath=//input[@name="password"]`
    - `${login_button}` ➡️ `xpath=//input[@value="Log In"]`
- **Page Object File**: [home_page.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/resources/pages/home_page.robot)
  - Locators imported from: [variables/home_variables.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/variables/home_variables.robot)
    - `${OPEN_NEW_ACCOUNT_URL}` ➡️ `xpath=//a[contains(@href,'openaccount.htm')]`
- **Page Object File**: [open_new_account_page.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/resources/pages/open_new_account_page.robot)
  - Locators imported from: [variables/open_new_account_variables.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/variables/open_new_account_variables.robot)
    - `${ACCOUNT_TYPE_DROPDOWN}` ➡️ `xpath=//select[@id="type"]`
    - `${ACCOUNT_ID_DROPDOWN}` ➡️ `xpath=//select[@id="fromAccountId"]`
    - `${OPEN_ACCOUNT_BUTTON}` ➡️ `xpath=//input[@value="Open New Account"]`

#### Detailed Line-by-Line Execution Walkthrough:
##### Line 1: `login    ${USER_ID}    ${USER_PWD}`
- **What this line does**: Logs in to the ParaBank web interface using username `${USER_ID}` and password `${USER_PWD}`.

##### Line 2: `Click Open New Account`
- **What this line does**: Clicks on the side menu option labeled 'Open New Account'.

##### Line 3: `Wait Until Location Contains    openaccount    10s`
- **What this line does**: Waits for up to 10s until the browser's current URL contains the word 'openaccount'.

##### Line 4: `Select Account Type    1`
- **What this line does**: Selects the account type as **Savings (Type 1)** from the dropdown menu.

##### Line 5: `Select Funding Account ID    13344`
- **What this line does**: Selects the account ID `13344` from the dropdown to fund this new account.

##### Line 6: `Click Open Account Button`
- **What this line does**: Clicks the button to submit and open the new account.

##### Line 7: `Page Should Contain    Account Opened!`
- **What this line does**: Asserts (verifies) that the text 'Account Opened!' is visible on the current webpage.

##### Line 8: `Page Should Contain    Your new account number`
- **What this line does**: Asserts (verifies) that the text 'Your new account number' is visible on the current webpage.

##### Line 9: `Log To Console    Saving account created successfully`
- **What this line does**: Prints the message or value `Saving account created successfully` directly to the execution console.


---

### `TC-AC-UI-03`
- **Source Test File**: [ui/TC-AC-UI-03.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/tests/ui/TC-AC-UI-03.robot)
- **Test Suite Category**: `UI Tests`
- **Objective**: Create Multiple Accounts for Same User
- **Environment Lifecyle Configuration**:
  - **Suite Setup (Runs once per suite)**: `Load Environment`
  - **Test Setup (Runs before this test)**: `Open Application`
  - **Test Teardown (Runs after this test)**: `Close Application`
- **Tags**: *None*

#### 🗂️ Page Objects & Locators Integrated Usage:
- **Page Object File**: [login.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/resources/pages/login.robot)
  - Locators imported from: [variables/login_locators.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/variables/login_locators.robot)
    - `${login_username}` ➡️ `xpath=//input[@name="username"]`
    - `${login_password}` ➡️ `xpath=//input[@name="password"]`
    - `${login_button}` ➡️ `xpath=//input[@value="Log In"]`
- **Page Object File**: [home_page.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/resources/pages/home_page.robot)
  - Locators imported from: [variables/home_variables.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/variables/home_variables.robot)
    - `${OPEN_NEW_ACCOUNT_URL}` ➡️ `xpath=//a[contains(@href,'openaccount.htm')]`
- **Page Object File**: [open_new_account_page.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/resources/pages/open_new_account_page.robot)
  - Locators imported from: [variables/open_new_account_variables.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/variables/open_new_account_variables.robot)
    - `${ACCOUNT_TYPE_DROPDOWN}` ➡️ `xpath=//select[@id="type"]`
    - `${ACCOUNT_ID_DROPDOWN}` ➡️ `xpath=//select[@id="fromAccountId"]`
    - `${OPEN_ACCOUNT_BUTTON}` ➡️ `xpath=//input[@value="Open New Account"]`
    - `${ACCOUNTS_OVERVIEW}` ➡️ `xpath=//a[text()="Accounts Overview"]`

#### Detailed Line-by-Line Execution Walkthrough:
##### Line 1: `login    ${USER_ID}    ${USER_PWD}`
- **What this line does**: Logs in to the ParaBank web interface using username `${USER_ID}` and password `${USER_PWD}`.

##### Line 2: `Click Open New Account`
- **What this line does**: Clicks on the side menu option labeled 'Open New Account'.

##### Line 3: `Wait Until Location Contains    openaccount    10s`
- **What this line does**: Waits for up to 10s until the browser's current URL contains the word 'openaccount'.

##### Line 4: `Select Account Type    1`
- **What this line does**: Selects the account type as **Savings (Type 1)** from the dropdown menu.

##### Line 5: `Select Funding Account ID    13344`
- **What this line does**: Selects the account ID `13344` from the dropdown to fund this new account.

##### Line 6: `Click Open Account Button`
- **What this line does**: Clicks the button to submit and open the new account.

##### Line 7: `Page Should Contain    Account Opened!`
- **What this line does**: Asserts (verifies) that the text 'Account Opened!' is visible on the current webpage.

##### Line 8: `Page Should Contain    Your new account number`
- **What this line does**: Asserts (verifies) that the text 'Your new account number' is visible on the current webpage.

##### Line 9: `Log To Console    Saving account created successfully`
- **What this line does**: Prints the message or value `Saving account created successfully` directly to the execution console.

##### Line 10: `Click Open New Account`
- **What this line does**: Clicks on the side menu option labeled 'Open New Account'.

##### Line 11: `Wait Until Location Contains    openaccount    10s`
- **What this line does**: Waits for up to 10s until the browser's current URL contains the word 'openaccount'.

##### Line 12: `Log To Console    Open_Account`
- **What this line does**: Prints the message or value `Open_Account` directly to the execution console.

##### Line 13: `Select Account Type    0`
- **What this line does**: Selects the account type as **Checking (Type 0)** from the dropdown menu.

##### Line 14: `Select Funding Account ID    13344`
- **What this line does**: Selects the account ID `13344` from the dropdown to fund this new account.

##### Line 15: `Click Open Account Button`
- **What this line does**: Clicks the button to submit and open the new account.

##### Line 16: `Page Should Contain    Account Opened!`
- **What this line does**: Asserts (verifies) that the text 'Account Opened!' is visible on the current webpage.

##### Line 17: `Page Should Contain    Your new account number`
- **What this line does**: Asserts (verifies) that the text 'Your new account number' is visible on the current webpage.

##### Line 18: `Log To Console   Checking Account Opened Successfully`
- **What this line does**: Prints the message or value `Checking Account Opened Successfully` directly to the execution console.

##### Line 19: `Click Accounts Overview Link`
- **What this line does**: Clicks on the side menu link labeled 'Accounts Overview' to view all accounts.


---

### `TC-NAV-UI-01`
- **Source Test File**: [ui/TC-NAV-UI-01.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/tests/ui/TC-NAV-UI-01.robot)
- **Test Suite Category**: `UI Tests`
- **Objective**: Verify Navigation Flow and Menu Link Integrity
- **Environment Lifecyle Configuration**:
  - **Suite Setup (Runs once per suite)**: `Load Environment`
  - **Test Setup (Runs before this test)**: `Open Application`
  - **Test Teardown (Runs after this test)**: `Close Application`
- **Tags**: *None*

#### 🗂️ Page Objects & Locators Integrated Usage:
- **Page Object File**: [login.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/resources/pages/login.robot)
  - Locators imported from: [variables/login_locators.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/variables/login_locators.robot)
    - `${login_username}` ➡️ `xpath=//input[@name="username"]`
    - `${login_password}` ➡️ `xpath=//input[@name="password"]`
    - `${login_button}` ➡️ `xpath=//input[@value="Log In"]`
- **Page Object File**: [home_page.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/resources/pages/home_page.robot)
  - Locators imported from: [variables/home_variables.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/variables/home_variables.robot)
    - `${OPEN_NEW_ACCOUNT_URL}` ➡️ `xpath=//a[contains(@href,'openaccount.htm')]`
    - `${TRANSFER_FUNDS_URL}` ➡️ `xpath=//a[contains(@href,'transfer.htm')]`

#### Detailed Line-by-Line Execution Walkthrough:
##### Line 1: `login    ${USER_ID}    ${USER_PWD}`
- **What this line does**: Logs in to the ParaBank web interface using username `${USER_ID}` and password `${USER_PWD}`.

##### Line 2: `Click Open New Account`
- **What this line does**: Clicks on the side menu option labeled 'Open New Account'.

##### Line 3: `Wait Until Location Contains    openaccount    10s`
- **What this line does**: Waits for up to 10s until the browser's current URL contains the word 'openaccount'.

##### Line 4: `Click Transfer Funds`
- **What this line does**: Clicks on the side menu option labeled 'Transfer Funds'.

##### Line 5: `Wait Until Location Contains    transfer    10s`
- **What this line does**: Waits for up to 10s until the browser's current URL contains the word 'transfer'.


---

### `TC-REG-01 Register User with Valid Details`
- **Source Test File**: [ui/TC-REG-UI-01.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/tests/ui/TC-REG-UI-01.robot)
- **Test Suite Category**: `UI Tests`
- **Objective**: Test user registration with valid details
- **Environment Lifecyle Configuration**:
  - **Suite Setup (Runs once per suite)**: `Load Environment`
  - **Test Setup (Runs before this test)**: `Open Application`
  - **Test Teardown (Runs after this test)**: `Close Application`
- **Tags**: `functional`

#### 🗂️ Page Objects & Locators Integrated Usage:
- **Page Object File**: [registration_pages.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/resources/pages/registration_pages.robot)
  - Locators imported from: [variables/registration_variables.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/variables/registration_variables.robot)
    - `${REGISTER_LINK}` ➡️ `xpath=//a[contains(@href,'register.htm')]`
    - `${FIRST_NAME}` ➡️ `id=customer.firstName`
    - `${LAST_NAME}` ➡️ `id=customer.lastName`
    - `${ADDRESS}` ➡️ `id=customer.address.street`
    - `${CITY}` ➡️ `id=customer.address.city`
    - `${STATE}` ➡️ `id=customer.address.state`
    - `${ZIPCODE}` ➡️ `id=customer.address.zipCode`
    - `${PHONE}` ➡️ `id=customer.phoneNumber`
    - `${SSN}` ➡️ `id=customer.ssn`
    - `${USERNAMEFIELD}` ➡️ `id=customer.username`
    - `${PASSWORDID}` ➡️ `id=customer.password`
    - `${CONFIRM_PASSWORD}` ➡️ `id=repeatedPassword`
    - `${REGISTER_BTN}` ➡️ `xpath=//input[@value="Register"]`

#### Detailed Line-by-Line Execution Walkthrough:
##### Line 1: `Register User`
- **What this line does**: Runs a automated UI workflow keyword to fill in registration details and create a new user profile.

##### Line 2: `Page Should Contain    Welcome ${REGISTERED_USERNAME}`
- **What this line does**: Asserts (verifies) that the text 'Welcome ${REGISTERED_USERNAME}' is visible on the current webpage.

##### Line 3: `Log To Console    Successfully Registered User with Valid Details`
- **What this line does**: Prints the message or value `Successfully Registered User with Valid Details` directly to the execution console.


---

### `TC-TF-01`
- **Source Test File**: [ui/TC-TF-UI-01.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/tests/ui/TC-TF-UI-01.robot)
- **Test Suite Category**: `UI Tests`
- **Objective**: Transfer Funds Between Two Accounts
- **Environment Lifecyle Configuration**:
  - **Suite Setup (Runs once per suite)**: `Load Environment`
  - **Test Setup (Runs before this test)**: `Open Application`
  - **Test Teardown (Runs after this test)**: `Close Application`
- **Tags**: *None*

#### 🗂️ Page Objects & Locators Integrated Usage:
- **Page Object File**: [login.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/resources/pages/login.robot)
  - Locators imported from: [variables/login_locators.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/variables/login_locators.robot)
    - `${login_username}` ➡️ `xpath=//input[@name="username"]`
    - `${login_password}` ➡️ `xpath=//input[@name="password"]`
    - `${login_button}` ➡️ `xpath=//input[@value="Log In"]`
- **Page Object File**: [home_page.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/resources/pages/home_page.robot)
  - Locators imported from: [variables/home_variables.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/variables/home_variables.robot)
    - `${OPEN_NEW_ACCOUNT_URL}` ➡️ `xpath=//a[contains(@href,'openaccount.htm')]`
    - `${TRANSFER_FUNDS_URL}` ➡️ `xpath=//a[contains(@href,'transfer.htm')]`
- **Page Object File**: [open_new_account_page.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/resources/pages/open_new_account_page.robot)
  - Locators imported from: [variables/open_new_account_variables.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/variables/open_new_account_variables.robot)
    - `${ACCOUNT_TYPE_DROPDOWN}` ➡️ `xpath=//select[@id="type"]`
    - `${ACCOUNT_ID_DROPDOWN}` ➡️ `xpath=//select[@id="fromAccountId"]`
    - `${OPEN_ACCOUNT_BUTTON}` ➡️ `xpath=//input[@value="Open New Account"]`
    - `${ACCOUNT_DETAILS_LINK}` ➡️ `xpath=//a[@id="newAccountId"]`
- **Page Object File**: [transfer_funds_page.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/resources/pages/transfer_funds_page.robot)
  - Locators imported from: [variables/transfer_funds_variables.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/variables/transfer_funds_variables.robot)
    - `${AMOUNT_FIELD}` ➡️ `xpath=//input[@id="amount"]`
    - `${FROM_ACCOUNT_DROPDOWN}` ➡️ `xpath=//select[@id="fromAccountId"]`
    - `${TO_ACCOUNT_DROPDOWN}` ➡️ `xpath=//select[@id="toAccountId"]`
    - `${TRANSFER_BUTTON}` ➡️ `xpath=//input[@value="Transfer"]`

#### Detailed Line-by-Line Execution Walkthrough:
##### Line 1: `login    ${USER_ID}    ${USER_PWD}`
- **What this line does**: Logs in to the ParaBank web interface using username `${USER_ID}` and password `${USER_PWD}`.

##### Line 2: `# Step 1: Open a Checking Account`
- **What this line does**: **Comment**: "Step 1: Open a Checking Account" (This is a note in the code for developers, not an action).

##### Line 3: `Click Open New Account`
- **What this line does**: Clicks on the side menu option labeled 'Open New Account'.

##### Line 4: `Select Account Type    0`
- **What this line does**: Selects the account type as **Checking (Type 0)** from the dropdown menu.

##### Line 5: `Click Open Account Button`
- **What this line does**: Clicks the button to submit and open the new account.

##### Line 6: `${checking_id}=    Get New Account Number`
- **What this line does**: Saves the result in a variable named `${checking_id}` after performing: Reads and extracts the newly opened account number from the success confirmation page.

##### Line 7: `# Step 2: Open a Savings Account`
- **What this line does**: **Comment**: "Step 2: Open a Savings Account" (This is a note in the code for developers, not an action).

##### Line 8: `Click Open New Account`
- **What this line does**: Clicks on the side menu option labeled 'Open New Account'.

##### Line 9: `Select Account Type    1`
- **What this line does**: Selects the account type as **Savings (Type 1)** from the dropdown menu.

##### Line 10: `Click Open Account Button`
- **What this line does**: Clicks the button to submit and open the new account.

##### Line 11: `${savings_id}=    Get New Account Number`
- **What this line does**: Saves the result in a variable named `${savings_id}` after performing: Reads and extracts the newly opened account number from the success confirmation page.

##### Line 12: `# Step 3: Transfer $50 from checking to savings`
- **What this line does**: **Comment**: "Step 3: Transfer $50 from checking to savings" (This is a note in the code for developers, not an action).

##### Line 13: `Click Transfer Funds`
- **What this line does**: Clicks on the side menu option labeled 'Transfer Funds'.

##### Line 14: `Wait Until Location Contains    transfer    10s`
- **What this line does**: Waits for up to 10s until the browser's current URL contains the word 'transfer'.

##### Line 15: `Enter Amount    50`
- **What this line does**: Enters the value `50` into the transfer amount text field.

##### Line 16: `Select From Account    ${checking_id}`
- **What this line does**: Selects `${checking_id}` from the source account ('From Account') dropdown menu.

##### Line 17: `Select To Account    ${savings_id}`
- **What this line does**: Selects `${savings_id}` from the destination account ('To Account') dropdown menu.

##### Line 18: `Click Transfer Button`
- **What this line does**: Clicks the 'Transfer' button to submit the fund transfer form.

##### Line 19: `Wait Until Page Contains    Transfer Complete!    10s`
- **What this line does**: Waits up to 10s for the webpage text to display 'Transfer Complete!'.


---

### `TC-TX-UI-01`
- **Source Test File**: [ui/TC-TX-UI-01.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/tests/ui/TC-TX-UI-01.robot)
- **Test Suite Category**: `UI Tests`
- **Objective**: Verify Transfer Funds UI Input Fields and Page Interactivity
- **Environment Lifecyle Configuration**:
  - **Suite Setup (Runs once per suite)**: `Load Environment`
  - **Test Setup (Runs before this test)**: `Open Application`
  - **Test Teardown (Runs after this test)**: `Close Application`
- **Tags**: *None*

#### 🗂️ Page Objects & Locators Integrated Usage:
- **Page Object File**: [login.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/resources/pages/login.robot)
  - Locators imported from: [variables/login_locators.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/variables/login_locators.robot)
    - `${login_username}` ➡️ `xpath=//input[@name="username"]`
    - `${login_password}` ➡️ `xpath=//input[@name="password"]`
    - `${login_button}` ➡️ `xpath=//input[@value="Log In"]`
- **Page Object File**: [home_page.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/resources/pages/home_page.robot)
  - Locators imported from: [variables/home_variables.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/variables/home_variables.robot)
    - `${OPEN_NEW_ACCOUNT_URL}` ➡️ `xpath=//a[contains(@href,'openaccount.htm')]`
    - `${TRANSFER_FUNDS_URL}` ➡️ `xpath=//a[contains(@href,'transfer.htm')]`
- **Page Object File**: [open_new_account_page.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/resources/pages/open_new_account_page.robot)
  - Locators imported from: [variables/open_new_account_variables.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/variables/open_new_account_variables.robot)
    - `${ACCOUNT_TYPE_DROPDOWN}` ➡️ `xpath=//select[@id="type"]`
    - `${ACCOUNT_ID_DROPDOWN}` ➡️ `xpath=//select[@id="fromAccountId"]`
    - `${OPEN_ACCOUNT_BUTTON}` ➡️ `xpath=//input[@value="Open New Account"]`
    - `${ACCOUNT_DETAILS_LINK}` ➡️ `xpath=//a[@id="newAccountId"]`
- **Page Object File**: [transfer_funds_page.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/resources/pages/transfer_funds_page.robot)
  - Locators imported from: [variables/transfer_funds_variables.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/variables/transfer_funds_variables.robot)
    - `${AMOUNT_FIELD}` ➡️ `xpath=//input[@id="amount"]`
    - `${FROM_ACCOUNT_DROPDOWN}` ➡️ `xpath=//select[@id="fromAccountId"]`
    - `${TO_ACCOUNT_DROPDOWN}` ➡️ `xpath=//select[@id="toAccountId"]`
    - `${TRANSFER_BUTTON}` ➡️ `xpath=//input[@value="Transfer"]`

#### Detailed Line-by-Line Execution Walkthrough:
##### Line 1: `login    ${USER_ID}    ${USER_PWD}`
- **What this line does**: Logs in to the ParaBank web interface using username `${USER_ID}` and password `${USER_PWD}`.

##### Line 2: `# Step 1: Open a Checking Account`
- **What this line does**: **Comment**: "Step 1: Open a Checking Account" (This is a note in the code for developers, not an action).

##### Line 3: `Click Open New Account`
- **What this line does**: Clicks on the side menu option labeled 'Open New Account'.

##### Line 4: `Select Account Type    0`
- **What this line does**: Selects the account type as **Checking (Type 0)** from the dropdown menu.

##### Line 5: `Click Open Account Button`
- **What this line does**: Clicks the button to submit and open the new account.

##### Line 6: `${checking_id}=    Get New Account Number`
- **What this line does**: Saves the result in a variable named `${checking_id}` after performing: Reads and extracts the newly opened account number from the success confirmation page.

##### Line 7: `# Step 2: Open a Savings Account`
- **What this line does**: **Comment**: "Step 2: Open a Savings Account" (This is a note in the code for developers, not an action).

##### Line 8: `Click Open New Account`
- **What this line does**: Clicks on the side menu option labeled 'Open New Account'.

##### Line 9: `Select Account Type    1`
- **What this line does**: Selects the account type as **Savings (Type 1)** from the dropdown menu.

##### Line 10: `Click Open Account Button`
- **What this line does**: Clicks the button to submit and open the new account.

##### Line 11: `${savings_id}=    Get New Account Number`
- **What this line does**: Saves the result in a variable named `${savings_id}` after performing: Reads and extracts the newly opened account number from the success confirmation page.

##### Line 12: `# Step 3: Transfer $250 from checking to savings`
- **What this line does**: **Comment**: "Step 3: Transfer $250 from checking to savings" (This is a note in the code for developers, not an action).

##### Line 13: `Click Transfer Funds`
- **What this line does**: Clicks on the side menu option labeled 'Transfer Funds'.

##### Line 14: `Wait Until Location Contains    transfer    10s`
- **What this line does**: Waits for up to 10s until the browser's current URL contains the word 'transfer'.

##### Line 15: `Enter Amount    250`
- **What this line does**: Enters the value `250` into the transfer amount text field.

##### Line 16: `Select From Account    ${checking_id}`
- **What this line does**: Selects `${checking_id}` from the source account ('From Account') dropdown menu.

##### Line 17: `Select To Account    ${savings_id}`
- **What this line does**: Selects `${savings_id}` from the destination account ('To Account') dropdown menu.

##### Line 18: `Click Transfer Button`
- **What this line does**: Clicks the 'Transfer' button to submit the fund transfer form.

##### Line 19: `Wait Until Page Contains    Transfer Complete!    10s`
- **What this line does**: Waits up to 10s for the webpage text to display 'Transfer Complete!'.


---

### `TC-TX-UI-03`
- **Source Test File**: [ui/TC-TX-UI-03.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/tests/ui/TC-TX-UI-03.robot)
- **Test Suite Category**: `UI Tests`
- **Objective**: Verify UI Validation for Blank Amount in Transfer Form
- **Environment Lifecyle Configuration**:
  - **Suite Setup (Runs once per suite)**: `Load Environment`
  - **Test Setup (Runs before this test)**: `Open Application`
  - **Test Teardown (Runs after this test)**: `Close Application`
- **Tags**: *None*

#### 🗂️ Page Objects & Locators Integrated Usage:
- **Page Object File**: [login.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/resources/pages/login.robot)
  - Locators imported from: [variables/login_locators.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/variables/login_locators.robot)
    - `${login_username}` ➡️ `xpath=//input[@name="username"]`
    - `${login_password}` ➡️ `xpath=//input[@name="password"]`
    - `${login_button}` ➡️ `xpath=//input[@value="Log In"]`
- **Page Object File**: [home_page.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/resources/pages/home_page.robot)
  - Locators imported from: [variables/home_variables.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/variables/home_variables.robot)
    - `${OPEN_NEW_ACCOUNT_URL}` ➡️ `xpath=//a[contains(@href,'openaccount.htm')]`
    - `${TRANSFER_FUNDS_URL}` ➡️ `xpath=//a[contains(@href,'transfer.htm')]`
- **Page Object File**: [open_new_account_page.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/resources/pages/open_new_account_page.robot)
  - Locators imported from: [variables/open_new_account_variables.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/variables/open_new_account_variables.robot)
    - `${ACCOUNT_TYPE_DROPDOWN}` ➡️ `xpath=//select[@id="type"]`
    - `${ACCOUNT_ID_DROPDOWN}` ➡️ `xpath=//select[@id="fromAccountId"]`
    - `${OPEN_ACCOUNT_BUTTON}` ➡️ `xpath=//input[@value="Open New Account"]`
    - `${ACCOUNT_DETAILS_LINK}` ➡️ `xpath=//a[@id="newAccountId"]`
- **Page Object File**: [transfer_funds_page.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/resources/pages/transfer_funds_page.robot)
  - Locators imported from: [variables/transfer_funds_variables.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/variables/transfer_funds_variables.robot)
    - `${FROM_ACCOUNT_DROPDOWN}` ➡️ `xpath=//select[@id="fromAccountId"]`
    - `${TO_ACCOUNT_DROPDOWN}` ➡️ `xpath=//select[@id="toAccountId"]`
    - `${TRANSFER_BUTTON}` ➡️ `xpath=//input[@value="Transfer"]`

#### Detailed Line-by-Line Execution Walkthrough:
##### Line 1: `login    ${USER_ID}    ${USER_PWD}`
- **What this line does**: Logs in to the ParaBank web interface using username `${USER_ID}` and password `${USER_PWD}`.

##### Line 2: `# Step 1: Open a Checking Account`
- **What this line does**: **Comment**: "Step 1: Open a Checking Account" (This is a note in the code for developers, not an action).

##### Line 3: `Click Open New Account`
- **What this line does**: Clicks on the side menu option labeled 'Open New Account'.

##### Line 4: `Select Account Type    0`
- **What this line does**: Selects the account type as **Checking (Type 0)** from the dropdown menu.

##### Line 5: `Click Open Account Button`
- **What this line does**: Clicks the button to submit and open the new account.

##### Line 6: `${checking_id}=    Get New Account Number`
- **What this line does**: Saves the result in a variable named `${checking_id}` after performing: Reads and extracts the newly opened account number from the success confirmation page.

##### Line 7: `# Step 2: Open a Savings Account`
- **What this line does**: **Comment**: "Step 2: Open a Savings Account" (This is a note in the code for developers, not an action).

##### Line 8: `Click Open New Account`
- **What this line does**: Clicks on the side menu option labeled 'Open New Account'.

##### Line 9: `Select Account Type    1`
- **What this line does**: Selects the account type as **Savings (Type 1)** from the dropdown menu.

##### Line 10: `Click Open Account Button`
- **What this line does**: Clicks the button to submit and open the new account.

##### Line 11: `${savings_id}=    Get New Account Number`
- **What this line does**: Saves the result in a variable named `${savings_id}` after performing: Reads and extracts the newly opened account number from the success confirmation page.

##### Line 12: `# Step 3: Go to Transfer Funds`
- **What this line does**: **Comment**: "Step 3: Go to Transfer Funds" (This is a note in the code for developers, not an action).

##### Line 13: `Click Transfer Funds`
- **What this line does**: Clicks on the side menu option labeled 'Transfer Funds'.

##### Line 14: `Wait Until Location Contains    transfer    10s`
- **What this line does**: Waits for up to 10s until the browser's current URL contains the word 'transfer'.

##### Line 15: `Select From Account    ${checking_id}`
- **What this line does**: Selects `${checking_id}` from the source account ('From Account') dropdown menu.

##### Line 16: `Select To Account    ${savings_id}`
- **What this line does**: Selects `${savings_id}` from the destination account ('To Account') dropdown menu.

##### Line 17: `Click Transfer Button`
- **What this line does**: Clicks the 'Transfer' button to submit the fund transfer form.

##### Line 18: `Wait Until Page Contains    Error    10s`
- **What this line does**: Waits up to 10s for the webpage text to display 'Error'.


---

### `TC-TX-UI-04`
- **Source Test File**: [ui/TC-TX-UI-04.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/tests/ui/TC-TX-UI-04.robot)
- **Test Suite Category**: `UI Tests`
- **Objective**: Verify UI Validation for Alphabetic Characters in Transfer Amount
- **Environment Lifecyle Configuration**:
  - **Suite Setup (Runs once per suite)**: `Load Environment`
  - **Test Setup (Runs before this test)**: `Open Application`
  - **Test Teardown (Runs after this test)**: `Close Application`
- **Tags**: *None*

#### 🗂️ Page Objects & Locators Integrated Usage:
- **Page Object File**: [login.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/resources/pages/login.robot)
  - Locators imported from: [variables/login_locators.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/variables/login_locators.robot)
    - `${login_username}` ➡️ `xpath=//input[@name="username"]`
    - `${login_password}` ➡️ `xpath=//input[@name="password"]`
    - `${login_button}` ➡️ `xpath=//input[@value="Log In"]`
- **Page Object File**: [home_page.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/resources/pages/home_page.robot)
  - Locators imported from: [variables/home_variables.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/variables/home_variables.robot)
    - `${OPEN_NEW_ACCOUNT_URL}` ➡️ `xpath=//a[contains(@href,'openaccount.htm')]`
    - `${TRANSFER_FUNDS_URL}` ➡️ `xpath=//a[contains(@href,'transfer.htm')]`
- **Page Object File**: [open_new_account_page.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/resources/pages/open_new_account_page.robot)
  - Locators imported from: [variables/open_new_account_variables.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/variables/open_new_account_variables.robot)
    - `${ACCOUNT_TYPE_DROPDOWN}` ➡️ `xpath=//select[@id="type"]`
    - `${ACCOUNT_ID_DROPDOWN}` ➡️ `xpath=//select[@id="fromAccountId"]`
    - `${OPEN_ACCOUNT_BUTTON}` ➡️ `xpath=//input[@value="Open New Account"]`
    - `${ACCOUNT_DETAILS_LINK}` ➡️ `xpath=//a[@id="newAccountId"]`
- **Page Object File**: [transfer_funds_page.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/resources/pages/transfer_funds_page.robot)
  - Locators imported from: [variables/transfer_funds_variables.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/variables/transfer_funds_variables.robot)
    - `${AMOUNT_FIELD}` ➡️ `xpath=//input[@id="amount"]`
    - `${FROM_ACCOUNT_DROPDOWN}` ➡️ `xpath=//select[@id="fromAccountId"]`
    - `${TO_ACCOUNT_DROPDOWN}` ➡️ `xpath=//select[@id="toAccountId"]`
    - `${TRANSFER_BUTTON}` ➡️ `xpath=//input[@value="Transfer"]`

#### Detailed Line-by-Line Execution Walkthrough:
##### Line 1: `login    ${USER_ID}    ${USER_PWD}`
- **What this line does**: Logs in to the ParaBank web interface using username `${USER_ID}` and password `${USER_PWD}`.

##### Line 2: `# Step 1: Open a Checking Account`
- **What this line does**: **Comment**: "Step 1: Open a Checking Account" (This is a note in the code for developers, not an action).

##### Line 3: `Click Open New Account`
- **What this line does**: Clicks on the side menu option labeled 'Open New Account'.

##### Line 4: `Select Account Type    0`
- **What this line does**: Selects the account type as **Checking (Type 0)** from the dropdown menu.

##### Line 5: `Click Open Account Button`
- **What this line does**: Clicks the button to submit and open the new account.

##### Line 6: `${checking_id}=    Get New Account Number`
- **What this line does**: Saves the result in a variable named `${checking_id}` after performing: Reads and extracts the newly opened account number from the success confirmation page.

##### Line 7: `# Step 2: Open a Savings Account`
- **What this line does**: **Comment**: "Step 2: Open a Savings Account" (This is a note in the code for developers, not an action).

##### Line 8: `Click Open New Account`
- **What this line does**: Clicks on the side menu option labeled 'Open New Account'.

##### Line 9: `Select Account Type    1`
- **What this line does**: Selects the account type as **Savings (Type 1)** from the dropdown menu.

##### Line 10: `Click Open Account Button`
- **What this line does**: Clicks the button to submit and open the new account.

##### Line 11: `${savings_id}=    Get New Account Number`
- **What this line does**: Saves the result in a variable named `${savings_id}` after performing: Reads and extracts the newly opened account number from the success confirmation page.

##### Line 12: `# Step 3: Go to Transfer Funds`
- **What this line does**: **Comment**: "Step 3: Go to Transfer Funds" (This is a note in the code for developers, not an action).

##### Line 13: `Click Transfer Funds`
- **What this line does**: Clicks on the side menu option labeled 'Transfer Funds'.

##### Line 14: `Wait Until Location Contains    transfer    10s`
- **What this line does**: Waits for up to 10s until the browser's current URL contains the word 'transfer'.

##### Line 15: `Enter Amount    abc`
- **What this line does**: Enters the value `abc` into the transfer amount text field.

##### Line 16: `Select From Account    ${checking_id}`
- **What this line does**: Selects `${checking_id}` from the source account ('From Account') dropdown menu.

##### Line 17: `Select To Account    ${savings_id}`
- **What this line does**: Selects `${savings_id}` from the destination account ('To Account') dropdown menu.

##### Line 18: `Click Transfer Button`
- **What this line does**: Clicks the 'Transfer' button to submit the fund transfer form.

##### Line 19: `Wait Until Page Contains    Error    10s`
- **What this line does**: Waits up to 10s for the webpage text to display 'Error'.


---

### `TC-TX-UI-05`
- **Source Test File**: [ui/TC-TX-UI-05.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/tests/ui/TC-TX-UI-05.robot)
- **Test Suite Category**: `UI Tests`
- **Objective**: Verify UI Error Message for Transfer Amount Exceeding Available Balance
- **Environment Lifecyle Configuration**:
  - **Suite Setup (Runs once per suite)**: `Load Environment`
  - **Test Setup (Runs before this test)**: `Open Application`
  - **Test Teardown (Runs after this test)**: `Close Application`
- **Tags**: *None*

#### 🗂️ Page Objects & Locators Integrated Usage:
- **Page Object File**: [login.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/resources/pages/login.robot)
  - Locators imported from: [variables/login_locators.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/variables/login_locators.robot)
    - `${login_username}` ➡️ `xpath=//input[@name="username"]`
    - `${login_password}` ➡️ `xpath=//input[@name="password"]`
    - `${login_button}` ➡️ `xpath=//input[@value="Log In"]`
- **Page Object File**: [home_page.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/resources/pages/home_page.robot)
  - Locators imported from: [variables/home_variables.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/variables/home_variables.robot)
    - `${OPEN_NEW_ACCOUNT_URL}` ➡️ `xpath=//a[contains(@href,'openaccount.htm')]`
    - `${TRANSFER_FUNDS_URL}` ➡️ `xpath=//a[contains(@href,'transfer.htm')]`
- **Page Object File**: [open_new_account_page.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/resources/pages/open_new_account_page.robot)
  - Locators imported from: [variables/open_new_account_variables.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/variables/open_new_account_variables.robot)
    - `${ACCOUNT_TYPE_DROPDOWN}` ➡️ `xpath=//select[@id="type"]`
    - `${ACCOUNT_ID_DROPDOWN}` ➡️ `xpath=//select[@id="fromAccountId"]`
    - `${OPEN_ACCOUNT_BUTTON}` ➡️ `xpath=//input[@value="Open New Account"]`
    - `${ACCOUNT_DETAILS_LINK}` ➡️ `xpath=//a[@id="newAccountId"]`
- **Page Object File**: [transfer_funds_page.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/resources/pages/transfer_funds_page.robot)
  - Locators imported from: [variables/transfer_funds_variables.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/variables/transfer_funds_variables.robot)
    - `${AMOUNT_FIELD}` ➡️ `xpath=//input[@id="amount"]`
    - `${FROM_ACCOUNT_DROPDOWN}` ➡️ `xpath=//select[@id="fromAccountId"]`
    - `${TO_ACCOUNT_DROPDOWN}` ➡️ `xpath=//select[@id="toAccountId"]`
    - `${TRANSFER_BUTTON}` ➡️ `xpath=//input[@value="Transfer"]`

#### Detailed Line-by-Line Execution Walkthrough:
##### Line 1: `login    ${USER_ID}    ${USER_PWD}`
- **What this line does**: Logs in to the ParaBank web interface using username `${USER_ID}` and password `${USER_PWD}`.

##### Line 2: `# Step 1: Open a Checking Account`
- **What this line does**: **Comment**: "Step 1: Open a Checking Account" (This is a note in the code for developers, not an action).

##### Line 3: `Click Open New Account`
- **What this line does**: Clicks on the side menu option labeled 'Open New Account'.

##### Line 4: `Select Account Type    0`
- **What this line does**: Selects the account type as **Checking (Type 0)** from the dropdown menu.

##### Line 5: `Click Open Account Button`
- **What this line does**: Clicks the button to submit and open the new account.

##### Line 6: `${checking_id}=    Get New Account Number`
- **What this line does**: Saves the result in a variable named `${checking_id}` after performing: Reads and extracts the newly opened account number from the success confirmation page.

##### Line 7: `# Step 2: Open a Savings Account`
- **What this line does**: **Comment**: "Step 2: Open a Savings Account" (This is a note in the code for developers, not an action).

##### Line 8: `Click Open New Account`
- **What this line does**: Clicks on the side menu option labeled 'Open New Account'.

##### Line 9: `Select Account Type    1`
- **What this line does**: Selects the account type as **Savings (Type 1)** from the dropdown menu.

##### Line 10: `Click Open Account Button`
- **What this line does**: Clicks the button to submit and open the new account.

##### Line 11: `${savings_id}=    Get New Account Number`
- **What this line does**: Saves the result in a variable named `${savings_id}` after performing: Reads and extracts the newly opened account number from the success confirmation page.

##### Line 12: `# Step 3: Go to Transfer Funds`
- **What this line does**: **Comment**: "Step 3: Go to Transfer Funds" (This is a note in the code for developers, not an action).

##### Line 13: `Click Transfer Funds`
- **What this line does**: Clicks on the side menu option labeled 'Transfer Funds'.

##### Line 14: `Wait Until Location Contains    transfer    10s`
- **What this line does**: Waits for up to 10s until the browser's current URL contains the word 'transfer'.

##### Line 15: `Enter Amount    100000000`
- **What this line does**: Enters the value `100000000` into the transfer amount text field.

##### Line 16: `Select From Account    ${checking_id}`
- **What this line does**: Selects `${checking_id}` from the source account ('From Account') dropdown menu.

##### Line 17: `Select To Account    ${savings_id}`
- **What this line does**: Selects `${savings_id}` from the destination account ('To Account') dropdown menu.

##### Line 18: `Click Transfer Button`
- **What this line does**: Clicks the 'Transfer' button to submit the fund transfer form.

##### Line 19: `Wait Until Page Contains    Error    10s`
- **What this line does**: Waits up to 10s for the webpage text to display 'Error'.


---

### `TC-TX-UI-06`
- **Source Test File**: [ui/TC-TX-UI-06.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/tests/ui/TC-TX-UI-06.robot)
- **Test Suite Category**: `UI Tests`
- **Objective**: Validate transfer funds to same account
- **Environment Lifecyle Configuration**:
  - **Suite Setup (Runs once per suite)**: `Load Environment`
  - **Test Setup (Runs before this test)**: `Open Application`
  - **Test Teardown (Runs after this test)**: `Close Application`
- **Tags**: *None*

#### 🗂️ Page Objects & Locators Integrated Usage:
- **Page Object File**: [login.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/resources/pages/login.robot)
  - Locators imported from: [variables/login_locators.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/variables/login_locators.robot)
    - `${login_username}` ➡️ `xpath=//input[@name="username"]`
    - `${login_password}` ➡️ `xpath=//input[@name="password"]`
    - `${login_button}` ➡️ `xpath=//input[@value="Log In"]`
- **Page Object File**: [home_page.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/resources/pages/home_page.robot)
  - Locators imported from: [variables/home_variables.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/variables/home_variables.robot)
    - `${OPEN_NEW_ACCOUNT_URL}` ➡️ `xpath=//a[contains(@href,'openaccount.htm')]`
    - `${TRANSFER_FUNDS_URL}` ➡️ `xpath=//a[contains(@href,'transfer.htm')]`
- **Page Object File**: [open_new_account_page.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/resources/pages/open_new_account_page.robot)
  - Locators imported from: [variables/open_new_account_variables.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/variables/open_new_account_variables.robot)
    - `${ACCOUNT_TYPE_DROPDOWN}` ➡️ `xpath=//select[@id="type"]`
    - `${ACCOUNT_ID_DROPDOWN}` ➡️ `xpath=//select[@id="fromAccountId"]`
    - `${OPEN_ACCOUNT_BUTTON}` ➡️ `xpath=//input[@value="Open New Account"]`
    - `${ACCOUNT_DETAILS_LINK}` ➡️ `xpath=//a[@id="newAccountId"]`
- **Page Object File**: [transfer_funds_page.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/resources/pages/transfer_funds_page.robot)
  - Locators imported from: [variables/transfer_funds_variables.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/variables/transfer_funds_variables.robot)
    - `${AMOUNT_FIELD}` ➡️ `xpath=//input[@id="amount"]`
    - `${FROM_ACCOUNT_DROPDOWN}` ➡️ `xpath=//select[@id="fromAccountId"]`
    - `${TO_ACCOUNT_DROPDOWN}` ➡️ `xpath=//select[@id="toAccountId"]`
    - `${TRANSFER_BUTTON}` ➡️ `xpath=//input[@value="Transfer"]`

#### Detailed Line-by-Line Execution Walkthrough:
##### Line 1: `login    ${USER_ID}    ${USER_PWD}`
- **What this line does**: Logs in to the ParaBank web interface using username `${USER_ID}` and password `${USER_PWD}`.

##### Line 2: `# Step 1: Open a Checking Account`
- **What this line does**: **Comment**: "Step 1: Open a Checking Account" (This is a note in the code for developers, not an action).

##### Line 3: `Click Open New Account`
- **What this line does**: Clicks on the side menu option labeled 'Open New Account'.

##### Line 4: `Select Account Type    0`
- **What this line does**: Selects the account type as **Checking (Type 0)** from the dropdown menu.

##### Line 5: `Click Open Account Button`
- **What this line does**: Clicks the button to submit and open the new account.

##### Line 6: `${checking_id}=    Get New Account Number`
- **What this line does**: Saves the result in a variable named `${checking_id}` after performing: Reads and extracts the newly opened account number from the success confirmation page.

##### Line 7: `# Step 2: Open a Savings Account`
- **What this line does**: **Comment**: "Step 2: Open a Savings Account" (This is a note in the code for developers, not an action).

##### Line 8: `Click Open New Account`
- **What this line does**: Clicks on the side menu option labeled 'Open New Account'.

##### Line 9: `Select Account Type    1`
- **What this line does**: Selects the account type as **Savings (Type 1)** from the dropdown menu.

##### Line 10: `Click Open Account Button`
- **What this line does**: Clicks the button to submit and open the new account.

##### Line 11: `${savings_id}=    Get New Account Number`
- **What this line does**: Saves the result in a variable named `${savings_id}` after performing: Reads and extracts the newly opened account number from the success confirmation page.

##### Line 12: `# Step 3: Go to Transfer Funds`
- **What this line does**: **Comment**: "Step 3: Go to Transfer Funds" (This is a note in the code for developers, not an action).

##### Line 13: `Click Transfer Funds`
- **What this line does**: Clicks on the side menu option labeled 'Transfer Funds'.

##### Line 14: `Wait Until Location Contains    transfer    10s`
- **What this line does**: Waits for up to 10s until the browser's current URL contains the word 'transfer'.

##### Line 15: `Enter Amount    100`
- **What this line does**: Enters the value `100` into the transfer amount text field.

##### Line 16: `Select From Account    ${checking_id}`
- **What this line does**: Selects `${checking_id}` from the source account ('From Account') dropdown menu.

##### Line 17: `Select To Account    ${checking_id}`
- **What this line does**: Selects `${checking_id}` from the destination account ('To Account') dropdown menu.

##### Line 18: `Click Transfer Button`
- **What this line does**: Clicks the 'Transfer' button to submit the fund transfer form.

##### Line 19: `Wait Until Page Contains    Transfer Complete!    10s`
- **What this line does**: Waits up to 10s for the webpage text to display 'Transfer Complete!'.

##### Line 20: `Log To Console    Transfer to same account is successful`
- **What this line does**: Prints the message or value `Transfer to same account is successful` directly to the execution console.


---

## End-to-End (E2E) Tests

This section details all the test suites and test cases in the **End-to-End (E2E) Tests** category.

### `TC_E2E_01 Create Savings Account and Verify details via API`
- **Source Test File**: [e2e/TC_E2E_01.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/tests/e2e/TC_E2E_01.robot)
- **Test Suite Category**: `End-to-End (E2E) Tests`
- **Objective**: End-to-End Savings Account UI creation & API verification
- **Environment Lifecyle Configuration**:
  - **Suite Setup (Runs once per suite)**: `Setup E2E`
  - **Test Setup (Runs before this test)**: `Open Application`
  - **Test Teardown (Runs after this test)**: `Close Application`
- **Tags**: `e2e`

#### 🗂️ Page Objects & Locators Integrated Usage:
- **Page Object File**: [common_resources.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/resources/keywords/common_resources.robot)
  - No external locator variables required.
- **Page Object File**: [home_page.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/resources/pages/home_page.robot)
  - Locators imported from: [variables/home_variables.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/variables/home_variables.robot)
    - `${OPEN_NEW_ACCOUNT_URL}` ➡️ `xpath=//a[contains(@href,'openaccount.htm')]`
- **Page Object File**: [open_new_account_page.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/resources/pages/open_new_account_page.robot)
  - Locators imported from: [variables/open_new_account_variables.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/variables/open_new_account_variables.robot)
    - `${ACCOUNT_TYPE_DROPDOWN}` ➡️ `xpath=//select[@id="type"]`
    - `${ACCOUNT_ID_DROPDOWN}` ➡️ `xpath=//select[@id="fromAccountId"]`
    - `${OPEN_ACCOUNT_BUTTON}` ➡️ `xpath=//input[@value="Open New Account"]`
    - `${ACCOUNT_DETAILS_LINK}` ➡️ `xpath=//a[@id="newAccountId"]`

#### Detailed Line-by-Line Execution Walkthrough:
##### Line 1: `#    login    ${USER_ID}    ${USER_PWD}`
- **What this line does**: **Comment**: "login    ${USER_ID}    ${USER_PWD}" (This is a note in the code for developers, not an action).

##### Line 2: `Ensure User Is Logged In`
- **What this line does**: Checks if the session is authenticated; if not, performs a login using standard credentials.

##### Line 3: `Click Open New Account`
- **What this line does**: Clicks on the side menu option labeled 'Open New Account'.

##### Line 4: `Select Account Type    1`
- **What this line does**: Selects the account type as **Savings (Type 1)** from the dropdown menu.

##### Line 5: `Click Open Account Button`
- **What this line does**: Clicks the button to submit and open the new account.

##### Line 6: `${account_id}=    Get New Account Number`
- **What this line does**: Saves the result in a variable named `${account_id}` after performing: Reads and extracts the newly opened account number from the success confirmation page.

##### Line 7: `${response}=    Get Account Details    ${account_id}`
- **What this line does**: Saves the result in a variable named `${response}` after performing: Sends a GET request to the accounts API (`/accounts/${account_id}`) to retrieve database details.

##### Line 8: `Verify Response Code    ${response}    200`
- **What this line does**: Asserts that the HTTP response code of the object `${response}` is exactly `200` (Success).

##### Line 9: `Should Contain    ${response.text}    SAVINGS`
- **What this line does**: Asserts that the text or data `${response.text}` contains the expected value `SAVINGS`.

##### Line 10: `Should Contain    ${response.text}    ${account_id}`
- **What this line does**: Asserts that the text or data `${response.text}` contains the expected value `${account_id}`.


---

### `TC_E2E_02 Create Checking Account and Verify Customer Accounts via API`
- **Source Test File**: [e2e/TC_E2E_02.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/tests/e2e/TC_E2E_02.robot)
- **Test Suite Category**: `End-to-End (E2E) Tests`
- **Objective**: End-to-End Checking Account UI creation & API verification
- **Environment Lifecyle Configuration**:
  - **Suite Setup (Runs once per suite)**: `Setup E2E`
  - **Test Setup (Runs before this test)**: `Open Application`
  - **Test Teardown (Runs after this test)**: `Close Application`
- **Tags**: `e2e`

#### 🗂️ Page Objects & Locators Integrated Usage:
- **Page Object File**: [common_resources.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/resources/keywords/common_resources.robot)
  - No external locator variables required.
- **Page Object File**: [home_page.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/resources/pages/home_page.robot)
  - Locators imported from: [variables/home_variables.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/variables/home_variables.robot)
    - `${OPEN_NEW_ACCOUNT_URL}` ➡️ `xpath=//a[contains(@href,'openaccount.htm')]`
- **Page Object File**: [open_new_account_page.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/resources/pages/open_new_account_page.robot)
  - Locators imported from: [variables/open_new_account_variables.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/variables/open_new_account_variables.robot)
    - `${ACCOUNT_TYPE_DROPDOWN}` ➡️ `xpath=//select[@id="type"]`
    - `${ACCOUNT_ID_DROPDOWN}` ➡️ `xpath=//select[@id="fromAccountId"]`
    - `${OPEN_ACCOUNT_BUTTON}` ➡️ `xpath=//input[@value="Open New Account"]`
    - `${ACCOUNT_DETAILS_LINK}` ➡️ `xpath=//a[@id="newAccountId"]`

#### Detailed Line-by-Line Execution Walkthrough:
##### Line 1: `#    login    ${USER_ID}    ${USER_PWD}`
- **What this line does**: **Comment**: "login    ${USER_ID}    ${USER_PWD}" (This is a note in the code for developers, not an action).

##### Line 2: `Ensure User Is Logged In`
- **What this line does**: Checks if the session is authenticated; if not, performs a login using standard credentials.

##### Line 3: `Click Open New Account`
- **What this line does**: Clicks on the side menu option labeled 'Open New Account'.

##### Line 4: `Select Account Type    0`
- **What this line does**: Selects the account type as **Checking (Type 0)** from the dropdown menu.

##### Line 5: `Click Open Account Button`
- **What this line does**: Clicks the button to submit and open the new account.

##### Line 6: `${account_id}=    Get New Account Number`
- **What this line does**: Saves the result in a variable named `${account_id}` after performing: Reads and extracts the newly opened account number from the success confirmation page.

##### Line 7: `${account_details}=    Get Account Details    ${account_id}`
- **What this line does**: Saves the result in a variable named `${account_details}` after performing: Sends a GET request to the accounts API (`/accounts/${account_id}`) to retrieve database details.

##### Line 8: `Verify Response Code    ${account_details}    200`
- **What this line does**: Asserts that the HTTP response code of the object `${account_details}` is exactly `200` (Success).

##### Line 9: `${account_json}=    Set Variable    ${account_details.json()}`
- **What this line does**: Saves the result in a variable named `${account_json}` after performing: Assigns the value `${account_details.json()}` to the target variable.

##### Line 10: `${cust_id}=    Set Variable    ${account_json['customerId']}`
- **What this line does**: Saves the result in a variable named `${cust_id}` after performing: Assigns the value `${account_json['customerId']}` to the target variable.

##### Line 11: `${response}=    Get Customer Accounts    ${cust_id}`
- **What this line does**: Saves the result in a variable named `${response}` after performing: Sends a GET request to the customer accounts API (`/customers/${cust_id}/accounts`) to fetch all associated accounts.

##### Line 12: `Verify Response Code    ${response}    200`
- **What this line does**: Asserts that the HTTP response code of the object `${response}` is exactly `200` (Success).

##### Line 13: `Should Contain    ${response.text}    ${account_id}`
- **What this line does**: Asserts that the text or data `${response.text}` contains the expected value `${account_id}`.


---

### `TC_E2E_03 Transfer Funds via UI and Verify Balances via API`
- **Source Test File**: [e2e/TC_E2E_03.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/tests/e2e/TC_E2E_03.robot)
- **Test Suite Category**: `End-to-End (E2E) Tests`
- **Objective**: End-to-End Funds Transfer via UI and verification via API
- **Environment Lifecyle Configuration**:
  - **Suite Setup (Runs once per suite)**: `Setup E2E`
  - **Test Setup (Runs before this test)**: `Open Application`
  - **Test Teardown (Runs after this test)**: `Close Application`
- **Tags**: `e2e`

#### 🗂️ Page Objects & Locators Integrated Usage:
- **Page Object File**: [common_resources.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/resources/keywords/common_resources.robot)
  - No external locator variables required.
- **Page Object File**: [home_page.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/resources/pages/home_page.robot)
  - Locators imported from: [variables/home_variables.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/variables/home_variables.robot)
    - `${OPEN_NEW_ACCOUNT_URL}` ➡️ `xpath=//a[contains(@href,'openaccount.htm')]`
    - `${TRANSFER_FUNDS_URL}` ➡️ `xpath=//a[contains(@href,'transfer.htm')]`
- **Page Object File**: [open_new_account_page.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/resources/pages/open_new_account_page.robot)
  - Locators imported from: [variables/open_new_account_variables.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/variables/open_new_account_variables.robot)
    - `${ACCOUNT_TYPE_DROPDOWN}` ➡️ `xpath=//select[@id="type"]`
    - `${ACCOUNT_ID_DROPDOWN}` ➡️ `xpath=//select[@id="fromAccountId"]`
    - `${OPEN_ACCOUNT_BUTTON}` ➡️ `xpath=//input[@value="Open New Account"]`
    - `${ACCOUNT_DETAILS_LINK}` ➡️ `xpath=//a[@id="newAccountId"]`
- **Page Object File**: [transfer_funds_page.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/resources/pages/transfer_funds_page.robot)
  - Locators imported from: [variables/transfer_funds_variables.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/variables/transfer_funds_variables.robot)
    - `${AMOUNT_FIELD}` ➡️ `xpath=//input[@id="amount"]`
    - `${FROM_ACCOUNT_DROPDOWN}` ➡️ `xpath=//select[@id="fromAccountId"]`
    - `${TO_ACCOUNT_DROPDOWN}` ➡️ `xpath=//select[@id="toAccountId"]`
    - `${TRANSFER_BUTTON}` ➡️ `xpath=//input[@value="Transfer"]`

#### Detailed Line-by-Line Execution Walkthrough:
##### Line 1: `#    login    ${USER_ID}    ${USER_PWD}`
- **What this line does**: **Comment**: "login    ${USER_ID}    ${USER_PWD}" (This is a note in the code for developers, not an action).

##### Line 2: `Ensure User Is Logged In`
- **What this line does**: Checks if the session is authenticated; if not, performs a login using standard credentials.

##### Line 3: `# Step 1: Open a Checking Account`
- **What this line does**: **Comment**: "Step 1: Open a Checking Account" (This is a note in the code for developers, not an action).

##### Line 4: `Click Open New Account`
- **What this line does**: Clicks on the side menu option labeled 'Open New Account'.

##### Line 5: `Select Account Type    0`
- **What this line does**: Selects the account type as **Checking (Type 0)** from the dropdown menu.

##### Line 6: `Click Open Account Button`
- **What this line does**: Clicks the button to submit and open the new account.

##### Line 7: `${source_account}=    Get New Account Number`
- **What this line does**: Saves the result in a variable named `${source_account}` after performing: Reads and extracts the newly opened account number from the success confirmation page.

##### Line 8: `# Step 2: Open a Savings Account`
- **What this line does**: **Comment**: "Step 2: Open a Savings Account" (This is a note in the code for developers, not an action).

##### Line 9: `Click Open New Account`
- **What this line does**: Clicks on the side menu option labeled 'Open New Account'.

##### Line 10: `Select Account Type    1`
- **What this line does**: Selects the account type as **Savings (Type 1)** from the dropdown menu.

##### Line 11: `Click Open Account Button`
- **What this line does**: Clicks the button to submit and open the new account.

##### Line 12: `${destination_account}=    Get New Account Number`
- **What this line does**: Saves the result in a variable named `${destination_account}` after performing: Reads and extracts the newly opened account number from the success confirmation page.

##### Line 13: `# Step 3: Fetch starting balance of source account via API`
- **What this line does**: **Comment**: "Step 3: Fetch starting balance of source account via API" (This is a note in the code for developers, not an action).

##### Line 14: `${response}=    Get Account Details    ${source_account}`
- **What this line does**: Saves the result in a variable named `${response}` after performing: Sends a GET request to the accounts API (`/accounts/${source_account}`) to retrieve database details.

##### Line 15: `Verify Response Code    ${response}    200`
- **What this line does**: Asserts that the HTTP response code of the object `${response}` is exactly `200` (Success).

##### Line 16: `${source_details}=    Set Variable    ${response.json()}`
- **What this line does**: Saves the result in a variable named `${source_details}` after performing: Assigns the value `${response.json()}` to the target variable.

##### Line 17: `${source_before}=    Set Variable    ${source_details['balance']}`
- **What this line does**: Saves the result in a variable named `${source_before}` after performing: Assigns the value `${source_details['balance']}` to the target variable.

##### Line 18: `# Step 4: Transfer $10 from Checking to Savings via UI`
- **What this line does**: **Comment**: "Step 4: Transfer $10 from Checking to Savings via UI" (This is a note in the code for developers, not an action).

##### Line 19: `Click Transfer Funds`
- **What this line does**: Clicks on the side menu option labeled 'Transfer Funds'.

##### Line 20: `Enter Amount    10`
- **What this line does**: Enters the value `10` into the transfer amount text field.

##### Line 21: `Select From Account    ${source_account}`
- **What this line does**: Selects `${source_account}` from the source account ('From Account') dropdown menu.

##### Line 22: `Select To Account    ${destination_account}`
- **What this line does**: Selects `${destination_account}` from the destination account ('To Account') dropdown menu.

##### Line 23: `Click Transfer Button`
- **What this line does**: Clicks the 'Transfer' button to submit the fund transfer form.

##### Line 24: `Wait Until Page Contains    Transfer Complete!    10s`
- **What this line does**: Waits up to 10s for the webpage text to display 'Transfer Complete!'.

##### Line 25: `${expected}=    Evaluate    float(${source_before}) - 10`
- **What this line does**: Saves the result in a variable named `${expected}` after performing: Evaluates the Python mathematical expression `float(${source_before}) - 10` and calculates the result.

##### Line 26: `Log To Console    Expected = ${expected}`
- **What this line does**: Prints the message or value `Expected = ${expected}` directly to the execution console.

##### Line 27: `Wait Until Keyword Succeeds    10s    1s    Verify Account Balance    ${source_account}    ${expected}`
- **What this line does**: Retries the keyword `Verify Account Balance ${source_account} ${expected}` repeatedly for up to `10s`, waiting `1s` between retries, until it passes.


---

### `TC_E2E_04 Create New Account and Transfer Funds to It`
- **Source Test File**: [e2e/TC_E2E_04.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/tests/e2e/TC_E2E_04.robot)
- **Test Suite Category**: `End-to-End (E2E) Tests`
- **Objective**: End-to-End creation of two accounts and transfer between them, verified via API
- **Environment Lifecyle Configuration**:
  - **Suite Setup (Runs once per suite)**: `Setup E2E`
  - **Test Setup (Runs before this test)**: `Open Application`
  - **Test Teardown (Runs after this test)**: `Close Application`
- **Tags**: `e2e`

#### 🗂️ Page Objects & Locators Integrated Usage:
- **Page Object File**: [common_resources.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/resources/keywords/common_resources.robot)
  - No external locator variables required.
- **Page Object File**: [home_page.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/resources/pages/home_page.robot)
  - Locators imported from: [variables/home_variables.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/variables/home_variables.robot)
    - `${OPEN_NEW_ACCOUNT_URL}` ➡️ `xpath=//a[contains(@href,'openaccount.htm')]`
    - `${TRANSFER_FUNDS_URL}` ➡️ `xpath=//a[contains(@href,'transfer.htm')]`
- **Page Object File**: [open_new_account_page.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/resources/pages/open_new_account_page.robot)
  - Locators imported from: [variables/open_new_account_variables.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/variables/open_new_account_variables.robot)
    - `${ACCOUNT_TYPE_DROPDOWN}` ➡️ `xpath=//select[@id="type"]`
    - `${ACCOUNT_ID_DROPDOWN}` ➡️ `xpath=//select[@id="fromAccountId"]`
    - `${OPEN_ACCOUNT_BUTTON}` ➡️ `xpath=//input[@value="Open New Account"]`
    - `${ACCOUNT_DETAILS_LINK}` ➡️ `xpath=//a[@id="newAccountId"]`
- **Page Object File**: [transfer_funds_page.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/resources/pages/transfer_funds_page.robot)
  - Locators imported from: [variables/transfer_funds_variables.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/variables/transfer_funds_variables.robot)
    - `${AMOUNT_FIELD}` ➡️ `xpath=//input[@id="amount"]`
    - `${FROM_ACCOUNT_DROPDOWN}` ➡️ `xpath=//select[@id="fromAccountId"]`
    - `${TO_ACCOUNT_DROPDOWN}` ➡️ `xpath=//select[@id="toAccountId"]`
    - `${TRANSFER_BUTTON}` ➡️ `xpath=//input[@value="Transfer"]`

#### Detailed Line-by-Line Execution Walkthrough:
##### Line 1: `#    login    ${USER_ID}    ${USER_PWD}`
- **What this line does**: **Comment**: "login    ${USER_ID}    ${USER_PWD}" (This is a note in the code for developers, not an action).

##### Line 2: `Ensure User Is Logged In`
- **What this line does**: Checks if the session is authenticated; if not, performs a login using standard credentials.

##### Line 3: `# Step 1: Open a Checking Account`
- **What this line does**: **Comment**: "Step 1: Open a Checking Account" (This is a note in the code for developers, not an action).

##### Line 4: `Click Open New Account`
- **What this line does**: Clicks on the side menu option labeled 'Open New Account'.

##### Line 5: `Select Account Type    0`
- **What this line does**: Selects the account type as **Checking (Type 0)** from the dropdown menu.

##### Line 6: `Click Open Account Button`
- **What this line does**: Clicks the button to submit and open the new account.

##### Line 7: `${source_account}=    Get New Account Number`
- **What this line does**: Saves the result in a variable named `${source_account}` after performing: Reads and extracts the newly opened account number from the success confirmation page.

##### Line 8: `# Step 2: Open a Savings Account`
- **What this line does**: **Comment**: "Step 2: Open a Savings Account" (This is a note in the code for developers, not an action).

##### Line 9: `Click Open New Account`
- **What this line does**: Clicks on the side menu option labeled 'Open New Account'.

##### Line 10: `Select Account Type    1`
- **What this line does**: Selects the account type as **Savings (Type 1)** from the dropdown menu.

##### Line 11: `Click Open Account Button`
- **What this line does**: Clicks the button to submit and open the new account.

##### Line 12: `${destination_account}=    Get New Account Number`
- **What this line does**: Saves the result in a variable named `${destination_account}` after performing: Reads and extracts the newly opened account number from the success confirmation page.

##### Line 13: `# Step 3: Fetch starting balance of destination account via API`
- **What this line does**: **Comment**: "Step 3: Fetch starting balance of destination account via API" (This is a note in the code for developers, not an action).

##### Line 14: `${response_dest}=    Get Account Details    ${destination_account}`
- **What this line does**: Saves the result in a variable named `${response_dest}` after performing: Sends a GET request to the accounts API (`/accounts/${destination_account}`) to retrieve database details.

##### Line 15: `Verify Response Code    ${response_dest}    200`
- **What this line does**: Asserts that the HTTP response code of the object `${response_dest}` is exactly `200` (Success).

##### Line 16: `${dest_details}=    Set Variable    ${response_dest.json()}`
- **What this line does**: Saves the result in a variable named `${dest_details}` after performing: Assigns the value `${response_dest.json()}` to the target variable.

##### Line 17: `${starting_balance}=    Set Variable    ${dest_details['balance']}`
- **What this line does**: Saves the result in a variable named `${starting_balance}` after performing: Assigns the value `${dest_details['balance']}` to the target variable.

##### Line 18: `# Step 3: Transfer $25 to the new account from source account`
- **What this line does**: **Comment**: "Step 3: Transfer $25 to the new account from source account" (This is a note in the code for developers, not an action).

##### Line 19: `Click Transfer Funds`
- **What this line does**: Clicks on the side menu option labeled 'Transfer Funds'.

##### Line 20: `Enter Amount    25`
- **What this line does**: Enters the value `25` into the transfer amount text field.

##### Line 21: `Select From Account    ${source_account}`
- **What this line does**: Selects `${source_account}` from the source account ('From Account') dropdown menu.

##### Line 22: `Select To Account    ${destination_account}`
- **What this line does**: Selects `${destination_account}` from the destination account ('To Account') dropdown menu.

##### Line 23: `Click Transfer Button`
- **What this line does**: Clicks the 'Transfer' button to submit the fund transfer form.

##### Line 24: `Wait Until Page Contains    Transfer Complete!    10s`
- **What this line does**: Waits up to 10s for the webpage text to display 'Transfer Complete!'.

##### Line 25: `${expected}=    Evaluate    float(${starting_balance}) + 25`
- **What this line does**: Saves the result in a variable named `${expected}` after performing: Evaluates the Python mathematical expression `float(${starting_balance}) + 25` and calculates the result.

##### Line 26: `Wait Until Keyword Succeeds    10s    1s    Verify Account Balance    ${destination_account}    ${expected}`
- **What this line does**: Retries the keyword `Verify Account Balance ${destination_account} ${expected}` repeatedly for up to `10s`, waiting `1s` between retries, until it passes.


---

## Negative Tests

This section details all the test suites and test cases in the **Negative Tests** category.

### `TC-NEG-01 Login with Non Existent User`
- **Source Test File**: [negative/test_negative.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/tests/negative/test_negative.robot)
- **Test Suite Category**: `Negative Tests`
- **Objective**: Verify that logging in with a username that doesnt exist shows an error
- **Environment Lifecyle Configuration**:
  - **Suite Setup (Runs once per suite)**: `Load Environment`
  - **Test Setup (Runs before this test)**: `Open Application`
  - **Test Teardown (Runs after this test)**: `Close Application`
- **Tags**: `negative`, `UI`

#### 🗂️ Page Objects & Locators Integrated Usage:
- **Page Object File**: [negative.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/resources/pages/negative.robot)
  - Locators imported from: [variables/negative_locators.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/variables/negative_locators.robot)
    - `${login_username}` ➡️ `xpath=//input[@name="username"]`
    - `${login_password}` ➡️ `xpath=//input[@name="password"]`
    - `${login_button}` ➡️ `xpath=//input[@value="Log In"]`
    - `${error_message}` ➡️ `xpath=//p[@class="error"]`

#### Detailed Line-by-Line Execution Walkthrough:
##### Line 1: `Login With Invalid Credentials`
- **What this line does**: Enters a non-existent username and password into the login form and clicks submit.

##### Line 2: `Verify Login Error Is Shown`
- **What this line does**: Asserts that the UI displays a login error message indicating verification failed.


---

### `TC-NEG-02 Blank Transfer Amount`
- **Source Test File**: [negative/test_negative.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/tests/negative/test_negative.robot)
- **Test Suite Category**: `Negative Tests`
- **Objective**: Submit the transfer form without entering an amount and check for validation
- **Environment Lifecyle Configuration**:
  - **Suite Setup (Runs once per suite)**: `Load Environment`
  - **Test Setup (Runs before this test)**: `Open Application`
  - **Test Teardown (Runs after this test)**: `Close Application`
- **Tags**: `negative`, `UI`

#### 🗂️ Page Objects & Locators Integrated Usage:
- **Page Object File**: [login.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/resources/pages/login.robot)
  - Locators imported from: [variables/login_locators.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/variables/login_locators.robot)
    - `${login_username}` ➡️ `xpath=//input[@name="username"]`
    - `${login_password}` ➡️ `xpath=//input[@name="password"]`
    - `${login_button}` ➡️ `xpath=//input[@value="Log In"]`
- **Page Object File**: [negative.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/resources/pages/negative.robot)
  - Locators imported from: [variables/negative_locators.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/variables/negative_locators.robot)
    - `${transfer_funds_link}` ➡️ `xpath=//a[contains(@href,'transfer.htm')]`
    - `${transfer_from_dropdown}` ➡️ `id=fromAccountId`
    - `${transfer_to_dropdown}` ➡️ `id=toAccountId`
    - `${transfer_button}` ➡️ `xpath=//input[@value='Transfer']`

#### Detailed Line-by-Line Execution Walkthrough:
##### Line 1: `# Ensure User Is Logged In`
- **What this line does**: **Comment**: "Ensure User Is Logged In" (This is a note in the code for developers, not an action).

##### Line 2: `login    ${USER_ID}    ${USER_PWD}`
- **What this line does**: Logs in to the ParaBank web interface using username `${USER_ID}` and password `${USER_PWD}`.

##### Line 3: `Submit Blank Transfer Amount`
- **What this line does**: Submits the transfer funds form without entering any value in the amount field.

##### Line 4: `#    Verify Transfer Error Is Shown`
- **What this line does**: **Comment**: "Verify Transfer Error Is Shown" (This is a note in the code for developers, not an action).


---

### `TC-NEG-03 Transfer Negative Amount`
- **Source Test File**: [negative/test_negative.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/tests/negative/test_negative.robot)
- **Test Suite Category**: `Negative Tests`
- **Objective**: Enter -100 as transfer amount — app should reject it with an error
- **Environment Lifecyle Configuration**:
  - **Suite Setup (Runs once per suite)**: `Load Environment`
  - **Test Setup (Runs before this test)**: `Open Application`
  - **Test Teardown (Runs after this test)**: `Close Application`
- **Tags**: `negative`, `UI`, `known-bug`

#### 🗂️ Page Objects & Locators Integrated Usage:
- **Page Object File**: [login.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/resources/pages/login.robot)
  - Locators imported from: [variables/login_locators.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/variables/login_locators.robot)
    - `${login_username}` ➡️ `xpath=//input[@name="username"]`
    - `${login_password}` ➡️ `xpath=//input[@name="password"]`
    - `${login_button}` ➡️ `xpath=//input[@value="Log In"]`
- **Page Object File**: [negative.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/resources/pages/negative.robot)
  - Locators imported from: [variables/negative_locators.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/variables/negative_locators.robot)
    - `${transfer_funds_link}` ➡️ `xpath=//a[contains(@href,'transfer.htm')]`
    - `${transfer_from_dropdown}` ➡️ `id=fromAccountId`
    - `${transfer_to_dropdown}` ➡️ `id=toAccountId`
    - `${transfer_amount_input}` ➡️ `xpath=//input[@id='amount']`
    - `${transfer_button}` ➡️ `xpath=//input[@value='Transfer']`
    - `${error_message}` ➡️ `xpath=//p[@class="error"]`

#### Detailed Line-by-Line Execution Walkthrough:
##### Line 1: `...    NOTE: This test is expected to FAIL — ParaBank processes the transfer`
- **What this line does**: **Additional Arguments**: Passes `NOTE: This test is expected to FAIL — ParaBank processes the transfer` to the keyword on the previous line.

##### Line 2: `...    without showing any error (logged as DEF-001)`
- **What this line does**: **Additional Arguments**: Passes `without showing any error (logged as DEF-001)` to the keyword on the previous line.

##### Line 3: `# Ensure User Is Logged In`
- **What this line does**: **Comment**: "Ensure User Is Logged In" (This is a note in the code for developers, not an action).

##### Line 4: `login    ${USER_ID}    ${USER_PWD}`
- **What this line does**: Logs in to the ParaBank web interface using username `${USER_ID}` and password `${USER_PWD}`.

##### Line 5: `Submit Transfer With Negative Amount`
- **What this line does**: Enters a negative amount (e.g. `-100`) in the transfer form and clicks submit.

##### Line 6: `Verify Transfer Error Is Shown`
- **What this line does**: Asserts that the webpage displays a validation error blocking the invalid transfer.


---

### `TC-NEG-04 Transfer Amount Greater Than Balance`
- **Source Test File**: [negative/test_negative.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/tests/negative/test_negative.robot)
- **Test Suite Category**: `Negative Tests`
- **Objective**: Enter 999999 as amount — far more than any demo account holds
- **Environment Lifecyle Configuration**:
  - **Suite Setup (Runs once per suite)**: `Load Environment`
  - **Test Setup (Runs before this test)**: `Open Application`
  - **Test Teardown (Runs after this test)**: `Close Application`
- **Tags**: `negative`, `UI`, `known-bug`

#### 🗂️ Page Objects & Locators Integrated Usage:
- **Page Object File**: [login.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/resources/pages/login.robot)
  - Locators imported from: [variables/login_locators.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/variables/login_locators.robot)
    - `${login_username}` ➡️ `xpath=//input[@name="username"]`
    - `${login_password}` ➡️ `xpath=//input[@name="password"]`
    - `${login_button}` ➡️ `xpath=//input[@value="Log In"]`
- **Page Object File**: [negative.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/resources/pages/negative.robot)
  - Locators imported from: [variables/negative_locators.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/variables/negative_locators.robot)
    - `${transfer_funds_link}` ➡️ `xpath=//a[contains(@href,'transfer.htm')]`
    - `${transfer_from_dropdown}` ➡️ `id=fromAccountId`
    - `${transfer_to_dropdown}` ➡️ `id=toAccountId`
    - `${transfer_amount_input}` ➡️ `xpath=//input[@id='amount']`
    - `${transfer_button}` ➡️ `xpath=//input[@value='Transfer']`
    - `${error_message}` ➡️ `xpath=//p[@class="error"]`

#### Detailed Line-by-Line Execution Walkthrough:
##### Line 1: `...    NOTE: This test is expected to FAIL — ParaBank completes the transfer`
- **What this line does**: **Additional Arguments**: Passes `NOTE: This test is expected to FAIL — ParaBank completes the transfer` to the keyword on the previous line.

##### Line 2: `...    instead of blocking it (logged as DEF-002)`
- **What this line does**: **Additional Arguments**: Passes `instead of blocking it (logged as DEF-002)` to the keyword on the previous line.

##### Line 3: `# Ensure User Is Logged In`
- **What this line does**: **Comment**: "Ensure User Is Logged In" (This is a note in the code for developers, not an action).

##### Line 4: `login    ${USER_ID}    ${USER_PWD}`
- **What this line does**: Logs in to the ParaBank web interface using username `${USER_ID}` and password `${USER_PWD}`.

##### Line 5: `Submit Transfer With Amount Greater Than Balance`
- **What this line does**: Enters an amount larger than the account balance (e.g. `999999`) in the transfer form and clicks submit.

##### Line 6: `Verify Transfer Error Is Shown`
- **What this line does**: Asserts that the webpage displays a validation error blocking the invalid transfer.


---

### `TC-NEG-05 Invalid Account ID via API`
- **Source Test File**: [negative/test_negative.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/tests/negative/test_negative.robot)
- **Test Suite Category**: `Negative Tests`
- **Objective**: Call GET /accounts/000000 with a fake account ID — expect a 4xx response
- **Environment Lifecyle Configuration**:
  - **Suite Setup (Runs once per suite)**: `Load Environment`
  - **Test Setup (Runs before this test)**: `NONE`
  - **Test Teardown (Runs after this test)**: `NONE`
- **Tags**: `negative`, `API`

#### Detailed Line-by-Line Execution Walkthrough:
##### Line 1: `${auth}=    Create List    john    demo`
- **What this line does**: Saves the result in a variable named `${auth}` after performing: Creates a Robot Framework list containing the elements: `[john, demo]`.

##### Line 2: `Create Session    parabank    ${API_BASE}    auth=${auth}    verify=${False}`
- **What this line does**: Initializes an HTTP request session named `parabank` pointing to base URL `${API_BASE}` with options `auth=${auth} verify=${False}`.

##### Line 3: `${response}=    GET On Session    parabank    /accounts/000000`
- **What this line does**: Saves the result in a variable named `${response}` after performing: Sends a GET request to the URI endpoint `/accounts/000000` using the session `parabank` with options ``.

##### Line 4: `...    expected_status=any`
- **What this line does**: **Additional Arguments**: Passes `expected_status=any` to the keyword on the previous line.

##### Line 5: `Log To Console    Response status: ${response.status_code}`
- **What this line does**: Prints the message or value `Response status: ${response.status_code}` directly to the execution console.

##### Line 6: `Should Not Be Equal As Integers    ${response.status_code}    200`
- **What this line does**: Asserts that the integer `${response.status_code}` is NOT equal to `200`.


---

### `TC-NEG-06 Login API with Invalid Credentials`
- **Source Test File**: [negative/test_negative.robot](file:///C:/Users/hp5cd/OneDrive/Desktop/SPRINT-CAPGE/tests/negative/test_negative.robot)
- **Test Suite Category**: `Negative Tests`
- **Objective**: Call login API with wrong credentials — expect a non-200 response
- **Environment Lifecyle Configuration**:
  - **Suite Setup (Runs once per suite)**: `Load Environment`
  - **Test Setup (Runs before this test)**: `NONE`
  - **Test Teardown (Runs after this test)**: `NONE`
- **Tags**: `negative`, `API`

#### Detailed Line-by-Line Execution Walkthrough:
##### Line 1: `Create Session    parabank    ${API_BASE}    verify=${False}`
- **What this line does**: Initializes an HTTP request session named `parabank` pointing to base URL `${API_BASE}` with options `verify=${False}`.

##### Line 2: `${response}=    GET On Session    parabank    /login/baduser_xyz/wrongpass123`
- **What this line does**: Saves the result in a variable named `${response}` after performing: Sends a GET request to the URI endpoint `/login/baduser_xyz/wrongpass123` using the session `parabank` with options ``.

##### Line 3: `...    expected_status=any`
- **What this line does**: **Additional Arguments**: Passes `expected_status=any` to the keyword on the previous line.

##### Line 4: `Log To Console    Response status: ${response.status_code}`
- **What this line does**: Prints the message or value `Response status: ${response.status_code}` directly to the execution console.

##### Line 5: `Should Not Be Equal As Integers    ${response.status_code}    200`
- **What this line does**: Asserts that the integer `${response.status_code}` is NOT equal to `200`.


---
