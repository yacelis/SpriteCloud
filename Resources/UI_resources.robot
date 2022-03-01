*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    String

*** Variables ***
${BROWSER_TYPE}   chrome
${ui_test_url}    http://www.uitestingplayground.com/
${page_title}    //h1[@id="title"][contains(text(),'UI Test Automation')]
${menu_logo}    //a[@class="navbar-brand"][contains(text(),'UITAP')]
${menu_home}    //a[@class="nav-link"][contains(text(),'Home')]
${menu_resources}    //a[@class="nav-link"][contains(text(),'Resources')]
${rubik_image}    //img[@class="img-fluid"][@src="/static/cube.png"]
${dynamic_id_option}    //a[contains(text(),'Dynamic ID')]
${class_attribute_option}    //a[contains(text(),'Class Attribute')]
${hidden_layers_option}    //a[contains(text(),'Hidden Layers')]
${load_delay_option}    //a[contains(text(),'Load Delay')]
${ajax_data_option}    //a[contains(text(),'AJAX Data')]
${client_side_delay_option}    //a[contains(text(),'Client Side Delay')]
${click_option}    //a[contains(text(),'Click')]
${text_input_option}    //a[contains(text(),'Text Input')]
${scrollsbars_option}    //a[contains(text(),'Scrollbars')]
${dynamic_table_option}    //a[contains(text(),'Dynamic Table')]
${verify_text_option}    //a[contains(text(),'Verify Text')]
${progress_bar_option}    //a[contains(text(),'Progress Bar')]
${visibility_option}    //a[contains(text(),'Visibility')]
${sample_app_option}    //a[contains(text(),'Sample App')]
${mouse_over_option}    //*[@href="/mouseover"][contains(text(),'Mouse Over')]
${non_breaking_space_option}    //a[contains(text(),'Non-Breaking Space')]
${overlapped_element_option}    //a[contains(text(),'Overlapped Element')]
${resources_title}    //h3[contains(text(),'Resources')]
${learning_title}    //h4[contains(text(),'Learning')]
${standards_title}    //h4[contains(text(),'Standards')]
${articles_title}    //h4[contains(text(),'Articles')]
${community_title}    //h4[contains(text(),'Community')]
${click_me_button}    //a[contains(text(),'Click me')]
${mobile_menu}    //button[@class="navbar-toggler"]

*** Keywords ***
Launch Browser
    [Arguments]    ${url}
    ${chrome_options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}   add_argument    --headless
    Call Method    ${chrome_options}   add_argument    --no-sandbox
    Call Method    ${chrome_options}   add_argument    --disable-setuid-sandbox
    Call Method    ${chrome_options}   add_argument    --disable-dev-shm-usage
    Call Method    ${chrome_options}   add_argument    --disable-extensions
    Call Method    ${chrome_options}   add_argument    --disable-gpu
    Open Browser    ${url}  browser=${BROWSER_TYPE}    options=${chrome_options}
    Set Window Size    1541  942

Go to the site
    Launch Browser    ${ui_test_url}

Generate a Number
    ${number}    Generate Random String    1    [NUMBERS]
    ${number}    Set Variable    ${number}
    [Return]    ${number}

Verify all the options are displayed
    @{total_options}    Create List    ${dynamic_id_option}  ${class_attribute_option}  ${hidden_layers_option}  ${load_delay_option}  ${ajax_data_option}  ${client_side_delay_option}  ${click_option}  ${text_input_option}  ${scrollsbars_option}  ${dynamic_table_option}  ${verify_text_option}  ${progress_bar_option}  ${visibility_option}  ${sample_app_option}  ${mouse_over_option}  ${non_breaking_space_option}  ${overlapped_element_option}
    FOR    ${option}    IN    ${total_options}
    Page Should Contain Element    ${option}
    END

Select an option
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}
    Click Element    ${element}

Verify the resources content
    Page Should Contain Element    ${resources_title}
    Page Should Contain Element    ${learning_title}
    Page Should Contain Element    ${standards_title}
    Page Should Contain Element    ${articles_title}
    Page Should Contain Element    ${community_title}
