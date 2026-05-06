Feature: Credit_Cards

  @Credit_cards_transactions_filter_by_date-Date_Picker_[MOB_ANDROID]
  Scenario Outline: Credit_cards_transactions_filter_by_date-Date_Picker_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products"
    And Wait for first product in My products page
    And Scroll until element with text from Excel "<rowindex>" columnName "credit_card_2_number" is in the view
    And Click on element by text from excel "<rowindex>" columnName "credit_card_2_number"
    And Wait for first transaction to load
    And Assert element by content desc "Filters"
    And Assert element by text "Search..."
    And Click on element by id "nlb-icon-button"
    And Click on element by text "Date"
    And Assert element by text "Last 7 days"
    And Assert element by text "This month"
    And Assert element by text "Last month"
    And Assert element by text "Custom date range"
    And Click on element by desc "Set date" and index "1"
    And Click on date in Calendar with year 2025 month 2 day 8 and assert that it is shown correctly
    And Assert button Cancel in Calendar is enabled
#    And Assert button Apply in Calendar is enabled
#    And Click on button Apply in Calendar
    And Click on element by text "Add filter"
    And Assert From field in Date transactions filter has date year 2025 month 2 day 8

    And Click on element by desc "Set date" and index "2"
    And Click on date in Calendar with year 2025 month 11 day 8 and assert that it is shown correctly
    And Assert button Cancel in Calendar is enabled
#    And Assert button Apply in Calendar is enabled
#    And Click on button Apply in Calendar
    And Click on element by text "Add filter"
    And Assert To field in Date transactions filter has date year 2025 month 11 day 8
    
    And Click on element by text "Apply"
    And Assert "Confirm" button primary is enabled
    And Assert "Clear filters" button alternate is enabled
    And Click on element by text "Confirm"
    And Wait for first transaction to load after filter

    Then Assert transactions dates are between dates year 2025 month 2 day 8 and year 2025 month 11 day 8

    Examples:
      | rowindex |
      |        1 |

  @Credit_cards_transactions_filter_invalid_[MOB_ANDROID]
  Scenario Outline: Credit_cards_transactions_filter_invalid_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load

    When Click "My Products"
    And Wait for first product in My products page
    And Scroll until element with text from Excel "<rowindex>" columnName "credit_card_2_number" is in the view
    And Click on element by text from excel "<rowindex>" columnName "credit_card_2_number"
    And Wait for first transaction to load
    And Assert element by content desc "Filters"
    And Assert element by text "Search..."
    And Click on element by id "nlb-icon-button"
    And Assert element by text "Date"
    And Assert element by text "Status"
    And Assert element by text "Type"
    And Assert element by text "Amount"
    And Click on element by text "Date"
    And Assert element by text "Last 7 days"
    And Assert element by text "This month"
    And Assert element by text "Last month"
    And Assert element by text "Custom date range"
    And Click on element by desc "Set date" and index "2"
    And Click on date in Calendar with year 2025 month 5 day 8 and assert that it is shown correctly
    And Assert button Cancel in Calendar is enabled
