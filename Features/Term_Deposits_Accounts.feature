Feature: Term_Deposits_Accounts

    @Term_Deposit_Accounts_Details_Account_Details_[MOB_ANDROID]
    Scenario Outline: Term_Deposit_Accounts_Details_Account_Details_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products"
    And Wait for element by text "Edit list"
    And Scroll until element with text from excel "<rowindex>" columnName "term_deposit_number2" is in view
    And Click on element by text from excel "<rowindex>" columnName "term_deposit_number2"
    And Wait element "Financial details" by text
    And Assert element by text from excel "<rowindex>" columnName "term_deposit_number2"

    Then Assert element by text "Account details"
    And Assert element by text "Account type"
    And Assert text "Deposit" in element id "nlb-account-type"
    And Assert element by text "Account owner"
    And Assert text from excel "<rowindex>" columnName "account_details_owner" in element by id "nlb-account-owner"
    And Assert element by text "Account number"
    And Assert text from excel "<rowindex>" columnName "term_deposit_number2" in element by id "nlb-account-number"
    And Assert element by text "Opening date"
    And Assert element by id "nlb-opening-date" has text in format "^(0[1-9]|[12]\d|3[01])\.(0[1-9]|1[0-2])\.\d{4}$"
    And Assert element by text "Expiration date"
    And Assert element by id "nlb-expiration-date" has text in format "^(0[1-9]|[12]\d|3[01])\.(0[1-9]|1[0-2])\.\d{4}$"
    And Assert element "nlb-button-text" by id is enabled

    Examples:
    | rowindex |
    |        1 |


  @Term_Deposits_Accounts_Details_[MOB_ANDROID]
  Scenario Outline: Term_Deposits_Accounts_Details_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products"
    And Wait for element by text "Edit list"
    And Scroll until element with text from excel "<rowindex>" columnName "term_deposit_number2" is in view
    And Click on element by text from excel "<rowindex>" columnName "term_deposit_number2"
    And Wait element "Financial details" by text
    And Assert element by text "My deposit"
    And Assert element by text from excel "<rowindex>" columnName "term_deposit_number2"
    And Assert element by text "Financial details"
    And Assert element by text "Deposit amount"
    And Assert element by id "nlb-deposited-amount" with regex "^(?:(?:0|[1-9]\d{0,2})(?:\.\d{3})*),\d{2}\s*[A-Z]{3}$"
    And Assert element by text "Interest rate"
    And Assert element by id "nlb-interest-rate" with regex "^\d{1,2},\d{4} \%$"
    And Assert element by text "Accrued interest"
    And Assert element by id "nlb-accrued-interest" with regex "^(?:(?:0|[1-9]\d{0,2})(?:\.\d{3})*),\d{2}\s*[A-Z]{3}$"
    And Assert element by text "Pay out account"
    And Assert element by id "nlb-maturity-account" with regex "^9\d{12}$"

    Then Assert element by text "Account details"
    And Assert element by text "Account type"
    And Assert text "Deposit" in element id "nlb-account-type"
    And Assert element by text "Account owner"
    And Assert text from excel "<rowindex>" columnName "account_details_owner2" in element by id "nlb-account-owner"
    And Assert element by text "Account number"
    And Assert text from excel "<rowindex>" columnName "term_deposit_number2" in element by id "nlb-account-number"
    And Assert element by text "Opening date"
    And Assert element by id "nlb-opening-date" has text in format "^(0[1-9]|[12]\d|3[01])\.(0[1-9]|1[0-2])\.\d{4}$"
    And Assert element by text "Expiration date"
    And Assert element by id "nlb-expiration-date" has text in format "^(0[1-9]|[12]\d|3[01])\.(0[1-9]|1[0-2])\.\d{4}$"
    And Assert element "nlb-button-text" by id is enabled

    Examples:
      | rowindex |
      |        2 |


  @Term_Deposit_Accounts_Details_Financial_Details_[MOB_ANDROID]
  Scenario Outline: Term_Deposit_Accounts_Details_Financial_Details_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    And Click "My Products"
    And Wait for first product in My products page
#    And Assert that products in My products page is loaded

    When Scroll until element with text from excel "<rowindex>" columnName "term_deposit_number2" is in view
    And Click on element by text from excel "<rowindex>" columnName "term_deposit_number2"
    And Wait element "Financial details" by text
    And Assert element by text from excel "<rowindex>" columnName "term_deposit_number2"

    Then Assert element by text "Financial details"
    And Assert element by text "Deposit amount"
    And Assert element by id "nlb-deposited-amount" with regex "^(?:(?:0|[1-9]\d{0,2})(?:\.\d{3})*),\d{2}\s*[A-Z]{3}$"
    And Assert element by text "Interest rate"
    And Assert element by id "nlb-interest-rate" with regex "^\d{1,2},\d{4} \%$"
    And Assert element by text "Accrued interest"
    And Assert element by id "nlb-accrued-interest" with regex "^(?:(?:0|[1-9]\d{0,2})(?:\.\d{3})*),\d{2}\s*[A-Z]{3}$"
    And Assert element by text "Pay out account"
    And Assert element by id "nlb-maturity-account" with regex "^9\d{12}$"

    Examples:
      | rowindex |
      |        1 |