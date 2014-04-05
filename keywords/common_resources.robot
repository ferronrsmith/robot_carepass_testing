*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported Selenium2Library.
Variables         libs/variables.py
Library           Selenium2Library
Library           Collections    # Library    libs/utils.py

*** Keywords ***
Open Browser To Login Page
    [Documentation]    Open Browser ${LOGIN_URL} ${BROWSER} ${BROWSER_ALIAS} ${PHANTOMJS_REMOTE_URL}
    Open Browser    ${LOGIN URL}    ${BROWSER}    #ff_profile_dir=${FF_PROFILE}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    Log in | CarePass

Go To Login Page
    Go To    ${LOGIN_URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    USER    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    PASSWORD    ${password}

Logout
    Go To    ${LOG_OUT_URL}

Submit Credentials
    Click Link    login-button

Login To App
    [Arguments]    ${username}    ${password}
    Input Username    ${username}
    Input Password    ${password}
    Submit Credentials

Welcome Page Should Be Open
    Location Should Be    ${WELCOME_URL}
    Title Should Be    CarePass

I Am Logged into CarePass
    Wait Until Keyword Succeeds    20s    5s    User Logged In to CarePass

User Logged In to CarePass
    Page Should Contain Element     //*[@id="mainNav"]/div[1]/div/div/span[2]/a

Valid Login
    Open Browser To Login Page
    Login To App    ${DEFAULT_USER_NAME}	${DEFAULT_USER_PASSWORD}
    Wait Until Keyword Succeeds    50s    5s    Welcome Page Should Be Open

Teardown Take Failure Snapshot
    Run Keyword If Test Failed    Capture Screenshot

Teardown Browser
    Close Browser
