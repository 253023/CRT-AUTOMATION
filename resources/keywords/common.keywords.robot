*** Settings ***

Library    SeleniumLibrary
Resource    ../config/global_variables.robot
Resource    ../config/environment.robot

*** Keywords ***

Open Browser To Application
    Open Browser    ${URL}    ${BROWSER}

Close Application
    Close BROWSER
