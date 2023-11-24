*** Settings ***
Library  SeleniumLibrary
Resource  ./HeaderPage.robot


*** Variables ***

${minimum_price_txt}  xpath://fieldset[@class='adv-fieldset__price']//span[2]//span[1]//input[1]
${maximum_price_txt}  xpath://span[5]//span[1]//input[1]



*** Keywords ***

configure Advanced search details
    [Arguments]         ${minimum_price}    ${maximum_price}
    Input Text       ${minimum_price_txt}   ${minimum_price}
    Input Text      ${maximum_price_txt}    ${maximum_price}

select condition
    click element   xpath://fieldset[@class='adv-fieldset__condition']//div[1]

search product with advanced configuration
    click element   xpath://div[@class='adv-form__actions']//button[@type='submit'][normalize-space()='Search']

Verify searched product

    page should contain   ${product}