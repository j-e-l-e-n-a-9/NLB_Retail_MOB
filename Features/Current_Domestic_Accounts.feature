Feature: Current_Domestic_Accounts



  @Current_Domestic_Accounts-Transactions-Search_[MOB_ANDROID]
  Scenario Outline: Current_Domestic_Accounts-Transactions-Search_[MOB_ANDROID]

    Given Open Application
    #And Wait "100" seconds
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    #Open My products page
    When Click "My Products"
    And Wait for element by text "Edit list"
    #Open current account
    And Click on Product from Excel "<rowindex>" columnName "third_personal_account_iban" in My Products

    And Wait for first transaction to load
    And Assert Product page for product with name from Excel "<rowindex>" columnName "third_personal_account_iban"
    And Assert element with class "android.widget.TextView" and has text "Transactions" is displayed

    And Assert Filter icon is displayed
    And Assert Search field is displayed

    And Remember default number of transactions
    And Search transactions by detail from excel "<rowindex>" columnName "search_purpose"
    And Wait "5" seconds
    And Wait for first transaction to load
    And Assert transactions are filtered by searchValue from column "search_purpose"
    And Click on Clear search
    And Wait for first transaction to load
    #And Assert there are default number of transactions

    #TO-DO Ostale opcije za search filtete - mogu se koristiti svi isti koraci, samo promijeniti columnName





    Examples:
      | rowindex |
      |        1 |

  @Current_Domestic_Accounts-Transactions-Search_Invalid_[MOB_ANDROID]
  Scenario Outline: Current_Domestic_Accounts-Transactions-Search_Invalid_[MOB_ANDROID]

    Given Open Application
    #And Wait "100" seconds
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    #Open My products page
    When Click "My Products"
    And Wait for element by text "Edit list"
    #Open current account
    And Click on Product from Excel "<rowindex>" columnName "third_personal_account_iban" in My Products

    And Wait for first transaction to load
    And Assert Product page for product with name from Excel "<rowindex>" columnName "third_personal_account_iban"
    And Assert element with class "android.widget.TextView" and has text "Transactions" is displayed

    And Assert Filter icon is displayed
    And Assert Search field is displayed

    #invalid input - special characters
    And Search invalid filter "=@"
    And Assert error message for invalid search
    And Click on Clear search

    #TO-DO tj otkomentarisati kad bude radilo u app

    #invalid input - empty field
    #And Search invalid filter ""
    #And Assert error message for invalid search
    #And Click on Clear search

    #invalid input - emojis
    And Search invalid filter emoji
    And Assert error message for invalid search
    And Click on Clear search




    Examples:
      | rowindex |
      |        1 |

  @Current_Domestic_Accounts-Transactions-Filter_By_Amount_[MOB_ANDROID]
  Scenario Outline: Current_Domestic_Accounts-Transactions-Filter_By_Amount_[MOB_ANDROID]

    Given Open Application
    #And Wait "100" seconds
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    #Open My products page
    When Click "My Products"
    And Wait for element by text "Edit list"
    #Open current account
    And Click on Product from Excel "<rowindex>" columnName "third_personal_account_iban" in My Products

    And Wait for first transaction to load
    And Assert Product page for product with name from Excel "<rowindex>" columnName "third_personal_account_iban"
    And Assert element with class "android.widget.TextView" and has text "Transactions" is displayed

    And Click Transaction filter button in Product
    And Wait for element by text "Transaction filter"
    
    And Assert element by text "Date"
    And Assert element by text "Type"
    And Assert element by text "Currency"
    And Assert element by text "Amount"

    And Click on element by text "Amount"
    And Wait for element by text "From"
    And Assert element by text "From"
    And Assert element by text "To"

    And Enter text "100000" into input field "From" in amount filter
    And Enter text "150000" into input field "To" in amount filter

    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Transaction filter"
    And Click on element by id "nlb-button-primary"

    And Wait for element by id "nlb-title" to appear

    Then Assert filtered amounts have values between "100000" and "150000"

    Examples:
      | rowindex |
      |        1 |

