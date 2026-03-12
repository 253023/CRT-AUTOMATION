*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/keywords/common.keywords.robot
Resource    ../resources/keywords/field_service_keywords.robot
Resource    ../resources/keywords/login_details_keywords.robot
Resource    ../resources/config/global_variables.robot
Resource    ../resources/config/environment.robot


Suite Setup   Login To Salesforce
Suite Teardown    Close Browser


*** Test Cases ***
Add Nurse Test
    Given user landed on all service resource page
    When User verify and select automation resource
    And user scroll to related field
    And User click on related tab display
    Then user verify and select service resource skill is display
    And User verify and select new button display
    And User fill up new service skill resource


*** Keywords ***


Given user on a field Screen
     Given user landed on all service resource page

When user select Automation
    When User verify and select automation resource

And user scroll down to related field
    And user scroll to related field

And user click on related tab display
    And User click on related tab
   
Then user verify and select service resource skill
    Then user verify and select service resource skill is display

And user verify and select new new_button
    And User verify and select new button display

And User fill up new service skill resource
    And User enter new service resource skills fields
