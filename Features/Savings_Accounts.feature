Feature: Savings_Accounts

  @Savings_Accounts-Details-Financial_Details_[MOB_ANDROID]
  Scenario Outline: Savings_Accounts-Details-Financial_Details_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products"
    And Wait for first product in My products page
    And Scroll until element with text from excel "<rowindex>" columnName "saving_account_number" is in view
#    And Swipe vertical short
    And Click on element by text from excel "<rowindex>" columnName "saving_account_number"
    And Wait element "Transactions" by text
    And Assert product option buttons for Savings account
    And Assert element by content desc "Filters"
    And Assert element by text "Search..."

    Then Click on element by text "Details"
    And Wait element "Account details" by text
    And Assert text "Financial details" is not displayed
    #TODO: Dodati proveru Financial Details kada se pojavi user koji ima Financial Details

    Examples:
      | rowindex |
      |        1 |


  @Savings_Accounts-Details-Account_Details_[MOB_ANDROID]
  Scenario Outline: Savings_Accounts-Details-Account_Details_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products"
    And Wait for first product in My products page
    And Scroll until element with text from excel "<rowindex>" columnName "saving_account_number" is in view
    And Click on element by text from excel "<rowindex>" columnName "saving_account_number"
    And Wait element "Transactions" by text
    And Assert product option buttons for Savings account
    And Assert element by content desc "Filters"
    And Assert element by text "Search..."

    Then Click on element by text "Details"
    And Wait element "Account details" by text
    And Assert element by text "Account details"
    And Assert element by text "Account type"
    And Assert element by id "nlb-account-type" has text "Savings Account"
    And Assert element by text "Account owner"
    And Assert that text "Account owner" has first following sibling from excel "<rowindex>" columnName "account_details_owner2"
    And Assert element by text "Account number"
    And Assert element by id "nlb-account-number" has text from Exel "<rowindex>" columnName "saving_account_number"
    And Assert element by text "Purpose"
    And Assert element by text "Opening date"
    And Assert element by id "nlb-opening-date" has text in format "^\d{2}\.\d{2}\.\d{4}$"
#    And Assert element by text "Document archive"
#    And Click on element by id "nlb-button-text"
#    And Wait element "Error" by text

    Examples:
      | rowindex |
      |        1 |


  @SAVINGS_ACCOUNTS-STATEMANTS-FILTER_[MOB_ANDROID]
  Scenario Outline: SAVINGS_ACCOUNTS-STATEMANTS-FILTER_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear
    And Click on Product from Excel "<rowindex>" columnName "saving_account_number" in My Products

    And Wait for first transaction to load
    And Assert Product page for product with name from Excel "<rowindex>" columnName "saving_account_number"
    And Assert element with class "android.widget.TextView" and has text "Transactions" is displayed
    And Click on button in Product details "Statements"
#    And Wait for Statements screen to load
    And Wait for first statement to appear

