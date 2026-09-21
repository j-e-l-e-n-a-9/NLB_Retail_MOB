Feature: Payments_Specific_Payments

  @Payments_Specific_Payment_Credit_Card_Repayment_[ANDROID]-From_Current_Domestic_Account
  Scenario Outline: Payments_Specific_Payment_Credit_Card_Repayment_[ANDROID]-From_Current_Domestic_Account

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load

    When Click on Bottom navigation button "My Products"
    And Wait for first product in My products page

    And Scroll until element with text from excel "<rowindex>" columnName "currentDomesticAccountBBAN" is in view
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Remember available balance in currency "RSD" under key "IT_001_Debtor_Balance"
    And Click "Back" content description
    And Scroll until element with text from excel "<rowindex>" columnName "credit_card_2_number" is in view
    And Click on element by text from excel "<rowindex>" columnName "credit_card_2_number"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Remember available balance in currency "RSD" under key "key_Card_Balance"
    And Wait for element by contains text "Details"
    And Click on element by contains text "Details"
    And Wait for element by contains text "repayment"
    And Click on element by contains text "repayment"
    And Wait for element by contains text "Internal transfer"

    And Assert element by text "Debtor"
    And Assert element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Assert element by text "Recipient"
    And Assert element by text from excel "<rowindex>" columnName "credit_card_2_number"

    And Enter text "1" into EditText element and remember it under key "keyPaymentAmount"
    And Assert that text "Purpose" has first following sibling with text "INTERNAL TRANSFER"
    And Assert element by text "Payment date" has first following sibling match regex "^\d{2}\.\d{2}\.\d{4}$"
    And Swipe vertical
    And Click on element by contains text "Confirm"
    And Wait for element by text "Fee"

    #payment review
    And Assert element by text "Payment review"
    And Assert payment amount in payment review for internal transfer is from key "keyPaymentAmount" in currency "RSD"
    And Assert that text "Fee" has first following sibling with text "0,00 RSD"

    And Assert element by text "Debtor"
#    And Assert element by text "Name" with index "1" has first following sibling containing text from Excel "<rowindex>" columnName "account_details_owner"
    #And Assert element by text "Address" with index "1" has first following sibling containing text from Excel "<rowindex>" columnName "user_street"
    #And Assert element by text "Address" with index "1" has first following sibling containing text from Excel "<rowindex>" columnName "user_city"
    And Assert element by text "Account number" with index "1" has first following sibling containing text from Excel "<rowindex>" columnName "currentDomesticAccountBBAN"

    And Assert element by text "Recipient"
#    And Assert element by text "Name" with index "2" has first following sibling containing text from Excel "<rowindex>" columnName "account_details_owner"
    #And Assert element by text "Address" with index "2" has first following sibling containing text from Excel "<rowindex>" columnName "user_street"
    #And Assert element by text "Address" with index "2" has first following sibling containing text from Excel "<rowindex>" columnName "user_city"
    #And Assert element by text "Account number" with index "2" has first following sibling containing text from Excel "<rowindex>" columnName "credit_card_number"

    And Assert element by text "Payment"
    And Assert element by text "Purpose" has first following sibling contains text "INTERNAL TRANSFER"
    And Assert element by text "Payment date" has first following sibling match regex "^\d{2}\.\d{2}\.\d{4}$"
    And Swipe vertical
    And Wait for element by text "Pay"
    And Assert element by text "Cancel"
    And Click on element by text "Pay"

    And Wait for element by text "Enter PIN"
    And Enter PIN
    And Wait for element by text "Payment amount"
    And Assert payment amount in payment confirmation is from key "keyPaymentAmount" and currency "RSD"
    And Assert that text "Fee" has first following sibling with text "0,00 RSD"
#    And Assert element by text from key "keyAccountNumber" is displayed
    And Scroll to element by text "Purpose"
