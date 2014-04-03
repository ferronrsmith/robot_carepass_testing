*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported Selenium2Library.
Library           Selenium2Library

# resource importation/extension
Resource       ../common_resources.robot

*** Variables ***

*** Keywords ***

Open Browser To Mobile Login Page
    [Documentation]    Open Browser ${LOGIN URL} ${BROWSER} ${BROWSER_ALIAS} ${PHANTOMJS_REMOTE_URL}
    Open Browser    ${MOBILE LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Go To Mobile Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Mobile Submit Credentials
    Click Link    login-button

Login To Mobile App
    [Arguments]    ${username}    ${password}
    Input Username    ${username}
    Input Password    ${password}
    Submit Credentials
