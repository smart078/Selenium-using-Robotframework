*** Settings ***
Documentation     This is ui testing for B010
...
...               Add bin type 
Resource          ../../environment.robot
Suite Teardown    close browser

*** Test Cases ***
Create new bin type scenario
    Given open on the website
    When login warehouse manager
    And select available warehouse
    And select bin management
    And select bin type
    Then add new bin type
    And check new bin type

Delete user admin shop scenario
    Then click delete user button

*** Keywords ***
Add new bin type
    Click element when ready  //button[contains(text(),'Add New Bin Type')]
    Click element when ready  //*[@id="bin_type"]
    Click element when ready  //option[contains(text(),'D-BIN')]
    Click element when ready  //*[@id="btn_confirm"]

Check new bin type
    Wait Until Element Is Visible  //td[contains(text(),'D-BIN')]  10
    ${check_name}=  Get text  //td[contains(text(),'D-BIN')]
    Should be equal  ${check_name}  D-BIN

Click delete user button
    Click element when ready  //*[@class='text-muted']
    Handle Alert  action=ACCEPT

