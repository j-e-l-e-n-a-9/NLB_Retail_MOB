Feature: Current_Accounts

#  @Current_Accounts-Transactions_Details-Create_Confirmation_[MOB_ANDROID]
#  Scenario Outline: Current_Accounts-Transactions_Details-Create_Confirmation_[MOB_ANDROID]
#
#    Given Open Application
#    And Select User from Excel "<rowindex>" columnName "username" and login
#    And Wait for element by resource id "nlb-bottom-nav-button" to appear
#    And Click "My Products"
#    And Wait for element by text "Edit list"
#    And Click on Product from Excel "<rowindex>" columnName "currentDomesticAccountBBAN" in My Products
#
#    When Wait for first transaction to load
#    And Assert Product page for product with name from Excel "<rowindex>" columnName "currentDomesticAccountBBAN"
#    And Assert element with class "android.widget.TextView" and has text "Transactions" is displayed
#    And Click on first outgoing transaction
#
#    And Wait element "Confirmation" by text
#    And Assert buttons Get receipt and Send complaint are displayed in Transaction details
##    And Remember transaction details
#    And Click on button "Confirmation" in transaction details
#
#    Then Assert element by complete id "com.google.android.apps.docs:id/projector_toolbar"
##    And Assert transaction details by remembered values
#    And Go Back
#
#    Examples:
#      | rowindex |
#      |        1 |


    #Vidi da li ovaj test ispod uopste treba da postoji. Nema ga u Excel tabeli

#  @Current_Accounts_Transactions_Details_Transaction_Confirmation_[MOB_ANDROID]
#  Scenario Outline: Current_Accounts_Transactions_Details_Transaction_Confirmation_[MOB_ANDROID]
#
#    Given Open Application
#    And Select User from Excel "<rowindex>" columnName "username" and login
#    And Wait for element by resource id "nlb-bottom-nav-button" to appear
#    And Click on element by text "My Products"
#
#    When Scroll until element with text from excel "<rowindex>" columnName "second_personal_account_bban" is in view
#    And Click on Product from Excel "<rowindex>" columnName "second_personal_account_bban" in My Products
#    And Wait for element by text "Available balance"
#    And Assert account number is displayed in BBAN format by xPath "//android.widget.TextView[@text=\"205-9001015647000-10\"]"
#    And Assert account name from excel "<rowindex>" column name "currentDomesticAccountName" is displayed
#    #Available balance
#    And Assert amount and currency are displayed by Android xpath "//android.widget.TextView[@resource-id=\"nlb-product-details-primary-balance\"]"
#    #Current balance
#    Then Assert amount and currency are displayed by Android xpath "//android.widget.TextView[@resource-id=\"nlb-product-details-secondary-balance\"]"
#    And Scroll down until element with text "Porez na kapitalnu dobit" is in view
#    And Click on element by text "Porez na kapitalnu dobit"
#    And Assert element by xPath "//android.widget.TextView[@text=\"Confirmation\"]" is displayed
#    And Click on element by text "Confirmation"
#
#    Examples:
#      | rowindex |
#      |        2 |


  @Products-Current_Account-Cheques_[MOB_ANDROID]
  Scenario Outline: Products-Current_Account-Cheques_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products"
    And Wait for element by text "Edit list"
    And Swipe to element by text from Excel "<rowindex>" columnName "currentDomesticAccountBBAN" and click on it
    And Wait for first transaction to load

    And Assert element by text "Available balance"
    And Assert element by id "nlb-product-details-primary-balance" ends in "RSD"
    And Assert element by text "Current balance"
    And Assert element by id "nlb-product-details-secondary-balance" ends in "RSD"
    And Assert product option buttons for Current domestic accounts
