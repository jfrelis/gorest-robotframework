*** Settings ***
Documentation    API test suite for GoRest Users API.
Library          Collections
Library          String
Resource         ../resources/common.robot
Resource         ../resources/keywords/users_keywords.robot

Suite Setup      Load Env

*** Test Cases ***
Scenario 1 - Create New User
    [Documentation]    Creates a new employee, validates the response, and deletes the created user during teardown.
    [Tags]    smoke    regression    create-user    positive
    [Teardown]    Delete Test User    ${user_id}

    ${response}=    Create Test User
    ${user_id}=    Get From Dictionary    ${response}    id

    Verify Created User Exists    ${user_id}
    Verify User ID Is Numerical    ${user_id}

Scenario 2 - Verify First User Status
    [Documentation]    Verifies that the status of the first user returned by the API is either active or inactive.
    [Tags]    smoke    regression    user-status    positive

    ${response}=    Get Users

    Status Should Be    200    ${response}
    ${users}=    Set Variable    ${response.json()}
    ${first_user}=    Get From List    ${users}    0
    ${status}=    Get From Dictionary    ${first_user}    status

    Verify User Status Is Valid    ${status}
