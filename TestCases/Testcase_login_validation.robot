*** Settings ***
Documentation   Login validations for saucedemo website
Resource    ../Resources/CommonFunctionality.robot


*** Variables ***

${url1}          https://www.saucedemo.com/
${username_txt}     id:user-name
${password_txt}     xpath://input[@id='password']
${login_button}       id:login-button
${text_error}       xpath://h3[@data-test='error']



*** Test Cases ***
Verify Login functionality for saucedemo website
    Verify Login Fails with wrong username
    Verify Login Fails with wrong password
    Verify Login Fails with wrong username and password
    Verify Login error message for blank password
    Verify Login error message for blank username
    Verify Login with valid username and password



*** Keywords ***
Verify Login Fails with wrong username
    Open Browser    ${url1}     ${browser}
    Maximize Browser Window
    Input Text      ${username_txt}  standard_user1
    Input Text      ${password_txt}  secret_sauce
    Click Button    ${login_button}
    Sleep   2
    capture page screenshot         ../Screenshots/login_failure_1.png
    Element Should Contain  ${text_error}   Epic sadface: Username and password do not match any user in this service
    close browser

Verify Login Fails with wrong password
    Open Browser    ${url1}     ${browser}
    Maximize Browser Window
    Input Text      ${username_txt}  standard_user
    Input Text      ${password_txt}  secret_sauce1
    Click Button    ${login_button}
    Sleep   2
    capture page screenshot         ../Screenshots/login_failure_2.png
    Element Should Contain  ${text_error}   Epic sadface: Username and password do not match any user in this service
    close browser

Verify Login Fails with wrong username and password
    Open Browser    ${url1}     ${browser}
    Maximize Browser Window
    Input Text      ${username_txt}  standard_user1
    Input Text      ${password_txt}  secret_sauce1
    Click Button    ${login_button}
    Sleep   2
    capture page screenshot         ../Screenshots/login_failure_3.png
    Element Should Contain  ${text_error}   Epic sadface: Username and password do not match any user in this service
    close browser

Verify Login error message for blank password
    Open Browser    ${url1}     ${browser}
    Maximize Browser Window
    Input Text      ${username_txt}  standard_user
    Input Text      ${password_txt}     ${EMPTY}
    Click Button    ${login_button}
    Sleep   2
    capture page screenshot         ../Screenshots/login_error_message_1.png
    Element Should Contain  ${text_error}   Epic sadface: Password is required
    close browser

Verify Login error message for blank username
    Open Browser    ${url1}     ${browser}
    Maximize Browser Window
    Input Text      ${username_txt}   ${EMPTY}
    Input Text      ${password_txt}  secret_sauce1
    Click Button    ${login_button}
    Sleep   2
    capture page screenshot         ../Screenshots/login_error_message_2.png
    Element Should Contain  ${text_error}   Epic sadface: Username is required
    close browser


Verify Login with valid username and password
    Open Browser    ${url1}     ${browser}
    Maximize Browser Window
    Input Text      ${username_txt}  standard_user
    Input Text      ${password_txt}  secret_sauce
    Click Button    ${login_button}
    Sleep   2
    Page Should Contain     Sauce Labs Backpack
    capture page screenshot         ../Screenshots/login_successful.png
    close browser