*** Settings ***
Resource    ../../../resources/api.resource
Resource    ../../../resources/auth.resource
Library    Collections

*** Test Cases ***
Deve retornar quantos itens tem na lista

    Criar Sessao API

    ${headers}=    Headers Autorizados JSON
    ${resposta}=    GET On Session
    ...             api
    ...             ${USUARIOS_PATH}
    ...             headers=${headers}


    Status Should Be    200    ${resposta}

    ${json}=          Set Variable    ${resposta.json()}

    ${quantidade}=    Get Length    ${json}

    Log To Console    Quantidade de itens: ${quantidade}

    Should Be True    ${quantidade} > 0