#    And Assert button Apply in Calendar is enabled
#    And Click on button Apply in Calendar
    And Click on element by text "Add filter"
    And Assert To field in Date transactions filter has date year 2025 month 5 day 8

    Then Click on element by desc "Set date" and index "1"
    And Check if element by text "Wednesday, May 7, 2025" is enabled
    And Check if element by text "Friday, May 9, 2025" is not enabled

    Examples:
      | rowindex |
      |        1 |


  @Credit_cards-Transactions-Filter-Filter_By_Type_[MOB_ANDROID]
  Scenario Outline: Credit_cards-Transactions-Filter-Filter_By_Type_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products"
    And Wait for first product in My products page
    And Scroll until element with text from Excel "<rowindex>" columnName "credit_card_2_number" is in the view
    And Click on element by text from excel "<rowindex>" columnName "credit_card_2_number"
    And Wait for first transaction to load
    And Assert product option buttons for Credit cards
    And Click on element by id "nlb-icon-button"
    And Assert Date transaction filter for Credit cards is displayed correctly
    And Assert Status transaction filter for Credit cards is displayed correctly
    And Assert Type transaction filter for Credit cards is displayed correctly
    And Assert Amount transaction filter for Credit cards is displayed correctly
    And Assert "Confirm" button is not enabled
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

  @Credit_cards-Transactions-Filter-Filter_By_Amount_invalid_[MOB_ANDROID]
  Scenario Outline: Credit_cards-Transactions-Filter-Filter_By_Amount_invalid_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products"
    And Scroll until element with text from Excel "<rowindex>" columnName "credit_card_2_number" is in the view
    And Click on element by text from excel "<rowindex>" columnName "credit_card_2_number"
    And Click on element by id "nlb-icon-button"

    And Assert element by text "Date"
    And Assert element by text "Status"
    And Assert element by text "Type"
    And Assert element by text "Amount"

    When Click on element by text "Amount"
    And Enter amount from "10000" to "5000"
    And Assert element by contains text "Invalid amount range. The minimum amount cannot be greater than the maximum amount."

    Examples:
      | rowindex |
      |        1 |


  @Credit_cards-Transactions-Filter_Multiple_Filter_Invalid_[MOB_ANDROID]
  Scenario Outline: Credit_cards-Transactions-Filter_Multiple_Filter_Invalid_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products"
    And Wait for first product in My products page
    And Scroll until element with text from Excel "<rowindex>" columnName "credit_card_2_number" is in the view
    And Click on element by text from excel "<rowindex>" columnName "credit_card_2_number"
    And Wait for first transaction to load
    And Assert product option buttons for Credit cards
    And Click on element by id "nlb-icon-button"
    And Assert Date transaction filter for Credit cards is displayed correctly
    And Assert Status transaction filter for Credit cards is displayed correctly
    And Assert Type transaction filter for Credit cards is displayed correctly
    And Assert Amount transaction filter for Credit cards is displayed correctly
    And Assert "Confirm" button is not enabled

    And Click on element by text "Amount"
    And Enter amount from "10000" to "5000"
    And Assert element by contains text "The minimum amount cannot be greater than the maximum amount."
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Type"

    And Click on element by text "Date"
    And Click on element by desc "Set date" and index "2"
    And Click on date in Calendar with year 2025 month 5 day 8 and assert that it is shown correctly
    And Assert button Cancel in Calendar is enabled
