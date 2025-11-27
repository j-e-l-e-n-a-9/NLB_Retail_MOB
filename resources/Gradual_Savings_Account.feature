Feature: Gradual_Savings_Account

  @Gradual_Savings_Accounts-Details-Financial_Details_[MOB_ANDROID]
  Scenario Outline: Gradual_Savings_Accounts-Details-Financial_Details_[MOB_ANDROID]
    #C70994

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "gradual_savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "gradual_savings_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click on element by text "Details"
    And Wait for element by id "nlb-interest-rate" to appear

    Then Assert element by text "Financial details"
    And Assert element by text "Interest rate"
    And Assert element by id "nlb-interest-rate" ends in "%"
    And Assert element by text "Accrued interest"
    And Assert element by id "nlb-accrued-interest" ends in "EUR"


    Examples:
      | rowindex |
      |        4 |

  @Gradual_Savings_Accounts-Details-Account_Details_[MOB_ANDROID]
  Scenario Outline: Gradual_Savings_Accounts-Details-Account_Details_[MOB_ANDROID]
    #C70995

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "gradual_savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "gradual_savings_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click on element by text "Details"
    And Wait for element by id "nlb-interest-rate" to appear

    Then Assert element by text "Account details"
    And Assert element by text "Account type"
    And Assert text "Savings" in element id "nlb-account-type"
    And Assert element by text "Account owner"
    And Assert element by text from excel "<rowindex>" columnName "user_name_short" is contained in element by id "nlb-account-owner"
    And Assert element by text "Account number"
    And Assert text from excel "<rowindex>" columnName "gradual_savings_account_iban" in element by id "nlb-account-number"
    And Assert element by text "Purpose"
    And Assert text "VARČEVANJE NBO" in element id "nlb-purpose"
    And Assert element by text "Opening date"
    And Assert text from excel "<rowindex>" columnName "gradual_savings_account_details_opening_date" in element by id "nlb-opening-date"
    And Assert element by text "Expiration date"
    And Assert text from excel "<rowindex>" columnName "gradual_savings_account_details_expiration_date" in element by id "nlb-expiration-date"
    And Assert element by id "nlb-button-text" that has descendant text "Document archive"
    And Click on element by text "Document archive"
    And Assert element by text "No documents for selected filters."

    Examples:
      | rowindex |
      |        5 |


  @GRADUAL_SEVINGS_ACCOUNTS-TRANSACTIONS-FILTER_BY_DATE-(custom_date_range)_[MOB_ANDROID]
  Scenario Outline: GRADUAL_SEVINGS_ACCOUNTS-TRANSACTIONS-FILTER_BY_DATE-(custom_date_range)_[MOB_ANDROID]
  C70906

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear
    And Click on Product from Excel "<rowindex>" columnName "gradual_savings_account_iban" in My Products

    And Wait for first transaction to load
    And Assert Product page for product with name from Excel "<rowindex>" columnName "gradual_savings_account_name"
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
    And Click on date in Calendar with year 2024 month 8 day 12 and assert that it is shown correctly
    And Assert button Cancel in Calendar is enabled
    And Assert button Confirm in Calendar is enabled
    And Click on button Confirm in Calendar
    And Assert From field in Date transactions filter has date year 2024 month 8 day 12
    #And Assert From field in Date transactions filter has day before yesterday date

    #to
    #         preset yesterday
    And Click on element by id "nlb-input-date-to-click-area"
    #And Click on yesterday date in Calendar and assert that it is shown correctly
    And Click on date in Calendar with year 2024 month 8 day 15 and assert that it is shown correctly
    And Assert button Cancel in Calendar is enabled
    And Assert button Confirm in Calendar is enabled
    And Click on button Confirm in Calendar
    #And Assert To field in Date transactions filter has yesterday date
    And Assert To field in Date transactions filter has date year 2024 month 8 day 15
    And Assert "Apply" button primary is enabled
    And Click on element by id "nlb-button-primary"
    And Wait first Transaction filter
    #And Assert subtitle of Transaction filter Date is correct for day before yesterday to yesterday
    And Assert subtitle of Transaction filter Date is correct for dates year 2024 month 8 day 12 and year 2024 month 8 day 15
    And Assert "Apply" button primary is enabled
    And Assert "Clear filters" button alternate is enabled
    And Click on element by id "nlb-button-primary"
    And Wait for first transaction to load after filter

    #Then Assert transactions dates are from day before yesterday to yesterday
    Then Assert transactions dates are between dates year 2024 month 8 day 12 and year 2024 month 8 day 15

    Examples:
      | rowindex |
      | 5        |


  @GRADUAL_SEVINGS_ACCOUNTS-TRANSACTIONS-FILTER_BY_DATE-(custom_date_range)-invalid_[MOB_ANDROID]
  Scenario Outline: GRADUAL_SEVINGS_ACCOUNTS-TRANSACTIONS-FILTER_BY_DATE-(custom_date_range)-invalid_[MOB_ANDROID]
  C70977

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear
    And Click on Product from Excel "<rowindex>" columnName "gradual_savings_account_iban" in My Products

    And Wait for first transaction to load
    And Assert Product page for product with name from Excel "<rowindex>" columnName "gradual_savings_account_name"
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


  @GRADUAL_SEVINGS_ACCOUNTS-TRANSACTIONS-DETAILS-TRANSACTION_CONFIRMATION_[MOB_ANDROID]
  Scenario Outline: GRADUAL_SEVINGS_ACCOUNTS-TRANSACTIONS-DETAILS-TRANSACTION_CONFIRMATION_[MOB_ANDROID]
  #C70991

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear
    And Click on Product from Excel "<rowindex>" columnName "gradual_savings_account_iban" in My Products

    And Wait for first transaction to load
    And Assert Product page for product with name from Excel "<rowindex>" columnName "gradual_savings_account_name"
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


  @GRADUAL_SAVINGS_ACCOUNTS-STATEMANTS-FILTER_[MOB_ANDROID]
  Scenario Outline: GRADUAL_SAVINGS_ACCOUNTS-STATEMANTS-FILTER_[MOB_ANDROID]
  C70998

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear
    And Click on Product from Excel "<rowindex>" columnName "gradual_savings_account_iban" in My Products

    #And Wait for first transaction to load
    And Assert Product page for product with name from Excel "<rowindex>" columnName "gradual_savings_account_name"
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


  @GRADUAL_SAVINGS_ACCOUNTS-STATEMANTS-DOWNLOADS_[MOB_ANDROID]
  Scenario Outline: GRADUAL_SAVINGS_ACCOUNTS-STATEMANTS-DOWNLOADS_[MOB_ANDROID]
  #C70997

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear
    And Click on Product from Excel "<rowindex>" columnName "gradual_savings_account_iban" in My Products

    #And Wait for first transaction to load
    And Assert Product page for product with name from Excel "<rowindex>" columnName "gradual_savings_account_name"
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

  @Gradual_Savings-Transactions-List_[MOB_ANDROID]
  Scenario Outline: Gradual_Savings-Transactions-List_[MOB_ANDROID]
    #C70974

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "gradual_savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "gradual_savings_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Assert element "nlb-date" by id
    And Assert element "nlb-currency" by id
    And Assert element "nlb-title" by id
    And Assert element "nlb-amount" by id
    And Assert element "nlb-details" by id
    And Assert element "nlb-transaction-header-sum" by id
    And Assert element "nlb-transaction-header-sum" by id
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
    And Scroll until element with text from excel "<rowindex>" columnName "gradual_savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "gradual_savings_account_iban"
    And Wait for element by id "nlb-transaction-header-sum" to appear
    And Assert sum of monthly transactions is correct with key "sumOfTransactions"

    Examples:
      | rowindex |
      | 5        |

  @Gradual_Savings-Transactions-Filter_By_Type_[MOB_ANDROID]
  Scenario Outline: Gradual_Savings-Transactions-Filter_By_Type_[MOB_ANDROID]
    #C70978

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear
    And Click on Product from Excel "<rowindex>" columnName "gradual_savings_account_iban" in My Products

    And Wait for first transaction to load
    And Assert list of element by id "nlb-item-row" is displayed
    And Assert Transaction filter button in Product
    And Click Transaction filter button in Product
    And Wait first Transaction filter

    Then Click on element by text "Type"
    And Wait for element by text "Incoming transactions"
    And Assert element by id "nlb-radio-button-ALL" is checked "true"
    And Assert element by id "nlb-radio-button-INCOMING" is checked "false"
    And Assert element by id "nlb-radio-button-OUTGOING" is checked "false"
    And Click on element by id "nlb-radio-button-OUTGOING"
    And Click on element by text "Apply"
    And Wait for element by text "Type"
    And Click on element by text "Apply"
    And Assert element by text "No results found. Adjust your values and try again."
    And Click Transaction filter button in Product
    And Wait first Transaction filter
    Then Click on element by text "Type"
    And Wait for element by text "Incoming transactions"
    And Assert element by id "nlb-radio-button-ALL" is checked "false"
    And Assert element by id "nlb-radio-button-INCOMING" is checked "false"
    And Assert element by id "nlb-radio-button-OUTGOING" is checked "true"
    And Click on element by id "nlb-radio-button-INCOMING"
    And Click on element by text "Apply"
    And Wait for element by text "Type"
    And Click on element by text "Apply"
    And Wait for element by id "nlb-amount" to appear
    And Assert list of element by id "nlb-amount" does not contain "−"


    Examples:
      | rowindex |
      | 1        |

  @Gradual_Savings-Transactions-Details_[MOB_ANDROID]
  Scenario Outline: Gradual_Savings-Transactions-Details_[MOB_ANDROID]
    #C70990
    #BUG Settlement date is missing in transaction details

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "gradual_savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "gradual_savings_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Wait for element by id "nlb-title" to appear

    Then Click on first transaction
    And Assert element by text "Name and address"
    And Assert element by text "Account number"
    And Assert element by text "Creditor Reference"
    And Assert element by text "SWIFT BIC code"
    And Assert element by text "Settlement date"
    And Assert element by text "Transaction ID"



    Examples:
      | rowindex |
      | 1        |

  @Gradual_Savings-Transactions-Details-Complaint_[MOB_ANDROID]
  Scenario Outline: Gradual_Savings-Transactions-Details-Complaint_[MOB_ANDROID]
    #C70992
    #BUG Unknown error after sending complaint

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "gradual_savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "gradual_savings_account_iban"
    And Wait for element by id "nlb-title" to appear

    Then Click on first transaction
    And Wait for element by text "Confirmation"
    And Wait for element by id "nlb-date" to appear
    And Remember element value "text" by id "nlb-date" under key "date"
    And Remember element value "text" by id "nlb-currency" under key "currency"
    And Remember element value "text" by id "nlb-title" under key "purpose"
    And Remember element value "text" by id "nlb-amount" under key "amount"
    And Remember element value "text" by id "nlb-details" under key "details"
    And Click on element by text "Send message"
    And Wait for element by id "nlb-input-complaint-message" to appear
    And Assert shown transaction for sending complaint is correct
    And Assert "Inquiry" is selected in complaint type
    And Click on "Complaint" type in complaint
    And Swipe vertical
    And Assert element "nlb-button-primary" by id is disabled
    And Enter text "This is test for complaint" in element id "nlb-input-complaint-message"
    And Assert element "nlb-button-primary" by id is enabled
    And Click on element by id "nlb-button-primary"
    And Assert element by text "Success"
    And Assert element "nlb-date" by id



    Examples:
      | rowindex |
      | 1        |

  @Gradual_Savings-Transactions-Details-Inquiry_[MOB_ANDROID]
  Scenario Outline: Gradual_Savings-Transactions-Details-Inquiry_[MOB_ANDROID]
    #C70992
    #BUG Unknown error after sending inquiry

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "gradual_savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "gradual_savings_account_iban"
    And Wait for element by id "nlb-title" to appear

    Then Click on first transaction
    And Wait for element by text "Confirmation"
    And Wait for element by id "nlb-date" to appear
    And Remember element value "text" by id "nlb-date" under key "date"
    And Remember element value "text" by id "nlb-currency" under key "currency"
    And Remember element value "text" by id "nlb-title" under key "purpose"
    And Remember element value "text" by id "nlb-amount" under key "amount"
    And Remember element value "text" by id "nlb-details" under key "details"
    And Click on element by text "Send complaint"
    And Wait for element by id "nlb-input-complaint-message" to appear
    And Assert shown transaction for sending complaint is correct
    And Assert "Inquiry" is selected in complaint type
    And Swipe vertical
    And Assert element "nlb-button-primary" by id is disabled
    And Enter text "This is test for inquiry" in element id "nlb-input-complaint-message"
    And Assert element "nlb-button-primary" by id is enabled
    And Click on element by id "nlb-button-primary"
    And Assert element by text "Success"
    And Assert element "nlb-date" by id



    Examples:
      | rowindex |
      | 1        |