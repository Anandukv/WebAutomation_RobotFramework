*** Settings ***
Documentation   Basic search functionality
Resource    ../Resources/CommonFunctionality.robot


Test Setup      start testcase1
Test Teardown   finish testcase
Test Template   Verify invalid Login Scenarios

*** Variables ***

${username_txt}     id:user-name
${password_txt}     xpath://input[@id='password']
${login_button}       id:login-button
${text_error}       xpath://h3[@data-test='error']

*** Test Cases ***

# TEST TEST TEMPLATE
verify Login fails - Blank username and password        ${EMPTY}           ${EMPTY}         Epic sadface: Username is required
verify Login fails - Blank username                     ${EMPTY}           secret_sauce     Epic sadface: Username is required
verify Login fails - Blank password                     standard_user      ${EMPTY}         Epic sadface: Password is required
verify Login fails - invalid username and password      standard_user1     secret_sauce1    Epic sadface: Username and password do not match any user in this service


*** Keywords ***
Verify invalid Login Scenarios
    [Arguments]     ${username}    ${password}  ${error_message}
    Clear Element Text      ${username_txt}
    Input Text      ${username_txt}  ${username}
    Clear Element Text      ${password_txt}
    Input Text      ${password_txt}  ${password}
    Click Button    ${login_button}
    Sleep  2
    Element Should Contain  ${text_error}   ${error_message}