#    And Assert button Apply in Calendar is enabled
#    And Click on button Apply in Calendar
    And Click on element by text "Add filter"
    And Assert To field in Date transactions filter has date year 2025 month 5 day 8

    And Click on element by desc "Set date" and index "1"
    And Check if element by text "Wednesday, May 7, 2025" is enabled
    And Check if element by text "Friday, May 9, 2025" is not enabled

    Examples:
      | rowindex |
      |        1 |


  @Credit_Cards-Details_[MOB_ANDROID]
  Scenario Outline: Credit_Cards-Details_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "credit_card_2_number" is in view
    And Click on element by text from excel "<rowindex>" columnName "credit_card_2_number"
    And Wait for element by text "Available balance"

    Then Assert element by text "Available balance"
    And Assert element by id "nlb-product-details-primary-balance" ends in "RSD"
    And Assert "Details" content description from view tag "View" is displayed
    And Assert element by text "Details"
    And Assert "Statements" content description from view tag "View" is displayed
    And Assert element by text "Statements"
    And Assert "Settings" content description from view tag "View" is displayed
    And Assert element by text "Settings"
    And Click "Details" content description from view tag "View"
    And Wait for element by text "Financial details"
    And Assert element by text "Available balance"
    And Assert element by id "nlb-product-details-primary-balance" ends in "RSD"
    And Assert element by text "Financial details"
    And Assert element by text "Account details"

    Examples:
      | rowindex |
      |        1 |


  @Credit_Cards-Transactions-Filter-Filter_By_Amount_[MOB_ANDROID]
  Scenario Outline: Credit_Cards-Transactions-Filter-Filter_By_Amount_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear
    And Scroll until element with text from Excel "<rowindex>" columnName "credit_card_2_number" is in the view
    And Click on Product from Excel "<rowindex>" columnName "credit_card_2_number" in My Products

    When Wait for first transaction to load
    And Click Transaction filter button in Product
    And Wait element "Apply" by text
    And Assert transaction filters are displayed for credit cards
    And Assert element by text "Select time frame"
    And Assert element by text "Select status"
    And Assert element by text "All"
    And Assert element by text "Set amount"
    And Click on element by text "Amount"
    And Wait for element by text "Set amount"
    And Assert currencies in From and To input field is RSD
    And Enter text "500" into input field "From" in amount filter
    And Enter text "1000" into input field "To" in amount filter
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Date"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-title" to appear

    Then Assert filtered amounts have values between "500" and "1000"
    And Click Transaction filter button in Product
    And Wait element "Apply" by text
    And Assert transaction filters are displayed for credit cards
    And Click on element by id "nlb-button-alternate"
    And Assert element by text "Select time frame"
    And Assert element by text "Select status"
    And Assert element by text "All"
    And Assert element by text "Set amount"

    Examples:
      | rowindex |
      |        1 |


  @Credit_Cards-Details-Financial_Details_[MOB_ANDROID]
  Scenario Outline: Credit_Cards-Details-Financial_Details_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "credit_card_2_number" is in view
    And Click on element by text from excel "<rowindex>" columnName "credit_card_2_number"
    And Wait for element by text "Available balance"
    And Click "Details" content description from view tag "View"
    And Wait for element by text "Financial details"

    Then Assert element by text from excel "<rowindex>" columnName "credit_card_2_number"
    And Assert element by text from excel "<rowindex>" columnName "credit_card_2_name"
    And Assert element by text "Approved limit"
    And Assert element by id "nlb-product-details-approved-overdraft" has two decimal places and ends in "RSD"
    And Assert element by text "Daily limit - cash"
    And Assert element by id "nlb-product-details-daily-limit" has two decimal places and ends in "RSD"
    And Assert element by text "Daily limit - cash (foreign)"
    And Assert element by id "nlb-product-details-daily-limit-foreign" has two decimal places and ends in "RSD"
    And Assert element by text "Reserved funds"
    And Assert element by id "nlb-product-details-reserved-funds-rsd" has two decimal places and ends in "RSD"
    And Assert element by text "Monthly pay percentage"
#    And Assert element by id "nlb-product-details-monthly-pay-percentage" has two decimal places and ends in ""
    And Assert element by id "nlb-product-details-monthly-pay-percentage" with regex "^\d+,\d{2} %$"
    And Assert element by text "Limit expiration"
    And Assert element by id "nlb-product-details-limit-expiration-date" has text in format "^(0[1-9]|[12]\d|3[01])\.(0[1-9]|1[0-2])\.\d{4}$"
#    And Assert element by text "Repay limit"
    And Assert element "nlb-button-text" by id is enabled

    Examples:
      | rowindex |
      |        1 |


  @Credit_Cards_Details_Card_Details_[MOB_ANDROID]
  Scenario Outline: Credit_Cards_Details_Card_Details_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load

    When Click "My Products"
    And Wait for first product in My products page
    And Scroll until element with text from excel "<rowindex>" columnName "credit_card_2_number" is in view
    And Click on element by text from excel "<rowindex>" columnName "credit_card_2_number"


    Then Assert Credit Card from excel "<rowindex>" columnname "credit_card_2_number" is displayed correctly
    And Click on element by text "Details"
    And Wait for element by text "Transactions"
    And Assert product option buttons for Credit cards
#    And Assert order of card details

    Examples:
      | rowindex |
      |        1 |


  @Credit_Cards_Details_[MOB_ANDROID]
  Scenario Outline: Credit_Cards_Details_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load

    When Click "My Products"
    And Wait for first product in My products page
    And Scroll until element with text from excel "<rowindex>" columnName "credit_card_2_number" is in view
    And Click on element by text from excel "<rowindex>" columnName "credit_card_2_number"

    Then Assert Credit Card from excel "<rowindex>" columnname "credit_card_2_number" is displayed correctly
    And Assert element by text "Details"
    And Assert element by text "Statements"
    And Assert element by text "Settings"
    And Assert element by text "Transactions"
    And Click on element by text "Details"
    And Wait for element by text "Financial details"
#    And Assert order of card details

    Examples:
      | rowindex |
      |        1 |