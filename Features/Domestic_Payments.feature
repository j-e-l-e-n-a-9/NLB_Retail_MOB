Feature: Domestic_Payments

  @Payments_Domestic_Payments_Cancel_Button_[MOB_ANDROID]
  Scenario Outline: Payments_Domestic_Payments_Cancel_Button_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    And Click on element by text "Pay"
    And Click on element by text "Domestic payment"

    When Enter text from excel "<rowindex>" columnName "currentDomesticAccountBBAN" in element id "nlb-input-creditor-account"
    And Enter text "IME" in element id "nlb-input-creditor-name"
    And Enter text "ADR" in element id "nlb-input-creditor-address"
    And Enter text "GRD" in element id "nlb-input-creditor-city"

    And Swipe vertical
    And Scroll down until element with text "Cancel" is in view
    And Assert Payment amount label is displayed correctly
    And Enter text "0,1" in element id "nlb-amount-with-currency-field"
    And Enter text "ABC" in element id "nlb-input-purpose"
    And Assert element by text "Payment date"
    And Assert element "nlb-input-payment-date" by id
    And Assert element by content desc "Set date"
    And Assert element "nlb-checkbox-urgent-payment" by id
    And Click on element by text "Cancel"
    And Assert element by text "Are you sure?"
    And Assert element by text "Yes"
    And Assert element by text "No"
    And Click on element by text "No"
#    And Click on element by id "nlb-dropdown-menu"
#    And Click on element by contains text "DIGITAL ASSETS"

    Then Click on element by text "Confirm"
    And Wait element "Payment amount" by text
    And Assert element by text "Payment review"
#    And Assert that text "First and last name / Company name" has first following sibling with text "IME"
#    And Assert that text "Address" has first following sibling with text "ADR"
#    And Assert that text "Account number" has first following sibling from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Scroll down until element with text "Cancel" is in view
    And Click on element by text "Cancel"
    And Assert element by text "Are you sure?"
    And Assert element by text "Cancelling now will terminate the payment process"
    And Click on element by text "No"

    And Click on element by text "Cancel"
    And Assert element by text "Are you sure?"
    And Assert element by text "Cancelling now will terminate the payment process"
    And Click on element by text "Yes"
    
    And Wait element "Domestic payment" by text
    And Assert element by text "Payments and transfers"
    And Assert element by text "Domestic payment"
    And Assert element by text "Internal transfer"
    And Assert element by text "IPS Payments"
    And Assert element by text "Prenesi"
    And Assert element by text "Domestic payment"
    And Assert element by text "Currency exchange"

    Examples:
      | rowindex |
      |        7 |


  @Payments-Domestic_Payments-Back_Button_[MOB_ANDROID]
  Scenario Outline: Payments-Domestic_Payments-Back_Button_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click on element by text "Pay"
    And Wait for element by text "Domestic payment" to appear for "30" seconds
    And Click on element by text "Domestic payment"
    And Wait for element by id "nlb-input-creditor-account" to appear
    And Assert element by text "Account number"
    And Enter text "205-9001007668260-25" in element id "nlb-input-creditor-account" and remember it under key "keyAccountNumber"
    And Assert element by text "Name"
    And Enter text "Aleksa" in element id "nlb-input-creditor-name"
    And Assert element by text "Address"
    And Enter text "Kaludjerica 11" in element id "nlb-input-creditor-address"
    And Assert element by text "City"
    And Enter text "Beograd" in element id "nlb-input-creditor-city"
    And Assert element by id "nlb-checkbox-save-recipient" is checked "false"
    And Swipe vertical
    And Scroll down until element with text "Reference number" is in view
    And Assert element by text "Purpose"
    And Assert Payment amount label is displayed correctly
    And Enter text "0,1" in element id "nlb-amount-with-currency-field"
    And Swipe vertical
    And Scroll down until element with text "Confirm" is in view
    And Assert element by text "Reference number"
    And Assert element by text "Payment date"
    And Assert element by content desc "Set date"
    And Click on element by text "Confirm"

    Then Wait for element by text "Payment amount"
    And Assert element by text "Payment amount"
    And Assert element by text "0.10 RSD"
    
    And Assert element by text "Recipient"
    And Assert element by text "Debtor"
    And Click on element by desc "Back"
    And Wait element "Recipient" by text
    And Assert element by text "Domestic Payment"
    
    And Assert element by text from key "keyAccountNumber" is displayed
    And Assert element by text "Aleksa"
    And Assert element by text "Kaludjerica 11"
    And Assert element by text "Beograd"
    And Swipe vertical
    And Assert element by text "0,10"

    Examples:
      | rowindex |
      |        7 |


  @Payments-Domestic_Payments-Create_New_Recipient_[MOB_ANDROID]
  Scenario Outline: Payments-Domestic_Payments-Create_New_Recipient_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    And Click on element by text "My Products"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "currentDomesticAccountBBAN" is in view
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Remember available balance in currency "RSD" under key "IT_001_Debtor_Balance"
    And Click "Back" content description from view tag "View"

    When Click on element by text "Pay"
    And Wait for element by text "Domestic payment" to appear for "30" seconds
    And Click on element by text "Domestic payment"
    And Wait for element by id "nlb-input-creditor-account" to appear
    And Assert element by text "Account number"
    And Enter text "205-9001007668260-25" in element id "nlb-input-creditor-account" and remember it under key "keyAccountNumber"
    And Assert element by text "Name"
    And Enter text "Automatizacija Dva" in element id "nlb-input-creditor-name" and remember it under key "keyName"
    And Assert element by text "Address"
    And Enter text "Kaludjerica 11" in element id "nlb-input-creditor-address" and remember it under key "keyAddress"
    And Assert element by text "City"
    And Enter text "Beograd" in element id "nlb-input-creditor-city" and remember it under key "keyCity"
    And Assert element by id "nlb-checkbox-save-recipient" is checked "false"
    And Click on element by id "nlb-checkbox-save-recipient"
    And Swipe vertical
    And Scroll down until element with text "Purpose" is in view
    And Assert element by text "Purpose"
    And Assert Payment amount label is displayed correctly
    And Enter text "2" in element id "nlb-amount-with-currency-field" and remember it under key "keyAmount"
    And Assert purpose code has default "289" value
    And Swipe vertical
    And Swipe until element with text "Cancel" is displayed
    And Scroll down until element with text "Confirm" is in view
    And Assert element by text "Reference number"
    And Assert element by text "Payment date"
    And Assert element by content desc "Set date"
    And Assert payment date is todays date and in valid date format
    And Assert element by id "nlb-checkbox-urgent-payment" is checked "true"
    And Click on element by id "nlb-button-primary"

    And Wait for element by text "Payment amount"
    And Assert element by text "Payment amount"
    And Assert element by text "2.00 RSD"

    And Assert element by text "Recipient"
#    And Assert element by text from key "keyAmount" is displayed
#    And Assert element by text from key "keyAccountNumber" is displayed
    And Assert element by text from key "keyName" is displayed
    And Assert element by text from key "keyAddress" is displayed
    And Assert element by text from key "keyCity" is displayed
    And Swipe vertical
    And Swipe until element with text "Cancel" is displayed

    And Assert element by text "Debtor"
    And Assert element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Assert element by text from excel "<rowindex>" columnName "account_details_owner2"
    And Assert "Value date" date value is in valid date format
    And Assert element by text "Urgent payment"
    And Assert element by text "Purpose code"
    And Assert element by text "Purpose"

    And Click on element by id "nlb-button-primary"
    And Assert element by contains text "Success"
    And Assert element by text "Do you want to save payment data?"
    And Assert element by text "Close without saving"
    And Assert element by text "Save recipient"
    And Assert element by text "Save template"
    And Assert element by text "Save both"
    And Click on element by text "Save recipient"
    And Assert element by contains text "Success"
    And Assert element by contains text "Recipient saved"
    And Wait for element by contains text "Payments"

    And Click on element by text "My Products"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "currentDomesticAccountBBAN" is in view
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Check if current balance is lowered by "3" using balance from key "IT_001_Debtor_Balance" for currency "RSD"
    And Click "Back" content description
    And Wait for element by id "nlb-value-product-primary-balance" to appear

    Then Click on element by text "Pay"
    And Click on element by text "Recipients"
    And Wait for first recipient
    And Swipe vertical
    And Scroll down until element with text from key "keyName" is in view
    And Assert element by text from key "keyName" is displayed
    And Click "Back" content description

    And Click on element by text "Domestic payment"
    And Wait for element by text "Domestic payment"
    And Click on element by text "Select from list"
    And Wait for element by text "Select recipient"
    And Click on "Select recipient" option in Select recipient page
    And Swipe vertical
    And Scroll down until element with text from key "keyName" is in view
    And Assert element by text from key "keyName" is displayed

    Examples:
      | rowindex |
      |        5 |


  @Payments-Domestic_Payments-Modify_Data_[MOB_ANDROID]
  Scenario Outline: Payments-Domestic_Payments-Modify_Data_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    And Click on element by text "My Products"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "currentDomesticAccountBBAN" is in view
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Remember available balance in currency "RSD" under key "IT_001_Debtor_Balance"
    And Click "Back" content description from view tag "View"

    When Click on element by text "Pay"
    And Wait for element by text "Domestic payment" to appear for "30" seconds
    And Click on element by text "Domestic payment"
    And Wait for element by id "nlb-input-creditor-account" to appear
    And Assert element by text "Account number"
    And Enter text from excel "<rowindex>" columnName "domestic_payment_bban" in element id "nlb-input-creditor-account" and remember it under key "keyAccountNumber"
    And Assert element by text "Name"
    And Enter text "Automatizacija Dva" in element id "nlb-input-creditor-name" and remember it under key "keyName"
    And Assert element by text "Address"
    And Enter text "Kaludjerica 11" in element id "nlb-input-creditor-address" and remember it under key "keyAddress"
    And Assert element by text "City"
    And Enter text "Beograd" in element id "nlb-input-creditor-city" and remember it under key "keyCity"
    And Assert element by id "nlb-checkbox-save-recipient" is checked "false"
    And Click on element by id "nlb-checkbox-save-recipient"
    And Assert element by id "nlb-checkbox-save-recipient" is checked "true"
    And Swipe vertical
    And Scroll down until element with text "Purpose" is in view
    And Assert element by text "Purpose"
    And Assert Payment amount label is displayed correctly
    And Enter text "7" in element id "nlb-amount-with-currency-field" and remember it under key "keyAmount"
    And Assert purpose code has default "289" value
    And Swipe vertical
    And Swipe until element with text "Cancel" is displayed
    And Scroll down until element with text "Confirm" is in view
    And Assert element by text "Reference number"
    And Assert element by text "Payment date"
    And Assert element by content desc "Set date"
    And Assert payment date is todays date and in valid date format
    And Assert element by id "nlb-checkbox-urgent-payment" is checked "true"
    And Click on element by id "nlb-button-primary"

    Then Wait for element by text "Payment amount"
    And Assert element by text "Payment amount"
    And Assert element by text "7.00 RSD"

    And Assert element by text "Recipient"
#    And Assert element by text from key "keyAmount" is displayed
#    And Assert element by text from key "keyAccountNumber" is displayed
    And Assert element by text from key "keyName" is displayed
    And Assert element by text from key "keyAddress" is displayed
    And Assert element by text from key "keyCity" is displayed
    And Swipe vertical
    And Swipe until element with text "Cancel" is displayed

    And Assert element by text "Debtor"
    And Assert element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Assert element by text from excel "<rowindex>" columnName "account_details_owner2"

    And Assert element by text "Payment"
    And Assert "Value date" date value is in valid date format
    And Assert element by text "Urgent payment"
    And Assert element by text "Purpose code"
    And Assert element by text "Purpose"

    And Click on element by desc "Back"
    And Wait for element by text "Debtor"
    And Enter text "205-9001007668260-25" in element id "nlb-input-creditor-account" and remember it under key "keyAccountNumber"
    And Assert element by text "Name"
    And Enter text "Jail" in element id "nlb-input-creditor-name" and remember it under key "keyName"
    And Assert element by text "Address"
    And Enter text "Vinca" in element id "nlb-input-creditor-address" and remember it under key "keyAddress"
    And Assert element by text "City"
    And Enter text "Novi Sad" in element id "nlb-input-creditor-city" and remember it under key "keyCity"
    And Assert element by id "nlb-checkbox-save-recipient" is checked "true"
    And Swipe vertical
    And Scroll down until element with text "Purpose" is in view
    And Assert element by text "Purpose"
