Feature: Own_Account_Transfer

  @Payments-Own_Account_Transfer-From_Current_Account_RSD_To_Current_Account_RSD_[MOB_ANDROID]
  Scenario Outline: Payments-Own_Account_Transfer-From_Current_Account_RSD_To_Current_Account_RSD_[MOB_ANDROID]

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
    And Scroll until element with text from excel "<rowindex>" columnName "second_personal_account_bban" is in view
    And Wait "1" seconds
    And Click on element by text from excel "<rowindex>" columnName "second_personal_account_bban"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Remember available balance in currency "RSD" under key "IT_001_Creditor_Balance"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Pay"

    When Click on element by text "Pay"
    And Wait for element by text "Internal transfer"
    And Click on element by text "Internal transfer"
    And Wait for element by text "Debtor"

    And Click on "Debtor" container for current account picker in Own account Transfer
    And Scroll until element with text from excel "<rowindex>" columnName "currentDomesticAccountBBAN" is in view
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Wait for element by text "Debtor"

    And Click on "Recipient" container for current account picker in Own account Transfer
    And Scroll until element with text from excel "<rowindex>" columnName "second_personal_account_bban" is in view
    And Wait "1" seconds
    And Click on element by text from excel "<rowindex>" columnName "second_personal_account_bban"
    And Wait for element by text "Debtor"

    And Assert element by text "Debtor"
    And Assert element by content desc "Current account"
    And Assert element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Assert element by text "Recipient"
    And Assert element by text from excel "<rowindex>" columnName "second_personal_account_bban"
    And Assert element by text "Payment"
    And Assert element by text "Payment amount"

    And Enter text "1" in element id "nlb-amount-with-currency-field" and remember it under key "keyPaymentAmount"
    And Assert element by text "RSD"
    And Assert element by text "Purpose"
    And Assert element by text "INTERNAL TRANSFER"

    And Swipe vertical
    And Wait for element by text "Cancel"
    And Click on element by text "Confirm"
    And Wait for element by contains text "Fee"

    #payment review
    And Assert element by text "Payment review"
    And Assert payment amount in payment review for internal transfer is from key "keyPaymentAmount" in currency "RSD"
    And Assert that text "Fee" has first following sibling with text "0,00 RSD"

    And Assert element by text "Debtor"
    And Assert element by text "Name" with index "1" has first following sibling containing text from Excel "<rowindex>" columnName "account_details_owner"
    And Assert element by text "Address" with index "1" has first following sibling containing text from Excel "<rowindex>" columnName "user_street"
    And Assert element by text "Address" with index "1" has first following sibling containing text from Excel "<rowindex>" columnName "user_city"
    #And Assert element by text "Debtor account" has first following sibling from excel "<rowindex>" columnName "personal_account_iban"

    And Assert element by text "Recipient"
    And Assert element by text "Name" with index "2" has first following sibling containing text from Excel "<rowindex>" columnName "account_details_owner"
    And Assert element by text "Address" with index "2" has first following sibling containing text from Excel "<rowindex>" columnName "user_street"
    And Assert element by text "Address" with index "2" has first following sibling containing text from Excel "<rowindex>" columnName "user_city"
    And Assert element by text "Account number" with index "2" has first following sibling containing text from Excel "<rowindex>" columnName "second_personal_account_bban"

    And Assert element by text "Payment details"
    And Assert element by text "Purpose" has first following sibling contains text "INTERNAL TRANSFER"
    And Swipe vertical
    And Wait for element by text "Pay"
    And Assert element by text "Cancel"
    And Click on element by text "Pay"

    And Wait for element by text "Enter PIN"
    And Enter PIN
    And Wait for element by text "Payment amount"
    And Assert that text "Payment amount" has first following sibling that contains text "1,00 RSD"
    And Assert that text "Fee" has first following sibling with text "0,00 RSD"
#    And Assert element by text from key "keyAccountNumber" is displayed
    And Scroll to element by text "Purpose"
