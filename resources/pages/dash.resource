*** Settings ***
Documentation                  Dashboard Page

Library                        Browser

*** Keywords ***

User Logged In
    ${headerLogin}             Set Variable    
    ...                        Aquela figurinha incrível a um clique de distância.

    Get Text                   css=.header-content strong     
    ...                        equal                          ${headerLogin}

Search User
    [Arguments]                ${target}

    Fill Text                  input[placeholder^=Busque]    ${target}
    Click                      css=button >> text=Buscar

Select Sticker
    [Arguments]                ${name}

    Click                      xpath=//img[@alt="${name}"]/..

Get In Touch
    Click                      css=button >> text=Entrar em contato

Whatsapp Sticker Message
    [Arguments]                ${stickerName}

    ${ExpectedMessage}         Set Variable
    ...                        Oi, achei o seu contato no Trade Sticker. Estou interessado(a) na figurinha do ${stickerName}, bora negociar?
    
    Switch Page                NEW

    Wait For Elements State    css=p >> text=${ExpectedMessage}
    ...                        visible
    ...                        5000
