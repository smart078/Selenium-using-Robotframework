*** Settings ***
Documentation     This is ui testing for D001, 
...               D001.1, D001.8, D002,
...               D003, D004 and D006
...
...               Create shop account
...               Set shop profile
...               Set sale channels
...               View shop account
...               Approve shop account
...               Delete shop account
...               View as shop
Resource          ../../environment.robot
Suite Teardown    close browser

*** Test Cases ***
Create sale scenario
    Given open on the website
    When login sale
    And select shop management
    And select shop list
    Then create shop followed by set shop profile

Set sale channels scenario
    Then fill out sale channels

View shop account scenario
    Then set delivery mode 
    And set special service 
    And set packaging service

Approve shop account sceanrio
    Then approve shop account
    And should be show on shop list

Delete shop account sceanrio
    Then deactivate shop
    And should be show inactive stage

View as shop scenario   
    Then click view as shop 
    And should be show page

*** Keywords ***
create shop followed by set shop profile
    Click element when ready  //a[contains(text(),'Create Shop')]
    Input text  //*[@id="shop_name"]  Aaaaashop
    Input Text  //*[@id="shop_address"]  xxx
    Input text  //*[@id="shop_postcode"]  barcode1234
    Input text  //*[@id="shop_shop_urls"]  ${URL}
    Click element when ready  //*[@id="shop_sale_brand"]
    Click element when ready  //option[contains(text(),'SCG')]
    Click element when ready  //*[@id="shop_estimate_order_id"]
    Click element when ready  //option[contains(text(),'0 - 100 Orders per month')]
    Click element when ready  //span[contains(text(),'Select shop owner')]
    Click element when ready  //li[contains(text(),'nance jj')]

Fill out sale channels
    Click element when ready  //*[@id="LgthWdthHghtVolCalc"]/div/div[3]/div/div/div[3]
    Execute JavaScript    window.scrollTo(${x_location},${y_location})
    Click element when ready  ${SUBMIT}

Approve shop account
    Click element when ready  (//*[@data-toggle="dropdown"])[2]
    Click element when ready  //a[contains(text(),'Approve Shop')]

Should be show on shop list
    Wait Until Element Is Visible  //td[contains(text(),'Aaaaashop')]  10
    ${check_name}=  Get text  //td[contains(text(),'Aaaaashop')]
    Should be equal  ${check_name}  Aaaaashop

Deactivate shop
    Click element when ready  //th[contains(text(),'Name')]
    Click element when ready  (//*[@data-toggle="dropdown"])[2]
    Click element when ready  //*[@id="dttb"]/tbody/tr[1]/td[6]/div/div/a[3]

Should be show inactive stage
    Wait Until Element Is Visible  //*[@id="dttb"]/tbody/tr[1]/td[4]  10
    ${inactive}=  Get text  //*[@id="dttb"]/tbody/tr[1]/td[4]
    Should be equal  ${inactive}  Inactive

Click view as shop
    Click element when ready  //th[contains(text(),'Name')]
    Click element when ready  (//*[@data-toggle="dropdown"])[2]
    Click element when ready  //*[@id="dttb"]/tbody/tr[1]/td[6]/div/div/a[1]

Should be show page
    Should not be empty  //span[contains(text(),'Overview')]

Set delivery mode 
    Click element when ready  //a[contains(text(),'Add delivery mode')]
    Click element when ready  //a[contains(text(),'Add Delivery Mode')]
    Click element when ready  //*[@id="shop_delivery_delivery_id"]
    Click element when ready  //option[contains(text(),'EMS')]
    Input text  //*[@id="shop_delivery_cod_account"]  text
    Click element when ready  ${SUBMIT}

Set special service
    Click element when ready  //a[contains(text(),'Special Service Setting')]
    Click element when ready  //a[contains(text(),'Add Special Service')]
    Click element when ready  //*[@id="shop_premium_service_premium_service_id"]
    Click element when ready  //option[contains(text(),'Shopee')]
    Click element when ready  ${SUBMIT}
    # edit
    Click element when ready  (//*[@data-icon='pencil-alt'])[1]
    Click element when ready  //*[@id="shop_premium_service_premium_service_id"]
    Click element when ready  //option[contains(text(),'EMS')]
    Click element when ready  ${SUBMIT}
    # search 
    Input text  //*[@type="search"]  EMS

Set packaging service
    Click element when ready  //a[contains(text(),'Create Packaging')]




