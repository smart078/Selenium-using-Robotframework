*** Settings ***
Documentation     This is ui testing for A005
...
...               Delivery mode
Resource          ../../environment.robot
Suite Teardown    close browser

*** Test Cases ***
Create delivery mode scenario
    Given open on the website
    When login super admin
    And click global setting button
    And click delivery mode
    Then create delivery mode
    And check list new delivery mode

Edit delivery mode scenario
    Then edit delivery mode
    And check delivery mode update

Search user delivery mode scenario
    When search name
    Then name should be show

Delete user delivery mode scenario
    Then click delete delivery mode list

*** Keywords ***
Click global setting button
    Click element when ready  //*[@class="float-right text-right mr-3"]

Click delivery mode 
    Click element when ready  //a[contains(@class, 'nav-link') and contains(text(),' Delivery Mode')]

Create delivery mode
    Click element when ready  //a[contains(text(),'Create Delivery Mode')]
    Input text  //*[@id="delivery_name"]  Grab
    Click element when ready  //*[@name="commit"]

Check list new delivery mode 
    Wait Until Element Is Visible  //td[contains(text(),'Grab')]  10
    ${check_name}=  Get text  //td[contains(text(),'Grab')]
    Should be equal  ${check_name}  Grab

Edit delivery mode 
    Click element when ready  (//*[@data-icon="pen"])[2]
    Input text  //*[@id="delivery_name"]  Grab2
    Click element when ready  //*[@name="commit"]
    
Check delivery mode update
    Wait Until Element Is Visible  //td[contains(text(),'Grab2')]  10
    ${check_name}=  Get text  //td[contains(text(),'Grab2')]
    Should be equal  ${check_name}  Grab2

Click delete delivery mode list
    Wait Until Element Is Visible  (//a[@rel='icon' or @rel='nofollow'])[2]  10
    Click element when ready  (//a[@rel='icon' or @rel='nofollow'])[2]
    Handle Alert  action=ACCEPT

Search name
    Input text  //*[@type="search"]  Grab2

Name should be show
    Wait Until Element Is Visible  //td[contains(text(),'Grab2')]  10
    ${check_name}=  Get text  //td[contains(text(),'Grab2')]
    Should be equal  ${check_name}  Grab2