#    And Assert Payment amount label is displayed correctly
    And Enter text "9" in element id "nlb-amount-with-currency-field" and remember it under key "keyAmount"
    And Assert purpose code has default "289" value
    And Swipe vertical
    And Swipe until element with text "Cancel" is displayed
    And Scroll down until element with text "Confirm" is in view
    And Assert element by text "Reference number"
    And Assert element by text "Payment date"
    And Assert element by content desc "Set date"
    And Assert payment date is todays date and in valid date format
    And Assert element by id "nlb-checkbox-urgent-payment" is checked "true"
    And Click on element by id "nlb-button-primary"

    And Wait for element by text "Payment amount"
    And Assert element by text "Payment amount"
    And Assert element by text "9.00 RSD"

    And Assert element by text "Recipient"
#    And Assert element by text from key "keyAmount" is displayed
#    And Assert element by text from key "keyAccountNumber" is displayed
    And Assert element by text from key "keyName" is displayed
    And Assert element by text from key "keyAddress" is displayed
    And Assert element by text from key "keyCity" is displayed
    And Swipe vertical
    And Swipe until element with text "Cancel" is displayed

    And Assert element by text "Debtor"
    And Assert element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Assert element by text from excel "<rowindex>" columnName "account_details_owner2"

    And Assert element by text "Payment"
    And Assert "Value date" date value is in valid date format
    And Assert element by text "Urgent payment"
    And Assert element by text "Purpose code"
    And Assert element by text "Purpose"

    And Click on element by id "nlb-button-primary"
    And Assert element by contains text "Success"
    And Wait for element by text "Close without saving"
    And Assert element "nlb-card-container" by id
    And Assert element by text "Do you want to save payment data?"
    And Assert element by text "After saving payment data you can reuse it for future payment."
    And Assert element by id "nlb-button-text" that has descendant text "Close without saving"
    And Assert element by id "nlb-button-primary" that has descendant text "Save recipient"
    And Assert element by id "nlb-button-primary" that has descendant text "Save template"
    And Assert element by id "nlb-button-primary" that has descendant text "Save both"
    And Click on element by text "Save recipient"
    And Assert element by contains text "Success"
#    And Assert element by contains text "Recipient saved"
    And Wait for element by contains text "Payments"

    And Click on element by text "My Products"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "currentDomesticAccountBBAN" is in view
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Check if current balance is lowered by "9" using balance from key "IT_001_Debtor_Balance" for currency "RSD"
    And Click "Back" content description
    And Wait for element by id "nlb-value-product-primary-balance" to appear

    Then Click on element by text "Pay"
    And Wait for element by contains text "Payments"

    And Click on element by text "Recipients"
    And Wait for first recipient
#    And Swipe vertical
    And Scroll down until element with text from key "keyName" is in view
    And Assert element by text from key "keyName" is displayed
    And Click "Back" content description

    And Click on element by text "Domestic payment"
    And Wait for element by text "Debtor"
    And Click on element by id "nlb-button-alternate"
    And Wait for element by text "Select recipient"
    And Click on "Select recipient" option in Select recipient page
#    And Swipe vertical
    And Scroll down until element with text from key "keyName" is in view
    And Assert element by text from key "keyName" is displayed

    Examples:
      | rowindex |
      |        5 |


  @Payments-Domestic_Payments-In_Future_[MOB_ANDROID]
  Scenario Outline: Payments-Domestic_Payments-In_Future_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click on element by text "Pay"
    And Wait for element by text "Domestic payment" to appear for "30" seconds
    And Click on element by text "Domestic payment"
    And Wait for element by id "nlb-input-creditor-account" to appear
    And Enter text "205900100779094488" in element id "nlb-input-creditor-account" and remember it under key "keyAccountNumber"
    And Assert element by text "Name"
    And Enter text "Kablovska Test" in element id "nlb-input-creditor-name" and remember it under key "keyName"
    And Assert element by text "Address"
    And Enter text "Lestane 23" in element id "nlb-input-creditor-address" and remember it under key "keyAddress"
    And Assert element by text "City"
    And Enter text "Nis" in element id "nlb-input-creditor-city" and remember it under key "keyCity"
    And Assert element by id "nlb-checkbox-save-recipient" is checked "false"
    And Click on element by id "nlb-checkbox-save-recipient"
    And Swipe vertical
    And Scroll down until element with text "Purpose" is in view
    And Assert Payment amount label is displayed correctly
    And Enter text "0,1" in element id "nlb-amount-with-currency-field" and remember it under key "keyAmount"
    And Assert element by text "Purpose"
#    And Enter text "Payment for services" in element id "nlb-input-purpose" and remember it under key "keyPurpose"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "keyPurpose" in txt file
    And Swipe vertical
    And Swipe until element with text "Cancel" is displayed
    And Scroll down until element with text "Confirm" is in view
    And Assert element by text "Reference number"
    And Assert purpose code has default "289" value
    And Assert element by content desc "Set date"
    And Assert payment date is todays date and in valid date format
    And Click on element by desc "Set date"
    And Click on date in Calendar 30 days in future and assert that it is shown correctly
#    And Click on element by text "Add filter"
    And Click on button Confirm in Calendar
    And Assert element by id "nlb-checkbox-urgent-payment" is checked "false"
    And Click on element by id "nlb-button-primary"

    Then Wait for element by text "Payment amount"
    And Assert element by text "Payment amount"
    And Assert element by text "0.10 RSD"

    And Assert element by text "Recipient"
#    And Assert element by text from key "keyAmount" is displayed
#    And Assert element by text from key "keyAccountNumber" is displayed
    And Assert element by text from key "keyName" is displayed
    And Assert element by text from key "keyAddress" is displayed
    And Assert element by text from key "keyCity" is displayed
    And Swipe until element with text "Cancel" is displayed

    And Assert element by text "Debtor"
    And Assert element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Assert element by text from excel "<rowindex>" columnName "account_details_owner2"
    And Assert "Value date" date value is in valid date format
    And Assert element by text "Purpose code"
    And Assert element by text "Purpose"

    And Click on element by id "nlb-button-primary"
    And Enter PIN
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Close without saving"
    And Assert element "nlb-card-container" by id
    And Wait for element by id "transactions-web-close-popup-nlb-button" to appear
    And Click on button by id "transactions-web-close-popup-nlb-button"
    And Assert element by text "Do you want to save payment data?"
    And Assert element by text "After saving payment data you can reuse it for future payment."
    And Assert element by id "nlb-button-text" that has descendant text "Close without saving"
    And Assert element by id "nlb-button-primary" that has descendant text "Save recipient"
    And Assert element by id "nlb-button-primary" that has descendant text "Save template"
    And Assert element by id "nlb-button-primary" that has descendant text "Save both"
    And Click on element by text "Save recipient"
    And Wait for element by id "nlb-cta-button" to appear

    And Click on element by text "Upcoming payments"
    And Scroll until element with contains text under key "keyPurpose" is in view and click
#    And Assert element by text from key "keyAccountNumber" is displayed
    And Assert element by text from key "keyName" is displayed
    And Assert element by text from key "keyAddress" is displayed
    And Assert element by text from key "keyCity" is displayed
    And Click "Back" content description
    And Wait for element by text "Upcoming payments"
    And Click "Back" content description

    And Click on element by text "Recipients"
    And Wait for first recipient
#    And Swipe vertical
    And Scroll down until element with text from key "keyName" is in view
    And Assert element by text from key "keyName" is displayed
    And Click "Back" content description

    And Click on element by text "Domestic payment"
    And Wait for element by text "Debtor"
    And Click on element by id "nlb-button-alternate"
    And Wait for element by text "Select recipient"
    And Click on "Select recipient" option in Select recipient page
#    And Swipe vertical
    And Scroll down until element with text from key "keyName" is in view
    And Assert element by text from key "keyName" is displayed

    Examples:
      | rowindex |
      |        5 |


  @Payments-Domestic_Payments-Input-invalid_[MOB_ANDROID]
  Scenario Outline: Payments-Domestic_Payments-Input-invalid_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click on element by text "Pay"
    And Wait for element by text "Domestic payment" to appear for "30" seconds
    And Click on element by text "Domestic payment"
    And Wait for element by id "nlb-input-creditor-account" to appear

    #account number
    And Assert element by text "Account number"
    And Enter text "++=" in element id "nlb-input-creditor-account"
    And Assert element by text "Account number is required"
    And Enter text "9999" in element id "nlb-input-creditor-account"
    And Assert element by text "Incorrect account number"
    And Enter text "20590010078398629545896" in element id "nlb-input-creditor-account"
    And Assert element by text "205900100783986295"
    And Enter text "" in element id "nlb-input-creditor-account"
    And Assert element by text "Account number is required"

    #name
    And Assert element by text "Name"
    And Enter text "=+=" in element id "nlb-input-creditor-name"
    And Assert element by contains text "Please use the following characters:"
    And Enter text ";-D" in element id "nlb-input-creditor-name"
    And Assert element by contains text "Please use the following characters:"
    And Enter text "G" in element id "nlb-input-creditor-name"
    And Assert element by text "Minimum length is 2."
    And Enter text "" in element id "nlb-input-creditor-name"
    And Assert element by text "Name is required"
    And Enter text "Lorem ipsum dolor sit amet, consectetuer adipiscin" in element id "nlb-input-creditor-name"
    And Assert element by text "Maximum number of characters is 40."
    And Enter text "Ime" in element id "nlb-input-creditor-name"

    #address
    And Assert element by text "Address"
    And Enter text "=+=" in element id "nlb-input-creditor-address"
    And Assert element by contains text "Please use the following characters:"
    And Enter text ";-D" in element id "nlb-input-creditor-address"
    And Assert element by contains text "Please use the following characters:"
    And Enter text "G" in element id "nlb-input-creditor-address"
    And Assert element by text "Minimum length is 2."
    And Enter text "" in element id "nlb-input-creditor-address"
    And Assert element by text "Address is required"
    And Enter text "Lorem ipsum dolor sit amet, consectetuer adipiscin" in element id "nlb-input-creditor-address"
    And Assert element by text "Maximum number of characters is 35."
    And Enter text "Adresa" in element id "nlb-input-creditor-address"

    #city
    And Assert element by text "City"
    And Enter text "=+==" in element id "nlb-input-creditor-city"
    And Assert element by contains text "Please use the following characters:"
    And Enter text ";-D" in element id "nlb-input-creditor-city"
    And Assert element by contains text "Please use the following characters:"
    And Enter text "G" in element id "nlb-input-creditor-city"
    And Assert element by text "Minimum length is 2."
    And Enter text "" in element id "nlb-input-creditor-city"
    And Assert element by text "City is required"
    And Enter text "Lorem ipsum dolor sit amet, consectetuer adipiscin" in element id "nlb-input-creditor-city"
    And Assert element by text "Maximum number of characters is 35."
    And Enter text "Grad" in element id "nlb-input-creditor-city"

    And Assert element by id "nlb-checkbox-save-recipient" is checked "false"
    And Swipe vertical

    #amount
    Then Enter text "9999999999999" in element id "nlb-amount-with-currency-field"
    And Assert element by text "Maximum amount is 999.999.999,99 RSD."
    And Enter text "" in element id "nlb-amount-with-currency-field"
    And Assert element by text "Payment amount is required"
    And Enter text "0,00" in element id "nlb-amount-with-currency-field"
    And Assert element by text "Minimum amount is 0,01 RSD"
    And Enter text "0" in element id "nlb-amount-with-currency-field"
    And Assert element by text "Minimum amount is 0,01 RSD"
    And Enter text "100.54" in element id "nlb-amount-with-currency-field"
    And Assert element by text "100,54"
    And Enter text "Amount" in element id "nlb-amount-with-currency-field"
    And Assert element by text "0,00"
    And Assert element by text "Payment amount is required"

    #purpose
    And Enter text "=+==" in element id "nlb-input-purpose"
    And Assert element by text "Please use the following characters:"
    And Enter text "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis." in element id "nlb-input-purpose"
    And Assert element by text "Maximum number of characters is 140."
    And Enter text "" in element id "nlb-input-purpose"
    And Assert element by text "Purpose is required"
    And Swipe vertical

    #model
    And Click "Model, -" content description
    And Assert Model dropdown has just "-" "97" "11"
    And Click on element by text "-"

    #reference number
    And Enter text "=+==" in element id "nlb-input-reference-number"
    And Assert element by text "Please use the following characters:"
    And Enter text "Lorem ipsum dolor sit ame" in element id "nlb-input-reference-number"
    And Assert element by text "Maximum number of characters is 24."

    And Assert element by id "nlb-checkbox-urgent-payment" is checked "true"
    And Assert element "nlb-button-text" by id
    And Assert element "nlb-button-primary" by id
    And Assert element by text "Confirm" is not clickable

    Examples:
      | rowindex |
      |        5 |


  @Payments-Domestic_Payments-Confirmation_[MOB_ANDROID]-Internal_Urgent_Payment
  Scenario Outline: Payments-Domestic_Payments-Confirmation_[MOB_ANDROID]-Internal_Urgent_Payment

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    And Click on element by text "My Products"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Remember available balance in currency "RSD" under key "IT_001_Debtor_Balance"
    And Click "Back" content description from view tag "View"

    When Click on element by text "Pay"
    And Wait for element by text "Domestic payment" to appear for "30" seconds
    And Click on element by text "Domestic payment"
    And Wait for element by id "nlb-input-creditor-account" to appear
    And Assert element by text "Account number"
    And Enter text "205900100779094488" in element id "nlb-input-creditor-account" and remember it under key "keyAccountNumber"
    And Assert element by text "Name"
    And Send random text to field with id "nlb-input-creditor-name" and remember it under key "keyName"
    And Assert element by text "Address"
    And Enter text "Vinca 13" in element id "nlb-input-creditor-address" and remember it under key "keyAddress"
    And Assert element by text "City"
    And Enter text "Beograd" in element id "nlb-input-creditor-city" and remember it under key "keyCity"
    And Assert element by id "nlb-checkbox-save-recipient" is checked "false"
    And Swipe vertical
    And Scroll down until element with text "Purpose" is in view
    And Assert element by text "Purpose"
    And Assert Payment amount label is displayed correctly
    And Enter text "1" in element id "nlb-amount-with-currency-field" and remember it under key "keyAmount"
    And Assert purpose code has default "289" value
    And Swipe vertical
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "keyPurpose" in txt file
    And Swipe until element with text "Cancel" is displayed
    And Scroll down until element with text "Confirm" is in view
    And Assert element by text "Reference number"
    And Assert element by text "Payment date"
    And Assert element by content desc "Set date"
    And Assert payment date is todays date and in valid date format
    And Assert element by id "nlb-checkbox-urgent-payment" is checked "true"
    And Click on element by id "nlb-button-primary"

    And Wait for element by text "Payment amount"
    And Assert element by text "Payment review"
    And Assert that text "Payment amount" has first following sibling that contains text "1.00 RSD"
    And Assert that text "Fee" has first following sibling that contains text "0.00 RSD"

    And Assert element by text "Recipient"
