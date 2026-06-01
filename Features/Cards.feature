Feature: Cards

  @Cards_Transactions_List-Filter_invalid_[MOB_ANDROID]-Debit_Cards
  Scenario Outline: Cards_Transactions_List-Filter_invalid_[MOB_ANDROID]-Debit_Cards

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load

    When Click on Bottom navigation button "Cards"
    And Wait for first Card in Cards Menu
    And Scroll until element with text from Excel "<rowindex>" columnName "cards_item_debit_card_number" is in the view
    And Click on element by text from excel "<rowindex>" columnName "cards_item_debit_card_number"
    And Wait for first transaction to load
    And Assert element by text from excel "<rowindex>" columnName "cards_item_debit_card_name"
    And Assert element by text from excel "<rowindex>" columnName "cards_item_debit_card_number"
    And Assert element by text "Search..."
    And Assert Filter icon is displayed
    And Click Transaction filter button in Product
    And Wait first Transaction filter
    And Assert transaction filters are displayed for credit cards
    And Assert Date transaction filter for Credit cards is displayed correctly
    And Assert Status transaction filter for Credit cards is displayed correctly
    And Assert Type transaction filter for Credit cards is displayed correctly
    And Assert Amount transaction filter for Credit cards is displayed correctly
    And Assert "Confirm" button is not enabled
    And Click on element by text "Date"
    And Assert element by text "Last 7 days"
    And Assert element by text "This month"
    And Assert element by text "Last month"
    And Assert element by text "Custom date range"
    And Click on element by desc "Set date" and index "2"
    And Click on date in Calendar with year 2026 month 4 day 18 and assert that it is shown correctly
    And Assert button Cancel in Calendar is enabled
    And Assert button Confirm in Calendar is enabled
    And Click on button Confirm in Calendar
#    And Click on element by text "Add filter"
    And Assert To field in Date transactions filter has date year 2026 month 4 day 18

    And Click on element by desc "Set date" and index "1"
    And Check if element by text "Sunday, April 19, 2026" is not enabled
    And Check if element by text "Wednesday, April 29, 2026" is not enabled
    And Check if date in Calendar with year 2026 month 5 day 10 is not enabled

    Then Click on element by text "Cancel"
    And Assert "Apply" button is not enabled
    And Click "Back" content description
    And Wait first Transaction filter
    And Click on element by text "Amount"
    And Enter text "100000" into input field "From" in amount filter
    And Enter text "50000" into input field "To" in amount filter

    And Assert element by contains text "Invalid amount range. The minimum amount cannot be greater than the maximum amount."

    Examples:
      | rowindex |
      |        4 |


  @Cards_Transactions_List-Filter_invalid_[MOB_ANDROID]-Credit_Cards
  Scenario Outline: Cards_Transactions_List-Filter_invalid_[MOB_ANDROID]-Credit_Cards

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load

    When Click on Bottom navigation button "Cards"
    And Wait for first Card in Cards Menu
    And Scroll until element with text from Excel "<rowindex>" columnName "cards_item_credit_card_number" is in the view
    And Click on element by text from excel "<rowindex>" columnName "cards_item_credit_card_number"
    And Wait for first transaction to load
    And Assert element by text from excel "<rowindex>" columnName "cards_item_credit_card_name"
    And Assert element by text from excel "<rowindex>" columnName "cards_item_credit_card_number"
    And Assert element by text "Search..."
    And Assert Filter icon is displayed
    And Click Transaction filter button in Product
    And Wait first Transaction filter
    And Assert transaction filters are displayed for credit cards
    And Assert Date transaction filter for Credit cards is displayed correctly
    And Assert Status transaction filter for Credit cards is displayed correctly
    And Assert Type transaction filter for Credit cards is displayed correctly
    And Assert Amount transaction filter for Credit cards is displayed correctly
    And Assert "Confirm" button is not enabled
    And Click on element by text "Date"
    And Assert element by text "Last 7 days"
    And Assert element by text "This month"
    And Assert element by text "Last month"
    And Assert element by text "Custom date range"
    And Click on element by desc "Set date" and index "2"
    And Click on date in Calendar with year 2026 month 3 day 5 and assert that it is shown correctly
    And Assert button Cancel in Calendar is enabled
    And Assert button Confirm in Calendar is enabled
    And Click on button Confirm in Calendar
