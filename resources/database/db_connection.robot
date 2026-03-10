*** Settings ***
Library    DatabaseLibrary

*** Keywords ***
Connect to DatabaseLibrary
    Connect To Database
    ...    oracledb
    ...    ${DB_USER}
    ...    ${DB_PASSWORD}
    ...    ${DB_HOST}:${DB_PORT}/${DB_SERVICE}