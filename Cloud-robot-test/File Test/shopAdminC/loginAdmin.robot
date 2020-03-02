*** Settings ***
Documentation     This is ui testing for C004
...
...               Login for admin shop
Resource          ../../environment.robot

*** Test Cases ***
Invalid username scenario
    Given open on the website
    When invalid username     
    Then can not login
    And should be appear
    [Teardown]  close browser
Invalid password scenario 
    Given open on the website
    When invalid password      
    Then can not login
    And should be appear
    [Teardown]  close browser
Invalid both scenario
    Given open on the website
    When invalid both       
    Then can not login
    And should be appear
    [Teardown]  close browser
Empty username scenario
    Given open on the website
    When empty username      
    Then can not login
    And should be appear
    [Teardown]  close browser  
Empty password scenario
    Given open on the website
    When empty password      
    Then can not login
    And should be appear
    [Teardown]  close browser     
Empty both scenario
    Given open on the website
    When empty both       
    Then can not login
    And should be appear
    [Teardown]  close browser 

Login page scenario
    Given open on the website
    When login shop admin    
    Then Check login page should be appear
    [Teardown]  close browser 

*** Keywords *** 
Invalid username 
    Input Text      ${XPATH USERNAME}  ${INVALID USERNAME}
    Input password  ${XPATH PASSWORD}  ${PASSWORD ADMIN}

Invalid password  
    Input Text      ${XPATH USERNAME}  ${USERNAME ADMIN}
    Input password  ${XPATH PASSWORD}  ${INVALID PASSWORD}

Invalid both 
    Input Text      ${XPATH USERNAME}  ${INVALID USERNAME}
    Input password  ${XPATH PASSWORD}  ${INVALID PASSWORD}

Empty username 
    Input Text      ${XPATH USERNAME}  ${EMPTY USERNAME}
    Input password  ${XPATH PASSWORD}  ${PASSWORD ADMIN}

Empty password    
    Input Text      ${XPATH USERNAME}  ${USERNAME ADMIN}
    Input password  ${XPATH PASSWORD}  ${EMPTY PASSWORD}

Empty both 
    Input Text      ${XPATH USERNAME}  ${EMPTY USERNAME}
    Input password  ${XPATH PASSWORD}  ${EMPTY PASSWORD}

Can not login
    Click element  ${SUBMIT}

Should be appear
    Should not be empty  ${MESSAGE INVALID LOGIN}

Check login page should be appear
    # Daskboard on login page
    Select dashboard
    



    




