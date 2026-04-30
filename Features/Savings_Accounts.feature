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
    And Assert that text "Account owner" has first following sibling from excel "<rowindex>" columnName "account_details_owner"
    And Assert element by text "Account number"
    And Assert element by id "nlb-account-number" has text from Exel "<rowindex>" columnName "saving_account_number"
    And Assert element by text "Purpose"
    And Assert element by text "Opening date"
    And Assert element by id "nlb-opening-date" has text in format "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by text "Document archive"
    And Click on element by id "nlb-button-text"
    And Wait element "Error" by text

    Examples:
      | rowindex |
      |        1 |