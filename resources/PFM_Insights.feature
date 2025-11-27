Feature: PFM_Insights

  @PFM_Insights_Cashflow_Displaying_Data_For_The_Selected_Account_[MOB_ANDROID]
  Scenario Outline: PFM_Insights_Cashflow_Displaying_Data_For_The_Selected_Account_[MOB_ANDROID]
    #C72485


    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    And Click "My Products" content description from view tag "View"
    #Begining of calculation of incoming transactions for current month
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "second_personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "second_personal_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click on Filter button in my product
    And Wait for element by text "Date"
    And Click on element by text "Date"
    And Wait for element by text "Current month"
    And Click on element by text "Current month"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Type"
    And Click on element by text "Type"
    And Wait for element by text "Incoming transactions"
    And Click on element by text "Incoming transactions"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Categories"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-title" to appear
    And Calculate sum of all transactions in transaction list and put in key "sumOfIncomingTransactionsCurrentMonth"
    And Click "Back" content description from view tag "View"
    #Begining of calculation of outgoing transactions for current month
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "second_personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "second_personal_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click on Filter button in my product
    And Wait for element by text "Date"
    And Click on element by text "Date"
    And Wait for element by text "Current month"
    And Click on element by text "Current month"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Type"
    And Click on element by text "Type"
    And Wait for element by text "Outgoing transactions"
    And Click on element by text "Outgoing transactions"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Categories"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-title" to appear
    And Calculate sum of all transactions in transaction list and put in key "sumOfOutgoingTransactionsCurrentMonth"
    And Click "Back" content description from view tag "View"
    #Begining of calculation of incoming transactions for last month
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "second_personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "second_personal_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click on Filter button in my product
    And Wait for element by text "Date"
    And Click on element by text "Date"
    And Wait for element by text "Last month"
    And Click on element by text "Last month"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Type"
    And Click on element by text "Type"
    And Wait for element by text "Incoming transactions"
    And Click on element by text "Incoming transactions"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Categories"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-title" to appear
    And Calculate sum of all transactions in transaction list and put in key "sumOfIncomingTransactionsLastMonth"
    And Click "Back" content description from view tag "View"
    #Begining of calculation of outgoing transactions for last month
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "second_personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "second_personal_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click on Filter button in my product
    And Wait for element by text "Date"
    And Click on element by text "Date"
    And Wait for element by text "Last month"
    And Click on element by text "Last month"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Type"
    And Click on element by text "Type"
    And Wait for element by text "Outgoing transactions"
    And Click on element by text "Outgoing transactions"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Categories"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-title" to appear
    And Calculate sum of all transactions in transaction list and put in key "sumOfOutgoingTransactionsLastMonth"
    And Click "Back" content description from view tag "View"
    And Print these keys "sumOfIncomingTransactionsCurrentMonth" "sumOfOutgoingTransactionsCurrentMonth" "sumOfIncomingTransactionsLastMonth" "sumOfOutgoingTransactionsLastMonth"

    When Click "Finances" content description from view tag "View"
    And Wait for element by text "Cash flow"
    And Remember current value for cash flow under key "current_cash_flow"
    And Click on element by text "Cash flow"
    And Wait for element by text "Difference"
    And Assert cash flow difference is from key "current_cash_flow"
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by text "My accounts"
    And Assert element by contains text from excel "<rowindex>" columnName "personal_account_iban"
    And Assert element by contains text from excel "<rowindex>" columnName "second_personal_account_iban"
    And Assert account from excel "<rowindex>" columnName "auth_personal_account_iban" is not displayed
    And Assert account from excel "<rowindex>" columnName "shared_account_iban" is not displayed
    And Assert account from excel "<rowindex>" columnName "savings_account_iban" is not displayed
    And Assert account from excel "<rowindex>" columnName "gradual_savings_account_iban" is not displayed
    And Click on element by text from excel "<rowindex>" columnName "second_personal_account_iban"
    And Wait for element by text "Difference"
    And Assert current month on page in format "MMMM yyyy"
    And Wait "4" seconds
    And Assert incoming in cash flow is from key "sumOfIncomingTransactionsCurrentMonth"
    And Assert outgoing in cash flow is from key "sumOfOutgoingTransactionsCurrentMonth"
    And Assert difference in cash flow using keys "sumOfIncomingTransactionsCurrentMonth" and "sumOfOutgoingTransactionsCurrentMonth"
    And Assert next month button for cash flow is disabled
    And Click on previous month button for cash flow
    And Assert previous "1" month on page in format "MMMM yyyy"
    And Assert incoming in cash flow is from key "sumOfIncomingTransactionsLastMonth"
    And Assert outgoing in cash flow is from key "sumOfOutgoingTransactionsLastMonth"
    And Assert difference in cash flow using keys "sumOfIncomingTransactionsLastMonth" and "sumOfOutgoingTransactionsLastMonth"
    And Assert next month button for cash flow is enabled
    And Click on previous month button for cash flow
    And Assert previous "2" month on page in format "MMMM yyyy"
    And Click on previous month button for cash flow
    And Assert previous "3" month on page in format "MMMM yyyy"
    And Click on previous month button for cash flow
    And Assert previous "4" month on page in format "MMMM yyyy"
    And Click on previous month button for cash flow
    And Assert previous "5" month on page in format "MMMM yyyy"
    And Assert previous month button for cash flow is disabled
    And Click on element by text "12 months"
    And Assert current month on page in format "MMMM yyyy"
    And Wait "4" seconds
    And Assert incoming in cash flow is from key "sumOfIncomingTransactionsCurrentMonth"
    And Assert outgoing in cash flow is from key "sumOfOutgoingTransactionsCurrentMonth"
    And Assert difference in cash flow using keys "sumOfIncomingTransactionsCurrentMonth" and "sumOfOutgoingTransactionsCurrentMonth"
    And Assert next month button for cash flow is disabled
    And Click on previous month button for cash flow
    And Assert previous "1" month on page in format "MMMM yyyy"
    And Assert incoming in cash flow is from key "sumOfIncomingTransactionsLastMonth"
    And Assert outgoing in cash flow is from key "sumOfOutgoingTransactionsLastMonth"
    And Assert difference in cash flow using keys "sumOfIncomingTransactionsLastMonth" and "sumOfOutgoingTransactionsLastMonth"
    And Assert next month button for cash flow is enabled
    And Click on previous month button for cash flow
    And Assert previous "2" month on page in format "MMMM yyyy"
    And Click on previous month button for cash flow
    And Assert previous "3" month on page in format "MMMM yyyy"
    And Click on previous month button for cash flow
    And Assert previous "4" month on page in format "MMMM yyyy"
    And Click on previous month button for cash flow
    And Assert previous "5" month on page in format "MMMM yyyy"
    And Click on previous month button for cash flow
    And Assert previous "6" month on page in format "MMMM yyyy"
    And Click on previous month button for cash flow
    And Assert previous "7" month on page in format "MMMM yyyy"
    And Click on previous month button for cash flow
    And Assert previous "8" month on page in format "MMMM yyyy"
    And Click on previous month button for cash flow
    And Assert previous "9" month on page in format "MMMM yyyy"
    And Click on previous month button for cash flow
    And Assert previous "10" month on page in format "MMMM yyyy"
    And Click on previous month button for cash flow
    And Assert previous "11" month on page in format "MMMM yyyy"
    And Assert previous month button for cash flow is disabled


    Examples:
      | rowindex |
      |        4 |