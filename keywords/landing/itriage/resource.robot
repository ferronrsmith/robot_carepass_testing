*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported Selenium2Library.
Library           Selenium2Library

# resource importation/extension
Resource       ../landing_resources.robot

*** Keywords ***

User is on the iTriage Page
	[Documentation]		Navigate to the itriage page
    Go To    ${ITRIAGE_URL}
    Wait Until Page Contains Element 	//*[@id="stage"]/div[3]/img	20s

Page Should Contain An H1 Header with "${itriage_h1}"
    ${h1}=  Get Text    //*[@id="stage"]/div[1]/h1
    Should Be Equal     ${h1}   ${itriage_h1}

Page Should Have the following description "${itriage_description}"
    ${description}=  Get Text    //*[@id="stage"]/div[2]/p
    Should Be Equal     ${description}   ${itriage_description}

Page Should Contain an Image
    Page Should Contain Image   //*[@id="stage"]/div[3]/img

Click on the Download The iTriage Button
    Click Link  xpath=//*[@id="stage"]/div[2]/a

App Store Modal Should Be Shown
    Page Should Contain Element     //*[@id="marketplaceIframe"]