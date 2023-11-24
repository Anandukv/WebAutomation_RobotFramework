*** Settings ***
Documentation   Basic search functionality
Resource  ../../Resources/CommonFunctionality.robot
Resource  ../../Resources/PageObjects/SearchResultsPage.robot
Resource  ../../Resources/UserDefinedKeywords.robot
Resource  ../../Resources/PageObjects/HeaderPage.robot

Test Setup  start testcase
Test Teardown  finish testcase

*** Variables ***

${url1}          https://www.saucedemo.com/
${username_txt}     id:user-name
${password_txt}     xpath://input[@id='password']
${login_button}       id:login-button
${text_error}       xpath://h3[@data-test='error']



*** Test Cases ***
Test Basic Search Functionality of eBay
    [Documentation]  Test for practise
    [Tags]      Functionality
    HeaderPage.search product
    HeaderPage.click on Advanced link
    SearchResultsPage.configure Advanced search details     600     800
    SearchResultsPage.search product with advanced configuration
    SearchResultsPage.Verify searched product
    capture page screenshot         ../Screenshots/ebay_product_search.png