##
  @Domestic_Account_Filter_By_Type[MOB_ANDROID]
  Scenario Outline: Domestic_Account_Filter_By_Type[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    #And Change language to english
    When Click "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear
    And Click on Product from Excel "<rowindex>" columnName "second_personal_account_iban" in My Products

    When Wait for first transaction to load
    And Assert Product page for product with name from Excel "<rowindex>" columnName "second_personal_account_iban"
    And Assert element with class "android.widget.TextView" and has text "Transactions" is displayed
    And Assert list of element by id "nlb-item-row" is displayed
    And Assert Transaction filter button in Product

    #All transactions
    #TODO: Vratiti ovaj korak kad bude realease u kome je popravljen format amounta Then Assert transaction list is not sorted and has both Incoming and Outgoing transactions
    And Click Transaction filter button in Product
    And Wait first Transaction filter
    And Assert screen header is "Transaction filter"
    And Assert back button in screen "Transaction filter"
    And Assert Date transaction filter is displayed correctly
    And Assert Type transaction filter is displayed correctly
    And Assert Currency transaction filter is displayed correctly
    And Assert Amount transaction filter is displayed correctly
    And Assert "Apply" button is not enabled
    And Click on element by text "Type"
    And Wait for element by id "nlb-radio-button-ALL" to appear
    #And Assert screen header is "Set type"
    # Assert back button in screen "Set type"
    And Assert element "nlb-radio-button-ALL" by id
    And Assert element "nlb-radio-button-INCOMING" by id
    And Assert element "nlb-radio-button-OUTGOING" by id
    And Assert "Apply" button primary is enabled
    And Assert Type transaction filter options are correct
    And Assert Type transaction filter that is currently selected is one with id "nlb-radio-button-ALL"

    #Incoming transactions
    And Click on element by id "nlb-radio-button-INCOMING"
    And Assert Type transaction filter that is currently selected is one with id "nlb-radio-button-INCOMING"
    And Assert "Apply" button primary is enabled
    And Click on element by id "nlb-button-primary"
    And Wait first Transaction filter
    And Assert subtitle of Transaction filter "Type" is "Incoming transactions"
    And Assert "Apply" button primary is enabled
    And Assert "Clear filters" button alternate is enabled
    And Click on element by id "nlb-button-primary"
    And Wait for first transaction to load after filter
    And Assert transaction list is sorted to only show Incoming transactions

    And Scroll element up into view by xPath "//android.widget.TextView[@text='Transactions']/following-sibling::android.view.View[1]"
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
    And Assert "Apply" button primary is enabled
    And Assert "Clear filters" button alternate is enabled
    And Click on element by id "nlb-button-primary"
    And Wait for first transaction to load after filter
    #TODO: Poslednji korak radi, trenutno pada jer u ovom release nije resen problem sa ispisom amounta (-3300,00 umesto -3.300,00)
    And Assert transaction list is sorted to only show Outgoing transactions


    Examples:
      | rowindex |
      |        2 |

  @Current_Accounts-Transactions-Filter-Multiple_Filter_[MOB_ANDROID]
  Scenario Outline: Current_Accounts-Transactions-Filter-Multiple_Filter_[MOB_ANDROID]
    #C70835

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear
    And Click on Product from Excel "<rowindex>" columnName "second_personal_account_iban" in My Products

    When Wait for first transaction to load
    And Click Transaction filter button in Product
    And Click on element by text "Date"
    And Click on calendar icon with index "1"

    And Click on date in Calendar with year 2025 month 2 day 3 and assert that it is shown correctly
    And Click on element by text "Apply"
    And Click on calendar icon with index "2"
    And Click on date in Calendar with year 2025 month 5 day 3 and assert that it is shown correctly
    And Click on element by text "Apply"
    #And Click on today date in Calendar and assert that it is shown correctly
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Type"
    And Click on element by text "Type"
    And Wait for element by text "Incoming transactions"
    And Click on element by text "Incoming transactions"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Amount"
    And Click on element by text "Currency"
    And Click on element by text "EUR"
    And Click on element by text "Confirm"

    And Click on element by text "Amount"
    And Wait for element by text "From"
    And Enter text "100" into input field "From" in amount filter
    And Enter text "100000" into input field "To" in amount filter
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Date"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-title" to appear
    And Assert transaction list is sorted to match conditions "3.2.2025" "3.5.2025" "Incoming" "EUR" 100 100000


    Examples:
      | rowindex |
      | 2        |

  @Current_Accounts-Transactions-Filter-Clear-Filter[MOB_ANDROID]
  Scenario Outline: Currente_Accounts-Transactions-Filter-Clear-Filter[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear
    And Click on Product from Excel "<rowindex>" columnName "second_personal_account_iban" in My Products

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
    And Click on element by text "Clear filters"
    And Assert element by text "1,00 - 5,00" is not displayed
    And Assert element by text "Incoming transactions" is not displayed
    Examples:
      | rowindex |
      | 2        |


  @Current_Domestic_Accounts_Transactions_Filter_By_Date_CustomDateRange_[MOB_ANDROID]
  Scenario Outline: Current_Domestic_Accounts_Transactions_Filter_By_Date_CustomDateRange_[MOB_ANDROID]
    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    And Click on element by text "My Products"
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"

    And Wait for first transaction to load
    And Assert element with class "android.widget.TextView" and has text "Transactions" is displayed
    And Assert list of element by id "nlb-item-row" is displayed
    And Assert Transaction filter button in Product
    And Click Transaction filter button in Product
    And Wait first Transaction filter

    And Assert screen header is "Transaction filter"
    And Assert back button in screen "Transaction filter"
    And Assert Date transaction filter is displayed correctly
    And Assert Type transaction filter is displayed correctly
    And Assert Currency transaction filter is displayed correctly
    And Assert Amount transaction filter is displayed correctly
    And Assert "Apply" button is not enabled

    And Click on element by text "Date"
    And Wait for element by id "nlb-radio-button-LAST_7_DAYS" to appear
    And Assert screen header is "Date"
    And Assert back button in screen "Date"
    And Assert element "nlb-radio-button-LAST_7_DAYS" by id
    And Assert element "nlb-radio-button-THIS_MONTH" by id
    And Assert element "nlb-radio-button-LAST_MONTH" by id
    And Assert element "nlb-radio-button-CUSTOM_DATE_RANGE" by id
    And Assert element "nlb-input-date-from-click-area" by id
    And Assert element "nlb-input-date-to-click-area" by id
    And Assert From label in Date transactions filter
    And Assert To label in Date transactions filter
    And Assert From field is correctly displayed in Date transactions filter
    And Assert To field is correctly displayed in Date transactions filter
    And Assert Type transaction filter that is currently selected is one with id "nlb-radio-button-LAST_7_DAYS"
    And Assert "Apply" button primary is enabled

    When Click on element by id "nlb-input-date-from-click-area"
    And Click on date in Calendar with year 2025 month 5 day 8 and assert that it is shown correctly
    And Assert button Cancel in Calendar is enabled
    And Assert button Apply in Calendar is enabled
    And Click on button Apply in Calendar
    And Assert From field in Date transactions filter has date year 2025 month 5 day 8

    And Click on element by id "nlb-input-date-to-click-area"
    And Click on date in Calendar with year 2025 month 7 day 8 and assert that it is shown correctly
    And Assert button Cancel in Calendar is enabled
    And Assert button Apply in Calendar is enabled
    And Click on button Apply in Calendar
    And Assert To field in Date transactions filter has date year 2025 month 7 day 8

    And Click on element by id "nlb-button-primary"
    And Assert subtitle of Transaction filter Date is correct for dates year 2025 month 5 day 8 and year 2025 month 7 day 8
    And Assert "Apply" button primary is enabled
    And Assert "Clear filters" button alternate is enabled
    And Click on element by text "Apply"
    And Wait for first transaction to load after filter

    Then Assert transactions dates are between dates year 2025 month 5 day 8 and year 2025 month 7 day 8

    Examples:
      | rowindex |
      |        3 |


  @Current_Domestic_Accounts_Transactions_Details_Transaction_Confirmation_[MOB_ANDROID]
  Scenario Outline: Current_Domestic_Accounts_Transactions_Details_Transaction_Confirmation_[MOB_ANDROID]
    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    And Click on element by text "My Products"

    When Scroll down until element with text "205-9001015647000-10" is in view
    And Click on element by contains text "-10"
    And Wait for element by text "Available balance"
    And Assert account number is displayed in BBAN format by xPath "//android.widget.TextView[@text=\"205-9001015647000-10\"]"
    And Assert account name from excel "<rowindex>" column name "currentDomesticAccountName" is displayed
    #Available balance
    And Assert amount and currency are displayed by Android xpath "//android.widget.TextView[@resource-id=\"nlb-product-details-primary-balance\"]"
    #Current balance
    And Assert amount and currency are displayed by Android xpath "//android.widget.TextView[@resource-id=\"nlb-product-details-secondary-balance\"]"
    And Scroll down until element with text "Porez na kapitalnu dobit" is in view
    And Click on element by text "Porez na kapitalnu dobit"
    And Assert element by xPath "//android.widget.TextView[@text=\"Confirmation\"]" is displayed
    And Click on element by text "Confirmation"

    Examples:
      | rowindex |
      |        2 |
