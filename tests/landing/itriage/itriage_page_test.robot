*** Settings ***
Documentation     Test Suite for the iTriage Page
...
...               This test is functionally identical to the example in
...               valid_login.txt file.
Resource       ../../../keywords/landing/itriage/resource.robot
Suite Setup		Valid Login
Suite Teardown     Close Browser


*** Test Cases ***
iTriage Page Should Contain H1 Header
  [Tags]	prod_only
  Given I Am Logged into CarePass
  When user is on the iTriage Page
  Then page Should Contain An H1 Header with "${ITRIAGE_H1}"

iTriage Page Should Contain Application Description
  [Tags]	prod_only
  Given I Am Logged into CarePass
  When user is on the iTriage Page
  Then page Should Have the following description "${ITRIAGE_DESCRIPTION}"

iTriage Page Should Contain an Image
  [Tags]	prod_only
  Given I Am Logged into CarePass
  When user is on the iTriage Page
  Then page Should Contain an Image

iTriage Page Should Contain a Download Button That Opens Up The App Store Page for the App
  [Tags]	prod_only
  Given I Am Logged into CarePass
  When user is on the iTriage Page
  And click on the Download The iTriage Button
  Then app Store Modal Should Be Shown