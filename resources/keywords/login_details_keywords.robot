*** Settings ***
Library      SeleniumLibrary
Library      OperatingSystem  
Library      CryptoLibrary
Resource     ../config/environment.robot
Resource     ../locators/login_locators.robot

*** Keywords ***
Login To Salesforce
    Wait Until Element Is Visible                ${USERNAME_FIELD}         20s
    Input Text                        ${USERNAME_FIELD}      ${USERNAME}
    Input Text                        ${PASSWORD_FIELD}      ${PASSWORD}
    Click Element                     xpath=//input[@id='Login']
   
    
    
# Logout from Salesforce
#     [Documentation]    Logout from Salesforce  and close Browser
#     Click Element      xpath=//span[Contains(@class,'photoContainer forceSocialPhoto')]
#     Sleep              1s
#     Click Element      xpath=//a[text()='Log Out']
#     Sleep              2s
#     Close Browser