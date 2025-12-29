*** Settings ***
Resource    ../../../resources/api.resource
Resource    ../../../resources/auth.resource
Library     Collections

*** Test Cases ***
Deve listar todos os gastos para usuario autenticado
    Criar Sessao API
    ${headers}=    Headers Autorizados JSON
    ${resposta}=    GET On Session    api    ${USUARIOS_PATH}    headers=${headers}
    Status Should Be    200    ${resposta}
