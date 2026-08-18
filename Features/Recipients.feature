Feature: Recipients

  @Payments_Recipient_Edit_Recipient_[MOB_ANDROID]
  Scenario Outline: Payments_Recipient_Edit_Recipient_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load

    When Click on Bottom navigation button "Pay"
    And Wait for Past payments button in Pay screen
    And Click on Review and edit button "Recipients" in Pay screen
    And Wait for first recipient
    And Remember recipient name under key "nameOfFirstRecipientKey" in Select recipient by index "1"
    And Remember recipient account number under key "accountNumberOfFirstRecipientKey" in Select recipient by index "1"
    And Click on Recipient with index "1" in Recipients screen
    And Assert element by text "Delete"
    And Assert element by text "Edit"
    And Assert element by text "Pay"
    And Click on element by text "Edit"

    And Assert screen header is "Edit recipient"
    And Assert back button in screen "Edit recipient"
    And Assert element by text "Name"
    And Send random text to field with id "nlb-input-recipient-name" and remember it under key "keyName"
    And Assert element by text "Street and street number"
    And Send random text to field with id "nlb-input-recipient-address" and remember it under key "keyAddress"
    And Assert element by text "City"
    And Send random text to field with id "nlb-input-recipient-city" and remember it under key "keyCity"
    And Assert element by text "Country"
    And Assert element "nlb-input-recipient-country" by id
    And Assert element by id "nlb-button-text" that has descendant text "Cancel"
    And Assert element by id "nlb-button-primary" that has descendant text "Save"
    And Click on element by id "nlb-button-primary"
    And Wait "2" seconds
    And Assert element by text from key "keyName" is displayed
    And Assert element by text "Address" has first following sibling that contains value from key "keyAddress"
    And Assert element by text "Address" has first following sibling that contains value from key "keyCity"
    And Click "Back" content description
    And Wait for first recipient

    Then Scroll down until element with text from key "accountNumberOfFirstRecipientKey" is in view
    And Assert element by text from key "nameOfFirstRecipientKey" is not displayed
    And Assert element by text from key "accountNumberOfFirstRecipientKey" is displayed
    And Assert element by text from key "keyName" is displayed
    And Click "Back" content description
    And Wait for Past payments button in Pay screen
    And Click on element by text "Domestic payment"
    And Wait for element by id "nlb-input-creditor-account" to appear
    And Click on element by id "nlb-button-alternate"
    And Wait for element by id "nlb_search_text_field" to appear
    And Click on "Select recipient" option in Select recipient page
    And Wait for first recipient
    And Scroll down until element with text from key "accountNumberOfFirstRecipientKey" is in view
    And Assert element by text from key "nameOfFirstRecipientKey" is not displayed
    And Assert element by text from key "keyName" is displayed

    Examples:
      | rowindex |
      |        5 |


  @Payments_Recipient_Last_5_Payments_Of_Recipient_[MOB_ANDROID]-View_And_Repeat
  Scenario Outline: Payments_Recipient_Last_5_Payments_Of_Recipient_[MOB_ANDROID]-View_And_Repeat

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click "My Products"
    And Wait for element by text "Edit list"
    And Scroll until element with text from excel "<rowindex>" columnName "currentDomesticAccountBBAN" is in view
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Remember available balance in currency "RSD" under key "IT_001_Debtor_Balance"
    And Click "Back" content description from view tag "View"
    And Wait for first product in My products page

    When Click on element by text "Pay"
    And Wait element "Recipients" by text
    And Click on element by text "Recipients"
    And Wait for first recipient
    And Click on element by contains text "205-"
    And Wait for element by id "nlb-payment-date" to appear
    #Nova metoda
    And Remember recipient account number in recipient details under key "keyRecipientAccount"
    #Nova metoda
    And Remember recipient name in recipient details under key "keyRecipientName"
    #nova metoda
    And Remember element value by id "nlb-purpose" and index "1" under key "keyPurpose"
    And Remember element value by id "nlb-payment-amount" and index "1" under key "keyAmount"

    And Click on element by id "nlb-payment-date" with index "1"
    And Wait element "Debtor" by text
    And Click on Debtor selector for payment
    And Wait for element by contains text "My and authorized accounts"
    And Swipe to element by text from Excel "<rowindex>" columnName "currentDomesticAccountBBAN" and click on it
    And Wait element "Debtor" by text

    And Assert element by id "nlb-input-creditor-account" has text that contains value from key "keyRecipientAccount"
    And Assert element by id "nlb-input-creditor-name" has text that contains value from key "keyRecipientName"

    And Remember element value "text" by id "nlb-input-creditor-address" under key "keyAddress"
    And Remember element value "text" by id "nlb-input-creditor-city" under key "keyCity"
    And Swipe vertical
    And Scroll down until element with id "nlb-button-primary" is in view
    And Assert element by id "nlb-amount-with-currency-field" has text that contains value from key "keyAmount"
    And Assert purpose code has default "289" value
    And Assert element by id "nlb-input-purpose" has text that contains value from key "keyPurpose"
    And Click on element by text "Confirm"

    #payment review
    And Wait for element by contains text "Fee"
    #nova metoda
    And Assert payment amount in payment review is from key "keyAmount" and has currency "RSD"
    And Assert element by text "Fee" has first following sibling contains text "0.00 RSD"
    And Assert element by text "Debtor"
    And Assert that text "Debtor name" has first following sibling from excel "<rowindex>" columnName "account_details_owner2"
    And Assert element by text "Debtor address" has first following sibling contains text "TOLSTOJEVA 15"
    And Assert element by text "Debtor address" has first following sibling contains text "Beograd"
    And Assert that text "Debtor account number" has first following sibling from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Assert element by text "Name" has first following sibling from key "keyRecipientName"
    And Assert element by text "Address" has first following sibling that contains value from key "keyAddress"
    And Assert element by text "Address" has first following sibling that contains value from key "keyCity"
    And Assert element by text "Account number" has first following sibling that contains value from key "keyRecipientAccount"
    And Assert Value date is todays date and in valid date format
    And Assert element by text "Urgent payment" has first following sibling contains text "Yes"
    And Assert element by text "Purpose code" has first following sibling contains text "289"
    And Assert element by text "Purpose" has first following sibling from key "keyPurpose"

    And Swipe vertical
    And Click on element by text "Confirm"
    And Wait for element by contains text "Success"

    And Wait for element by contains text "Past payments"
    And Click on element by text "Past payments"
    And Wait for first Past payment
    And Click on Account selector in Payment list
    And Wait for element by contains text "My and authorized accounts"
    And Swipe to element by text from Excel "<rowindex>" columnName "currentDomesticAccountBBAN" and click on it
    And Wait for first Past payment
    And Click on first Past payment
    And Wait for element by contains text "Recipient address"

    #past payments
    And Assert element by id "nlb-date" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by id "nlb-title" has text that contains value from key "keyPurpose"
    And Assert element by id "nlb-details" has text that contains value from key "keyRecipientName"
    And Assert element by id "nlb-currency" has text "RSD"
    And Assert element by id "nlb-amount" has value under key "keyAmount"
    And Assert element by contains text "Payment confirmation"
    
    And Assert element by text "Recipient name" has first following sibling from key "keyRecipientName"
    And Assert element by text "Recipient address" has first following sibling that contains value from key "keyCity"
    And Assert element by text "Recipient address" has first following sibling that contains value from key "keyAddress"
    And Assert element by text "Recipient account number" has first following sibling that contains value from key "keyRecipientAccount"
    And Assert that text "Urgent payment" has first following sibling with text "Yes"
    And Assert that text "Purpose code" has first following sibling with text "289"
    And Assert element by text "Purpose" has first following sibling from key "keyPurpose"
    And Assert that text "Debtor name" has first following sibling from excel "<rowindex>" columnName "account_details_owner2"
    And Swipe vertical
    And Assert element by text "Order number" has first following sibling with regex "^[A-Za-z0-9]{14}$"
    And Assert element by text "Payment date" has first following sibling with regex "^\d{2}\.\d{2}\.\d{4}\n\d{2}:\d{2}:\d{2}$"
    And Assert element by text "Value date" has first following sibling with regex "^\d{2}\.\d{2}\.\d{4}$"

    And Swipe vertical
    And Assert that text "Fee" has first following sibling with text "0,00 RSD"
    And Assert that text "Payment status" has first following sibling with text "Executed"
    And Assert element by text "Repeat payment"
    And Click "Back" content description
    And Wait for element by contains text "Search..."
    And Click "Back" content description
    And Wait for element by text "My Products"

    And Click "My Products"
    And Wait for element by text "Edit list"
    And Scroll until element with text from excel "<rowindex>" columnName "currentDomesticAccountBBAN" is in view
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Check if current balance is lowered by value from key "keyAmount" using balance from key "IT_001_Debtor_Balance" for currency "RSD"

    Then Wait for first transaction to load
    And Click on element by text from key "keyRecipientName"
    And Wait for element by contains text "Settlement date"
    And Assert element by id "nlb-date" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by id "nlb-title" has text that contains value from key "keyPurpose"
    And Assert element by id "nlb-details" has text that contains value from key "keyRecipientName"
    And Assert element by id "nlb-currency" has text "RSD"
    And Assert element by id "nlb-amount" has text that contains value from key "keyAmount"

    And Assert element by text "Name and address" has first following sibling from key "keyRecipientName"
    And Assert element by text "Account number" has first following sibling that contains value from key "keyRecipientAccount"
    And Assert element by text "Purpose" has first following sibling from key "keyPurpose"
    And Assert element by text "Settlement date" has first following sibling with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by text "Value date" has first following sibling with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert that amount for opened transaction in product screen is from key "keyAmount" and currency "RSD"
    And Assert element by text "Transaction ID" has first following sibling with regex "^.{14}$"

    Examples:
        | rowindex |
        |        5 |










