*** Settings ***
Documentation     This is ui testing for B003
...
...               Create inbound staff
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
    And check inbound staff update

Search user general manager scenario
    When search name
    Then name should be show

Delete user admin shop scenario
    Then click delete user button   

*** Keywords ***
Create new user 
    Click element when ready  //a[contains(text(),'Create User')]
    Input text  //*[@id="staff_first_name"]  Inbound
    Input text  //*[@id="staff_last_name"]  staff
    Input text  //*[@id="staff_phone_number"]  0894756384
    Input text  //*[@id="staff_username"]  user warehouse1
    Input text  //*[@id="staff_password"]  ${PASSWORD WAREHOUSE}
    Input text  //*[@id="staff_password_confirmation"]  ${PASSWORD WAREHOUSE}
    Click element when ready  //*[@id="staff_staff_warehouses_attributes_0_role_id"]
    Click element when ready  //option[contains(text(),'Inbound staff')]
    Execute JavaScript    window.scrollTo(${x_location},${y_location})
    Click element when ready  ${SUBMIT}

Check new user list 
    Wait Until Element Is Visible  //td[contains(text(),'Inbound staff')]  10
    ${check_name}=  Get text  //td[contains(text(),'Inbound staff')]
    Should be equal  ${check_name}  Inbound staff

Edit user list
    Click element when ready  //th[contains(text(),'Name')]
    Click element when ready  (//*[@data-toggle="dropdown"])[2]
    Click element when ready  //*[@id="dttb"]/tbody/tr[1]/td[6]/div/div/a[1]
    Input text  //*[@id="staff_first_name"]   Inbound2 
    Click element when ready  ${SUBMIT}

Check inbound staff update
    Click element when ready  //th[contains(text(),'Name')]
    Wait Until Element Is Visible  //td[contains(text(),'Inbound2 staff')]  10
    ${check_name}=  Get text  //td[contains(text(),'Inbound2 staff')]
    Should be equal  ${check_name}  Inbound2 staff

Search name
    Input text  //*[@type="search"]  Inbound2 staff

Name should be show
    Wait Until Element Is Visible  //td[contains(text(),'Inbound2 staff')]  10
    ${check_name}=  Get text  //td[contains(text(),'Inbound2 staff')]
    Should be equal  ${check_name}  Inbound2 staff

Click delete user button       
    Click element when ready  (//*[@data-toggle="dropdown"])[2]
    Click element when ready  //a[contains(text(),'Delete User')]
    Handle Alert  action=ACCEPT





