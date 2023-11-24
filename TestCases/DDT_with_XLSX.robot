*** Settings ***
Documentation   Basic search functionality
Resource    ../Resources/CommonFunctionality.robot
Library     DataDriver  ../TestData/Testdata_rbt.xlsx    sheet_name=Sheet1

Test Setup      start testcase1
Test Teardown   finish testcase
Test Template   Verify invalid Login Scenarios

*** Variables ***

${username_txt}     id:user-name
${password_txt}     xpath://input[@id='password']
${login_button}       id:login-button
${text_error}       xpath://h3[@data-test='error']

*** Test Cases ***
verify Login fail - scenarios  ${username}    ${password}  ${error_message}


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

