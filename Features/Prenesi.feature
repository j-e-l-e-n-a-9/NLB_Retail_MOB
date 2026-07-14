Feature: Prenesi

  @Payments_Specific_Payment_PRENESI_Confirm_Successful_Payments_Archive_[MOB_ANDROID]
  Scenario Outline: Payments_Specific_Payment_PRENESI_Confirm_Successful_Payments_Archive_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    And Click on element by text "My Products"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "currentDomesticAccountBBAN" is in view
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Remember available balance in currency "RSD" under key "IT_001_Creditor_Balance"
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-primary-balance" to appear

    When Click on element by text "Pay"
    And Wait element "Domestic payment" by text
    And Click on element by text "Prenesi"
    And Wait element "Pay" by text
    And Assert element by text "PRENESI Activation"
    And Assert element by text "Activate / Update"
    And Click on element by text "Pay"
    And Wait for element by id "nlb-prenesi-phone-number" to appear
    And Assert screen header is "Prenesi"
    And Assert back button in screen "Prenesi"
    And Assert element by text "Select recipient or input phone number"
    And Assert element by content desc "Select contact"
    And Assert element by text "Set amount"
    And Assert element "nlb-prenesi-amount" by id
    And Assert element by id "nlb-prenesi-amount" has following sibling with text "RSD"
    And Assert element by id "nlb-button-text" that has descendant text "Cancel"
    And Assert element by id "nlb-button-primary" that has descendant text "Continue"

    And Enter text "0638097993" in element id "nlb-prenesi-phone-number" and remember it under key "keyPhoneNumber"
    And Enter text "3" in element id "nlb-prenesi-amount" and remember it under key "keyAmount"
    And Click on element by id "nlb-button-primary"
    And Wait element "Recipient details" by text

    And Assert screen header is "Transaction overview"
    And Assert element by text "Recipient details"
    And Assert element by text "Recipient" has first following sibling contains text "ZDENKA PANTELIĆ"
    And Assert element by text "Phone number" has first following sibling from key "keyPhoneNumber"
    And Assert element by text "Fee" has first following sibling contains text "0,00 RSD"
    And Assert element by text "Set amount"
    And Assert element by text "Amount"
    And Assert element by id "nlb-prenesi-validate-amount" has text that contains value from key "keyAmount"
    And Assert element by id "nlb-prenesi-validate-amount" has following sibling with text "RSD"
    And Assert element by id "nlb-button-text" that has descendant text "Cancel"
    And Assert element by id "nlb-button-primary" that has descendant text "Continue"
    And Click on element by id "nlb-button-primary"
    And Wait element "Details" by text

    And Assert screen header is "Transaction overview"
    And Assert element by text "Details"
    And Assert element by text "Recipient" has first following sibling contains text "ZDENKA PANTELIĆ"
    And Assert element by text "Phone number" has first following sibling from key "keyPhoneNumber"
    And Assert element by text "Fee" has first following sibling contains text "0,00 RSD"
    And Assert element by text "Amount" has first following sibling that contains value from key "keyAmount"
    And Assert element by id "nlb-button-text" that has descendant text "Cancel"
    And Assert element by id "nlb-button-primary" that has descendant text "Confirm"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Enter PIN"
    And Enter PIN
    And Wait for element by text "Confirmation"

    And Assert element by text "Payment"
    And Assert element by text "Recipient:" has first following sibling contains text "ZDENKA PANTELIĆ"
    And Assert element by text "Phone number:" has first following sibling from key "keyPhoneNumber"
    And Assert element by text "Fee:" has first following sibling contains text "0,00 RSD"
    And Assert element by text "Amount:" has first following sibling that contains value from key "keyAmount"
    And Assert element by id "nlb-button-alternate" that has descendant text "Reject"
    And Assert element by id "nlb-button-primary" that has descendant text "Confirm"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Close"
    
    And Assert screen header is "Confirmation successful"
    And Assert element "transactions-web-close-popup-icon" by id
    And Assert element by id "transactions-web-close-popup-nlb-button" that has descendant text "Close"
    And Click on element by id "transactions-web-close-popup-nlb-button"
    And Wait element "Domestic payment" by text
    And Click on element by text "Past payments"
    And Wait for first Past payment
    And Wait "2" seconds
    And Assert first Past payment has title "PRENESI"
    And Assert first Past payment has creditor name "ZDENKA PANTELIĆ"
    And Assert first Past payment has value under key "keyAmount"
    And Click on first Past payment
    And Wait element "Payment confirmation" by text
    
    And Assert element by text "Recipient name" has first following sibling contains text "ZDENKA PANTELIĆ"
    And Assert element by text "Recipient account" has first following sibling with regex "^\d{3}-\d{13}-\d{2}$"
    And Assert element by text "Urgent payment" has first following sibling contains text "Yes"
    And Assert element by text "Purpose code" has first following sibling contains text "289"
    And Assert element by text "Purpose" has first following sibling contains text "PRENESI"
    And Swipe vertical
    And Assert element by text "Debtor name" has first following sibling from excel "<rowindex>" columnName "account_details_owner"
    And Assert element by text "Debtor account" has first following sibling from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Assert element by text "Fee" has first following sibling contains text "0,00 RSD"
    And Assert element by text "Payment status" has first following sibling contains text "Executed"
    And Click "Back" content description
    And Wait for first Past payment
    And Wait "2" seconds
    And Click "Back" content description
    And Wait element "Domestic payment" by text
    And Click on element by text "My Products"
    And Wait for first product in My products page

    Then Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Check if current balance is lowered by "3" using balance from key "IT_001_Creditor_Balance" for currency "RSD"
    And Assert first transaction has purpose "PRENESI"
    And Assert first transaction has Creditor name "ZDENKA PANTELIĆ"
    And Assert first transaction have Amount under key "keyAmount"
    And Click on first transaction in product details

    And Assert element by id "nlb-date" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by id "nlb-title" has text "PRENESI"
    And Assert element by id "nlb-details" has text "ZDENKA PANTELIĆ"
    And Assert element by text "Name and address" has first following sibling contains text "ZDENKA PANTELIĆ"
    And Assert element by text "Account number" has first following sibling with regex "^\d{3}-\d{13}-\d{2}$"
    And Assert element by text "Purpose" has first following sibling contains text "PRENESI"
    And Assert element by text "Settlement date" has first following sibling with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by text "Value date" has first following sibling with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by text "Amount" has first following sibling that contains value from key "keyAmount"
    And Assert element by text "Transaction ID" has first following sibling with regex "^.{14}$"

    Examples:
      | rowindex |
      |        5 |