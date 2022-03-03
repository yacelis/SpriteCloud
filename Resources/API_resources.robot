*** Settings ***
Library    String
Library    RequestsLibrary
Library    JSONLibrary
Library    DateTime

*** Variables ***
${pets_url}    https://petstore.swagger.io/v2/
${pet_payload}    {"category":{"id":1,"name":"category1"},"name":"dog","photoUrls":["https://a-z-animals.com/media/Poodle-Canis-familiaris-white.jpg"],"tags":[{"id":1,"name":"poodle"}],"status":"available"}
${user_payload}    {"username":"test_username","firstName":"firstname","lastName":"lastname","phone":"111111"}
${username}    test_username

*** Keywords ***
Create an API Session
    Create Session    pets    ${pets_url}

Send a POST request
    [Arguments]    ${endpoint}    ${body}
    ${HEADERS}    Create Dictionary    Content-Type=application/json    accept=application/json
    ${response}    POST On Session    pets   url=/${endpoint}    headers=${HEADERS}    data=${body}    expected_status=200
    Set Test Variable    ${response}

Send a DELETE request
    [Arguments]    ${endpoint}
    ${HEADERS}    Create Dictionary    Content-Type=application/json    accept=application/json
    ${response}    DELETE On Session    pets   url=/${endpoint}    headers=${HEADERS}    expected_status=200
    Set Test Variable    ${response}

Send a GET request
    [Arguments]    ${endpoint}
    ${HEADERS}    Create Dictionary    Content-Type=application/json    accept=application/json
    ${response}    GET On Session    pets   url=/${endpoint}    headers=${HEADERS}    expected_status=200
    Set Test Variable    ${response}

Get The Json Response Data
    [Arguments]    ${logs}=${response.content}
    ${response}    Evaluate     json.loads("""${logs}""")    json
    Set Test Variable    ${response}

Get attribute value
    [Arguments]    ${att}    ${source}=${response}
    ${att_value}    Get Value From Json    ${source}   ${att}
    ${att_value}    Convert To String    ${att_value}
    ${att_value}    Remove String    ${att_value}    [   '   ]
    [Return]    ${att_value}

Create a pet
    [Arguments]    ${endpoint}=pet    ${body}=${pet_payload}
    Send a POST request    ${endpoint}    ${body}
    Log    ${response.content}
    Get The Json Response Data

Delete a pet
    [Arguments]    ${id}=${pet_id}
    Wait Until Keyword Succeeds    1 min    5s    Send a DELETE request    pet/${id}
    Log    ${response.content}
    Get The Json Response Data
    ${response_message}    Get attribute value    $.message
    Should Be Equal    ${response_message}    ${pet_id}

Get a pet
    [Arguments]    ${id}=${pet_id}
    Wait Until Keyword Succeeds    1 min    5s    Send a GET request    pet/${id}
    Log    ${response.content}
    Get The Json Response Data

Get the actual date
    ${actual_date}    Get Current Date    exclude_millis=yes
    ${actual_date}    Convert Date    ${actual_date}    result_format=%Y-%m-%d
    Set Test Variable    ${actual_date}

Order a pet
    [Arguments]    ${body}={"petId":123,"quantity":1,"shipDate":"${actual_date}"}
    Send a POST request    store/order    ${body}
    Log    ${response.content}
    Get The Json Response Data

Get a pet order
    [Arguments]    ${order_id}
    Wait Until Keyword Succeeds    1 min    5s    Send a GET request    store/order/${order_id}
    Log    ${response.content}
    Get The Json Response Data

Delete a pet order
    [Arguments]    ${order_id}=${order_id}
    Wait Until Keyword Succeeds    1 min    5s    Send a DELETE request    store/order/${order_id}
    Log    ${response.content}
    Get The Json Response Data
    ${response_message}    Get attribute value    $.message
    Should Be Equal    ${response_message}    ${order_id}

Create a user
    Send a POST request    user    ${user_payload}
    Log    ${response.content}
    Get The Json Response Data

Get a user
    [Arguments]    ${username}=${username}
    Wait Until Keyword Succeeds    1 min    5s    Send a GET request    user/${username}
    Log    ${response.content}
    Get The Json Response Data

Delete a user
    [Arguments]    ${username}=${username}
    Wait Until Keyword Succeeds    1 min    5s    Send a DELETE request    user/${username}
    Log    ${response.content}
    Get The Json Response Data
    ${response_message}    Get attribute value    $.message
    Should Be Equal    ${response_message}    ${username}
