*** Settings ***
Library                    SeleniumLibrary
Resource                   ../locators/field_service_locators.robot

# You can change imported library to "QWeb" if testing generic web application, not Salesforce.
            
*** Keywords *** ***
Navigate to Field Screen
    Click Element    ${field_service_tab}

User select service resource Tab
   Click Element    ${service_resources}
  Wait Until Page Contains    Service Resources
  
User select resource from list
  Click Element   ${drop_down_option}
   Wait Until Page Contains    Automation

Scoll to Element
  Scroll Element into View    ${related_tab}
   
# User select related tab
#   Click Element   xpath=//a[Contains(text()='Related')]
#    Wait Until Page Contains    Related
   
# User select new next to service resource skill
#   Click Element   xpath=//a[Contains(text()='Related')]
#    Wait Until Page Contains    Related
