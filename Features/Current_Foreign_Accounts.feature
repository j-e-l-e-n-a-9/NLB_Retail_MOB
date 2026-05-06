Feature: Current_Foreign_Accounts

  @Current_Foreign_Accounts-Product_Details-Financial-Details_Is_Not_Visible_[MOB_ANDROID]
  Scenario Outline: Current_Foreign_Accounts-Product_Details-Financial-Details_Is_Not_Visible_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear

#    When Scroll until element with BBAN from Excel "<rowindex>" columnName "second_personal_account_bban" is in the view
    When Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait element "Transactions" by text
#    And Assert product option buttons for Current foreign accounts
    And Assert element by contains text "Transactions"
    And Assert element "nlb-icon-button" by id
    And Click on element by text "Details"
    And Wait for element by text "Account details"
    And Assert element by text "Financial details" is not displayed
    And Click on element by desc "Back"
    And Click on element by desc "Back"

    Then Scroll until element with text from excel "<rowindex>" columnName "second_personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "second_personal_account_iban"
    And Wait element "Transactions" by text
#    And Assert product option buttons for Current foreign accounts
    And Assert element by contains text "Transactions"
    And Assert element "nlb-icon-button" by id

    And Click on element by text "Details"
    And Wait for element by text "Account details"
    And Assert element by text "Financial details" is not displayed


    Examples:
      | rowindex |
      |        1 |


   @Current_Foreign_Accounts_Product_Details_Account_Details_[MOB_ANDROID]
   Scenario Outline: Current_Foreign_Accounts_Product_Details_Account_Details_[MOB_ANDROID]

     Given Open Application
     And Select User from Excel "<rowindex>" columnName "username" and login
     And Wait for My NLB screen to load
     And Click on Bottom navigation button "My Products"
     And Wait for element by id "nlb-button-edit-products" to appear

     When Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
     And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
     And Wait element "Transactions" by text
#     And Assert product option buttons for Current foreign accounts
     And Assert element by text "Transactions"
     And Assert element by contains text "Details"
     And Click on element by text "Details"
     And Wait for element by text "Account details"

     Then Assert element by content desc "Copy account details"
     And Assert element by text "Account details"
     And Assert that text "Account type" has first following sibling that contains text "Current account"
     And Assert that text "Account owner" has first following sibling that contains from Excel "<rowindex>" columnName "account_details_owner"
     And Assert that text "IBAN" has first following sibling that contains from Excel "<rowindex>" columnName "personal_account_iban"
#     And Assert that text "IBAN" has first following sibling that contains from Excel "<rowindex>" columnName "second_personal_account_bban"
     And Assert that text "BIC" has first following sibling that contains text "KOBBRSBG"

     Examples:
       | rowindex |
       |        1 |


  @CURRENT_FOREIGN_ACCOUNTS-TRANSACTIONS-OVERVIEW_BY_DIFFERENT_CURRENCIES_[MOB_ANDROID]
  Scenario Outline: CURRENT_FOREIGN_ACCOUNTS-TRANSACTIONS-OVERVIEW_BY_DIFFERENT_CURRENCIES_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on Product from Excel "<rowindex>" columnName "personal_account_iban" in My Products
    And Wait for first transaction to load
    And Assert element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Assert element by text from excel "<rowindex>" columnName "personal_account_name"
    And Assert "Back" content description from view tag "View" is displayed

    When Assert currency card with currency "EUR" in product has correct "Current balance" and "Available balance"
    And Assert transactions in Product details are in currency "EUR"
    And Click on currency filter "EUR"
    And Wait for first transaction to load
    And Assert transactions in Product details are in currency "EUR"

    And Click on currency filter "USD"
    And Wait for first transaction with "USD" currency

    Then Assert currency card with currency "USD" in product has correct "Current balance" and "Available balance"
    And Assert transactions in Product details are in currency "USD"

    Examples:
      | rowindex |
      |        1 |


  @Current_Foreign_Account-Transactions-Filter_By_Type_[MOB_ANDROID]
  Scenario Outline: Current_Foreign_Account-Transactions-Filter_By_Type_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on Product from Excel "<rowindex>" columnName "personal_account_iban" in My Products

    And Wait for first transaction to load
    And Assert Product page for product with name from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert element with class "android.widget.TextView" and has text "Transactions" is displayed
    And Assert list of element by id "nlb-item-row" is displayed
    And Assert Transaction filter button in Product

