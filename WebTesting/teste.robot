*** Settings *** 
Library           SeleniumLibrary


*** Test Cases *** 
Contar Palavras Xbox
    Open Browser    https://www.amazon.com.br/s?k=xbox+series+s&ref=nb_sb_noss_2    chrome
    ${source}=    Get Source
    ${count}=    Get Count    ${source}    xbox
    Log    A palavra "xbox" aparece ${count} vezes na página.