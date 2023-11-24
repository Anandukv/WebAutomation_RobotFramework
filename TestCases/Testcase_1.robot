*** Settings ***
Documentation   Basic search functionality
Resource    ../Resources/CommonFunctionality.robot


Test Setup      start testcase1
Test Teardown   finish testcase

*** Variables ***

${username_txt}     id:user-name
${password_txt}     xpath://input[@id='password']
${login_button}       id:login-button
${text_error}       xpath://h3[@data-test='error']

*** Test Cases ***

Verify Login Fails with wrong username
    Input Text      ${username_txt}  standard_user1
    Input Text      ${password_txt}  secret_sauce
    Click Button    ${login_button}
    Sleep  2
    Element Should Contain  ${text_error}   Epic sadface: Username and password do not match any user in this service

Verify Login Fails with wrong password
    Input Text      ${username_txt}  standard_user
    Input Text      ${password_txt}  secret_sauce1
    Click Button    ${login_button}
    Sleep  2
    Element Should Contain  ${text_error}   Epic sadface: Username and password do not match any user in this service


Verify Login Fails with wrong username and password
    Input Text      ${username_txt}  standard_user1
    Input Text      ${password_txt}  secret_sauce1
    Click Button    ${login_button}
    Sleep  2
    Element Should Contain  ${text_error}   Epic sadface: Username and password do not match any user in this service


Verify Login error message for blank password
    Input Text      ${username_txt}  standard_user
    Input Text      ${password_txt}  ${EMPTY}
    Click Button    ${login_button}
    Sleep  2
    Element Should Contain  ${text_error}   Epic sadface: Password is required


Verify Login error message for blank username
    Input Text      ${username_txt}  ${EMPTY}
    Input Text      ${password_txt}  secret_sauce1
    Click Button    ${login_button}
    Sleep  2
    Element Should Contain  ${text_error}   Epic sadface: Username is required



Verify Login with valid username and password
    Input Text      ${username_txt}  standard_user
    Input Text      ${password_txt}  secret_sauce
    Click Button    ${login_button}
    Sleep  2
    Element Should Contain  ${text_error}   Epic sadface: Username and password do not match any user in this service
    Page Should Contain     Sauce Labs Backpack