#    When Assert transaction list is not sorted and has both Incoming and Outgoing transactions
    When Click Transaction filter button in Product
    And Wait first Transaction filter
    And Assert screen header is "Transaction filter"
    And Assert back button in screen "Transaction filter"
    And Assert Date transaction filter for Current account is displayed correctly
    And Assert Type transaction filter for Current account is displayed correctly
    And Assert Amount transaction filter for Current account is displayed correctly
    And Assert "Confirm" button is not enabled
    And Click on element by text "Type"
    And Wait for element by id "nlb-radio-button-ALL" to appear
    And Assert screen header is "Set type"
    And Assert element by content desc "Back"
    And Assert element "nlb-radio-button-ALL" by id
    And Assert element "nlb-radio-button-INCOMING" by id
    And Assert element "nlb-radio-button-OUTGOING" by id
    And Assert "Apply" button primary is enabled
    And Assert Type transaction filter options are correct
    And Assert Type transaction filter that is currently selected is one with id "nlb-radio-button-ALL"

    #Incoming transactions
    Then Click on element by id "nlb-radio-button-INCOMING"
    And Assert Type transaction filter that is currently selected is one with id "nlb-radio-button-INCOMING"
    And Assert "Apply" button primary is enabled
    And Click on element by id "nlb-button-primary"
    And Wait first Transaction filter
    And Assert subtitle of Transaction filter "Type" is "Incoming transactions"
    And Assert "Confirm" button primary is enabled
    And Assert "Clear filters" button alternate is enabled
    And Click on element by id "nlb-button-primary"
    And Wait for first transaction to load after filter
    And Assert transaction list is sorted to only show Incoming transactions

#    And Scroll element up into view by xPath "//android.widget.TextView[@text='Transactions']/following-sibling::android.view.View[1]"
    And Click Transaction filter button in Product
    And Wait first Transaction filter
    And Assert subtitle of Transaction filter "Type" is "Incoming transactions"
    And Click on element by text "Type"
    And Wait for element by id "nlb-radio-button-ALL" to appear
    And Assert "Apply" button primary is enabled
    And Assert Type transaction filter that is currently selected is one with id "nlb-radio-button-INCOMING"

    #Outgoing transactions
    And Click on element by id "nlb-radio-button-OUTGOING"
    And Assert Type transaction filter that is currently selected is one with id "nlb-radio-button-OUTGOING"
    And Assert "Apply" button primary is enabled
    And Click on element by id "nlb-button-primary"
    And Wait first Transaction filter
    And Assert subtitle of Transaction filter "Type" is "Outgoing transactions"
    And Assert "Confirm" button primary is enabled
    And Assert "Clear filters" button alternate is enabled
    And Click on element by id "nlb-button-primary"
    And Wait for first transaction to load after filter
    And Assert transaction list is sorted to only show Outgoing transactions

    Examples:
      | rowindex |
      |        2 |


  @Current_Foreign_Accounts-Transactions-Filter_By_Amount_[MOB_ANDROID]
  Scenario Outline: Current_Foreign_Accounts-Transactions-Filter_By_Amount_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click "My Products"
    And Wait for first product in My products page
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"

    When Wait for first transaction to load
    And Assert Product page for product with name from Excel "<rowindex>" columnName "personal_account_iban"
#    And Assert product option buttons for Current foreign accounts
    And Assert element with class "android.widget.TextView" and has text "Transactions" is displayed

    And Click Transaction filter button in Product
    And Wait for element by text "Transaction filter"
    And Assert Date transaction filter for Current account is displayed correctly
    And Assert Type transaction filter for Current account is displayed correctly
    And Assert Amount transaction filter for Current account is displayed correctly
#    And Assert Currency transaction filter is displayed correctly

    And Click on element by text "Amount"
    And Wait for element by text "From"
    And Assert element by text "From"
    And Assert element by text "To"
    And Assert currencies in From and To input field is "EUR"

    And Enter text "117000" into input field "From" in amount filter
    And Enter text "300000" into input field "To" in amount filter

    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Transaction filter"
    And Click on element by id "nlb-button-primary"

    And Wait for element by id "nlb-title" to appear
    And Assert filtered amounts have values between "117000" and "300000"

   #new example
    Then Click Transaction filter button in Product
    And Wait for element by text "Transaction filter"
    And Click on element by id "nlb-button-alternate"
    And Assert Date transaction filter for Current account is displayed correctly
    And Assert Type transaction filter for Current account is displayed correctly
    And Assert Amount transaction filter for Current account is displayed correctly
