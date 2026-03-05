*** Settings ***
Resource    ../resources/Keywords/common.keywords.robot
Resource    ../resources/Keywords/field_service_keywords.robot
Resource    ../resources/keywords/login_details_keywords.robot
Resource    ../resources/config/global_variables.robot
Resource    ../resources/config/environment.robot

Suite Setup     Open BROWSER To Application
Suite Teardown  Close Application
Test Setup      Login To Salesforce

Documentation           New test suite
# You can change imported library to "QWeb" if testing generic web application, not Salesforce.
Library                 QForce 
Suite Setup             Open Browser    about:blank    chrom
Suite Teardown          Close All Browsers

*** Test Cases ***
    [Documentation]    Feature: Ability to add nurse

    Given user on a field Screen
    When user adds a nurse "CHA" with skill "ICU" starting "02/2/2026" ending "12/31/2026"
    Then nurse should be created successfully


*** Keywords ***
Given user on a field Screen
    Navigate to Field Screen

When user add a nurse "${Name}" with skill "${Skill}" starting "${StartDate}" ending "${EndDate}"
    Add 
    
