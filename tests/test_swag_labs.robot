*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}  edge    options=add_argument("--headless")
${url}     https://tonihn.github.io/SwagLab/

*** Test Cases ***
LoginTest
    Open Browser     ${url}     ${browser}
    Maximize browser window
    loginToApplication
    Wait until element is visible   id:products-grid
    Page Should Contain    Products
    sleep   3
    close browser



*** Keywords ***
loginToApplication
    input text  id:username    standard_user
    input text  id:password     secret_sauce
    Click Element   xpath://*[@id="login-button"]
