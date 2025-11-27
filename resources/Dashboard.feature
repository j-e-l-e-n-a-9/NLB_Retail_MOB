Feature: Dashboard

  @General_Dashboard_Page_overview_[Android]
  Scenario Outline: General_Dashboard_Page_overview_[Android]
    #C76035,C76036,C76037

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Assert "Default Icon" content description from view tag "View" is displayed
    And Assert "Notifications" content description from view tag "View" is displayed
    And Click "Notifications" content description from view tag "View"
    And Assert element by text "Notifications"
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-product-card-button-left" to appear
    And Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Remember current balance for favorite account under key "current_balance"
    And Remember available balance for favorite account under key "available_balance"
    And Click "My NLB" content description from view tag "View"
    And Assert active account in dashboard is from Excel "<rowindex>" with name "personal_account_name" and iban "personal_account_iban" and balance under keys "current_balance" and "available_balance"
    #And Expand latest transactions in dashboard
    And Remember latest transaction purposes from dashboard under key "latest_transaction_purposes"
    And Click Next arrow in dashboard
    And Assert element by text from excel "<rowindex>" columnName "second_personal_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert latest transaction purposes from dashboard are not the same as in key "latest_transaction_purposes"
    And Expand latest transactions in dashboard
    And Click Previous arrow in dashboard
    And Assert active account in dashboard is from Excel "<rowindex>" with name "personal_account_name" and iban "personal_account_iban" and balance under keys "current_balance" and "available_balance"
    And Assert element by text "All transactions"
    And Assert element by text "Photo pay"
    And Assert element by text "Change limit"
    And Assert element by text "Get loan"
    And Assert element by text "E-invoices"
    And Assert element by text "Upcoming payments"
    And Assert element by text "Help"
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Swipe vertical
    And Remember first "3" transaction purposes under key "payments_purposes"
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-product-card-button-left" to appear
    And Wait for element by text "All transactions"
    And Expand latest transactions in dashboard
    And Wait for element by id "nlb-title" to appear
    And Assert transactions shown in dashboard are the same as in key "payments_purposes"
    And Expand latest transactions in dashboard
    And Click on element by text "Photo pay"
    And Assert element by text "Photo pay"
    And Go Back
    And Click on element by text "Change limit"
    And Assert element by text "Select account to change limit"
    And Go Back
    And Click on element by text "Get loan"
    And Assert element by text "NLB Personal loan"
    And Go Back
    And Wait for element by id "nlb-product-card-button-left" to appear
    And Click on element by text "E-invoices"
    And Wait for element by text "Subscribe to e-invoice"
    And Assert "Subscribe to e-invoice" content description from view tag "View" is displayed
    And Go Back
    And Wait for element by id "nlb-product-card-button-left" to appear
    And Click on element by text "Upcoming payments"
    And Assert element by text "Payments waiting to be processed in next six months."
    And Go Back
    And Wait for element by id "nlb-product-card-button-left" to appear
    And Click on element by text "Help"
    And Assert element by text "Personal adviser"
    And Go Back
    And Wait for element by id "nlb-product-card-button-left" to appear
    And Expand latest transactions in dashboard
    And Wait for element by id "nlb-title" to appear
    And Click on element by id "nlb-title"
    And Wait for element by text "Name and address"
    And Click on edit button to change category
    And Wait for element by id "nlb-button-primary" to appear




    Examples:
      | rowindex |
      | 4        |