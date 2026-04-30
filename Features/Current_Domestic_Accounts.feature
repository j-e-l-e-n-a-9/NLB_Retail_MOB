Feature: Current_Domestic_Accounts

  @Current_Domestic_Accounts-Transactions-Search_[MOB_ANDROID]
  Scenario Outline: Current_Domestic_Accounts-Transactions-Search_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click "My Products"
    And Wait for element by text "Edit list"
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"

    When Wait for first transaction to load
    And Assert Product page for product with name from Excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Assert product option buttons for Current domestic accounts
    And Assert element with class "android.widget.TextView" and has text "Transactions" is displayed

    And Assert Filter icon is displayed
    And Assert Search field is displayed

#    Then Remember default number of transactions
#    Then Search transactions by detail from excel "<rowindex>" columnName "search_purpose"
    And Enter text "internal" into EditText element and remember it under key "search_purpose"
#    And Hide keyboard
#    And Wait "5" seconds
    And Wait for first transaction to load
    And Assert transactions are filtered by searchValue from column "search_purpose"
    And Click on Clear search
    And Wait for first transaction to load
    And Assert transaction list is not sorted and has both Incoming and Outgoing transactions

    #TODO Ostale opcije za search filtete - mogu se koristiti svi isti koraci, samo promijeniti columnName

    Examples:
      | rowindex |
      |        4 |

  @Current_Domestic_Accounts-Transactions-Search_Invalid_[MOB_ANDROID]
  Scenario Outline: Current_Domestic_Accounts-Transactions-Search_Invalid_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click "My Products"
    And Wait for first product in My products page
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"

    When Wait for first transaction to load
    And Assert Product page for product with name from Excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Assert product option buttons for Current domestic accounts
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
      |        4 |

  @Current_Domestic_Accounts-Transactions-Filter_By_Amount_[MOB_ANDROID]
  Scenario Outline: Current_Domestic_Accounts-Transactions-Filter_By_Amount_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click "My Products"
    And Wait for first product in My products page
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"

    When Wait for first transaction to load
    And Assert Product page for product with name from Excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Assert product option buttons for Current domestic accounts
    And Assert element with class "android.widget.TextView" and has text "Transactions" is displayed

    And Click Transaction filter button in Product
    And Wait for element by text "Transaction filter"

    And Assert element by text "Date"
    And Assert element by text "Type"
    And Assert element by text "Amount"

    And Click on element by text "Amount"
    And Wait for element by text "From"
    And Assert element by text "From"
    And Assert element by text "To"
    And Assert currencies in From and To input field is RSD

    And Enter text "8" into input field "From" in amount filter
    And Enter text "101" into input field "To" in amount filter

    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Transaction filter"
    And Click on element by id "nlb-button-primary"

    And Wait for element by id "nlb-title" to appear
    And Assert filtered amounts have values between "8" and "101"

   #new example
    Then Click Transaction filter button in Product
    And Wait for element by text "Transaction filter"

    And Assert element by text "Date"
    And Assert element by text "Type"
    And Assert element by text "Amount"

    And Click on element by text "Amount"
    And Wait for element by text "From"
    And Assert element by text "From"
    And Assert element by text "To"
    And Assert currencies in From and To input field is RSD

    And Enter text "5150,11" into input field "From" in amount filter
    And Enter text "10322,15" into input field "To" in amount filter

    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Transaction filter"
    And Click on element by id "nlb-button-primary"

    And Wait for element by id "nlb-title" to appear
    And Assert filtered amounts have values between "5150.11" and "10322.15"

    Examples:
      | rowindex |
      |        4 |


  @Current_Domestic_Accounts-Transactions-Filter_By_Amount_Invalid_[MOB_ANDROID]
  Scenario Outline: Current_Domestic_Accounts-Transactions-Filter_By_Amount_Invalid_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    And Click "My Products"
    And Wait for element by text "Edit list"
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"

    And Wait for first transaction to load
    And Assert Product page for product with name from Excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Assert product option buttons for Current domestic accounts
    And Assert element with class "android.widget.TextView" and has text "Transactions" is displayed

    When Click Transaction filter button in Product
    And Wait for element by text "Transaction filter"

    And Assert element by text "Date"
    And Assert element by text "Type"
    And Assert element by text "Amount"

    And Click on element by text "Amount"
    And Wait for element by text "From"
    And Assert element by text "From"
    And Assert element by text "To"
    And Assert currencies in From and To input field is RSD

    Then Enter text "100000" into input field "From" in amount filter
    And Enter text "50000" into input field "To" in amount filter

    And Assert element by contains text "Invalid amount range. The minimum amount cannot be greater than the maximum amount."

    Examples:
      | rowindex |
      |        4 |


  @Current_Domestic_Accounts-Transactions-List_[MOB_ANDROID]
  Scenario Outline: Current_Domestic_Accounts-Transactions-List_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load

    When Click "My Products"
    And Wait for first product in My products page
    And Click on Product from Excel "<rowindex>" columnName "currentDomesticAccountBBAN" in My Products

    Then Wait for first transaction to load
    And Assert Product page for product with name from Excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Assert product option buttons for Current domestic accounts
    And Assert element with class "android.widget.TextView" and has text "Transactions" is displayed
    And Swipe vertical
    And Assert list of element by id "nlb-date" is displayed
    And Assert list of element by id "nlb-currency" is displayed
    And Assert list of element by id "nlb-title" is displayed
    And Assert list of element by id "nlb-amount" is displayed
    And Assert list of element by id "nlb-details" is displayed

    Examples:
      | rowindex |
      |        4 |


  @Current_Domestic_Account-Transactions-Filter_By_Type_[MOB_ANDROID]
  Scenario Outline: Current_Domestic_Account-Transactions-Filter_By_Type_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear
    And Click on Product from Excel "<rowindex>" columnName "currentDomesticAccountBBAN" in My Products

    And Wait for first transaction to load
    And Assert Product page for product with name from Excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Assert element with class "android.widget.TextView" and has text "Transactions" is displayed
    And Assert list of element by id "nlb-item-row" is displayed
    And Assert Transaction filter button in Product

    When Assert transaction list is not sorted and has both Incoming and Outgoing transactions
    And Click Transaction filter button in Product
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
    And Wait "2" seconds
    And Assert transaction list is sorted to only show Outgoing transactions

    Examples:
      | rowindex |
      |        4 |

  @Current_Domestic_Accounts-Transactions-Filter-Multiple_Filter_[MOB_ANDROID]
  Scenario Outline: Current_Domestic_Accounts-Transactions-Filter-Multiple_Filter_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear
    And Click on Product from Excel "<rowindex>" columnName "currentDomesticAccountBBAN" in My Products

    When Wait for first transaction to load
    And Click Transaction filter button in Product
    And Click on element by text "Date"
    And Click on calendar icon with index "1"
    And Click on date in Calendar with year 2025 month 6 day 10 and assert that it is shown correctly
    And Click on element by text "Add filter"
    And Click on calendar icon with index "2"
    And Click on date in Calendar with year 2025 month 12 day 5 and assert that it is shown correctly
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
    And Enter text "2300" into input field "From" in amount filter
    And Enter text "15000" into input field "To" in amount filter
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Date"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-title" to appear
#    And Assert transaction list is sorted to match conditions "3.2.2025" "3.5.2025" "Incoming" "RSD" 100 100000
    And Assert transactions amounts are between "2300" and "15000" and transactions dates are between "10.06.2025" and "05.12.2025" and transactions types are "outgoing"

    Examples:
      | rowindex |
      |        4 |


  @Current_Domestic_Accounts-Transactions-Filter-Clear_Filter_[MOB_ANDROID]
  Scenario Outline: Current_Domestic_Accounts-Transactions-Filter-Clear_Filter_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear
    And Click on Product from Excel "<rowindex>" columnName "currentDomesticAccountBBAN" in My Products

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

    Then Click on element by text "Clear filters"
    And Assert Date transaction filter for Current account is displayed correctly
    And Assert Type transaction filter for Current account is displayed correctly
    And Assert Amount transaction filter for Current account is displayed correctly

    Examples:
      | rowindex |
      |        4 |


  @Current_Domestic_Accounts_Transactions_Filter_By_Date_CustomDateRange_[MOB_ANDROID]
  Scenario Outline: Current_Domestic_Accounts_Transactions_Filter_By_Date_CustomDateRange_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on element by text "My Products"
    And Wait for first product in My products page
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"

    And Wait for first transaction to load
    And Assert element with class "android.widget.TextView" and has text "Transactions" is displayed
    And Assert list of element by id "nlb-item-row" is displayed
    And Assert Transaction filter button in Product
    And Click Transaction filter button in Product
    And Wait first Transaction filter

    And Assert screen header is "Transaction filter"
    And Assert back button in screen "Transaction filter"
    And Assert Date transaction filter for Current account is displayed correctly
    And Assert Type transaction filter for Current account is displayed correctly
    And Assert Amount transaction filter for Current account is displayed correctly