#    And Wait "10" seconds
    When Assert screen header is "Statements"
    And Assert back button in screen "Statements"
    And Assert Year filter for statements
    And Assert Year filter for statements has expected options
    And Select Year "2021" in statements filter
    And Wait for first statement to appear

    Then Assert first statement in list is from year "2021"
    And Assert statements in list are displayed correctly

    Examples:
      | rowindex |
      |        4 |

  @Savings_Accounts-Transactions_List_[MOB_ANDROID]
  Scenario Outline: Savings_Accounts-Transactions_List_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products"
    And Wait for first product in My products page
    And Scroll until element with text from excel "<rowindex>" columnName "saving_account_number" is in view
    And Click on element by text from excel "<rowindex>" columnName "saving_account_number"
    And Wait element "Transactions" by text

    Then Assert list of element by id element by id "nlb-date" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert list of element by id element by id "nlb-currency" with regex "^[A-Z]{3}$"
    And Assert list of element by id element by id "nlb-amount" with regex "^[\-−]?(?:0|[1-9]\d{0,2}(?:\.\d{3})*),\d{2}$"
    And Assert list of element by id element by id "nlb-title" with regex "^.*$"
    And Assert list of element by id element by id "nlb-details" with regex "^.*$"

    Examples:
      | rowindex |
      |        1 |


  @Savings_Accounts-Transactions_Details_[MOB_ANDROID]
  Scenario Outline: Savings_Accounts-Transactions_Details_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products"
    And Wait for first product in My products page
    And Scroll until element with text from excel "<rowindex>" columnName "saving_account_number" is in view
    And Click on element by text from excel "<rowindex>" columnName "saving_account_number"
    And Wait element "Transactions" by text

    Then Click on first transaction in product details
    And Assert list of element by id element by id "nlb-date" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert list of element by id element by id "nlb-currency" with regex "^[A-Z]{3}$"
    And Assert list of element by id element by id "nlb-amount" with regex "^[\-−]?(?:0|[1-9]\d{0,2}(?:\.\d{3})*),\d{2}$"
    And Assert list of element by id element by id "nlb-title" with regex "^.*$"
    And Assert list of element by id element by id "nlb-details" with regex "^.*$"
    And Assert that text "Name and address" has first following sibling that matches regex "^.*$"
    And Assert that text "Account number" has first following sibling that matches regex "^.*$"
    And Assert that text "Purpose" has first following sibling that matches regex "^.*$"
    And Assert that text "Settlement date" has first following sibling that matches regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert that text "Value date" has first following sibling that matches regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert that text "Amount" has first following sibling that matches regex "^-?(?:0|[1-9]\d{0,2}(?:\.\d{3})*),\d{2}\s[A-Z]{3}$"
    And Assert that text "Transaction ID" has first following sibling that matches regex "^.*$"

    Examples:
      | rowindex |
      |        1 |


  @Savings_Accounts_Transactions_Filter_By_Date_Predefined_Date_Range_[MOB_ANDROID]
  Scenario Outline: Savings_Accounts_Transactions_Filter_By_Date_Predefined_Date_Range_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products"
    And Wait for first product in My products page
    And Scroll until element with text from excel "<rowindex>" columnName "saving_account_number" is in view
    And Click on element by text from excel "<rowindex>" columnName "saving_account_number"
    And Wait element "Transactions" by text
    And Assert Transaction filter button in Product
    And Click Transaction filter button in Product
    And Wait first Transaction filter

    And Assert screen header is "Transaction filter"
    And Assert back button in screen "Transaction filter"
    And Assert Date transaction filter for Current account is displayed correctly
    And Assert Type transaction filter for Current account is displayed correctly
    And Assert Amount transaction filter for Current account is displayed correctly
    And Assert "Confirm" button is not enabled

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
    And Assert "Confirm" button primary is enabled
    And Assert "Clear filters" button alternate is enabled
    And Click on element by id "nlb-button-primary"
    And Wait for first transaction to load after filter
    And Assert transactions dates are from last seven days

    #this month
    And Click Transaction filter button in Product
    And Wait first Transaction filter
    And Assert subtitle of Transaction filter Date is correct for Last seven days
    And Click on element by text "Date"
    And Wait for element by id "nlb-radio-button-LAST_7_DAYS" to appear
    And Assert Type transaction filter that is currently selected is one with id "nlb-radio-button-LAST_7_DAYS"
    And Click on element by id "nlb-radio-button-THIS_MONTH"
    And Assert Type transaction filter that is currently selected is one with id "nlb-radio-button-THIS_MONTH"
    And Assert "Apply" button primary is enabled
    And Click on element by id "nlb-button-primary"
    And Wait first Transaction filter
    And Assert subtitle of Transaction filter Date is correct for This month
    And Assert "Confirm" button primary is enabled
    And Assert "Clear filters" button alternate is enabled
    And Click on element by id "nlb-button-primary"
    And Wait for first transaction to load after filter
    And Assert transactions dates are from This month

    #last month
    And Click Transaction filter button in Product
    And Wait first Transaction filter
    And Assert subtitle of Transaction filter Date is correct for This month
    And Click on element by text "Date"
    And Wait for element by id "nlb-radio-button-LAST_7_DAYS" to appear
    And Assert Type transaction filter that is currently selected is one with id "nlb-radio-button-THIS_MONTH"
    And Click on element by id "nlb-radio-button-LAST_MONTH"
    And Assert Type transaction filter that is currently selected is one with id "nlb-radio-button-LAST_MONTH"
    And Assert "Apply" button primary is enabled
    And Click on element by id "nlb-button-primary"
    And Wait first Transaction filter
    And Assert subtitle of Transaction filter date is correct for Last month
    And Assert "Confirm" button primary is enabled
    And Assert "Clear filters" button alternate is enabled
    And Click on element by id "nlb-button-primary"
    And Wait for first transaction to load after filter
    And Assert transactions dates are from Last month

    Examples:
      | rowindex |
      |        1 |


  @Savings_Accounts_Statemants_List_[MOB_ANDROID]
  Scenario Outline: Savings_Accounts_Statemants_List_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load

    When Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear
    And Swipe to element by text from Excel "<rowindex>" columnName "saving_account_number" and click on it
    And Wait for first transaction to load

    And Assert element with class "android.widget.TextView" and has text "Transactions" is displayed
    And Assert list of transactions is displayed correctly in Product
    And Assert Transaction filter button in Product
    And Click on button in Product details "Statements"
    And Wait for first statement to appear

    And Assert screen header is "Statements"
    And Assert back button in screen "Statements"
    And Assert Year filter for statements
    And Assert statemant year filter has current year
    And Assert Year filter for statements has expected options
    And Click on element by text "2021"
    And Wait for first statement to appear
    And Remember number of Statemants under key "keyStatemantsNumber"
    And Swipe vertical up
    And Assert the statements counter displays the expected number of items from key "keyStatemantsNumber"
    And Assert all statements from list has year "2021" and they are sorted properly

    Then Click on element by id "nlb-icon-row" with index "1"
    And Wait for element by contains text "Izvod_"
    And Assert element by complete id "com.google.android.apps.docs:id/projector_toolbar"
    And Go Back
    And Assert screen header is "Statements"

    Examples:
      | rowindex |
      |        1 |