#    And Assert element by text "Card settings"
#    And Assert element by text "Cheques"
#    And Assert element by text "Details"
#    And Assert element by text "Statements"
#    And Assert element by text "Currency exchange"
    And Assert element by text "Transactions"
    And Assert element "nlb-icon-button" by id
    And Assert element by text "Search..."

    Then Click "Cheques" content description from view tag "View"
    And Wait for element by id "nlb-dropdown-menu" to appear

    And Assert element by text "Cheque number"
    And Assert Cheque numbers is displayed in proper format

    And Assert element by text "Issue date"
    And Assert "Issue date" date value is in valid date format

    And Assert element by text "Status"
    And Assert status value is Realized or Unrealized or Canceled

    #TO DO ZA REALIZED CEKOVE:
    #1. Realization date
    #2. Amount
    #3. Description

    And Remember first cheque number under key "chequeNumberKey"
    And Remember first issue date under key "dateKey"
    And Remember first status value under key "amountKey"

    And Click on element by id "cheque-edit-button" and contains text "Edit"
    And Assert cheque number is same under key "chequeNumberKey"
    And Assert issue date is same under key "dateKey"
    And Assert status value is same under key "amountKey"

    And Assert element by text "Realization date"
    And Click on element by desc "Set date"
    And Click on date in Calendar with year 2025 month 12 day 24 and assert that it is shown correctly
    And Click on element by text "Add filter"

    And Assert element by text "Amount"
    And Enter amount "100" into amount textbox
    And Assert element by text "RSD"

    And Assert element by text "Description"
    And Enter text "Opis realizacije" into description textbox
    And Assert element by contains text "characters left"

    And Assert element by text "Cancel"
    And Assert element by text "Save"
    And Click on element by text "Save"

    And Assert element by text "Realization date"
    And Assert element by text "24.12.2025"
    And Assert element by text "Amount"
    And Assert element by text "100,00 RSD"
    And Assert element by text "Description"
    And Assert element by text "Opis realizacije"

    Examples:
      | rowindex |
      |        2 |


  @Products-Current_Account-Cheques-Input_Fields-invalid_[MOB_ANDROID]
  Scenario Outline: Products-Current_Account-Cheques-Input_Fields-invalid_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products"
    And Wait for element by text "Edit list"
    And Swipe to element by text from Excel "<rowindex>" columnName "currentDomesticAccountBBAN" and click on it
    And Wait for first transaction to load

    And Assert element by text "Available balance"
    And Assert element by id "nlb-product-details-primary-balance" ends in "RSD"
    And Assert element by text "Current balance"
    And Assert element by id "nlb-product-details-secondary-balance" ends in "RSD"
    And Assert product option buttons for Current domestic accounts
#    And Assert element by text "Cheques"
#    And Assert element by text "Details"
#    And Assert element by text "Statements"
#    And Assert element by text "Currency exchange"
    And Assert element by text "Transactions"
    And Assert element "nlb-icon-button" by id
    And Assert element by text "Search..."

    Then Click "Cheques" content description from view tag "View"
    And Wait for element by id "nlb-dropdown-menu" to appear
    And Assert element "nlb-dropdown-menu" by id

    And Assert element by text "Cheque number"
    And Assert Cheque numbers is displayed in proper format

    And Assert element by text "Issue date"
    And Assert "Issue date" date value is in valid date format

    And Assert element by text "Status"
    And Assert status value is Realized or Unrealized or Canceled

    And Click on element by id "cheque-edit-button"
    And Enter text "Lorem ipsum dolor sit." into Description input field
    And Assert element by text "0 characters left"
    And Assert button with text "Save" is disabled

    #TO DO ZA REALIZED CEKOVE:
    #1. Realization date
    #2. Amount
    #3. Description

    Examples:
      | rowindex |
      |        2 |


  @Products-Current_Account-Cheques-Filter_[MOB_ANDROID]
  Scenario Outline: Products-Current_Account-Cheques-Filter_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products"
    And Wait for element by text "Edit list"
    And Swipe to element by text from Excel "<rowindex>" columnName "currentDomesticAccountBBAN" and click on it
    And Wait for first transaction to load

    And Assert element by text "Available balance"
    And Assert element by id "nlb-product-details-primary-balance" ends in "RSD"
    And Assert element by text "Current balance"
    And Assert element by id "nlb-product-details-secondary-balance" ends in "RSD"
    And Assert product option buttons for Current domestic accounts
#    And Assert element by text "Cheques"
#    And Assert element by text "Details"
#    And Assert element by text "Statements"
#    And Assert element by text "Currency exchange"
    And Assert element by text "Transactions"
    And Assert element "nlb-icon-button" by id
    And Assert element by text "Search..."

    Then Click "Cheques" content description from view tag "View"
    And Wait for element by id "nlb-dropdown-menu" to appear

    And Assert element by text "Cheque number"
    And Assert Cheque numbers is displayed in proper format

    And Assert element by text "Issue date"
    And Assert "Issue date" date value is in valid date format

    And Assert element by text "Status"
    And Assert status value is Realized or Unrealized or Canceled

    And Click on element by id "nlb-dropdown-menu"
    And Click on element by text "Unrealized"
    And Assert all cheques have status "Unrealized"

    And Click on element by id "nlb-dropdown-menu"
    And Click on element by text "Realized"
    And Assert all cheques have status "Realized"

    And Click on element by id "nlb-dropdown-menu"
    And Click on element by text "Cancelled"
    And Assert all cheques have status "Cancelled"

    #TO DO ZA REALIZED CEKOVE:
    #1. Realization date
    #2. Amount
    #3. Description

    Examples:
      | rowindex |
      |        2 |