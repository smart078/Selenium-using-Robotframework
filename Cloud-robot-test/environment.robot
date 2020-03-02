*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           Collections
Library           SeleniumLibrary
Library           OperatingSystem
Library           RequestsLibrary

*** Variables ***
${URL}            https://mycloud.staging.sennalabs.com/users/sign_in
${USERNAME}       super_admin
${PASSWORD}       asdqwe123
${USERNAME WAREHOUSE}      super_admin2
${PASSWORD WAREHOUSE}      1234qwer
${USERNAME ADMIN}          super_admin4
${PASSWORD ADMIN}          qwer1234
${USERNAME SALE}           sale
${PASSWORD SALE}           rewq4321
${BROWSER}        chrome
${DELAY}          0.5
${img_upload}     mycloud-robot-test/test/super_admin/5de5784979d757159d0b6838.jpeg
${GLOBAL SETTING BUTTON}  //span[contains(text(),'Global Setting')]
${x_location}     791 
${y_location}     50
${XPATH USERNAME}       //*[@name="staff[username]"]
${XPATH PASSWORD}       //*[@name="staff[password]"]  
${SUBMIT}               //*[@name="commit"]   
${INVALID USERNAME}     INVALID 
${INVALID PASSWORD}     INVALID
${EMPTY USERNAME}       
${EMPTY PASSWORD}
${WAREHOUSE LOGIN TEXT}     //h4[contains(text(),'Choose warehouse to log in')]
${MESSAGE INVALID LOGIN}    //p[contains(text(),'Invalid Username or password.')]

*** Keywords ***
Open on the website
    # ${options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    # FOR    ${arg}    IN    --disable-infobars  --headless    --disable-gpu  --window-size=1920,1080
    #     Call Method    ${options}    add_argument    ${arg}
    # END
    # ${REAL URL}=  Get Environment Variable  UI_URL  ${URL}
    # Create WebDriver  ${BROWSER}  chrome_options=${options} 
    Open Browser  ${URL}  ${BROWSER}  
    Maximize Browser Window
    Set Selenium Speed  ${DELAY}

Login super admin
    Input Text  ${XPATH USERNAME}  ${USERNAME}
    Input PASSWORD  ${XPATH PASSWORD}  ${PASSWORD}
    Click element when ready  ${SUBMIT}

Login warehouse manager
    Input Text  ${XPATH USERNAME}  ${USERNAME WAREHOUSE}
    Input PASSWORD  ${XPATH PASSWORD}  ${PASSWORD WAREHOUSE}
    Click element when ready  ${SUBMIT}

Login shop admin
    Input Text  ${XPATH USERNAME}  ${USERNAME ADMIN}
    Input PASSWORD  ${XPATH PASSWORD}  ${PASSWORD ADMIN}
    Click element when ready  ${SUBMIT}

Login sale
    Input Text  ${XPATH USERNAME}  ${USERNAME SALE}
    Input PASSWORD  ${XPATH PASSWORD}  ${PASSWORD SALE}
    Click element when ready  ${SUBMIT}

Click element when ready
    [Arguments]    ${xpath}
    Wait Until Element Is Visible  ${xpath}  10
    Wait Until Element Is Enabled  ${xpath}  10
    Click Element  ${xpath}

Click global setting button
    Click element when ready  ${GLOBAL SETTING BUTTON} 

Select available warehouse
    Click element when ready  //div[@class="card"]

Select user management
    Click element when ready  //a[contains(@class, 'nav-link') and contains(text(),' User Management')]

Select user list
    Click element when ready  //a[contains(@class, 'nav-link') and contains(text(),' User List')]

Select warehouse setting
    Click element when ready  //a[contains(@class, 'nav-link') and contains(text(),' Warehouse Setting')]

Select location list 
    Click element when ready  //a[contains(@class, 'nav-link') and contains(text(),' Location List')]

Select bin management
    Click element when ready  //a[contains(@class, 'nav-link') and contains(text(),' Bin Management')]

Select bin type
    Click element when ready  //a[contains(@class, 'nav-link') and contains(text(),' Bin Type')]

Select delivery mode  
    Click element when ready  //a[contains(@class, 'nav-link') and contains(text(),' Delivery Mode')]

Select sale  
    Click element when ready  //a[contains(@class, 'nav-link') and contains(text(),' Sales')]

Select dashboard
    Click element when ready  //a[contains(@class, 'nav-link') and contains(text(),' Dashboard')]

Select shop management
    Click element when ready  //a[contains(@class, 'nav-link') and contains(text(),' Shop Management')]

Select shop list
    Click element when ready  //a[contains(@class, 'nav-link') and contains(text(),' Shop List')]

Select pending registration
    Click element when ready  //a[contains(@class, 'nav-link') and contains(text(),' Pending Registration')]


