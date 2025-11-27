Feature: Standing_Orders

  @Payments_Standing_Orders_List_Of_Standing_Orders_[ANDROID]
  Scenario Outline: Payments_Standing_Orders_List_Of_Standing_Orders_[ANDROID]
    #C71540

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "Pay"
    And Wait for Past payments button in Pay screen

    When Click on element by text "Standing orders"
    And Wait for element by id "nlb-title" to appear

    Then Assert element by text from excel "<rowindex>" columnName "personal_account_name"
    And Assert element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Assert element by text "New standing order"
    And Assert list of element by id "nlb-date" is displayed
    And Assert list of element by id "nlb-currency" is displayed
    And Assert list of element by id "nlb-title" is displayed
    And Assert list of element by id "nlb-amount" is displayed
    And Assert list of element by id "nlb-details" is displayed
    And Assert text "Standing order" in element id "nlb-title"


    Examples:
      | rowindex |
      | 3        |

  @Payments_Standing_Orders_Create_New_Standing_Order_For_Corporate_SEPA_Payments_From_Own_Personal_Account_End_Date_Until_Cancellation
  Scenario Outline: Payments_Standing_Orders_Create_New_Standing_Order_For_Corporate_SEPA_Payments_From_Own_Personal_Account_End_Date_Until_Cancellation
    #C71554,C71541

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    And Click "Pay" content description from view tag "View"
    And Wait for Past payments button in Pay screen

    When Click on element by text "Standing orders"
    And Wait for element by id "nlb-title" to appear
    And Click on element by text "New standing order"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "corporate_recipient_iban" in element id "nlb-input-account-number"
    And Enter random amount in element by id "nlb-amount-with-currency-field" and remember it under key "SO_001" in txt file
    And Scroll until element with text "Next" is in view
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-checkbox-update-recipient" to appear
    And Select account from Excel "<rowindex>" columnName "personal_account_iban" as debtor in payment screen
    And Wait for element by id "nlb-checkbox-update-recipient" to appear
    And Assert SEPA Recipient has icon "EL" and from Excel "<rowindex>" account name "corporate_recipient_name" and iban "corporate_recipient_iban"
    And Assert amount from txt file under key "SO_001" in id "nlb-amount-with-currency-field"
    And Assert element by id "nlb-amount-with-currency-field" has following sibling with text "EUR"
    And Assert text "OTHR - Other" in element id "nlb-input-purpose-code"
    And Swipe vertical
    And Enter text "TESTING" in element id "nlb-input-purpose"
    And Click on element by text "SI"
    And Click on element by text "NRC - No reference"
    #And Assert element by id "nlb-input-standing-order-start-date" has date "1" day in the future
    #And Assert element by id "nlb-input-standing-order-start-date" has date "1" day in the future using format "dd.M.yyyy"
    And Assert element by id "nlb-radio-button-until-cancellation" is checked "true"
    And Scroll down until element with id "nlb-button-primary" is in view
    #And Assert standing order text in second step of payment is correct for date "1" day in the future
    And Click on element by text "Next"
    And Wait for element by text "Payment amount"
    And Assert that text "Payment amount" has first following sibling with text from txt file under key "SO_001" and currency "EUR"
    And Assert that text "First and last name / Company name" has first following sibling that contains from Excel "<rowindex>" columnName "user_name_short"
    And Assert that text "Address" has first following sibling that contains from Excel "<rowindex>" columnName "user_street_short"
    And Assert that text "Address" has first following sibling that contains from Excel "<rowindex>" columnName "user_city_short"
    And Assert that text "Address" has first following sibling that contains from Excel "<rowindex>" columnName "user_country_short"
    And Assert that text "Account number" has first following sibling that contains from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "corporate_recipient_name"
    And Assert that second text "Address" has first following sibling that contains text from Excel "<rowindex>" columnName "corporate_recipient_address"
    And Assert that second text "Address" has first following sibling that contains text from Excel "<rowindex>" columnName "corporate_recipient_city"
    And Assert that second text "Address" has first following sibling that contains text from Excel "<rowindex>" columnName "corporate_recipient_country"
    And Swipe vertical
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "corporate_recipient_iban"
    And Assert that text "Reference" has first following sibling that contains text "NRC"
    And Assert that text "Purpose" has first following sibling that contains text "TESTING"
    And Assert that text "Purpose code" has first following sibling that contains text "OTHR"
    And Swipe vertical
    #And Assert that text "Start date" has first following sibling with future date "1" in format "dd.M.yyyy"
    #And Assert standing order text in second step of payment is correct for date "1" day in the future
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "forgot-pin-button" to appear
    And Enter PIN
    And Wait for element by text "Amount:"
    #And Assert that text "Purpose:" has first following sibling that contains text "New standing order"
    #And Assert that text "Amount:" has first following sibling with text from txt file under key "SO_001" and currency "EUR" with nothing else
    #And Assert that text "Account:" has first following sibling that contains from Excel "<rowindex>" columnName "corporate_recipient_iban" with no space
    #And Assert that text "First payment date:" has first following sibling with future date "1" in format "yyyy-MM-dd"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-title" to appear

    Then Scroll until standing order with text from txt file under key "SO_001" is in view and click
    And Wait for element by text "Reference"
    And Wait "3" seconds
    #And Assert element by id "nlb-date" has date "1" day in the future in format "dd.M.yyyy"
    And Assert text "TESTING" in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert that amount for opened standing order is from txt file under key "SO_001"
    And Assert text from excel "<rowindex>" columnName "corporate_recipient_name" in element by id "nlb-details"
    And Assert element by text "Cancel standing order"
    And Assert that text "Recipient" has first following sibling that contains from Excel "<rowindex>" columnName "corporate_recipient_name"
    And Assert that text "Recipient" has first following sibling that contains from Excel "<rowindex>" columnName "corporate_recipient_address"
    And Assert that text "Recipient" has first following sibling that contains from Excel "<rowindex>" columnName "corporate_recipient_city"
    And Assert that text "Recipient" has first following sibling that contains from Excel "<rowindex>" columnName "corporate_recipient_country"
    And Assert that text "Creditor account" has first following sibling that contains from Excel "<rowindex>" columnName "corporate_recipient_iban"
    And Assert that text "Reference" has first following sibling that contains text "NRC"
    And Assert that text "Purpose code" has first following sibling that contains text "OTHR"
    And Assert that text "Purpose" has first following sibling that contains text "TESTING"
    And Assert that text "Account number" has first following sibling that contains from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert that text "Opening date" has first following sibling with future date "0" in format "d.M.yyyy"
    #And Assert that payment date for standing order is "1" day in future with correct format
    And Swipe vertical
    And Assert that text "Payment frequency" has first following sibling that contains text "Monthly"
    And Assert that text "Repeat until" has first following sibling that contains text "Until cancellation"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "New standing order"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Upcoming payments"
    And Click on element by text "Upcoming payments"
    And Wait for element by id "nlb-amount" to appear
    And Scroll until standing order with text from txt file under key "SO_001" is in view and click
    And Wait for element by text "Reference"
    And Wait "3" seconds
    #And Assert element by id "nlb-date" has date "1" day in the future in format "dd.M.yyyy"
    And Assert text "TESTING" in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert that amount for opened standing order is from txt file under key "SO_001"
    And Assert text from excel "<rowindex>" columnName "corporate_recipient_name" in element by id "nlb-details"
    And Assert that text "Recipient" has first following sibling that contains from Excel "<rowindex>" columnName "corporate_recipient_name"
    And Assert that text "Recipient" has first following sibling that contains from Excel "<rowindex>" columnName "corporate_recipient_address"
    And Assert that text "Recipient" has first following sibling that contains from Excel "<rowindex>" columnName "corporate_recipient_city"
    And Assert that text "Recipient" has first following sibling that contains from Excel "<rowindex>" columnName "corporate_recipient_country"
    And Assert that text "Creditor account" has first following sibling that contains from Excel "<rowindex>" columnName "corporate_recipient_iban"
    And Assert that text "Reference" has first following sibling that contains text "NRC"
    And Assert that text "Purpose code" has first following sibling that contains text "OTHR"
    And Assert that text "Purpose" has first following sibling that contains text "TESTING"
    And Assert that text "Account number" has first following sibling that contains from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert that text "Payment status" has first following sibling that contains text "Pending"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Upcoming payments"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Standing orders"
    And Click on element by text "Standing orders"
    And Scroll until standing order with text from txt file under key "SO_001" is in view and click
    And Wait for element by text "Reference"
    And Click on element by text "Cancel standing order"
    And Assert element by text "Are you sure you want to cancel your standing order to"
    And Click on element by text "Yes"
    And Assert element by text "Cancellation successful"



    Examples:
      | rowindex |
      | 4        |


  @Payments_Standing_Orders_Create_New_Standing_Order_For_Corporate_SEPA_Payments_From_Own_Personal_Account_End_Date_On_Date
  Scenario Outline: Payments_Standing_Orders_Create_New_Standing_Order_For_Corporate_SEPA_Payments_From_Own_Personal_Account_End_Date_On_Date
    #C71554,C71541

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click "Pay" content description from view tag "View"
    And Wait for Past payments button in Pay screen

    When Click on element by text "Standing orders"
    And Wait for element by id "nlb-title" to appear
    And Click on element by text "New standing order"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "corporate_recipient_iban" in element id "nlb-input-account-number"
    And Enter random amount in element by id "nlb-amount-with-currency-field" and remember it under key "SO_001" in txt file
    And Scroll until element with text "Next" is in view
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-checkbox-update-recipient" to appear
    And Select account from Excel "<rowindex>" columnName "personal_account_iban" as debtor in payment screen
    And Wait for element by id "nlb-checkbox-update-recipient" to appear
    And Assert SEPA Recipient has icon "EL" and from Excel "<rowindex>" account name "corporate_recipient_name" and iban "corporate_recipient_iban"
    And Assert amount from txt file under key "SO_001" in id "nlb-amount-with-currency-field"
    And Assert element by id "nlb-amount-with-currency-field" has following sibling with text "EUR"
    And Assert text "OTHR - Other" in element id "nlb-input-purpose-code"
    And Swipe vertical
    And Enter text "TESTING" in element id "nlb-input-purpose"
    And Click on element by text "SI"
    And Click on element by text "NRC - No reference"
    #And Assert element by id "nlb-input-standing-order-start-date" has date "1" day in the future
    #And Assert element by id "nlb-input-standing-order-start-date" has date "1" day in the future using format "dd.M.yyyy"
    And Assert element by id "nlb-radio-button-until-cancellation" is checked "true"
    And Click on element by id "nlb-radio-button-on-date"
    #And Assert default end date for standing order is correct
    And Scroll down until element with id "nlb-button-primary" is in view
    #And Assert standing order text in second step of payment is correct for date "1" day in the future with default end date
    And Click on element by text "Next"
    And Wait for element by text "Payment amount"
    And Assert that text "Payment amount" has first following sibling with text from txt file under key "SO_001" and currency "EUR"
    And Assert that text "First and last name / Company name" has first following sibling that contains from Excel "<rowindex>" columnName "user_name_short"
    And Assert that text "Address" has first following sibling that contains from Excel "<rowindex>" columnName "user_street_short"
    And Assert that text "Address" has first following sibling that contains from Excel "<rowindex>" columnName "user_city_short"
    And Assert that text "Address" has first following sibling that contains from Excel "<rowindex>" columnName "user_country_short"
    And Assert that text "Account number" has first following sibling that contains from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "corporate_recipient_name"
    And Assert that second text "Address" has first following sibling that contains text from Excel "<rowindex>" columnName "corporate_recipient_address"
    And Assert that second text "Address" has first following sibling that contains text from Excel "<rowindex>" columnName "corporate_recipient_city"
    And Assert that second text "Address" has first following sibling that contains text from Excel "<rowindex>" columnName "corporate_recipient_country"
    And Swipe vertical short
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "corporate_recipient_iban"
    And Swipe vertical
    And Assert that text "Reference" has first following sibling that contains text "NRC"
    And Assert that text "Purpose" has first following sibling that contains text "TESTING"
    And Assert that text "Purpose code" has first following sibling that contains text "OTHR"
    And Swipe vertical
    #And Assert that text "Start date" has first following sibling with future date "1" in format "dd.M.yyyy"
    #And Assert that text "End date" has first following sibling with future date "1" and "1" year in format "dd.M.yyyy"
    #And Assert standing order text in second step of payment is correct for date "1" day in the future with default end date
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "forgot-pin-button" to appear
    And Enter PIN
    And Wait for element by text "Amount:"
    #And Assert that text "Purpose:" has first following sibling that contains text "New standing order"
    #And Assert that text "Amount:" has first following sibling with text from txt file under key "SO_001" and currency "EUR" with nothing else
    #And Assert that text "Account:" has first following sibling that contains from Excel "<rowindex>" columnName "corporate_recipient_iban" with no space
    #And Assert that text "First payment date:" has first following sibling with future date "1" in format "yyyy-MM-dd"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-title" to appear

    Then Scroll until standing order with text from txt file under key "SO_001" is in view and click
    And Wait for element by text "Reference"
    And Wait "3" seconds
    #And Assert element by id "nlb-date" has date "1" day in the future in format "dd.M.yyyy"
    And Assert text "TESTING" in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert that amount for opened standing order is from txt file under key "SO_001"
    And Assert text from excel "<rowindex>" columnName "corporate_recipient_name" in element by id "nlb-details"
    And Assert element by text "Cancel standing order"
    And Assert that text "Recipient" has first following sibling that contains from Excel "<rowindex>" columnName "corporate_recipient_name"
    And Assert that text "Recipient" has first following sibling that contains from Excel "<rowindex>" columnName "corporate_recipient_address"
    And Assert that text "Recipient" has first following sibling that contains from Excel "<rowindex>" columnName "corporate_recipient_city"
    And Assert that text "Recipient" has first following sibling that contains from Excel "<rowindex>" columnName "corporate_recipient_country"
    And Assert that text "Creditor account" has first following sibling that contains from Excel "<rowindex>" columnName "corporate_recipient_iban"
    And Assert that text "Reference" has first following sibling that contains text "NRC"
    And Assert that text "Purpose code" has first following sibling that contains text "OTHR"
    And Assert that text "Purpose" has first following sibling that contains text "TESTING"
    And Assert that text "Account number" has first following sibling that contains from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert that text "Opening date" has first following sibling with future date "0" in format "d.M.yyyy"
    #And Assert that payment date for standing order is "1" day in future with correct format
    And Swipe vertical
    And Assert that text "Payment frequency" has first following sibling that contains text "Monthly"
    #And Assert that text "Repeat until" has first following sibling with future date "1" and "1" year in format "dd.M.yyyy"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "New standing order"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Upcoming payments"
    And Click on element by text "Upcoming payments"
    And Wait for element by id "nlb-amount" to appear
    And Scroll until standing order with text from txt file under key "SO_001" is in view and click
    And Wait for element by text "Reference"
    And Wait "3" seconds
    #And Assert element by id "nlb-date" has date "1" day in the future in format "dd.M.yyyy"
    And Assert text "TESTING" in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert that amount for opened standing order is from txt file under key "SO_001"
    And Assert text from excel "<rowindex>" columnName "corporate_recipient_name" in element by id "nlb-details"
    And Assert that text "Recipient" has first following sibling that contains from Excel "<rowindex>" columnName "corporate_recipient_name"
    And Assert that text "Recipient" has first following sibling that contains from Excel "<rowindex>" columnName "corporate_recipient_address"
    And Assert that text "Recipient" has first following sibling that contains from Excel "<rowindex>" columnName "corporate_recipient_city"
    And Assert that text "Recipient" has first following sibling that contains from Excel "<rowindex>" columnName "corporate_recipient_country"
    And Assert that text "Creditor account" has first following sibling that contains from Excel "<rowindex>" columnName "corporate_recipient_iban"
    And Assert that text "Reference" has first following sibling that contains text "NRC"
    And Assert that text "Purpose code" has first following sibling that contains text "OTHR"
    And Assert that text "Purpose" has first following sibling that contains text "TESTING"
    And Assert that text "Account number" has first following sibling that contains from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert that text "Payment status" has first following sibling that contains text "Pending"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Upcoming payments"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Standing orders"
    And Click on element by text "Standing orders"
    And Scroll until standing order with text from txt file under key "SO_001" is in view and click
    And Wait for element by text "Reference"
    And Click on element by text "Cancel standing order"
    And Assert element by text "Are you sure you want to cancel your standing order to"
    And Click on element by text "Yes"
    And Assert element by text "Cancellation successful"



    Examples:
      | rowindex |
      | 4        |


  @Payments_Standing_Orders_Create_New_Standing_Order_For_Savings_Internal_Payment_From_Own_Personal_Account_End_Date_Until_Cancellation
  Scenario Outline: Payments_Standing_Orders_Create_New_Standing_Order_For_Savings_Internal_Payment_From_Own_Personal_Account_End_Date_Until_Cancellation
    #C71556,C71541

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click "Pay" content description from view tag "View"
    And Wait for Past payments button in Pay screen

    When Click on element by text "Standing orders"
    And Wait for element by id "nlb-title" to appear
    And Click on element by text "New standing order"
    And Wait for element by id "nlb-input-account-number" to appear
    And Click on element by id "nlb-button-alternate"
    And Wait for element with "Current account" content description from view tag "View"
    And Remove keyboard
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by id "nlb-amount-with-currency-field" to appear
    And Enter random amount in element by id "nlb-amount-with-currency-field" and remember it under key "SO_001" in txt file
    And Scroll until element with text "Next" is in view
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-input-purpose" to appear
    And Select account from Excel "<rowindex>" columnName "personal_account_iban" as debtor in payment screen
    And Wait for element by id "nlb-input-purpose" to appear
    And Assert Recipient in Own Account Transfer has content description "Savings Account" and from Excel "<rowindex>" account name "savings_account_name" and iban "savings_account_iban"
    And Assert amount from txt file under key "SO_001" in id "nlb-amount-with-currency-field"
    And Assert element by id "nlb-amount-with-currency-field" has following sibling with text "EUR"
    And Swipe vertical
    And Enter text "TESTING" in element id "nlb-input-purpose"
    #And Assert element by id "nlb-input-standing-order-start-date" has date "1" day in the future
    #And Assert element by id "nlb-input-standing-order-start-date" has date "1" day in the future using format "dd.M.yyyy"
    And Assert element by id "nlb-radio-button-until-cancellation" is checked "true"
    And Swipe vertical
    #And Assert standing order text in second step of payment is correct for date "1" day in the future
    And Click on element by text "Next"
    And Wait for element by text "Payment amount"
    And Assert that text "Payment amount" has first following sibling with text from txt file under key "SO_001" and currency "EUR"
    And Assert that text "First and last name / Company name" has first following sibling that contains from Excel "<rowindex>" columnName "user_name_short"
    And Assert that text "Address" has first following sibling that contains from Excel "<rowindex>" columnName "user_street_short"
    And Assert that text "Address" has first following sibling that contains from Excel "<rowindex>" columnName "user_city_short"
    And Assert that text "Address" has first following sibling that contains from Excel "<rowindex>" columnName "user_country_short"
    And Assert that text "Account number" has first following sibling that contains from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert that second text "First and last name / Company name" has first following sibling that contains text from Excel "<rowindex>" columnName "user_name_short"
    And Assert that second text "Address" has first following sibling that contains text from Excel "<rowindex>" columnName "user_street_short"
    And Assert that second text "Address" has first following sibling that contains text from Excel "<rowindex>" columnName "user_city_short"
    And Assert that second text "Address" has first following sibling that contains text from Excel "<rowindex>" columnName "user_country_short"
    And Swipe vertical
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "savings_account_iban"

    And Swipe vertical
    And Assert that text "Purpose" has first following sibling that contains text "TESTING"
    #And Assert that text "Start date" has first following sibling with future date "1" in format "dd.M.yyyy"
    #And Assert standing order text in second step of payment is correct for date "1" day in the future
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "forgot-pin-button" to appear
    And Enter PIN
    And Wait for element by text "Amount:"
    #And Assert that text "Purpose:" has first following sibling that contains text "New standing order"
    #And Assert that text "Amount:" has first following sibling with text from txt file under key "SO_001" and currency "EUR" with nothing else
    #And Assert that text "Account:" has first following sibling that contains from Excel "<rowindex>" columnName "savings_account_iban" with no space
    #And Assert that text "First payment date:" has first following sibling with future date "1" in format "yyyy-MM-dd"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-title" to appear
    And Wait "10" seconds

    Then Scroll until standing order with text from txt file under key "SO_001" is in view and click
    And Wait for element by text "Reference"
    And Wait "3" seconds
    #And Assert element by id "nlb-date" has date "1" day in the future in format "dd.M.yyyy"
    And Assert text "TESTING" in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert that amount for opened standing order is from txt file under key "SO_001"
    And Assert element by text from excel "<rowindex>" columnName "user_name_short" is contained in element by id "nlb-details"
    And Assert element by text "Cancel standing order"
    And Assert that text "Recipient" has first following sibling that contains from Excel "<rowindex>" columnName "user_name_short"
    And Assert that text "Recipient" has first following sibling that contains from Excel "<rowindex>" columnName "user_street_short"
    And Assert that text "Recipient" has first following sibling that contains from Excel "<rowindex>" columnName "user_city_short"
    And Assert that text "Recipient" has first following sibling that contains from Excel "<rowindex>" columnName "user_country_short"
    And Assert that text "Creditor account" has first following sibling that contains from Excel "<rowindex>" columnName "savings_account_iban"
    And Assert that text "Reference" has first following sibling that contains text "NRC"
    And Assert that text "Purpose code" has first following sibling that contains text "OTHR"
    And Assert that text "Purpose" has first following sibling that contains text "TESTING"
    And Assert that text "Account number" has first following sibling that contains from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert that text "Opening date" has first following sibling with future date "0" in format "d.M.yyyy"
    #And Assert that payment date for standing order is "1" day in future with correct format
    And Swipe vertical
    And Assert that text "Payment frequency" has first following sibling that contains text "Monthly"
    And Assert that text "Repeat until" has first following sibling that contains text "Until cancellation"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "New standing order"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Upcoming payments"
    And Click on element by text "Upcoming payments"
    And Wait for element by id "nlb-amount" to appear
    And Scroll until standing order with text from txt file under key "SO_001" is in view and click
    And Wait for element by text "Reference"
    And Wait "3" seconds
    #And Assert element by id "nlb-date" has date "1" day in the future in format "dd.M.yyyy"
    And Assert text "TESTING" in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert that amount for opened standing order is from txt file under key "SO_001"
    And Assert element by text from excel "<rowindex>" columnName "user_name_short" is contained in element by id "nlb-details"
    And Assert that text "Recipient" has first following sibling that contains from Excel "<rowindex>" columnName "user_name_short"
    And Assert that text "Recipient" has first following sibling that contains from Excel "<rowindex>" columnName "user_street_short"
    And Assert that text "Recipient" has first following sibling that contains from Excel "<rowindex>" columnName "user_city_short"
    And Assert that text "Recipient" has first following sibling that contains from Excel "<rowindex>" columnName "user_country_short"
    And Assert that text "Creditor account" has first following sibling that contains from Excel "<rowindex>" columnName "savings_account_iban"
    And Assert that text "Reference" has first following sibling that contains text "NRC"
    And Assert that text "Purpose code" has first following sibling that contains text "OTHR"
    And Assert that text "Purpose" has first following sibling that contains text "TESTING"
    And Assert that text "Account number" has first following sibling that contains from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert that text "Payment status" has first following sibling that contains text "Pending"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Upcoming payments"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Standing orders"
    And Click on element by text "Standing orders"
    And Scroll until standing order with text from txt file under key "SO_001" is in view and click
    And Wait for element by text "Reference"
    And Click on element by text "Cancel standing order"
    And Assert element by text "Are you sure you want to cancel your standing order to"
    And Click on element by text "Yes"
    And Assert element by text "Cancellation successful"



    Examples:
      | rowindex |
      | 4        |


  @Payments_Standing_Orders_Create_New_Standing_Order_For_Savings_Internal_Payment_From_Own_Personal_Account_End_Date_On_Date
  Scenario Outline: Payments_Standing_Orders_Create_New_Standing_Order_For_Savings_Internal_Payment_From_Own_Personal_Account_End_Date_On_Date
    #C71556,C71541
    #BUG Fali Swift code ispod recipienta u payment
    #BUG U payment wizardu moze da se izabere currency koji nije EUR

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click "Pay" content description from view tag "View"
    And Wait for Past payments button in Pay screen

    When Click on element by text "Standing orders"
    And Wait for element by id "nlb-title" to appear
    And Click on element by text "New standing order"
    And Wait for element by id "nlb-input-account-number" to appear
    And Click on element by id "nlb-button-alternate"
    And Wait for element with "Current account" content description from view tag "View"
    And Remove keyboard
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by id "nlb-amount-with-currency-field" to appear
    And Enter random amount in element by id "nlb-amount-with-currency-field" and remember it under key "SO_001" in txt file
    And Scroll until element with text "Next" is in view
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-input-purpose" to appear
    And Select account from Excel "<rowindex>" columnName "personal_account_iban" as debtor in payment screen
    And Wait for element by id "nlb-input-purpose" to appear
    And Assert Recipient in Own Account Transfer has content description "Savings Account" and from Excel "<rowindex>" account name "savings_account_name" and iban "savings_account_iban"
    And Assert amount from txt file under key "SO_001" in id "nlb-amount-with-currency-field"
    And Assert element by id "nlb-amount-with-currency-field" has following sibling with text "EUR"
    And Swipe vertical
    And Enter text "TESTING" in element id "nlb-input-purpose"
    #And Assert element by id "nlb-input-standing-order-start-date" has date "1" day in the future
    #And Assert element by id "nlb-input-standing-order-start-date" has date "1" day in the future using format "dd.M.yyyy"
    And Assert element by id "nlb-radio-button-until-cancellation" is checked "true"
    And Swipe vertical
    And Click on element by id "nlb-radio-button-on-date"
    #And Assert default end date for standing order is correct
    And Swipe vertical
    #And Assert standing order text in second step of payment is correct for date "1" day in the future with default end date
    And Click on element by text "Next"
    And Wait for element by text "Payment amount"
    And Assert that text "Payment amount" has first following sibling with text from txt file under key "SO_001" and currency "EUR"
    And Assert that text "First and last name / Company name" has first following sibling that contains from Excel "<rowindex>" columnName "user_name_short"
    And Assert that text "Address" has first following sibling that contains from Excel "<rowindex>" columnName "user_street_short"
    And Assert that text "Address" has first following sibling that contains from Excel "<rowindex>" columnName "user_city_short"
    And Assert that text "Address" has first following sibling that contains from Excel "<rowindex>" columnName "user_country_short"
    And Assert that text "Account number" has first following sibling that contains from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert that second text "First and last name / Company name" has first following sibling that contains text from Excel "<rowindex>" columnName "user_name_short"
    And Assert that second text "Address" has first following sibling that contains text from Excel "<rowindex>" columnName "user_street_short"
    And Assert that second text "Address" has first following sibling that contains text from Excel "<rowindex>" columnName "user_city_short"
    And Assert that second text "Address" has first following sibling that contains text from Excel "<rowindex>" columnName "user_country_short"
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "savings_account_iban"
    And Swipe vertical
    And Swipe vertical
    And Assert that text "Purpose" has first following sibling that contains text "TESTING"
    #And Assert that text "Start date" has first following sibling with future date "1" in format "dd.M.yyyy"
    #And Assert that text "End date" has first following sibling with future date "1" and "1" year in format "dd.M.yyyy"
    #And Assert standing order text in second step of payment is correct for date "1" day in the future with default end date
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "forgot-pin-button" to appear
    And Enter PIN
    And Wait for element by text "Amount:"
    #And Assert that text "Purpose:" has first following sibling that contains text "New standing order"
    #And Assert that text "Amount:" has first following sibling with text from txt file under key "SO_001" and currency "EUR" with nothing else
    #And Assert that text "Account:" has first following sibling that contains from Excel "<rowindex>" columnName "savings_account_iban" with no space
    #And Assert that text "First payment date:" has first following sibling with future date "1" in format "yyyy-MM-dd"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-title" to appear
    And Wait "10" seconds

    Then Scroll until standing order with text from txt file under key "SO_001" is in view and click
    And Wait for element by text "Reference"
    And Wait "3" seconds
    #And Assert element by id "nlb-date" has date "1" day in the future in format "dd.M.yyyy"
    And Assert text "TESTING" in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert that amount for opened standing order is from txt file under key "SO_001"
    And Assert element by text from excel "<rowindex>" columnName "user_name_short" is contained in element by id "nlb-details"
    And Assert element by text "Cancel standing order"
    And Assert that text "Recipient" has first following sibling that contains from Excel "<rowindex>" columnName "user_name_short"
    And Assert that text "Recipient" has first following sibling that contains from Excel "<rowindex>" columnName "user_street_short"
    And Assert that text "Recipient" has first following sibling that contains from Excel "<rowindex>" columnName "user_city_short"
    And Assert that text "Recipient" has first following sibling that contains from Excel "<rowindex>" columnName "user_country_short"
    And Assert that text "Creditor account" has first following sibling that contains from Excel "<rowindex>" columnName "savings_account_iban"
    And Assert that text "Reference" has first following sibling that contains text "NRC"
    And Assert that text "Purpose code" has first following sibling that contains text "OTHR"
    And Assert that text "Purpose" has first following sibling that contains text "TESTING"
    And Assert that text "Account number" has first following sibling that contains from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert that text "Opening date" has first following sibling with future date "0" in format "d.M.yyyy"
    #And Assert that payment date for standing order is "1" day in future with correct format
    And Swipe vertical
    And Assert that text "Payment frequency" has first following sibling that contains text "Monthly"
    #And Assert that text "Repeat until" has first following sibling with future date "1" and "1" year in format "dd.M.yyyy"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "New standing order"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Upcoming payments"
    And Click on element by text "Upcoming payments"
    And Wait for element by id "nlb-amount" to appear
    And Scroll until standing order with text from txt file under key "SO_001" is in view and click
    And Wait for element by text "Reference"
    And Wait "3" seconds
    #And Assert element by id "nlb-date" has date "1" day in the future in format "dd.M.yyyy"
    And Assert text "TESTING" in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert that amount for opened standing order is from txt file under key "SO_001"
    And Assert element by text from excel "<rowindex>" columnName "user_name_short" is contained in element by id "nlb-details"
    And Assert that text "Recipient" has first following sibling that contains from Excel "<rowindex>" columnName "user_name_short"
    And Assert that text "Recipient" has first following sibling that contains from Excel "<rowindex>" columnName "user_street_short"
    And Assert that text "Recipient" has first following sibling that contains from Excel "<rowindex>" columnName "user_city_short"
    And Assert that text "Recipient" has first following sibling that contains from Excel "<rowindex>" columnName "user_country_short"
    And Assert that text "Creditor account" has first following sibling that contains from Excel "<rowindex>" columnName "savings_account_iban"
    And Assert that text "Reference" has first following sibling that contains text "NRC"
    And Assert that text "Purpose code" has first following sibling that contains text "OTHR"
    And Assert that text "Purpose" has first following sibling that contains text "TESTING"
    And Assert that text "Account number" has first following sibling that contains from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert that text "Payment status" has first following sibling that contains text "Pending"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Upcoming payments"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Standing orders"
    And Click on element by text "Standing orders"
    And Scroll until standing order with text from txt file under key "SO_001" is in view and click
    And Wait for element by text "Reference"
    And Click on element by text "Cancel standing order"
    And Assert element by text "Are you sure you want to cancel your standing order to"
    And Click on element by text "Yes"
    And Assert element by text "Cancellation successful"



    Examples:
      | rowindex |
      | 4        |


  @Payments_Standing_Orders_Cancellation_Of_Active_Standing_Order_SEPA_[ANDROID]
  Scenario Outline: Payments_Standing_Orders_Cancellation_Of_Active_Standing_Order_SEPA_[ANDROID]
    #C71564
    #BUG Ekran se ne vraca nazad posle cancel-a nego ostaje na cancelovanom standing order-u

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "Pay"
    And Wait for Past payments button in Pay screen

    When Click on element by text "Standing orders"
    And Wait for element by id "nlb-title" to appear
    And Click on element by text "New standing order"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "corporate_recipient_iban" in element id "nlb-input-account-number"
    And Enter random amount in element by id "nlb-amount-with-currency-field" and remember it under key "SO_001" in txt file
    And Scroll until element with text "Next" is in view
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-checkbox-update-recipient" to appear
    And Select account from Excel "<rowindex>" columnName "personal_account_iban" as debtor in payment screen
    And Wait for element by id "nlb-checkbox-update-recipient" to appear
    And Swipe vertical
    And Enter text "TESTING" in element id "nlb-input-purpose"
    And Click on element by text "SI"
    And Click on element by text "NRC - No reference"
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by text "Payment amount"
    And Swipe vertical
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "forgot-pin-button" to appear
    And Enter PIN
    And Wait for element by text "Purpose:"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-title" to appear

    Then Scroll until standing order with text from txt file under key "SO_001" is in view and click
    And Wait for element by text "Reference"
    And Wait "3" seconds
    And Click on element by text "Cancel standing order"
    And Assert element by text "Are you sure you want to cancel your standing order to"
    And Click on element by text "Yes"
    And Assert element by text "Cancellation successful"
    And Assert element by text "Standing orders"
    And Assert standing order with text from txt file under key "SO_001" is not displayed
    And Click "Back" content description from view tag "View"
    And Wait for element by text "New standing order"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Upcoming payments"
    And Click on element by text "Upcoming payments"
    And Wait for element by id "nlb-amount" to appear
    And Assert standing order with text from txt file under key "SO_001" is not displayed


    Examples:
      | rowindex |
      | 3        |

  @Payments_Standing_Orders_Cancellation_Of_Active_Standing_Order_Own_Account_Transfer_[ANDROID]
  Scenario Outline: Payments_Standing_Orders_Cancellation_Of_Active_Standing_Order_Own_Account_Transfer_[ANDROID]
    #C71564
    #Ne mora da se pusta ako su prosla dva prosla

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "Pay"
    And Wait for Past payments button in Pay screen

    When Click on element by text "Standing orders"
    And Wait for element by id "nlb-title" to appear
    And Click on element by text "New standing order"
    And Wait for element by id "nlb-input-account-number" to appear
    And Click on element by id "nlb-button-alternate"
    And Wait for element with "Current account" content description from view tag "View"
    And Remove keyboard
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by id "nlb-amount-with-currency-field" to appear
    And Enter random amount in element by id "nlb-amount-with-currency-field" and remember it under key "SO_001" in txt file
    And Scroll until element with text "Next" is in view
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-input-purpose" to appear
    And Select account from Excel "<rowindex>" columnName "personal_account_iban" as debtor in payment screen
    And Wait for element by id "nlb-input-purpose" to appear
    And Swipe vertical
    And Enter text "TESTING" in element id "nlb-input-purpose"
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by text "Payment amount"
    And Swipe vertical
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "forgot-pin-button" to appear
    And Enter PIN
    And Wait for element by text "Purpose:"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-title" to appear

    Then Scroll until standing order with text from txt file under key "SO_001" is in view and click
    And Wait for element by text "Reference"
    And Wait "3" seconds
    And Click on element by text "Cancel standing order"
    And Assert element by text "Are you sure you want to cancel your standing order to"
    And Click on element by text "Yes"
    And Assert element by text "Cancellation successful"
    And Assert element by text "Standing orders"
    And Assert standing order with text from txt file under key "SO_001" is not displayed
    And Click "Back" content description from view tag "View"
    And Wait for element by text "New standing order"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Upcoming payments"
    And Click on element by text "Upcoming payments"
    And Wait for element by id "nlb-amount" to appear
    And Assert standing order with text from txt file under key "SO_001" is not displayed

    Examples:
      | rowindex |
      | 3        |


  @Payments_Standing_Orders_Create_New_Standing_Order-Rejected_Confirmation_SEPA_Wrong_PIN_[ANDROID]
  Scenario Outline: Payments_Standing_Orders_Create_New_Standing_Order-Rejected_Confirmation_SEPA_Wrong_PIN_[ANDROID]
    #C71558

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "Pay"
    And Wait for Past payments button in Pay screen

    When Click on element by text "Standing orders"
    And Wait for element by id "nlb-title" to appear
    And Click on element by text "New standing order"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "corporate_recipient_iban" in element id "nlb-input-account-number"
    And Enter random amount in element by id "nlb-amount-with-currency-field" and remember it under key "SO_001" in txt file
    And Scroll until element with text "Next" is in view
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-checkbox-update-recipient" to appear
    And Select account from Excel "<rowindex>" columnName "personal_account_iban" as debtor in payment screen
    And Wait for element by id "nlb-checkbox-update-recipient" to appear
    And Swipe vertical
    And Enter text "TESTING" in element id "nlb-input-purpose"
    And Click on element by text "SI"
    And Click on element by text "NRC - No reference"
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by text "Payment amount"
    And Swipe vertical
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "forgot-pin-button" to appear
    And Enter PIN "<rowindex>" from "pin_wrong" column
    And Assert element by text "Attempts remaining: 4"
    And Click on element by text "OK"
    And Wait for element by id "forgot-pin-button" to appear
    And Enter PIN
    And Wait for element by text "Purpose:"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-title" to appear

    Then Scroll until standing order with text from txt file under key "SO_001" is in view and click
    And Wait for element by text "Reference"
    And Wait "3" seconds
    And Click on element by text "Cancel standing order"
    And Assert element by text "Are you sure you want to cancel your standing order to"
    And Click on element by text "Yes"
    And Assert element by text "Cancellation successful"


    Examples:
      | rowindex |
      | 3        |


  @Payments_Standing_Orders_Create_New_Standing_Order-Rejected_Confirmation_SEPA_Reject_[ANDROID]
  Scenario Outline: Payments_Standing_Orders_Create_New_Standing_Order-Rejected_Confirmation_SEPA_Reject_[ANDROID]
    #C71558

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "Pay"
    And Wait for Past payments button in Pay screen

    When Click on element by text "Standing orders"
    And Wait for element by id "nlb-title" to appear
    And Click on element by text "New standing order"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "corporate_recipient_iban" in element id "nlb-input-account-number"
    And Enter random amount in element by id "nlb-amount-with-currency-field" and remember it under key "SO_001" in txt file
    And Scroll until element with text "Next" is in view
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-checkbox-update-recipient" to appear
    And Select account from Excel "<rowindex>" columnName "personal_account_iban" as debtor in payment screen
    And Wait for element by id "nlb-checkbox-update-recipient" to appear
    And Swipe vertical
    And Enter text "TESTING" in element id "nlb-input-purpose"
    And Click on element by text "SI"
    And Click on element by text "NRC - No reference"
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by text "Payment amount"
    And Swipe vertical
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "forgot-pin-button" to appear
    And Enter PIN
    And Wait for element by text "Purpose:"
    And Click on element by id "nlb-button-alternate"

    Then Assert element by text "Change was rejected"

    Examples:
      | rowindex |
      | 3        |

  @Payments_Standing_Orders_Create_New_Standing_Order-Rejected_Confirmation_SEPA_Expiration_[ANDROID]
  Scenario Outline: Payments_Standing_Orders_Create_New_Standing_Order-Rejected_Confirmation_SEPA_Expiration_[ANDROID]
    #C71558

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "Pay"
    And Wait for Past payments button in Pay screen

    When Click on element by text "Standing orders"
    And Wait for element by id "nlb-title" to appear
    And Click on element by text "New standing order"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "corporate_recipient_iban" in element id "nlb-input-account-number"
    And Enter random amount in element by id "nlb-amount-with-currency-field" and remember it under key "SO_001" in txt file
    And Scroll until element with text "Next" is in view
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-checkbox-update-recipient" to appear
    And Select account from Excel "<rowindex>" columnName "personal_account_iban" as debtor in payment screen
    And Wait for element by id "nlb-checkbox-update-recipient" to appear
    And Swipe vertical
    And Enter text "TESTING" in element id "nlb-input-purpose"
    And Click on element by text "SI"
    And Click on element by text "NRC - No reference"
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by text "Payment amount"
    And Swipe vertical
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "forgot-pin-button" to appear
    And Enter PIN
    And Wait for element by text "Purpose:"

    Then Wait "180" seconds
    And Assert element by text "Confirmation took to long, please close this screen and try again."
    And Click on element by text "Close"
    And Assert element by text "Standing orders"

    Examples:
      | rowindex |
      | 3        |


  @Payments_Standing_Orders_Create_New_Standing_Order-Rejected_Confirmation_Internal_Wrong_PIN_[ANDROID]
  Scenario Outline: Payments_Standing_Orders_Create_New_Standing_Order-Rejected_Confirmation_Internal_Wrong_PIN_[ANDROID]
    #C71558

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "Pay"
    And Wait for Past payments button in Pay screen

    When Click on element by text "Standing orders"
    And Wait for element by id "nlb-title" to appear
    And Click on element by text "New standing order"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "savings_account_iban" in element id "nlb-input-account-number"
    And Enter random amount in element by id "nlb-amount-with-currency-field" and remember it under key "SO_001" in txt file
    And Scroll until element with text "Next" is in view
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-input-purpose" to appear
    And Select account from Excel "<rowindex>" columnName "personal_account_iban" as debtor in payment screen
    And Wait for element by id "nlb-input-purpose" to appear
    And Swipe vertical
    And Enter text "TESTING" in element id "nlb-input-purpose"
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by text "Payment amount"
    And Swipe vertical
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "forgot-pin-button" to appear
    And Enter PIN "<rowindex>" from "pin_wrong" column
    And Assert element by text "Attempts remaining: 4"
    And Click on element by text "OK"
    And Wait for element by id "forgot-pin-button" to appear
    And Enter PIN
    And Wait for element by text "Purpose:"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-title" to appear

    Then Scroll until standing order with text from txt file under key "SO_001" is in view and click
    And Wait for element by text "Reference"
    And Wait "3" seconds
    And Click on element by text "Cancel standing order"
    And Assert element by text "Are you sure you want to cancel your standing order to"
    And Click on element by text "Yes"
    And Assert element by text "Cancellation successful"


    Examples:
      | rowindex |
      | 3        |


  @Payments_Standing_Orders_Create_New_Standing_Order-Rejected_Confirmation_Internal_Reject_[ANDROID]
  Scenario Outline: Payments_Standing_Orders_Create_New_Standing_Order-Rejected_Confirmation_Internal_Reject_[ANDROID]
    #C71558

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "Pay"
    And Wait for Past payments button in Pay screen

    When Click on element by text "Standing orders"
    And Wait for element by id "nlb-title" to appear
    And Click on element by text "New standing order"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "savings_account_iban" in element id "nlb-input-account-number"
    And Enter random amount in element by id "nlb-amount-with-currency-field" and remember it under key "SO_001" in txt file
    And Scroll until element with text "Next" is in view
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-input-purpose" to appear
    And Select account from Excel "<rowindex>" columnName "personal_account_iban" as debtor in payment screen
    And Wait for element by id "nlb-input-purpose" to appear
    And Swipe vertical
    And Enter text "TESTING" in element id "nlb-input-purpose"
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by text "Payment amount"
    And Swipe vertical
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "forgot-pin-button" to appear
    And Enter PIN
    And Wait for element by text "Purpose:"
    And Click on element by id "nlb-button-alternate"

    Then Assert element by text "Change was rejected"

    Examples:
      | rowindex |
      | 3        |

  @Payments_Standing_Orders_Create_New_Standing_Order-Rejected_Confirmation_Internal_Expiration_[ANDROID]
  Scenario Outline: Payments_Standing_Orders_Create_New_Standing_Order-Rejected_Confirmation_Internal_Expiration_[ANDROID]
    #C71558

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "Pay"
    And Wait for Past payments button in Pay screen

    When Click on element by text "Standing orders"
    And Wait for element by id "nlb-title" to appear
    And Click on element by text "New standing order"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "savings_account_iban" in element id "nlb-input-account-number"
    And Enter random amount in element by id "nlb-amount-with-currency-field" and remember it under key "SO_001" in txt file
    And Scroll until element with text "Next" is in view
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-input-purpose" to appear
    And Select account from Excel "<rowindex>" columnName "personal_account_iban" as debtor in payment screen
    And Wait for element by id "nlb-input-purpose" to appear
    And Swipe vertical
    And Enter text "TESTING" in element id "nlb-input-purpose"
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by text "Payment amount"
    And Swipe vertical
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "forgot-pin-button" to appear
    And Enter PIN
    And Wait for element by text "Purpose:"

    Then Wait "180" seconds
    And Assert element by text "Confirmation took to long, please close this screen and try again."
    And Click on element by text "Close"
    And Assert element by text "Standing orders"

    Examples:
      | rowindex |
      | 3        |


  @Payments_Standing_Orders_Create_New_Standing_Order_For_SEPA_Invalid_Account_[ANDROID]
  Scenario Outline: Payments_Standing_Orders_Create_New_Standing_Order_For_SEPA_Invalid_Account_[ANDROID]
    #C71555

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "Pay"
    And Wait for Past payments button in Pay screen

    When Click on element by text "Standing orders"
    And Wait for element by id "nlb-title" to appear
    And Click on element by text "New standing order"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter random amount in element by id "nlb-amount-with-currency-field" and remember it under key "SO_001_invalid" in txt file
    And Swipe vertical
    And Assert element "nlb-button-primary" by id is disabled
    And Enter text "@#" in element id "nlb-input-account-number"
    And Assert text "" in element id "nlb-input-account-number"
    And Enter text "12345678901234567890123456789012345" in element id "nlb-input-account-number"
    And Assert element by text "Account length is not valid, max 34 length"
    And Assert element "nlb-button-primary" by id is disabled
    And Enter text "0292 4025 3764 022" in element id "nlb-input-account-number"
    And Click on element by id "nlb-button-primary"
    And Assert element by text "SI56 0292 4025 3764 022"
    And Click on element by text "Back"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "bosnia_iban" in element id "nlb-input-account-number"
    And Click on element by id "nlb-button-primary"
    And Assert element by text "Creditor account is not valid for standing orders. You can only make standing orders to SEPA accounts in IBAN format."

    Examples:
      | rowindex |
      | 3        |


  @Payments_Standing_Orders_Create_New_Standing_Order_For_SEPA_Invalid_Debtor_Account_[ANDROID]
  Scenario Outline: Payments_Standing_Orders_Create_New_Standing_Order_For_SEPA_Invalid_Debtor_Account_[ANDROID]
    #C71555

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "Pay"
    And Wait for Past payments button in Pay screen

    When Click on element by text "Standing orders"
    And Wait for element by id "nlb-title" to appear
    And Click on element by text "New standing order"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "corporate_recipient_iban" in element id "nlb-input-account-number"
    And Enter random amount in element by id "nlb-amount-with-currency-field" and remember it under key "SO_001" in txt file
    And Scroll until element with text "Next" is in view
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-checkbox-update-recipient" to appear

    Then Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by text "My accounts"
    And Assert element by text from excel "<rowindex>" columnName "savings_account_iban" does not exist with scroll
    And Assert element by text from excel "<rowindex>" columnName "gradual_savings_account_iban" does not exist with scroll
    And Assert element by text from excel "<rowindex>" columnName "term_deposit_iban" does not exist with scroll

    Examples:
      | rowindex |
      | 3        |


  @Payments_Standing_Orders_Create_New_Standing_Order_For_SEPA_Invalid_Start_Date_[ANDROID]
  Scenario Outline: Payments_Standing_Orders_Create_New_Standing_Order_For_SEPA_Invalid_Start_Date_[ANDROID]
    #C71555
    #Pada zbog bug-a RET-2163,RET-7981

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "Pay"
    And Wait for Past payments button in Pay screen

    When Click on element by text "Standing orders"
    And Wait for element by id "nlb-title" to appear
    And Click on element by text "New standing order"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "corporate_recipient_iban" in element id "nlb-input-account-number"
    And Enter random amount in element by id "nlb-amount-with-currency-field" and remember it under key "SO_001" in txt file
    And Scroll until element with text "Next" is in view
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-checkbox-update-recipient" to appear
    And Swipe vertical
    And Click on element by id "nlb-input-standing-order-start-date-click-area"

    Then Assert standing order start date has correct maximum value
    And Click on element by text "Cancel"
    And Click on element by id "nlb-input-standing-order-start-date-click-area"
    And Assert standing order start date has correct minimum value
    And Click on element by text "Cancel"
    And Wait for element by id "nlb-radio-button-on-date" to appear
    And Assert element by id "nlb-radio-button-until-cancellation" is checked "true"
    And Assert element by id "nlb-radio-button-on-date" is checked "false"
    And Click on element by id "nlb-radio-button-on-date"
    And Wait for element by id "nlb-input-standing-order-end-date-click-area" to appear
    And Assert element by id "nlb-radio-button-until-cancellation" is checked "false"
    And Assert element by id "nlb-radio-button-on-date" is checked "true"
    And Click on element by id "nlb-input-standing-order-end-date-click-area"
    And Assert standing order end date has correct minimum value
    And Assert standing order end date has correct maximum value


    Examples:
      | rowindex |
      | 3        |

  @Payments_Standing_Orders_Create_New_Standing_Order_For_Own_Transfer_Invalid_Debtor_Account_[ANDROID]
  Scenario Outline: Payments_Standing_Orders_Create_New_Standing_Order_For_Own_Transfer_Invalid_Debtor_Account_[ANDROID]
    #C71557

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "Pay"
    And Wait for Past payments button in Pay screen

    When Click on element by text "Standing orders"
    And Wait for element by id "nlb-title" to appear
    And Click on element by text "New standing order"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "savings_account_iban" in element id "nlb-input-account-number"
    And Enter random amount in element by id "nlb-amount-with-currency-field" and remember it under key "SO_001" in txt file
    And Scroll until element with text "Next" is in view
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-input-purpose" to appear


    Then Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by text "My accounts"
    And Assert element by text from excel "<rowindex>" columnName "auth_savings_account_iban" does not exist with scroll
    And Assert element by text from excel "<rowindex>" columnName "gradual_savings_account_iban" does not exist with scroll
    And Assert element by text from excel "<rowindex>" columnName "term_deposit_iban" does not exist with scroll

    Examples:
      | rowindex |
      | 3        |

  @Payments_Standing_Orders_Create_New_Standing_Order_For_Own_Transfer_Invalid_Date[ANDROID]
  Scenario Outline: Payments_Standing_Orders_Create_New_Standing_Order_For_Own_Transfer_Invalid_Date[ANDROID]
    #C71557
    #Pada zbog bug-a RET-2163,RET-7981

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "Pay"
    And Wait for Past payments button in Pay screen

    When Click on element by text "Standing orders"
    And Wait for element by id "nlb-title" to appear
    And Click on element by text "New standing order"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "savings_account_iban" in element id "nlb-input-account-number"
    And Enter random amount in element by id "nlb-amount-with-currency-field" and remember it under key "SO_001" in txt file
    And Scroll until element with text "Next" is in view
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-input-purpose" to appear
    And Swipe vertical
    And Click on element by id "nlb-input-standing-order-start-date-click-area"

    Then Assert standing order start date has correct maximum value
    And Click on element by text "Cancel"
    And Click on element by id "nlb-input-standing-order-start-date-click-area"
    And Assert standing order start date has correct minimum value
    And Click on element by text "Cancel"
    And Wait for element by id "nlb-radio-button-on-date" to appear
    And Assert element by id "nlb-radio-button-until-cancellation" is checked "true"
    And Assert element by id "nlb-radio-button-on-date" is checked "false"
    And Click on element by id "nlb-radio-button-on-date"
    And Wait for element by id "nlb-input-standing-order-end-date-click-area" to appear
    And Assert element by id "nlb-radio-button-until-cancellation" is checked "false"
    And Assert element by id "nlb-radio-button-on-date" is checked "true"
    And Click on element by id "nlb-input-standing-order-end-date-click-area"
    And Assert standing order end date has correct minimum value
    And Assert standing order end date has correct maximum value


    Examples:
      | rowindex |
      | 3        |