*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BROWSER}  Chrome
${URL_IFRAME}  https://www.selenium.dev/selenium/web/click_tests/click_iframe.html
${URL_FORM}    https://www.selenium.dev/selenium/web/web-form.html

*** Test Cases ***
Test Click Link And Verify Submission
    Open Browser  ${URL_IFRAME}  ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible  xpath=//a[@id='link']  timeout=10s
    Click Element  xpath=//a[@id='link']
    Wait Until Page Contains  Submitted Successfully!  timeout=10s
    Capture Page Screenshot
    Close Browser


Test Fill And Submit Web Form
    Open Browser  ${URL_FORM}  ${BROWSER}
    Maximize Browser Window
    Input Text  id=my-text-id  Test Input
    Input Text  xpath=//input[@type='password']  Secret123
    Input Text  xpath=//textarea[@name='my-textarea']  This is a test message.
    Select From List By Label  xpath=//select[@name='my-select']  Two
    Click Element  id=my-check-1
    Click Element  id=my-radio-2
    Click Element  xpath=//button[@type='submit']
    Wait Until Location Contains  submitted-form.html  timeout=10s
    Wait Until Page Contains  Received!  timeout=10s

    Capture Page Screenshot
    Close Browser