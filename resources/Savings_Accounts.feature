Feature: Savings_Accounts

  @Savings_Accounts_Details-Financial_Details_[MOB_ANDROID]
  Scenario Outline: Savings_Accounts_Details-Financial_Details_[MOB_ANDROID]
    #C70924

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click on element by text "Details"
    And Wait for element by id "nlb-interest-rate" to appear
    And Swipe vertical

    Then Assert element by text "Financial details"
    And Assert element by text "Interest rate"
    And Assert element by id "nlb-interest-rate" ends in "%"
    And Assert element by id "nlb-interest-rate" with regex "^(?:(?:0|[1-9]\d{0,2})(?:.\d{3})*),\d{4} [%]{1}$"
    And Assert element by text "Accrued interest"
    And Assert element by id "nlb-accrued-interest" ends in "EUR"
    And Assert element by id "nlb-button-text" that has descendant text "Currency exchange"
    And Click on element by text "Currency exchange"
    And Wait for element by text "Check exchange rates"
    And Assert element by text "Check exchange rates"

    Examples:
      | rowindex |
      |        4 |

  @Savings_Accounts-Details-Account_Details_[MOB_ANDROID]
  Scenario Outline: Savings_Accounts-Details-Account_Details_[MOB_ANDROID]
    #C70925

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click on element by text "Details"
    And Wait for element by id "nlb-interest-rate" to appear
    And Scroll down until element with text "Document archive" is in view

    Then Assert element by text "Account details"
    And Assert element by text "Account type"
    And Assert text "Savings Account" in element id "nlb-account-type"
    And Assert element by text "Account owner"
    #And Assert text from excel "<rowindex>" columnName "savings_account_details_owner" in element by id "nlb-account-owner"
    And Assert element by text from excel "<rowindex>" columnName "user_name_short" is contained in element by id "nlb-account-owner"
    And Assert element by text "Account number"
    And Assert text from excel "<rowindex>" columnName "savings_account_iban" in element by id "nlb-account-number"
    And Assert element by text "Purpose"
    And Assert text "VARČEVANJE" in element id "nlb-purpose"
    And Assert element by text "Opening date"
    And Assert text from excel "<rowindex>" columnName "savings_account_details_opening_date" in element by id "nlb-opening-date"
    And Swipe vertical
    And Assert element by id "nlb-button-text" that has descendant text "Document archive"
    And Click on element by text "Document archive"
    And Assert element by text "No documents for selected filters."

    Examples:
      | rowindex |
      |        4 |


  @SAVINGS_ACCOUNTS-TRANSACTIONS-FILTER_BY_TYPE_[MOB_ANDROID]
  Scenario Outline: SAVINGS_ACCOUNTS-TRANSACTIONS-FILTER_BY_TYPE_[MOB_ANDROID]
  C70908

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear
    And Click on Product from Excel "<rowindex>" columnName "savings_account_iban" in My Products

    When Wait for first transaction to load
    And Assert Product page for product with name from Excel "<rowindex>" columnName "savings_account_name"
    And Assert element with class "android.widget.TextView" and has text "Transactions" is displayed
    And Assert list of element by id "nlb-item-row" is displayed
    And Assert Transaction filter button in Product

    #All transactions
    Then Assert transaction list is not sorted and has both Incoming and Outgoing transactions
    And Click Transaction filter button in Product
    And Wait first Transaction filter
    And Assert screen header is "Transaction filter"
    And Assert back button in screen "Transaction filter"
    And Assert Date transaction filter is displayed correctly
    And Assert Categories transaction filter is displayed correctly
    And Assert Type transaction filter is displayed correctly
    And Assert Amount transaction filter is displayed correctly
    And Assert Tags transaction filter is displayed correctly
    And Assert "Apply" button is not enabled
    And Click on element by text "Type"
    And Wait for element by id "nlb-radio-button-ALL" to appear
    And Assert screen header is "Set type"
    And Assert back button in screen "Set type"
    And Assert element "nlb-radio-button-ALL" by id
    And Assert element "nlb-radio-button-INCOMING" by id
    And Assert element "nlb-radio-button-OUTGOING" by id
    And Assert "Apply" button primary is enabled
    And Assert Type transaction filter options are correct
    And Assert Type transaction filter that is currently selected is one with id "nlb-radio-button-ALL"

    #Incoming transactions
    And Click on element by id "nlb-radio-button-INCOMING"
    And Assert Type transaction filter that is currently selected is one with id "nlb-radio-button-INCOMING"
    And Assert "Apply" button primary is enabled
    And Click on element by id "nlb-button-primary"
    And Wait first Transaction filter
    And Assert subtitle of Transaction filter "Type" is "Incoming transactions"
    And Assert "Apply" button primary is enabled
    And Assert "Clear filters" button alternate is enabled
    And Click on element by id "nlb-button-primary"
    And Wait for first transaction to load after filter
    And Assert transaction list is sorted to only show Incoming transactions
    And Scroll element up into view by xPath "//android.widget.TextView[@text='Transactions']/following-sibling::android.view.View[1]"
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
    And Assert "Apply" button primary is enabled
    And Assert "Clear filters" button alternate is enabled
    And Click on element by id "nlb-button-primary"
    And Wait for first transaction to load after filter
    And Assert transaction list is sorted to only show Outgoing transactions


    Examples:
      | rowindex |
      | 4        |


  @SAVINGS_ACCOUNTS-TRANSACTIONS-FILTER_BY_DATE-(options)_[MOB_ANDROID]
  Scenario Outline: SAVINGS_ACCOUNTS-TRANSACTIONS-FILTER_BY_DATE-(options)_[MOB_ANDROID]
  C70905

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear
    And Click on Product from Excel "<rowindex>" columnName "savings_account_iban" in My Products

    When Wait for first transaction to load
    And Assert Product page for product with name from Excel "<rowindex>" columnName "savings_account_name"
    And Assert element with class "android.widget.TextView" and has text "Transactions" is displayed
    And Assert list of element by id "nlb-item-row" is displayed
    And Assert Transaction filter button in Product
    And Click Transaction filter button in Product
    And Wait first Transaction filter

    And Assert screen header is "Transaction filter"
    And Assert back button in screen "Transaction filter"
    And Assert Date transaction filter is displayed correctly
    And Assert Categories transaction filter is displayed correctly
    And Assert Type transaction filter is displayed correctly
    And Assert Amount transaction filter is displayed correctly
    And Assert Tags transaction filter is displayed correctly
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
    And Assert "Apply" button primary is enabled
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
    And Assert "Apply" button primary is enabled
    And Assert "Clear filters" button alternate is enabled
    And Click on element by id "nlb-button-primary"
    And Wait for first transaction to load after filter
    And Assert transactions dates are from Last month


    Examples:
      | rowindex |
      | 5        |


  @SAVINGS_ACCOUNTS-TRANSACTIONS-FILTER_BY_DATE-(custom_date_range)_[MOB_ANDROID]
  Scenario Outline: SAVINGS_ACCOUNTS-TRANSACTIONS-FILTER_BY_DATE-(custom_date_range)_[MOB_ANDROID]
  C70906

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear
    And Click on Product from Excel "<rowindex>" columnName "savings_account_iban" in My Products

    And Wait for first transaction to load
    And Assert Product page for product with name from Excel "<rowindex>" columnName "savings_account_name"
    And Assert element with class "android.widget.TextView" and has text "Transactions" is displayed
    And Assert list of element by id "nlb-item-row" is displayed
    And Assert Transaction filter button in Product
    And Click Transaction filter button in Product
    And Wait first Transaction filter

    And Assert screen header is "Transaction filter"
    And Assert back button in screen "Transaction filter"
    And Assert Date transaction filter is displayed correctly
    And Assert Categories transaction filter is displayed correctly
    And Assert Type transaction filter is displayed correctly
    And Assert Amount transaction filter is displayed correctly
    And Assert Tags transaction filter is displayed correctly
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
    #custom date range
    And Assert From field in Date transactions filter has today date
    And Assert To field in Date transactions filter has today date
    #from

    When Click on element by id "nlb-input-date-from-click-area"
    #         preset day before yesterday
    #And Click on day before yesterday date in Calendar and assert that it is shown correctly
    And Click on date in Calendar with year 2024 month 8 day 9 and assert that it is shown correctly
    And Assert button Cancel in Calendar is enabled
    And Assert button Confirm in Calendar is enabled
    And Click on button Confirm in Calendar
    And Assert From field in Date transactions filter has date year 2024 month 8 day 9
    #And Assert From field in Date transactions filter has day before yesterday date

    #to
    #         preset yesterday
    And Click on element by id "nlb-input-date-to-click-area"
    #And Click on yesterday date in Calendar and assert that it is shown correctly
    And Click on date in Calendar with year 2024 month 8 day 14 and assert that it is shown correctly
    And Assert button Cancel in Calendar is enabled
    And Assert button Confirm in Calendar is enabled
    And Click on button Confirm in Calendar
    #And Assert To field in Date transactions filter has yesterday date
    And Assert To field in Date transactions filter has date year 2024 month 8 day 14
    And Assert "Apply" button primary is enabled
    And Click on element by id "nlb-button-primary"
    And Wait first Transaction filter
    #And Assert subtitle of Transaction filter Date is correct for day before yesterday to yesterday
    And Assert subtitle of Transaction filter Date is correct for dates year 2024 month 8 day 9 and year 2024 month 8 day 14
    And Assert "Apply" button primary is enabled
    And Assert "Clear filters" button alternate is enabled
    And Click on element by id "nlb-button-primary"
    And Wait for first transaction to load after filter

    #Then Assert transactions dates are from day before yesterday to yesterday
    Then Assert transactions dates are between dates year 2024 month 8 day 9 and year 2024 month 8 day 14

    Examples:
      | rowindex |
      | 5        |


  @SAVINGS_ACCOUNTS-TRANSACTIONS-FILTER_BY_DATE-(custom_date_range)-invalid_[MOB_ANDROID]
  Scenario Outline: SAVINGS_ACCOUNTS-TRANSACTIONS-FILTER_BY_DATE-(custom_date_range)-invalid_[MOB_ANDROID]
  C70906

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear
    And Click on Product from Excel "<rowindex>" columnName "savings_account_iban" in My Products

    And Wait for first transaction to load
    And Assert Product page for product with name from Excel "<rowindex>" columnName "savings_account_name"
    And Assert element with class "android.widget.TextView" and has text "Transactions" is displayed
    And Assert list of element by id "nlb-item-row" is displayed
    And Assert Transaction filter button in Product
    And Click Transaction filter button in Product
    And Wait first Transaction filter

    And Assert screen header is "Transaction filter"
    And Assert back button in screen "Transaction filter"
    And Assert Date transaction filter is displayed correctly
    And Assert Categories transaction filter is displayed correctly
    And Assert Type transaction filter is displayed correctly
    And Assert Amount transaction filter is displayed correctly
    And Assert Tags transaction filter is displayed correctly
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
      | 5        |


  @SAVINGS_ACCOUNTS-TRANSACTIONS-DETAILS-TRANSACTION_CONFIRMATION_[MOB_ANDROID]
  Scenario Outline: SAVINGS_ACCOUNTS-TRANSACTIONS-DETAILS-TRANSACTION_CONFIRMATION_[MOB_ANDROID]
  #C70921

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear
    And Click on Product from Excel "<rowindex>" columnName "savings_account_iban" in My Products

    And Wait for first transaction to load
    And Assert Product page for product with name from Excel "<rowindex>" columnName "savings_account_name"
    And Assert element with class "android.widget.TextView" and has text "Transactions" is displayed
    And Assert list of element by id "nlb-item-row" is displayed
    And Assert Transaction filter button in Product

    When Click on first transaction
    And Wait element "Confirmation" by text
    And Assert buttons Get receipt and Send complaint are displayed in Transaction details
    And Click on button "Confirmation" in transaction details

    Then Assert element by complete id "com.google.android.apps.docs:id/projector_toolbar"
    And Go Back


    Examples:
      | rowindex |
      | 5        |


  @SAVINGS_ACCOUNTS-STATEMANTS-FILTER_[MOB_ANDROID]
  Scenario Outline: SAVINGS_ACCOUNTS-STATEMANTS-FILTER_[MOB_ANDROID]
  C70928

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear
    And Click on Product from Excel "<rowindex>" columnName "savings_account_iban" in My Products

    And Wait for first transaction to load
    And Assert Product page for product with name from Excel "<rowindex>" columnName "savings_account_name"
    And Assert element with class "android.widget.TextView" and has text "Transactions" is displayed
    #And Assert list of element by id "nlb-item-row" is displayed
    And Assert list of transactions is displayed correctly in Product
    And Assert Transaction filter button in Product
    And Assert list of element by id "nlb-cta-button" is displayed
    And Assert Statement button in Product details index "2"

    And Click on button in Product details "Statements"
    And Wait for Statements screen to load

    And Wait "10" seconds
    When Assert screen header is "Statements"
    And Assert back button in screen "Statements"
    And Assert Year filter for statements
    And Assert Year filter for statements has expected options
    And Select Year "2023" in statements filter
    And Wait for first statement to appear

    Then Assert first statement in list is from year "2023"
    And Assert statements in list are displayed correctly


    Examples:
      | rowindex |
      | 1        |


  @SAVINGS_ACCOUNTS-STATEMANTS-DOWNLOADS_[MOB_ANDROID]
  Scenario Outline: SAVINGS_ACCOUNTS-STATEMANTS-DOWNLOADS_[MOB_ANDROID]
  C70928

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear
    And Click on Product from Excel "<rowindex>" columnName "savings_account_iban" in My Products

    And Wait for first transaction to load
    And Assert Product page for product with name from Excel "<rowindex>" columnName "savings_account_name"
    And Assert element with class "android.widget.TextView" and has text "Transactions" is displayed
    #And Assert list of element by id "nlb-item-row" is displayed
    And Assert list of transactions is displayed correctly in Product
    And Assert Transaction filter button in Product
    And Assert list of element by id "nlb-cta-button" is displayed
    And Assert Statement button in Product details index "2"

    And Click on button in Product details "Statements"
    And Wait for Statements screen to load

    And Wait "10" seconds
    When Assert screen header is "Statements"
    And Assert back button in screen "Statements"
    And Assert Year filter for statements
    And Assert Year filter for statements has expected options
    And Select Year "2023" in statements filter
    And Wait for first statement to appear
    And Click on Download for first statement in statement list

    Then Assert element by complete id "com.google.android.apps.docs:id/projector_toolbar"
    And Go Back


    Examples:
      | rowindex |
      | 1        |


  @Savings_Accounts-Transactions-Overview_By_Different_Currencies_[MOB_ANDROID]
  Scenario Outline: Savings_Accounts-Transactions-Overview_By_Different_Currencies_[MOB_ANDROID]
    #C70916

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by id "nlb-product-details-primary-balance" to appear

    Then Swipe currencies to the right until you find currency "USD"
    And Click on element by id "nlb-product-details-primary-balance" and contains text "USD"
    And Wait for transactions of "USD" currencies to load in my products
    And Wait for element by id "nlb-currency" to appear
    And Assert list of element by resource id "nlb-currency" ends in "USD"
    And Swipe currencies to the right until you find currency "CAD"
    And Click on element by id "nlb-product-details-primary-balance" and contains text "CAD"
    And Wait for transactions of "CAD" currencies to load in my products
    And Wait for element by id "nlb-currency" to appear
    And Assert list of element by resource id "nlb-currency" ends in "CAD"
    And Swipe currencies to the right until you find currency "GBP"
    And Click on element by id "nlb-product-details-primary-balance" and contains text "GBP"
    And Wait for transactions of "GBP" currencies to load in my products
    And Wait for element by id "nlb-currency" to appear
    And Assert list of element by resource id "nlb-currency" ends in "GBP"



    Examples:
      | rowindex |
      | 1        |

  @Savings_Accounts-Transactions_List_[MOB_ANDROID]
  Scenario Outline: Savings_Accounts-Transactions_List_[MOB_ANDROID]
    #C70904

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Assert element "nlb-date" by id
    And Assert element "nlb-currency" by id
    And Assert element "nlb-title" by id
    And Assert element "nlb-amount" by id
    And Assert element "nlb-details" by id
    And Assert element "nlb-transaction-header-sum" by id
    And Assert element "nlb-transaction-header-sum" by id
    And Assert current month on page
    And Click on Filter button in my product
    And Wait for element by text "Date"
    And Click on element by text "Date"
    And Wait for element by text "Current month"
    And Click on element by text "Current month"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Date"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-title" to appear
    And Calculate sum of all transactions in transaction list and put in key "sumOfTransactions"
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by id "nlb-transaction-header-sum" to appear
    And Assert sum of monthly transactions is correct with key "sumOfTransactions"

    #And Assert there are more than "30" payments using id "nlb-title"

    Examples:
      | rowindex |
      | 4        |

  @Savings_Accounts-Details_[MOB_ANDROID]
  Scenario Outline: Savings_Accounts-Details_[MOB_ANDROID]
    #C70923

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by id "nlb-cta-button" to appear

    Then Assert element "nlb-header-card" by id
    And Assert element "nlb-product-details-primary-balance" by id
    And Assert element "nlb-product-details-secondary-balance" by id
    And Assert "Details" content description from view tag "View" is displayed
    And Assert element by text "Details"
    And Assert "Statements" content description from view tag "View" is displayed
    And Assert element by text "Statements"
    And Assert "Currency exchange" content description from view tag "View" is displayed
    And Assert element by text "Currency exchange"
    And Click "Details" content description from view tag "View"
    And Wait for element by text "Financial details"
    And Assert element by text "Current balance"
    And Assert element by text "Current balance" has first following sibling contains text "EUR"
    And Assert element by text "Booked balance"
    And Assert element by text "Booked balance" has first following sibling contains text "EUR"

    Examples:
      | rowindex |
      | 1        |


  @Savings_Accounts-Transactions-Details_[MOB_ANDROID]
  Scenario Outline: Savings_Accounts-Transactions-Details_[MOB_ANDROID]
    #C70920

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

    Then Assert element by contains text "Own account Transfer"
    And Assert element by contains text "Check data and choose"
    And Assert element by contains text "Debtor"
    #Changing debtor
    And Click on Debtor selector for payment
    And Wait for element by text "Select account"
    And Assert element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by text "Own account Transfer"
    #End of changing debtor
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
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "int_05" in txt file
    And Assert element by text "Payment date"
    And Swipe vertical
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 EUR"
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert element by text "Debtor"
    And Assert that text "First and last name / Company name" has first following sibling that contains from Excel "<rowindex>" columnName "user_name_short"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "savings_user_address_for_payment_review"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "savings_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "First and last name / Company name" has first following sibling that contains text from Excel "<rowindex>" columnName "user_name_short"
    And Assert that second text "Address" has first following sibling with text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    #And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Scroll down until element with text "Pay" is in view
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI2X"
    And Assert element by text "Payment"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "int_05"
    And Assert that text "Payment date" has first following sibling with current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"

    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"

    Then Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Scroll until element with text from txt file under key "int_05" is in view and click
    And Wait for element by text "Confirmation"
    And Assert element "nlb-date" by id
    And Assert element "nlb-currency" by id
    And Assert element "nlb-title" by id
    And Assert element "nlb-amount" by id
    And Assert element "nlb-details" by id
    And Assert element by text "Confirmation"
    And Assert element by text "Send message"
    And Assert element by contains text from excel "<rowindex>" columnName "user_name_short"
    And Assert element by contains text from excel "<rowindex>" columnName "user_street_short"
    And Assert element by contains text from excel "<rowindex>" columnName "user_city_short"
    And Assert element by text "Account number"
    And Assert element by contains text from excel "<rowindex>" columnName "personal_account_iban"
    And Assert element by text "Creditor Reference"
    And Assert element by text "NRC00"
    And Assert element by text "SWIFT BIC code"
    And Assert element by text "LJBASI20"
    And Assert element by text "Settlement date"
    And Assert element by text "Transaction ID"
    And Swipe vertical
    And Assert element by text "Add tag" is not displayed

    Examples:
      | rowindex |
      | 4        |
