Feature: Upcoming_Payments

  @Payments_Upcoming_Payments_List_Of_Transactions_[MOB_ANDROID]
  Scenario Outline: Payments_Upcoming_Payments_List_Of_Transactions_[MOB_ANDROID]
    #C71575

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Upcoming payments"
    And Click on element by text "Upcoming payments"
    And Wait for element by id "nlb-date" to appear
    And Assert current month on page
    And Remember transaction header sum for upcoming payments under key "upcoming_sum"
    And Assert element by text "Payments waiting to be processed in next six months."
    And Assert element "nlb-date" by id
    And Assert element "nlb-currency" by id
    And Assert element "nlb-title" by id
    And Assert element "nlb-amount" by id
    And Assert element "nlb-details" by id
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by text from excel "<rowindex>" columnName "auth_personal_account_iban"
    And Click on element by text from excel "<rowindex>" columnName "auth_personal_account_iban"
    And Wait for element by id "nlb-date" to appear
    And Assert transaction header sum for upcoming payments is different from one under key "upcoming_sum"

    Examples:
      | rowindex |
      |        4 |


  @Payments_Upcoming_Payments_Cancel_Payment_[MOB_ANDROID]
  Scenario Outline: Payments_Upcoming_Payments_Cancel_Payment_[MOB_ANDROID]
    #C71583

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "retail_recipient_iban" in element id "nlb-input-account-number"
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by id "nlb-input-recipient-name" to appear
    And Enter text from excel "<rowindex>" columnName "retail_recipient_name" in element id "nlb-input-recipient-name"
    And Enter text "TEST" in element id "nlb-input-recipient-address"
    And Enter text "TEST" in element id "nlb-input-recipient-city"
    And Swipe vertical
    And Swipe vertical
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Assert text "OTHR - Other" in element id "nlb-input-purpose-code"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "SP_008" in txt file
    And Assert element by text "NRC - No reference"
    And Click on date "7" days in the future in calendar
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 EUR"
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert element by text "Debtor"
    #And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_review"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_name"
    And Assert that second text "Address" has first following sibling that contains text "TEST"
    And Assert that second text "Address" has first following sibling that contains text "SLOVENIA"
    And Swipe vertical
    And Swipe vertical
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Assert element by text "Payment"
    And Assert that text "Reference" has first following sibling with text "NRC"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "SP_008"
    And Assert that text "Purpose code" has first following sibling with text "OTHR"
    And Assert that text "Payment date" has first following sibling with future date "7" in format "d.M.yyyy"
    And Scroll down until element with id "nlb-button-primary" is in view
    And Click on element by id "nlb-button-primary"
    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"
    And Wait for element by text "Upcoming payments"
    And Click on element by text "Upcoming payments"
    And Wait for element by id "nlb-title" to appear
    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Scroll until element with text from txt file under key "SP_008" is in view and click
    And Wait for element by text "Recipient"


    Then Assert element by text "Payment details"
    And Assert element by id "nlb-date" has date "7" day in the future in format "d.M.yyyy"
    And Assert text under key "SP_008" from txt file in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "retail_recipient_name" in element by id "nlb-details"
    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_name_and_address_past_payment"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Assert that text "Reference" has first following sibling with text "NRC"
    And Assert that text "Purpose code" has first following sibling with text "OTHR"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_details"
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Scroll down until element with text "Pending" is in view
    #And Assert that text "Debtor address" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_payment_address"
    And Assert that text "Payment status" has first following sibling with text "Pending"
    And Scroll until element with text "Cancel payment" is in view
    And Click on element by text "Cancel payment"
    And Wait for element by text "Do you wish to cancel?"
    And Click on element by text "Yes"
    And Assert element by text "Success"
    And Assert payment under key "SP_008" is not displayed in upcoming payments
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Past payments"
    And Click on element by text "Past payments"
    And Wait for element by id "nlb-title" to appear
    And Scroll until element with text from txt file under key "SP_008" is in view and click
    And Wait for element by text "Recipient"
    And Assert element by text "Payment details"
    And Assert element by id "nlb-date" has date "7" day in the future in format "d.M.yyyy"
    And Assert text under key "SP_008" from txt file in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "retail_recipient_name" in element by id "nlb-details"
    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_name_and_address_past_payment"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Assert that text "Reference" has first following sibling with text "NRC"
    And Assert that text "Purpose code" has first following sibling with text "OTHR"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_details"
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Swipe vertical short
    #And Assert that text "Debtor address" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_payment_address"+
    And Scroll down until element with text "Canceled" is in view
    And Assert that text "Payment status" has first following sibling with text "Canceled"




    Examples:
      | rowindex |
      |        4 |