#    And Assert element by text from key "keyAmount" is displayed
#    And Assert element by text from key "keyAccountNumber" is displayed
    And Assert element by text from key "keyName" is displayed
    And Assert element by text from key "keyAddress" is displayed
    And Assert element by text from key "keyCity" is displayed
    And Swipe vertical
    And Swipe until element with text "Cancel" is displayed

    And Assert element by text "Debtor"
    And Assert element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Assert element by text from excel "<rowindex>" columnName "account_details_owner2"
    And Assert "Value date" date value is in valid date format
    And Assert element by text "Urgent payment"
    And Assert element by text "Purpose code"
    And Assert element by text "Purpose"
    And Assert element by text from key "keyPurpose" is displayed

    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Enter PIN"
    And Enter PIN
    And Assert element by text "Payment amount"
    And Assert element by text "1,00 RSD"
    And Assert element by text from key "keyAccountNumber" is displayed
    And Assert element by text from key "keyName" is displayed
    And Assert element by text from key "keyAddress" is displayed
    And Assert element by text from key "keyCity" is displayed
    And Scroll to element by text "Purpose"
#    And Assert element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Assert element by text from excel "<rowindex>" columnName "account_details_owner2"
    And Assert Value date is todays date and in valid date format
    And Assert element by text "Urgent payment"
    And Assert element by id "transactions-web-popup-info" has text "Yes"
    And Assert element by text "Purpose code"
    And Assert element by id "transactions-web-popup-info" has text "289"
    And Assert element by text from key "keyPurpose" is displayed
    And Assert element by id "nlb-button-alternate" that has descendant text "Reject"
    And Assert element by id "nlb-button-primary" that has descendant text "Confirm"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "transactions-web-close-popup-icon" to appear
    And Assert element by text "Confirmation successful"
    And Assert element by contains text "Your payment was successfully accepted"
    And Click on element by id "transactions-web-close-popup-nlb-button"
    
    Then Wait for element by text "Past payments"
    And Click on element by text "Past payments"
    And Wait for first Past payment
    And Wait "5" seconds
    And Scroll until element with text under key "keyPurpose" is in view and click
#    And Click on element by text from key "keyPurpose"
    And Assert element by text "Recipient name" has first following sibling from key "keyName"
    And Assert element by text from key "keyAddress" is displayed
    And Assert element by text from key "keyCity" is displayed
    And Assert Recipient account number in Payment details in Past payments is from key "keyAccountNumber"
    And Assert that text "Purpose code" has first following sibling that contains text "289"
    And Swipe vertical
    And Assert element by text "Purpose" has first following sibling from key "keyPurpose"
    And Assert that text "Debtor name" has first following sibling from excel "<rowindex>" columnName "account_details_owner"
    And Assert that text "Debtor account" has first following sibling from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Assert that text "Fee" has first following sibling that contains text "0,00 RSD"
    And Assert that text "Payment status" has first following sibling that contains text "Executed"
    And Assert element by id "nlb-button-primary" that has descendant text "Repeat payment"
    And Click "Back" content description
    And Wait for first Past payment
    And Click "Back" content description

    And Click on element by text "My Products"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Check if current balance is lowered by "1" using balance from key "IT_001_Debtor_Balance" for currency "RSD"
    And Assert first transaction have Purpose under key "keyPurpose"
    And Assert first transaction have Creditor name under key "keyName"
    And Assert first transaction have Amount under key "keyAmount"
    And Click on element by text from key "keyPurpose"
    And Assert element by id "nlb-date" with regex "^\d{2}\.\d{2}\.\d{4}$"
#    And Assert text from element by id "nlb-title" is contained within text from key "keyPurpose"
    And Assert element by id "nlb-title" has value under key "keyPurpose"
    And Assert element by id "nlb-details" has value under key "keyName"
    And Assert element by text "Name and address" has first following sibling from key "keyName"
    And Assert account number in Transactions details has value under key "keyAccountNumber"
    And Assert element by text "Purpose" has first following sibling from key "keyPurpose"
    And Assert that text "Settlement date" has first following sibling that matches regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert that text "Value date" has first following sibling that matches regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by text "Amount"
    And Assert element by text "1,00 RSD"
    And Assert element by text "Transaction ID"

    Examples:
      | rowindex |
      |        5 |


    #UAT
  @Payments-Domestic_Payments_[MOB_ANDROID]-Internal_Non_Urgent_Payment
  Scenario Outline: Payments-Domestic_Payments_[MOB_ANDROID]-Internal_Non_Urgent_Payment

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    And Click on element by text "My Products"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "currentDomesticAccountBBAN" is in view
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Remember available balance in currency "RSD" under key "IT_001_Debtor_Balance"
    And Click "Back" content description from view tag "View"

    When Click on element by text "Pay"
    And Wait for element by text "Domestic payment" to appear for "30" seconds
    And Click on element by text "Domestic payment"
    And Wait for element by id "nlb-input-creditor-account" to appear
#    And Assert element by text "Creditor account"
    And Enter text "205-9001000243808-47" in element id "nlb-input-creditor-account" and remember it under key "keyAccountNumber"
    And Assert element by text "Name"
#    And Enter text "Automatizacija Osir" in element id "nlb-input-creditor-name" and remember it under key "keyName"
    And Send random text to field with id "nlb-input-creditor-name" and remember it under key "keyName"
    And Assert element by text "Address"
    And Enter text "Vinca 13" in element id "nlb-input-creditor-address" and remember it under key "keyAddress"
    And Assert element by text "City"
    And Enter text "Beograd" in element id "nlb-input-creditor-city" and remember it under key "keyCity"
    And Assert element by id "nlb-checkbox-save-recipient" is checked "false"
    And Swipe vertical
    And Scroll down until element with text "Purpose" is in view
    And Assert element by text "Purpose"
    And Assert Payment amount label is displayed correctly
    And Enter text "5" in element id "nlb-amount-with-currency-field" and remember it under key "keyAmount"
    And Assert purpose code has default "289" value
    And Swipe vertical
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "keyPurpose" in txt file
    And Swipe until element with text "Cancel" is displayed
    And Scroll down until element with text "Confirm" is in view
    And Assert element by text "Reference number"
    And Assert element by text "Payment date"
    And Assert element by content desc "Set date"
    And Assert payment date is todays date and in valid date format
    And Assert element by id "nlb-checkbox-urgent-payment" is checked "true"
    And Click on element by id "nlb-checkbox-urgent-payment"
    And Assert element by id "nlb-checkbox-urgent-payment" is checked "false"
    And Click on element by id "nlb-button-primary"

    And Wait for element by text "Payment amount"
    And Assert element by text "Payment review"
    And Assert element by text "Payment amount"
    And Assert element by text "5.00 RSD"

    And Assert element by text "Recipient"
#    And Assert element by text from key "keyAmount" is displayed
#    And Assert element by text from key "keyAccountNumber" is displayed
    And Assert element by text from key "keyName" is displayed
    And Assert element by text from key "keyAddress" is displayed
    And Assert element by text from key "keyCity" is displayed
    And Swipe vertical
    And Swipe until element with text "Cancel" is displayed

    And Assert element by text "Debtor"
    And Assert element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
#    And Assert element by text from excel "<rowindex>" columnName "account_details_owner2"
    And Assert "Value date" date value is in valid date format
#    And Assert element by text "Urgent payment"
    And Assert element by text "Purpose code"
    And Assert element by text "Purpose"
    And Assert element by text from key "keyPurpose" is displayed

    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Enter PIN"
    And Enter PIN
    And Assert element by text "Payment amount"
    And Assert element by text "5,00 RSD"
    And Assert element by text from key "keyAccountNumber" is displayed
    And Assert element by text from key "keyName" is displayed
    And Assert element by text from key "keyAddress" is displayed
    And Assert element by text from key "keyCity" is displayed
    And Scroll to element by text "Purpose"
#    And Assert element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
#    And Assert element by text from excel "<rowindex>" columnName "account_details_owner2"
    And Assert Value date is todays date and in valid date format
#    And Assert element by text "Urgent payment"
#    And Assert element by id "transactions-web-popup-info" has text "Yes"
    And Assert element by text "Purpose code"
    And Assert element by id "transactions-web-popup-info" has text "289"
    And Assert element by text from key "keyPurpose" is displayed
    And Assert element by id "nlb-button-alternate" that has descendant text "Reject"
    And Assert element by id "nlb-button-primary" that has descendant text "Confirm"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "transactions-web-close-popup-icon" to appear
    And Assert element by text "Confirmation successful"
    And Assert element by contains text "Your payment was successfully accepted"
    And Click on element by id "transactions-web-close-popup-nlb-button"

    Then Wait for element by text "Past payments"
    And Click on element by text "Upcoming payments"
    And Wait for first Past payment
    And Scroll until element with text under key "keyPurpose" is in view and click
    And Wait for element by id "nlb-card-container" to appear
    And Wait "1" seconds
    And Assert element by id "nlb-button-text" that has descendant text "Cancel payment"
    And Assert element by text "Recipient name" has first following sibling from key "keyName"
    And Assert element by text from key "keyAddress" is displayed
    And Assert element by text from key "keyCity" is displayed
    And Assert Recipient account number in Payment details in Past payments is from key "keyAccountNumber"
    And Assert that text "Purpose code" has first following sibling that contains text "289"
    And Swipe vertical
    And Assert element by text "Purpose" has first following sibling from key "keyPurpose"
    And Assert that text "Debtor name" has first following sibling from excel "<rowindex>" columnName "account_details_owner"
    And Assert that text "Debtor account" has first following sibling from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
