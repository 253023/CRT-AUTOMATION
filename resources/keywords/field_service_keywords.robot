*** Settings ***
Library    QForce
Library    String
Resource    ../locators/field_service_locators.robot

            
*** Keywords *** ***
Given user Navigate to Field Screen 
    ClickText    ${automation}

When User select automation tab
  ClickText    ${related_tab}
  
  
And User select resource from list
  Click Element   ${drop_down_option}
  Wait Until Page Contains    Automation

And Scoll to Element
  Scroll Element into View    ${related_tab}
   
# User select related tab
#   Click Element   xpath=//a[Contains(text()='Related')]
#    Wait Until Page Contains    Related
   
# User select new next to service resource skill
#   Click Element   xpath=//a[Contains(text()='Related')]
#    Wait Until Page Contains    Related
