Feature: Upcoming_Payments

  @Payments_Upcoming_Payments_List_Of_Transactions_[MOB_ANDROID]
  Scenario Outline: Payments_Upcoming_Payments_List_Of_Transactions_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click on Bottom navigation button "Pay"
    And Wait for element by text "Upcoming payments"
    And Click on element by text "Upcoming payments"
    And Wait for element by id "nlb-date" to appear
    #And Assert current month on page
    And Assert current month is on top in upcoming payments
    And Remember transaction header sum for upcoming payments under key "upcoming_sum"
    And Assert list of element by id element by id "nlb-date" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert list of element by id element by id "nlb-currency" with regex "^[A-Z]{3}$"
    And Assert list of element by id element by id "nlb-amount" with regex "^[\-−]?(?:0|[1-9]\d{0,2}(?:\.\d{3})*),\d{2}$"
    And Assert list of element by id element by id "nlb-title" with regex "^.*$"
    And Assert list of element by id element by id "nlb-details" with regex "^.*$"
#    And Click on Account selector in Payment list
#    And Wait for element by text from excel "<rowindex>" columnName "auth_personal_account_number"
#    And Click on element by text from excel "<rowindex>" columnName "auth_personal_account_number"
#    And Wait for element by id "nlb-date" to appear
#    And Assert transaction header sum for upcoming payments is different from one under key "upcoming_sum"
#
#    Then Assert list of element by id element by id "nlb-date" with regex "^\d{2}\.\d{2}\.\d{4}$"
#    And Assert list of element by id element by id "nlb-currency" with regex "^[A-Z]{3}$"
#    And Assert list of element by id element by id "nlb-amount" with regex "^[\-−]?(?:0|[1-9]\d{0,2}(?:\.\d{3})*),\d{2}$"
#    And Assert list of element by id element by id "nlb-title" with regex "^.*$"
#    And Assert list of element by id element by id "nlb-details" with regex "^.*$"

    Examples:
      | rowindex |
      |        5 |


  @Payments_Upcoming_Payments_Cancel_Payment_[MOB_ANDROID]
  Scenario Outline: Payments_Upcoming_Payments_Cancel_Payment_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click on element by text "Pay"
    And Wait for element by text "Domestic payment" to appear for "30" seconds
    And Click on element by text "Domestic payment"
    And Wait for element by id "nlb-input-creditor-account" to appear
    And Enter text "205900100779094488" in element id "nlb-input-creditor-account" and remember it under key "keyAccountNumber"
    And Send random text to field with id "nlb-input-creditor-name" and remember it under key "keyName"
    And Enter text "Ulica Upcoming payments" in element id "nlb-input-creditor-address" and remember it under key "keyAddress"
    And Enter text "Grad Upcoming payments" in element id "nlb-input-creditor-city" and remember it under key "keyCity"
    And Assert element by id "nlb-checkbox-save-recipient" is checked "false"
    And Swipe vertical
    And Enter text "1" in element id "nlb-amount-with-currency-field" and remember it under key "keyAmount"
    And Swipe vertical
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "keyPurpose" in txt file
    And Click on element by desc "Set date"
    And Click on date in Calendar 5 days in future and assert that it is shown correctly
    And Click on button Confirm in Calendar
    And Assert element by id "nlb-checkbox-urgent-payment" is checked "false"
    And Scroll down until element with text "Confirm" is in view
    And Click on element by id "nlb-button-primary"
    
    And Wait for element by text "Payment amount"
    And Assert element by text "Payment amount" has first following sibling contains text "1.00 RSD"
    And Assert element by text "Fee" has first following sibling contains text "0.00 RSD"

    And Assert element by text "Recipient"
    And Assert element by text "Name" has first following sibling from key "keyName"
    #OVDE URADI PROVERU ZA ULICU I BROJ RECIPIENTA KADA DODJE KONACNA VERZIJA KAKO TREBA DA IZGLEDA
    And Assert element by text "Account number" has first following sibling from key "keyAccountNumber"

    And Assert element by text "Debtor"
    And Assert that text "Debtor name" has first following sibling from excel "<rowindex>" columnName "account_details_owner"
    #OVDE URADI PROVERU ZA ULICU I BROJ DEBTORA KADA DODJE KONACNA VERZIJA KAKO TREBA DA IZGLEDA
    And Assert that text "Debtor account" has first following sibling from excel "<rowindex>" columnName "bad_current_domestic_account_number"

    And Assert element by text "Payment details"
    And Assert that text "Value date" has first following sibling with future date "5" in format "dd.MM.yyyy"
    And Assert element by text "Purpose code" has first following sibling contains text "289"
    And Assert element by text "Purpose" has first following sibling from key "keyPurpose"
    And Swipe vertical
    And Assert element by id "nlb-button-text" that has descendant text "Cancel"
    And Assert element by id "nlb-button-primary" that has descendant text "Confirm"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Enter PIN"
    And Enter PIN
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "transactions-web-close-popup-icon" to appear
    And Click on element by id "transactions-web-close-popup-nlb-button"
    And Wait for element by text "Upcoming payments"

    And Click on element by text "Upcoming payments"
    And Scroll until element with text under key "keyPurpose" is in view and click
    And Wait for element by id "nlb-card-container" to appear
    And Wait "1" seconds
    And Assert element by content desc "Pending"
    And Assert element by id "nlb-title" has value under key "keyPurpose"
    And Assert element by id "nlb-details" has value under key "keyName"
    And Assert element by id "nlb-date" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by id "nlb-currency" has text "RSD"
    And Assert element by id "nlb-amount" has text "1,00"
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
    And Swipe vertical up
    
    Then Click on element by id "nlb-button-text"
    And Assert element by text "Do you wish to cancel?"
    And Assert element by contains text "Are you really sure to cancel payment"
    And Assert element by text "No"
    And Assert element by text "Yes"
    And Click on element by text "No"
    And Assert element by id "nlb-button-text" that has descendant text "Cancel payment"
    And Click on element by id "nlb-button-text"
    And Click on element by text "Yes"
    And Assert element by text "Success"
    And Assert element by text from key "keyPurpose" is not displayed
    And Assert element by text from key "keyName" is not displayed

    Examples:
      | rowindex |
      |        5 |


  @Payments_Upcoming_Payments_Details_Of_Payments_Transaction_On_The_List_Of_Transaction_[MOB_ANDROID]
  Scenario Outline: Payments_Upcoming_Payments_Details_Of_Payments_Transaction_On_The_List_Of_Transaction_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click on Bottom navigation button "Pay"
    And Wait for Past payments button in Pay screen
    And Click on element by text "Upcoming payments"
    And Wait for element by id "nlb-date" to appear
    And Click on Account selector in Payment list
    And Wait "1" seconds
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Wait for element by id "nlb-date" to appear
    And Swipe until element with text "TRANSACTIONS BY ORDER OF CITIZENS" is displayed
    And Click on element by text "TRANSACTIONS BY ORDER OF CITIZENS"
    And Wait for element by text "Cancel payment"
    And Assert element by content desc "Pending"
    And Assert list of element by id "nlb-title" is displayed
    And Assert list of element by id "nlb-details" is displayed
    And Assert element by id "nlb-date" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by id "nlb-currency" has text "RSD"
    And Assert element by id "nlb-amount" with regex "^(?:0|[1-9]\d{0,2}(?:\.\d{3})*),\d{2}$"
    And Assert element by id "nlb-button-text" that has descendant text "Cancel payment"
    And Assert element by text "Recipient name" has first following sibling with regex "^.+$"
    And Assert element by text "Recipient address" has first following sibling with regex "(?s)^.+$"
    And Assert element by text "Recipient account number" has first following sibling with regex "^\d{3}-\d{13}-\d{2}$"
