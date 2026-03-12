*** Settings ***
Library    QForce
Library    String
Resource    ../locators/field_service_locators.robot

            
*** Keywords *** ***
${today}=    Get Current Date    result_format=%m/%d/%Y
${current_time}=    Get Current Date    result_format=%I:%M %p
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
  VerifyElement    ${service_resources}
  Click Element     ${service_resources}
  Log           clicking service skill button

And User verify and select new button display
  VerifyText     ${new_button}
  ClickText      ${new_button} 
  Log            verifying and select new skill button

And User enter new service resource skills fields
  ClickText    ${skill_set_field}
  Sleep        5s
  TypeText    ${skill_set_field}    QANS Supervisor
  TypeText     ${start_date}                   ${today}
  TypeText     ${start_time}                   ${current_time}
  Click Element      ${save_btn} 
  Log            All new skill resource filled up