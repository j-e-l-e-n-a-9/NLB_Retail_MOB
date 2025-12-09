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