#    And Assert element by text "Amount"
    And Assert "Confirm" button is not enabled

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
#    And Assert button Apply in Calendar is enabled
#    And Click on button Apply in Calendar
    And Click on element by text "Add filter"
    And Assert From field in Date transactions filter has date year 2025 month 5 day 8

    And Click on element by id "nlb-input-date-to-click-area"
    And Click on date in Calendar with year 2025 month 7 day 8 and assert that it is shown correctly
    And Assert button Cancel in Calendar is enabled
#    And Assert button Apply in Calendar is enabled
#    And Click on button Apply in Calendar
    And Click on element by text "Add filter"
    And Assert To field in Date transactions filter has date year 2025 month 7 day 8

    And Click on element by id "nlb-button-primary"
    And Assert subtitle of Transaction filter Date is correct for dates year 2025 month 5 day 8 and year 2025 month 7 day 8
    And Assert "Confirm" button primary is enabled
    And Assert "Clear filters" button alternate is enabled
    And Click on element by text "Confirm"
    And Wait for first transaction to load after filter

    Then Assert transactions dates are between dates year 2025 month 5 day 8 and year 2025 month 7 day 8

    Examples:
      | rowindex |
      |        4 |


  @Current_Domestic_Accounts-Transactions-Filter_By_Date-Predefined_Date_Range_[MOB_ANDROID]
  Scenario Outline: Current_Domestic_Accounts-Transactions-Filter_By_Date-Predefined_Date_Range_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear

    When Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Wait element "Transactions" by text
    And Assert element by contains text "Transactions"
    And Assert element "nlb-icon-button" by id

    And Click on element by desc "Filters"
    And Assert element by text "Date"
    And Assert element by text "Type"
    And Assert element by text "Amount"
    #TODO   Category, Tags, Back, Clear filter

    And Click on element by text "Date"
    #The date filter page opens, containing options for Last 7 Days, Current Month, and Previous Month.
    #As well as a custom date range input section that contains a From field with a date selection calendar and a To field with a date selection calendar

    And Assert element "nlb-radio-button-LAST_7_DAYS" by id
    And Assert element "nlb-radio-button-THIS_MONTH" by id
    And Assert element "nlb-radio-button-LAST_MONTH" by id

    Then Assert element by text "Custom date range"
    And Assert element "nlb-radio-button-CUSTOM_DATE_RANGE" by id
    And Assert element "nlb-input-date-from-click-area" by id
    And Assert element "nlb-input-date-to-click-area" by id

    #TODO Filtere nakon sto bude bilo transakcija za ove opcije, posl transakcija u julu...


    Examples:
      | rowindex |
      |        4 |



  @Current_Domestic_Accounts-Details-Account_Details_[MOB_ANDROID]
  Scenario Outline: Current_Domestic_Accounts-Details-Account_Details_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear

    When Scroll until element with text from excel "<rowindex>" columnName "currentDomesticAccountBBAN" is in view
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Wait for first transaction to load
    And Assert element by contains text "Transactions"
    And Assert element "nlb-icon-button" by id
    And Click on element by text "Cheques"
    And Remember number of cheques under key "numberOfCheques"
    And Click on element by desc "Back"
    And Wait element "Transactions" by text

    And Click on element by text "Details"
    And Wait element "Financial details" by text
    And Swipe vertical

    Then Assert element by text "Account details"
    And Assert element by text "Account type" has first following sibling "Current account"
    And Assert element by text "Account owner" has first following sibling from excel "<rowindex>" columnName "account_details_owner"
    And Assert element by text "Account number" has first following sibling from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Assert element by text "Number of unrealized cheques" has first following sibling from key "numberOfCheques"
    And Assert element by content desc "Copy account details"

    Examples:
      | rowindex |
      |        2 |

  @Current_Domestic_Accounts-Transactions-Filter-Invalid_[MOB_ANDROID]
  Scenario Outline: Current_Domestic_Accounts-Transactions-Filter-Invalid_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear

    When Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
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
      |        4 |