#    And Assert element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Assert element by text from excel "<rowindex>" columnName "account_details_owner2"
    And Assert element by text "Payment date" has first following sibling match regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert that text "Purpose" has first following sibling with text "INTERNAL TRANSFER"

    And Assert element by id "nlb-button-alternate" that has descendant text "Reject"
    And Assert element by id "nlb-button-primary" that has descendant text "Confirm"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "transactions-web-close-popup-icon" to appear
    And Assert element by text "Confirmation successful"
    And Assert element by contains text "Your payment was successfully accepted"
    And Click on element by id "transactions-web-close-popup-nlb-button"

    #past payments
    And Wait for element by text "Past payments"
    And Click on element by text "Past payments"
    And Wait for first Past payment
    #selecting account in past payment
    And Click on Account selector in Payment list
    And Scroll until element with text from excel "<rowindex>" columnName "currentDomesticAccountBBAN" is in view
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Wait for first Past payment
    And Click on first "Executed" past payment
    And Wait element "Payment confirmation" by text

    #past payment debtor current account
    And Assert element by id "nlb-date" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by content desc "Executed"
    And Assert element by id "nlb-currency" has text "RSD"
    And Assert element by id "nlb-title" has text "INTERNAL TRANSFER"
    And Assert element by id "nlb-details" has text from Exel "<rowindex>" columnName "account_details_owner"

    And Assert that upcoming or past payment title has amount from key "keyPaymentAmount"
    And Assert element by text "Recipient name" has first following sibling from excel "<rowindex>" columnName "account_details_owner"
    And Assert element by text "Recipient address" has first following sibling containing text from excel "<rowindex>" columnName "user_street"
    And Assert element by text "Recipient address" has first following sibling containing text from excel "<rowindex>" columnName "user_city"
    And Assert element by text "Recipient account number" has first following sibling from excel "<rowindex>" columnName "second_personal_account_bban"

    And Assert element by text "Debtor name" has first following sibling from excel "<rowindex>" columnName "account_details_owner"
    #And Assert that text "Debtor account number" has first following sibling from excel "<rowindex>" columnName "personal_account_bban"
    And Assert element by text "Debtor Address" has first following sibling containing text from excel "<rowindex>" columnName "user_street"
    And Assert element by text "Debtor Address" has first following sibling containing text from excel "<rowindex>" columnName "user_city"
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
    #And Assert element by id "nlb-details" has text from Exel "<rowindex>" columnName "account_details_owner2"
   #And Assert that text "Name and address" has first following sibling from excel "<rowindex>" columnName "account_details_owner2"
    #And Assert that text "Account number" has first following sibling from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Assert that text "Purpose" has first following sibling with text "INTERNAL TRANSFER"
    And Assert element by text "Settlement date" has first following sibling match regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by text "Value date" has first following sibling match regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert that amount label in transaction details has value from key "keyPaymentAmount" in currency "RSD"
    And Assert element by text "Transaction ID" has first following sibling match regex "^.{14}$"
    And Click "Back" content description
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Click "Back" content description
    And Wait for first product in My products page

    #products assertions after transaction recipient account
    Then Scroll until element with text from excel "<rowindex>" columnName "second_personal_account_bban" is in view
    And Click on element by text from excel "<rowindex>" columnName "second_personal_account_bban"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Check if current balance is increased by amount from key "keyPaymentAmount" using balance from key "IT_001_Creditor_Balance"
    And Wait for first Transaction
    And Wait "3" seconds
    And Click on first transaction in product details

    And Wait for element by text "Settlement date"
    And Assert element by text "Transaction details"
    And Assert element by id "nlb-date" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by id "nlb-title" has text "INTERNAL TRANSFER"
    And Assert element by id "nlb-currency" has text "RSD"
    And Assert amount in transaction title is from key "keyPaymentAmount"
    #And Assert element by id "nlb-details" has text from Exel "<rowindex>" columnName "account_details_owner2"
    #And Assert that text "Name and address" has first following sibling from excel "<rowindex>" columnName "account_details_owner2"
    #And Assert that text "Account number" has first following sibling from excel "<rowindex>" columnName "personal_account_iban"
    And Assert that text "Purpose" has first following sibling with text "INTERNAL TRANSFER"
    And Assert element by text "Settlement date" has first following sibling match regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by text "Value date" has first following sibling match regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert that amount label in transaction details has value from key "keyPaymentAmount" in currency "RSD"
    And Assert element by text "Transaction ID" has first following sibling match regex "^.{14}$"

    Examples:
      | rowindex |
      |        2 |

    # todo nije u execute fajlu jos
  @Payments-Own_Account_Transfer-From_Current_Account_RSD_To_Current_Authorized_Account_RSD_[MOB_ANDROID]
  Scenario Outline: Payments-Own_Account_Transfer-From_Current_Account_RSD_To_Current_Authorized_Account_RSD_[MOB_ANDROID]

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
    And Scroll until element with text from excel "<rowindex>" columnName "auth_personal_account_number" is in view
    And Wait "1" seconds
    And Click on element by text from excel "<rowindex>" columnName "auth_personal_account_number"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Remember available balance in currency "RSD" under key "IT_001_Creditor_Balance"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Pay"

    When Click on element by text "Pay"
    And Wait for element by text "Internal transfer"
    And Click on element by text "Internal transfer"
    And Wait for element by text "Debtor"

    And Click on "Debtor" container for current account picker in Own account Transfer
    And Scroll until element with text from excel "<rowindex>" columnName "currentDomesticAccountBBAN" is in view
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Wait for element by text "Debtor"

    And Click on "Recipient" container for current account picker in Own account Transfer
    And Scroll until element with text from excel "<rowindex>" columnName "auth_personal_account_number" is in view
    And Wait "1" seconds
    And Click on element by text from excel "<rowindex>" columnName "auth_personal_account_number"
    And Wait for element by text "Debtor"

    And Assert element by text "Debtor"
    And Assert element by content desc "Current account"
    And Assert element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Assert element by text "Recipient"
    And Assert element by text from excel "<rowindex>" columnName "auth_personal_account_number"
    And Assert element by text "Payment"
    And Assert element by text "Payment amount"

    And Enter text "1" in element id "nlb-amount-with-currency-field" and remember it under key "keyPaymentAmount"
    And Assert element by text "RSD"
    And Assert element by text "Purpose"
    And Assert element by text "INTERNAL TRANSFER"

    And Swipe vertical
    And Wait for element by text "Cancel"
    And Click on element by text "Confirm"
    And Wait for element by contains text "Fee"

    #payment review
    And Assert element by text "Payment review"
    And Assert payment amount in payment review for internal transfer is from key "keyPaymentAmount" in currency "RSD"
    And Assert that text "Fee" has first following sibling with text "0,00 RSD"

    And Assert element by text "Debtor"
    And Assert element by text "Name" with index "1" has first following sibling containing text from Excel "<rowindex>" columnName "account_details_owner"
    #And Assert element by text "Address" with index "1" has first following sibling containing text from Excel "<rowindex>" columnName "user_street"
    #And Assert element by text "Address" with index "1" has first following sibling containing text from Excel "<rowindex>" columnName "user_city"
    And Assert element by text "Debtor account" has first following sibling from excel "<rowindex>" columnName "personal_account_iban"

    And Assert element by text "Recipient"
    And Assert element by text "Name" with index "2" has first following sibling containing text from Excel "<rowindex>" columnName "account_details_owner"
    #And Assert element by text "Address" with index "2" has first following sibling containing text from Excel "<rowindex>" columnName "user_street"
    #And Assert element by text "Address" with index "2" has first following sibling containing text from Excel "<rowindex>" columnName "user_city"
    And Assert element by text "Account number" with index "2" has first following sibling containing text from Excel "<rowindex>" columnName "auth_personal_account_number"

    And Assert element by text "Payment details"
    And Assert element by text "Purpose" has first following sibling contains text "INTERNAL TRANSFER"
    And Swipe vertical
    And Wait for element by text "Pay"
    And Assert element by text "Cancel"
    And Click on element by text "Pay"

    And Wait for element by text "Enter PIN"
    And Enter PIN
    And Wait for element by text "Payment amount"
    #TODO duplikat korak uklanja se kada test prodje sa korakom ispod njega
    And Assert that text "Payment amount" has first following sibling that contains text "1,00 RSD"
    And Assert payment amount in payment confirmation is from key "keyPaymentAmount" and currency "RSD"
    And Assert that text "Fee" has first following sibling with text "0,00 RSD"
