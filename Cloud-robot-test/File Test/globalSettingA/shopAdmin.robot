*** Settings ***
Documentation     This is ui testing for A002
...
...               Shop admin
Resource          ../../environment.robot
Suite Teardown    close browser

*** Test Cases ***
Create shop admin scenario
    Given open on the website
    When login super admin
    And click global setting button
    And click shop admin
    Then create shop admin
    And check list new shop admin

Search user shop admin scenario
    When search name
    Then name should be show

Edit shop admin scenario
    Then edit profile
    And check edited in list

Delete user shop admin scenario
    Then click delete user button

*** Keywords ***
Click shop admin 
    Click element when ready  //a[contains(@class, 'nav-link') and contains(text(),' Shop Admin')]

Create shop admin
    Click element when ready  //a[contains(text(),'Create Shop Admin')]
    # Choose file  //input[@id="staff_picture_attributes_image"]  mycloud-robot-test/test/super_admin/5de5784979d757159d0b6838.jpeg
    Wait Until Element Is Visible  //input[@id="staff_username"]  10
    Input text  //input[@id="staff_username"]  super-test
    Input text  //*[@id='staff_first_name']  name-test
    Input text  //*[@id='staff_last_name']  last-name-test
    Input text  //*[@id='staff_email']  test@gmail.com
    Input password  //*[@id="staff_password"]  1234test
    Input password  //*[@id="staff_password_confirmation"]  1234test
    Input text  //*[@id="staff_phone_number"]  0837465812
    Click element when ready  //*[@name="commit"]

Confirm to create shop admin
    Wait Until Element Is Visible  //input[@id="staff_username"]  10
    Input text  //*[@id="staff_username"]  super-admin1
    Input text  //*[@id="staff_password"]  1234test
    Input text  //*[@id="staff_password_confirmation"]  1234test
    Click element when ready  //*[@name="commit"]

Check list new shop admin
    Wait Until Element Is Visible  //td[contains(text(),'name-test last-name-test')]  10
    ${check_name}=  Get text  //td[contains(text(),'name-test last-name-test')]
    Should be equal  ${check_name}  name-test last-name-test

Edit profile
    Click element when ready  (//*[@data-toggle="dropdown"])[2]
    Click element when ready  (//a[contains(text(),'Edit profile')])
    Wait Until Element Is Visible  //*[@id="staff_first_name"]  10
    Input text  //*[@id="staff_first_name"]  ATest 
    Click element when ready  //*[@name="commit"]
    
Check edited in list
    Click shop admin
    Wait Until Element Is Visible  //td[contains(text(),'ATest last-name-test')]  10
    ${check_name}=  Get text  //td[contains(text(),'ATest last-name-test')]
    Should be equal  ${check_name}  ATest last-name-test

Click delete user button
    Click element when ready  (//*[@data-toggle="dropdown"])[9]
    Click element when ready  //*[@id="dttb"]/tbody/tr[8]/td[5]/div/div/a[2]
    Handle Alert  action=ACCEPT

Search name
    Input text  //*[@type="search"]  name-test

Name should be show
    Wait Until Element Is Visible  //td[contains(text(),'name-test last-name-test')]  10
    ${check_name}=  Get text  //td[contains(text(),'name-test last-name-test')]
    Should be equal  ${check_name}  name-test last-name-test
