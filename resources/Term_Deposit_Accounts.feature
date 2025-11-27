Feature: Term_Deposit_Account

  @Term_Deposits_Accounts-Details-Financial_Details_[MOB_ANDROID]
  Scenario Outline: Term_Deposits_Accounts-Details-Financial_Details_[MOB_ANDROID]
    #C71029,C71028
    #BUG On android 16 1.700,00 is 1700,00
    #Only happens on 4 digit numbers

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "term_deposit_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "term_deposit_iban"
    And Wait for element by id "nlb-deposited-amount" to appear
    
    Then Assert element by text "Financial details"
    And Assert element by text "Term deposit amount"
    And Assert element by id "nlb-deposited-amount" with regex "^(?:(?:0|[1-9]\d{0,2})(?:.\d{3})*),\d{2} EUR$"
    And Assert element by text "Interest rate"
    And Assert element by id "nlb-interest-rate" with regex "^\d{1,2},\d{4} \%$"
    And Assert element by text "Accrued interest"
    And Assert element by id "nlb-accrued-interest" ends in "EUR"
    And Assert text from excel "<rowindex>" columnName "second_personal_account_iban" in element by id "nlb-maturity-account"
    And Assert element "nlb-header-card" by id
    And Assert element by text "Term deposit amount"
    And Assert element by id "nlb-product-details-primary-balance" with regex "^(?:(?:0|[1-9]\d{0,2})(?:.\d{3})*),\d{2} EUR$"


    Examples:
      | rowindex |
      |        4 |

  @Term_Deposits_Accounts-Details-Account_Details_[MOB_ANDROID]
  Scenario Outline: Term_Deposits_Accounts-Details-Account_Details_[MOB_ANDROID]
    #C71030
    #BUG Account number format is xxxx xxx x

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "term_deposit_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "term_deposit_iban"
    And Wait for element by id "nlb-deposited-amount" to appear

    Then Assert element by text "Account details"
    And Assert element by text "Account type"
    And Assert text "Deposit" in element id "nlb-account-type"
    And Assert element by text "Account owner"
    And Assert text from excel "<rowindex>" columnName "term_deposit_account_details_owner" in element by id "nlb-account-owner"
    And Assert element by text "Account number"
    And Assert text from excel "<rowindex>" columnName "term_deposit_iban" in element by id "nlb-account-number"
    And Assert element by text "Opening date"
    And Assert text from excel "<rowindex>" columnName "term_deposit_account_details_opening_date" in element by id "nlb-opening-date"
    And Assert element by text "Expiration date"
    And Assert text from excel "<rowindex>" columnName "term_deposit_account_details_expiration_date" in element by id "nlb-expiration-date"
    And Click on element by text "Document archive"
    And Assert element by text "Pogodba"


    Examples:
      | rowindex |
      |        4 |