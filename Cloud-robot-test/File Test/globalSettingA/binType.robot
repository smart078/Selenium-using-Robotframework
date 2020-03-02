*** Settings ***
Documentation     This is ui testing for A003
...
...               Bin type
Resource          ../../environment.robot
Suite Teardown    close browser

*** Test Cases ***
Create bin type scenario
    Given open on the website
    When login super admin
    And click global setting button
    And click bin type
    Then create bin type
    And check list new bin type

Edit bin type scenario
    Then edit bin type
    And check bin type update

Search user bin type scenario
    When search name
    Then name should be show

Delete user bin type scenario
    Then click delete bin type list

*** Keywords ***
Click global setting button
    Click element when ready  //*[@class="float-right text-right mr-3"]

Click bin type  
    Click element when ready  //a[contains(@class, 'nav-link') and contains(text(),' Bin Type')]

Create bin type
    Click element when ready  //a[contains(text(),'Create Bin Type')]
    Input text  //*[@id="bin_type_name"]  D-BIN
    Input text  //*[@id="bin_type_dimension_height"]  10
    Input text  //*[@id="bin_type_dimension_width"]  10
    Input text  //*[@id="bin_type_dimension_long"]  10
    Input text  //*[@id="bin_type_size"]  10
    Click element when ready  //*[@name="commit"]

Check list new bin type
    Wait Until Element Is Visible  //td[contains(text(),'D-BIN')]  10
    ${check_name}=  Get text  //td[contains(text(),'D-BIN')]
    Should be equal  ${check_name}  D-BIN

Edit bin type
    Click element when ready  //*[@data-icon="pen"]  
    Input text  //*[@id="bin_type_name"]  E-BIN
    Click element when ready  //*[@name="commit"]
    
Check bin type update
    Wait Until Element Is Visible  //td[contains(text(),'E-BIN')]  10
    ${check_name}=  Get text  //td[contains(text(),'E-BIN')]
    Should be equal  ${check_name}  E-BIN

Click delete bin type list
    Wait Until Element Is Visible  (//a[@rel='icon' or @rel='nofollow'])[2]  10
    Click element when ready  (//a[@rel='icon' or @rel='nofollow'])[2]
    Handle Alert  action=ACCEPT

Search name
    Input text  //*[@type="search"]  E-BIN

Name should be show
    Wait Until Element Is Visible  //td[contains(text(),'E-BIN')]  10
    ${check_name}=  Get text  //td[contains(text(),'E-BIN')]
    Should be equal  ${check_name}  E-BIN



