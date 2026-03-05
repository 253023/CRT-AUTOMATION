*** Settings ***
Library      SeleniumLibrary
Library      OperatingSystem  
Resource     ../config/environment.robot
Resource     ../locators/login_locators.robot

*** Keywords ***
Login To Salesforce
    ${PASSWORD}=    Get Variable Value    %{SALESFORCE_PASSWORD}
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