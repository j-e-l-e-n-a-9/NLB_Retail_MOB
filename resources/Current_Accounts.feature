Feature: Current_Accounts


  @CURRENT_ACCOUNTS-TRANSACTIONS-FILTER_BY_TYPE_[MOB_ANDROID]
  Scenario Outline: CURRENT_ACCOUNTS-TRANSACTIONS-FILTER_BY_TYPE_[MOB_ANDROID]
  C70832

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear
    And Click on Product from Excel "<rowindex>" columnName "personal_account_iban" in My Products

    When Wait for first transaction to load
    And Assert Product page for product with name from Excel "<rowindex>" columnName "personal_account_name"
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
      | 5        |


  @CURRENT_ACCOUNTS-TRANSACTIONS-FILTER_BY_DATE-(options)_[MOB_ANDROID]
  Scenario Outline: CURRENT_ACCOUNTS-TRANSACTIONS-FILTER_BY_DATE-(options)_[MOB_ANDROID]
    #C70829
    #BUG Last Month filter daje lose datum

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear
    And Click on Product from Excel "<rowindex>" columnName "personal_account_iban" in My Products

    When Wait for first transaction to load
    And Assert Product page for product with name from Excel "<rowindex>" columnName "personal_account_name"
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



  @CURRENT_ACCOUNTS-TRANSACTIONS-FILTER_BY_DATE-(custom_date_range)_[MOB_ANDROID]
  Scenario Outline: CURRENT_ACCOUNTS-TRANSACTIONS-FILTER_BY_DATE-(custom_date_range)_[MOB_ANDROID]
  #C70830

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear
    And Click on Product from Excel "<rowindex>" columnName "personal_account_iban" in My Products

    And Wait for first transaction to load
    And Assert Product page for product with name from Excel "<rowindex>" columnName "personal_account_name"
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
    And Click on date in Calendar with year 2024 month 12 day 20 and assert that it is shown correctly
    And Assert button Cancel in Calendar is enabled
    And Assert button Confirm in Calendar is enabled
    And Click on button Confirm in Calendar
    And Assert From field in Date transactions filter has date year 2024 month 12 day 20
    #And Assert From field in Date transactions filter has day before yesterday date

    #to
    #         preset yesterday
    And Click on element by id "nlb-input-date-to-click-area"
    #And Click on yesterday date in Calendar and assert that it is shown correctly
    And Click on date in Calendar with year 2024 month 12 day 24 and assert that it is shown correctly
    And Assert button Cancel in Calendar is enabled
    And Assert button Confirm in Calendar is enabled
    And Click on button Confirm in Calendar
    #And Assert To field in Date transactions filter has yesterday date
    And Assert To field in Date transactions filter has date year 2024 month 12 day 24
    And Assert "Apply" button primary is enabled
    And Click on element by id "nlb-button-primary"
    And Wait first Transaction filter
    #And Assert subtitle of Transaction filter Date is correct for day before yesterday to yesterday
    And Assert subtitle of Transaction filter Date is correct for dates year 2024 month 12 day 20 and year 2024 month 12 day 24
    And Assert "Apply" button primary is enabled
    And Assert "Clear filters" button alternate is enabled
    And Click on element by id "nlb-button-primary"
    And Wait for first transaction to load after filter

    #Then Assert transactions dates are from day before yesterday to yesterday
    Then Assert transactions dates are between dates year 2024 month 12 day 20 and year 2024 month 12 day 24

    Examples:
      | rowindex |
      | 5        |


  @CURRENT_ACCOUNTS-TRANSACTIONS-FILTER_BY_TAGS_[MOB_ANDROID]
  Scenario Outline: CURRENT_ACCOUNTS-TRANSACTIONS-FILTER_BY_TAGS_[MOB_ANDROID]
  #C70834
  #Treba da postoje bar tri transakcije sa tagovima na racunu

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear
    And Click on Product from Excel "<rowindex>" columnName "personal_account_iban" in My Products

    And Wait for first transaction to load
    And Assert Product page for product with name from Excel "<rowindex>" columnName "personal_account_name"
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

    When Click on element by text "Tags"
    And Wait for element by id "nlb-checkbox" to appear
    And Remove keyboard
    And Assert screen header is "Select tags"
    And Assert back button in screen "Select tags"
    And Assert Tag filter list search field
    And Assert List of Tag filters
    And Assert "Apply" button primary is enabled
    #1 tag selected
    And Enter text from Excel "<rowindex>" columnName "tag1" to Tag filter search field and assert search result is correct
    And Assert none of the tag filters are currently selected
    And Click on Tag filter from Excel "<rowindex>" columnName "tag1" and assert that it is selected
    And Assert "Apply" button primary is enabled
    And Click on element by id "nlb-button-primary"
    And Wait first Transaction filter

    And Assert subtitle of Transaction filter Tag is from Excel "<rowindex>" columnName "tag1"
    And Assert "Apply" button primary is enabled
    And Assert "Clear filters" button alternate is enabled
    And Click on element by id "nlb-button-primary"
    And Wait for first transaction to load after filter

    Then Assert first few transactions have tag from Excel "<rowindex>" columnName "tag1"
    #more than 1 selected tag
    And Click Transaction filter button in Product
    And Wait first Transaction filter
    And Assert subtitle of Transaction filter Tag is from Excel "<rowindex>" columnName "tag1"
    And Click on element by text "Tags"
    And Wait for element by id "nlb-checkbox" to appear
    And Remove keyboard
    And Assert "Apply" button primary is enabled
    And Enter text from Excel "<rowindex>" columnName "tag2" to Tag filter search field and assert search result is correct
    And Click on Tag filter from Excel "<rowindex>" columnName "tag2" and assert that it is selected
    And Assert "Apply" button primary is enabled
    And Click on element by id "nlb-button-primary"
    And Wait first Transaction filter
    And Assert subtitle of Transaction filter Tag is from Excel "<rowindex>" columnName "tag1" and columnName "tag2"
    And Assert "Apply" button primary is enabled
    And Assert "Clear filters" button alternate is enabled
    And Click on element by id "nlb-button-primary"
    And Wait for first transaction to load after filter
    And Assert first few transactions have tags from Excel "<rowindex>" columnName "tag1" or columnName "tag2"


    Examples:
      | rowindex |
      | 5        |


  @CURRENT_ACCOUNTS-TRANSACTIONS-OVERVIEW_BY_DIFFERENT_CURRENCIES_[MOB_ANDROID]_1
  Scenario Outline: CURRENT_ACCOUNTS-TRANSACTIONS-OVERVIEW_BY_DIFFERENT_CURRENCIES_[MOB_ANDROID]_1
  #C70840 AUD

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear
    And Click on Product from Excel "<rowindex>" columnName "personal_account_iban" in My Products
    And Wait for first transaction to load
    And Assert Product page for product with name from Excel "<rowindex>" columnName "personal_account_name"
    And Assert Product page for product with name from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert "Back" content description from view tag "View" is displayed

    When Assert currency card with currency "EUR" in product has correct "Current balance" and "Available balance"
    And Assert transactions in Product details are in currency "EUR"
    And Click on currency filter "EUR"
    And Wait for first transaction to load
    And Assert transactions in Product details are in currency "EUR"
    #AUD
    And Click on currency filter "AUD"
    And Wait for first transaction with "AUD" currency

    Then Assert currency card with currency "AUD" in product has correct "Current balance" and "Converted value"
    And Assert transactions in Product details are in currency "AUD"


    Examples:
      | rowindex |
      | 4        |


  @CURRENT_ACCOUNTS-TRANSACTIONS-OVERVIEW_BY_DIFFERENT_CURRENCIES_[MOB_ANDROID]_2
  Scenario Outline: CURRENT_ACCOUNTS-TRANSACTIONS-OVERVIEW_BY_DIFFERENT_CURRENCIES_[MOB_ANDROID]_2
  #C70840 CHF

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear
    And Click on Product from Excel "<rowindex>" columnName "personal_account_iban" in My Products
    And Wait for first transaction to load
    And Assert Product page for product with name from Excel "<rowindex>" columnName "personal_account_name"
    And Assert Product page for product with name from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert "Back" content description from view tag "View" is displayed

    When Assert currency card with currency "EUR" in product has correct "Current balance" and "Available balance"
    And Assert transactions in Product details are in currency "EUR"
    And Click on currency filter "EUR"
    And Wait for first transaction to load
    And Assert transactions in Product details are in currency "EUR"
    #CHF
    And Click on currency filter "CHF"
    And Wait for first transaction with "CHF" currency

    Then Assert currency card with currency "CHF" in product has correct "Current balance" and "Converted value"
    And Assert transactions in Product details are in currency "CHF"


    Examples:
      | rowindex |
      | 1        |


  @CURRENT_ACCOUNTS-TRANSACTIONS-OVERVIEW_BY_DIFFERENT_CURRENCIES_[MOB_ANDROID]_4
  Scenario Outline: CURRENT_ACCOUNTS-TRANSACTIONS-OVERVIEW_BY_DIFFERENT_CURRENCIES_[MOB_ANDROID]_4
  #C70840 HUF

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear
    And Click on Product from Excel "<rowindex>" columnName "personal_account_iban" in My Products
    And Wait for first transaction to load
    And Assert Product page for product with name from Excel "<rowindex>" columnName "personal_account_name"
    And Assert Product page for product with name from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert "Back" content description from view tag "View" is displayed

    When Assert currency card with currency "EUR" in product has correct "Current balance" and "Available balance"
    And Assert transactions in Product details are in currency "EUR"
    And Click on currency filter "EUR"
    And Wait for first transaction to load
    And Assert transactions in Product details are in currency "EUR"
    #HUF
    And Click on currency filter "HUF"
    And Wait for first transaction with "HUF" currency

    Then Assert currency card with currency "HUF" in product has correct "Current balance" and "Converted value"
    And Assert transactions in Product details are in currency "HUF"


    Examples:
      | rowindex |
      | 3        |


  @CURRENT_ACCOUNTS-TRANSACTIONS-OVERVIEW_BY_DIFFERENT_CURRENCIES_[MOB_ANDROID]_5
  Scenario Outline: CURRENT_ACCOUNTS-TRANSACTIONS-OVERVIEW_BY_DIFFERENT_CURRENCIES_[MOB_ANDROID]_5
  C70840 USD

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear
    And Click on Product from Excel "<rowindex>" columnName "personal_account_iban" in My Products
    And Wait for first transaction to load
    And Assert Product page for product with name from Excel "<rowindex>" columnName "personal_account_name"
    And Assert Product page for product with name from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert "Back" content description from view tag "View" is displayed

    When Assert currency card with currency "EUR" in product has correct "Current balance" and "Available balance"
    And Assert transactions in Product details are in currency "EUR"
    And Click on currency filter "EUR"
    And Wait for first transaction to load
    And Assert transactions in Product details are in currency "EUR"
    #USD
    And Click on currency filter "USD"
    And Wait for first transaction with "USD" currency

    Then Assert currency card with currency "USD" in product has correct "Current balance" and "Converted value"
    And Assert transactions in Product details are in currency "USD"


    Examples:
      | rowindex |
      | 1        |


  @CURRENT_ACCOUNTS-TRANSACTIONS-DETAILS-ADD_TAG_[MOB_ANDROID]
  Scenario Outline: CURRENT_ACCOUNTS-TRANSACTIONS-DETAILS-ADD_TAG_[MOB_ANDROID]
  #C70841,C71443

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear
    And Click on Product from Excel "<rowindex>" columnName "personal_account_iban" in My Products

    And Wait for first transaction to load
    And Assert Product page for product with name from Excel "<rowindex>" columnName "personal_account_name"
    And Assert element with class "android.widget.TextView" and has text "Transactions" is displayed
    And Assert list of element by id "nlb-item-row" is displayed
    And Assert Transaction filter button in Product

    When Click on first transaction
    #CURRENT ACCOUNTS - TRANSACTIONS - DETAILS - ADD TAG - NEW TAG_[MOB_ANDROID]
    #new tag
    And Scroll to element by text "Add tag"
    And Click on element by text "Add tag"
    And Wait Transaction tags label in Add tag screen

    And Assert screen header is "Add tag"
    And Assert back button in screen "Add tag"
    And Assert Tag filter list search field
    And Assert transaction tags label is correct
    And Assert My tags label is correct
    And Assert list of tags is displayed in add tag page
    And Assert tag in list is displayed correctly
    And Enter new tag from Excel "<rowindex>" columnName "new_tag"
    And Assert new tag from Excel "<rowindex>" columnName "new_tag" is shown in add tag screen
    And Click on back button in screen "Add tag"
    And Wait for tags label in transaction details
    Then Assert tag from Excel "<rowindex>" columnName "new_tag" is shown in transaction details
    When Scroll to element by text "Add tag"
    #CURRENT ACCOUNTS - TRANSACTIONS - DETAILS - ADD TAG - EDIT TAG_[MOB_ANDROID]
    #edit tag
    And Click on element by text "Add tag"
    And Wait Transaction tags label in Add tag screen
    And Assert screen header is "Add tag"
    And Assert back button in screen "Add tag"
    And Assert Tag filter list search field
    And Assert transaction tags label is correct
    And Assert My tags label is correct
    And Assert list of tags is displayed in add tag page
    And Assert tag in list is displayed correctly

    And Select first recommended tag from the list and remember it under key "selected_existing_tag"
    And Assert selected tag under key "selected_existing_tag" is shown in add tag screen
    And Click on back button in screen "Add tag"
    And Wait for tags label in transaction details
    Then Assert selected tag under key "selected_existing_tag" is shown in transaction details
    When Scroll to element by text "Add tag"

    #delete tag
    #CURRENT ACCOUNTS - TRANSACTIONS - DETAILS - ADD TAG - DELITE TAG_[MOB_ANDROID]
    And Click on element by text "Add tag"
    And Wait Transaction tags label in Add tag screen
    And Assert screen header is "Add tag"
    And Assert back button in screen "Add tag"
    And Assert Tag filter list search field
    And Assert transaction tags label is correct
    And Assert My tags label is correct
    And Assert list of tags is displayed in add tag page
    And Assert tag in list is displayed correctly

    And Remove tag from Excel "<rowindex>" columnName "new_tag" in Add tag screen
    And Remove tag under key "selected_existing_tag" in Add tag screen
    And Click on back button in screen "Add tag"
    And Wait for Add tag label in transaction details
    And Scroll to element by text "Add tag"
    Then Assert tag from Excel "<rowindex>" columnName "new_tag" is not displayed in transaction details
    And Assert tag under key "selected_existing_tag" is not displayed in transaction details


    Examples:
      | rowindex |
      | 5        |


  @CURRENT_ACCOUNTS-TRANSACTIONS-DETAILS-TRANSACTION_CONFIRMATION_[MOB_ANDROID]
  Scenario Outline: CURRENT_ACCOUNTS-TRANSACTIONS-DETAILS-TRANSACTION_CONFIRMATION_[MOB_ANDROID]
  #C70845

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear
    And Click on Product from Excel "<rowindex>" columnName "personal_account_iban" in My Products

    And Wait for first transaction to load
    And Assert Product page for product with name from Excel "<rowindex>" columnName "personal_account_name"
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


  @CURRENT_ACCOUNTS-STATEMANTS-FILTER_[MOB_ANDROID]
  Scenario Outline: CURRENT_ACCOUNTS-STATEMANTS-FILTER_[MOB_ANDROID]
  C70854

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear
    And Click on Product from Excel "<rowindex>" columnName "personal_account_iban" in My Products

    And Wait for first transaction to load
    And Assert Product page for product with name from Excel "<rowindex>" columnName "personal_account_name"
    And Assert element with class "android.widget.TextView" and has text "Transactions" is displayed
    #And Assert list of element by id "nlb-item-row" is displayed
    And Assert list of transactions is displayed correctly in Product
    And Assert Transaction filter button in Product
    And Assert list of element by id "nlb-cta-button" is displayed
    And Assert Statement button in Product details
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


  @CURRENT_ACCOUNTS-STATEMANTS-DOWNLOADS_[MOB_ANDROID]
  Scenario Outline: CURRENT_ACCOUNTS-STATEMANTS-DOWNLOADS_[MOB_ANDROID]
  C70853

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear
    And Click on Product from Excel "<rowindex>" columnName "personal_account_iban" in My Products

    And Wait for first transaction to load
    And Assert Product page for product with name from Excel "<rowindex>" columnName "personal_account_name"
    And Assert element with class "android.widget.TextView" and has text "Transactions" is displayed
    #And Assert list of element by id "nlb-item-row" is displayed
    And Assert list of transactions is displayed correctly in Product
    And Assert Transaction filter button in Product
    And Assert list of element by id "nlb-cta-button" is displayed
    And Assert Statement button in Product details
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



  @Current_Accounts-Details-Financial_Details_[MOB_ANDROID]
  Scenario Outline: Current_Accounts-Details-Financial_Details_[MOB_ANDROID]
    #C70848

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click on element by text "Details"
    And Wait for element by id "nlb-product-details-overdraft" to appear

    Then Assert element by text "Financial details"
    And Assert element by text "Overdraft"
    And Assert element by id "nlb-product-details-overdraft" ends in "EUR"
    And Scroll down until element with text "Currency exchange" is in view
    And Assert element by text "Overdraft expiration date"
    And Assert text "until changed" in element id "nlb-product-details-overdraft-expiration-date"
    And Assert element by text "Interest rate"
    And Assert element by id "nlb-product-details-interest-rate" ends in "%"
    #And Swipe vertical
    And Assert element by id "nlb-button-text" that has descendant text "Currency exchange"
    And Assert element by id "nlb-button-text" that has descendant text "Change overdraft"
    And Assert element by id "nlb-product-details-interest-rate" with regex "^(?:(?:0|[1-9]\d{0,2})(?:.\d{3})*),\d{4} [%]{1}$"
    And Assert element by id "nlb-product-details-overdraft-interest-rate" with regex "^(?:(?:0|[1-9]\d{0,2})(?:.\d{3})*),\d{4} [%]{1}$"
    And Assert element by id "nlb-product-details-unauthorized-overdraft-interest-rate" with regex "^(?:(?:0|[1-9]\d{0,2})(?:.\d{3})*),\d{4} [%]{1}$"
    And Click on element by text "Currency exchange"
    And Wait for element by text "Check exchange rates"
    And Assert element by text "Check exchange rates"
    And Click "Back" content description from view tag "View"
    And Click on element by text "Yes"
    And Wait for element by id "nlb-product-details-overdraft" to appear
    And Click on element by text "Change overdraft"
    And Assert element by text "Basic info about overdraft"


    Examples:
      | rowindex |
      |        4 |

  @Current_Accounts-Details-Bundle_Service_[MOB_ANDROID]
  Scenario Outline: Current_Accounts-Details-Bundle_Service_[MOB_ANDROID]
    #C70849

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click on element by text "Details"
    And Wait for element by id "nlb-product-details-overdraft" to appear
    And Scroll down until element with text "Change bundle" is in view

    Then Assert element by text "Bundle services available"
    And Click on following sibling of text "Bundle services available"
    And Wait for element by text "Number of free Direct Debits (SEPA DD)"
    And Assert element by text "Bundle services available"
    And Assert element by text "Direct Debits (SEPA DD)"
    And Assert element by text "Number of free Direct Debits (SEPA DD)"
    And Assert element by text "UPN payment"
    And Assert element by text "Number of free UPN payments at NLB branch or NLB ATM"
    And Assert element by text "UPN e-payment"
    And Assert element by text "Number of free UPN payments in NLB Klik"
    And Assert element by text "ATM withdrawals"
    And Assert element by text "Number of free cash withdrawals at ATMs of other banks in Slovenia"
    And Click on element by text "Close"
    And Assert element by text "Direct Debits (SEPA DD)"
    And Assert text "unlimited" in element id "nlb-product-details-bundled-sdds"
    And Assert element by text "UPN payment"
    And Assert text "0/0" in element id "nlb-product-details-bundled-upns"
    And Assert element by text "UPN e-payment"
    And Assert text "unlimited" in element id "nlb-product-details-bundled-e-upns"
    And Assert element by text "ATM withdrawals"
    And Assert text "unlimited" in element id "nlb-product-details-bundled-counter-upns"
    And Swipe vertical short
    And Assert element by id "nlb-button-text" that has descendant text "Change bundle"
    And Click on element by text "Change bundle"
    And Assert element by text "Compare bundles and select the right one for you"
    And Assert element by text "Paket Premium"


    Examples:
      | rowindex |
      |        4 |

  @Current_Accounts-Details-Account_Details_[MOB_ANDROID]
  Scenario Outline: Current_Accounts-Details-Account_Details_[MOB_ANDROID]
    #C70850

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click on element by text "Details"
    And Wait for element by id "nlb-product-details-overdraft" to appear
    And Scroll down until element with text "Document archive" is in view

    Then Assert element by text "Account details"
    And Click on following sibling of text "Account details"
    And Assert element by text "Account details data have been copied to clipboard."
    And Assert value from clipboard is the same as from Excel "<rowindex>" columnName "personal_account_details"
    And Assert element by text "Account type"
    And Assert text "Current account" in element id "nlb-product-details-account-type"
    And Assert element by text "Account owner"
    And Assert text from excel "<rowindex>" columnName "personal_account_details_owner" in element by id "nlb-product-details-account-owner"
    And Assert element by text "Account number"
    And Assert text from excel "<rowindex>" columnName "personal_account_iban" in element by id "nlb-product-details-account-number"
    And Assert element by text "BIC"
    And Assert text from excel "<rowindex>" columnName "personal_account_BIC" in element by id "nlb-product-details-bic"
    And Assert element by id "nlb-button-text" that has descendant text "Document archive"
    And Click on element by text "Document archive"
    And Wait for element by id "nlb-icon-button" to appear
    And Assert element by text "No documents for selected filters."

    Examples:
      | rowindex |
      |        4 |

  @Current_Accounts-Details-Debit_Card_[MOB_ANDROID]
  Scenario Outline: Current_Accounts-Details-Debit_Card_[MOB_ANDROID]
    #C70851
    #RET-7679

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click on element by text "Details"
    And Wait for element by id "nlb-product-details-overdraft" to appear
    And Scroll down until element with text "Change settings" is in view

    Then Assert element by text "Maestro Debit Classic"
    And Assert "Maestro Debit Classic" content description from tag "ImageView" is displayed
    And Assert text from excel "<rowindex>" columnName "personal_account_debit_card_number" in element by id "nlb-card-number"
    And Assert text from excel "<rowindex>" columnName "personal_account_debit_card_expiry_date" in element by id "nlb-expiry-date"
    And Assert text from excel "<rowindex>" columnName "personal_account_debit_card_owner" in element by id "nlb-owner-name"
    And Assert element by id "nlb-button-text" that has descendant text "Change settings"
    And Click on element by text "Change settings"
    And Assert element by text "Card settings"
    #And Assert element by text from excel "<rowindex>" columnName "personal_account_debit_card_expiry_date"
    #And Assert element by contains text from excel "<rowindex>" columnName "personal_account_debit_card_owner"
    And Assert element "nlb-card-settings-lock-card-switch" by id
    And Assert element "nlb-card-settings-atm-withdrawals-switch" by id
    And Assert element "nlb-card-settings-online-payments-switch" by id
    And Assert element "nlb-card-settings-payments-abroad-switch" by id
    And Assert element by contains text "Lock card"
    And Assert element by contains text "Card will be locked"
    And Assert element by contains text "ATM withdrawals"
    And Assert element by contains text "Disable ATM withdrawals"
    And Assert element by contains text "Online payments"
    And Assert element by contains text "Disable online payments"
    And Assert element by contains text "Payments abroad"
    And Assert element by contains text "Disable payments abroad"
    And Assert element by contains text "Card SMS alarm"
    And Assert element by contains text "Enable SMS alerts"
    And Assert element by contains text "Block card"
    And Assert element by contains text "Card will be blocked"

    Examples:
      | rowindex |
      |        4 |


  @Current_Accounts-Transactions-List_[MOB_ANDROID]
  Scenario Outline: Current_Accounts-Transactions-List_[MOB_ANDROID]
    #C70827

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    #When Click "My Products" content description from view tag "View"
    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Assert element "nlb-date" by id
    And Assert element "nlb-currency" by id
    And Assert element "nlb-title" by id
    And Assert element "nlb-amount" by id
    #And Assert element "nlb-details" by id
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
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-transaction-header-sum" to appear
    And Assert sum of monthly transactions is correct with key "sumOfTransactions"

    Examples:
      | rowindex |
      |        4 |

  @Current_Accounts-Details_[MOB_ANDROID]
  Scenario Outline: Current_Accounts-Details_[MOB_ANDROID]
    #C70847

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-cta-button" to appear

    Then Assert element "nlb-header-card" by id
    And Assert element "nlb-product-details-primary-balance" by id
    And Assert element "nlb-product-details-secondary-balance" by id
    And Assert "Card settings" content description from view tag "View" is displayed
    And Assert element by text "Card settings"
    And Assert "Details" content description from view tag "View" is displayed
    And Assert element by text "Details"
    And Assert "Statements" content description from view tag "View" is displayed
    And Assert element by text "Statements"
    And Assert "Currency exchange" content description from view tag "View" is displayed
    And Assert element by text "Currency exchange"
    And Assert element by text "Change overdraft"
    And Click "Details" content description from view tag "View"
    And Wait for element by text "Financial details"
    And Assert element by text "Current balance"
    And Assert element by text "Current balance" has first following sibling contains text "EUR"
    And Assert element by text "Available balance"
    And Assert element by text "Available balance" has first following sibling contains text "EUR"


    Examples:
      | rowindex |
      |        4 |

  @Current_Accounts-Debit_Card_Settings-Enabled/Disabled_Lock_Card_Option_[MOB_ANDROID]
  Scenario Outline: Current_Accounts-Debit_Card_Settings-Enabled/Disabled_Lock_Card_Option_[MOB_ANDROID]
    #C75539

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click on element by text "Card settings"
    And Wait for element by id "nlb-card-settings-lock-card-switch" to appear

    Then Assert element by id "nlb-card-settings-lock-card-switch" is checked "false"
    And Assert element by id "nlb-card-settings-atm-withdrawals-switch" is checked "true"
    And Assert element by id "nlb-card-settings-online-payments-switch" is checked "true"
    And Assert element by id "nlb-card-settings-payments-abroad-switch" is checked "true"
    And Click on element by id "nlb-card-settings-lock-card-switch"
    And Wait for element by text "Confirm"
    And Click on element by text "Confirm"
    And Wait for element by id "nlb-card-settings-lock-card-switch" to appear
    And Assert element by id "nlb-card-settings-lock-card-switch" is checked "true"
    And Assert element by id "nlb-card-settings-atm-withdrawals-switch" is checked "false"
    And Assert element by id "nlb-card-settings-online-payments-switch" is checked "false"
    And Assert element by id "nlb-card-settings-payments-abroad-switch" is checked "false"
    And Click on element by id "nlb-card-settings-lock-card-switch"
    And Wait for element by id "nlb-card-settings-lock-card-switch" to appear
    And Assert element by id "nlb-card-settings-lock-card-switch" is checked "false"
    And Assert element by id "nlb-card-settings-atm-withdrawals-switch" is checked "true"
    And Assert element by id "nlb-card-settings-online-payments-switch" is checked "true"
    And Assert element by id "nlb-card-settings-payments-abroad-switch" is checked "true"

    Examples:
      | rowindex |
      |        4 |

  @Current_Accounts-Debit_Card_Settings-Enabled/Disabled_SMS_Card_Alarm_Option_[MOB_ANDROID]
  Scenario Outline: Current_Accounts-Debit_Card_Settings-Enabled/Disabled_SMS_Card_Alarm_Option_[MOB_ANDROID]
    #C75543
    #TODO Nije jos zavrsen ovaj deo u aplikaciji

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click on element by text "Card Settings"
    And Wait for element by id "nlb-card-settings-lock-card-switch" to appear

    Then Assert Card SMS Alarm is "Turned off"
    And Click on element by text "Card SMS Alarm"
    And Wait for element by id "nlb-sms-alarm-settings-container" to appear
    And Assert element by text "For each payment made with your payment card you will recive SMS to your mobile number."
    And Assert element by text "By enabling you will send SMS alarm activation request. Once the service is activated you will receive a message in your NLB Klik inbox."
    And Assert element by text "You’ll be charged for this setting in line with your bundle benefits."
    And Click on element by text "Mobile number not correct?"
    And Assert element by text "If your mobile number needs to be updated contact your bank advisor through Video call or visit our branch."
    And Click on element by text "Cancel"
    And Wait for element by text "Enable"
    And Click on element by text "Enable"
    And Assert element by text "SMS alarm for your card will be turned off immediately. You’ll be still charged for this feature in current month - in line with your bundle benefits."


    Examples:
      | rowindex |
      |        4 |

  @Current_Accounts-Transactions-Filter_By_Categories_[MOB_ANDROID]
  Scenario Outline: Current_Accounts-Transactions-Filter_By_Categories_[MOB_ANDROID]
    #C70831

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear
    And Click on Product from Excel "<rowindex>" columnName "personal_account_iban" in My Products

    When Wait for first transaction to load
    And Click Transaction filter button in Product
    And Wait for element by text "Categories"
    And Click on element by text "Categories"
    And Wait for element by text "Dom"
    And Click on element by text "Dom"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Categories"
    And Assert element by text "Categories" has first following sibling "Dom"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-title" to appear

    Then Assert category filter is working correctly for category "Dom"



    Examples:
      | rowindex |
      |        4 |

  @Current_Accounts-Transactions-Filter_By_Amount_[MOB_ANDROID]
  Scenario Outline: Current_Accounts-Transactions-Filter_By_Amount_[MOB_ANDROID]
    #C70833

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear
    And Click on Product from Excel "<rowindex>" columnName "personal_account_iban" in My Products

    When Wait for first transaction to load
    And Click Transaction filter button in Product
    And Wait for element by text "Payment amount"
    And Click on element by text "Payment amount"
    And Wait for element by text "From"
    And Enter text "500" into input field "From" in amount filter
    And Enter text "1000" into input field "To" in amount filter
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Date"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-title" to appear

    Then Assert filtered amounts have values between "500" and "1000"When Wait for first transaction to load
    And Click Transaction filter button in Product
    And Wait for element by text "Payment amount"
    And Click on element by text "Payment amount"
    And Wait for element by text "From"
    And Enter text "500" into input field "From" in amount filter
    And Enter text "1000" into input field "To" in amount filter
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Date"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-title" to appear

    Then Assert filtered amounts have values between "500" and "1000"


    Examples:
      | rowindex |
      |        4 |

  @Current_Accounts-Transactions-Details_[MOB_ANDROID]
  Scenario Outline: Current_Accounts-Transactions-Details_[MOB_ANDROID]
    #C70844

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
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "savings_user_name_for_payment_review"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "savings_user_address_for_payment_review"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "savings_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_review"
    And Assert that second text "Address" has first following sibling with text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    #And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Swipe vertical
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI2X"
    And Assert element by text "Payment"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "int_05"
    And Assert that text "Payment date" has first following sibling with current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"

    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"

    Then Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
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
    And Assert element by text "Creditor"
    And Assert that text "Name and address" has first following sibling that contains from Excel "<rowindex>" columnName "user_name_short"
    And Assert that text "Name and address" has first following sibling that contains from Excel "<rowindex>" columnName "user_street_short"
    And Assert that text "Name and address" has first following sibling that contains from Excel "<rowindex>" columnName "user_city_short"
    And Assert that text "Name and address" has first following sibling that contains text "SI"
    And Assert element by text "Account number"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "savings_account_iban"
    And Assert element by text "Creditor Reference"
    And Assert that text "Creditor Reference" has first following sibling that contains text "NRC00"
    And Assert that text "SWIFT BIC code" has first following sibling that contains text "LJBASI20"
    And Assert element by text "Settlement date"
    And Assert element by text "Transaction ID"
    And Swipe vertical
    And Assert element by text "Add tag"

    Examples:
      | rowindex |
      | 4        |

  @Current_Accounts-Transactions-Filter-Multiple_Filter_[MOB_ANDROID]
  Scenario Outline: Current_Accounts-Transactions-Filter-Multiple_Filter_[MOB_ANDROID]
    #C70835

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear
    And Click on Product from Excel "<rowindex>" columnName "personal_account_iban" in My Products

    When Wait for first transaction to load
    And Click Transaction filter button in Product
    And Wait for element by text "Payment amount"
    And Click on element by text "Date"
    And Wait for element by text "Last month"
    And Click on element by text "Last month"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Type"
    And Click on element by text "Type"
    And Wait for element by text "Outgoing transactions"
    And Click on element by text "Outgoing transactions"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount"
    And Click on element by text "Payment amount"
    And Wait for element by text "From"
    And Enter text "100" into input field "From" in amount filter
    And Enter text "1000" into input field "To" in amount filter
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Date"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-title" to appear
    And Click on first element by id "nlb-title"
    And Wait for element by text "Creditor"
    And Click on edit button to change category
    And Change category to "Prenosi"
    And Swipe vertical
    And Click on element by text "Add tag"
    And Wait for element by text "#test"
    And Click on element by text "#test"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Creditor"
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-title" to appear


    Examples:
      | rowindex |
      | 4        |