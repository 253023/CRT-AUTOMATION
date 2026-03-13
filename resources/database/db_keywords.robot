*** Settings ***
Resource    db_connection.robot
Library    Collections
Library    BuiltIn

*** Keywords ***
Get Client IDs from DB
    Connect to DatabaseLibrary
    ${rows}=    Query    
    ...         SELECT client_id from client_supplementary_info
    ...          ORDER BY DBMS_RANDOM.VALUE
    ...          FETCH FIRST 2 ROWS ONLY
    Log To Console    ${rows}
    [RETURN]          ${rows}