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
  Sleep        5s

  
And User scroll to related field
  ScrollTo   ${related_tab}
  Log        Scrolling to Related tab
  Sleep      5s
  ScrollTo   ${related_tab}


And User click on related tab
  Click Element    ${related_tab}
  Log                        waiting for service resource skill tab display
  Sleep                      5s
 

Then User verify and select Service resource skill is display
  Click Element     ${Service_resource_skill_button}
  Log           clicking service skill button

And User verify and select new button display
  VerifyText     ${new_button}
  ClickText      ${new_button} 
  Log            verifying and select new skill button
