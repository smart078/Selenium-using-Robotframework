*** Settings ***
Documentation     This is ui testing for A003
...
...               Bin type
Resource          ../../environment.robot
Suite Teardown    close browser

*** Test Cases ***
Create special service scenario
    Given open on the website
    When login super admin
    And click global setting button
    And click special service
    Then create special service
    And check list new special service

Edit special service scenario
    Then edit special service
    And check special service update

Search user special service scenario
    When search name
    Then name should be show

Delete user special service scenario
    Then click delete special service list

*** Keywords ***
Click global setting button
    Click element when ready  //*[@class="float-right text-right mr-3"]

Click special service 
    Click element when ready  //a[contains(@class, 'nav-link') and contains(text(),' Special Service')]

Create special service
    Click element when ready  //a[contains(text(),'Create Special Service')]
    Input text  //*[@id="premium_service_name"]  Discount
    Click element when ready  //*[@id="premium_service_premium_service_category_id"]
    Click element when ready  //option[contains(text(),'Inbound')]
    Input text  //*[@id="premium_service_description"]  discount $10
    Click element when ready  //*[@name="commit"]

Check list new special service 
    Wait Until Element Is Visible  //td[contains(text(),'Discount')]  10
    ${check_name}=  Get text  //td[contains(text(),'Discount')]
    Should be equal  ${check_name}  Discount

Edit special service 
    Click element when ready  (//*[@data-icon="pen"])[2]
    Input text  //*[@id="premium_service_name"]  Discount2
    Click element when ready  //*[@name="commit"]
    
Check special service update
    Wait Until Element Is Visible  //td[contains(text(),'Discount2')]  10
    ${check_name}=  Get text  //td[contains(text(),'Discount2')]
    Should be equal  ${check_name}  Discount2

Click delete special service list
    Wait Until Element Is Visible  (//a[@rel='icon' or @rel='nofollow'])[2]  10
    Click element when ready  (//a[@rel='icon' or @rel='nofollow'])[2]
    Handle Alert  action=ACCEPT

Search name
    Input text  //*[@type="search"]  Discount2

Name should be show
    Wait Until Element Is Visible  //td[contains(text(),'Discount2')]  10
    ${check_name}=  Get text  //td[contains(text(),'Discount2')]
    Should be equal  ${check_name}  Discount2