#    And Assert element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Assert element by text from excel "<rowindex>" columnName "account_details_owner"
    And Assert element by text "Payment date" has first following sibling match regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert that text "Purpose" has first following sibling with text "INTERNAL TRANSFER"

    And Assert element by id "nlb-button-alternate" that has descendant text "Reject"
    And Assert element by id "nlb-button-primary" that has descendant text "Pay"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "transactions-web-close-popup-icon" to appear
    And Assert element by text "Confirmation successful"
    And Assert element by contains text "Your payment was successfully accepted"
    And Click on element by id "transactions-web-close-popup-nlb-button"

     #past payments
    And Wait for element by text "Credit card repayment"
    And Go Back
    And Wait for element by contains text "Search"
    And Go Back
    And Wait for element by text "Pay"
    And Click on element by text "Pay"
    And Wait for element by contains text "Past payments"
    And Click on element by text "Past payments"
    And Wait for first Past payment
    And Click on Account selector in Payment list
    And Scroll until element with text from excel "<rowindex>" columnName "currentDomesticAccountBBAN" is in view
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Wait for first Past payment
    And Click on first "Executed" past payment
    And Wait element "Payment confirmation" by text
    And Assert element by id "nlb-date" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by content desc "Executed"
    And Assert element by id "nlb-currency" has text "RSD"
    And Assert element by id "nlb-title" has text "INTERNAL TRANSFER"
    And Assert element by id "nlb-details" has text from Exel "<rowindex>" columnName "account_details_owner"
    And Assert that amount in past or upcoming payment title is from key "keyPaymentAmount"
    And Assert element by text "Recipient name" has first following sibling from excel "<rowindex>" columnName "account_details_owner"
    #And Assert element by text "Recipient address" has first following sibling containing text from excel "<rowindex>" columnName "user_street"
    #And Assert element by text "Recipient address" has first following sibling containing text from excel "<rowindex>" columnName "user_city"
    #And Assert element by text "Recipient account number" has first following sibling from excel "<rowindex>" columnName "loan_account_number"

    And Assert element by text "Debtor name" has first following sibling from excel "<rowindex>" columnName "account_details_owner"
    And Assert that text "Debtor account number" has first following sibling from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    #And Assert element by text "Debtor Address" has first following sibling containing text from excel "<rowindex>" columnName "user_street"
    #And Assert element by text "Debtor Address" has first following sibling containing text from excel "<rowindex>" columnName "user_city"
    And Swipe vertical

    And Assert element by text "Payment date" has first following sibling match regex "^(0[1-9]|[12][0-9]|3[01])\.(0[1-9]|1[0-2])\.\d{4}\r?\n([01][0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9]$"
    And Assert element by text "Value date" has first following sibling match regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert that text "Fee" has first following sibling with text "0,00 RSD"
    And Assert element by text "Payment status" has first following sibling contains text "Executed"
    And Assert element by text "Repeat payment"
    And Click "Back" content description
    And Wait for first Past payment
    And Click "Back" content description
    And Wait element "My Products" by text
    And Click on element by text "My Products"
    And Wait for first product in My products page

    #products assertions after transaction debtor account
    And Scroll until element with text from excel "<rowindex>" columnName "currentDomesticAccountBBAN" is in view
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Check if current balance is lowered by amount from key "keyPaymentAmount" using balance from key "IT_001_Debtor_Balance"

    And Wait for first Transaction
    And Wait "3" seconds
    And Click on first transaction in product details

    And Wait for element by text "Settlement date"
    And Assert element by text "Transaction details"
    And Assert element by id "nlb-date" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by id "nlb-title" has text "INTERNAL TRANSFER"
    And Assert element by id "nlb-currency" has text "RSD"
    And Assert amount in transaction title is from key "keyPaymentAmount" with minus
    #And Assert that text "Account number" has first following sibling from excel "<rowindex>" columnName "credit_card_number"
    And Assert that text "Purpose" has first following sibling with text "INTERNAL TRANSFER"
    And Assert element by text "Settlement date" has first following sibling match regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by text "Value date" has first following sibling match regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert that amount label in transaction details has value from key "keyPaymentAmount" in currency "RSD"
    And Assert element by text "Transaction ID" has first following sibling match regex "^.{14}$"
    And Click "Back" content description
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Click "Back" content description
    And Wait for first product in My products page

    # asertions of card product
    Then Scroll until element with text from excel "<rowindex>" columnName "credit_card_2_number" is in view
    And Wait "1" seconds
    And Click on element by text from excel "<rowindex>" columnName "credit_card_2_number"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Assert product header has available balance value from key "key_Card_Balance"

    And Wait "3" seconds
    And Click on first transaction in product details
    And Wait for element by text "Settlement date"
    And Assert element by text "Transaction details"
    And Assert element by id "nlb-date" with regex "^\d{2}\.\d{2}\.\d{4}$"
    #And Assert element by id "nlb-title" has text "INTERNAL TRANSFER"
    And Assert element by id "nlb-currency" has text "RSD"
    And Assert amount in transaction title is from key "keyPaymentAmount"
    And Assert that text "Purpose" has first following sibling with text "INTERNAL TRANSFER"
    And Assert element by text "Authorization date" has first following sibling match regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by text "Settlement date" has first following sibling match regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by text "Value date" has first following sibling match regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert that amount label in transaction details has value from key "keyPaymentAmount" in currency "RSD"
    And Assert element by text "Amount in Local Currency" has first following sibling that contains value from key "keyPaymentAmount"
    And Assert element by text "Transaction ID" has first following sibling match regex "^.{14}$"
    

    Examples:
      | rowindex |
      |        5 |


  @Payments_Specific_Payment_Credit_Card_Repayment_[ANDROID]-From_Saving_Account
  Scenario Outline: Payments_Specific_Payment_Credit_Card_Repayment_[ANDROID]-From_Saving_Account

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load

    When Click on Bottom navigation button "My Products"
    And Wait for first product in My products page
    And Scroll until element with text from excel "<rowindex>" columnName "saving_account_number" is in view
    And Click on element by text from excel "<rowindex>" columnName "saving_account_number"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Remember available balance in currency "RSD" under key "IT_001_Debtor_Balance"
    And Click "Back" content description
    And Swipe vertical up
    And Swipe vertical up
    And Scroll until element with text from excel "<rowindex>" columnName "credit_card_2_number" is in view
    And Click on element by text from excel "<rowindex>" columnName "credit_card_2_number"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Remember available balance in currency "RSD" under key "key_Card_Balance"
    And Wait for element by contains text "Details"
    And Click on element by contains text "Details"
    And Wait for element by contains text "repayment"
    And Click on element by contains text "repayment"
    And Wait for element by contains text "Internal transfer"

    And Assert element by text "Debtor"
    And Click on "Debtor" container for current account picker in Own account Transfer
    And Scroll until element with text from excel "<rowindex>" columnName "saving_account_number" is in view
    And Click on element by text from excel "<rowindex>" columnName "saving_account_number"
    And Wait "1" seconds
    And Assert element by text "Recipient"
    And Assert element by text from excel "<rowindex>" columnName "credit_card_2_number"

    Then Enter text "1" into EditText element and remember it under key "keyPaymentAmount"
    And Assert that text "Purpose" has first following sibling with text "INTERNAL TRANSFER"
    And Assert element by text "Payment date" has first following sibling match regex "^\d{2}\.\d{2}\.\d{4}$"
    And Swipe vertical
    And Wait for element by contains text "Confirm"
    And Click on element by contains text "Confirm"
    And Wait for element by text "Not-possible-transfer-between-accounts"
    And Assert element by contains text "Error"


    Examples:
      | rowindex |
      |        5 |