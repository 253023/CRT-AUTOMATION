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
  Log          Clicking Automation field
  
And User scroll to related field
  ScrollTo   ${related_tab}
  Log        Scrolling to Related tab
  Capture Page Screenshot

And User click on related tab
  ClickText    ${related_tab}
  Wait Until Page Contains    Service Resource Skill
  Log                        waiting for service resource skill tab display
  Capture Page Screenshot

Then User verify and select Service resource skill is display
  ClickText     ${Service_resource_skill_button}
  Log           clicking service skill button

And User verify and select new button display
  VerifyText     ${new_button}
  ClickText      ${new_button} 
  Log            verifying and select new skill button