#    And Assert that text "Fee" has first following sibling that contains text "0,00 RSD"
#    And Assert that text "Payment status" has first following sibling that contains text "Executed"
#    And Assert element by id "nlb-button-primary" that has descendant text "Repeat payment"
    And Click "Back" content description
    And Wait for first Past payment
    And Click "Back" content description

    And Click on element by text "My Products"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "currentDomesticAccountBBAN" is in view
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Check if current balance is lowered by "5" using balance from key "IT_001_Debtor_Balance" for currency "RSD"
#    And Assert first transaction have Purpose under key "keyPurpose"
#    And Assert first transaction have Creditor name under key "keyName"
#    And Assert first transaction have Amount under key "keyAmount"
#    And Click on element by text from key "keyPurpose"
#    And Assert element by id "nlb-date" with regex "^\d{2}\.\d{2}\.\d{4}$"
##    And Assert text from element by id "nlb-title" is contained within text from key "keyPurpose"
#    And Assert element by id "nlb-title" has value under key "keyPurpose"
#    And Assert element by id "nlb-details" has value under key "keyName"
#    And Assert element by text "Name and address" has first following sibling from key "keyName"
#    And Assert account number in Transactions details has value under key "keyAccountNumber"
#    And Assert element by text "Purpose" has first following sibling from key "keyPurpose"
#    And Assert that text "Settlement date" has first following sibling that matches regex "^\d{2}\.\d{2}\.\d{4}$"
#    And Assert that text "Value date" has first following sibling that matches regex "^\d{2}\.\d{2}\.\d{4}$"
#    And Assert element by text "Amount"
#    And Assert element by text "5,00 RSD"
#    And Assert element by text "Transaction ID"

    Examples:
      | rowindex |
      |        5 |


  @Payments-Domestic_Payments_[MOB_ANDROID]-External_Non_Urgent_Payment_No_Model
  Scenario Outline: Payments-Domestic_Payments_[MOB_ANDROID]-External_Non_Urgent_Payment_No_Model

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    And Click on element by text "My Products"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "currentDomesticAccountBBAN" is in view
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Remember available balance in currency "RSD" under key "IT_001_Debtor_Balance"
    And Click "Back" content description from view tag "View"

    When Click on element by text "Pay"
    And Wait for element by text "Domestic payment" to appear for "30" seconds
    And Click on element by text "Domestic payment"
    And Wait for element by id "nlb-input-creditor-account" to appear
#    And Assert element by text "Creditor account"
    And Enter text "200-2206180101000-48" in element id "nlb-input-creditor-account" and remember it under key "keyAccountNumber"
    And Assert element by text "Name"
#    And Enter text "Automatizacija Osir" in element id "nlb-input-creditor-name" and remember it under key "keyName"
    And Send random text to field with id "nlb-input-creditor-name" and remember it under key "keyName"
    And Assert element by text "Address"
    And Enter text "Vinca 13" in element id "nlb-input-creditor-address" and remember it under key "keyAddress"
    And Assert element by text "City"
    And Enter text "Beograd" in element id "nlb-input-creditor-city" and remember it under key "keyCity"
    And Assert element by id "nlb-checkbox-save-recipient" is checked "false"
    And Swipe vertical
    And Scroll down until element with text "Purpose" is in view
    And Assert element by text "Purpose"
    And Assert Payment amount label is displayed correctly
    And Enter text "7" in element id "nlb-amount-with-currency-field" and remember it under key "keyAmount"
    And Assert purpose code has default "289" value
    And Swipe vertical
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "keyPurpose" in txt file
    And Swipe until element with text "Cancel" is displayed
    And Scroll down until element with text "Confirm" is in view
    And Assert element by text "Reference number"
    And Assert element by text "Payment date"
    And Assert element by content desc "Set date"
    And Assert payment date is todays date and in valid date format
    And Assert element by id "nlb-checkbox-urgent-payment" is checked "true"
    And Click on element by id "nlb-checkbox-urgent-payment"
    And Assert element by id "nlb-checkbox-urgent-payment" is checked "false"
    And Click on element by id "nlb-button-primary"

    And Wait for element by text "Payment amount"
    And Assert element by text "Payment review"
    And Assert that text "Payment amount" has first following sibling that contains text "7.00 RSD"
    And Assert that text "Fee" has first following sibling that contains text "15.00 RSD"

    And Assert element by text "Recipient"
#    And Assert element by text from key "keyAmount" is displayed
#    And Assert element by text from key "keyAccountNumber" is displayed
    And Assert element by text from key "keyName" is displayed
    And Assert element by text from key "keyAddress" is displayed
    And Assert element by text from key "keyCity" is displayed
    And Swipe vertical
    And Swipe until element with text "Cancel" is displayed

    And Assert element by text "Debtor"
#    And Assert element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Assert element by text from excel "<rowindex>" columnName "account_details_owner2"
    And Assert "Value date" date value is in valid date format
#    And Assert element by text "Urgent payment"
    And Assert element by text "Purpose code"
    And Assert element by text "Purpose"
    And Assert element by text from key "keyPurpose" is displayed

    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Enter PIN"
    And Enter PIN
    And Assert element by text "Payment amount"
    And Assert element by text "7,00 RSD"
#    And Assert element by text from key "keyAccountNumber" is displayed
    And Assert element by text from key "keyName" is displayed
    And Assert element by text from key "keyAddress" is displayed
    And Assert element by text from key "keyCity" is displayed
    And Scroll to element by text "Purpose"
#    And Assert element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Assert element by text from excel "<rowindex>" columnName "account_details_owner2"
    And Assert Value date is todays date and in valid date format
#    And Assert element by text "Urgent payment"
#    And Assert element by id "transactions-web-popup-info" has text "Yes"
    And Assert element by text "Purpose code"
    And Assert element by id "transactions-web-popup-info" has text "289"
    And Assert element by text from key "keyPurpose" is displayed
    And Assert element by id "nlb-button-alternate" that has descendant text "Reject"
    And Assert element by id "nlb-button-primary" that has descendant text "Confirm"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "transactions-web-close-popup-icon" to appear
    And Assert element by text "Confirmation successful"
    And Assert element by contains text "Your payment was successfully accepted"
    And Click on element by id "transactions-web-close-popup-nlb-button"

    Then Wait for element by text "Past payments"
    And Click on element by text "Upcoming payments"
    And Wait for first Past payment
    And Scroll until element with text under key "keyPurpose" is in view and click
    And Wait for element by id "nlb-card-container" to appear
    And Wait "1" seconds
    And Assert element by id "nlb-button-text" that has descendant text "Cancel payment"
    And Assert element by text "Recipient name" has first following sibling from key "keyName"
    And Assert element by text from key "keyAddress" is displayed
    And Assert element by text from key "keyCity" is displayed
    And Assert Recipient account number in Payment details in Past payments is from key "keyAccountNumber"
    And Assert that text "Purpose code" has first following sibling that contains text "289"
    And Swipe vertical
    And Assert element by text "Purpose" has first following sibling from key "keyPurpose"
    And Assert that text "Debtor name" has first following sibling from excel "<rowindex>" columnName "account_details_owner"
    And Assert that text "Debtor account" has first following sibling from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
#    And Assert that text "Fee" has first following sibling that contains text "15,00 RSD"
#    And Assert that text "Payment status" has first following sibling that contains text "Executed"
#    And Assert element by id "nlb-button-primary" that has descendant text "Repeat payment"
    And Click "Back" content description
    And Wait for first Past payment
    And Click "Back" content description

    And Click on element by text "My Products"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "currentDomesticAccountBBAN" is in view
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Check if current balance is lowered by "3" from Amount and "15" from Fee using balance from key "IT_001_Debtor_Balance" for currency "RSD"
    And Assert first transaction have Purpose under key "keyPurpose"
    And Assert first transaction have Creditor name under key "keyName"
    And Assert first transaction have Amount under key "keyAmount"
    And Click on element by text from key "keyPurpose"
    And Assert element by id "nlb-date" with regex "^\d{2}\.\d{2}\.\d{4}$"
#    And Assert text from element by id "nlb-title" is contained within text from key "keyPurpose"
    And Assert element by id "nlb-title" has value under key "keyPurpose"
    And Assert element by id "nlb-details" has value under key "keyName"
    And Assert element by text "Name and address" has first following sibling from key "keyName"
    And Assert account number in Transactions details has value under key "keyAccountNumber"
    And Assert element by text "Purpose" has first following sibling from key "keyPurpose"
    And Assert that text "Settlement date" has first following sibling that matches regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert that text "Value date" has first following sibling that matches regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by text "Amount"
    And Assert element by text "7,00 RSD"
    And Assert element by text "Transaction ID"

    Examples:
      | rowindex |
      |        5 |


  @Payments-Domestic_Payments_[MOB_ANDROID]-External_Urgent_Payment_No_Model
  Scenario Outline: Payments-Domestic_Payments_[MOB_ANDROID]-External_Urgent_Payment_No_Model

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    And Click on element by text "My Products"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "currentDomesticAccountBBAN" is in view
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Remember available balance in currency "RSD" under key "IT_001_Debtor_Balance"
    And Click "Back" content description from view tag "View"

    When Click on element by text "Pay"
    And Wait for element by text "Domestic payment" to appear for "30" seconds
    And Click on element by text "Domestic payment"
    And Wait for element by id "nlb-input-creditor-account" to appear
#    And Assert element by text "Creditor account"
    And Enter text "265-1110312345678-24" in element id "nlb-input-creditor-account" and remember it under key "keyAccountNumber"
    And Assert element by text "Name"
#    And Enter text "Automatizacija Osir" in element id "nlb-input-creditor-name" and remember it under key "keyName"
    And Send random text to field with id "nlb-input-creditor-name" and remember it under key "keyName"
    And Assert element by text "Address"
    And Enter text "Vinca 13" in element id "nlb-input-creditor-address" and remember it under key "keyAddress"
    And Assert element by text "City"
    And Enter text "Beograd" in element id "nlb-input-creditor-city" and remember it under key "keyCity"
    And Assert element by id "nlb-checkbox-save-recipient" is checked "false"
    And Swipe vertical
    And Scroll down until element with text "Purpose" is in view
    And Assert element by text "Purpose"
    And Assert Payment amount label is displayed correctly
    And Enter text "3" in element id "nlb-amount-with-currency-field" and remember it under key "keyAmount"
    And Assert purpose code has default "289" value
    And Swipe vertical
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "keyPurpose" in txt file
    And Swipe until element with text "Cancel" is displayed
    And Scroll down until element with text "Confirm" is in view
    And Assert element by text "Reference number"
    And Assert element by text "Payment date"
    And Assert element by content desc "Set date"
    And Assert payment date is todays date and in valid date format
    And Assert element by id "nlb-checkbox-urgent-payment" is checked "true"
    And Click on element by id "nlb-button-primary"

    And Wait for element by text "Payment amount"
    And Assert element by text "Payment review"
    And Assert that text "Payment amount" has first following sibling that contains text "3.00 RSD"
    And Assert that text "Fee" has first following sibling that contains text "15.00 RSD"

    And Assert element by text "Recipient"
#    And Assert element by text from key "keyAmount" is displayed
    And Assert element by text from key "keyAccountNumber" is displayed
    And Assert element by text from key "keyName" is displayed
    And Assert element by text from key "keyAddress" is displayed
    And Assert element by text from key "keyCity" is displayed
    And Swipe vertical
    And Swipe until element with text "Cancel" is displayed

    And Assert element by text "Debtor"
#    And Assert element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Assert element by text from excel "<rowindex>" columnName "account_details_owner2"
    And Assert "Value date" date value is in valid date format
    And Assert that text "Urgent payment" has first following sibling that contains text "Yes"
    And Assert that text "Purpose code" has first following sibling that contains text "289"
#    And Assert element by text "Purpose"
#    And Assert element by text from key "keyPurpose" is displayed
    And Assert element by text "Purpose" has first following sibling from key "keyPurpose"

    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Enter PIN"
    And Enter PIN
    And Assert element by text "Payment amount"
    And Assert element by text "3,00 RSD"
#    And Assert element by text from key "keyAccountNumber" is displayed
    And Assert element by text from key "keyName" is displayed
    And Assert element by text from key "keyAddress" is displayed
    And Assert element by text from key "keyCity" is displayed
    And Scroll to element by text "Purpose"
