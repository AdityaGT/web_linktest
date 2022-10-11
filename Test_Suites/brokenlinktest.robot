** Settings ***
Library    Collections
Library    RequestsLibrary
Library    SeleniumLibrary
Library    String

Resource    ../Keywords/setupteardown.robot
Resource    ../Keywords/linktest.robot

Task Setup    setupteardown.Setup
Test Teardown    setupteardown.Teardown

*** Test Cases ***
Broken links test
    linktest.list of links
    ${base_url}=   Get Location
    ${element_list}=     get webelements     xpath=//a
    ${href_list}=  Evaluate  [item.get_attribute('href') for item in $element_list]
    Log    ${href_list}

    Create Session    testing    ${base_url}
    FOR    ${element_href}    IN    @{href_list}
        ${url}=    Remove String    ${element_href}    ${base_url}
        ${contains_base_url}=    Evaluate     "${base_url}" in "${element_href}"
        ${response}=    Run Keyword If    ${contains_base_url}    Get Request    testing    ${url}
        Run Keyword If    ${contains_base_url}    Should Be Equal As Strings     ${response.status_code}    200
    END
    

    