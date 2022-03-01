*** Settings ***
Library    String
Library    RequestsLibrary

*** Variables ***
${pets_url}    petstore.swagger.io/v2


*** Keywords ***
Create an API Session
    Create Session    pets    ${pets_url}

