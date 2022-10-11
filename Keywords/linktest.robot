*** Settings ***
Library    SeleniumLibrary

Resource    ../Keywords/setupteardown.robot

*** Keywords ***
list of links
    ${no_of_links}=    SeleniumLibrary.Get Element Count    class:tab
    ${links}=    SeleniumLibrary.Get All Links  
    ${links}=    Get WebElements    xpath://a   
    Log To Console    no of links=${no_of_links} 
    Log To Console    ${links}  
    FOR  ${i}  IN RANGE     1     ${no_of_links}+1
    ${link_text}=     Get Text    xpath:(//a)[${i}]
    Log To Console    link ${i} = ${link_text}
    END

    

