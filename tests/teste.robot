
*** Settings ***
Documentation            Etapa Teste Técnico | Johanne Batista - Automatizador de testes Sênior
Library                  SeleniumLibrary
Resource                 ../keywords/keywords.robot
Test Setup               Abrir site blog do agi
Test Teardown            Fechar Navegador

*** Variable ***




*** Test Case ***
Cenário 1: Validar busca sem sucesso
    Dado que acesso o site blog do agi
    Quando preencho o campo de pesquisa       Testes sem retorno válido
    E clico em pesquisar
    Então apresenta a mensagem                
    E exibe a mensagem informativa            Lamentamos, mas nada foi encontrado para sua pesquisa, tente novamente com outras palavras.


Cenário 2: Validar busca com sucesso
    Dado que acesso o site blog do agi
    Quando preencho o campo de pesquisa        Teste
    E clico em pesquisar
    Então apresenta a mensagem  
    
   