#    And Assert Currency transaction filter is displayed correctly

    And Assert element by text "Date"
    And Assert element by text "Type"
    And Assert element by text "Amount"

    And Click on element by text "Amount"
    And Wait for element by text "From"
    And Assert element by text "From"
    And Assert element by text "To"
    And Assert currencies in From and To input field is EUR

    And Enter text "116,11" into input field "From" in amount filter
    And Enter text "10322,15" into input field "To" in amount filter

    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Transaction filter"
    And Click on element by id "nlb-button-primary"

    And Wait for element by id "nlb-title" to appear
    And Assert filtered amounts have values between "116.11" and "10322.15"

    Examples:
      | rowindex |
      |        1 |


  @Current_Foreign-Transactions-Filter-Multiple_Filter_[MOB_ANDROID]
  Scenario Outline: Current_Foreign-Transactions-Filter-Multiple_Filter_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"

    When Wait for first transaction to load
    And Click Transaction filter button in Product
    And Click on element by text "Date"
    And Click on calendar icon with index "1"
    And Click on date in Calendar with year 2025 month 6 day 8 and assert that it is shown correctly
    And Click on element by text "Add filter"
    And Click on calendar icon with index "2"
    And Click on date in Calendar with year 2025 month 7 day 14 and assert that it is shown correctly
    And Click on element by text "Add filter"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Type"
    And Click on element by text "Type"
    And Wait for element by text "Incoming transactions"
    And Click on element by text "Outgoing transactions"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Amount"

    Then Click on element by text "Amount"
    And Wait for element by text "From"
    And Enter text "117000" into input field "From" in amount filter
    And Enter text "300000" into input field "To" in amount filter
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Date"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-title" to appear
#    And Assert transaction list is sorted to match conditions "3.2.2025" "3.5.2025" "Incoming" "RSD" 100 100000
    And Assert transactions amounts are between "117000" and "300000" and transactions dates are between "08.06.2025" and "14.06.2025" and transactions types are "outgoing"

    Examples:
      | rowindex |
      |        1 |


  @Current_Foreign_Accounts-Transactions-Filter-Invalid_[MOB_ANDROID]
  Scenario Outline: Current_Foreign_Accounts-Transactions-Filter-Invalid_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear

    When Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for first transaction to load
    And Assert element by contains text "Transactions"
    And Assert element "nlb-icon-button" by id

    And Click on element by desc "Filters"
    And Assert element by text "Date"
    And Assert element by text "Type"
    And Assert element by text "Amount"

    And Click on element by text "Date"
    And Assert element "nlb-radio-button-LAST_7_DAYS" by id
    And Assert element "nlb-radio-button-THIS_MONTH" by id
    And Assert element "nlb-radio-button-LAST_MONTH" by id

    And Assert element by text "Custom date range"
    And Assert element "nlb-radio-button-CUSTOM_DATE_RANGE" by id
    And Assert element "nlb-input-date-from-click-area" by id
    And Assert element "nlb-input-date-to-click-area" by id

    Then Click on element by id "nlb-input-date-to-click-area"
    And Click on date in Calendar with year 2026 month 1 day 10 and assert that it is shown correctly
#    And Click on element by text "Apply"
    And Click on element by text "Add filter"

    And Click on element by id "nlb-input-date-from-click-area"
    And Check if element by text "Friday, January 9, 2026" is enabled
    And Check if element by text "Sunday, January 11, 2026" is not enabled

    Examples:
      | rowindex |
      |        1 |


  @Current_Foreign_Accounts-Transactions-Filter-Clear_Filter_[MOB_ANDROID]
  Scenario Outline: Current_Foreign_Accounts-Transactions-Filter-Clear_Filter_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"

    When Wait for first transaction to load
    And Click Transaction filter button in Product
    And Click on element by text "Type"
    And Wait for element by text "Incoming transactions"
    And Click on element by text "Incoming transactions"
    And Click on element by id "nlb-button-primary"
    And Assert element by text "Incoming transactions"
    And Click on element by text "Amount"
    And Wait for element by text "From"
    And Enter text "1" into input field "From" in amount filter
    And Enter text "5" into input field "To" in amount filter
    And Click on element by id "nlb-button-primary"
    And Assert element by text "1,00 - 5,00"
    And Click on element by text "Date"
    And Click on element by text "Last month"
    And Click on element by id "nlb-button-primary"
    And Wait first Transaction filter

    Then Click on element by text "Clear filters"
    And Assert Date transaction filter for Current account is displayed correctly
    And Assert Type transaction filter for Current account is displayed correctly
    And Assert Amount transaction filter for Current account is displayed correctly

    Examples:
      | rowindex |
      |        1 |


  @Current_Foreign_Accounts-Transactions-Search_Invalid_[MOB_ANDROID]
  Scenario Outline: Current_Foreign_Accounts-Transactions-Search_Invalid_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click "My Products"
    And Wait for first product in My products page
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"

    When Wait for first transaction to load
    And Assert Product page for product with name from Excel "<rowindex>" columnName "personal_account_iban"
#    And Assert product option buttons for Current foreign accounts
    And Assert element with class "android.widget.TextView" and has text "Transactions" is displayed

    And Assert Filter icon is displayed
    And Assert Search field is displayed

    #invalid input - special characters
    Then Search invalid filter "=@"
    And Assert error message for invalid search
    And Click on Clear search

    #TODO tj otkomentarisati kad bude radilo u app

    #invalid input - empty field
#    And Search invalid filter ""
#    And Assert error message for invalid search
#    And Click on Clear search

    #invalid input - emojis
    And Search invalid filter emoji
    And Assert error message for invalid search
    And Click on Clear search

    Examples:
      | rowindex |
      |        1 |