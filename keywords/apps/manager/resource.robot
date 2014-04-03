*** Settings ***
Documentation     A resource file with reusable keywords and variables.

# resource importation/extension
Resource       ../apps_common_resources.robot


*** Keywords ***
Check The Amount of Apps on App Manager
	[Arguments] 	${app_count}
    Xpath Should Match X Times    //div[@class='title ng-binding']    ${app_count}

Get Currently Selected Category
	[Documentation]		Retrieves the currently selected value from the drop-down
	${result}=	Get Text 	xpath=//*[@id="stage"]/h1/div/div/button/span[1]
	[return]	${result}