#    And Assert element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Assert element by text from excel "<rowindex>" columnName "account_details_owner2"
    And Assert Value date is todays date and in valid date format
    And Assert element by text "Urgent payment"
    And Assert element by id "transactions-web-popup-info" has text "Yes"
    And Assert element by text "Purpose code"
    And Assert element by id "transactions-web-popup-info" has text "289"
    And Assert element by text from key "keyPurpose" is displayed
    And Assert element by id "nlb-button-alternate" that has descendant text "Reject"
    And Assert element by id "nlb-button-primary" that has descendant text "Confirm"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "transactions-web-close-popup-icon" to appear
    And Assert element by text "Confirmation successful"
    And Assert element by contains text "Your payment was successfully accepted"
    And Click on element by id "transactions-web-close-popup-nlb-button"

    Then Wait for element by text "Past payments"
    And Click on element by text "Past payments"
    And Wait for first Past payment
    And Scroll until element with text under key "keyPurpose" is in view and click
    And Assert element by text "Recipient name" has first following sibling from key "keyName"
    And Assert element by text from key "keyAddress" is displayed
    And Assert element by text from key "keyCity" is displayed
    And Assert Recipient account number in Payment details in Past payments is from key "keyAccountNumber"
    And Assert that text "Purpose code" has first following sibling that contains text "289"
    And Swipe vertical
    And Assert element by text "Purpose" has first following sibling from key "keyPurpose"
    And Assert that text "Debtor name" has first following sibling from excel "<rowindex>" columnName "account_details_owner"
    And Assert that text "Debtor account" has first following sibling from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Assert that text "Fee" has first following sibling that contains text "15,00 RSD"
    And Assert that text "Payment status" has first following sibling that contains text "Executed"
    And Assert element by id "nlb-button-primary" that has descendant text "Repeat payment"
    And Click "Back" content description
    And Wait for first Past payment
    And Click "Back" content description

    And Click on element by text "My Products"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "currentDomesticAccountBBAN" is in view
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Check if current balance is lowered by "3" from Amount and "15" from Fee using balance from key "IT_001_Debtor_Balance" for currency "RSD"
    And Assert first transaction have Purpose under key "keyPurpose"
    And Assert first transaction have Creditor name under key "keyName"
    And Assert first transaction have Amount under key "keyAmount"
    And Click on element by text from key "keyPurpose"
    And Assert element by id "nlb-date" with regex "^\d{2}\.\d{2}\.\d{4}$"
#    And Assert text from element by id "nlb-title" is contained within text from key "keyPurpose"
    And Assert element by id "nlb-title" has value under key "keyPurpose"
    And Assert element by id "nlb-details" has value under key "keyName"
    And Assert element by text "Name and address" has first following sibling from key "keyName"
    And Assert account number in Transactions details has value under key "keyAccountNumber"
    And Assert element by text "Purpose" has first following sibling from key "keyPurpose"
    And Assert that text "Settlement date" has first following sibling that matches regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert that text "Value date" has first following sibling that matches regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by text "Amount"
    And Assert element by text "3,00 RSD"
    And Assert element by text "Transaction ID"

    Examples:
      | rowindex |
      |        5 |


  @Payments-Domestic_Payments_[MOB_ANDROID]-External_Urgent_Payment_Model_11
  Scenario Outline: Payments-Domestic_Payments_[MOB_ANDROID]-External_Urgent_Payment_Model_11

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    And Click on element by text "My Products"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "currentDomesticAccountBBAN" is in view
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Remember available balance in currency "RSD" under key "IT_001_Debtor_Balance"
    And Click "Back" content description from view tag "View"

    When Click on element by text "Pay"
    And Wait for element by text "Domestic payment" to appear for "30" seconds
    And Click on element by text "Domestic payment"
    And Wait for element by id "nlb-input-creditor-account" to appear
#    And Assert element by text "Creditor account"
    And Enter text "200-2206180101000-48" in element id "nlb-input-creditor-account" and remember it under key "keyAccountNumber"
    And Assert element by text "Name"
#    And Enter text "Automatizacija Osir" in element id "nlb-input-creditor-name" and remember it under key "keyName"
    And Send random text to field with id "nlb-input-creditor-name" and remember it under key "keyName"
    And Assert element by text "Address"
    And Enter text "Vinca 13" in element id "nlb-input-creditor-address" and remember it under key "keyAddress"
    And Assert element by text "City"
    And Enter text "Beograd" in element id "nlb-input-creditor-city" and remember it under key "keyCity"
    And Assert element by id "nlb-checkbox-save-recipient" is checked "false"
    And Swipe vertical
    And Scroll down until element with text "Purpose" is in view
    And Assert element by text "Purpose"
    And Assert Payment amount label is displayed correctly
    And Enter text "4" in element id "nlb-amount-with-currency-field" and remember it under key "keyAmount"
    And Assert purpose code has default "289" value
    And Swipe vertical
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "keyPurpose" in txt file
    And Click "Model, -" content description
    And Click on element by text "11"
    And Enter text "801240107032-25119-1" in element id "nlb-input-reference-number" and remember it under key "keyReferenceNumber"
    And Swipe until element with text "Cancel" is displayed
    And Scroll down until element with text "Confirm" is in view
    And Assert element by text "Reference number"
    And Assert element by text "Payment date"
    And Assert element by content desc "Set date"
    And Assert payment date is todays date and in valid date format
    And Assert element by id "nlb-checkbox-urgent-payment" is checked "true"
    And Click on element by id "nlb-button-primary"

    And Wait for element by text "Payment amount"
    And Assert element by text "Payment review"
    And Assert that text "Payment amount" has first following sibling that contains text "4.00 RSD"
    And Assert that text "Fee" has first following sibling that contains text "15.00 RSD"

    And Assert element by text "Recipient"
#    And Assert element by text from key "keyAmount" is displayed
    And Assert element by text from key "keyAccountNumber" is displayed
    And Assert element by text from key "keyName" is displayed
    And Assert element by text from key "keyAddress" is displayed
    And Assert element by text from key "keyCity" is displayed
    And Swipe vertical
    And Swipe until element with text "Cancel" is displayed

    And Assert element by text "Debtor"
    And Assert element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Assert element by text from excel "<rowindex>" columnName "account_details_owner2"
    And Assert "Value date" date value is in valid date format
    And Assert that text "Urgent payment" has first following sibling that contains text "Yes"
    And Assert that text "Purpose code" has first following sibling that contains text "289"
#    And Assert element by text "Purpose"
#    And Assert element by text from key "keyPurpose" is displayed
    And Assert element by text "Purpose" has first following sibling from key "keyPurpose"
    And Assert that text "Model" has first following sibling that contains text "11"
    And Assert element by text "Reference" has first following sibling from key "keyReferenceNumber"

    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Enter PIN"
    And Enter PIN
    And Assert that text "Payment amount" has first following sibling that contains text "4,00 RSD"
#    And Assert element by text "4,00 RSD"
    And Assert that text "Fee" has first following sibling that contains text "15,00 RSD"
    And Assert element by text from key "keyAccountNumber" is displayed
    And Assert element by text from key "keyName" is displayed
    And Assert element by text from key "keyAddress" is displayed
    And Assert element by text from key "keyCity" is displayed
    And Scroll to element by text "Purpose"
    And Assert element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Assert element by text from excel "<rowindex>" columnName "account_details_owner2"
    And Assert Value date is todays date and in valid date format
    And Assert element by text "Urgent payment"
    And Assert element by id "transactions-web-popup-info" has text "Yes"
    And Assert element by text "Purpose code"
    And Assert element by id "transactions-web-popup-info" has text "289"
    And Scroll down until element with text from key "keyReferenceNumber" is in view
    And Assert element by text "Purpose" has first following sibling from key "keyPurpose"
    And Assert element by text "Model" has first following sibling contains text "11"
    And Assert element by text "Reference number" has first following sibling from key "keyReferenceNumber"
    And Assert element by id "nlb-button-alternate" that has descendant text "Reject"
    And Assert element by id "nlb-button-primary" that has descendant text "Confirm"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "transactions-web-close-popup-icon" to appear
    And Assert element by text "Confirmation successful"
    And Assert element by contains text "Your payment was successfully accepted"
    And Click on element by id "transactions-web-close-popup-nlb-button"

    Then Wait for element by text "Past payments"
    And Click on element by text "Past payments"
    And Wait for first Past payment
    And Scroll until element with text under key "keyPurpose" is in view and click
    And Assert element by text "Recipient name" has first following sibling from key "keyName"
    And Assert element by text from key "keyAddress" is displayed
    And Assert element by text from key "keyCity" is displayed
    And Assert Recipient account number in Payment details in Past payments is from key "keyAccountNumber"
    And Assert that text "Purpose code" has first following sibling that contains text "289"
    And Swipe vertical
    And Assert element by text "Purpose" has first following sibling from key "keyPurpose"
    And Assert that text "Model" has first following sibling that contains text "11"
    And Assert element by text "Reference number" has first following sibling from key "keyReferenceNumber"
    And Assert that text "Debtor name" has first following sibling from excel "<rowindex>" columnName "account_details_owner"
    And Assert that text "Debtor account" has first following sibling from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Assert that text "Fee" has first following sibling that contains text "15,00 RSD"
    And Assert that text "Payment status" has first following sibling that contains text "Executed"
    And Assert element by id "nlb-button-primary" that has descendant text "Repeat payment"
    And Click "Back" content description
    And Wait for first Past payment
    And Click "Back" content description

    And Click on element by text "My Products"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "currentDomesticAccountBBAN" is in view
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Check if current balance is lowered by "4" from Amount and "15" from Fee using balance from key "IT_001_Debtor_Balance" for currency "RSD"
    And Assert first transaction have Purpose under key "keyPurpose"
    And Assert first transaction have Creditor name under key "keyName"
    And Assert first transaction have Amount under key "keyAmount"
    And Click on element by text from key "keyPurpose"
    And Assert element by id "nlb-date" with regex "^\d{2}\.\d{2}\.\d{4}$"
#    And Assert text from element by id "nlb-title" is contained within text from key "keyPurpose"
    And Assert element by id "nlb-title" has value under key "keyPurpose"
    And Assert element by id "nlb-details" has value under key "keyName"
    And Assert element by text "Name and address" has first following sibling from key "keyName"
    And Assert account number in Transactions details has value under key "keyAccountNumber"
    And Assert element by text "Purpose" has first following sibling from key "keyPurpose"
    And Assert that text "Settlement date" has first following sibling that matches regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert that text "Value date" has first following sibling that matches regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by text "Amount"
    And Assert element by text "4,00 RSD"
    And Assert element by text "Transaction ID"
    And Assert element by text "Model" has first following sibling contains text "11"
    And Assert element by text "Reference number" has first following sibling from key "keyReferenceNumber"

    Examples:
      | rowindex |
      |        5 |


  @Payments-Domestic_Payments_[MOB_ANDROID]-External_Urgent_Payment_Model_11-invalid
  Scenario Outline: Payments-Domestic_Payments_[MOB_ANDROID]-External_Urgent_Payment_Model_11-invalid

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click on element by text "Pay"
    And Wait for element by text "Domestic payment" to appear for "30" seconds
    And Click on element by text "Domestic payment"
    And Wait for element by id "nlb-input-creditor-account" to appear
    And Assert element by text "Account number"
    And Enter text "200220618010100048" in element id "nlb-input-creditor-account" and remember it under key "keyAccountNumber"
    And Assert element by text "Name"
#    And Enter text "Automatizacija Osir" in element id "nlb-input-creditor-name" and remember it under key "keyName"
    And Send random text to field with id "nlb-input-creditor-name" and remember it under key "keyName"
    And Assert element by text "Address"
    And Enter text "Vinca 13" in element id "nlb-input-creditor-address" and remember it under key "keyAddress"
    And Assert element by text "City"
    And Enter text "Beograd" in element id "nlb-input-creditor-city" and remember it under key "keyCity"
    And Assert element by id "nlb-checkbox-save-recipient" is checked "false"
    And Swipe vertical
    And Scroll down until element with text "Purpose" is in view
    And Assert element by text "Purpose"
    And Assert Payment amount label is displayed correctly
    And Enter text "4" in element id "nlb-amount-with-currency-field" and remember it under key "keyAmount"
    And Assert purpose code has default "289" value
    And Swipe vertical
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "keyPurpose" in txt file
    And Click "Model, -" content description
    And Click on element by text "11"
    And Scroll down until element with text "Confirm" is in view
    And Click on element by id "nlb-button-primary"

    Then Wait for element by text "Error"
    And Assert element by text "Neispravan poziv na broj  za model 11 ! "
    And Assert element by text "OK"

    Examples:
      | rowindex |
      |        5 |


  @Payments-Domestic_Payments_[MOB_ANDROID]-External_Urgent_Payment_Model_97
  Scenario Outline: Payments-Domestic_Payments_[MOB_ANDROID]-External_Urgent_Payment_Model_97

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    And Click on element by text "My Products"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "currentDomesticAccountBBAN" is in view
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Remember available balance in currency "RSD" under key "IT_001_Debtor_Balance"
    And Click "Back" content description from view tag "View"

    When Click on element by text "Pay"
    And Wait for element by text "Domestic payment" to appear for "30" seconds
    And Click on element by text "Domestic payment"
    And Wait for element by id "nlb-input-creditor-account" to appear
