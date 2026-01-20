Feature: Credit_Cards

  @Credit_cards_transactions_filter_by_date(custom_date_range)_[MOB_ANDROID]
  Scenario Outline: Credit_cards_transactions_filter_by_date(custom_date_range)_[MOB_ANDROID]

    Given Open Application
    #And Wait "100" seconds
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    #Open My products page
    When Click "My Products"
    And Scroll until element with text from Excel "<rowindex>" columnName "credit_card_2_name" is in the view
    And Click on element by text from excel "<rowindex>" columnName "credit_card_2_name"
    And Assert element by content desc "Filters"
    And Assert element by text "Search..."
    And Click on element by id "nlb-icon-button"
    And Click on element by text "Date"
    And Assert element by text "Last 7 days"
    And Assert element by text "Current month"
    And Assert element by text "Previous month"
    And Assert element by text "Custom date range"
    And Click on element by desc "Select date" and index "1"
    And Click on date in Calendar with year 2025 month 2 day 8 and assert that it is shown correctly
    And Assert button Cancel in Calendar is enabled
    And Assert button Apply in Calendar is enabled
    And Click on button Apply in Calendar
    And Assert From field in Date transactions filter has date year 2025 month 2 day 8

    And Click on element by desc "Select date" and index "2"
    And Click on date in Calendar with year 2025 month 11 day 8 and assert that it is shown correctly
    And Assert button Cancel in Calendar is enabled
    And Assert button Apply in Calendar is enabled
    And Click on button Apply in Calendar
    And Assert To field in Date transactions filter has date year 2025 month 11 day 8
    
    And Click on element by text "Apply"
    And Assert "Apply" button primary is enabled
    And Assert "Clear filters" button alternate is enabled
    And Click on element by text "Apply"
    And Wait for first transaction to load after filter

    Then Assert transactions dates are between dates year 2025 month 2 day 8 and year 2025 month 11 day 8


    Examples:
      | rowindex |
      |        1 |

  @Credit_cards_transactions_filter_invalid_[MOB_ANDROID]
  Scenario Outline: Credit_cards_transactions_filter_invalid_[MOB_ANDROID]

    Given Open Application
    #And Wait "100" seconds
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    #Open My products page
    When Click "My Products"
    And Scroll until element with text from Excel "<rowindex>" columnName "credit_card_2_name" is in the view
    And Click on element by text from excel "<rowindex>" columnName "credit_card_2_name"
    And Assert element by content desc "Filters"
    And Assert element by text "Search..."
    And Click on element by id "nlb-icon-button"
    And Click on element by text "Date"
    And Assert element by text "Last 7 days"
    And Assert element by text "Current month"
    And Assert element by text "Previous month"
    And Assert element by text "Custom date range"
    And Click on element by desc "Select date" and index "2"
    And Click on date in Calendar with year 2025 month 5 day 8 and assert that it is shown correctly
    And Assert button Cancel in Calendar is enabled
    And Assert button Apply in Calendar is enabled
    And Click on button Apply in Calendar
    And Assert To field in Date transactions filter has date year 2025 month 5 day 8

    And Click on element by desc "Select date" and index "1"
    And Check if element by text "Wednesday, May 7, 2025" is enabled
    And Check if element by text "Friday, May 9, 2025" is not enabled


    Examples:
      | rowindex |
      |        1 |


  @Credit_cards-Transactions-Filter-Filter_By_Type_[MOB_ANDROID]
  Scenario Outline: Credit_cards-Transactions-Filter-Filter_By_Type_[MOB_ANDROID]

    Given Open Application
    #And Wait "100" seconds
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    #Open My products page
    When Click "My Products"
    And Scroll until element with text from Excel "<rowindex>" columnName "credit_card_2_name" is in the view
    And Click on element by text from excel "<rowindex>" columnName "credit_card_2_name"
    And Click on element by id "nlb-icon-button"
    
    And Assert element by text "Date"
    #And Assert element by text "Status"
    And Assert element by text "Type"
    And Assert element by text "Amount"

    And Click on element by text "Type"
    And Click on element by id "nlb-radio-button-INCOMING"
    And Click on element by text "Apply"
    And Click on element by text "Apply"

    And Wait "10" seconds
    And Wait for first Transaction
    And Assert that all transactions are type "incoming"


    Examples:
      | rowindex |
      |        1 |

  @Credit_cards-Transactions-Filter-Filter_By_Amount_[MOB_ANDROID]
  Scenario Outline: Credit_cards-Transactions-Filter-Filter_By_Amount_[MOB_ANDROID]

    Given Open Application
    #And Wait "100" seconds
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    #Open My products page
    When Click "My Products"
    And Scroll until element with text from Excel "<rowindex>" columnName "credit_card_2_name" is in the view
    And Click on element by text from excel "<rowindex>" columnName "credit_card_2_name"
    And Click on element by id "nlb-icon-button"

    And Assert element by text "Date"
    #And Assert element by text "Status"
    And Assert element by text "Type"
    And Assert element by text "Amount"

    And Click on element by text "Amount"
    And Enter amount from "10000" to "20000"
    And Click on element by text "Apply"
    And Click on element by text "Apply"



    And Wait "10" seconds
    And Wait for first Transaction
    And Assert that all transactions are between "10000" and "20000"


    Examples:
      | rowindex |
      |        1 |

  @Credit_cards-Transactions-Filter-Filter_By_Amount_invalid_[MOB_ANDROID]
  Scenario Outline: Credit_cards-Transactions-Filter-Filter_By_Amount_invalid_[MOB_ANDROID]

    Given Open Application
    #And Wait "100" seconds
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    #Open My products page
    When Click "My Products"
    And Scroll until element with text from Excel "<rowindex>" columnName "credit_card_2_name" is in the view
    And Click on element by text from excel "<rowindex>" columnName "credit_card_2_name"
    And Click on element by id "nlb-icon-button"

    And Assert element by text "Date"
    #And Assert element by text "Status"
    And Assert element by text "Type"
    And Assert element by text "Amount"

    And Click on element by text "Amount"
    #And Enter amount from "10000" to "20000"
    And Click on element by text "Apply"
    And Click on element by text "Apply"




    Examples:
      | rowindex |
      |        1 |