#    And Click on element by text "Add filter"
    And Assert To field in Date transactions filter has date year 2026 month 3 day 5

    And Click on element by desc "Set date" and index "1"
    And Check if date in Calendar with year 2026 month 4 day 10 is not enabled
    And Check if date in Calendar with year 2026 month 5 day 16 is not enabled
    And Check if date in Calendar with year 2026 month 6 day 7 is not enabled

    Then Click on element by text "Cancel"
    And Assert "Apply" button is not enabled
    And Click "Back" content description
    And Wait first Transaction filter
    And Click on element by text "Amount"
    And Enter text "100000" into input field "From" in amount filter
    And Enter text "50000" into input field "To" in amount filter

    And Assert element by contains text "Invalid amount range. The minimum amount cannot be greater than the maximum amount."

    Examples:
      | rowindex |
      |        4 |


  #KADA DODJE OVAJ TEST NA AUTOMATIZACIJU, PROVERI DA LI JE OVO AUTOMATIZOVAN TEST ZA LIST ILI DETAILS TEST.
  #GRESKOM AUTOMATIZOVAN
#  @Cards-Transactions_Details_[MOB_ANDROID]-Debit_Cards
#  Scenario Outline: Cards-Transactions_Details_[MOB_ANDROID]-Debit_Cards
#
#    Given Open Application
#    And Select User from Excel "<rowindex>" columnName "username" and login
#    And Wait for My NLB screen to load
#
#    When Click on Bottom navigation button "Cards"
#    And Wait for first Card in Cards Menu
#    And Scroll until element with text from Excel "<rowindex>" columnName "cards_item_debit_card_number" is in the view
#    And Click on element by text from excel "<rowindex>" columnName "cards_item_debit_card_number"
#    And Wait for first transaction to load
#    And Assert element by text from excel "<rowindex>" columnName "cards_item_debit_card_name"
#    And Assert element by text from excel "<rowindex>" columnName "cards_item_debit_card_number"
#    And Assert Filter icon is displayed
#
#    Then Assert list of element by id element by id "nlb-date" with regex "^\d{2}\.\d{2}\.\d{4}$"
#    And Assert list of element by id element by id "nlb-currency" with regex "^[A-Z]{3}$"
#    And Assert list of element by id element by id "nlb-amount" with regex "^[\-−]?(?:0|[1-9]\d{0,2}(?:\.\d{3})*),\d{2}$"
#    And Assert list of element by id element by id "nlb-title" with regex "^.*$"
#    And Assert list of element by id element by id "nlb-details" with regex "^.*$"
#
#    Examples:
#      | rowindex |
#      |        4 |
#
#
#  @Cards-Transactions_Details_[MOB_ANDROID]-Credit_Cards
#  Scenario Outline: Cards-Transactions_Details_[MOB_ANDROID]-Credit_Cards
#
#    Given Open Application
#    And Select User from Excel "<rowindex>" columnName "username" and login
#    And Wait for My NLB screen to load
#
#    When Click on Bottom navigation button "Cards"
#    And Wait for first Card in Cards Menu
#    And Scroll until element with text from Excel "<rowindex>" columnName "cards_item_credit_card_number" is in the view
#    And Click on element by text from excel "<rowindex>" columnName "cards_item_credit_card_number"
#    And Wait for first transaction to load
#    And Assert element by text from excel "<rowindex>" columnName "cards_item_credit_card_name"
#    And Assert element by text from excel "<rowindex>" columnName "cards_item_credit_card_number"
#    And Assert Filter icon is displayed
#
#    Then Assert list of element by id element by id "nlb-date" with regex "^\d{2}\.\d{2}\.\d{4}$"
#    And Assert list of element by id element by id "nlb-currency" with regex "^[A-Z]{3}$"
#    And Assert list of element by id element by id "nlb-amount" with regex "^[\-−]?(?:0|[1-9]\d{0,2}(?:\.\d{3})*),\d{2}$"
#    And Assert list of element by id element by id "nlb-title" with regex "^.*$"
#    And Assert list of element by id element by id "nlb-details" with regex "^.*$"
#
#    Examples:
#      | rowindex |
#      |        4 |