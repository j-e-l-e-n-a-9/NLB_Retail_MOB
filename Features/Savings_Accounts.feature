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
    #And Assert list of element by id "nlb-item-row" is displayed
    And Assert list of transactions is displayed correctly in Product
    And Assert Transaction filter button in Product
    And Assert product option buttons for Savings account
#    And Assert Statement button in Product details
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