*** Settings ***
Documentation     Test Suite for App Authentication.
...
...               This test is functionally identical to the example in
...               valid_login.txt file.
Resource       ../../keywords/authentication/resource.robot
Suite Teardown     Close Browser

*** Test Cases ***

Valid Login
    Open Browser To Login Page
    Login To App    ${DEFAULT USER NAME}	${DEFAULT USER PASSWORD}
    Wait Until Keyword Succeeds    50s    5s    Welcome Page Should Be Open

Successful Logout
	Logout
    Login Page Should Be Open
