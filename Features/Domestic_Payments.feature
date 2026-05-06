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
    And Assert element by text "Own account Transfer"
    And Assert element by text "IPS Payments"
    And Assert element by text "Prenesi"
    And Assert element by text "Foreign payment"
    And Assert element by text "Currency exchange"

    Examples:
      | rowindex |
      |        4 |


  @Payments-Domestic_Payments-Back_Button_[MOB_ANDROID]
  Scenario Outline: Payments-Domestic_Payments-Back_Button_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click on element by text "Pay"
    And Wait for element by text "Domestic payment" to appear for "30" seconds
    And Click on element by text "Domestic payment"
    And Wait for element by id "nlb-input-creditor-account" to appear
    And Assert element by text "Creditor account"
    And Enter text from excel "<rowindex>" columnName "domestic_payment_bban" in element id "nlb-input-creditor-account"
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
    And Assert element by text "Domestic payment"
    
    And Assert element by text from excel "<rowindex>" columnName "domestic_payment_bban"
    And Assert element by text "Aleksa"
    And Assert element by text "Kaludjerica 11"
    And Assert element by text "Beograd"
    And Swipe vertical
    And Assert element by text "0,10"

    Examples:
      | rowindex |
      |        4 |


  @Payments-Domestic_Payments-Create_New_Recipient_[MOB_ANDROID]
  Scenario Outline: Payments-Domestic_Payments-Create_New_Recipient_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click on element by text "Pay"
    And Wait for element by text "Domestic payment" to appear for "30" seconds
    And Click on element by text "Domestic payment"
    And Wait for element by id "nlb-input-creditor-account" to appear
    And Assert element by text "Creditor account"
    And Enter text from excel "<rowindex>" columnName "domestic_payment_bban" in element id "nlb-input-creditor-account" and remember it under key "keyAccountNumber"
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
    And Enter text "0,1" in element id "nlb-amount-with-currency-field" and remember it under key "keyAmount"
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
    And Assert element by text "0.10 RSD"

    And Assert element by text "Recipient"
#    And Assert element by text from key "keyAmount" is displayed
#    And Assert element by text from key "keyAccountNumber" is displayed
    And Assert element by text from key "keyName" is displayed
    And Assert element by text from key "keyAddress" is displayed
    And Assert element by text from key "keyCity" is displayed
    And Swipe vertical
    And Swipe until element with text "Cancel" is displayed

    And Assert element by text "Debtor"
    And Assert element by text from excel "<rowindex>" columnName "bad_current_domestic_account_number"
    And Assert element by text from excel "<rowindex>" columnName "account_details_owner2"
    And Assert "Value date" date value is in valid date format
    And Assert element by text "Urgent payment"
    And Assert element by text "Purpose code"
    And Assert element by text "Purpose"

    And Click on element by id "nlb-button-primary"
    And Wait for element by contains text "Payments"
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
      |        4 |


  @Payments-Domestic_Payments-Modify_Data_[MOB_ANDROID]
  Scenario Outline: Payments-Domestic_Payments-Modify_Data_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click on element by text "Pay"
    And Wait for element by text "Domestic payment" to appear for "30" seconds
    And Click on element by text "Domestic payment"
    And Wait for element by id "nlb-input-creditor-account" to appear
    And Assert element by text "Creditor account"
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
    And Enter text "0,1" in element id "nlb-amount-with-currency-field" and remember it under key "keyAmount"
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
    And Assert element by text "0.10 RSD"

    And Assert element by text "Recipient"
#    And Assert element by text from key "keyAmount" is displayed
#    And Assert element by text from key "keyAccountNumber" is displayed
    And Assert element by text from key "keyName" is displayed
    And Assert element by text from key "keyAddress" is displayed
    And Assert element by text from key "keyCity" is displayed
    And Swipe vertical
    And Swipe until element with text "Cancel" is displayed

    And Assert element by text "Debtor"
    And Assert element by text from excel "<rowindex>" columnName "bad_current_domestic_account_number"
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
    And Enter text "0,2" in element id "nlb-amount-with-currency-field" and remember it under key "keyAmount"
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
    And Assert element by text "0.20 RSD"

    And Assert element by text "Recipient"
