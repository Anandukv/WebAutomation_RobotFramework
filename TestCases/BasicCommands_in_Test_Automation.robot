*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${url1}  https://testautomationpractice.blogspot.com/
${url2}  https://www.ebay.com/
${browser}      chrome


*** Test Cases ***
Run Basic Commands
    Open Browser    ${url1}     ${browser}
    Maximize Browser Window
    Sleep   2
    ${time}=    get selenium timeout
    log to console  ${time}
    handle the alerts
    select and unselect frame
    select item from list
    verify table data
    handle mouse actions
    scroll page
    Verify Links in the page
    Close All Browsers



*** Keywords ***
KEYWORD 1
    log to console   found the link Home*

handle the alerts
    click button    xpath://button[@onclick='myFunctionAlert()']
    handle alert    accept
    capture element screenshot      xpath://button[@onclick='myFunction()']       ../Screenshots/screenshot1.png
    click element   xpath://button[@onclick='myFunctionConfirm()']
    handle alert    dismiss
    click button    xpath://button[@onclick='myFunctionPrompt()']
    handle alert    leave
    alert should be present     Please enter your name:

select and unselect frame
    select frame    frame-one796456169
    Input Text      id:RESULT_TextField-0      Appu
    unselect frame
    ${location}=     get location
    log to console      ${location}

select item from list
    select from list by label   country     India
    sleep   2
    select from list by index   country     4
    sleep   2
    select from list by label   colors  Green
    select from list by label   colors  Red
    sleep   2
    unselect from list by label   colors  Red
    sleep   2

scroll page
    execute javascript  window.scrollTo(0,1500)
    sleep  2
    execute javascript  window.scrollTo(0,document.body.scrollHeight)
    sleep  2
    execute javascript  window.scrollTo(0,-document.body.scrollHeight)
    sleep  2

verify table data
    Scroll Element Into View     xpath://a[@class='active']
    ${rows}=      get element count    xpath://table[@name='BookTable']/tbody/tr
    ${col}=       get element count    xpath://table[@name='BookTable']/tbody/tr/th
    log to console      ${col}
    log to console      ${rows}
    ${data}=   get text     xpath://table[@name='BookTable']/tbody/tr[2]/td[2]
    log to console      ${data}
    table column should contain     xpath://table[@name='BookTable']    2   Author
    table row should contain        xpath://table[@name='BookTable']    5   Master In Selenium
    table cell should contain       xpath://table[@name='BookTable']  2   2   Amit
    table header should contain     xpath://table[@name='BookTable']        BookName

handle mouse actions
    double click element            xpath://button[normalize-space()='Copy Text']
    sleep  2
    drag and drop        xpath://p[normalize-space()='Drag me to my target']         xpath://div[@id='droppable']

Verify Links in the page
    ${Alllinkcount}=    get element count  xpath://a
    log to console      ${Alllinkcount}
    Run Keyword If  ${Alllinkcount} == 9    log to console  number of links is 9
    ...     ELSE IF  ${Alllinkcount} > 10 and ${Alllinkcount} < 14   log to console  number of links is 10-14
    ...     ELSE    KEYWORD 3
    @{links}   create list
    FOR  ${i}    IN RANGE    1   ${Alllinkcount}+1
    ${linktext}=    get text    xpath:(//a)[${i}]
        log to console  ${linktext}
        Run Keyword If  '${linktext}' == 'Blogger'    click link     link:${linktext}
        ...     ELSE IF  '${linktext}' == 'Home'     KEYWORD 1
#       ...     ELSE    KEYWORD 3
    END




