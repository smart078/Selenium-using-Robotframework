*** Settings ***
Documentation     This is ui testing for A007
...
...               Mycloud packaging
Resource          ../../environment.robot
Suite Teardown    close browser

*** Test Cases ***
Create mycloud packaging scenario
    Given open on the website
    When login super admin
    And click global setting button
    And click mycloud packaging
    Then create mycloud packaging
    And check list new mycloud packaging

Edit mycloud packaging scenario
    Then edit mycloud packaging
    And check mycloud packaging update

Search user mycloud packaging scenario
    When search name
    Then name should be show

Delete user mycloud packaging scenario
    Then click delete mycloud packaging list

*** Keywords ***
Click global setting button
    Click element when ready  //*[@class="float-right text-right mr-3"]

Click mycloud packaging  
    Click element when ready  //a[contains(@class, 'nav-link') and contains(text(),' MyCloud Packaging')]

Create mycloud packaging
    Click element when ready  //a[contains(text(),'Create MyCloud Packaging')]
    Input text  //*[@id="mycloud_packaging_name"]  M - TEST BOX3
    Input text  //*[@id="mycloud_packaging_description"]  regular_box
    Input text  //*[@id="mycloud_packaging_weight"]  10
    Input text  //*[@id="mycloud_packaging_dimension_height"]  10
    Input text  //*[@id="mycloud_packaging_dimension_width"]  10
    Input text  //*[@id="mycloud_packaging_dimension_long"]  10
    Execute JavaScript    window.scrollTo(${x_location},${y_location})
    Click element when ready  //*[@name="commit"]

Check list new mycloud packaging
    Wait Until Element Is Visible  //td[contains(text(),'M - TEST BOX3')]  10
    ${check_name}=  Get text  //td[contains(text(),'M - TEST BOX3')]
    Should be equal  ${check_name}  M - TEST BOX3

Edit mycloud packaging
    Click element when ready  (//*[@data-icon="pen"])[3]
    Input text  //*[@id="mycloud_packaging_name"]  M - TEST BOX4
    Click element when ready  //*[@name="commit"]
    
Check mycloud packaging update
    Wait Until Element Is Visible  //td[contains(text(),'M - TEST BOX4')]  10
    ${check_name}=  Get text  //td[contains(text(),'M - TEST BOX4')]
    Should be equal  ${check_name}  M - TEST BOX4

Click delete mycloud packaging list
    Wait Until Element Is Visible  (//a[@rel='icon' or @rel='nofollow'])[2]  10
    Click element when ready  (//a[@rel='icon' or @rel='nofollow'])[2]
    Handle Alert  action=ACCEPT

Search name
    Input text  //*[@type="search"]  M - TEST BOX4

Name should be show
    Wait Until Element Is Visible  //td[contains(text(),'M - TEST BOX4')]  10
    ${check_name}=  Get text  //td[contains(text(),'M - TEST BOX4')]
    Should be equal  ${check_name}  M - TEST BOX4



