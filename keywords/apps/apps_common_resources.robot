*** Settings ***
Documentation     A resource file with reusable keywords and variables.

# resource importation/extension
Resource       ../common_resources.robot

*** Variables ***
@{CATEGORIES}	View All Apps	Body Measurement	Dr. Visit	Fitness 	Lifestyle 	Medication 		Mood	Nutrition	Sleep 	Weight
@{APPS}  ACTIVE Trainer  BettrLife  BodyMedia  Care4Today MHM  FatSecret  Fitbit  Fitbug  FitSync  Fooducate  Garmin Connect  iTriage  Lose It!  MapMyFitness  meQ  Moves  MOXIEfit  MyBreath Lite  Passage  RunKeeper  SparkPeople  Thryve  UP  WellZone  Withings  Zipongo

*** Keywords ***
Valid Login
    Open Browser To Login Page
    Login To App    ${DEFAULT_USER_NAME}	${DEFAULT_USER_PASSWORD}
    Wait Until Keyword Succeeds    50s    5s    Welcome Page Should Be Open

Go To App Management Page
	[Documentation]		Navigate to the app management page
    Go To    ${APP_URL}
    Wait Until Page Contains Element 	//div[@class='btn-group bootstrap-select ng-pristine ng-valid customDropdown']	20s

Connect App
	[Arguments]		${app_name}
	Go To 	${APP_CONNECT_URL}${app_name}