#    And Assert element by text from key "keyAccountNumber" is displayed
    And Scroll to element by text "Purpose"
#    And Assert element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Assert element by text from excel "<rowindex>" columnName "account_details_owner2"
    And Assert element by text "Payment date" has first following sibling match regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert that text "Purpose" has first following sibling with text "INTERNAL TRANSFER"

    And Assert element by id "nlb-button-alternate" that has descendant text "Reject"
    And Assert element by id "nlb-button-primary" that has descendant text "Confirm"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "transactions-web-close-popup-icon" to appear
    And Assert element by text "Confirmation successful"
    And Assert element by contains text "Your payment was successfully accepted"
    And Click on element by id "transactions-web-close-popup-nlb-button"

    #upcoming payments
    And Wait for element by text "Past payments"
    And Click on element by text "Upcoming payments"
    And Wait for first Past payment
    #selecting account in upcoming payment
    And Click on Account selector in Payment list
    And Scroll until element with text from excel "<rowindex>" columnName "currentDomesticAccountBBAN" is in view
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Wait for first Past payment
    And Click on first upcoming payment
    And Wait element "Recipient name" by text

    #upcoming payment debtor current account
    And Assert element by id "nlb-date" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by id "nlb-currency" has text "RSD"
    And Assert element by id "nlb-title" has text "INTERNAL TRANSFER"
    And Assert element by id "nlb-details" has text from Exel "<rowindex>" columnName "account_details_owner"
    And Assert that upcoming or past payment title has amount from key "keyPaymentAmount"
    And Assert element by text "Recipient name" has first following sibling from excel "<rowindex>" columnName "account_details_owner"
    #And Assert element by text "Recipient address" has first following sibling containing text from excel "<rowindex>" columnName "user_street"
    #And Assert element by text "Recipient address" has first following sibling containing text from excel "<rowindex>" columnName "user_city"
    And Assert element by text "Recipient account number" has first following sibling from excel "<rowindex>" columnName "auth_personal_account_number"
    And Assert element by contains text "Urgent" has first following sibling containing text "No"
    And Assert element by text "Debtor name" has first following sibling from excel "<rowindex>" columnName "account_details_owner"
    And Assert that text "Debtor account number" has first following sibling from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    #And Assert element by text "Debtor Address" has first following sibling containing text from excel "<rowindex>" columnName "user_street"
    #And Assert element by text "Debtor Address" has first following sibling containing text from excel "<rowindex>" columnName "user_city"
    And Swipe vertical

    And Assert element by text "Payment date" has first following sibling match regex "^(0[1-9]|[12][0-9]|3[01])\.(0[1-9]|1[0-2])\.\d{4}\r?\n([01][0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9]$"
    And Assert element by text "Value date" has first following sibling match regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert that text "Fee" has first following sibling with text "0,00 RSD"
    And Wait "30" seconds
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
    #And Assert element by id "nlb-details" has text from Exel "<rowindex>" columnName "account_details_owner2"
   #And Assert that text "Name and address" has first following sibling from excel "<rowindex>" columnName "account_details_owner2"
    #And Assert that text "Account number" has first following sibling from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Assert that text "Purpose" has first following sibling with text "INTERNAL TRANSFER"
    And Assert element by text "Settlement date" has first following sibling match regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by text "Value date" has first following sibling match regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert that amount label in transaction details has value from key "keyPaymentAmount" in currency "RSD"
    And Assert element by text "Transaction ID" has first following sibling match regex "^.{14}$"
    And Click "Back" content description
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Click "Back" content description
    And Wait for first product in My products page

    #products assertions after transaction recipient account
    Then Scroll until element with text from excel "<rowindex>" columnName "auth_personal_account_number" is in view
    And Click on element by text from excel "<rowindex>" columnName "auth_personal_account_number"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Check if current balance is increased by amount from key "keyPaymentAmount" using balance from key "IT_001_Creditor_Balance"
    And Wait for first Transaction
    And Wait "3" seconds
    And Click on first transaction in product details

    And Wait for element by text "Settlement date"
    And Assert element by text "Transaction details"
    And Assert element by id "nlb-date" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by id "nlb-title" has text "INTERNAL TRANSFER"
    And Assert element by id "nlb-currency" has text "RSD"
    And Assert amount in transaction title is from key "keyPaymentAmount"
    #And Assert element by id "nlb-details" has text from Exel "<rowindex>" columnName "account_details_owner2"
    #And Assert that text "Name and address" has first following sibling from excel "<rowindex>" columnName "account_details_owner2"
    #And Assert that text "Account number" has first following sibling from excel "<rowindex>" columnName "personal_account_iban"
    And Assert that text "Purpose" has first following sibling with text "INTERNAL TRANSFER"
    And Assert element by text "Settlement date" has first following sibling match regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by text "Value date" has first following sibling match regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert that amount label in transaction details has value from key "keyPaymentAmount" in currency "RSD"
    And Assert element by text "Transaction ID" has first following sibling match regex "^.{14}$"

    Examples:
      | rowindex |
      |        2 |


  @Payments_Own_Account_Transfer_From_Current_Foreign_Account_To_Current_Foreign_Account_[ANDROID]
  Scenario Outline: Payments_Own_Account_Transfer_From_Current_Foreign_Account_To_Current_Foreign_Account_[ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click "My Products"
    And Wait for element by text "Edit list"
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Remember available balance in currency "EUR" under key "IT_001_Debtor_Balance"

    And Click "Back" content description from view tag "View"
    And Wait for first product in My products page
    And Swipe vertical up
    And Scroll until element with text from excel "<rowindex>" columnName "second_personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "second_personal_account_iban"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Remember available balance in currency "EUR" under key "IT_001_Creditor_Balance"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Pay"

    When Click on element by text "Pay"
    And Wait for element by text "Internal transfer"
    And Click on element by text "Internal transfer"
    And Wait for element by text "Debtor"

    And Click on "Debtor" container for current account picker in Own account Transfer
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by text "Debtor"

    And Click on "Recipient" container for current account picker in Own account Transfer
    And Scroll until element with text from excel "<rowindex>" columnName "second_personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "second_personal_account_iban"
    And Wait for element by text "Debtor"

    And Assert element by text "Debtor"
    And Assert element by content desc "Current account"
    And Assert element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Assert element by text "Recipient"
    And Assert element by text from excel "<rowindex>" columnName "second_personal_account_iban"
    And Assert element by text "Payment"
    And Assert element by text "Payment amount"

    And Enter text "1" in element id "nlb-amount-with-currency-field" and remember it under key "keyPaymentAmount"
    And Assert element by text "EUR"
    And Assert element by text "Purpose"
    And Assert element by text "INTERNAL TRANSFER"

    And Swipe vertical
    And Wait for element by text "Cancel"
    And Click on element by text "Confirm"
    And Wait for element by contains text "Fee"

    #payment review
    And Assert element by text "Payment review"
    And Assert payment amount in payment review for internal transfer is from key "keyPaymentAmount" in currency "EUR"
    And Assert that text "Fee" has first following sibling with text "0,00 EUR"

    And Assert element by text "Debtor"
    And Assert element by text "Name" with index "1" has first following sibling containing text from Excel "<rowindex>" columnName "account_details_owner"
    And Assert element by text "Address" with index "1" has first following sibling containing text from Excel "<rowindex>" columnName "user_street"
    And Assert element by text "Address" with index "1" has first following sibling containing text from Excel "<rowindex>" columnName "user_city"
    #And Assert element by text "Debtor account" has first following sibling from excel "<rowindex>" columnName "personal_account_iban"

    And Assert element by text "Recipient"
    And Assert element by text "Name" with index "2" has first following sibling containing text from Excel "<rowindex>" columnName "account_details_owner"
    And Assert element by text "Address" with index "2" has first following sibling containing text from Excel "<rowindex>" columnName "user_street"
    And Assert element by text "Address" with index "2" has first following sibling containing text from Excel "<rowindex>" columnName "user_city"
    And Assert element by text "Account number" with index "2" has first following sibling containing text from Excel "<rowindex>" columnName "second_personal_account_iban"

    And Assert element by text "Payment details"
    And Assert element by text "Purpose" has first following sibling contains text "INTERNAL TRANSFER"
    And Swipe vertical
    And Wait for element by text "Pay"
    And Assert element by text "Cancel"
    And Click on element by text "Pay"

    And Wait for element by text "Enter PIN"
    And Enter PIN
    And Wait for element by text "Payment amount"
    And Assert that text "Payment amount" has first following sibling that contains text "1,00 EUR"
    And Assert that text "Fee" has first following sibling with text "0,00 EUR"
#    And Assert element by text from key "keyAccountNumber" is displayed
    And Scroll to element by text "Purpose"
#    And Assert element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Assert element by text from excel "<rowindex>" columnName "account_details_owner2"
    And Assert element by text "Payment date" has first following sibling match regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert that text "Purpose" has first following sibling with text "INTERNAL TRANSFER"

    And Assert element by id "nlb-button-alternate" that has descendant text "Reject"
    And Assert element by id "nlb-button-primary" that has descendant text "Confirm"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "transactions-web-close-popup-icon" to appear
    And Assert element by text "Confirmation successful"
    And Assert element by contains text "Your payment was successfully accepted"
    And Click on element by id "transactions-web-close-popup-nlb-button"

    #past payments
    And Wait for element by text "Past payments"
    And Click on element by text "Past payments"
    And Wait for first Past payment
    #selecting account in past payment
    And Click on Account selector in Payment list
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for first Past payment
    And Click on first "Executed" past payment
    And Wait element "Payment confirmation" by text

    #past payment debtor current account
    And Assert element by id "nlb-date" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by content desc "Executed"
    And Assert element by id "nlb-currency" has text "EUR"
    And Assert element by id "nlb-title" has text "INTERNAL TRANSFER"
    And Assert element by id "nlb-details" has text from Exel "<rowindex>" columnName "account_details_owner"
    
    And Assert that upcoming or past payment title has amount from key "keyPaymentAmount"
    And Assert element by text "Recipient name" has first following sibling from excel "<rowindex>" columnName "account_details_owner"
    And Assert element by text "Recipient address" has first following sibling containing text from excel "<rowindex>" columnName "user_street"
    And Assert element by text "Recipient address" has first following sibling containing text from excel "<rowindex>" columnName "user_city"
    And Assert element by text "Recipient account number" has first following sibling from excel "<rowindex>" columnName "second_personal_account_iban"

    And Assert element by text "Debtor name" has first following sibling from excel "<rowindex>" columnName "account_details_owner"
    #And Assert that text "Debtor account number" has first following sibling from excel "<rowindex>" columnName "personal_account_iban"
    And Assert element by text "Debtor Address" has first following sibling containing text from excel "<rowindex>" columnName "user_street"
    And Assert element by text "Debtor Address" has first following sibling containing text from excel "<rowindex>" columnName "user_city"
    And Swipe vertical

    And Assert element by text "Payment date" has first following sibling match regex "^(0[1-9]|[12][0-9]|3[01])\.(0[1-9]|1[0-2])\.\d{4}\r?\n([01][0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9]$"
    And Assert element by text "Value date" has first following sibling match regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert that text "Fee" has first following sibling with text "0,00 EUR"
    And Assert element by text "Payment status" has first following sibling contains text "Executed"
    And Assert element by text "Repeat payment"
    And Click "Back" content description
    And Wait for first Past payment
    And Click "Back" content description
    And Wait element "My Products" by text
    And Click on element by text "My Products"
    And Wait for first product in My products page

    #products assertions after transaction debtor account
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Check if current balance is lowered by amount from key "keyPaymentAmount" using balance from key "IT_001_Debtor_Balance"

    And Wait for first Transaction
    And Wait "3" seconds
    And Click on first transaction in product details

    And Wait for element by text "Settlement date"
    And Assert element by text "Transaction details"
    And Assert element by id "nlb-date" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by id "nlb-title" has text "INTERNAL TRANSFER"
    And Assert element by id "nlb-currency" has text "EUR"
    And Assert amount in transaction title is from key "keyPaymentAmount" with minus
    #And Assert element by id "nlb-details" has text from Exel "<rowindex>" columnName "account_details_owner2"
    #And Assert that text "Name and address" has first following sibling from excel "<rowindex>" columnName "account_details_owner2"
    #And Assert that text "Account number" has first following sibling from excel "<rowindex>" columnName "personal_account_iban"
    And Assert that text "Purpose" has first following sibling with text "INTERNAL TRANSFER"
    And Assert element by text "Settlement date" has first following sibling match regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by text "Value date" has first following sibling match regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert that amount label in transaction details has value from key "keyPaymentAmount" in currency "EUR"
    And Assert element by text "Transaction ID" has first following sibling match regex "^.{14}$"
    And Click "Back" content description
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Click "Back" content description
    And Wait for first product in My products page
    And Swipe vertical up

    #products assertions after transaction recipient account
    Then Scroll until element with text from excel "<rowindex>" columnName "second_personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "second_personal_account_iban"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Check if current balance is increased by amount from key "keyPaymentAmount" using balance from key "IT_001_Creditor_Balance"
    And Wait for first Transaction
    And Wait "3" seconds
    And Click on first transaction in product details

    And Wait for element by text "Settlement date"
    And Assert element by text "Transaction details"
    And Assert element by id "nlb-date" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by id "nlb-title" has text "INTERNAL TRANSFER"
    And Assert element by id "nlb-currency" has text "EUR"
    And Assert amount in transaction title is from key "keyPaymentAmount"
    #And Assert element by id "nlb-details" has text from Exel "<rowindex>" columnName "account_details_owner2"
    #And Assert that text "Name and address" has first following sibling from excel "<rowindex>" columnName "account_details_owner2"
    #And Assert that text "Account number" has first following sibling from excel "<rowindex>" columnName "personal_account_iban"
    And Assert that text "Purpose" has first following sibling with text "INTERNAL TRANSFER"
    And Assert element by text "Settlement date" has first following sibling match regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by text "Value date" has first following sibling match regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert that amount label in transaction details has value from key "keyPaymentAmount" in currency "EUR"
    And Assert element by text "Transaction ID" has first following sibling match regex "^.{14}$"

    Examples:
      | rowindex |
      |        5 |


  @Payments_Own_Account_Transfer_To_Loan_[ANDROID]
  Scenario Outline: Payments_Own_Account_Transfer_To_Loan_[ANDROID]

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
    And Scroll until element with text from excel "<rowindex>" columnName "loan_account_number" is in view
    And Click on element by text from excel "<rowindex>" columnName "loan_account_number"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Remember available balance in currency "RSD" under key "IT_001_Creditor_Balance"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Pay"

    When Click on element by text "Pay"
    And Wait for element by text "Internal transfer"
    And Click on element by text "Internal transfer"
    And Wait for element by text "Debtor"

    And Click on "Debtor" container for current account picker in Own account Transfer
    And Scroll until element with text from excel "<rowindex>" columnName "currentDomesticAccountBBAN" is in view
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Wait for element by text "Debtor"

    And Click on "Recipient" container for current account picker in Own account Transfer
    And Scroll until element with text from excel "<rowindex>" columnName "loan_account_number" is in view
    And Click on element by text from excel "<rowindex>" columnName "loan_account_number"
    And Wait for element by text "Debtor"

    And Assert Debtor in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "currentDomesticAccountName" and iban "currentDomesticAccountBBAN"
    And Assert element by text from excel "<rowindex>" columnName "loan_account_number"

    And Assert element by text "Recipient"
    And Assert element by text "Payment"
    And Assert element by text "Payment amount"

    And Enter text "1" in element id "nlb-amount-with-currency-field" and remember it under key "keyPaymentAmount"
    And Assert element by text "RSD"
    And Assert element by text "Purpose"
    And Assert element by text "INTERNAL TRANSFER"
    And Assert "Payment date" date is today date

    And Swipe vertical
    And Wait for element by text "Cancel"
    And Click on element by text "Confirm"
    And Wait for element by contains text "Fee"

    #payment review
    And Assert element by text "Payment review"
    And Assert payment amount in payment review for internal transfer is from key "keyPaymentAmount" in currency "RSD"
    And Assert that text "Fee" has first following sibling with text "0,00 RSD"

    And Assert element by text "Debtor"
#    And Assert element by text "Name" with index "1" has first following sibling containing text from Excel "<rowindex>" columnName "account_details_owner"
    And Assert element by text "Address" with index "1" has first following sibling containing text from Excel "<rowindex>" columnName "user_street"
    And Assert element by text "Address" with index "1" has first following sibling containing text from Excel "<rowindex>" columnName "user_city"
    And Assert element by text "Account number" with index "1" has first following sibling containing text from Excel "<rowindex>" columnName "currentDomesticAccountBBAN"

    And Assert element by text "Recipient"
#    And Assert element by text "Name" with index "2" has first following sibling containing text from Excel "<rowindex>" columnName "account_details_owner"
    And Assert element by text "Address" with index "2" has first following sibling containing text from Excel "<rowindex>" columnName "user_street"
    And Assert element by text "Address" with index "2" has first following sibling containing text from Excel "<rowindex>" columnName "user_city"
    And Assert element by text "Account number" with index "2" has first following sibling containing text from Excel "<rowindex>" columnName "loan_account_number"

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
    And Assert that text "Payment amount" has first following sibling that contains text "1,00 RSD"
    And Assert that text "Fee" has first following sibling with text "0,00 RSD"
#    And Assert element by text from key "keyAccountNumber" is displayed
    And Scroll to element by text "Purpose"
#    And Assert element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Assert element by text from excel "<rowindex>" columnName "account_details_owner2"
    And Assert element by text "Payment date" has first following sibling match regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert that text "Purpose" has first following sibling with text "INTERNAL TRANSFER"

    And Assert element by id "nlb-button-alternate" that has descendant text "Reject"
    And Assert element by id "nlb-button-primary" that has descendant text "Confirm"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "transactions-web-close-popup-icon" to appear
    And Assert element by text "Confirmation successful"
    And Assert element by contains text "Your payment was successfully accepted"
    And Click on element by id "transactions-web-close-popup-nlb-button"

     #past payments
    And Wait for element by text "Past payments"
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
    And Assert element by text "Recipient address" has first following sibling containing text from excel "<rowindex>" columnName "user_street"
    And Assert element by text "Recipient address" has first following sibling containing text from excel "<rowindex>" columnName "user_city"
    #And Assert element by text "Recipient account number" has first following sibling from excel "<rowindex>" columnName "loan_account_number"

    And Assert element by text "Debtor name" has first following sibling from excel "<rowindex>" columnName "account_details_owner"
    And Assert that text "Debtor account number" has first following sibling from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Assert element by text "Debtor Address" has first following sibling containing text from excel "<rowindex>" columnName "user_street"
    And Assert element by text "Debtor Address" has first following sibling containing text from excel "<rowindex>" columnName "user_city"
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
    And Assert that text "Account number" has first following sibling from excel "<rowindex>" columnName "loan_account_number"
    And Assert that text "Purpose" has first following sibling with text "INTERNAL TRANSFER"
    And Assert element by text "Settlement date" has first following sibling match regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by text "Value date" has first following sibling match regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert that amount label in transaction details has value from key "keyPaymentAmount" in currency "RSD"
    And Assert element by text "Transaction ID" has first following sibling match regex "^.{14}$"
    And Click "Back" content description
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Click "Back" content description
    And Wait for first product in My products page

    # asertions of loan product
    Then Scroll until element with text from excel "<rowindex>" columnName "loan_account_number" is in view
    And Wait "1" seconds
    And Click on element by text from excel "<rowindex>" columnName "loan_account_number"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Assert product header has available balance value from key "IT_001_Creditor_Balance"

    Examples:
      | rowindex |
      | 8        |


  @Payments_Own_Account_Transfer-Flow_Disruption_Cancel/Back_[MOB_ANDROID]
  Scenario Outline: Payments_Own_Account_Transfer-Flow_Disruption_Cancel/Back_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    And Click on Bottom navigation button "Pay"
    And Click on element by contains text "Internal transfer"

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

    When Click on element by text "Internal transfer"
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
    And Assert element by text "Internal transfer"
    And Swipe vertical
    And Click on element by contains text "Cancel"
    And Wait "1" seconds
    And Wait for element by contains text "terminate"
    And Assert element by contains text "Cancelling now will terminate the payment process."
    And Assert element by contains text "Yes"
    And Assert element by contains text "No"
    And Click on element by contains text "Yes"
    And Assert element by contains text "Payments"
    And Click on element by text "Internal transfer"
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


  @Payments-Own_Account_Transfer-Invalid_Account_Combination_[MOB_ANDROID]
  Scenario Outline: Payments-Own_Account_Transfer-Invalid_Account_Combination_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    And Click on Bottom navigation button "Pay"

    When Click on element by text "Internal transfer"
    And Wait element "Debtor" by text

    #current domestic accounts
    And Click on Debtor selector for payment
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Wait element "Debtor" by text
    And Click on Recipient selector for payment
    And Wait "2" seconds
    And Assert account name "Devizni platni račun" is not displayed
    And Assert account number containing "RS" is not displayed
    And Assert account number from Excel "<rowindex>" columnName "currentDomesticAccountBBAN" is not displayed
    And Swipe vertical
    And Assert account name "Devizni platni račun" is not displayed
    And Assert account number containing "RS" is not displayed
    And Assert account number from Excel "<rowindex>" columnName "currentDomesticAccountBBAN" is not displayed
    And Click "Back" content description
    And Wait element "Debtor" by text

    #saving accounts
    And Click on Debtor selector for payment
    And Click on element by text from excel "<rowindex>" columnName "saving_account_number"
    And Wait element "Debtor" by text
    And Click on Recipient selector for payment
    And Wait "2" seconds
    And Assert account name "Devizni platni račun" is not displayed
    And Assert account number containing "RS" is not displayed
    And Assert account number from Excel "<rowindex>" columnName "saving_account_number" is not displayed
    And Swipe vertical
    And Assert account name "Devizni platni račun" is not displayed
    And Assert account number containing "RS" is not displayed
    And Assert account number from Excel "<rowindex>" columnName "saving_account_number" is not displayed
    And Click "Back" content description

    #current foreign accounts
    Then Click on Debtor selector for payment
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait element "Debtor" by text
    And Click on Recipient selector for payment
    And Wait "2" seconds
    And Assert account name "Tekući račun" is not displayed
    And Assert account number containing "205-" is not displayed
    And Assert account number from Excel "<rowindex>" columnName "personal_account_iban" is not displayed
    And Assert account name "A vista" is not displayed
    And Assert account number containing "9011" is not displayed
    And Assert account name "Visa" is not displayed
    And Assert account number containing "****" is not displayed
    And Assert account name "kredit" is not displayed
    And Assert account number containing "00490" is not displayed
    And Swipe vertical
    And Assert account name "Tekući račun" is not displayed
    And Assert account number containing "205-" is not displayed
    And Assert account number from Excel "<rowindex>" columnName "personal_account_iban" is not displayed
    And Assert account name "A vista" is not displayed
    And Assert account number containing "9011" is not displayed
    And Assert account name "Visa" is not displayed
    And Assert account number containing "****" is not displayed
    And Assert account name "kredit" is not displayed
    And Assert account number containing "00490" is not displayed
    And Click "Back" content description

    Examples:
      | rowindex |
      |        1 |