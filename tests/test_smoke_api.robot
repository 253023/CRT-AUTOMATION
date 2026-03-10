*** Settings ***
Library                         RequestsLibrary
Resource    ../resources/database/db_keywords.robot

*** Variables ***
${BASE_URL}                      https://nyiap-external-qa.gw.mars-nonprod.com/nyiap-consumer
# @{CLIENTS}    21213370    20959407

                   
*** Test Cases ***
Process    Clients
    @{all_clients}=    Get Client IDs from DB
    FOR            ${client_id}    IN    @{all_clients}
        Log        Processing Client ${client_id}
    END
    ${CLIENTS}=    Create List     ${client_id[0]}    ${client_id[1]}
    Set Suite Variable          ${CLIENTS}

AC 3: Accept valid request and return HTTP 200 Accepted

    [Documentation]             Validate POST prepareConsumerData returns HTTP 200 Accepted
    Given the client wants to prepare consumer data
    When the API is called for each client in the list
    And the response status should be 200
    Then response should include: message, statusCd, processedCount, successes array, failures array

*** Keywords ***

Given the client wants to prepare consumer data
    Log    Starting prepare consumer API test
    
When the API is called for each client in the list
    &{query_params}=    Create Dictionary
    ...                 grant_type=client_credentials
    
    &{body}=    Create Dictionary
    ...                 client_id=${CLIENT_ID}
    ...                 client_secret=${CLIENT_SECRET}
    &{headers}=       Create Dictionary
    ...                Content-Type=application/x-www-form-urlencoded
    ...                 User-Agent=Copado


    Create Session    auth_session    ${AUTH_URL}    verify=False
    ${auth_response}=          POST On Session
    ...                        alias=auth_session
    ...                        url=${TOKEN_PATH}
    ...                        data=${body}
    ...                        headers=${headers}
    ...                        params=${query_params}
    ...                        expected_status=200
   
    ${ACCESS_TOKEN}=           Evaluate    json.loads('''${auth_response.content}''')['access_token']    modules=json  
    Should Not Be Empty        ${ACCESS_TOKEN}      Failed to retrieve access token
      Set Suite Variable         ${ACCESS_TOKEN}

    Log To Console             OAuth token generated: ${ACCESS_TOKEN}

And the response status should be 200
    &{api_headers}=       Create Dictionary   
    ...                   Authorization=Bearer ${ACCESS_TOKEN}
    ...                   Content-Type=application/json
    ...                   User-Agent=Copado     
    Create Session        api_session    ${BASE_URL}    verify=False
    Log To Console              Calling API for client ${CLIENTS}
    ${body}=                    Create Dictionary
    ...                        clients=${CLIENTS}
    ...                        requestType=prepare         
    ${response}=              POST On Session
    ...                       alias=api_session
    ...                       url=${API_ENDPOINT}
    ...                       headers=${api_headers}
    ...                       json=${body}
    
    Set Suite Variable    ${LAST_REPONSE}    ${response}
      
    Should Be Equal As Integers                    ${LAST_REPONSE.status_code}    200
    Log To Console                        ${LAST_REPONSE.content}
Then response should include: message, statusCd, processedCount, successes array, failures array    
    ${resp_json}=    Set Variable          ${LAST_REPONSE.json()}
    
    Length Should Be                       ${resp_json}[successes]    2

    Should Be Equal                 ${resp_json['message']}    Success
    ${status_cd}=                   Convert To Integer      ${resp_json}[statusCd]
    Should Be Equal As Integers     ${status_cd}            200
   
    ${processed}=                   Convert To Integer         ${resp_json['processedCount']}
    Should Be Equal As Integers     ${processed}               2
    Log To Console                  ${LAST_REPONSE}