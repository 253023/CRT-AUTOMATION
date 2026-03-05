*** Settings ***
Library    SeleniumLibrary
Library    QForce
Library    String
Resource    ../config/environment.robot
Resource    ../config/global_variables.robot
Resource    ../locators/login_locators.robot


*** Keywords ***
Login To Salesforce
    [Documentation]    Open browser and log in To Salesforce
    Open Browser       ${URL}    ${BROWSER}
    # Maximize Browser Window
    # Set Selenium Timeout         ${TIMEOUT}    
    TypeText           ${USERNAME_FIELD}      ${USERNAME}
    TypeSecret         ${PASSWORD_FIELD}      ${PASSWORD}
    ClickText          ${LOGIN_BUTTON}
   
