*** Settings ***
Library    QForce
Library    String
Resource    ../locators/field_service_locators.robot

            
*** Keywords *** ***
Given user landed on all service resource page
    VerifyText    ${automation}

When User verify and select automation resource
  VerifyText    ${automation}
  ClickText    ${automation}
  
And User scroll to related field
  ScrollTo   ${related_tab}

And User click on related tab
  ClickText    ${related_tab}

Then User verify Service resource skill is display
  VerifyText    ${service_resource_skill_button}       
# User select related tab
#   Click Element   xpath=//a[Contains(text()='Related')]
#    Wait Until Page Contains    Related
   
# User select new next to service resource skill
#   Click Element   xpath=//a[Contains(text()='Related')]
#    Wait Until Page Contains    Related
