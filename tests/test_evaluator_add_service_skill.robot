*** Settings ***
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


*** Keywords ***
Given user on a field Screen
    Given user Navigate to Field Screen 

When user select Automation
    When User select automation tab 
    
