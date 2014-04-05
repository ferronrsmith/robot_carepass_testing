*** Settings ***
Documentation     Test Suite for the App Management Page.
...
...               This test is functionally identical to the example in
...               valid_login.txt file.
Resource       ../../../keywords/apps/manager/resource.robot
Suite Setup		Valid Login
Suite Teardown     Close Browser

*** Test Cases ***
App Manager Should Contain All Apps
  [Tags]	prod_only
  Given I Am Logged into CarePass
  When user is on the App Manager Page
  Then App Manager should have "${APPL_COUNT}" Apps shown

App Manager Should Contain Drop Down
  [Tags]	prod_only
  Given I Am Logged into CarePass
  When user is on the App Manager Page
  Then App Manager should contain a dropdown

App Manager Should Have the Right Amount of Category
  [Tags]	prod_only
  Given I Am Logged into CarePass
  When user is on the App Manager Page
  Then App Manager should contain a dropdown with "${CAT_COUNT}" categories

App Manager Dropdown Should Contain All Categories
  [Tags]	prod_only
  [Documentation]     Verifies that all categories exists within the drop down
  Given I Am Logged into CarePass
  When user is on the App Manager Page
  Then App Manager dropdown should contain the following categories "@{CATEGORIES}"

App Manager Category Contains the Correct Count of Apps For Each Category
  [Tags]	prod_only
  [Documentation]     Verifies that all categories exists within the drop down
  Given I Am Logged into CarePass
  When user is on the App Manager Page
  Then App Manager dropdown "@{CATEGORIES}" should each contain a specified "${APP_COUNT}"

App Manager View All Contains All Apps List in APP_LISTING
  [Tags]  prod_only
  [Documentation]     Verifies that all categories exists within the drop down
  Given I Am Logged into CarePass
  When user is on the App Manager Page
  Then App Manager should contain all apps "${APP_LISTING}" listed

App Manager Has Description Text
  [Tags]	beta_old
  Go To App Management Page
  ${result}=  Get Text  css=#stage > h1 > span:nth-child(2)
  Should Be Equal  ${result}  Sync your apps

# Connecting an App on the App Manager Page - Fitbit
    # [Tags]  beta
    # Connect App   fitbit
    # Wait Until Keyword Succeeds    50s    5s    Welcome Page Should Be Open
