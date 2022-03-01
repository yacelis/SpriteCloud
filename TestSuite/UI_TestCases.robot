*** Settings ***
Resource    ../Resources/UI_resources.robot

Test Setup    Go to the site
Test Teardown    Close Browser

*** Test Cases ***
Go to the site and verify the content is correct
    [tags]    id=1
    Page Should Contain Element    ${menu_logo}
    Page Should Contain Element    ${menu_home}
    Page Should Contain Element    ${menu_resources}
    Page Should Contain Element    ${page_title}
    Page Should Contain Element    ${rubik_image}
    Page Should Contain Element    ${page_title}
    Verify all the options are displayed

Verify the headers functionality
    [tags]    id=2
    Select an option    ${menu_resources}
    ${url}    Get Location
    Should Be Equal    ${url}    ${ui_test_url}resources
    Verify the resources content
    Select an option    ${menu_logo}
    ${url}    Get Location
    Should Be Equal    ${url}    ${ui_test_url}
    Page Should Contain Element    ${rubik_image}
    Select an option    ${menu_home}
    ${url}    Get Location
    Should Be Equal    ${url}    ${ui_test_url}home
    Page Should Contain Element    ${rubik_image}

Try the Mouse Over option
    [tags]    id=3
    ${value}    Generate a Number
    Select an option    ${mouse_over_option}
    Repeat Keyword    ${value} times    Click element    ${click_me_button}
    Page Should Contain Element    //*[@id="clickCount"][contains(text(),'${value}')]

Verify the mobile menu
    [tags]    id=4
    Set Window Size    400  855
    Select an option    ${mobile_menu}
    Page Should Contain Element    ${menu_home}
    Page Should Contain Element    ${menu_resources}
    Select an option    ${menu_resources}
    Page Should Contain Element    ${mobile_menu}