#    And Assert element by text "Urgent payment" is not displayed
    And Assert element by text "Purpose code" has first following sibling with regex "^\d{3}$"
    And Assert element by text "Purpose" has first following sibling with regex "^.+$"
    And Swipe vertical
    And Assert that text "Debtor name" has first following sibling from excel "<rowindex>" columnName "account_details_owner"
    And Assert that text "Debtor account number" has first following sibling from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Assert element by text "Debtor Address" has first following sibling with regex "(?s)^.+$"
    And Click "Back" content description
    And Wait for element by id "nlb-date" to appear

    And Click on Account selector in Payment list
    And Wait "1" seconds
    And Scroll until element with text from Excel "<rowindex>" columnName "auth_personal_account_number" is in the view
    And Click on element by text from excel "<rowindex>" columnName "auth_personal_account_number"
    And Wait for element by id "nlb-date" to appear
    And Swipe until element with text "TRANSACTIONS BY ORDER OF CITIZENS" is displayed
    And Click on element by text "TRANSACTIONS BY ORDER OF CITIZENS"
    And Wait for element by text "Cancel payment"
    And Assert element by content desc "Pending"
    And Assert list of element by id "nlb-title" is displayed
    And Assert list of element by id "nlb-details" is displayed
    And Assert element by id "nlb-date" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by id "nlb-currency" has text "RSD"
    And Assert element by id "nlb-amount" with regex "^(?:0|[1-9]\d{0,2}(?:\.\d{3})*),\d{2}$"
    And Assert element by id "nlb-button-text" that has descendant text "Cancel payment"
    And Assert element by text "Recipient name" has first following sibling with regex "^.+$"
    And Assert element by text "Recipient address" has first following sibling with regex "(?s)^.+$"
    And Assert element by text "Recipient account number" has first following sibling with regex "^\d{3}-\d{13}-\d{2}$"
