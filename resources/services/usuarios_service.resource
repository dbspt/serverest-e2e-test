*** Settings ***
Library    RequestsLibrary
Library    FakerLibrary

*** Keywords ***
Buscar um cliente aleatório na API
    &{filtros} =   Create Dictionary   administrador=false

    ${response} =   GET On Session  
    ...    serverest   
    ...    /usuarios
    ...    params=${filtros}
    ...    expected_status=200

    Log     ${response.json()}
    Log     ${response.headers}
    Log     ${response.status_code}
    Log     ${response.text}
    Log     ${response.ok}
    Log     ${response.url}

    Skip If   not $response
    ...       Nenhum cliente encontrado na API. O teste não poderá ser executado.

    ${cliente} =    Escolher um item aleatório na lista    lista=${response.json()}[usuarios]

    RETURN   ${cliente}


Buscar um produto aleatório em estoque na API
    ${response} =   GET On Session  
    ...    serverest   
    ...    /produtos
    ...    expected_status=200

    Skip If    not $response
    ...       Nenhum cliente produto na API. O teste não poderá ser executado.

    Log     ${response.json()}[produtos]
    ${produto} =   Escolher um item aleatório na lista    lista=${response.json()}[produtos]

    RETURN   ${produto}


###############################
##  Procedimentos auxiliares ##
###############################
Escolher um item aleatório na lista 
    [Arguments]                    ${lista} 
    ${item} =  FakerLibrary.Random Element    ${lista} 
    RETURN   ${item}
