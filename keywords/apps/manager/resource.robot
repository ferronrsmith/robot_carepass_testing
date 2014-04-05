*** Settings ***
Documentation     A resource file with reusable keywords and variables.

# resource importation/extension
Resource       ../apps_common_resources.robot


*** Keywords ***
App Manager should have "${app_count}" Apps shown
    Xpath Should Match X Times    //div[@class='title ng-binding']    ${app_count}

Get Currently Selected Category
	[Documentation]		Retrieves the currently selected value from the drop-down
	${result}=	Get Text 	xpath=//*[@id="stage"]/h1/div/div/button/span[1]
	[return]	${result}

App Manager should contain a dropdown
	Page Should Contain Element 	//div[@class='btn-group bootstrap-select ng-pristine ng-valid customDropdown']

App Manager should contain a dropdown with "${cat_count}" categories
	Xpath Should Match X Times    //ul[@class='dropdown-menu inner selectpicker']/li    ${cat_count}

App Manager dropdown should contain the following categories "${categories}"
    [Documentation]     Iterates through a list of categories, changing the drop-down and checking that the current value matches the current array item
    : FOR   ${Element}  IN  @{categories}
    \	${index}=   Get Index From List     ${categories}     ${Element}
   	\	Execute Javascript 	window.jQuery1_9_1('.selectpicker').selectpicker('val', ${index});
   	\ 	${select}=	Get Currently Selected Category
   	\	Should Be Equal 	${Element}	${select}

App Manager dropdown "${categories}" should each contain a specified "${app_count}"
    [Documentation]     Iterates through a list of categories, changing the drop-down and checks the amount of apps in a category
    : FOR   ${Element}  IN  @{categories}
    \	${index}=   Get Index From List     ${categories}     ${Element}
   	\	Execute Javascript 	window.jQuery1_9_1('.selectpicker').selectpicker('val', ${index});
   	\ 	${select}=	Get Currently Selected Category
    \   ${app_value}  Get From Dictionary   ${app_count}  ${Element}
   	\   Should Be Equal 	${Element}	${select}
    \   Xpath Should Match X Times    //div[@class='additionalappsContainer']/div    ${app_value}

App Manager should contain all apps "${app_listing}" listed
    [Documentation]     Iterates through the app listing check to ensure all alls are present on the app manager page.
    :FOR  ${index}  IN  @{app_listing}
    \   ${result}=  Get Text  xpath=//div[@class='right']/div[@class='title ng-binding'][contains(., '${index}')]
    \   Should Be Equal As Strings    ${index}    ${result}