#    And Assert element by text "Urgent payment" is not displayed
    And Assert element by text "Purpose code" has first following sibling with regex "^\d{3}$"
    And Assert element by text "Purpose" has first following sibling with regex "^.+$"
    And Swipe vertical
#    And Assert that text "Debtor name" has first following sibling from excel "<rowindex>" columnName "auth_personal_account_owner_name"
    And Assert that text "Debtor account number" has first following sibling from excel "<rowindex>" columnName "auth_personal_account_number"
    And Assert element by text "Debtor Address" has first following sibling with regex "(?s)^.+$"
    And Click "Back" content description
    And Wait for element by id "nlb-date" to appear

    And Click on Account selector in Payment list
    And Wait "1" seconds
    And Scroll until element with text from Excel "<rowindex>" columnName "personal_account_iban" is in the view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait element "No upcoming payments." by text
    And Assert element by text "No upcoming payments."
#    And Wait for element by id "nlb-date" to appear
#    And Click on first Past payment
#    And Wait for element by text "Cancel payment"
#    And Assert element by content desc "Pending"
#    And Assert list of element by id "nlb-title" is displayed
#    And Assert list of element by id "nlb-details" is displayed
#    And Assert element by id "nlb-date" with regex "^\d{2}\.\d{2}\.\d{4}$"
#    And Assert element by id "nlb-currency" has text "RSD"
#    And Assert element by id "nlb-amount" with regex "^(?:0|[1-9]\d{0,2}(?:\.\d{3})*),\d{2}$"
#    And Assert element by id "nlb-button-text" that has descendant text "Cancel payment"
#    And Assert element by text "Recipient name" has first following sibling with regex "^.+$"
#    And Assert element by text "Recipient address" has first following sibling with regex "(?s)^.+$"
#    And Assert element by text "Recipient account number" has first following sibling with regex "^\d{3}-\d{13}-\d{2}$"
##    And Assert element by text "Urgent payment" is not displayed
#    And Assert element by text "Purpose code" has first following sibling with regex "^\d{3}$"
#    And Assert element by text "Purpose" has first following sibling with regex "^.+$"
#    And Swipe vertical
##    And Assert that text "Debtor name" has first following sibling from excel "<rowindex>" columnName "auth_personal_account_owner_name"
#    And Assert that text "Debtor account number" has first following sibling from excel "<rowindex>" columnName "auth_personal_account_number"
#    And Assert element by text "Debtor Address" has first following sibling with regex "(?s)^.+$"
#    And Click "Back" content description
#    And Wait for element by id "nlb-date" to appear

    Then Click on Account selector in Payment list
    And Wait "1" seconds
    And Scroll until element with text from Excel "<rowindex>" columnName "saving_account_number" is in the view
    And Click on element by text from excel "<rowindex>" columnName "saving_account_number"
    And Wait element "No upcoming payments." by text
    And Assert element by text "No upcoming payments."
#    And Wait for element by id "nlb-date" to appear
#    And Click on first Past payment
#    And Wait for element by text "Cancel payment"
#    And Assert element by content desc "Pending"
#    And Assert list of element by id "nlb-title" is displayed
#    And Assert list of element by id "nlb-details" is displayed
#    And Assert element by id "nlb-date" with regex "^\d{2}\.\d{2}\.\d{4}$"
#    And Assert element by id "nlb-currency" has text "RSD"
#    And Assert element by id "nlb-amount" with regex "^(?:0|[1-9]\d{0,2}(?:\.\d{3})*),\d{2}$"
#    And Assert element by id "nlb-button-text" that has descendant text "Cancel payment"
#    And Assert element by text "Recipient name" has first following sibling with regex "^.+$"
#    And Assert element by text "Recipient address" has first following sibling with regex "(?s)^.+$"
#    And Assert element by text "Recipient account" has first following sibling with regex "^\d{3}-\d{13}-\d{2}$"
##    And Assert element by text "Urgent payment" is not displayed
#    And Assert element by text "Purpose code" has first following sibling with regex "^\d{3}$"
#    And Assert element by text "Purpose" has first following sibling with regex "^.+$"
#    And Swipe vertical
#    And Assert that text "Debtor name" has first following sibling from excel "<rowindex>" columnName "account_details_owner"
#    And Assert that text "Debtor account" has first following sibling from excel "<rowindex>" columnName "saving_account_number"
#    And Assert element by text "Debtor address" has first following sibling with regex "(?s)^.+$"
#    And Click "Back" content description
#    And Wait for element by id "nlb-date" to appear

    Examples:
      | rowindex |
      |        5 |