*** Settings ***
Library        RequestsLibrary
Resource       ../variables/variables.robot

*** Keywords ***
Create User
    [Arguments]    ${user_data}
    ${headers}=    Create Dictionary    Content-Type=application/json    Accept=application/json    Authorization=Bearer ${ACCESS_TOKEN}    expected_status=201
    ${response}=   POST    ${BASE_URL}${USERS_ENDPOINT}    json=${user_data}    headers=${headers}

    RETURN    ${response.json()}

Get Users
    ${response}=    GET    ${BASE_URL}${USERS_ENDPOINT}    expected_status=200
    
    RETURN    ${response}

Get User By ID
    [Arguments]    ${user_id}
    ${headers}=    Create Dictionary    Accept=application/json    Authorization=Bearer ${ACCESS_TOKEN}
    ${response}=   GET    ${BASE_URL}${USERS_ENDPOINT}/${user_id}    headers=${headers}

    RETURN    ${response}

Delete User By ID
    [Arguments]    ${user_id}
    ${headers}=    Create Dictionary    Accept=application/json    Authorization=Bearer ${ACCESS_TOKEN}
    ${response}=   DELETE    ${BASE_URL}${USERS_ENDPOINT}/${user_id}    headers=${headers}    expected_status=204