#    And Assert element by text from key "keyAmount" is displayed
#    And Assert element by text from key "keyAccountNumber" is displayed
    And Assert element by text from key "keyName" is displayed
    And Assert element by text from key "keyAddress" is displayed
    And Assert element by text from key "keyCity" is displayed
    And Swipe vertical
    And Swipe until element with text "Cancel" is displayed

    And Assert element by text "Debtor"
    And Assert element by text from excel "<rowindex>" columnName "bad_current_domestic_account_number"
    And Assert element by text from excel "<rowindex>" columnName "account_details_owner2"

    And Assert element by text "Payment"
    And Assert "Value date" date value is in valid date format
    And Assert element by text "Urgent payment"
    And Assert element by text "Purpose code"
    And Assert element by text "Purpose"

    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Close without saving"
    And Assert element "nlb-card-container" by id
    And Assert element by text "Do you want to save payment data?"
    And Assert element by text "After saving payment data you can reuse it for future payment."
    And Assert element by id "nlb-button-text" that has descendant text "Close without saving"
    And Assert element by id "nlb-button-primary" that has descendant text "Save recipient"
    And Assert element by id "nlb-button-primary" that has descendant text "Save template"
    And Assert element by id "nlb-button-primary" that has descendant text "Save both"
    And Click on element by text "Save recipient"
    And Wait for element by contains text "Payments"

    And Click on element by text "Recipients"
    And Wait for first recipient
#    And Swipe vertical
    And Scroll down until element with text from key "keyName" is in view
    And Assert element by text from key "keyName" is displayed
    And Click "Back" content description

    And Click on element by text "Domestic payment"
    And Wait for element by text "Domestic payment"
    And Click on element by id "nlb-button-alternate"
    And Wait for element by text "Select recipient"
    And Click on "Select recipient" option in Select recipient page
#    And Swipe vertical
    And Scroll down until element with text from key "keyName" is in view
    And Assert element by text from key "keyName" is displayed

    Examples:
      | rowindex |
      |        4 |


  @Payments-Domestic_Payments-In_Future_[MOB_ANDROID]
  Scenario Outline: Payments-Domestic_Payments-In_Future_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click on element by text "Pay"
    And Wait for element by text "Domestic payment" to appear for "30" seconds
    And Click on element by text "Domestic payment"
    And Wait for element by id "nlb-input-creditor-account" to appear
    And Assert element by text "Creditor account"
    And Enter text from excel "<rowindex>" columnName "domestic_payment_bban3" in element id "nlb-input-creditor-account" and remember it under key "keyAccountNumber"
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
    And Click on element by text "Add filter"
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
    And Assert element by text from excel "<rowindex>" columnName "bad_current_domestic_account_number"
    And Assert element by text from excel "<rowindex>" columnName "account_details_owner2"
    And Assert "Value date" date value is in valid date format
    And Assert element by text "Purpose code"
    And Assert element by text "Purpose"

    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Close without saving"
    And Assert element "nlb-card-container" by id
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
    And Wait for element by text "Domestic payment"
    And Click on element by id "nlb-button-alternate"
    And Wait for element by text "Select recipient"
    And Click on "Select recipient" option in Select recipient page
#    And Swipe vertical
    And Scroll down until element with text from key "keyName" is in view
    And Assert element by text from key "keyName" is displayed

    Examples:
      | rowindex |
      |        4 |


  @Payments-Domestic_Payments-Confirmation_[MOB_ANDROID]
  Scenario Outline: Payments-Domestic_Payments-Confirmation_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click on element by text "Pay"
    And Wait for element by text "Domestic payment" to appear for "30" seconds
    And Click on element by text "Domestic payment"
    And Wait for element by id "nlb-input-creditor-account" to appear
    And Assert element by text "Creditor account"
    And Enter text "205900100779094488" in element id "nlb-input-creditor-account" and remember it under key "keyAccountNumber"
    And Assert element by text "Name"
    And Enter text "Automatizacija Osir" in element id "nlb-input-creditor-name" and remember it under key "keyName"
    And Assert element by text "Address"
    And Enter text "Vinca 13" in element id "nlb-input-creditor-address" and remember it under key "keyAddress"
    And Assert element by text "City"
    And Enter text "Beograd" in element id "nlb-input-creditor-city" and remember it under key "keyCity"
    And Assert element by id "nlb-checkbox-save-recipient" is checked "false"
    And Swipe vertical
    And Scroll down until element with text "Purpose" is in view
    And Assert element by text "Purpose"
    And Assert Payment amount label is displayed correctly
    And Enter text "0,1" in element id "nlb-amount-with-currency-field" and remember it under key "keyAmount"
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
    And Assert element by text "Payment review"
    And Assert element by text "Payment amount"
    And Assert element by text "0.10 RSD"

    And Assert element by text "Recipient"
