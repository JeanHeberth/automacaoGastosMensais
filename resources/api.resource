*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${BASE_URL}    %{BASE_URL}
${USUARIOS_PATH}    /gastos-mensais/gastos

*** Keywords ***
Criar Sessao API
    [Arguments]    ${verify}=${True}
    Create Session    api    ${BASE_URL}    verify=${verify}