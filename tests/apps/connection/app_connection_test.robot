*** Settings ***
Documentation     Test Suite for the App Connection via OAuth
...
...               This test is functionally identical to the example in
...               valid_login.txt file.
Resource       ../../../keywords/apps/connection/resource.robot
Suite Setup		Valid Login
Suite Teardown     Close Browser

*** Test Cases ***
