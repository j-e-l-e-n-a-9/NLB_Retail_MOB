Feature: Own_Account_Transfer

  @Payments-Own_Account_Transfer-From_Current_Account_RSD_To_Current_Account_RSD_[MOB_ANDROID]
  Scenario Outline: Payments-Own_Account_Transfer-From_Current_Account_RSD_To_Current_Account_RSD_[MOB_ANDROID]

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
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "second_personal_account_bban" is in view
    And Click on element by text from excel "<rowindex>" columnName "second_personal_account_bban"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Remember available balance in currency "RSD" under key "IT_001_Creditor_Balance"
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-primary-balance" to appear

    When Click on element by text "Pay"
    And Wait for element by text "Own account Transfer" to appear for "30" seconds
    And Click on element by text "Own account Transfer"
    And Wait for element by text "Debtor"
    And Click on "Debtor" container for current account picker in Own account Transfer
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "currentDomesticAccountBBAN" is in view
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Wait for element by text "Debtor"

    And Click on "Recipient" container for current account picker in Own account Transfer
    And Wait for element by text "Select recipient"
    And Scroll until element with text from excel "<rowindex>" columnName "second_personal_account_bban" is in view
    And Click on element by text from excel "<rowindex>" columnName "second_personal_account_bban"
    And Wait for element by text "Debtor"
    And Assert Debtor in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "currentDomesticAccountName" and iban "currentDomesticAccountBBAN"
    And Assert Recipient in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "second_personal_account_name" and iban "second_personal_account_bban"
    
    And Assert element by text "Payment"
    And Assert element by text "In order to continue all input fields must be filled."
    And Assert element by text "Payment amount"
    And Assert element by text "RSD"
    And Enter text "2" in element id "nlb-amount-with-currency-field"
    And Assert element by text "Purpose"
    And Assert element by text "INTERNAL TRANSFER"
    And Assert element by text "Payment date"
    And Assert "Payment date" date is today date
    And Scroll down until element with text "Confirm" is in view
    And Click on element by id "nlb-button-primary"
    
    Then Wait for element by text "Payment amount"
    And Assert that text "Payment amount" has first following sibling with text "2,00 RSD"
    And Assert that text "Fee" has first following sibling with text "0,00 RSD"
#    And Assert that text "Name" has first following sibling with text from Excel "<rowindex>" columnName "account_details_owner2"
#    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Assert element by text "Recipient"
#    And Assert that second text "Name" has first following sibling with text from Excel "<rowindex>" columnName "account_details_owner2"
#    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "second_personal_account_bban"

    And Assert element by text "Payment"
    And Assert element by text "Purpose"
    And Assert element by text "INTERNAL TRANSFER"
    And Assert element by text "Payment date"
    And Assert "Payment date" date is today date
    
    And Scroll down until element with text "Pay" is in view
    And Assert element by text "Cancel"
    And Assert element by text "Pay"
    And Click on element by id "nlb-button-primary"
#    And Assert element by text "Success"
#    And Click on element by text "Upcoming payments"
#    And Assert element by text "INTERNAL TRANSFER"
#    And Assert element by text "8,00"
#    And Assert element by id "nlb-date" has text in format "^(0[1-9]|[12]\d|3[01])\.(0[1-9]|1[0-2])\.\d{4}$"
#    And Click "Back" content description

    And Click on element by text "My Products"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "currentDomesticAccountBBAN" is in view
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Check if current balance is lowered by "2" using balance from key "IT_001_Debtor_Balance" for currency "RSD"
    And Click "Back" content description
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "second_personal_account_bban" is in view
    And Click on element by text from excel "<rowindex>" columnName "second_personal_account_bban"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Check if current balance is increased by "2" using balance from key "IT_001_Creditor_Balance" for currency "RSD"
    And Click "Back" content description
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Click on element by text "Pay"

    And Click on element by text "Past payments"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "currentDomesticAccountBBAN" is in view
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    And Assert element by text "INTERNAL TRANSFER"
    And Assert element by text "2,00"
    And Assert element by id "nlb-date" has text in format "^(0[1-9]|[12]\d|3[01])\.(0[1-9]|1[0-2])\.\d{4}$"
    And Click on element by text "INTERNAL TRANSFER"
    And Wait for element by text "Payment details"
    And Assert element by text "Payment details"
    And Assert element "nlb-date" by id has current date in format "dd.MM.yyyy"
    And Assert text "RSD" in element id "nlb-currency"
    And Assert text "2,00" in element id "nlb-amount"
    #Odkomentarisi kad rese bug za vlasnika racuna
