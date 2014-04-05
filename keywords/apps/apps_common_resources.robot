*** Settings ***
Documentation     A resource file with reusable keywords and variables.

# resource importation/extension
Resource       ../common_resources.robot

*** Keywords ***
User is on the App Manager Page
	[Documentation]		Navigate to the app management page
    Go To    ${APP_URL}
    Wait Until Page Contains Element 	//div[@class='btn-group bootstrap-select ng-pristine ng-valid customDropdown']	20s

Connect App
	[Arguments]		${app_name}
	Go To 	${APP_CONNECT_URL}${app_name}
