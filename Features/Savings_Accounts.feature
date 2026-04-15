Feature: Savings_Accounts

  @Savings_Accounts-Details-Financial_Details_[MOB_ANDROID]
  Scenario Outline: Savings_Accounts-Details-Financial_Details_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products"
    And Scroll until element with text from excel "<rowindex>" columnName "saving_account_name" is in view
#    And Swipe vertical short
    And Click on element by text from excel "<rowindex>" columnName "saving_account_name"
    And Wait element "Transactions" by text
    And Assert element by text "Transactions"
    And Assert element by text "Details"
    And Assert element by text "Statements"
    And Assert element by text "Currency exchange"
    And Assert element by content desc "Filters"
    And Assert element by text "Search..."

    Then Click on element by text "Details"
    And Wait element "Account details" by text
    And Assert text "Financial details" is not displayed
    #TODO: Dodati proveru Financial Details kada se pojavi user koji ima Financial Details

    Examples:
      | rowindex |
      |        1 |