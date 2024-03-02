*** Settings ***
Library           RequestsLibrary


*** Keywords ***

Get Calculation JSON
    [Arguments]    ${num1}
    ${resp}=     GET    http://localhost:5000/is_prime/${num1}

    Should Be Equal    ${resp.status_code}    ${200}

    RETURN    ${resp.json()}


*** Test Cases ***

Test True When x is 1999

    ${resp}=     GET    http://localhost:5000/is_prime/1999

    ${json_resp}=    Set Variable  ${resp.json()}

    Should Be Equal    ${resp.status_code}    ${200}

    Should Be Equal    ${json_resp['result']}    ${True}

Test False When x is 100000

    ${resp}=     GET    http://localhost:5000/is_prime/100000

    ${json_resp}=    Set Variable  ${resp.json()}

    Should Be Equal    ${resp.status_code}    ${200}

    Should Be Equal    ${json_resp['result']}    ${False}

Test True When x is 151157

    ${resp}=     GET    http://localhost:5000/is_prime/151157

    ${json_resp}=    Set Variable  ${resp.json()}

    Should Be Equal    ${resp.status_code}    ${200}

    Should Be Equal    ${json_resp['result']}    ${True}

Test False When x is 0

    ${resp}=     GET    http://localhost:5000/is_prime/0

    ${json_resp}=    Set Variable  ${resp.json()}

    Should Be Equal    ${resp.status_code}    ${200}

    Should Be Equal    ${json_resp['result']}    ${False}

Test False When x is 1

    ${resp}=     GET    http://localhost:5000/is_prime/1

    ${json_resp}=    Set Variable  ${resp.json()}

    Should Be Equal    ${resp.status_code}    ${200}

    Should Be Equal    ${json_resp['result']}    ${False}