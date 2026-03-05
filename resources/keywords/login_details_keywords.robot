*** Settings ***
Library    SeleniumLibrary
Library    QForce
Resource    ../config/environment.robot
Resource    ../config/global_variables.robot
Resource    ../locators/login_locators.robot


*** Keywords ***
Login To Salesforce
    [Documentation]    Open browser and log in To Salesforce
    Open Browser       ${URL}    ${BROWSER}
    # Maximize Browser Window
    # Set Selenium Timeout         ${TIMEOUT}    
    Input Text         ${USERNAME_FIELD}      ${USERNAME}
    Input Text         ${PASSWORD_FIELD}      ${PASSWORD}
    Click Button       ${LOGIN_BUTTON}
   
