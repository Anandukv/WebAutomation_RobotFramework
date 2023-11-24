*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${product} =    iphone14


*** Keywords ***

search product
    Input Text      //input[@id='gh-ac']   ${product}
    Press Keys       //input[@id='gh-btn']   [Return]

click on Advanced link
    click link      link:Advanced