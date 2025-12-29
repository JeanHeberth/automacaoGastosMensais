*** Settings ***
Resource    ../../../resources/api.resource
Resource    ../../../resources/auth.resource

*** Test Cases ***
Não deve listar os gastos sem token
    Criar Sessao API
    ${resposta}=     GET On Session
    ...              api
    ...              ${USUARIOS_PATH}
    ...              expected_status=403

    Should Be Equal As Integers     ${resposta.status_code}    403