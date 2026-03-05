*** Settings ***

Library    SeleniumLibrary
Resource    ../config/global_variables.robot
Resource    ../config/environment.robot

*** Keywords ***

Open BROWSER To Application
    Open Browser    ${URL}    ${BROWSER}
    Set Selenium TIMEOUT      ${TIMEOUT}

Close Application
    Close BROWSER