#    And Assert element by text "Creditor account"
    And Enter text "265-1110312345678-24" in element id "nlb-input-creditor-account" and remember it under key "keyAccountNumber"
    And Assert element by text "Name"
#    And Enter text "Automatizacija Osir" in element id "nlb-input-creditor-name" and remember it under key "keyName"
    And Send random text to field with id "nlb-input-creditor-name" and remember it under key "keyName"
    And Assert element by text "Address"
    And Enter text "Vinca 13" in element id "nlb-input-creditor-address" and remember it under key "keyAddress"
    And Assert element by text "City"
    And Enter text "Beograd" in element id "nlb-input-creditor-city" and remember it under key "keyCity"
    And Assert element by id "nlb-checkbox-save-recipient" is checked "false"
    And Swipe vertical
    And Scroll down until element with text "Purpose" is in view
    And Assert element by text "Purpose"
    And Assert Payment amount label is displayed correctly
    And Enter text "4" in element id "nlb-amount-with-currency-field" and remember it under key "keyAmount"
    And Assert purpose code has default "289" value
    And Swipe vertical
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "keyPurpose" in txt file
    And Click "Model, -" content description
    And Click on element by text "97"
    And Enter text "30600268000161" in element id "nlb-input-reference-number" and remember it under key "keyReferenceNumber"
    And Swipe until element with text "Cancel" is displayed
    And Scroll down until element with text "Confirm" is in view
    And Assert element by text "Reference number"
    And Assert element by text "Payment date"
    And Assert element by content desc "Set date"
    And Assert payment date is todays date and in valid date format
    And Assert element by id "nlb-checkbox-urgent-payment" is checked "true"
    And Click on element by id "nlb-button-primary"

    And Wait for element by text "Payment amount"
    And Assert element by text "Payment review"
    And Assert that text "Payment amount" has first following sibling that contains text "4.00 RSD"
    And Assert that text "Fee" has first following sibling that contains text "15.00 RSD"

    And Assert element by text "Recipient"
#    And Assert element by text from key "keyAmount" is displayed
    And Assert element by text from key "keyAccountNumber" is displayed
    And Assert element by text from key "keyName" is displayed
    And Assert element by text from key "keyAddress" is displayed
    And Assert element by text from key "keyCity" is displayed
    And Swipe vertical
    And Swipe until element with text "Cancel" is displayed

    And Assert element by text "Debtor"
    And Assert element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Assert element by text from excel "<rowindex>" columnName "account_details_owner2"
    And Assert "Value date" date value is in valid date format
    And Assert that text "Urgent payment" has first following sibling that contains text "Yes"
    And Assert that text "Purpose code" has first following sibling that contains text "289"
#    And Assert element by text "Purpose"
#    And Assert element by text from key "keyPurpose" is displayed
    And Assert element by text "Purpose" has first following sibling from key "keyPurpose"
    And Assert that text "Model" has first following sibling that contains text "97"
    And Assert element by text "Reference" has first following sibling from key "keyReferenceNumber"

    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Enter PIN"
    And Enter PIN
    And Assert that text "Payment amount" has first following sibling that contains text "4,00 RSD"
#    And Assert element by text "4,00 RSD"
    And Assert that text "Fee" has first following sibling that contains text "15,00 RSD"
    And Assert element by text from key "keyAccountNumber" is displayed
    And Assert element by text from key "keyName" is displayed
    And Assert element by text from key "keyAddress" is displayed
    And Assert element by text from key "keyCity" is displayed
    And Scroll to element by text "Purpose"
    And Assert element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Assert element by text from excel "<rowindex>" columnName "account_details_owner2"
    And Assert Value date is todays date and in valid date format
    And Assert element by text "Urgent payment"
    And Assert element by id "transactions-web-popup-info" has text "Yes"
    And Assert element by text "Purpose code"
    And Assert element by id "transactions-web-popup-info" has text "289"
    And Scroll down until element with text from key "keyReferenceNumber" is in view
    And Assert element by text "Purpose" has first following sibling from key "keyPurpose"
    And Assert element by text "Model" has first following sibling contains text "97"
    And Assert element by text "Reference number" has first following sibling from key "keyReferenceNumber"
    And Assert element by id "nlb-button-alternate" that has descendant text "Reject"
    And Assert element by id "nlb-button-primary" that has descendant text "Confirm"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "transactions-web-close-popup-icon" to appear
    And Assert element by text "Confirmation successful"
    And Assert element by contains text "Your payment was successfully accepted"
    And Click on element by id "transactions-web-close-popup-nlb-button"

    Then Wait for element by text "Past payments"
    And Click on element by text "Past payments"
    And Wait for first Past payment
    And Scroll until element with text under key "keyPurpose" is in view and click
    And Assert element by text "Recipient name" has first following sibling from key "keyName"
    And Assert element by text from key "keyAddress" is displayed
    And Assert element by text from key "keyCity" is displayed
    And Assert Recipient account number in Payment details in Past payments is from key "keyAccountNumber"
    And Assert that text "Purpose code" has first following sibling that contains text "289"
    And Swipe vertical
    And Assert element by text "Purpose" has first following sibling from key "keyPurpose"
    And Assert that text "Model" has first following sibling that contains text "97"
    And Assert element by text "Reference number" has first following sibling from key "keyReferenceNumber"
    And Assert that text "Debtor name" has first following sibling from excel "<rowindex>" columnName "account_details_owner"
    And Assert that text "Debtor account" has first following sibling from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Assert that text "Fee" has first following sibling that contains text "15,00 RSD"
    And Assert that text "Payment status" has first following sibling that contains text "Executed"
    And Assert element by id "nlb-button-primary" that has descendant text "Repeat payment"
    And Click "Back" content description
    And Wait for first Past payment
    And Click "Back" content description

    And Click on element by text "My Products"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "currentDomesticAccountBBAN" is in view
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Check if current balance is lowered by "4" from Amount and "15" from Fee using balance from key "IT_001_Debtor_Balance" for currency "RSD"
    And Assert first transaction have Purpose under key "keyPurpose"
    And Assert first transaction have Creditor name under key "keyName"
    And Assert first transaction have Amount under key "keyAmount"
    And Click on element by text from key "keyPurpose"
    And Assert element by id "nlb-date" with regex "^\d{2}\.\d{2}\.\d{4}$"
#    And Assert text from element by id "nlb-title" is contained within text from key "keyPurpose"
    And Assert element by id "nlb-title" has value under key "keyPurpose"
    And Assert element by id "nlb-details" has value under key "keyName"
    And Assert element by text "Name and address" has first following sibling from key "keyName"
    And Assert account number in Transactions details has value under key "keyAccountNumber"
    And Assert element by text "Purpose" has first following sibling from key "keyPurpose"
    And Assert that text "Settlement date" has first following sibling that matches regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert that text "Value date" has first following sibling that matches regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by text "Amount"
    And Assert element by text "4,00 RSD"
    And Assert element by text "Transaction ID"
    And Assert element by text "Model" has first following sibling contains text "97"
    And Assert element by text "Reference number" has first following sibling from key "keyReferenceNumber"

    Examples:
      | rowindex |
      |        5 |


  @Payments-Domestic_Payments_[MOB_ANDROID]-External_Urgent_Payment_Model_97-invalid
  Scenario Outline: Payments-Domestic_Payments_[MOB_ANDROID]-External_Urgent_Payment_Model_97-invalid

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click on element by text "Pay"
    And Wait for element by text "Domestic payment" to appear for "30" seconds
    And Click on element by text "Domestic payment"
    And Wait for element by id "nlb-input-creditor-account" to appear
    And Assert element by text "Account number"
    And Enter text "200220618010100048" in element id "nlb-input-creditor-account" and remember it under key "keyAccountNumber"
    And Assert element by text "Name"
#    And Enter text "Automatizacija Osir" in element id "nlb-input-creditor-name" and remember it under key "keyName"
    And Send random text to field with id "nlb-input-creditor-name" and remember it under key "keyName"
    And Assert element by text "Address"
    And Enter text "Vinca 13" in element id "nlb-input-creditor-address" and remember it under key "keyAddress"
    And Assert element by text "City"
    And Enter text "Beograd" in element id "nlb-input-creditor-city" and remember it under key "keyCity"
    And Assert element by id "nlb-checkbox-save-recipient" is checked "false"
    And Swipe vertical
    And Scroll down until element with text "Purpose" is in view
    And Assert element by text "Purpose"
    And Assert Payment amount label is displayed correctly
    And Enter text "4" in element id "nlb-amount-with-currency-field" and remember it under key "keyAmount"
    And Assert purpose code has default "289" value
    And Swipe vertical
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "keyPurpose" in txt file
    And Click "Model, -" content description
    And Click on element by text "97"
    And Scroll down until element with text "Confirm" is in view
    And Click on element by id "nlb-button-primary"

    Then Wait for element by text "Error"
    And Assert element by text "Neispravan poziv na broj  za model 97 ! "
    And Assert element by text "OK"

    Examples:
      | rowindex |
      |        5 |


  @Payments-Domestic_Payments_[MOB_ANDROID]-External_Non_Urgent_Payment_Model_11
  Scenario Outline: Payments-Domestic_Payments_[MOB_ANDROID]-External_Non_Urgent_Payment_Model_11

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    And Click on element by text "My Products"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "currentDomesticAccountBBAN" is in view
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Remember available balance in currency "RSD" under key "IT_001_Debtor_Balance"
    And Click "Back" content description from view tag "View"

    When Click on element by text "Pay"
    And Wait for element by text "Domestic payment" to appear for "30" seconds
    And Click on element by text "Domestic payment"
    And Wait for element by id "nlb-input-creditor-account" to appear
#    And Assert element by text "Creditor account"
    And Enter text "200220618010100048" in element id "nlb-input-creditor-account" and remember it under key "keyAccountNumber"
    And Assert element by text "Name"
#    And Enter text "Automatizacija Osir" in element id "nlb-input-creditor-name" and remember it under key "keyName"
    And Send random text to field with id "nlb-input-creditor-name" and remember it under key "keyName"
    And Assert element by text "Address"
    And Enter text "Vinca 13" in element id "nlb-input-creditor-address" and remember it under key "keyAddress"
    And Assert element by text "City"
    And Enter text "Beograd" in element id "nlb-input-creditor-city" and remember it under key "keyCity"
    And Assert element by id "nlb-checkbox-save-recipient" is checked "false"
    And Swipe vertical
    And Scroll down until element with text "Purpose" is in view
    And Assert element by text "Purpose"
    And Assert Payment amount label is displayed correctly
    And Enter text "7" in element id "nlb-amount-with-currency-field" and remember it under key "keyAmount"
    And Assert purpose code has default "289" value
    And Swipe vertical
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "keyPurpose" in txt file
    And Click "Model, -" content description
    And Click on element by text "11"
    And Enter text "801240107032-25119-1" in element id "nlb-input-reference-number" and remember it under key "keyReferenceNumber"
    And Swipe until element with text "Cancel" is displayed
    And Scroll down until element with text "Confirm" is in view
    And Assert element by text "Reference number"
    And Assert element by text "Payment date"
    And Assert element by content desc "Set date"
    And Assert payment date is todays date and in valid date format
    And Assert element by id "nlb-checkbox-urgent-payment" is checked "true"
    And Click on element by id "nlb-checkbox-urgent-payment"
    And Assert element by id "nlb-checkbox-urgent-payment" is checked "false"
    And Click on element by id "nlb-button-primary"

    And Wait for element by text "Payment amount"
    And Assert element by text "Payment review"
    And Assert that text "Payment amount" has first following sibling that contains text "7.00 RSD"
    And Assert that text "Fee" has first following sibling that contains text "15.00 RSD"

    And Assert element by text "Recipient"
