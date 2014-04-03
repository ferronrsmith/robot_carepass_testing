*** Settings ***
Documentation     A test suite with a single Gherkin style test.
...
...               This test is functionally identical to the example in
...               valid_login.txt file.
Resource       ../../../../keywords/mobile/profiles/lab_results/resource.robot
Suite Teardown     Close Browser

*** Test Cases ***
