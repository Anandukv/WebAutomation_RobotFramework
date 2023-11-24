*** Settings ***
Library  SeleniumLibrary

*** Keywords ***

verify search results
    Input Text      //input[@id='gh-ac']    iphone14
    Press Keys       //input[@id='gh-btn']   [Return]
    Page Should Contain     Apple iPhone 14 - 128GB