#    And Assert element by text from key "keyAmount" is displayed
#    And Assert element by text from key "keyAccountNumber" is displayed
    And Assert element by text from key "keyName" is displayed
    And Assert element by text from key "keyAddress" is displayed
    And Assert element by text from key "keyCity" is displayed
    And Swipe vertical
    And Swipe until element with text "Cancel" is displayed

    And Assert element by text "Debtor"
    And Assert element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Assert element by text from excel "<rowindex>" columnName "account_details_owner2"
    And Assert "Value date" date value is in valid date format
#    And Assert element by text "Urgent payment"
    And Assert element by text "Purpose code"
    And Assert element by text "Purpose"
    And Assert element by text from key "keyPurpose" is displayed

    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Enter PIN"
    And Enter PIN
    And Assert element by text "Payment amount"
    And Assert element by text "7,00 RSD"
    And Assert element by text from key "keyAccountNumber" is displayed
    And Assert element by text from key "keyName" is displayed
    And Assert element by text from key "keyAddress" is displayed
    And Assert element by text from key "keyCity" is displayed
    And Scroll to element by text "Purpose"
    And Assert element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Assert element by text from excel "<rowindex>" columnName "account_details_owner2"
    And Assert Value date is todays date and in valid date format
#    And Assert element by text "Urgent payment"
#    And Assert element by id "transactions-web-popup-info" has text "Yes"
    And Assert element by text "Purpose code"
    And Assert element by id "transactions-web-popup-info" has text "289"
    And Assert element by text from key "keyPurpose" is displayed
    And Assert that text "Model" has first following sibling that contains text "11"
    And Assert element by text "Reference number" has first following sibling from key "keyReferenceNumber"
    And Assert element by id "nlb-button-alternate" that has descendant text "Reject"
    And Assert element by id "nlb-button-primary" that has descendant text "Confirm"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "transactions-web-close-popup-icon" to appear
    And Assert element by text "Confirmation successful"
    And Assert element by contains text "Your payment was successfully accepted"
    And Click on element by id "transactions-web-close-popup-nlb-button"

    Then Wait for element by text "Past payments"
    And Click on element by text "Upcoming payments"
    And Wait for first Past payment
    And Scroll until element with text under key "keyPurpose" is in view and click
    And Wait for element by id "nlb-card-container" to appear
    And Wait "1" seconds
    And Assert element by id "nlb-button-text" that has descendant text "Cancel payment"
    And Assert element by text "Recipient name" has first following sibling from key "keyName"
    And Assert element by text from key "keyAddress" is displayed
    And Assert element by text from key "keyCity" is displayed
    And Assert Recipient account number in Payment details in Past payments is from key "keyAccountNumber"
    And Assert that text "Purpose code" has first following sibling that contains text "289"
    And Swipe vertical
    And Scroll down until element with text from key "keyReferenceNumber" is in view
    And Assert element by text "Purpose" has first following sibling from key "keyPurpose"
    And Assert element by text "Model" has first following sibling contains text "11"
    And Assert element by text "Reference number" has first following sibling from key "keyReferenceNumber"
    And Assert that text "Debtor name" has first following sibling from excel "<rowindex>" columnName "account_details_owner"
    And Assert that text "Debtor account" has first following sibling from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
#    And Assert that text "Fee" has first following sibling that contains text "15,00 RSD"
#    And Assert that text "Payment status" has first following sibling that contains text "Executed"
#    And Assert element by id "nlb-button-primary" that has descendant text "Repeat payment"
    And Click "Back" content description
    And Wait for first Past payment
    And Click "Back" content description

    And Click on element by text "My Products"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "currentDomesticAccountBBAN" is in view
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Check if current balance is lowered by "7" from Amount and "15" from Fee using balance from key "IT_001_Debtor_Balance" for currency "RSD"
#    And Assert first transaction have Purpose under key "keyPurpose"
#    And Assert first transaction have Creditor name under key "keyName"
#    And Assert first transaction have Amount under key "keyAmount"
#    And Click on element by text from key "keyPurpose"
#    And Assert element by id "nlb-date" with regex "^\d{2}\.\d{2}\.\d{4}$"
##    And Assert text from element by id "nlb-title" is contained within text from key "keyPurpose"
#    And Assert element by id "nlb-title" has value under key "keyPurpose"
#    And Assert element by id "nlb-details" has value under key "keyName"
#    And Assert element by text "Name and address" has first following sibling from key "keyName"
#    And Assert account number in Transactions details has value under key "keyAccountNumber"
#    And Assert element by text "Purpose" has first following sibling from key "keyPurpose"
#    And Assert that text "Settlement date" has first following sibling that matches regex "^\d{2}\.\d{2}\.\d{4}$"
#    And Assert that text "Value date" has first following sibling that matches regex "^\d{2}\.\d{2}\.\d{4}$"
#    And Assert element by text "Amount"
#    And Assert element by text "5,00 RSD"
#    And Assert element by text "Transaction ID"

    Examples:
      | rowindex |
      |        5 |


  @Payments-Domestic_Payments_[MOB_ANDROID]-External_Non_Urgent_Payment_Model_97
  Scenario Outline: Payments-Domestic_Payments_[MOB_ANDROID]-External_Non_Urgent_Payment_Model_97

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    And Click on element by text "My Products"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "currentDomesticAccountBBAN" is in view
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Remember available balance in currency "RSD" under key "IT_001_Debtor_Balance"
    And Click "Back" content description from view tag "View"

    When Click on element by text "Pay"
    And Wait for element by text "Domestic payment" to appear for "30" seconds
    And Click on element by text "Domestic payment"
    And Wait for element by id "nlb-input-creditor-account" to appear
    And Assert element by text "Account number"
    And Enter text "265111031234567824" in element id "nlb-input-creditor-account" and remember it under key "keyAccountNumber"
    And Assert element by text "Name"
#    And Enter text "Automatizacija Osir" in element id "nlb-input-creditor-name" and remember it under key "keyName"
    And Send random text to field with id "nlb-input-creditor-name" and remember it under key "keyName"
    And Assert element by text "Address"
    And Enter text "Vinca 13" in element id "nlb-input-creditor-address" and remember it under key "keyAddress"
    And Assert element by text "City"
    And Enter text "Beograd" in element id "nlb-input-creditor-city" and remember it under key "keyCity"
    And Assert element by id "nlb-checkbox-save-recipient" is checked "false"
    And Swipe vertical
    And Scroll down until element with text "Purpose" is in view
    And Assert element by text "Purpose"
    And Assert Payment amount label is displayed correctly
    And Enter text "7" in element id "nlb-amount-with-currency-field" and remember it under key "keyAmount"
    And Assert purpose code has default "289" value
    And Swipe vertical
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "keyPurpose" in txt file
    And Click "Model, -" content description
    And Click on element by text "97"
    And Enter text "30600268000161" in element id "nlb-input-reference-number" and remember it under key "keyReferenceNumber"
    And Swipe until element with text "Cancel" is displayed
    And Scroll down until element with text "Confirm" is in view
    And Assert element by text "Reference number"
    And Assert element by text "Payment date"
    And Assert element by content desc "Set date"
    And Assert payment date is todays date and in valid date format
    And Assert element by id "nlb-checkbox-urgent-payment" is checked "true"
    And Click on element by id "nlb-checkbox-urgent-payment"
    And Assert element by id "nlb-checkbox-urgent-payment" is checked "false"
    And Click on element by id "nlb-button-primary"

    And Wait for element by text "Payment amount"
    And Assert element by text "Payment review"
    And Assert that text "Payment amount" has first following sibling that contains text "7.00 RSD"
    And Assert that text "Fee" has first following sibling that contains text "15.00 RSD"

    And Assert element by text "Recipient"
#    And Assert element by text from key "keyAmount" is displayed
#    And Assert element by text from key "keyAccountNumber" is displayed
    And Assert element by text from key "keyName" is displayed
    And Assert element by text from key "keyAddress" is displayed
    And Assert element by text from key "keyCity" is displayed
    And Swipe vertical
    And Swipe until element with text "Cancel" is displayed

    And Assert element by text "Debtor"
    And Assert element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Assert element by text from excel "<rowindex>" columnName "account_details_owner2"
    And Assert "Value date" date value is in valid date format
#    And Assert element by text "Urgent payment"
    And Assert element by text "Purpose code"
    And Assert element by text "Purpose"
    And Assert element by text from key "keyPurpose" is displayed

    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Enter PIN"
    And Enter PIN
    And Assert element by text "Payment amount"
    And Assert element by text "7,00 RSD"
    And Assert element by text from key "keyAccountNumber" is displayed
    And Assert element by text from key "keyName" is displayed
    And Assert element by text from key "keyAddress" is displayed
    And Assert element by text from key "keyCity" is displayed
    And Scroll to element by text "Purpose"
    And Assert element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Assert element by text from excel "<rowindex>" columnName "account_details_owner2"
    And Assert Value date is todays date and in valid date format
#    And Assert element by text "Urgent payment"
#    And Assert element by id "transactions-web-popup-info" has text "Yes"
    And Assert element by text "Purpose code"
    And Assert element by id "transactions-web-popup-info" has text "289"
    And Assert element by text from key "keyPurpose" is displayed
    And Assert that text "Model" has first following sibling that contains text "97"
    And Assert element by text "Reference number" has first following sibling from key "keyReferenceNumber"
    And Assert element by id "nlb-button-alternate" that has descendant text "Reject"
    And Assert element by id "nlb-button-primary" that has descendant text "Confirm"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "transactions-web-close-popup-icon" to appear
    And Assert element by text "Confirmation successful"
    And Assert element by contains text "Your payment was successfully accepted"
    And Click on element by id "transactions-web-close-popup-nlb-button"

    Then Wait for element by text "Past payments"
    And Click on element by text "Upcoming payments"
    And Wait for first Past payment
    And Scroll until element with text under key "keyPurpose" is in view and click
    And Wait for element by id "nlb-card-container" to appear
    And Wait "1" seconds
    And Assert element by id "nlb-button-text" that has descendant text "Cancel payment"
    And Assert element by text "Recipient name" has first following sibling from key "keyName"
    And Assert element by text from key "keyAddress" is displayed
    And Assert element by text from key "keyCity" is displayed
    And Assert Recipient account number in Payment details in Past payments is from key "keyAccountNumber"
    And Assert that text "Purpose code" has first following sibling that contains text "289"
    And Swipe vertical
    And Scroll down until element with text from key "keyReferenceNumber" is in view
    And Assert element by text "Purpose" has first following sibling from key "keyPurpose"
    And Assert element by text "Model" has first following sibling contains text "97"
    And Assert element by text "Reference number" has first following sibling from key "keyReferenceNumber"
    And Assert that text "Debtor name" has first following sibling from excel "<rowindex>" columnName "account_details_owner"
    And Assert that text "Debtor account" has first following sibling from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
#    And Assert that text "Fee" has first following sibling that contains text "15,00 RSD"
#    And Assert that text "Payment status" has first following sibling that contains text "Executed"
#    And Assert element by id "nlb-button-primary" that has descendant text "Repeat payment"
    And Click "Back" content description
    And Wait for first Past payment
    And Click "Back" content description

    And Click on element by text "My Products"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "currentDomesticAccountBBAN" is in view
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Check if current balance is lowered by "7" from Amount and "15" from Fee using balance from key "IT_001_Debtor_Balance" for currency "RSD"
#    And Assert first transaction have Purpose under key "keyPurpose"
#    And Assert first transaction have Creditor name under key "keyName"
#    And Assert first transaction have Amount under key "keyAmount"
#    And Click on element by text from key "keyPurpose"
#    And Assert element by id "nlb-date" with regex "^\d{2}\.\d{2}\.\d{4}$"
##    And Assert text from element by id "nlb-title" is contained within text from key "keyPurpose"
#    And Assert element by id "nlb-title" has value under key "keyPurpose"
#    And Assert element by id "nlb-details" has value under key "keyName"
#    And Assert element by text "Name and address" has first following sibling from key "keyName"
#    And Assert account number in Transactions details has value under key "keyAccountNumber"
#    And Assert element by text "Purpose" has first following sibling from key "keyPurpose"
#    And Assert that text "Settlement date" has first following sibling that matches regex "^\d{2}\.\d{2}\.\d{4}$"
#    And Assert that text "Value date" has first following sibling that matches regex "^\d{2}\.\d{2}\.\d{4}$"
#    And Assert element by text "Amount"
#    And Assert element by text "5,00 RSD"
#    And Assert element by text "Transaction ID"

    Examples:
      | rowindex |
      |        5 |


  @Payments-Domestic_Payments_[MOB_ANDROID]-Budget_Urgent_Payment_Model_97
  Scenario Outline: Payments-Domestic_Payments_[MOB_ANDROID]-Budget_Urgent_Payment_Model_97

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    And Click on element by text "My Products"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "currentDomesticAccountBBAN" is in view
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Remember available balance in currency "RSD" under key "IT_001_Debtor_Balance"
    And Click "Back" content description from view tag "View"

    When Click on element by text "Pay"
    And Wait for element by text "Domestic payment" to appear for "30" seconds
    And Click on element by text "Domestic payment"
    And Wait for element by id "nlb-input-creditor-account" to appear
