*** Settings ***
Library    DateTime
Library    QForce
Library    String
Resource    ../locators/field_service_locators.robot
Resource    ../config/global_variables.robot

            
*** Keywords *** 
  
Given user landed on all service resource page
    ClickText    ${service_resource_tab}
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
   ${row_count}=     Get Element Count    ${service_resource_skill_table_rows}
  IF                $row_count == 0:
       Log           No skill present in table
       Pass Execution                     No records found
  END
  FOR                        ${i}                 IN RANGE    1    ${row_count}+1
        ${skill_display}=      Get Text
        ...                    xpath='//table//tbody/tr)[${i}]//td[1]'
        IF                     '${skill_display}'== '${skill_name}'

            Log                    Skill record found...deleting
            Click Element          ${action_icon}
            Click Element          ${delete_dorp_down_option}
            Click Element          ${delete_action}
            Sleep                  2s
            Exit For Loop
        END
    END
    Log                        All added skill deleted         
  Log           clicking service skill button

And User verify and select new button display
  VerifyText     ${new_button}
  ClickText      ${new_button} 
  Log            verifying and select new skill button

And User enter new service resource skills fields
  ${today}=    Get Current Date    result_format=%m/%d/%Y
  ${current_time}=    Get Current Date    result_format=%I:%M %p

  ClickText    ${skill_set_field}
  Sleep        5s
  TypeText    ${skill_set_field}    QANS
  ClickText    ${skill_set_field}
  ClickText    ${skill_name}
  TypeText    ${start_date}        ${today}
  # ${start_time_field}=             Get Field Value    ${start_time}
  # Should Not Be Empty              ${start_time_field}    msg=Start time should be auto-pupulated
  Click Element      ${save_btn} 
  Log            All new skill resource filled up

Then user successfully validate new skill added and delete
    VerifyElement    ${service_resource_created_message}
    Log                        Skill added successfully
    
     
