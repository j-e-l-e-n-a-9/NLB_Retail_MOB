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
    And Wait for first transaction to load

    Then Click on first transaction in product details
    And Assert list of element by id element by id "nlb-date" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert list of element by id element by id "nlb-currency" with regex "^[A-Z]{3}$"
    And Assert list of element by id element by id "nlb-amount" with regex "^[\-−]?(?:0|[1-9]\d{0,2}(?:\.\d{3})*),\d{2}$"
    And Assert list of element by id element by id "nlb-title" with regex "^.*$"
    And Assert list of element by id element by id "nlb-details" with regex "^.*$"
#    And Assert that text "Name and address" has first following sibling that matches regex "^.*$"
    And Assert that text "Account number" has first following sibling that matches regex "^.*$"
    And Assert that text "Purpose" has first following sibling that matches regex "^.*$"
    And Assert that text "Settlement date" has first following sibling that matches regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert that text "Value date" has first following sibling that matches regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert that text "Amount" has first following sibling that matches regex "^-?(?:0|[1-9]\d{0,2}(?:\.\d{3})*),\d{2}\s[A-Z]{3}$"
    And Assert that text "Transaction ID" has first following sibling that matches regex "^.*$"

    Examples:
      | rowindex |
      |        1 |


    #Odkomentarisi korake testa kada budem imao transakcije koje nisu samo iz proslog meseca
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
    And Assert element by content desc "Back"
    And Assert Date transaction filter for Current account is displayed correctly
    And Assert Type transaction filter for Current account is displayed correctly
    And Assert Amount transaction filter for Current account is displayed correctly
    And Assert "Confirm" button is not enabled

    And Click on element by text "Date"
    And Wait for element by id "nlb-radio-button-LAST_7_DAYS" to appear
    And Assert screen header is "Date"
    And Assert element by content desc "Back"
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

