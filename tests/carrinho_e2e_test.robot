language: pt-br

*** Configurações ***
Documentação    Buscar um cliente e um produto via API, realizar o login no sistema, buscar o produto  
...    e adicioná-lo ao carrinho via tela. Ao final, validamos que o produto foi adicionado ao carrinho 
...    com sucesso via API.

Biblioteca    SeleniumLibrary
Recurso       ../resources/config.resource
Recurso       ../resources/steps/carrinho_e2e_steps.resource

Suite Setup      Create Session      serverest  ${API}
Test Setup       Open Browser        ${URL}     ${BROWSER}
Test Teardown    Close All Browsers

*** Casos de Teste ***
Adicionar um produto no carrinho
    Dado que existe um cliente
    E que existe um produto disponível
    E que o cliente está logado na Serverest Store
    Quando o cliente adiciona o produto à lista de compras
    E envia a lista de compras para o carrinho
    Então o produto deve constar no carrinho do cliente
