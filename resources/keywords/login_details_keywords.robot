*** Settings ***
Library    SeleniumLibrary
Resource    ../config/environment.robot
Resource    ../config/global_variables.robot
Resource    ../locators/login_locators.robot


*** Keywords ***
Given user is logged in
    [Documentation]    Login To Salesforce
    Open Browser       ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Timeout         ${TIMEOUT}    
    Input Text                   ${USERNAME_FIELD}      ${USERNAME}
    Input Text                   ${PASSWORD_FIELD}      ${PASSWORD}
    Click Button                 ${LOGIN_BUTTON}
   
