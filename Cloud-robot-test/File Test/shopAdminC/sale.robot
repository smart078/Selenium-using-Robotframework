*** Settings ***
Documentation     This is ui testing for C001 and C003
...
...               Create and delete sale
Resource          ../../environment.robot
Suite Teardown    close browser

*** Test Cases ***
Create sale scenario
    Given open on the website
    When login shop admin
    And select user management
    And select sale  
    Then create sale
    And check new sale update

Edit sale scenario
    Then edit sale
    And check sale update

Search user general manager scenario
    When search name
    Then name should be show

Delete user admin shop scenario
    Then click delete user button 

*** Keywords ***
Create sale
    Click element when ready  //a[contains(text(),'Create Sale')]
    Input text  //*[@id="staff_username"]  saleTest
    Input password  //*[@id="staff_password"]  ${PASSWORD ADMIN}
    Input password  //*[@id="staff_password_confirmation"]  ${PASSWORD ADMIN}
    Input text  //*[@id="staff_first_name"]  ASale 
    Input text  //*[@id="staff_last_name"]  test
    Input text  //*[@id="staff_email"]  saleA@example.com
    Input text  //*[@id="staff_phone_number"]  0847563846
    Click element when ready  ${SUBMIT} 

Check new sale update
    Wait Until Element Is Visible  //td[contains(text(),'ASale test')]  10
    ${check_name}=  Get text  //td[contains(text(),'ASale test')]
    Should be equal  ${check_name}  ASale test

Edit sale
    Click element when ready  //th[contains(text(),'Name')]
    Click element when ready  (//*[@data-toggle="dropdown"])[2]
    Click element when ready  //*[@id="dttb"]/tbody/tr[1]/td[6]/div/div/a[1]
    Input text  //*[@id="staff_first_name"]   ASale2 
    Click element when ready  ${SUBMIT}
    select sale

Check sale update  
    Wait Until Element Is Visible  //td[contains(text(),'ASale2 test')]  10
    ${check_name}=  Get text  //td[contains(text(),'ASale2 test')]
    Should be equal  ${check_name}  ASale2 test

Search name
    Input text  //*[@type="search"]  ASale2 test

Name should be show
    Wait Until Element Is Visible  //td[contains(text(),'ASale2 test')]  10
    ${check_name}=  Get text  //td[contains(text(),'ASale2 test')]
    Should be equal  ${check_name}  ASale2 test


Click delete user button       
    Click element when ready  (//*[@data-toggle="dropdown"])[2]
    Click element when ready  //a[contains(text(),'Delete User')]
    Handle Alert  action=ACCEPT