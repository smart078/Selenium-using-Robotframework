*** Settings ***
Documentation     This is ui testing for A008
...
...               Warehouse manager
Resource          ../../environment.robot
Suite Teardown    close browser

*** Test Cases ***
Create warehouse scenario
    Given open on the website
    When login super admin
    And click global setting button
    Then create warehouse manager
    And check list new warehouse manager

Edit warehouse manager scenario
    Then edit profile
    And check edited in list

Delete user warehouse manager scenario
    Then click delete user button

*** Keywords ***
Click global setting button
    Click element when ready  //*[@class="float-right text-right mr-3"]  

Create warehouse manager
    Click element when ready  //*[@class="btn btn-primary btn-sm create-user-btn"]
    Input text  //*[@placeholder="Username"]  test12
    Input text  //*[@name="staff[phone_number]"]  +66996485632
    Input text  //*[@name="staff[first_name]"]  name-test3
    Input text  //*[@name="staff[last_name]"]  last-name-test3
    Input text  //*[@name="staff[password]"]  123456789
    Input text  //*[@name="staff[password_confirmation]"]  123456789
    Click element when ready  //*[@id="staff_warehouse_ids"]/option 
    Click element when ready  //*[@name="commit"]

Check list new warehouse manager
    Wait Until Element Is Visible  //td[contains(text(),'name-test3 last-name-test3')]  10
    ${check_name}=  Get text  //td[contains(text(),'name-test3 last-name-test3')]
    Should be equal  ${check_name}  name-test3 last-name-test3

Edit profile
    Click element when ready  (//*[@data-icon="pen"])[3]
    Input text  //*[@id="staff_first_name"]  test
    Click element when ready  //*[@name="commit"]
    Click element when ready  //a[contains(@class, 'nav-link') and contains(text(),' Warehouse Manager')]

Check edited in list
    Wait Until Element Is Visible  //td[contains(text(),'test last-name-test3')]  10
    ${check_name}=  Get text  //td[contains(text(),'test last-name-test3')]
    Should be equal  ${check_name}  test last-name-test3

Click delete user button
    Wait Until Element Is Visible  (//a[@rel='icon' or @rel='nofollow'])[4]  10
    Click element when ready  (//a[@rel='icon' or @rel='nofollow'])[2]
    Handle Alert  action=ACCEPT


    



   
    