#    And Assert element by text "Creditor account"
    And Enter text "840-0000713121843-57" in element id "nlb-input-creditor-account" and remember it under key "keyAccountNumber"
    And Assert element by text "Name"
#    And Enter text "Automatizacija Osir" in element id "nlb-input-creditor-name" and remember it under key "keyName"
    And Send random text to field with id "nlb-input-creditor-name" and remember it under key "keyName"
    And Assert element by text "Address"
    And Enter text "Vinca 13" in element id "nlb-input-creditor-address" and remember it under key "keyAddress"
    And Assert element by text "City"
    And Enter text "Beograd" in element id "nlb-input-creditor-city" and remember it under key "keyCity"
    And Assert element by id "nlb-checkbox-save-recipient" is checked "false"
    And Swipe vertical
    And Scroll down until element with text "Purpose" is in view
    And Click on element by id "nlb-dropdown-menu" with index "1"
    And Click on element by contains text "253"
    And Assert element by text "Purpose"
    And Assert Payment amount label is displayed correctly
    And Enter text "4" in element id "nlb-amount-with-currency-field" and remember it under key "keyAmount"
    And Assert purpose code has default "253" value
    And Swipe vertical
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "keyPurpose" in txt file
    And Click "Model, -" content description
    And Click on element by text "97"
    And Enter text "020201701973791828" in element id "nlb-input-reference-number" and remember it under key "keyReferenceNumber"
    And Swipe until element with text "Cancel" is displayed
    And Scroll down until element with text "Confirm" is in view
    And Assert element by text "Reference number"
    And Assert element by text "Payment date"
    And Assert element by content desc "Set date"
    And Assert payment date is todays date and in valid date format
    And Assert element by id "nlb-checkbox-urgent-payment" is checked "true"
    And Click on element by id "nlb-button-primary"

    And Wait for element by text "Payment amount"
    And Assert element by text "Payment review"
    And Assert that text "Payment amount" has first following sibling that contains text "4.00 RSD"
    And Assert that text "Fee" has first following sibling that contains text "15.00 RSD"

    And Assert element by text "Recipient"
#    And Assert element by text from key "keyAmount" is displayed
    And Assert element by text from key "keyAccountNumber" is displayed
    And Assert element by text from key "keyName" is displayed
    And Assert element by text from key "keyAddress" is displayed
    And Assert element by text from key "keyCity" is displayed
    And Swipe vertical
    And Swipe until element with text "Cancel" is displayed

    And Assert element by text "Debtor"
    And Assert element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Assert element by text from excel "<rowindex>" columnName "account_details_owner2"
    And Assert "Value date" date value is in valid date format
    And Assert that text "Urgent payment" has first following sibling that contains text "Yes"
    And Assert that text "Purpose code" has first following sibling that contains text "253"
#    And Assert element by text "Purpose"
#    And Assert element by text from key "keyPurpose" is displayed
    And Assert element by text "Purpose" has first following sibling from key "keyPurpose"
    And Assert that text "Model" has first following sibling that contains text "97"
    And Assert element by text "Reference" has first following sibling from key "keyReferenceNumber"

    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Enter PIN"
    And Enter PIN
    And Wait for element by text "Payment amount"
    And Assert that text "Payment amount" has first following sibling that contains text "4,00 RSD"
#    And Assert element by text "4,00 RSD"
    And Assert that text "Fee" has first following sibling that contains text "15,00 RSD"
#    And Assert element by text from key "keyAccountNumber" is displayed
    And Assert element by text from key "keyName" is displayed
    And Assert element by text from key "keyAddress" is displayed
    And Assert element by text from key "keyCity" is displayed
    And Scroll to element by text "Purpose"
#    And Assert element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Assert element by text from excel "<rowindex>" columnName "account_details_owner2"
    And Assert Value date is todays date and in valid date format
    And Assert element by text "Urgent payment"
    And Assert element by id "transactions-web-popup-info" has text "Yes"
    And Assert element by text "Purpose code"
    And Assert element by id "transactions-web-popup-info" has text "253"
    And Scroll down until element with text from key "keyReferenceNumber" is in view
    And Assert element by text "Purpose" has first following sibling from key "keyPurpose"
    And Assert element by text "Model" has first following sibling contains text "97"
    And Assert element by text "Reference number" has first following sibling from key "keyReferenceNumber"
    And Assert element by id "nlb-button-alternate" that has descendant text "Reject"
    And Assert element by id "nlb-button-primary" that has descendant text "Confirm"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "transactions-web-close-popup-icon" to appear
    And Assert element by text "Confirmation successful"
    And Assert element by contains text "Your payment was successfully accepted"
    And Click on element by id "transactions-web-close-popup-nlb-button"

    Then Wait for element by text "Past payments"
    And Click on element by text "Past payments"
    And Wait for first Past payment
    And Scroll until element with text under key "keyPurpose" is in view and click
    And Wait for element by text "Payment confirmation"
    And Assert element by text "Recipient name" has first following sibling from key "keyName"
    And Assert element by text from key "keyAddress" is displayed
    And Assert element by text from key "keyCity" is displayed
#    And Wait "4" seconds
    And Assert Recipient account number in Payment details in Past payments is from key "keyAccountNumber"
    And Assert that text "Purpose code" has first following sibling that contains text "253"
    And Swipe vertical
    And Assert element by text "Purpose" has first following sibling from key "keyPurpose"
    And Assert that text "Model" has first following sibling that contains text "97"
    And Assert element by text "Reference number" has first following sibling from key "keyReferenceNumber"
    And Assert that text "Debtor name" has first following sibling from excel "<rowindex>" columnName "account_details_owner"
    And Assert that text "Debtor account" has first following sibling from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Assert that text "Fee" has first following sibling that contains text "15,00 RSD"
    And Assert that text "Payment status" has first following sibling that contains text "Executed"
    And Assert element by id "nlb-button-primary" that has descendant text "Repeat payment"
    And Click "Back" content description
    And Wait for first Past payment
    And Click "Back" content description

    And Click on element by text "My Products"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "currentDomesticAccountBBAN" is in view
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Check if current balance is lowered by "4" from Amount and "15" from Fee using balance from key "IT_001_Debtor_Balance" for currency "RSD"
    And Assert first transaction have Purpose under key "keyPurpose"
    And Assert first transaction have Creditor name under key "keyName"
    And Assert first transaction have Amount under key "keyAmount"
    And Click on element by text from key "keyPurpose"
    And Assert element by id "nlb-date" with regex "^\d{2}\.\d{2}\.\d{4}$"
#    And Assert text from element by id "nlb-title" is contained within text from key "keyPurpose"
    And Assert element by id "nlb-title" has value under key "keyPurpose"
    And Assert element by id "nlb-details" has value under key "keyName"
    And Assert element by text "Name and address" has first following sibling from key "keyName"
    And Assert account number in Transactions details has value under key "keyAccountNumber"
    And Assert element by text "Purpose" has first following sibling from key "keyPurpose"
    And Assert that text "Settlement date" has first following sibling that matches regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert that text "Value date" has first following sibling that matches regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by text "Amount"
    And Assert element by text "4,00 RSD"
    And Assert element by text "Transaction ID"
    And Assert element by text "Model" has first following sibling contains text "97"
    And Assert element by text "Reference number" has first following sibling from key "keyReferenceNumber"

    Examples:
      | rowindex |
      |        5 |


  @Payments-Domestic_Payments_[MOB_ANDROID]-Budget_Urgent_Payment_Purpose_Code_289_invalid
  Scenario Outline: Payments-Domestic_Payments_[MOB_ANDROID]-Budget_Urgent_Payment_Purpose_Code_289_invalid

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click on element by text "Pay"
    And Wait for element by text "Domestic payment" to appear for "30" seconds
    And Click on element by text "Domestic payment"
    And Wait for element by id "nlb-input-creditor-account" to appear
#    And Assert element by text "Creditor account"
    And Enter text "840-0000713121843-57" in element id "nlb-input-creditor-account" and remember it under key "keyAccountNumber"
    And Assert element by text "Name"
    And Send random text to field with id "nlb-input-creditor-name" and remember it under key "keyName"
    And Assert element by text "Address"
    And Enter text "Vinca 13" in element id "nlb-input-creditor-address" and remember it under key "keyAddress"
    And Assert element by text "City"
    And Enter text "Beograd" in element id "nlb-input-creditor-city" and remember it under key "keyCity"
    And Assert element by id "nlb-checkbox-save-recipient" is checked "false"
    And Swipe vertical
    And Scroll down until element with text "Purpose" is in view
    And Assert element by text "Purpose"
    And Assert Payment amount label is displayed correctly
    And Enter text "4" in element id "nlb-amount-with-currency-field" and remember it under key "keyAmount"
    And Assert purpose code has default "289" value
    And Swipe vertical
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "keyPurpose" in txt file
    And Click "Model, -" content description
    And Click on element by text "97"
    And Enter text "020201701973791828" in element id "nlb-input-reference-number" and remember it under key "keyReferenceNumber"
    And Swipe until element with text "Cancel" is displayed
    And Scroll down until element with text "Confirm" is in view
    And Assert element by text "Reference number"
    And Assert element by text "Payment date"
    And Assert element by content desc "Set date"
    And Assert payment date is todays date and in valid date format
    And Assert element by id "nlb-checkbox-urgent-payment" is checked "true"
    And Click on element by id "nlb-button-primary"

    Then Wait for element by text "Error"
    And Assert element by contains text "Neispravna šifra plaćanja za račun 840000071312184357"
    And Assert element by text "OK"

    Examples:
      | rowindex |
      |        5 |


  @Payments-Domestic_Payments_[MOB_ANDROID]-Budget_Urgent_Payment_Without_Reference_Number_invalid
  Scenario Outline: Payments-Domestic_Payments_[MOB_ANDROID]-Budget_Urgent_Payment_Without_Reference_Number_invalid

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click on element by text "Pay"
    And Wait for element by text "Domestic payment" to appear for "30" seconds
    And Click on element by text "Domestic payment"
    And Wait for element by id "nlb-input-creditor-account" to appear
#    And Assert element by text "Creditor account"
    And Enter text "840-0000713121843-57" in element id "nlb-input-creditor-account" and remember it under key "keyAccountNumber"
    And Assert element by text "Name"
    And Send random text to field with id "nlb-input-creditor-name" and remember it under key "keyName"
    And Assert element by text "Address"
    And Enter text "Vinca 13" in element id "nlb-input-creditor-address" and remember it under key "keyAddress"
    And Assert element by text "City"
    And Enter text "Beograd" in element id "nlb-input-creditor-city" and remember it under key "keyCity"
    And Assert element by id "nlb-checkbox-save-recipient" is checked "false"
    And Swipe vertical
    And Scroll down until element with text "Purpose" is in view
    And Click on element by id "nlb-dropdown-menu" with index "1"
    And Click on element by contains text "253"
    And Assert element by text "Purpose"
    And Assert Payment amount label is displayed correctly
    And Enter text "4" in element id "nlb-amount-with-currency-field" and remember it under key "keyAmount"
    And Assert purpose code has default "253" value
    And Swipe vertical
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "keyPurpose" in txt file
    And Click "Model, -" content description
    And Click on element by text "97"
#    And Enter text "020201701973791828" in element id "nlb-input-reference-number" and remember it under key "keyReferenceNumber"
    And Swipe until element with text "Cancel" is displayed
    And Scroll down until element with text "Confirm" is in view
    And Assert element by text "Reference number"
    And Assert element by text "Payment date"
    And Assert element by content desc "Set date"
    And Assert payment date is todays date and in valid date format
    And Assert element by id "nlb-checkbox-urgent-payment" is checked "true"
    And Click on element by id "nlb-button-primary"

    Then Wait for element by text "Error"
    And Assert element by contains text "Neispravan poziv na broj za račun 840000071312184357"
    And Assert element by text "OK"

    Examples:
      | rowindex |
      |        5 |
