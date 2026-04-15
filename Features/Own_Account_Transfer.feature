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
    
    And Assert element by text "Payment"
    And Assert element by text "In order to continue all input fields must be filled."
    And Assert element by text "Payment amount"
    And Assert element by text "RSD"
    And Enter text "680" in element id "nlb-amount-with-currency-field"
    And Assert element by text "Purpose"
    And Assert element by text "INTERNAL TRANSFER"
    And Assert element by text "Payment date"
    And Assert "Payment date" date is today date
    And Scroll down until element with text "Next" is in view
    And Click on element by text "Next"
    
    Then Wait for element by text "Payment amount"
    #TO DO: odradi provere za labele u Debtor i Recipient sekciji kada budu popravljene
    And Assert element by text "Debtor"
    And Assert element by text "Recipient"

    And Assert element by text "Payment"
    And Assert element by text "Purpose"
    And Assert element by text "INTERNAL TRANSFER"
    And Assert element by text "Payment date"
    And Assert "Payment date" date is today date
    
    And Scroll down until element with text "Pay" is in view
    And Assert element by text "Cancel"
    And Assert element by text "Pay"
    And Click on element by text "Pay"
    And Assert element by text "Success"
    And Click on element by text "Upcoming payments"
    And Assert element by text "INTERNAL TRANSFER"
    And Assert element by text "680,00"
    And Assert element by id "nlb-date" has text in format "^(0[1-9]|[12]\d|3[01])\.(0[1-9]|1[0-2])\.\d{4}$"
    
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
    And Enter text "100" in element id "nlb-amount-with-currency-field"
    And Wait for element with "Back" content description from view tag "View"
    And Click on element by desc "Back"
    And Assert element by text "Are you sure?"
    And Assert element by contains text "Cancelling now will terminate the payment process. "
    And Assert element by text "No"
    And Assert element by text "Yes"
    And Click on element by contains text "Yes"
    And Assert element by text "Payments"

    When Click on element by text "Own account Transfer"
    And Wait element "Debtor" by text
    And Enter text "100" in element id "nlb-amount-with-currency-field"
    And Assert element by text "Payment"
    And Assert element by text "Payment amount"
    And Assert element by text "RSD"
    And Assert element by text "Purpose"
    And Assert element by text "INTERNAL TRANSFER"
    And Assert element by text "Payment date"
    And Assert payment date in Own account transfer is todays date and in valid date format
    And Click on element by text "Cancel"
    And Assert element by text "Cancelling now will terminate the payment process."
    And Assert element by text "Yes"
    And Assert element by text "No"
    And Click on element by text "No"
    And Assert element by text "Own account Transfer"
    And Swipe vertical
    And Click on element by contains text "Cancel"
    And Assert element by contains text "Cancelling now will terminate the payment process."
    And Assert element by contains text "Yes"
    And Assert element by contains text "No"
    And Click on element by contains text "Yes"
    And Assert element by contains text "Payments"
    And Click on element by text "Own account Transfer"
    And Enter text "100" in element id "nlb-amount-with-currency-field"
    And Swipe vertical
    And Assert element by text "Cancel"
    And Assert element by text "Next"
    
    Then Click on element by id "nlb-button-primary"
    And Wait element "Debtor" by text
    And Swipe vertical
    And Assert element by text "Cancel"
    And Assert element by text "Pay"
    And Click on element by id "nlb-button-text"
    And Assert element by text "Are you sure?"
    And Assert element by text "Cancelling now will terminate the payment process. "
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