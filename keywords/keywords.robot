
*** Settings ***
Library                             SeleniumLibrary
Resource                            ../resources/resources.robot

*** Variables ***
${URL}                              https://blogdoagi.com.br/
${BROWSER}                          chrome
${ARGUMENTO_PESQUISA}


*** Keywords ***

Abrir site blog do agi
    Open Browser  ${URL}  chrome
    Maximize Browser Window
    Wait Until Element Is Visible       locator=//a[@title='Ir para o conteúdo']  timeout=None  error="Título da página não encontrado"

Dado que acesso o site blog do agi
    Abrir site blog do agi

Fechar Navegador
    Close Browser  


Quando preencho o campo de pesquisa         
    [Arguments]                         ${argumento_pesquisa} 
    Click Element                       //a[@class='slide-search astra-search-icon'][contains(.,'Pesquisar')]
    Wait Until Element Is Visible       //input[contains(@type,'search')]
    Input Text                          //input[contains(@type,'search')]        ${argumento_pesquisa}
    Set Variable                        ${ARGUMENTO_PESQUISA}    ${argumento_pesquisa}      

E clico em pesquisar
    Wait Until Element Is Visible       locator=//a[contains(.,'Pesquisar')]    timeout=None  error="Botão de pesquisa não encontrado"
    Click Element                       locator=//a[contains(.,'Pesquisar')] 
    Wait Until Element Is Visible       locator=//section[@class='ast-archive-description'][contains(.,'${ARGUMENTO_PESQUISA}')]  timeout=None  error="Retorno de pesquisa com erro"

Então apresenta a mensagem              
    Wait Until Element Is Visible       locator=//h1[@class='page-title ast-archive-title'][contains(.,'Resultados encontrados para: ${ARGUMENTO_PESQUISA}')]  timeout=None  error="Retorno de pesquisa com erro"



E exibe a mensagem informativa
    [Arguments]                         ${mensagem}
    Wait Until Element Is Visible       locator=//p[contains(.,'${mensagem}')]  timeout=None  error="Mensagem não localizada!"

E exibe os resultados da pesquisa  
    FOR xpath=//article[contains(@class,'post')]


    