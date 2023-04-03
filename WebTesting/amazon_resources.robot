*** Settings ***
Library    SeleniumLibrary
# Resource   nome_do_outro_resurce
# Library    Collections

*** Variables ***
${URL}                 http://www.amazon.com.br
${MENU ELETRONICOS}    //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${HEADER_ELETRONICOS}    //h1[contains(.,'Eletrônicos e Tecnologia')]


*** Keywords ***

Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser    

Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU ELETRONICOS}    

Entrar no meu "Eletrônicos"
    Click Element    locator=${MENU ELETRONICOS}

Verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains    text=${FRASE}
    Wait Until Element Is Visible    locator=${HEADER_ELETRONICOS}

Verificar se o título da página fica "${TITULO}"
    Sleep    2
    Title Should Be    title=${TITULO}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    locator=//img[contains(@alt,'${NOME_CATEGORIA}')]

Digitar o nome de produto "${xbox1}" no campo de pesquisa
    Input Text    locator=//input[contains(@type,'text')]    text=${xbox1}
                  
Clicar no botão de pesquisa
    Click Button    locator=//input[contains(@type,'submit')]
    

Verificar o resultado da pesquisa se esta listando o produto pesquisado
    Wait Until Element Is Visible    locator=(//span[contains(.,'Console Xbox Series S')])[2]
    
    # FOI MAS N FOI...
    # Sleep    10
    # ${source}=    Get Source
    # ${count}=    Get Count    ${source}    xbox
    # Log    A palavra "xbox" aparece ${count} vezes na página.


    # TENTATIVAS
    # ${elementos}    Get WebElements      /html/body/div[1]/div[2]/div[1]/div[1]/div/span[1]/div[1]/div[15]/div/div/div/div/div[2]/div[1]/h2/a/span/text()='xbox'
    # ${strings}    Create List   
    # FOR    ${elemento}    IN    @{elementos}  
    # ${texto}    Get Text    ${elemento}  
    # Append To List    ${strings}    ${texto}  
    # END
    # Log    As strings da página são: ${strings}
    # Count Values In List    ${strings}     ${texto} 

    # ${texto}    Get Text    css=body
    #     ${palavras}    Set Variable    ${texto}.split()
    #     ${contagem}    Set Variable    0
    #     FOR    ${palavra}    IN    @{palavras}
    #         ${contagem}    Run Keyword If    '${palavra}' == 'xbox'    ...    ELSE    ...    ${contagem}
    #         ${contagem}    Run Keyword If    '${palavra}' == 'Xbox'    ...    ELSE    ...    ${contagem}
    #         ${contagem}    Run Keyword If    '${palavra}' == 'XBOX'    ...    ELSE    ...    ${contagem}
    #         ${contagem}    Evaluate    ${contagem} + 1
    #     END
    #     Log    A palavra 'xbox' apareceu ${contagem} vezes na página.
    #     Close Browser



# --------------------------- GHERKIN STEPS -------------------------------


Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."

Quando acessar o menu "Eletrônicos"
    Entrar no meu "Eletrônicos"

Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"

E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Verificar se aparece a frase "Eletrônicos e Tecnologia"

E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "Computadores e Informática"

Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa

Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    Verificar se o título da página fica "Amazon.com.br : Xbox Series S"

E um produto da linha "Xbox Series S" deve ser mostrado na página
    Verificar o resultado da pesquisa se esta listando o produto pesquisado