*** Settings ***
Documentation     Test Suite for the App Store Page.
...
...               This test is functionally identical to the example in
...               valid_login.txt file.
Resource       ../../../keywords/apps/store/resource.robot
Suite Setup   Valid Login
Suite Teardown     Close Browser

*** Test Cases ***
