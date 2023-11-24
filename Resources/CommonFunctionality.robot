*** Settings ***
Documentation   Basic search functionality
Library  SeleniumLibrary


*** Variables ***

${browser}  chrome
${url}  https://www.ebay.com/
${url1}          https://www.saucedemo.com/

*** Keywords ***
start testcase
   Open browser  ${url}   ${browser}
    maximize browser window
    sleep  2

start testcase1
   Open browser  ${url1}   ${browser}
    maximize browser window
    sleep  2

finish testcase
    Close Browser
