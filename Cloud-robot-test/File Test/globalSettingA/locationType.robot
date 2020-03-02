*** Settings ***
Documentation     This is ui testing for A006
...
...               Location type
Resource          ../../environment.robot
Suite Teardown    close browser

*** Test Cases ***
Create location type scenario
    Given open on the website
    When login super admin
    And click global setting button
    And click location type
    Then create location type
    And check list new location type

Edit location type scenario
    Then edit location type
    And check location type update

Search user location type scenario
    When search name
    Then name should be show

Delete user location type scenario
    Then click delete location type list

*** Keywords ***
Click location type 
    Click element when ready  //a[contains(@class, 'nav-link') and contains(text(),' Location Type')]

Create location type
    Click element when ready  //a[contains(text(),'Create Location Type')]
    Input text  //*[@id="location_type_name"]  Airport
    Input text  //*[@id="location_type_description"]  runway
    Click element when ready  //*[@name="commit"]

Check list new location type 
    Wait Until Element Is Visible  //td[contains(text(),'Airport')]  10
    ${check_name}=  Get text  //td[contains(text(),'Airport')]
    Should be equal  ${check_name}  Airport

Edit location type 
    Click element when ready  (//*[@data-icon="pen"])[2]
    Input text  //*[@id="location_type_name"]  Airport2
    Click element when ready  //*[@name="commit"]
    
Check location type update
    Wait Until Element Is Visible  //td[contains(text(),'Airport2')]  10
    ${check_name}=  Get text  //td[contains(text(),'Airport2')]
    Should be equal  ${check_name}  Airport2

Click delete location type list
    Wait Until Element Is Visible  (//a[@rel='icon' or @rel='nofollow'])[2]  10
    Click element when ready  (//a[@rel='icon' or @rel='nofollow'])[2]
    Handle Alert  action=ACCEPT

Search name
    Input text  //*[@type="search"]  Airport2

Name should be show
    Wait Until Element Is Visible  //td[contains(text(),'Airport2')]  10
    ${check_name}=  Get text  //td[contains(text(),'Airport2')]
    Should be equal  ${check_name}  Airport2



