*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${LOGIN_PATH}    /gastos-mensais/auth/login

${EMAIL}         %{EMAIL}
${SENHA}         %{SENHA}

${TOKEN}         ${None}

*** Keywords ***
Gerar Token
    Create Session    auth_session    ${BASE_URL}

    ${headers}=    Create Dictionary
    ...    Content-Type=application/json
    ...    Accept=application/json

    ${body}=    Create Dictionary
    ...    email=${EMAIL}
    ...    senha=${SENHA}

    ${res}=    POST On Session
    ...    auth_session
    ...    ${LOGIN_PATH}
    ...    json=${body}
    ...    headers=${headers}
    ...    expected_status=anything


    Should Be Equal As Integers    ${res.status_code}    200

    ${json}=     Set Variable    ${res.json()}
    ${token}=    Set Variable    ${json["token"]}

    Set Suite Variable    ${TOKEN}    Bearer ${token}

Garantir Token
    Run Keyword If    '${TOKEN}' == '${None}'    Gerar Token

Headers Autorizados JSON
    Garantir Token
    ${headers}=    Create Dictionary
    ...    Content-Type=application/json
    ...    Authorization=${TOKEN}
    RETURN    ${headers}