#    And Assert text from excel "<rowindex>" columnName "user_name_for_payment_details" in element by id "nlb-details"

#    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "username_and_address"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "second_personal_account_bban"
#    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI2X"
#    And Assert that text "Name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_details"
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Swipe vertical short
    And Scroll down until element with text "Payment status" is in view
#    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert that text "Payment status" has first following sibling with text "Executed"

    Examples:
      | rowindex |
      |        2 |


  @Payments_Own_Account_Transfer-Flow_Disruption_Cancel/Back_[MOB_ANDROID]
  Scenario Outline: Payments_Own_Account_Transfer-Flow_Disruption_Cancel/Back_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    And Click on Bottom navigation button "Pay"
    And Click on element by contains text "Own account Transfer"

    And Wait element "Debtor" by text
    And Assert element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
#    And Assert element by text from excel "<rowindex>" columnName "second_personal_account_bban"
    And Enter text "1" in element id "nlb-amount-with-currency-field"
    And Wait for element with "Back" content description from view tag "View"
    And Click on element by desc "Back"
    And Assert element by text "Are you sure?"
    And Assert element by contains text "Cancelling now will terminate the payment process."
    And Assert element by text "No"
    And Assert element by text "Yes"
    And Click on element by contains text "Yes"
    And Assert element by text "Payments"

    When Click on element by text "Own account Transfer"
    And Wait element "Debtor" by text
    And Enter text "1" in element id "nlb-amount-with-currency-field"
    And Assert element by text "Payment"
    And Assert element by text "Payment amount"
    And Assert element by text "RSD"
    And Assert element by text "Purpose"
    And Assert element by text "INTERNAL TRANSFER"
    And Assert element by text "Payment date"
    And Assert payment date in Own account transfer is todays date and in valid date format
    And Click on element by text "Cancel"
    And Assert element by contains text "Cancelling now will terminate the payment process."
    And Assert element by text "Yes"
    And Assert element by text "No"
    And Click on element by text "No"
    And Assert element by text "Own account Transfer"
    And Swipe vertical
    And Click on element by contains text "Cancel"
    And Wait "1" seconds
    And Assert element by contains text "Cancelling now will terminate the payment process."
    And Assert element by contains text "Yes"
    And Assert element by contains text "No"
    And Click on element by contains text "Yes"
    And Assert element by contains text "Payments"
    And Click on element by text "Own account Transfer"
    And Enter text "1" in element id "nlb-amount-with-currency-field"
    And Swipe vertical
    And Assert element by text "Cancel"
    And Assert element by text "Confirm"
    
    Then Click on element by id "nlb-button-primary"
    And Wait element "Debtor" by text
    And Swipe vertical
    And Assert element by text "Cancel"
    And Assert element by text "Pay"
    And Click on element by id "nlb-button-text"
    And Assert element by text "Are you sure?"
    And Assert element by contains text "Cancelling now will terminate the payment process. "
    And Assert element by text "No"
    And Assert element by text "Yes"
    And Click on element by text "No"
    And Click on element by id "nlb-button-text"
    And Click on element by text "Yes"
    And Wait element "Domestic payment" by text
    And Assert element by text "Domestic payment"
    And Assert element by text "Payments"

    Examples:
      | rowindex |
      |        4 |