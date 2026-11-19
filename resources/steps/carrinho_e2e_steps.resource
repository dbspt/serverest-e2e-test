*** Settings ***
Library    SeleniumLibrary
Resource   ../services/usuarios_service.resource

*** Keywords ***
que existe um cliente
    ${cliente} =        Buscar um cliente aleatório na API
    Log                 Cliente sorteado: ${cliente}
    Set Test Variable   ${CLIENTE}        ${cliente}

que existe um produto disponível
    ${produto} =        Buscar um produto aleatório em estoque na API
    Log                 Produto escolhido: ${produto}
    Set Test Variable   ${PRODUTO}         ${produto}
