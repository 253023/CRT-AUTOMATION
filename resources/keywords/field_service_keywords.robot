*** Settings ***
Library    QForce
Library    String
Library    SeleniumLibrary
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
  Wait Until Page Contains    Service Resource Skill

Then User verify and select Service resource skill is display
  VerifyText    ${service_resource_skill_button}
  ClickText     ${Service_resource_skill_button}

And User verify and select new button display
  VerifyText     ${new_button}
  ClickText      ${new_button} 
