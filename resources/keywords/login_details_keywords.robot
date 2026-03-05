*** Settings ***
Library      SeleniumLibrary
Library      OperatingSystem  
Resource     ../config/environment.robot
Resource     ../config/global_variables.robot
Resource     ../locators/login_locators.robot


*** Keywords ***
Login To Salesforce
    Open Browser    ${URL}    ${BROWSER}    
    Input Text                ${USERNAME_FIELD}      ${USERNAME}
    Input Text                ${PASSWORD_FIELD}      ${PASSWORD}
    Click Button              ${LOGIN_BUTTON}
   
    
    
# Logout from Salesforce
#     [Documentation]    Logout from Salesforce  and close Browser
#     Click Element      xpath=//span[Contains(@class,'photoContainer forceSocialPhoto')]
#     Sleep              1s
#     Click Element      xpath=//a[text()='Log Out']
#     Sleep              2s
#     Close Browser