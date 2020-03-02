*** Settings ***
Documentation     This is ui testing for B009
...
...               Delivery mode
Resource          ../../environment.robot
Suite Teardown    close browser

*** Test Cases ***
Edit delivery mode scenario
    Given open on the website
    When login warehouse manager
    And select available warehouse
    And select warehouse setting
    And select delivery mode     
    Then edit delivery mode
    And check delivery mode update

*** Keywords ***
Edit delivery mode
    Click element when ready  //a[contains(text(),'Edit Delivery Mode')]
    Click element when ready  //label[@class='custom-control-label' and contains(text(),'EMS')]
    Click element when ready  ${SUBMIT}

Check delivery mode update
    Wait Until Element Is Visible  //td[contains(text(),'EMS')]  10
    ${check_name}=  Get text  //td[contains(text(),'EMS')]
    Should be equal  ${check_name}  EMS