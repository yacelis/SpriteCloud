*** Settings ***
Resource    ../Resources/API_resources.robot

Suite Setup    Create an API Session

*** Test Cases ***
Verify a pet can be created
    [Tags]    id=5
    Create a pet
    ${pet_id}    Get attribute value    $.id
    ${pet_name}    Get attribute value    $.name
    ${pet_tag_name}    Get attribute value    $.tags..name
    Should Be Equal    ${pet_name}    dog
    Should Be Equal    ${pet_tag_name}    poodle
    Set Test Variable    ${pet_id}
    [Teardown]    Delete a pet

Verify a created pet can be get by the id
    [Tags]    id=6
    [Setup]    Create a pet
    ${pet_id}    Get attribute value    $.id
    Set Test Variable    ${pet_id}
    Get a pet
    ${returned_id}    Get attribute value    $.id
    Should Be Equal    ${returned_id}    ${pet_id}
    ${pet_tag_name}    Get attribute value    $.tags..name
    IF    '${pet_tag_name}' == 'poodle'
        Pass Execution    The retrieved data is correct
    ELSE
        Fail    The retrieved data is incorrect
    END
    [Teardown]    Delete a pet
    
Verify a pet order can be placed
    [Tags]    id=7
    Get the actual date
    Order a pet
    ${order_id}    Get attribute value    $.id
    Set Test Variable    ${order_id}
    ${pet_id}    Get attribute value    $.petId
    Should Be Equal    ${pet_id}    123
    ${pet_quantity}    Get attribute value    $.quantity
    Should Be Equal    ${pet_quantity}    1
    ${ship_date}    Get attribute value    $.shipDate
    Should Contain     ${ship_date}    ${actual_date}
    [Teardown]    Delete a pet order

Verify a pet order can be retrieved using the order id
    [Tags]    id=8
    Get the actual date
    Order a pet
    ${order_id}    Get attribute value    $.id
    Set Test Variable    ${order_id}
    Get a pet order    ${order_id}
    ${id}    Get attribute value    $.id
    Should Be Equal    ${id}    ${order_id}
    ${pet_id}    Get attribute value    $.petId
    #Should Be Equal    ${pet_id}    123
    IF    '${pet_id}' == '123'
        Pass Execution    The retrieved data is correct
    ELSE
        Fail    The retrieved data is incorrect
    END
    [Teardown]    Delete a pet order

Verify a user can be created
    [Tags]    id=9
    Create a user
    ${message}    Get attribute value    $.message
    Should Not Be Empty    ${message}
    [Teardown]    Delete a user

Verify a created user can be get with the id
    [Tags]    id=10
    [Setup]    Create a user
    ${user_id}    Get attribute value    $.id
    Set Test Variable    ${user_id}
    Get a user
    ${response_username}    Get attribute value    $.username
    Should Be Equal    ${response_username}    ${username}
    [Teardown]    Delete a user
