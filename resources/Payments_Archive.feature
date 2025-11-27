Feature: Payments_Archive


  @PAYMENTS-PAYMENTS_ARCHIVE-FILTER_PAYMENTS_TRANSACTION_BY_DATE_[ANDROID]
  Scenario Outline: PAYMENTS-PAYMENTS_ARCHIVE-FILTER_PAYMENTS_TRANSACTION_BY_DATE_[ANDROID]
  C71482

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "Pay"
    And Wait for Past payments button in Pay screen
    And Click on Review and edit button "Past payments" in Pay screen
    And Wait for first Past payment
    And Assert tab "Payments" is selected in Past payments between Payments and SEPA DD

    When Click on payment filter
    And Wait element "Status" by text
    And Assert screen header is "Past payment filter"
    And Assert back button in screen "Past payment filter"
    And Assert Past payment filter options are displayed correctly
    And Assert "Apply" button is not enabled
    And Click on element by text "Date"

    And Wait for element by id "nlb-radio-button-LAST_7_DAYS" to appear
    And Assert screen header is "Date"
    And Assert back button in screen "Date"
    And Assert element "nlb-radio-button-LAST_7_DAYS" by id
    And Assert element "nlb-radio-button-THIS_MONTH" by id
    And Assert element "nlb-radio-button-LAST_MONTH" by id
    And Assert element "nlb-radio-button-CUSTOM_DATE_RANGE" by id
    And Assert element "nlb-input-date-from-click-area" by id
    And Assert element "nlb-input-date-to-click-area" by id
    And Assert From label in Date transactions filter
    And Assert To label in Date transactions filter
    And Assert From field is correctly displayed in Date transactions filter
    And Assert To field is correctly displayed in Date transactions filter
    And Assert Type transaction filter that is currently selected is one with id "nlb-radio-button-LAST_7_DAYS"
    And Assert "Apply" button primary is enabled

    #7 days
    And Click on element by id "nlb-button-primary"
    And Wait first Transaction filter

    And Assert subtitle of Transaction filter Date is correct for Last seven days
    And Assert "Apply" button primary is enabled
    And Assert "Clear filters" button alternate is enabled
    And Click on element by id "nlb-button-primary"

    And Wait for first Past payment
    #BUG, vraca 8 dana umesto 7
    #Then Assert transactions dates are from last seven days

    #last month
    When Click on payment filter
    And Wait element "Status" by text
    And Assert subtitle of Transaction filter Date is correct for Last seven days
    And Click on element by text "Date"
    And Wait for element by id "nlb-radio-button-LAST_7_DAYS" to appear
    And Assert Type transaction filter that is currently selected is one with id "nlb-radio-button-LAST_7_DAYS"
    And Click on element by id "nlb-radio-button-LAST_MONTH"
    And Assert Type transaction filter that is currently selected is one with id "nlb-radio-button-LAST_MONTH"
    And Assert "Apply" button primary is enabled
    And Click on element by id "nlb-button-primary"
    And Wait first Transaction filter
    And Assert subtitle of Transaction filter date is correct for Last month
    And Assert "Apply" button primary is enabled
    And Assert "Clear filters" button alternate is enabled
    And Click on element by id "nlb-button-primary"

    And Wait for first Past payment
    Then Assert transactions dates are from Last month

    #this month

    When Click on payment filter
    And Wait element "Status" by text
    And Assert subtitle of Transaction filter date is correct for Last month
    And Click on element by text "Date"
    And Wait for element by id "nlb-radio-button-LAST_MONTH" to appear
    And Assert Type transaction filter that is currently selected is one with id "nlb-radio-button-LAST_MONTH"
    And Click on element by id "nlb-radio-button-THIS_MONTH"
    And Assert Type transaction filter that is currently selected is one with id "nlb-radio-button-THIS_MONTH"
    And Assert "Apply" button primary is enabled
    And Click on element by id "nlb-button-primary"
    And Wait first Transaction filter
    And Assert subtitle of Transaction filter Date is correct for This month
    And Assert "Apply" button primary is enabled
    And Assert "Clear filters" button alternate is enabled
    And Click on element by id "nlb-button-primary"
    And Wait "5" seconds
    #Trenutno nema transakcija
    #And Wait for first Past payment
    #Then Assert transactions dates are from This month

    #custom range
    When Click on payment filter
    And Wait element "Status" by text
    And Assert subtitle of Transaction filter Date is correct for This month
    And Assert "Clear filters" button alternate is enabled
    And Click on "Clear filters" button alternate
    And Assert Past payment filter options are displayed correctly
    And Click on element by text "Date"
    And Wait for element by id "nlb-radio-button-LAST_7_DAYS" to appear
    And Assert From field in Date transactions filter has today date
    And Assert To field in Date transactions filter has today date

    #from
    And Click on element by id "nlb-input-date-from-click-area"
    And Click on date in Calendar with year 2024 month 7 day 1 and assert that it is shown correctly
    And Assert button Cancel in Calendar is enabled
    And Assert button Confirm in Calendar is enabled
    And Click on button Confirm in Calendar
    And Assert From field in Date transactions filter has date year 2024 month 7 day 1

    #to
    And Click on element by id "nlb-input-date-to-click-area"
    And Click on date in Calendar with year 2024 month 7 day 10 and assert that it is shown correctly
    And Assert button Cancel in Calendar is enabled
    And Assert button Confirm in Calendar is enabled
    And Click on button Confirm in Calendar
    And Assert To field in Date transactions filter has date year 2024 month 7 day 10
    And Assert "Apply" button primary is enabled
    And Click on element by id "nlb-button-primary"
    And Wait first Transaction filter
    And Assert subtitle of Transaction filter Date is correct for dates year 2024 month 7 day 1 and year 2024 month 7 day 10
    And Assert "Apply" button primary is enabled
    And Assert "Clear filters" button alternate is enabled
    And Click on element by id "nlb-button-primary"
    And Wait for first Past payment

    Then Assert transactions dates are between dates year 2024 month 7 day 1 and year 2024 month 7 day 10


    Examples:
      | rowindex |
      | 1        |


  @PAYMENTS-PAYMENTS_ARCHIVE-FILTER_PAYMENTS_TRANSACTION_BY_DATE-invalid_[ANDROID]
  Scenario Outline: PAYMENTS-PAYMENTS_ARCHIVE-FILTER_PAYMENTS_TRANSACTION_BY_DATE-invalid_[ANDROID]
  C71484

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "Pay"
    And Wait for Past payments button in Pay screen
    And Click on Review and edit button "Past payments" in Pay screen
    And Wait for first Past payment
    And Assert tab "Payments" is selected in Past payments between Payments and SEPA DD
    And Click on payment filter
    And Wait element "Status" by text
    And Assert screen header is "Past payment filter"
    And Assert back button in screen "Past payment filter"
    And Assert Past payment filter options are displayed correctly
    And Assert "Apply" button is not enabled
    And Click on element by text "Date"

    And Wait for element by id "nlb-radio-button-LAST_7_DAYS" to appear
    And Assert screen header is "Date"
    And Assert back button in screen "Date"
    And Assert element "nlb-radio-button-LAST_7_DAYS" by id
    And Assert element "nlb-radio-button-THIS_MONTH" by id
    And Assert element "nlb-radio-button-LAST_MONTH" by id
    And Assert element "nlb-radio-button-CUSTOM_DATE_RANGE" by id
    And Assert element "nlb-input-date-from-click-area" by id
    And Assert element "nlb-input-date-to-click-area" by id
    And Assert From label in Date transactions filter
    And Assert To label in Date transactions filter
    And Assert From field is correctly displayed in Date transactions filter
    And Assert To field is correctly displayed in Date transactions filter
    And Assert Type transaction filter that is currently selected is one with id "nlb-radio-button-LAST_7_DAYS"
    And Assert "Apply" button primary is enabled
    And Assert From field in Date transactions filter has today date
    And Assert To field in Date transactions filter has today date

    #set To one month before, 5th
    When Click on element by id "nlb-input-date-to-click-area"
    And Click on date last month fifth and assert that it is shown correctly
    And Assert button Cancel in Calendar is enabled
    And Assert button Confirm in Calendar is enabled
    And Click on button Confirm in Calendar
    And Assert To field in Date transactions filter has date last month fifth
    And Assert "Apply" button primary is disabled

    #try to set From to one month before, 10th
    And Click on element by id "nlb-input-date-from-click-area"

    Then Click on date last month tenth and assert that it is not shown correctly
    And Assert button Cancel in Calendar is enabled
    And Assert button Confirm in Calendar is enabled
    And Click on button Confirm in Calendar
    And Assert From field in Date transactions filter has today date
    And Assert To field in Date transactions filter has date last month fifth
    #BUG, ne radi trenutno
    And Assert "Apply" button primary is disabled


    Examples:
      | rowindex |
      | 3        |

  @Payments_Payments_Archive_Payments_Transaction_List_[ANDROID]
  Scenario Outline: Payments_Payments_Archive_Payments_Transaction_List_[ANDROID]
    #C71479

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "Pay"
    And Wait for Past payments button in Pay screen
    And Click on Review and edit button "Past payments" in Pay screen
    And Wait for first Past payment

    Then Assert tab "Payments" is selected in Past payments between Payments and SEPA DD
    And Assert list of element by id "nlb-date" is displayed
    And Assert list of element by id "nlb-currency" is displayed
    And Assert list of element by id "nlb-title" is displayed
    And Assert list of element by id "nlb-amount" is displayed
    And Assert list of element by id "nlb-details" is displayed



    Examples:
      | rowindex |
      | 3        |


  @Payments_Payments_Archive_Repeat_Executed_Internal_Payment_From_Current_Account_[Android]
  Scenario Outline: Payments_Payments_Archive_Repeat_Executed_Internal_Payment_From_Current_Account_[Android]
    #C71495

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Click on element by id "nlb-button-alternate"
    And Wait for element with "Current account" content description from view tag "View"
    And Remove keyboard
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by text "Set amount and currency" to appear for "30" seconds
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Click on element by text "Next"
    And Wait for element by id "nlb-input-purpose" to appear

    And Assert element by contains text "Own account Transfer"
    And Assert element by contains text "Check data and choose"
    And Assert element by contains text "Debtor"
    And Assert Debtor in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "personal_account_name" and iban "personal_account_iban"
    And Assert Recipient in Own Account Transfer has content description "Savings Account" and from Excel "<rowindex>" account name "savings_account_name" and iban "savings_account_iban"
    And Assert element by text "Payment"
    And Assert element by contains text "In order to continue all input fields must be filled."
    And Assert element by text "Payment amount"
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Click on element by text "EUR"
    And Assert element by text "USD" is not displayed
    And Assert element by text "Purpose"
    And Assert text "INTERNAL TRANSFER" in element id "nlb-input-purpose"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "int_04" in txt file
    And Assert element by text "Payment date"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 EUR"
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert element by text "Debtor"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_review"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "savings_user_name_for_payment_review"
    And Assert that second text "Address" has first following sibling with text from Excel "<rowindex>" columnName "savings_user_address_for_payment_review"
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "savings_account_iban"
    And Swipe vertical
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI2X"
    And Assert element by text "Payment"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "int_04"
    And Assert that text "Payment date" has first following sibling with current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"

    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"

    And Click on element by text "Past payments"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    And Scroll until element with text from txt file under key "int_04" is in view and click
    And Wait for element by text "Recipient"
    And Assert element by text "Payment details"
    And Assert element "nlb-date" by id has current date in format "d.M.yyyy"
    And Assert text under key "int_04" from txt file in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "savings_user_name_for_past_payment" in element by id "nlb-details"

    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "savings_username_and_address_for_past_payments"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "savings_account_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI2X"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_details"
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Swipe vertical short
    And Swipe vertical short
    And Scroll down until element with text "Executed" is in view
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert that text "Payment status" has first following sibling with text "Executed"
    #Pocetak repeat koraka
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-input-purpose" to appear
    And Assert element by contains text "Own account Transfer"
    And Assert element by contains text "Check data and choose"
    And Assert element by contains text "Debtor"
    And Assert Debtor in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "personal_account_name" and iban "personal_account_iban"
    And Assert Recipient in Own Account Transfer has content description "Savings Account" and from Excel "<rowindex>" account name "savings_account_name" and iban "savings_account_iban"
    And Assert element by text "Payment"
    And Assert element by contains text "In order to continue all input fields must be filled."
    And Assert element by text "Payment amount"
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Click on element by text "EUR"
    And Assert element by text "USD" is not displayed
    And Assert element by text "Purpose"
    And Assert text under key "int_04" from txt file in element id "nlb-input-purpose"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "int_04" in txt file
    And Assert element by text "Payment date"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 EUR"
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert element by text "Debtor"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_review"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert element by text "Recipient"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "savings_user_name_for_payment_review"
    And Assert that second text "Address" has first following sibling with text from Excel "<rowindex>" columnName "savings_user_address_for_payment_review"
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "savings_account_iban"
    And Swipe vertical
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI2X"
    And Assert element by text "Payment"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "int_04"
    And Assert that text "Payment date" has first following sibling with current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"

    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"

    And Go Back
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    And Scroll until element with text from txt file under key "int_04" is in view and click
    And Wait for element by text "Recipient"
    And Assert element by text "Payment details"
    And Assert element "nlb-date" by id has current date in format "d.M.yyyy"
    And Assert text under key "int_04" from txt file in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "savings_user_name_for_past_payment" in element by id "nlb-details"

    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "savings_username_and_address_for_past_payments"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "savings_account_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI2X"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_details"
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Swipe vertical short
    And Swipe vertical short
    And Scroll down until element with text "Executed" is in view
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert that text "Payment status" has first following sibling with text "Executed"

    Examples:
      | rowindex |
      | 4        |

  @Payments_Payments_Archive_Repeat_Executed_SEPA_Payment_From_Current_Account_[Android]
  Scenario Outline: Payments_Payments_Archive_Repeat_Executed_SEPA_Payment_From_Current_Account_[Android]
    #C71495

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
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "SP_001" in txt file
    And Assert element by text "NRC - No reference"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Swipe vertical

    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 EUR"
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert element by text "Debtor"
    And Assert that text "First and last name / Company name" has first following sibling that contains from Excel "<rowindex>" columnName "user_name_short"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_name"
    And Assert that second text "Address" has first following sibling that contains text "TEST"
    And Assert that second text "Address" has first following sibling that contains text "SLOVENIA"
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_iban"
    And Swipe vertical
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Assert element by text "Payment"
    And Assert that text "Reference" has first following sibling with text "NRC"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "SP_001"
    And Assert that text "Purpose code" has first following sibling with text "OTHR"
    And Assert that text "Payment date" has first following sibling with current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"

    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"

    And Click on element by text "Past payments"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    And Scroll until element with text from txt file under key "SP_001" is in view and click
    And Wait for element by text "Recipient"


    Then Assert element by text "Payment details"
    And Assert element "nlb-date" by id has current date in format "d.M.yyyy"
    And Assert text under key "SP_001" from txt file in element id "nlb-title"
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
    And Scroll down until element with text "Executed" is in view
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert that text "Payment status" has first following sibling with text "Executed"
    #Pocetak repeat
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-input-purpose" to appear
    And Assert Debtor in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "personal_account_name" and iban "personal_account_iban"
    And Assert SEPA Recipient has icon "T" and from Excel "<rowindex>" account name "retail_recipient_name" and iban "retail_recipient_iban"
    And Assert element by text "Payment"
    And Assert element by contains text "In order to continue all input fields must be filled."
    And Assert element by text "Payment amount"
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Click on element by text "EUR"
    And Assert element by text "USD" is not displayed
    And Assert element by text "Purpose"
    And Swipe vertical
    And Assert text under key "SP_001" from txt file in element id "nlb-input-purpose"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "SP_001" in txt file
    And Assert element by text "Payment date"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 EUR"
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert element by text "Debtor"
    And Assert that text "First and last name / Company name" has first following sibling that contains from Excel "<rowindex>" columnName "user_name_short"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_name"
    And Assert that second text "Address" has first following sibling that contains text "TEST"
    And Assert that second text "Address" has first following sibling that contains text "SLOVENIA"
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_iban"
    And Swipe vertical
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Assert element by text "Payment"
    And Assert that text "Reference" has first following sibling with text "NRC"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "SP_001"
    And Assert that text "Purpose code" has first following sibling with text "OTHR"
    And Assert that text "Payment date" has first following sibling with current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"
    And Go Back
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"
    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"
    And Scroll until element with text from txt file under key "SP_001" is in view and click
    And Wait for element by text "Recipient"
    And Assert element by text "Payment details"
    And Assert element "nlb-date" by id has current date in format "d.M.yyyy"
    And Assert text under key "SP_001" from txt file in element id "nlb-title"
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
    And Scroll down until element with text "Executed" is in view
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert that text "Payment status" has first following sibling with text "Executed"



    Examples:
      | rowindex |
      | 4        |


  @Payments_Payments_Archive_Repeat_Executed_Foreign_Payment_From_Current_Account_[Android]
  Scenario Outline: Payments_Payments_Archive_Repeat_Executed_Foreign_Payment_From_Current_Account_[Android]
    #C71495

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer"
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "retail_recipient_iban" in element id "nlb-input-account-number"
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Click "Expand dropdown menu" content description from view tag "View"
    And Scroll down until currency "USD" in selector is found and click
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by text "Foreign payment"
    #Entering recipient info
    And Enter text "TESTNAME" in element id "nlb-input-recipient-name"
    And Enter text "TEST" in element id "nlb-input-recipient-address"
    And Enter text "TEST" in element id "nlb-input-recipient-city"
    #End of entering recipient info
    And Swipe vertical
    And Assert element by text "SWIFT (BIC) Code"
    And Assert text "LJBASI20XXX" in element id "nlb-input-bank-swift-code"
    And Swipe vertical
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "USD"
    #And Assert that info message for currency conversion in second step of payment is of correct format
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "FP_001" in txt file
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 USD"
    And Assert that text "Debited amount" has first following sibling with text "10,00 USD"
    And Assert that text "Informative fee" has first following sibling with text "6,80 EUR"
    And Assert element by text "Debtor"
    And Assert that text "First and last name / Company name" has first following sibling that contains from Excel "<rowindex>" columnName "user_name_short"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_name"
    And Assert that second text "Address" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_full_address_payment_preview"
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_iban"
    And Swipe vertical
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Assert element by text "Payment"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "FP_001"
    And Assert that text "Payee of expenditure" has first following sibling with text "SHA"
    And Assert that text "Payment date" has first following sibling with current date in format "d.M.yyyy"
    And Assert that text "Urgent payment" has first following sibling with text "No"
    And Click on element by id "nlb-button-primary"
    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"
    And Click on element by text "Past payments"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"
    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"
    And Scroll until element with text from txt file under key "FP_001" is in view and click
    And Wait for element by text "Recipient"

    Then Assert element by text "Payment details"
    And Assert element "nlb-date" by id has current date in format "d.M.yyyy"
    And Assert text under key "FP_001" from txt file in element id "nlb-title"
    And Assert text "USD" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "retail_recipient_name" in element by id "nlb-details"
    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_name_and_address_past_payment"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_iban"
    And Assert element by text "Creditor bank name" is not displayed
    And Assert element by text "Creditor bank address" is not displayed
    And Assert element by text "Additional creditor bank info" is not displayed
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Assert that text "Urgent payment" has first following sibling that contains text "No"
    And Scroll down until element with text "Executed" is in view
    And Assert that text "Payee of expenditure" has first following sibling that contains text "SHA"
    And Assert that text "Debit currency" has first following sibling that contains text "USD"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_details"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert that text "Informative fee" has first following sibling with text "6,80 EUR"
    And Assert that text "Payment status" has first following sibling with text "Executed"
    #Pocetak repeat
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-input-purpose" to appear
    And Assert Debtor in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "personal_account_name" and iban "personal_account_iban" with currency "USD"
    And Assert SEPA Recipient has icon "T" and from Excel "<rowindex>" account name "retail_recipient_name" and iban "retail_recipient_iban"
    And Assert element by text "Payment"
    And Assert element by contains text "In order to continue all input fields must be filled."
    And Assert element by text "Payment amount"
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "USD"
    And Assert element by text "Purpose"
    And Swipe vertical
    And Assert text under key "FP_001" from txt file in element id "nlb-input-purpose"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "FP_001" in txt file
    And Assert element by text "SHA - Costs are shared between creditor and debtor"
    And Assert element by text "Payment date"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 USD"
    And Assert that text "Debited amount" has first following sibling with text "10,00 USD"
    And Assert that text "Informative fee" has first following sibling with text "6,80 EUR"
    And Assert element by text "Debtor"
    And Assert that text "First and last name / Company name" has first following sibling that contains from Excel "<rowindex>" columnName "user_name_short"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_name"
    And Assert that second text "Address" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_full_address_payment_preview"
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_iban"
    And Swipe vertical
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Assert element by text "Payment"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "FP_001"
    And Assert that text "Payee of expenditure" has first following sibling with text "SHA"
    And Assert that text "Payment date" has first following sibling with current date in format "d.M.yyyy"
    And Assert that text "Urgent payment" has first following sibling with text "No"
    And Click on element by id "nlb-button-primary"
    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"
    And Go Back
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"
    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"
    And Scroll until element with text from txt file under key "FP_001" is in view and click
    And Wait for element by text "Recipient"

    Then Assert element by text "Payment details"
    And Assert element "nlb-date" by id has current date in format "d.M.yyyy"
    And Assert text under key "FP_001" from txt file in element id "nlb-title"
    And Assert text "USD" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "retail_recipient_name" in element by id "nlb-details"
    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_name_and_address_past_payment"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_iban"
    And Assert element by text "Creditor bank name" is not displayed
    And Assert element by text "Creditor bank address" is not displayed
    And Assert element by text "Additional creditor bank info" is not displayed
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Assert that text "Urgent payment" has first following sibling that contains text "No"
    And Scroll down until element with text "Executed" is in view
    And Assert that text "Payee of expenditure" has first following sibling that contains text "SHA"
    And Assert that text "Debit currency" has first following sibling that contains text "USD"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_details"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert that text "Informative fee" has first following sibling with text "6,80 EUR"
    And Assert that text "Payment status" has first following sibling with text "Executed"

    Examples:
      | rowindex |
      | 4        |


  @Payments_Payments_Archive_Repeat_Executed_Internal_Payment_From_Authorized_Current_Account_[Android]
  Scenario Outline: Payments_Payments_Archive_Repeat_Executed_Internal_Payment_From_Authorized_Current_Account_[Android]
    #C71495
    #TODO Postoji bug za pogresan redirect posle ponovljenog placanja. Proveriti test ponovo nakon sto poprave
    #TODO Postoji bug za pogresnog debotra nakon klika na repeat payment. Auth account postaje own

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Click on element by id "nlb-button-alternate"
    And Wait for element with "Current account" content description from view tag "View"
    And Remove keyboard
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by text "Set amount and currency" to appear for "30" seconds
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Click on element by text "Next"
    And Wait for element by id "nlb-input-purpose" to appear

    And Assert element by contains text "Own account Transfer"
    And Assert element by contains text "Check data and choose"
    And Assert element by contains text "Debtor"
    And Select account from Excel "<rowindex>" columnName "auth_personal_account_iban" as debtor in payment screen
    And Wait for element by id "nlb-input-purpose" to appear
    And Assert Debtor in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "auth_personal_account_name" and iban "auth_personal_account_iban"
    And Assert Recipient in Own Account Transfer has content description "Savings Account" and from Excel "<rowindex>" account name "savings_account_name" and iban "savings_account_iban"
    And Assert element by text "Payment"
    And Assert element by contains text "In order to continue all input fields must be filled."
    And Assert element by text "Payment amount"
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Click on element by text "EUR"
    And Assert element by text "USD" is not displayed
    And Assert element by text "Purpose"
    And Assert text "INTERNAL TRANSFER" in element id "nlb-input-purpose"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "int_04" in txt file
    And Assert element by text "Payment date"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 EUR"
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert element by text "Debtor"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "auth_user_name_for_payment_review"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "auth_user_address_for_payment_review"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "auth_personal_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "Name" has first following sibling with text from Excel "<rowindex>" columnName "savings_user_name_for_payment_review"
    And Assert that second text "Address" has first following sibling with text from Excel "<rowindex>" columnName "savings_user_address_for_payment_review"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "savings_account_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI2X"
    And Swipe vertical
    And Assert element by text "Payment"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "int_04"
    And Assert that text "Payment date" has first following sibling with current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"

    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"

    And Click on element by text "Past payments"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "auth_personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "auth_personal_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    And Scroll until element with text from txt file under key "int_04" is in view and click
    And Wait for element by text "Recipient"
    And Assert element by text "Payment details"
    And Assert element "nlb-date" by id has current date in format "d.M.yyyy"
    And Assert text under key "int_04" from txt file in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "savings_user_name_for_past_payment" in element by id "nlb-details"

    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "savings_username_and_address_for_past_payments"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "savings_account_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI2X"
    And Assert that text "Name" has first following sibling that contains from Excel "<rowindex>" columnName "auth_user_name_short"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "auth_personal_account_iban"
    And Swipe vertical short
    And Swipe vertical short
    And Scroll down until element with text "Executed" is in view
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert that text "Payment status" has first following sibling with text "Executed"
    #Pocetak repeat koraka
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-input-purpose" to appear
    And Assert element by contains text "Own account Transfer"
    And Assert element by contains text "Check data and choose"
    And Assert element by contains text "Debtor"
    And Assert Debtor in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "auth_personal_account_name" and iban "auth_personal_account_iban"
    And Assert Recipient in Own Account Transfer has content description "Savings Account" and from Excel "<rowindex>" account name "savings_account_name" and iban "savings_account_iban"
    And Assert element by text "Payment"
    And Assert element by contains text "In order to continue all input fields must be filled."
    And Assert element by text "Payment amount"
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Click on element by text "EUR"
    And Assert element by text "USD" is not displayed
    And Assert element by text "Purpose"
    And Assert text under key "int_04" from txt file in element id "nlb-input-purpose"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "int_04" in txt file
    And Assert element by text "Payment date"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 EUR"
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert element by text "Debtor"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "auth_user_name_for_payment_review"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "auth_user_address_for_payment_review"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "auth_personal_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "Name" has first following sibling with text from Excel "<rowindex>" columnName "savings_user_name_for_payment_review"
    And Assert that second text "Address" has first following sibling with text from Excel "<rowindex>" columnName "savings_user_address_for_payment_review"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "savings_account_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI2X"
    And Swipe vertical
    And Assert element by text "Payment"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "int_04"
    And Assert that text "Payment date" has first following sibling with current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"

    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"

    And Click on element by text "Past payments"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "auth_personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "auth_personal_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    And Scroll until element with text from txt file under key "int_04" is in view and click
    And Wait for element by text "Recipient"
    And Assert element by text "Payment details"
    And Assert element "nlb-date" by id has current date in format "d.M.yyyy"
    And Assert text under key "int_04" from txt file in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "savings_user_name_for_past_payment" in element by id "nlb-details"

    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "savings_username_and_address_for_past_payments"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "savings_account_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI2X"
    And Assert that text "Name" has first following sibling that contains from Excel "<rowindex>" columnName "auth_user_name_short"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Swipe vertical short
    And Swipe vertical short
    And Scroll down until element with text "Executed" is in view
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert that text "Payment status" has first following sibling with text "Executed"

    Examples:
      | rowindex |
      | 4        |


  @Payments_Payments_Archive_Repeat_Executed_SEPA_Payment_From_Authorized_Current_Account_[Android]
  Scenario Outline: Payments_Payments_Archive_Repeat_Executed_SEPA_Payment_From_Authorized_Current_Account_[Android]
    #C71495
    #TODO Postoji bug za pogresan redirect posle ponovljenog placanja. Proveriti test ponovo nakon sto poprave
    #TODO Postoji bug za pogresnog debotra nakon klika na repeat payment. Auth account postaje own

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
    And Select account from Excel "<rowindex>" columnName "auth_personal_account_iban" as debtor in payment screen
    And Enter text from excel "<rowindex>" columnName "retail_recipient_name" in element id "nlb-input-recipient-name"
    And Enter text "TEST" in element id "nlb-input-recipient-address"
    And Enter text "TEST" in element id "nlb-input-recipient-city"
    And Swipe vertical
    And Swipe vertical
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Assert text "OTHR - Other" in element id "nlb-input-purpose-code"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "SP_001" in txt file
    And Assert element by text "NRC - No reference"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Swipe vertical

    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 EUR"
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert element by text "Debtor"
    And Assert that text "Name" has first following sibling that contains from Excel "<rowindex>" columnName "auth_user_name_short"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "auth_user_address_for_payment_review"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "auth_personal_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_name"
    And Assert that second text "Address" has first following sibling that contains text "TEST"
    And Assert that second text "Address" has first following sibling that contains text "SLOVENIA"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Swipe vertical
    And Assert element by text "Payment"
    And Assert that text "Reference" has first following sibling with text "NRC"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "SP_001"
    And Assert that text "Purpose code" has first following sibling with text "OTHR"
    And Assert that text "Payment date" has first following sibling with current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"

    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"

    And Click on element by text "Past payments"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "auth_personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "auth_personal_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    And Scroll until element with text from txt file under key "SP_001" is in view and click
    And Wait for element by text "Recipient"


    Then Assert element by text "Payment details"
    And Assert element "nlb-date" by id has current date in format "d.M.yyyy"
    And Assert text under key "SP_001" from txt file in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "retail_recipient_name" in element by id "nlb-details"
    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_name_and_address_past_payment"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Assert that text "Reference" has first following sibling with text "NRC"
    And Assert that text "Purpose code" has first following sibling with text "OTHR"
    And Assert that text "Name" has first following sibling that contains from Excel "<rowindex>" columnName "auth_user_name_short"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "auth_personal_account_iban"
    And Scroll down until element with text "Executed" is in view
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert that text "Payment status" has first following sibling with text "Executed"
    #Pocetak repeat
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-input-purpose" to appear
    And Assert Debtor in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "auth_personal_account_name" and iban "auth_personal_account_iban"
    And Assert SEPA Recipient has icon "T" and from Excel "<rowindex>" account name "retail_recipient_name" and iban "retail_recipient_iban"
    And Assert element by text "Payment"
    And Assert element by contains text "In order to continue all input fields must be filled."
    And Assert element by text "Payment amount"
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Click on element by text "EUR"
    And Assert element by text "USD" is not displayed
    And Assert element by text "Purpose"
    And Swipe vertical
    And Assert text under key "SP_001" from txt file in element id "nlb-input-purpose"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "SP_001" in txt file
    And Assert element by text "Payment date"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 EUR"
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert element by text "Debtor"
    And Assert that text "Name" has first following sibling that contains from Excel "<rowindex>" columnName "auth_user_name_short"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "auth_user_address_for_payment_review"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "auth_personal_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_name"
    And Assert that second text "Address" has first following sibling that contains text "TEST"
    And Assert that second text "Address" has first following sibling that contains text "SLOVENIA"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Swipe vertical
    And Assert element by text "Payment"
    And Assert that text "Reference" has first following sibling with text "NRC"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "SP_001"
    And Assert that text "Purpose code" has first following sibling with text "OTHR"
    And Assert that text "Payment date" has first following sibling with current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"
    And Click on element by text "Past payments"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"
    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "auth_personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "auth_personal_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"
    And Scroll until element with text from txt file under key "SP_001" is in view and click
    And Wait for element by text "Recipient"
    And Assert element by text "Payment details"
    And Assert element "nlb-date" by id has current date in format "d.M.yyyy"
    And Assert text under key "SP_001" from txt file in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "retail_recipient_name" in element by id "nlb-details"
    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_name_and_address_past_payment"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Assert that text "Reference" has first following sibling with text "NRC"
    And Assert that text "Purpose code" has first following sibling with text "OTHR"
    And Assert that text "Name" has first following sibling that contains from Excel "<rowindex>" columnName "auth_user_name_short"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "auth_personal_account_iban"
    And Scroll down until element with text "Executed" is in view
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert that text "Payment status" has first following sibling with text "Executed"



    Examples:
      | rowindex |
      | 4        |

  @Payments_Payments_Archive_Repeat_Executed_Foreign_Payment_From_Authorized_Current_Account_[Android]
  Scenario Outline: Payments_Payments_Archive_Repeat_Executed_Foreign_Payment_From_Authorized_Current_Account_[Android]
    #C71495
    #TODO Postoji bug za pogresan redirect posle ponovljenog placanja. Proveriti test ponovo nakon sto poprave
    #TODO Postoji bug za pogresnog debotra nakon klika na repeat payment. Auth account postaje own

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer"
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "retail_recipient_iban" in element id "nlb-input-account-number"
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Click "Expand dropdown menu" content description from tag "ImageView"
    And Scroll down until currency "USD" in selector is found and click
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by text "Foreign payment"
    #Entering recipient info
    And Select account from Excel "<rowindex>" columnName "auth_personal_account_iban" as debtor in payment screen
    And Wait for element by id "nlb-input-recipient-name" to appear
    And Enter text "TESTNAME" in element id "nlb-input-recipient-name"
    And Enter text "TEST" in element id "nlb-input-recipient-address"
    And Enter text "TEST" in element id "nlb-input-recipient-city"
    #End of entering recipient info
    And Swipe vertical
    And Assert element by text "SWIFT (BIC) code"
    And Assert text "LJBASI20XXX" in element id "nlb-input-bank-swift-code"
    And Swipe vertical
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "USD"
    And Assert that info message for currency conversion in second step of payment is of correct format
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "FP_001" in txt file
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 USD"
    And Assert that text "Debited amount" has first following sibling with text "10,00 USD"
    And Assert that text "Informative fee" has first following sibling with text "6,80 EUR"
    And Assert element by text "Debtor"
    And Assert that text "Name" has first following sibling that contains from Excel "<rowindex>" columnName "auth_user_name_short"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "auth_user_address_for_payment_review"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "auth_personal_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_name"
    And Assert that second text "Address" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_full_address_payment_preview"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Swipe vertical
    And Assert element by text "Payment"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "FP_001"
    And Assert that text "Payee of expenditure" has first following sibling with text "SHA"
    And Assert that text "Payment date" has first following sibling with current date in format "d.M.yyyy"
    And Assert that text "Urgent payment" has first following sibling with text "No"
    And Click on element by id "nlb-button-primary"
    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"
    And Click on element by text "Past payments"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"
    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "auth_personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "auth_personal_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"
    And Scroll until element with text from txt file under key "FP_001" is in view and click
    And Wait for element by text "Recipient"

    Then Assert element by text "Payment details"
    And Assert element "nlb-date" by id has current date in format "d.M.yyyy"
    And Assert text under key "FP_001" from txt file in element id "nlb-title"
    And Assert text "USD" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "retail_recipient_name" in element by id "nlb-details"
    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_name_and_address_past_payment"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_iban"
    And Assert element by text "Creditor bank name" is not displayed
    And Assert element by text "Creditor bank address" is not displayed
    And Assert element by text "Additional creditor bank info" is not displayed
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Assert that text "Urgent payment" has first following sibling that contains text "No"
    And Scroll down until element with text "Executed" is in view
    And Assert that text "Payee of expenditure" has first following sibling that contains text "SHA"
    And Assert that text "Debit currency" has first following sibling that contains text "USD"
    And Assert that text "Name" has first following sibling that contains from Excel "<rowindex>" columnName "auth_user_name_short"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "auth_personal_account_iban"
    And Assert that text "Informative fee" has first following sibling with text "6,80 EUR"
    And Assert that text "Payment status" has first following sibling with text "Executed"
    #Pocetak repeat
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-input-purpose" to appear
    And Assert Debtor in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "auth_personal_account_name" and iban "auth_personal_account_iban"
    And Assert Debtor in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "auth_personal_account_name" and iban "auth_personal_account_iban" with currency "USD"
    And Assert SEPA Recipient has icon "T" and from Excel "<rowindex>" account name "retail_recipient_name" and iban "retail_recipient_iban"
    And Assert element by text "Payment"
    And Assert element by contains text "In order to continue all input fields must be filled."
    And Assert element by text "Payment amount"
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "USD"
    And Assert element by text "Purpose"
    And Swipe vertical
    And Assert text under key "FP_001" from txt file in element id "nlb-input-purpose"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "FP_001" in txt file
    And Assert element by text "SHA - Costs are shared between creditor and debtor"
    And Assert element by text "Payment date"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 USD"
    And Assert that text "Debited amount" has first following sibling with text "10,00 USD"
    And Assert that text "Informative fee" has first following sibling with text "6,80 EUR"
    And Assert element by text "Debtor"
    And Assert that text "Name" has first following sibling that contains from Excel "<rowindex>" columnName "auth_user_name_short"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "auth_user_address_for_payment_review"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "auth_personal_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_name"
    And Assert that second text "Address" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_full_address_payment_preview"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Swipe vertical
    And Assert element by text "Payment"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "FP_001"
    And Assert that text "Payee of expenditure" has first following sibling with text "SHA"
    And Assert that text "Payment date" has first following sibling with current date in format "d.M.yyyy"
    And Assert that text "Urgent payment" has first following sibling with text "No"
    And Click on element by id "nlb-button-primary"
    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"
    And Click on element by text "Past payments"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"
    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "auth_personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "auth_personal_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"
    And Scroll until element with text from txt file under key "FP_001" is in view and click
    And Wait for element by text "Recipient"

    Then Assert element by text "Payment details"
    And Assert element "nlb-date" by id has current date in format "d.M.yyyy"
    And Assert text under key "FP_001" from txt file in element id "nlb-title"
    And Assert text "USD" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "retail_recipient_name" in element by id "nlb-details"
    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_name_and_address_past_payment"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_iban"
    And Assert element by text "Creditor bank name" is not displayed
    And Assert element by text "Creditor bank address" is not displayed
    And Assert element by text "Additional creditor bank info" is not displayed
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Assert that text "Urgent payment" has first following sibling that contains text "No"
    And Scroll down until element with text "Executed" is in view
    And Assert that text "Payee of expenditure" has first following sibling that contains text "SHA"
    And Assert that text "Debit currency" has first following sibling that contains text "USD"
    And Assert that text "Name" has first following sibling that contains from Excel "<rowindex>" columnName "auth_user_name_short"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "auth_personal_account_iban"
    And Assert that text "Informative fee" has first following sibling with text "6,80 EUR"
    And Assert that text "Payment status" has first following sibling with text "Executed"

    Examples:
      | rowindex |
      | 4        |

  @Payments_Payments_Archive_Repeat_Executed_Internal_Payment_From_Savings_Account_[Android]
  Scenario Outline: Payments_Payments_Archive_Repeat_Executed_Internal_Payment_From_Savings_Account_[Android]
    #C71495
    #TODO Postoji bug za pogresan redirect posle ponovljenog placanja. Proveriti test ponovo nakon sto poprave

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Click on element by id "nlb-button-alternate"
    And Wait for element with "Current account" content description from view tag "View"
    And Remove keyboard
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by text "Set amount and currency" to appear for "30" seconds
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Click on element by text "Next"
    And Wait for element by id "nlb-input-purpose" to appear

    And Assert element by contains text "Own account Transfer"
    And Assert element by contains text "Check data and choose"
    And Assert element by contains text "Debtor"
    And Select account from Excel "<rowindex>" columnName "savings_account_iban" as debtor in payment screen
    And Wait for element by id "nlb-input-purpose" to appear
    And Assert Debtor in Own Account Transfer has content description "Savings Account" and from Excel "<rowindex>" account name "savings_account_name" and iban "savings_account_iban"
    And Assert Recipient in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "personal_account_name" and iban "personal_account_iban"
    And Assert element by text "Payment"
    And Assert element by contains text "In order to continue all input fields must be filled."
    And Assert element by text "Payment amount"
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Click on element by text "EUR"
    And Assert element by text "USD" is not displayed
    And Assert element by text "Purpose"
    And Assert text "INTERNAL TRANSFER" in element id "nlb-input-purpose"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "int_04" in txt file
    And Assert element by text "Payment date"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 EUR"
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert element by text "Debtor"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "savings_user_name_for_payment_review"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "savings_user_address_for_payment_review"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "savings_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_review"
    And Assert that second text "Address" has first following sibling with text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI2X"
    And Swipe vertical
    And Assert element by text "Payment"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "int_04"
    And Assert that text "Payment date" has first following sibling with current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"

    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"

    And Click on element by text "Past payments"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    And Scroll until element with text from txt file under key "int_04" is in view and click
    And Wait for element by text "Recipient"
    And Assert element by text "Payment details"
    And Assert element "nlb-date" by id has current date in format "d.M.yyyy"
    And Assert text under key "int_04" from txt file in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "savings_user_name_for_past_payment" in element by id "nlb-details"

    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "savings_username_and_address_for_past_payments"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI2X"
    And Assert that text "First and last name / Company name" has first following sibling that contains from Excel "<rowindex>" columnName "user_name_short"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "savings_account_iban"
    And Swipe vertical short
    And Swipe vertical short
    And Scroll down until element with text "Executed" is in view
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert that text "Payment status" has first following sibling with text "Executed"
    #Pocetak repeat koraka
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-input-purpose" to appear
    And Assert element by contains text "Own account Transfer"
    And Assert element by contains text "Check data and choose"
    And Assert element by contains text "Debtor"
    And Assert Debtor in Own Account Transfer has content description "Savings Account" and from Excel "<rowindex>" account name "savings_account_name" and iban "savings_account_iban"
    And Assert Recipient in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "personal_account_name" and iban "personal_account_iban"
    And Assert element by text "Payment"
    And Assert element by contains text "In order to continue all input fields must be filled."
    And Assert element by text "Payment amount"
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Click on element by text "EUR"
    And Assert element by text "USD" is not displayed
    And Assert element by text "Purpose"
    And Assert text under key "int_04" from txt file in element id "nlb-input-purpose"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "int_04" in txt file
    And Assert element by text "Payment date"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 EUR"
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert element by text "Debtor"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "savings_user_name_for_payment_review"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "savings_user_address_for_payment_review"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "savings_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_review"
    And Assert that second text "Address" has first following sibling with text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI2X"
    And Swipe vertical
    And Assert element by text "Payment"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "int_04"
    And Assert that text "Payment date" has first following sibling with current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"

    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"

    And Click on element by text "Past payments"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    And Scroll until element with text from txt file under key "int_04" is in view and click
    And Wait for element by text "Recipient"
    And Assert element by text "Payment details"
    And Assert element "nlb-date" by id has current date in format "d.M.yyyy"
    And Assert text under key "int_04" from txt file in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "savings_user_name_for_past_payment" in element by id "nlb-details"

    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "savings_username_and_address_for_past_payments"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI2X"
    And Assert that text "First and last name / Company name" has first following sibling that contains from Excel "<rowindex>" columnName "user_name_short"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "savings_account_iban"
    And Swipe vertical short
    And Swipe vertical short
    And Scroll down until element with text "Executed" is in view
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert that text "Payment status" has first following sibling with text "Executed"

    Examples:
      | rowindex |
      | 4        |


  @Payments_Payments_Archive_Repeat_Executed_Internal_Payment_From_Authorized_Savings_Account_[Android]
  Scenario Outline: Payments_Payments_Archive_Repeat_Executed_Internal_Payment_From_Authorized_Savings_Account_[Android]
    #C71495
    #TODO Postoji bug za pogresan redirect posle ponovljenog placanja. Proveriti test ponovo nakon sto poprave
    #TODO Postoji bug za pogresnog debotra nakon klika na repeat payment.

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Click on element by id "nlb-button-alternate"
    And Wait for element with "Current account" content description from view tag "View"
    And Remove keyboard
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by text "Set amount and currency" to appear for "30" seconds
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Click on element by text "Next"
    And Wait for element by id "nlb-input-purpose" to appear

    And Assert element by contains text "Own account Transfer"
    And Assert element by contains text "Check data and choose"
    And Assert element by contains text "Debtor"
    And Select account from Excel "<rowindex>" columnName "auth_savings_account_iban" as debtor in payment screen
    And Wait for element by id "nlb-input-purpose" to appear
    And Assert Debtor in Own Account Transfer has content description "Savings Account" and from Excel "<rowindex>" account name "auth_savings_account_name" and iban "auth_savings_account_iban"
    And Assert Recipient in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "personal_account_name" and iban "personal_account_iban"
    And Assert element by text "Payment"
    And Assert element by contains text "In order to continue all input fields must be filled."
    And Assert element by text "Payment amount"
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Click on element by text "EUR"
    And Assert element by text "USD" is not displayed
    And Assert element by text "Purpose"
    And Assert text "INTERNAL TRANSFER" in element id "nlb-input-purpose"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "int_04" in txt file
    And Assert element by text "Payment date"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 EUR"
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert element by text "Debtor"
    And Assert that text "Name" has first following sibling with text from Excel "<rowindex>" columnName "auth_savings_user_name_for_payment_review"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "auth_savings_user_address_for_payment_review"
    And Assert that text "Debtor account number" has first following sibling with text from Excel "<rowindex>" columnName "auth_savings_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_review"
    And Assert that second text "Address" has first following sibling with text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI2X"
    And Swipe vertical
    And Assert element by text "Payment"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "int_04"
    And Assert that text "Payment date" has first following sibling with current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"

    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"

    And Click on element by text "Past payments"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "auth_savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "auth_savings_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    And Scroll until element with text from txt file under key "int_04" is in view and click
    And Wait for element by text "Recipient"
    And Assert element by text "Payment details"
    And Assert element "nlb-date" by id has current date in format "d.M.yyyy"
    And Assert text under key "int_04" from txt file in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "savings_user_name_for_past_payment" in element by id "nlb-details"

    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "savings_username_and_address_for_past_payments"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI2X"
    And Assert that text "Name" has first following sibling that contains from Excel "<rowindex>" columnName "auth_user_name_short"
    And Assert that text "Debtor account number" has first following sibling with text from Excel "<rowindex>" columnName "auth_savings_account_iban"
    And Swipe vertical short
    And Swipe vertical short
    And Scroll down until element with text "Executed" is in view
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert that text "Payment status" has first following sibling with text "Executed"
    #Pocetak repeat koraka
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-input-purpose" to appear
    And Assert element by contains text "Own account Transfer"
    And Assert element by contains text "Check data and choose"
    And Assert element by contains text "Debtor"
    And Assert Debtor in Own Account Transfer has content description "Savings Account" and from Excel "<rowindex>" account name "auth_savings_account_name" and iban "auth_savings_account_iban"
    And Assert Recipient in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "personal_account_name" and iban "personal_account_iban"
    And Assert element by text "Payment"
    And Assert element by contains text "In order to continue all input fields must be filled."
    And Assert element by text "Payment amount"
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Click on element by text "EUR"
    And Assert element by text "USD" is not displayed
    And Assert element by text "Purpose"
    And Assert text under key "int_04" from txt file in element id "nlb-input-purpose"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "int_04" in txt file
    And Assert element by text "Payment date"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 EUR"
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert element by text "Debtor"
    And Assert that text "Name" has first following sibling with text from Excel "<rowindex>" columnName "auth_savings_user_name_for_payment_review"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "auth_savings_user_address_for_payment_review"
    And Assert that text "Debtor account number" has first following sibling with text from Excel "<rowindex>" columnName "auth_savings_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_review"
    And Assert that second text "Address" has first following sibling with text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI2X"
    And Swipe vertical
    And Assert element by text "Payment"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "int_04"
    And Assert that text "Payment date" has first following sibling with current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"

    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"

    And Click on element by text "Past payments"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "auth_savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "auth_savings_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    And Scroll until element with text from txt file under key "int_04" is in view and click
    And Wait for element by text "Recipient"
    And Assert element by text "Payment details"
    And Assert element "nlb-date" by id has current date in format "d.M.yyyy"
    And Assert text under key "int_04" from txt file in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "savings_user_name_for_past_payment" in element by id "nlb-details"

    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "savings_username_and_address_for_past_payments"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI2X"
    And Assert that text "Name" has first following sibling that contains from Excel "<rowindex>" columnName "auth_user_name_short"
    And Assert that text "Debtor account number" has first following sibling with text from Excel "<rowindex>" columnName "auth_savings_account_iban"
    And Swipe vertical short
    And Swipe vertical short
    And Scroll down until element with text "Executed" is in view
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert that text "Payment status" has first following sibling with text "Executed"

    Examples:
      | rowindex |
      | 4        |


  @Payments_Payments_Archive_Repeat_Canceled_Internal_Payment_From_Current_Account_[Android]
  Scenario Outline: Payments_Payments_Archive_Repeat_Canceled_Internal_Payment_From_Current_Account_[Android]
    #C71495
    #TODO Postoji bug za pogresan redirect posle ponovljenog placanja. Proveriti test ponovo nakon sto poprave

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Click on element by id "nlb-button-alternate"
    And Wait for element with "Current account" content description from view tag "View"
    And Remove keyboard
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by text "Set amount and currency" to appear for "30" seconds
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Click on element by text "Next"
    And Wait for element by id "nlb-input-purpose" to appear

    And Assert element by contains text "Own account Transfer"
    And Assert element by contains text "Check data and choose"
    And Assert element by contains text "Debtor"
    And Assert Debtor in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "personal_account_name" and iban "personal_account_iban"
    And Assert Recipient in Own Account Transfer has content description "Savings Account" and from Excel "<rowindex>" account name "savings_account_name" and iban "savings_account_iban"
    And Assert element by text "Payment"
    And Assert element by contains text "In order to continue all input fields must be filled."
    And Assert element by text "Payment amount"
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Click on element by text "EUR"
    And Assert element by text "USD" is not displayed
    And Assert element by text "Purpose"
    And Assert text "INTERNAL TRANSFER" in element id "nlb-input-purpose"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "int_04" in txt file
    And Assert element by text "Payment date"
    And Click on date "7" days in the future in calendar
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 EUR"
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert element by text "Debtor"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_review"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "Name" has first following sibling with text from Excel "<rowindex>" columnName "savings_user_name_for_payment_review"
    And Assert that second text "Address" has first following sibling with text from Excel "<rowindex>" columnName "savings_user_address_for_payment_review"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "savings_account_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI2X"
    And Swipe vertical
    And Assert element by text "Payment"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "int_04"
    And Click on element by id "nlb-button-primary"

    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"

    And Click on element by text "Upcoming payments"
    And Wait for element by id "nlb-title" to appear
    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Upcoming payments"
    And Scroll until element with text from txt file under key "int_04" is in view and click
    And Wait for element by text "Cancel payment"
    And Click on element by text "Cancel payment"
    And Click on element by text "Yes"
    And Wait for element by text "Upcoming payments"
    And Click "Back" content description from view tag "View"

    And Click on element by text "Past payments"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    And Scroll until element with text from txt file under key "int_04" is in view and click
    And Wait for element by text "Recipient"
    And Assert element by text "Payment details"
    And Assert text under key "int_04" from txt file in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "savings_user_name_for_past_payment" in element by id "nlb-details"

    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "savings_username_and_address_for_past_payments"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "savings_account_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI2X"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_details"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Swipe vertical short
    And Swipe vertical short
    And Scroll down until element with text "Canceled" is in view
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert that text "Payment status" has first following sibling with text "Canceled"
    #Pocetak repeat koraka
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-input-purpose" to appear
    And Assert element by contains text "Own account Transfer"
    And Assert element by contains text "Check data and choose"
    And Assert element by contains text "Debtor"
    And Assert Debtor in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "personal_account_name" and iban "personal_account_iban"
    And Assert Recipient in Own Account Transfer has content description "Savings Account" and from Excel "<rowindex>" account name "savings_account_name" and iban "savings_account_iban"
    And Assert element by text "Payment"
    And Assert element by contains text "In order to continue all input fields must be filled."
    And Assert element by text "Payment amount"
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Click on element by text "EUR"
    And Assert element by text "USD" is not displayed
    And Assert element by text "Purpose"
    And Assert text under key "int_04" from txt file in element id "nlb-input-purpose"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "int_04" in txt file
    And Assert element by text "Payment date"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 EUR"
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert element by text "Debtor"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_review"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "Name" has first following sibling with text from Excel "<rowindex>" columnName "savings_user_name_for_payment_review"
    And Assert that second text "Address" has first following sibling with text from Excel "<rowindex>" columnName "savings_user_address_for_payment_review"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "savings_account_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI2X"
    And Swipe vertical
    And Assert element by text "Payment"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "int_04"
    And Assert that text "Payment date" has first following sibling with current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"

    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"

    And Click on element by text "Past payments"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    And Scroll until element with text from txt file under key "int_04" is in view and click
    And Wait for element by text "Recipient"
    And Assert element by text "Payment details"
    And Assert element "nlb-date" by id has current date in format "d.M.yyyy"
    And Assert text under key "int_04" from txt file in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "savings_user_name_for_past_payment" in element by id "nlb-details"

    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "savings_username_and_address_for_past_payments"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "savings_account_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI2X"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_details"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Swipe vertical short
    And Swipe vertical short
    And Scroll down until element with text "Executed" is in view
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert that text "Payment status" has first following sibling with text "Executed"

    Examples:
      | rowindex |
      | 4        |


  @Payments_Payments_Archive_Repeat_Canceled_SEPA_Payment_From_Current_Account_[Android]
  Scenario Outline: Payments_Payments_Archive_Repeat_Canceled_SEPA_Payment_From_Current_Account_[Android]
    #C71495
    #TODO Postoji bug za pogresan redirect posle ponovljenog placanja. Proveriti test ponovo nakon sto poprave

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
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "SP_001" in txt file
    And Assert element by text "NRC - No reference"
    And Click on date "7" days in the future in calendar
    And Swipe vertical

    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 EUR"
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert element by text "Debtor"
    And Assert that text "First and last name / Company name" has first following sibling that contains from Excel "<rowindex>" columnName "user_name_short"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_name"
    And Assert that second text "Address" has first following sibling that contains text "TEST"
    And Assert that second text "Address" has first following sibling that contains text "SLOVENIA"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Swipe vertical
    And Assert element by text "Payment"
    And Assert that text "Reference" has first following sibling with text "NRC"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "SP_001"
    And Assert that text "Purpose code" has first following sibling with text "OTHR"
    And Click on element by id "nlb-button-primary"

    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"

    And Click on element by text "Upcoming payments"
    And Wait for element by id "nlb-title" to appear
    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Upcoming payments"
    And Scroll until element with text from txt file under key "SP_001" is in view and click
    And Wait for element by text "Cancel payment"
    And Click on element by text "Cancel payment"
    And Click on element by text "Yes"
    And Wait for element by text "Upcoming payments"
    And Click "Back" content description from view tag "View"

    And Click on element by text "Past payments"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    And Scroll until element with text from txt file under key "SP_001" is in view and click
    And Wait for element by text "Recipient"


    Then Assert element by text "Payment details"
    And Assert text under key "SP_001" from txt file in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "retail_recipient_name" in element by id "nlb-details"
    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_name_and_address_past_payment"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Assert that text "Reference" has first following sibling with text "NRC"
    And Assert that text "Purpose code" has first following sibling with text "OTHR"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_details"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Scroll down until element with text "Canceled" is in view
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert that text "Payment status" has first following sibling with text "Canceled"
    #Pocetak repeat
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-input-purpose" to appear
    And Assert Debtor in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "personal_account_name" and iban "personal_account_iban"
    And Assert SEPA Recipient has icon "T" and from Excel "<rowindex>" account name "retail_recipient_name" and iban "retail_recipient_iban"
    And Assert element by text "Payment"
    And Assert element by contains text "In order to continue all input fields must be filled."
    And Assert element by text "Payment amount"
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Click on element by text "EUR"
    And Assert element by text "USD" is not displayed
    And Assert element by text "Purpose"
    And Swipe vertical
    And Assert text under key "SP_001" from txt file in element id "nlb-input-purpose"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "SP_001" in txt file
    And Assert element by text "Payment date"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 EUR"
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert element by text "Debtor"
    And Assert that text "First and last name / Company name" has first following sibling that contains from Excel "<rowindex>" columnName "user_name_short"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_name"
    And Assert that second text "Address" has first following sibling that contains text "TEST"
    And Assert that second text "Address" has first following sibling that contains text "SLOVENIA"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Swipe vertical
    And Assert element by text "Payment"
    And Assert that text "Reference" has first following sibling with text "NRC"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "SP_001"
    And Assert that text "Purpose code" has first following sibling with text "OTHR"
    And Assert that text "Payment date" has first following sibling with current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"
    And Click on element by text "Past payments"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"
    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"
    And Scroll until element with text from txt file under key "SP_001" is in view and click
    And Wait for element by text "Recipient"
    And Assert element by text "Payment details"
    And Assert element "nlb-date" by id has current date in format "d.M.yyyy"
    And Assert text under key "SP_001" from txt file in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "retail_recipient_name" in element by id "nlb-details"
    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_name_and_address_past_payment"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Assert that text "Reference" has first following sibling with text "NRC"
    And Assert that text "Purpose code" has first following sibling with text "OTHR"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_details"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Scroll down until element with text "Executed" is in view
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert that text "Payment status" has first following sibling with text "Executed"



    Examples:
      | rowindex |
      | 4        |

  @Payments_Payments_Archive_Repeat_Canceled_Foreign_Payment_From_Current_Account_[Android]
  Scenario Outline: Payments_Payments_Archive_Repeat_Canceled_Foreign_Payment_From_Current_Account_[Android]
    #C71495
    #TODO Postoji bug za pogresan redirect posle ponovljenog placanja. Proveriti test ponovo nakon sto poprave

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer"
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "retail_recipient_iban" in element id "nlb-input-account-number"
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Click "Expand dropdown menu" content description from tag "ImageView"
    And Scroll down until currency "USD" in selector is found and click
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by text "Foreign payment"
    #Entering recipient info
    And Enter text "TESTNAME" in element id "nlb-input-recipient-name"
    And Enter text "TEST" in element id "nlb-input-recipient-address"
    And Enter text "TEST" in element id "nlb-input-recipient-city"
    #End of entering recipient info
    And Swipe vertical
    And Assert element by text "SWIFT (BIC) code"
    And Assert text "LJBASI20XXX" in element id "nlb-input-bank-swift-code"
    And Swipe vertical
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "USD"
    And Assert that info message for currency conversion in second step of payment is of correct format
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "FP_001" in txt file
    And Swipe vertical
    And Click on date "7" days in the future in calendar
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 USD"
    And Assert that text "Debited amount" has first following sibling with text "10,00 USD"
    And Assert that text "Informative fee" has first following sibling with text "6,80 EUR"
    And Assert element by text "Debtor"
    And Assert that text "First and last name / Company name" has first following sibling that contains from Excel "<rowindex>" columnName "user_name_short"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_name"
    And Assert that second text "Address" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_full_address_payment_preview"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Swipe vertical
    And Assert element by text "Payment"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "FP_001"
    And Assert that text "Payee of expenditure" has first following sibling with text "SHA"
    And Assert that text "Urgent payment" has first following sibling with text "No"
    And Click on element by id "nlb-button-primary"
    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"

    And Click on element by text "Upcoming payments"
    And Wait for element by id "nlb-title" to appear
    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Upcoming payments"
    And Scroll until element with text from txt file under key "FP_001" is in view and click
    And Wait for element by text "Cancel payment"
    And Click on element by text "Cancel payment"
    And Click on element by text "Yes"
    And Wait for element by text "Upcoming payments"
    And Click "Back" content description from view tag "View"

    And Click on element by text "Past payments"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"
    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"
    And Scroll until element with text from txt file under key "FP_001" is in view and click
    And Wait for element by text "Recipient"

    Then Assert element by text "Payment details"
    And Assert text under key "FP_001" from txt file in element id "nlb-title"
    And Assert text "USD" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "retail_recipient_name" in element by id "nlb-details"
    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_name_and_address_past_payment"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_iban"
    And Assert element by text "Creditor bank name" is not displayed
    And Assert element by text "Creditor bank address" is not displayed
    And Assert element by text "Additional creditor bank info" is not displayed
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Assert that text "Urgent payment" has first following sibling that contains text "No"
    And Scroll down until element with text "Canceled" is in view
    And Assert that text "Payee of expenditure" has first following sibling that contains text "SHA"
    And Assert that text "Debit currency" has first following sibling that contains text "USD"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_details"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert that text "Informative fee" has first following sibling with text "6,80 EUR"
    And Assert that text "Payment status" has first following sibling with text "Canceled"
    #Pocetak repeat
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-input-purpose" to appear
    And Assert Debtor in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "personal_account_name" and iban "personal_account_iban" with currency "USD"
    And Assert SEPA Recipient has icon "T" and from Excel "<rowindex>" account name "retail_recipient_name" and iban "retail_recipient_iban"
    And Assert element by text "Payment"
    And Assert element by contains text "In order to continue all input fields must be filled."
    And Assert element by text "Payment amount"
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "USD"
    And Assert element by text "Purpose"
    And Swipe vertical
    And Assert text under key "FP_001" from txt file in element id "nlb-input-purpose"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "FP_001" in txt file
    And Assert element by text "SHA - Costs are shared between creditor and debtor"
    And Assert element by text "Payment date"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 USD"
    And Assert that text "Debited amount" has first following sibling with text "10,00 USD"
    And Assert that text "Informative fee" has first following sibling with text "6,80 EUR"
    And Assert element by text "Debtor"
    And Assert that text "First and last name / Company name" has first following sibling that contains from Excel "<rowindex>" columnName "user_name_short"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_name"
    And Assert that second text "Address" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_full_address_payment_preview"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Swipe vertical
    And Assert element by text "Payment"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "FP_001"
    And Assert that text "Payee of expenditure" has first following sibling with text "SHA"
    And Assert that text "Payment date" has first following sibling with current date in format "d.M.yyyy"
    And Assert that text "Urgent payment" has first following sibling with text "No"
    And Click on element by id "nlb-button-primary"
    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"
    And Click on element by text "Past payments"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"
    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"
    And Scroll until element with text from txt file under key "FP_001" is in view and click
    And Wait for element by text "Recipient"

    Then Assert element by text "Payment details"
    And Assert element "nlb-date" by id has current date in format "d.M.yyyy"
    And Assert text under key "FP_001" from txt file in element id "nlb-title"
    And Assert text "USD" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "retail_recipient_name" in element by id "nlb-details"
    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_name_and_address_past_payment"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_iban"
    And Assert element by text "Creditor bank name" is not displayed
    And Assert element by text "Creditor bank address" is not displayed
    And Assert element by text "Additional creditor bank info" is not displayed
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Assert that text "Urgent payment" has first following sibling that contains text "No"
    And Scroll down until element with text "Executed" is in view
    And Assert that text "Payee of expenditure" has first following sibling that contains text "SHA"
    And Assert that text "Debit currency" has first following sibling that contains text "USD"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_details"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert that text "Informative fee" has first following sibling with text "6,80 EUR"
    And Assert that text "Payment status" has first following sibling with text "Executed"

    Examples:
      | rowindex |
      | 4        |


  @Payments_Payments_Archive_Repeat_Canceled_Internal_Payment_From_Authorized_Current_Account_[Android]
  Scenario Outline: Payments_Payments_Archive_Repeat_Canceled_Internal_Payment_From_Authorized_Current_Account_[Android]
    #C71495
    #TODO Postoji bug za pogresan redirect posle ponovljenog placanja. Proveriti test ponovo nakon sto poprave
    #TODO Postoji bug za pogresnog debotra nakon klika na repeat payment. Auth account postaje own

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Click on element by id "nlb-button-alternate"
    And Wait for element with "Current account" content description from view tag "View"
    And Remove keyboard
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by text "Set amount and currency" to appear for "30" seconds
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Click on element by text "Next"
    And Wait for element by id "nlb-input-purpose" to appear

    And Assert element by contains text "Own account Transfer"
    And Assert element by contains text "Check data and choose"
    And Assert element by contains text "Debtor"
    And Select account from Excel "<rowindex>" columnName "auth_personal_account_iban" as debtor in payment screen
    And Wait for element by id "nlb-input-purpose" to appear
    And Assert Debtor in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "auth_personal_account_name" and iban "auth_personal_account_iban"
    And Assert Recipient in Own Account Transfer has content description "Savings Account" and from Excel "<rowindex>" account name "savings_account_name" and iban "savings_account_iban"
    And Assert element by text "Payment"
    And Assert element by contains text "In order to continue all input fields must be filled."
    And Assert element by text "Payment amount"
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Click on element by text "EUR"
    And Assert element by text "USD" is not displayed
    And Assert element by text "Purpose"
    And Assert text "INTERNAL TRANSFER" in element id "nlb-input-purpose"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "int_04" in txt file
    And Assert element by text "Payment date"
    And Click on date "7" days in the future in calendar
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 EUR"
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert element by text "Debtor"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "auth_user_name_for_payment_review"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "auth_user_address_for_payment_review"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "auth_personal_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "Name" has first following sibling with text from Excel "<rowindex>" columnName "savings_user_name_for_payment_review"
    And Assert that second text "Address" has first following sibling with text from Excel "<rowindex>" columnName "savings_user_address_for_payment_review"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "savings_account_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI2X"
    And Swipe vertical
    And Assert element by text "Payment"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "int_04"
    And Click on element by id "nlb-button-primary"

    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"

    And Click on element by text "Upcoming payments"
    And Wait for element by id "nlb-title" to appear
    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "auth_personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "auth_personal_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Upcoming payments"
    And Scroll until element with text from txt file under key "int_04" is in view and click
    And Wait for element by text "Cancel payment"
    And Click on element by text "Cancel payment"
    And Click on element by text "Yes"
    And Wait for element by text "Upcoming payments"
    And Click "Back" content description from view tag "View"

    And Click on element by text "Past payments"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "auth_personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "auth_personal_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    And Scroll until element with text from txt file under key "int_04" is in view and click
    And Wait for element by text "Recipient"
    And Assert element by text "Payment details"
    And Assert text under key "int_04" from txt file in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "savings_user_name_for_past_payment" in element by id "nlb-details"

    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "savings_username_and_address_for_past_payments"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "savings_account_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI2X"
    And Assert that text "Name" has first following sibling that contains from Excel "<rowindex>" columnName "auth_user_name_short"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "auth_personal_account_iban"
    And Swipe vertical short
    And Swipe vertical short
    And Scroll down until element with text "Canceled" is in view
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert that text "Payment status" has first following sibling with text "Canceled"
    #Pocetak repeat koraka
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-input-purpose" to appear
    And Assert element by contains text "Own account Transfer"
    And Assert element by contains text "Check data and choose"
    And Assert element by contains text "Debtor"
    And Assert Debtor in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "auth_personal_account_name" and iban "auth_personal_account_iban"
    And Assert Recipient in Own Account Transfer has content description "Savings Account" and from Excel "<rowindex>" account name "savings_account_name" and iban "savings_account_iban"
    And Assert element by text "Payment"
    And Assert element by contains text "In order to continue all input fields must be filled."
    And Assert element by text "Payment amount"
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Click on element by text "EUR"
    And Assert element by text "USD" is not displayed
    And Assert element by text "Purpose"
    And Assert text under key "int_04" from txt file in element id "nlb-input-purpose"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "int_04" in txt file
    And Assert element by text "Payment date"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 EUR"
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert element by text "Debtor"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "auth_user_name_for_payment_review"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "auth_user_address_for_payment_review"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "auth_personal_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "Name" has first following sibling with text from Excel "<rowindex>" columnName "savings_user_name_for_payment_review"
    And Assert that second text "Address" has first following sibling with text from Excel "<rowindex>" columnName "savings_user_address_for_payment_review"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "savings_account_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI2X"
    And Swipe vertical
    And Assert element by text "Payment"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "int_04"
    And Assert that text "Payment date" has first following sibling with current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"

    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"

    And Click on element by text "Past payments"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "auth_personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "auth_personal_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    And Scroll until element with text from txt file under key "int_04" is in view and click
    And Wait for element by text "Recipient"
    And Assert element by text "Payment details"
    And Assert element "nlb-date" by id has current date in format "d.M.yyyy"
    And Assert text under key "int_04" from txt file in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "savings_user_name_for_past_payment" in element by id "nlb-details"

    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "savings_username_and_address_for_past_payments"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "savings_account_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI2X"
    And Assert that text "Name" has first following sibling that contains from Excel "<rowindex>" columnName "auth_user_name_short"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Swipe vertical short
    And Swipe vertical short
    And Scroll down until element with text "Executed" is in view
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert that text "Payment status" has first following sibling with text "Executed"

    Examples:
      | rowindex |
      | 4        |

  @Payments_Payments_Archive_Repeat_Canceled_SEPA_Payment_From_Authorized_Current_Account_[Android]
  Scenario Outline: Payments_Payments_Archive_Repeat_Canceled_SEPA_Payment_From_Authorized_Current_Account_[Android]
    #C71495
    #TODO Postoji bug za pogresan redirect posle ponovljenog placanja. Proveriti test ponovo nakon sto poprave
    #TODO Postoji bug za pogresnog debotra nakon klika na repeat payment. Auth account postaje own

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
    And Select account from Excel "<rowindex>" columnName "auth_personal_account_iban" as debtor in payment screen
    And Enter text from excel "<rowindex>" columnName "retail_recipient_name" in element id "nlb-input-recipient-name"
    And Enter text "TEST" in element id "nlb-input-recipient-address"
    And Enter text "TEST" in element id "nlb-input-recipient-city"
    And Swipe vertical
    And Swipe vertical
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Assert text "OTHR - Other" in element id "nlb-input-purpose-code"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "SP_001" in txt file
    And Assert element by text "NRC - No reference"
    And Click on date "7" days in the future in calendar
    And Swipe vertical

    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 EUR"
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert element by text "Debtor"
    And Assert that text "Name" has first following sibling that contains from Excel "<rowindex>" columnName "auth_user_name_short"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "auth_user_address_for_payment_review"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "auth_personal_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_name"
    And Assert that second text "Address" has first following sibling that contains text "TEST"
    And Assert that second text "Address" has first following sibling that contains text "SLOVENIA"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Swipe vertical
    And Assert element by text "Payment"
    And Assert that text "Reference" has first following sibling with text "NRC"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "SP_001"
    And Assert that text "Purpose code" has first following sibling with text "OTHR"
    And Click on element by id "nlb-button-primary"

    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"
    And Click on element by text "Upcoming payments"
    And Wait for element by id "nlb-title" to appear
    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "auth_personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "auth_personal_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Upcoming payments"
    And Scroll until element with text from txt file under key "SP_001" is in view and click
    And Wait for element by text "Cancel payment"
    And Click on element by text "Cancel payment"
    And Click on element by text "Yes"
    And Wait for element by text "Upcoming payments"
    And Click "Back" content description from view tag "View"

    And Click on element by text "Past payments"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "auth_personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "auth_personal_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    And Scroll until element with text from txt file under key "SP_001" is in view and click
    And Wait for element by text "Recipient"


    Then Assert element by text "Payment details"
    And Assert text under key "SP_001" from txt file in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "retail_recipient_name" in element by id "nlb-details"
    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_name_and_address_past_payment"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Assert that text "Reference" has first following sibling with text "NRC"
    And Assert that text "Purpose code" has first following sibling with text "OTHR"
    And Assert that text "Name" has first following sibling that contains from Excel "<rowindex>" columnName "auth_user_name_short"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "auth_personal_account_iban"
    And Scroll down until element with text "Canceled" is in view
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert that text "Payment status" has first following sibling with text "Canceled"
    #Pocetak repeat
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-input-purpose" to appear
    And Assert Debtor in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "auth_personal_account_name" and iban "auth_personal_account_iban"
    And Assert SEPA Recipient has icon "T" and from Excel "<rowindex>" account name "retail_recipient_name" and iban "retail_recipient_iban"
    And Assert element by text "Payment"
    And Assert element by contains text "In order to continue all input fields must be filled."
    And Assert element by text "Payment amount"
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Click on element by text "EUR"
    And Assert element by text "USD" is not displayed
    And Assert element by text "Purpose"
    And Swipe vertical
    And Assert text under key "SP_001" from txt file in element id "nlb-input-purpose"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "SP_001" in txt file
    And Assert element by text "Payment date"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 EUR"
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert element by text "Debtor"
    And Assert that text "Name" has first following sibling that contains from Excel "<rowindex>" columnName "auth_user_name_short"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "auth_user_address_for_payment_review"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "auth_personal_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_name"
    And Assert that second text "Address" has first following sibling that contains text "TEST"
    And Assert that second text "Address" has first following sibling that contains text "SLOVENIA"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Swipe vertical
    And Assert element by text "Payment"
    And Assert that text "Reference" has first following sibling with text "NRC"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "SP_001"
    And Assert that text "Purpose code" has first following sibling with text "OTHR"
    And Assert that text "Payment date" has first following sibling with current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"
    And Click on element by text "Past payments"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"
    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "auth_personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "auth_personal_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"
    And Scroll until element with text from txt file under key "SP_001" is in view and click
    And Wait for element by text "Recipient"
    And Assert element by text "Payment details"
    And Assert element "nlb-date" by id has current date in format "d.M.yyyy"
    And Assert text under key "SP_001" from txt file in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "retail_recipient_name" in element by id "nlb-details"
    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_name_and_address_past_payment"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Assert that text "Reference" has first following sibling with text "NRC"
    And Assert that text "Purpose code" has first following sibling with text "OTHR"
    And Assert that text "Name" has first following sibling that contains from Excel "<rowindex>" columnName "auth_user_name_short"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "auth_personal_account_iban"
    And Scroll down until element with text "Executed" is in view
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert that text "Payment status" has first following sibling with text "Executed"



    Examples:
      | rowindex |
      | 4        |


  @Payments_Payments_Archive_Repeat_Canceled_Foreign_Payment_From_Authorized_Current_Account_[Android]
  Scenario Outline: Payments_Payments_Archive_Repeat_Canceled_Foreign_Payment_From_Authorized_Current_Account_[Android]
    #C71495
    #TODO Postoji bug za pogresan redirect posle ponovljenog placanja. Proveriti test ponovo nakon sto poprave
    #TODO Postoji bug za pogresnog debotra nakon klika na repeat payment. Auth account postaje own

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer"
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "retail_recipient_iban" in element id "nlb-input-account-number"
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Click "Expand dropdown menu" content description from tag "ImageView"
    And Scroll down until currency "USD" in selector is found and click
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by text "Foreign payment"
    #Entering recipient info
    And Select account from Excel "<rowindex>" columnName "auth_personal_account_iban" as debtor in payment screen
    And Wait for element by id "nlb-input-recipient-name" to appear
    And Enter text "TESTNAME" in element id "nlb-input-recipient-name"
    And Enter text "TEST" in element id "nlb-input-recipient-address"
    And Enter text "TEST" in element id "nlb-input-recipient-city"
    #End of entering recipient info
    And Swipe vertical
    And Assert element by text "SWIFT (BIC) code"
    And Assert text "LJBASI20XXX" in element id "nlb-input-bank-swift-code"
    And Swipe vertical
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "USD"
    And Assert that info message for currency conversion in second step of payment is of correct format
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "FP_001" in txt file
    And Swipe vertical
    And Click on date "7" days in the future in calendar
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 USD"
    And Assert that text "Debited amount" has first following sibling with text "10,00 USD"
    And Assert that text "Informative fee" has first following sibling with text "6,80 EUR"
    And Assert element by text "Debtor"
    And Assert that text "Name" has first following sibling that contains from Excel "<rowindex>" columnName "auth_user_name_short"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "auth_user_address_for_payment_review"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "auth_personal_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_name"
    And Assert that second text "Address" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_full_address_payment_preview"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Swipe vertical
    And Assert element by text "Payment"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "FP_001"
    And Assert that text "Payee of expenditure" has first following sibling with text "SHA"
    And Assert that text "Urgent payment" has first following sibling with text "No"
    And Click on element by id "nlb-button-primary"
    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"
    And Click on element by text "Upcoming payments"
    And Wait for element by id "nlb-title" to appear
    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "auth_personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "auth_personal_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Upcoming payments"
    And Scroll until element with text from txt file under key "FP_001" is in view and click
    And Wait for element by text "Cancel payment"
    And Click on element by text "Cancel payment"
    And Click on element by text "Yes"
    And Wait for element by text "Upcoming payments"
    And Click "Back" content description from view tag "View"


    And Click on element by text "Past payments"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"
    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "auth_personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "auth_personal_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"
    And Scroll until element with text from txt file under key "FP_001" is in view and click
    And Wait for element by text "Recipient"

    Then Assert element by text "Payment details"
    And Assert text under key "FP_001" from txt file in element id "nlb-title"
    And Assert text "USD" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "retail_recipient_name" in element by id "nlb-details"
    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_name_and_address_past_payment"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_iban"
    And Assert element by text "Creditor bank name" is not displayed
    And Assert element by text "Creditor bank address" is not displayed
    And Assert element by text "Additional creditor bank info" is not displayed
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Assert that text "Urgent payment" has first following sibling that contains text "No"
    And Scroll down until element with text "Canceled" is in view
    And Assert that text "Payee of expenditure" has first following sibling that contains text "SHA"
    And Assert that text "Debit currency" has first following sibling that contains text "USD"
    And Assert that text "Name" has first following sibling that contains from Excel "<rowindex>" columnName "auth_user_name_short"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "auth_personal_account_iban"
    And Assert that text "Informative fee" has first following sibling with text "6,80 EUR"
    And Assert that text "Payment status" has first following sibling with text "Canceled"
    #Pocetak repeat
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-input-purpose" to appear
    And Assert Debtor in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "auth_personal_account_name" and iban "auth_personal_account_iban" with currency "USD"
    And Assert SEPA Recipient has icon "T" and from Excel "<rowindex>" account name "retail_recipient_name" and iban "retail_recipient_iban"
    And Assert element by text "Payment"
    And Assert element by contains text "In order to continue all input fields must be filled."
    And Assert element by text "Payment amount"
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "USD"
    And Assert element by text "Purpose"
    And Swipe vertical
    And Assert text under key "FP_001" from txt file in element id "nlb-input-purpose"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "FP_001" in txt file
    And Assert element by text "SHA - Costs are shared between creditor and debtor"
    And Assert element by text "Payment date"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 USD"
    And Assert that text "Debited amount" has first following sibling with text "10,00 USD"
    And Assert that text "Informative fee" has first following sibling with text "6,80 EUR"
    And Assert element by text "Debtor"
    And Assert that text "Name" has first following sibling that contains from Excel "<rowindex>" columnName "auth_user_name_short"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "auth_user_address_for_payment_review"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "auth_personal_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_name"
    And Assert that second text "Address" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_full_address_payment_preview"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Swipe vertical
    And Assert element by text "Payment"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "FP_001"
    And Assert that text "Payee of expenditure" has first following sibling with text "SHA"
    And Assert that text "Payment date" has first following sibling with current date in format "d.M.yyyy"
    And Assert that text "Urgent payment" has first following sibling with text "No"
    And Click on element by id "nlb-button-primary"
    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"
    And Click on element by text "Past payments"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"
    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "auth_personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "auth_personal_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"
    And Scroll until element with text from txt file under key "FP_001" is in view and click
    And Wait for element by text "Recipient"

    Then Assert element by text "Payment details"
    And Assert element "nlb-date" by id has current date in format "d.M.yyyy"
    And Assert text under key "FP_001" from txt file in element id "nlb-title"
    And Assert text "USD" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "retail_recipient_name" in element by id "nlb-details"
    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_name_and_address_past_payment"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_iban"
    And Assert element by text "Creditor bank name" is not displayed
    And Assert element by text "Creditor bank address" is not displayed
    And Assert element by text "Additional creditor bank info" is not displayed
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Assert that text "Urgent payment" has first following sibling that contains text "No"
    And Scroll down until element with text "Executed" is in view
    And Assert that text "Payee of expenditure" has first following sibling that contains text "SHA"
    And Assert that text "Debit currency" has first following sibling that contains text "USD"
    And Assert that text "Name" has first following sibling that contains from Excel "<rowindex>" columnName "auth_user_name_short"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "auth_personal_account_iban"
    And Assert that text "Informative fee" has first following sibling with text "6,80 EUR"
    And Assert that text "Payment status" has first following sibling with text "Executed"

    Examples:
      | rowindex |
      | 4        |

  @Payments_Payments_Archive_Repeat_Canceled_Internal_Payment_From_Savings_Account_[Android]
  Scenario Outline: Payments_Payments_Archive_Repeat_Canceled_Internal_Payment_From_Savings_Account_[Android]
    #C71495
    #TODO Postoji bug za pogresan redirect posle ponovljenog placanja. Proveriti test ponovo nakon sto poprave

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Click on element by id "nlb-button-alternate"
    And Wait for element with "Current account" content description from view tag "View"
    And Remove keyboard
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by text "Set amount and currency" to appear for "30" seconds
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Click on element by text "Next"
    And Wait for element by id "nlb-input-purpose" to appear

    And Assert element by contains text "Own account Transfer"
    And Assert element by contains text "Check data and choose"
    And Assert element by contains text "Debtor"
    And Select account from Excel "<rowindex>" columnName "savings_account_iban" as debtor in payment screen
    And Wait for element by id "nlb-input-purpose" to appear
    And Assert Debtor in Own Account Transfer has content description "Savings Account" and from Excel "<rowindex>" account name "savings_account_name" and iban "savings_account_iban"
    And Assert Recipient in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "personal_account_name" and iban "personal_account_iban"
    And Assert element by text "Payment"
    And Assert element by contains text "In order to continue all input fields must be filled."
    And Assert element by text "Payment amount"
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Click on element by text "EUR"
    And Assert element by text "USD" is not displayed
    And Assert element by text "Purpose"
    And Assert text "INTERNAL TRANSFER" in element id "nlb-input-purpose"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "int_04" in txt file
    And Assert element by text "Payment date"
    And Click on date "7" days in the future in calendar
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 EUR"
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert element by text "Debtor"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "savings_user_name_for_payment_review"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "savings_user_address_for_payment_review"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "savings_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_review"
    And Assert that second text "Address" has first following sibling with text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI2X"
    And Swipe vertical
    And Assert element by text "Payment"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "int_04"
    And Click on element by id "nlb-button-primary"

    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"

    And Click on element by text "Upcoming payments"
    And Wait for element by id "nlb-title" to appear
    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Upcoming payments"
    And Scroll until element with text from txt file under key "int_04" is in view and click
    And Wait for element by text "Cancel payment"
    And Click on element by text "Cancel payment"
    And Click on element by text "Yes"
    And Wait for element by text "Upcoming payments"
    And Click "Back" content description from view tag "View"

    And Click on element by text "Past payments"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    And Scroll until element with text from txt file under key "int_04" is in view and click
    And Wait for element by text "Recipient"
    And Assert element by text "Payment details"
    And Assert text under key "int_04" from txt file in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "savings_user_name_for_past_payment" in element by id "nlb-details"

    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "savings_username_and_address_for_past_payments"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI2X"
    And Assert that text "First and last name / Company name" has first following sibling that contains from Excel "<rowindex>" columnName "user_name_short"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "savings_account_iban"
    And Swipe vertical short
    And Swipe vertical short
    And Scroll down until element with text "Canceled" is in view
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert that text "Payment status" has first following sibling with text "Canceled"
    #Pocetak repeat koraka
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-input-purpose" to appear
    And Assert element by contains text "Own account Transfer"
    And Assert element by contains text "Check data and choose"
    And Assert element by contains text "Debtor"
    And Assert Debtor in Own Account Transfer has content description "Savings Account" and from Excel "<rowindex>" account name "savings_account_name" and iban "savings_account_iban"
    And Assert Recipient in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "personal_account_name" and iban "personal_account_iban"
    And Assert element by text "Payment"
    And Assert element by contains text "In order to continue all input fields must be filled."
    And Assert element by text "Payment amount"
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Click on element by text "EUR"
    And Assert element by text "USD" is not displayed
    And Assert element by text "Purpose"
    And Assert text under key "int_04" from txt file in element id "nlb-input-purpose"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "int_04" in txt file
    And Assert element by text "Payment date"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 EUR"
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert element by text "Debtor"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "savings_user_name_for_payment_review"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "savings_user_address_for_payment_review"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "savings_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_review"
    And Assert that second text "Address" has first following sibling with text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI2X"
    And Swipe vertical
    And Assert element by text "Payment"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "int_04"
    And Assert that text "Payment date" has first following sibling with current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"

    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"

    And Click on element by text "Past payments"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    And Scroll until element with text from txt file under key "int_04" is in view and click
    And Wait for element by text "Recipient"
    And Assert element by text "Payment details"
    And Assert element "nlb-date" by id has current date in format "d.M.yyyy"
    And Assert text under key "int_04" from txt file in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "savings_user_name_for_past_payment" in element by id "nlb-details"

    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "savings_username_and_address_for_past_payments"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI2X"
    And Assert that text "First and last name / Company name" has first following sibling that contains from Excel "<rowindex>" columnName "user_name_short"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "savings_account_iban"
    And Swipe vertical short
    And Swipe vertical short
    And Scroll down until element with text "Executed" is in view
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert that text "Payment status" has first following sibling with text "Executed"

    Examples:
      | rowindex |
      | 4        |


  @Payments_Payments_Archive_Repeat_Canceled_Internal_Payment_From_Authorized_Savings_Account_[Android]
  Scenario Outline: Payments_Payments_Archive_Repeat_Canceled_Internal_Payment_From_Authorized_Savings_Account_[Android]
    #C71495
    #TODO Postoji bug za pogresan redirect posle ponovljenog placanja. Proveriti test ponovo nakon sto poprave
    #TODO Postoji bug za pogresnog debotra nakon klika na repeat payment.

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Click on element by id "nlb-button-alternate"
    And Wait for element with "Current account" content description from view tag "View"
    And Remove keyboard
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by text "Set amount and currency" to appear for "30" seconds
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Click on element by text "Next"
    And Wait for element by id "nlb-input-purpose" to appear

    And Assert element by contains text "Own account Transfer"
    And Assert element by contains text "Check data and choose"
    And Assert element by contains text "Debtor"
    And Select account from Excel "<rowindex>" columnName "auth_savings_account_iban" as debtor in payment screen
    And Wait for element by id "nlb-input-purpose" to appear
    And Assert Debtor in Own Account Transfer has content description "Savings Account" and from Excel "<rowindex>" account name "auth_savings_account_name" and iban "auth_savings_account_iban"
    And Assert Recipient in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "personal_account_name" and iban "personal_account_iban"
    And Assert element by text "Payment"
    And Assert element by contains text "In order to continue all input fields must be filled."
    And Assert element by text "Payment amount"
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Click on element by text "EUR"
    And Assert element by text "USD" is not displayed
    And Assert element by text "Purpose"
    And Assert text "INTERNAL TRANSFER" in element id "nlb-input-purpose"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "int_04" in txt file
    And Assert element by text "Payment date"
    And Click on date "7" days in the future in calendar
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 EUR"
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert element by text "Debtor"
    And Assert that text "Name" has first following sibling with text from Excel "<rowindex>" columnName "auth_savings_user_name_for_payment_review"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "auth_savings_user_address_for_payment_review"
    And Assert that text "Debtor account number" has first following sibling with text from Excel "<rowindex>" columnName "auth_savings_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_review"
    And Assert that second text "Address" has first following sibling with text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI2X"
    And Swipe vertical
    And Assert element by text "Payment"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "int_04"
    And Click on element by id "nlb-button-primary"

    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"

    And Click on element by text "Upcoming payments"
    And Wait for element by id "nlb-title" to appear
    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "auth_savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "auth_savings_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Upcoming payments"
    And Scroll until element with text from txt file under key "int_04" is in view and click
    And Wait for element by text "Cancel payment"
    And Click on element by text "Cancel payment"
    And Click on element by text "Yes"
    And Wait for element by text "Upcoming payments"
    And Click "Back" content description from view tag "View"

    And Click on element by text "Past payments"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "auth_savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "auth_savings_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    And Scroll until element with text from txt file under key "int_04" is in view and click
    And Wait for element by text "Recipient"
    And Assert element by text "Payment details"
    And Assert text under key "int_04" from txt file in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "savings_user_name_for_past_payment" in element by id "nlb-details"

    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "savings_username_and_address_for_past_payments"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI2X"
    And Assert that text "Name" has first following sibling that contains from Excel "<rowindex>" columnName "auth_user_name_short"
    And Assert that text "Debtor account number" has first following sibling with text from Excel "<rowindex>" columnName "auth_savings_account_iban"
    And Swipe vertical short
    And Swipe vertical short
    And Scroll down until element with text "Canceled" is in view
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert that text "Payment status" has first following sibling with text "Canceled"
    #Pocetak repeat koraka
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-input-purpose" to appear
    And Assert element by contains text "Own account Transfer"
    And Assert element by contains text "Check data and choose"
    And Assert element by contains text "Debtor"
    And Assert Debtor in Own Account Transfer has content description "Savings Account" and from Excel "<rowindex>" account name "auth_savings_account_name" and iban "auth_savings_account_iban"
    And Assert Recipient in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "personal_account_name" and iban "personal_account_iban"
    And Assert element by text "Payment"
    And Assert element by contains text "In order to continue all input fields must be filled."
    And Assert element by text "Payment amount"
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Click on element by text "EUR"
    And Assert element by text "USD" is not displayed
    And Assert element by text "Purpose"
    And Assert text under key "int_04" from txt file in element id "nlb-input-purpose"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "int_04" in txt file
    And Assert element by text "Payment date"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 EUR"
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert element by text "Debtor"
    And Assert that text "Name" has first following sibling with text from Excel "<rowindex>" columnName "auth_savings_user_name_for_payment_review"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "auth_savings_user_address_for_payment_review"
    And Assert that text "Debtor account number" has first following sibling with text from Excel "<rowindex>" columnName "auth_savings_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_review"
    And Assert that second text "Address" has first following sibling with text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI2X"
    And Swipe vertical
    And Assert element by text "Payment"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "int_04"
    And Assert that text "Payment date" has first following sibling with current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"

    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"

    And Click on element by text "Past payments"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "auth_savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "auth_savings_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    And Scroll until element with text from txt file under key "int_04" is in view and click
    And Wait for element by text "Recipient"
    And Assert element by text "Payment details"
    And Assert element "nlb-date" by id has current date in format "d.M.yyyy"
    And Assert text under key "int_04" from txt file in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "savings_user_name_for_past_payment" in element by id "nlb-details"

    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "savings_username_and_address_for_past_payments"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI2X"
    And Assert that text "Name" has first following sibling that contains from Excel "<rowindex>" columnName "auth_user_name_short"
    And Assert that text "Debtor account number" has first following sibling with text from Excel "<rowindex>" columnName "auth_savings_account_iban"
    And Swipe vertical short
    And Swipe vertical short
    And Scroll down until element with text "Executed" is in view
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert that text "Payment status" has first following sibling with text "Executed"

    Examples:
      | rowindex |
      | 4        |

  @Payments_Payments_Archive_Create_Confirmation_For_Internal_Transfer_[Android]
  Scenario Outline: Payments_Payments_Archive_Create_Confirmation_For_Internal_Transfer_[Android]
    #C71487

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Click on element by id "nlb-button-alternate"
    And Wait for element with "Current account" content description from view tag "View"
    And Remove keyboard
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by text "Set amount and currency" to appear for "30" seconds
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Click on element by text "Next"
    And Wait for element by id "nlb-input-purpose" to appear
    And Assert element by contains text "Own account Transfer"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "int_04" in txt file
    And Assert element by text "Payment date"
    And Swipe vertical
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Scroll down until element with id "nlb-button-primary" is in view
    And Click on element by id "nlb-button-primary"
    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"
    And Click on element by text "Past payments"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"
    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"
    And Scroll until element with text from txt file under key "int_04" is in view and click
    And Wait for element by text "Recipient"

    Then Click on element by text "Confirmation"
    And Assert that confirmation is created for payment
    #And Assert element by complete id "com.google.android.apps.docs:id/projector_toolbar"
    #And Assert element by text "Open with"
    And Go Back


    Examples:
      | rowindex |
      | 4        |


  @Payments_Payments_Archive_Create_Confirmation_For_SEPA_Transfer_[Android]
  Scenario Outline: Payments_Payments_Archive_Create_Confirmation_For_SEPA_Transfer_[Android]
    #C71487

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "corporate_recipient_iban" in element id "nlb-input-account-number"
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by id "nlb-checkbox-update-recipient" to appear
    And Scroll down until element with text "Next" is in view
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "SP_003" in txt file
    And Click "Expand dropdown menu" content description from tag "ImageView"
    And Click on element by text "NRC - No reference"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Scroll down until element with text "Pay" is in view
    And Click on element by id "nlb-button-primary"
    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"
    And Click on element by text "Past payments"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"
    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"
    And Scroll until element with text from txt file under key "SP_003" is in view and click
    And Wait for element by text "Recipient"

    Then Click on element by text "Confirmation"
    And Assert that confirmation is created for payment
    #And Assert element by complete id "com.google.android.apps.docs:id/projector_toolbar"
    #And Assert element by text "Open with"
    And Go Back



    Examples:
      | rowindex |
      | 4        |


  @Payments_Payments_Archive_Create_Confirmation_For_Foreign_Transfer_[Android]
  Scenario Outline: Payments_Payments_Archive_Create_Confirmation_For_Foreign_Transfer_[Android]
    #C71487

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer"
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "bosnia_iban" in element id "nlb-input-account-number"
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by id "nlb-input-recipient-name" to appear
    And Assert element by text "Foreign payment"
    #Entering recipient info
    And Enter text from excel "<rowindex>" columnName "bosnia_name" in element id "nlb-input-recipient-name"
    And Enter text "TEST" in element id "nlb-input-recipient-address"
    And Enter text "TEST" in element id "nlb-input-recipient-city"
    #End of entering recipient info
    #Enter Recipient country
    And Scroll down until element with id "nlb-input-recipient-country-click-area" is in view
    And Click on element by id "nlb-input-recipient-country-click-area"
    And Wait for element by text "AFGHANISTAN" to appear for "60" seconds
    And Enter text "BOSNIA AND HERZEGOVINA" into search field for country selection
    And Click second element with text "BOSNIA AND HERZEGOVINA"
    #End of entering recipient country
    And Wait for element by id "nlb-input-recipient-address" to appear
    And Swipe vertical
    #Enter bank info
    And Enter text "TEST" in element id "nlb-input-bank-name"
    And Enter text "TEST" in element id "nlb-input-bank-address"
    And Enter text "TEST" in element id "nlb-input-bank-city"
    And Click on element by id "nlb-input-bank-country-click-area"
    And Wait for element by text "AFGHANISTAN" to appear for "60" seconds
    And Enter text "BOSNIA AND HERZEGOVINA" into search field for country selection
    And Click second element with text "BOSNIA AND HERZEGOVINA"
    And Enter text "TEST" in element id "nlb-input-bank-additional-info"
    And Scroll down until element with text "Save recipient" is in view
    And Assert text "RAZBBA22" in element id "nlb-input-bank-swift-code"
    #End of enter bank info
    And Swipe vertical
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "FP_005" in txt file
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount"
    And Scroll down until element with id "nlb-button-primary" is in view
    And Click on element by id "nlb-button-primary"
    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"
    And Click on element by text "Past payments"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"
    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"
    And Scroll until element with text from txt file under key "FP_005" is in view and click
    And Wait for element by text "Recipient"

    Then Click on element by text "Confirmation"
    And Assert that confirmation is created for payment
    #And Assert element by complete id "com.google.android.apps.docs:id/projector_toolbar"
    #And Assert element by text "Open with"
    And Go Back


    Examples:
      | rowindex |
      | 4        |