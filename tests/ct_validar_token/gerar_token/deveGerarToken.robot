*** Settings ***
Resource    ../../../resources/auth.resource
Resource    ../../../resources/api.resource


*** Test Cases ***
Deve gerar token valido
    Gerar Token
    Log To Console    Token gerado: ${TOKEN}
    Should Not Be Empty    ${TOKEN}