#    And Assert Type transaction filter that is currently selected is one with id "nlb-radio-button-LAST_7_DAYS"
#    And Assert "Apply" button primary is enabled
#
#    #7 days
#    And Click on element by id "nlb-button-primary"
#    And Wait first Transaction filter
#    And Assert subtitle of Transaction filter Date is correct for Last seven days
#    And Assert "Confirm" button primary is enabled
#    And Assert "Clear filters" button alternate is enabled
#    And Click on element by id "nlb-button-primary"
#    And Wait for first transaction to load after filter
#    And Assert transactions dates are from last seven days
#
#    #this month
#    And Click Transaction filter button in Product
#    And Wait first Transaction filter
#    And Assert subtitle of Transaction filter Date is correct for Last seven days
#    And Click on element by text "Date"
#    And Wait for element by id "nlb-radio-button-LAST_7_DAYS" to appear
#    And Assert Type transaction filter that is currently selected is one with id "nlb-radio-button-LAST_7_DAYS"
#    And Click on element by id "nlb-radio-button-THIS_MONTH"
#    And Assert Type transaction filter that is currently selected is one with id "nlb-radio-button-THIS_MONTH"
#    And Assert "Apply" button primary is enabled
#    And Click on element by id "nlb-button-primary"
#    And Wait first Transaction filter
#    And Assert subtitle of Transaction filter Date is correct for This month
#    And Assert "Confirm" button primary is enabled
#    And Assert "Clear filters" button alternate is enabled
#    And Click on element by id "nlb-button-primary"
#    And Wait for first transaction to load after filter
#    And Assert transactions dates are from This month
#
#    #last month
#    And Click Transaction filter button in Product
#    And Wait first Transaction filter
#    And Assert subtitle of Transaction filter Date is correct for This month
#    And Click on element by text "Date"
#    And Wait for element by id "nlb-radio-button-LAST_7_DAYS" to appear
#    And Assert Type transaction filter that is currently selected is one with id "nlb-radio-button-THIS_MONTH"
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
    And Swipe to element by text from Excel "<rowindex>" columnName "auth_savings_account_number" and click on it
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


  @Savings_Accounts_Statemants_Share_[MOB_ANDROID]
  Scenario Outline: Savings_Accounts_Statemants_Share_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load

    When Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear
    And Swipe to element by text from Excel "<rowindex>" columnName "saving_account_number" and click on it
    And Wait for first transaction to load

    And Assert element with class "android.widget.TextView" and has text "Transactions" is displayed
    And Click on button in Product details "Statements"
    And Wait for first statement to appear
    And Click on element by id "nlb-icon-row" with index "1"
    And Wait for element by contains text "Izvod_"
    And Assert element by complete id "com.google.android.apps.docs:id/projector_toolbar"
    And Click "More options" content description
    And Click on element by text "Send file…"

    Then Assert element by complete id "com.android.intentresolver:id/chooser_scrollable_container"
    #And Assert element by contains id "file_icon" is displayed
    And Assert list of element by id "android:id/icon" is displayed

    Examples:
      | rowindex |
      |        1 |


  @Savings_Accounts_Transactions_Filter_By_Date_Date_Picker_[MOB_ANDROID]
  Scenario Outline: Savings_Accounts_Transactions_Filter_By_Date_Date_Picker_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load

    When Click on element by contains text "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear
    And Swipe to element by text from Excel "<rowindex>" columnName "saving_account_number" and click on it
    And Wait for element by contains text "Statements"
    And Wait for first transaction to load
    And Click "Filters" content description
    And Wait for element by contains text "time frame"
    And Click on element by text "Date"
    And Wait for element by contains text "Set date"
    And Click on element by desc "Set date" and index "1"
    And Wait for element by contains text "Confirm"
    #And Click on date in Calendar with year 2026 month 2 day 8 and assert that it is shown correctly
    And Click on date in Calendar with year 2026 month 5 day 8 and assert that it is shown correctly on English
    And Click on element by contains text "Confirm"
    And Wait for element by contains text "Set date"

    Then Click on element by desc "Set date" and index "2"
    And Click on date in Calendar with year 2026 month 9 day 24 and assert that it is shown correctly on English
    And Click on element by contains text "Confirm"
    And Wait for element by contains text "From"
    And Click on element by text "Apply"
    And Wait for element by contains text "Confirm"
    And Click on element by contains text "Confirm"
    And Wait for first transaction to load
    And Assert element by content desc "Filters active: 1"
    And Assert transactions dates are between dates year 2026 month 5 day 8 and year 2026 month 9 day 24

    Examples:
      | rowindex |
      |        1 |


  @Savings_Accounts_Transactions_Filter_By_Date_Date_Picker_Invalid_[MOB_ANDROID]
  Scenario Outline: Savings_Accounts_Transactions_Filter_By_Date_Date_Picker_Invalid_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load

    When Click on element by contains text "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear
    And Swipe to element by text from Excel "<rowindex>" columnName "saving_account_number" and click on it
    And Wait for element by contains text "Statements"
    And Wait for first transaction to load
    And Click "Filters" content description
    And Wait for element by contains text "time frame"
    And Click on element by text "Date"
    And Wait for element by contains text "Set date"
    And Click on element by desc "Set date" and index "1"
    And Wait for element by contains text "Confirm"
    #And Click on date in Calendar with year 2026 month 2 day 8 and assert that it is shown correctly
    And Click on date in Calendar with year 2026 month 8 day 8 and assert that it is shown correctly on English
    And Click on element by contains text "Confirm"
    And Wait for element by contains text "Set date"

    Then Click on element by desc "Set date" and index "2"
    # ako je na TST-u aria label za dan na srpskom samo obrisati 'on English'
    And Assert date in Calendar with year 2026 month 8 day 7 is not clickable on English

    Examples:
      | rowindex |
      |        1 |


  @Savings_Accounts_Transactions_Filter_Filter_By_Type_[MOB_ANDROID]
  Scenario Outline: Savings_Accounts_Transactions_Filter_Filter_By_Type_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products"
    And Wait for first product in My products page
    And Scroll until element with text from Excel "<rowindex>" columnName "saving_account_number" is in the view
    And Click on element by text from excel "<rowindex>" columnName "saving_account_number"
    And Wait for first transaction to load
    And Assert product option buttons for Savings account
    And Click on element by id "nlb-icon-button"

    And Wait for element by contains text "time frame"
    And Assert element by contains text "Date"
    And Assert element by contains text "Type"
    And Assert element by contains text "Amount"
    And Assert "Confirm" button is not enabled
    And Click on element by text "Type"
    And Wait for element by id "nlb-radio-button-ALL" to appear
    And Assert screen header is "Set type"
    And Assert element by content desc "Back"
    And Assert element "nlb-radio-button-ALL" by id
    And Assert element "nlb-radio-button-INCOMING" by id
    And Assert element "nlb-radio-button-OUTGOING" by id
    And Assert "Apply" button primary is enabled
    And Assert Type transaction filter options are correct
    And Assert Type transaction filter that is currently selected is one with id "nlb-radio-button-ALL"

    #Incoming transactions
    Then Click on element by id "nlb-radio-button-INCOMING"
    And Assert Type transaction filter that is currently selected is one with id "nlb-radio-button-INCOMING"
    And Assert "Apply" button primary is enabled
    And Click on element by id "nlb-button-primary"
    And Wait first Transaction filter
    And Assert subtitle of Transaction filter "Type" is "Incoming transactions"
    And Assert "Confirm" button primary is enabled
    And Assert "Clear filters" button alternate is enabled
    And Click on element by id "nlb-button-primary"
    And Wait for first transaction to load after filter
    And Assert transaction list is sorted to only show Incoming transactions

    And Click Transaction filter button in Product
    And Wait first Transaction filter
    And Assert subtitle of Transaction filter "Type" is "Incoming transactions"
    And Click on element by text "Type"
    And Wait for element by id "nlb-radio-button-ALL" to appear
    And Assert "Apply" button primary is enabled
    And Assert Type transaction filter that is currently selected is one with id "nlb-radio-button-INCOMING"

    #Outgoing transactions
    And Click on element by id "nlb-radio-button-OUTGOING"
    And Assert Type transaction filter that is currently selected is one with id "nlb-radio-button-OUTGOING"
    And Assert "Apply" button primary is enabled
    And Click on element by id "nlb-button-primary"
    And Wait first Transaction filter
    And Assert subtitle of Transaction filter "Type" is "Outgoing transactions"
    And Assert "Confirm" button primary is enabled
    And Assert "Clear filters" button alternate is enabled
    And Click on element by id "nlb-button-primary"
    And Wait for first transaction to load after filter
    And Assert transaction list is sorted to only show Outgoing transactions

    And Click Transaction filter button in Product
    And Wait first Transaction filter
    And Assert subtitle of Transaction filter "Type" is "Outgoing transactions"
    And Click on element by text "Clear filters"
    And Assert subtitle of Transaction filter "Type" is "All"

    Examples:
      | rowindex |
      |        1 |


  @Savings_Accounts_Transactions_Filter_By_Amount_[MOB_ANDROID]
  Scenario Outline: Savings_Accounts_Transactions_Filter_By_Amount_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click "My Products"
    And Wait for first product in My products page
    And Scroll until element with text from excel "<rowindex>" columnName "saving_account_number" is in view
    And Click on element by text from excel "<rowindex>" columnName "saving_account_number"

    When Wait for first transaction to load
    And Assert Product page for product with name from Excel "<rowindex>" columnName "saving_account_number"
    And Assert product option buttons for Current foreign accounts
    And Assert element with class "android.widget.TextView" and has text "Transactions" is displayed
    And Click Transaction filter button in Product
    And Wait for element by text "Transaction filter"
    And Wait for element by contains text "time frame"
    And Assert element by contains text "Date"
    And Assert element by contains text "Type"
    And Assert element by contains text "Amount"
    And Assert "Confirm" button is not enabled
    And Click on element by text "Amount"
    And Wait for element by text "From"
    And Assert element by text "To"
    And Assert currencies in From and To input field is "RSD"
    And Enter text "1" into input field "From" in amount filter
    And Enter text "2" into input field "To" in amount filter
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Transaction filter"
    And Click on element by id "nlb-button-primary"
    And Wait for first transaction to load
    And Assert filtered amounts have values between "1" and "2"

    Then Click Transaction filter button in Product
    And Wait for element by text "Transaction filter"
    And Click on element by id "nlb-button-alternate"
    And Click on element by text "Amount"
    And Wait for element by text "From"
    And Assert element by text "To"
    And Assert currencies in From and To input field is RSD
    And Enter text "99998" into input field "From" in amount filter
    And Enter text "99999" into input field "To" in amount filter
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Transaction filter"
    And Click on element by id "nlb-button-primary"
    And Wait for element by contains text "No results found."

    Examples:
      | rowindex |
      |        1 |


  @Savings_Accounts_Transactions_Filter_Multiple_Filter_Invalid_[MOB_ANDROID]
  Scenario Outline: Savings_Accounts_Transactions_Filter_Multiple_Filter_Invalid_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load

    When Click "My Products"
    And Wait for first product in My products page
    And Scroll until element with text from Excel "<rowindex>" columnName "saving_account_number" is in the view
    And Click on element by text from excel "<rowindex>" columnName "saving_account_number"
    And Wait for first transaction to load
    And Click on element by id "nlb-icon-button"
    And Wait for element by contains text "time frame"
    And Assert element by contains text "Date"
    And Assert element by contains text "Type"
    And Assert element by contains text "Amount"
    And Assert "Confirm" button is not enabled

    And Click on element by text "Amount"
    And Enter amount from "10000" to "5000"
    And Wait for element by contains text "minimum"
    And Assert element by contains text "The minimum amount cannot be greater than the maximum amount."
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Type"

    Then Click on element by text "Date"
    And Click on element by desc "Set date" and index "2"
    #And Click on date in Calendar with year 2025 month 5 day 8 and assert that it is shown correctly
    And Click on date in Calendar with year 2026 month 5 day 8 and assert that it is shown correctly on English
    And Assert button Cancel in Calendar is enabled
    And Assert button Confirm in Calendar is enabled
    And Click on button Confirm in Calendar
    And Assert To field in Date transactions filter has date year 2026 month 5 day 8
    And Click on element by desc "Set date" and index "1"
    And Check if element by text "Thursday, May 7, 2026" is enabled
    And Check if element by text "Saturday, May 9, 2026" is not enabled

    Examples:
      | rowindex |
      |        1 |


  @Savings_Accounts_Transactions_Search_[MOB_ANDROID]
  Scenario Outline: Savings_Accounts_Transactions_Search_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load

    When Click "My Products"
    And Wait for first product in My products page
    And Scroll until element with text from Excel "<rowindex>" columnName "saving_account_number" is in the view
    And Click on element by text from excel "<rowindex>" columnName "saving_account_number"
    And Wait for first transaction to load
    And Assert Filter icon is displayed
    And Assert Search field is displayed
    And Remember latest transaction purposes from dashboard under key "keyPurposes"

    And Enter text "X" into EditText element
    And Wait "1" seconds
    And Wait for first transaction to load
    And Assert latest transactions in product details are the same as in key "keyPurposes"
    And Click "Clear search input" content description

    And Enter text "ZZZQQQZZAXXXW" into EditText element
    And Wait for element by contains text "No results found."
    And Click "Clear search input" content description

    And Enter text "Internal" into EditText element
    And Wait "1" seconds
    And Wait for first transaction to load
    And Assert transactions in product details has purposes "INTERNAL TRANSFER"
    And Click "Clear search input" content description

    Then Enter text "1,00" into EditText element
    And Wait "1" seconds
    And Wait for first transaction to load
    And Assert transactions in product details has amount "1,00"


    Examples:
      | rowindex |
      |        1 |