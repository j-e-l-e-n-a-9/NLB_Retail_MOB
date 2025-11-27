Feature: Loan_Accounts

  @Loan_Accounts-Details-Financial_Details_[MOB_ANDROID]
  Scenario Outline: Loan_Accounts-Details-Financial_Details_[MOB_ANDROID]
    #C71059

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "loan_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "loan_account_iban"
    And Wait for element by id "nlb-principal-amount" to appear

    Then Assert element by text "Financial details"
    And Assert element by text "Opening amount"
    And Assert element by id "nlb-principal-amount" with regex "^(?:(?:0|[1-9]\d{0,2})(?:.\d{3})*),\d{2} EUR$"
    And Assert element by text "Monthly annuity"
    And Assert element by id "nlb-monthly-annuity" with regex "^(?:(?:0|[1-9]\d{0,2})(?:.\d{3})*),\d{2} EUR$"
    And Assert element by text "Interest rate"
    And Assert element by id "nlb-interest-rate" with regex "^(?:(?:0|[1-9]\d{0,2})(?:.\d{3})*),\d{2} [%]{1}$"


    Examples:
      | rowindex |
      |        1 |

  @Loan_Accounts-Details-Account_Details_[MOB_ANDROID]
  Scenario Outline: Loan_Accounts-Details-Account_Details_[MOB_ANDROID]
    #C71060

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "loan_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "loan_account_iban"
    And Wait for element by id "nlb-principal-amount" to appear

    Then Assert element by text "Account details"
    And Assert element by text "Account owner"
    And Assert text from excel "<rowindex>" columnName "loan_account_details_owner" in element by id "nlb-account-owner"
    And Assert element by text "Start date"
    And Assert text from excel "<rowindex>" columnName "loan_account_details_start_date" in element by id "nlb-start-date"
    And Assert element by text "Repayment period"
    And Assert element by id "nlb-repayment-period" ends in "months"
    And Assert element by text "Remaining period"
    And Assert element by id "nlb-remaining-period" ends in "months"
    And Click on element by text "Document archive"
    And Assert element by text "Document archive (part of separate business requirement)"


    Examples:
      | rowindex |
      |        1 |