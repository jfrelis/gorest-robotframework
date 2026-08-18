*** Settings ***
Library        Collections
Library        String
Resource       ../api/users_api.robot

*** Keywords ***
Create Test User
    ${timestamp}=    Get Time    epoch
    ${email}=    Set Variable    test_${timestamp}@example.com
    ${user}=    Create Dictionary    name=Jonathan Test    gender=male    email=${email}    status=active
    ${response}=    Create User    ${user}

    RETURN    ${response}

Delete Test User
    [Arguments]    ${user_id}
    Delete User By ID    ${user_id} 

Verify Created User Exists
    [Arguments]    ${user_id}
    ${response}=    Get User By ID    ${user_id}
    ${response_id}=    Get From Dictionary    ${response.json()}    id

    Should Be Equal As Integers    ${response_id}    ${user_id}

Verify User ID Is Numerical
    [Arguments]    ${user_id}
    Should Be True    isinstance(${user_id}, int)

Verify User Status Is Valid
    [Arguments]    ${status}
    Should Be True    '${status}' in ['active', 'inactive']
