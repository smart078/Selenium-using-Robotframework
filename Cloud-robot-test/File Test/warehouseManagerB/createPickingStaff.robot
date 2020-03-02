*** Settings ***
Documentation     This is ui testing for B004
...
...               Create picking staff
Resource          ../../environment.robot
Suite Teardown    close browser

*** Test Cases ***
Create new user scenario
    Given open on the website
    When login warehouse manager
    And select available warehouse
    And select user management
    Then select user list
    And create new user 
    And check new user list 

Edit user list scenario
    Then edit user list
    And check picking staff update

Search user general manager scenario
    When search name
    Then name should be show

Delete user admin shop scenario
    Then click delete user button   

*** Keywords ***
Create new user 
    Click element when ready  //a[contains(text(),'Create User')]
    Input text  //*[@id="staff_first_name"]  Picking
    Input text  //*[@id="staff_last_name"]  staff
    Input text  //*[@id="staff_phone_number"]  0894756384
    Input text  //*[@id="staff_username"]  user warehouse2
    Input text  //*[@id="staff_password"]  ${PASSWORD WAREHOUSE}
    Input text  //*[@id="staff_password_confirmation"]  ${PASSWORD WAREHOUSE}
    Click element when ready  //*[@id="staff_staff_warehouses_attributes_0_role_id"]
    Click element when ready  //option[contains(text(),'Picking staff')]
    Execute JavaScript    window.scrollTo(${x_location},${y_location})
    Click element when ready  ${SUBMIT}

Check new user list 
    Wait Until Element Is Visible  //td[contains(text(),'Picking staff')]  10
    ${check_name}=  Get text  //td[contains(text(),'Picking staff')]
    Should be equal  ${check_name}  Picking staff

Edit user list
    Click element when ready  //th[contains(text(),'Name')]
    Click element when ready  (//*[@data-toggle="dropdown"])[2]
    Click element when ready  //*[@id="dttb"]/tbody/tr[1]/td[6]/div/div/a[1]
    Input text  //*[@id="staff_first_name"]   Picking2 
    Click element when ready  ${SUBMIT}

Check picking staff update
    Wait Until Element Is Visible  //td[contains(text(),'Picking2 staff')]  10
    ${check_name}=  Get text  //td[contains(text(),'Picking2 staff')]
    Should be equal  ${check_name}  Picking2 staff

Search name
    Input text  //*[@type="search"]  Picking2 staff

Name should be show
    Wait Until Element Is Visible  //td[contains(text(),'Picking2 staff')]  10
    ${check_name}=  Get text  //td[contains(text(),'Picking2 staff')]
    Should be equal  ${check_name}  Picking2 staff

Click delete user button       
    Click element when ready  (//*[@data-toggle="dropdown"])[2]
    Click element when ready  //a[contains(text(),'Delete User')]
    Handle Alert  action=ACCEPT









