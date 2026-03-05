*** Settings ***

Library    SeleniumLibrary
Resource    ../config/global_variables.robot
Resource    ../config/environment.robot

*** Keywords ***

Open BROWSER To Application
    Open Browser    ${URL}    ${BROWSER}

Close Application
    Close BROWSER
