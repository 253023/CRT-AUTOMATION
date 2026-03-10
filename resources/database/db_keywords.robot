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

    FOR          ${row}    IN     @{rows}
        ${client}=             Set Variable    ${row}[0]
        Call Client API        ${client}
    END