#    And Assert element by text from key "keyAmount" is displayed
    And Assert element by text from key "keyAccountNumber" is displayed
    And Assert element by text from key "keyName" is displayed
    And Assert element by text from key "keyAddress" is displayed
    And Assert element by text from key "keyCity" is displayed
    And Swipe vertical
    And Swipe until element with text "Cancel" is displayed

    And Assert element by text "Debtor"
    And Assert element by text from excel "<rowindex>" columnName "bad_current_domestic_account_number"
    And Assert element by text from excel "<rowindex>" columnName "account_details_owner2"
    And Assert "Value date" date value is in valid date format
    And Assert element by text "Urgent payment"
    And Assert element by text "Purpose code"
    And Assert element by text "Purpose"

    And Click on element by id "nlb-button-primary"
    And Assert element by content desc "Cancel"
    And Assert element by text "Success"

    Examples:
      | rowindex |
      |        4 |


  @Payments-Domestic_Payments_[MOB_ANDROID]
  Scenario Outline: Payments-Domestic_Payments_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click on element by text "Pay"
    And Wait for element by text "Domestic payment" to appear for "30" seconds
    And Click on element by text "Domestic payment"
    And Wait for element by id "nlb-input-creditor-account" to appear
    And Click on element by id "nlb-button-alternate"
    And Wait for element by text "Select recipient"
    And Click on "Select recipient" option in Select recipient page
    And Assert list od account numbers are displayed correctly in Select recipient
    And Remember recipient name under key "recipientNameKey" in Select recipient by index "1"
    And Remember recipient account number under key "recipientAccountNumberKey" in Select recipient by index "1"
    And Choose recipient in Select recipient by index "1"
    And Wait for element by text "Domestic payment" to appear for "30" seconds
    And Assert element by text "Debtor"
    And Assert element by text "Recipient"
    And Assert element by id "nlb-checkbox-save-recipient" is checked "false"
    And Assert element by text "Payment"
    And Swipe vertical
    And Scroll to element by text "Confirm"
    And Assert Payment amount label is displayed correctly
    And Enter text "1" in element id "nlb-amount-with-currency-field" and remember it under key "keyAmount"
    And Assert purpose code has default "289" value
    And Assert element by text "Purpose"
    And Enter text "Payment for services" in element id "nlb-input-purpose" and remember it under key "keyPurpose"
    And Assert element by content desc "Model, -"
    And Assert element by text "Reference number"
    And Assert element by text "Payment date"
    And Assert element by content desc "Set date"
    And Assert payment date is todays date and in valid date format
    And Assert element by id "nlb-checkbox-urgent-payment" is checked "true"
    And Click on element by id "nlb-button-primary"

    Then Wait for element by text "Payment amount"
    And Assert element by text "Payment review"
    And Assert element by text "Payment amount"
    And Assert element by text "Fee"
    And Assert element by text "1.00 RSD"

    And Assert element by text "Recipient"
    And Assert element by text "Debtor"
    And Assert element by text from excel "<rowindex>" columnName "bad_current_domestic_account_number"
    And Assert element by text from excel "<rowindex>" columnName "account_details_owner2"
    And Swipe vertical
    And Assert element by text "Payment details"
    And Assert Value date is todays date and in valid date format
    And Assert element by text "Urgent payment"
    And Assert element by text "Purpose code"
    And Assert element by text "289"
    And Assert element by text "Purpose"
    And Assert element by text from key "keyPurpose" is displayed

    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Success"
    And Assert element by content desc "Cancel"
    And Assert element by text "Success"
    #placanja sada idu u Upcoming, a ne u Past payments
    And Click on element by text "Past payments"
    And Wait "3" seconds
#    And Scroll until element with contains text under key "keyPurpose" is in view and click
    And Click on element by text from key "keyPurpose"
    And Assert element by text from key "recipientNameKey" is displayed
    And Assert element by text from key "recipientAccountNumberKey" is displayed

    #TO DO: Provera promene iznosa kada placanja prorade

    Examples:
      | rowindex |
      |        4 |


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
    And Assert element by text "Creditor account"
    And Enter text "++=" in element id "nlb-input-creditor-account"
    And Assert element by text "Creditor account is required"
    And Enter text "9999" in element id "nlb-input-creditor-account"
    And Assert element by text "Incorrect account number"
    And Enter text "20590010078398629545896" in element id "nlb-input-creditor-account"
    And Assert element by text "205900100783986295"
    And Enter text "" in element id "nlb-input-creditor-account"
    And Assert element by text "Creditor account is required"

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
    #Odkomentarisati dva koraka ispod kad rese bug da reference number prima sve karaktere
#    And Enter text "=+==" in element id "nlb-input-reference-number"
#    And Assert element by text "Please use the following characters:"
    And Enter text "Lorem ipsum dolor sit ame" in element id "nlb-input-reference-number"
    And Assert element by text "Maximum number of characters is 24."

    And Assert element by id "nlb-checkbox-urgent-payment" is checked "true"
    And Assert element "nlb-button-text" by id
    And Assert element "nlb-button-primary" by id
    And Assert element by text "Confirm" is not clickable

    Examples:
      | rowindex |
      |        4 |
