*** Settings ***
Documentation     This is ui testing for B007, B007-2
...
...               Location list view
Resource          ../../environment.robot
Suite Teardown    close browser

*** Test Cases ***
Create new location list scenario
    Given open on the website
    When login warehouse manager
    And select available warehouse
    And select warehouse setting
    Then select location list 
    And add location 
    And check new location list 

Edit user list scenario
    Then edit location list
    And check location list update

Select Zone scenario
    When select zone
    Then zone should be show

Delete user admin shop scenario
    Then click delete user button

Print location list scenario
    Then select icon print   

*** Keywords ***
Add location  
    Click element when ready  //a[contains(text(),'Add Location')]
    Click element when ready  //*[@id="location_location_type_id"]
    Click element when ready  //option[contains(text(),'Freezing')] 
    Input text  //*[@id="location_name"]  Fish
    Click element when ready  //*[@id="location_zone_id"]
    Click element when ready  //option[contains(text(),'Zone 1')] 
    Click element when ready  ${SUBMIT}

Check new location list 
    Wait Until Element Is Visible  //td[contains(text(),'Fish')]  10
    ${check_name}=  Get text  //td[contains(text(),'Fish')]
    Should be equal  ${check_name}  Fish

Edit location list
    Click element when ready  //th[contains(text(),'Location Name')]
    Click element when ready  (//*[@data-icon="pencil-alt"])[3]
    Input text  //*[@id="location_name"]  Fish2
    Click element when ready  ${SUBMIT}

Check location list update
    Wait Until Element Is Visible  //td[contains(text(),'Fish2')]  10
    ${check_name}=  Get text  //td[contains(text(),'Fish2')]
    Should be equal  ${check_name}  Fish2

Select zone
    Click element when ready  //*[@id="zone-filter-dropdown"]
    Click element when ready  //a[contains(text(),'Zone 1')]

Zone should be show
    Wait Until Element Is Visible  (//td[contains(text(),'Zone 1')])[1]  10
    ${check_name}=  Get text  (//td[contains(text(),'Zone 1')])[1]
    Should be equal  ${check_name}  Zone 1
    Click element when ready  //*[@id="zone-filter-dropdown"]
    Click element when ready  //a[contains(text(),'Show all zones')]

Select icon print
    Click element when ready  //*[@id="location-list"]/tbody/tr[2]/td[5]/a[1]

Click delete user button       
    Click element when ready  //*[@id="location-list"]/tbody/tr[2]/td[5]/a[3]
    Handle Alert  action=ACCEPT




