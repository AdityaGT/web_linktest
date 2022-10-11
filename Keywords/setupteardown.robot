*** Settings ***
Library    SeleniumLibrary
Resource    ../variables/url.robot
*** Keywords ***
Setup
    Open Browser    ${demoshop}     chrome
    SeleniumLibrary.Maximize Browser Window
    SeleniumLibrary.Set Selenium Timeout    25s
Teardown
    #Sleep    3s
    Close Browser