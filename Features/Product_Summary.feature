Feature: Product_Summary

  @Product_Summary_Favorite_account_[MOB_ANDROID]
  Scenario Outline: Product_Summary_Favorite_account_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products"
    And Wait for element by text "Edit list"
    And Click on element by text "Edit list"
    And Wait for element by text "Set favorite account"
    And Assert element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Assert element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Click on element by text "Set favorite account"
    And Assert element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Assert element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by text "Apply"
    And Assert element by text "Default sorting"
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Click on element by text "Apply"
    And Wait for element by text "Edit products view"
    And Wait "3" seconds
    And Wait for element with "Back" content description from view tag "View"
    And Click on element by desc "Back"
    And Wait for element by id "nlb-product-summary-card" to appear
    
    Then Assert first product shown in my products is favorite account from Excel "<rowindex>" columnName "personal_account_iban"
    And Click on element by text "My NLB"
    And Wait for element by id "card-row-product-card" to appear
    And Click on element by text "My Products"
    And Click on element by text "My NLB"
    And Assert element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Click on element by text "My Products"
    And Wait for element by text "Edit list"
    And Click on element by id "nlb-button-edit-products"
    And Wait for element by text "Set favorite account"
    And Click on element by text "Set favorite account"
    And Click on element by text "Default sorting"
    And Click on element by text "Apply"
    And Wait for element by text "Edit products view"
    And Wait "3" seconds
    And Wait for element with "Back" content description from view tag "View"
    And Click on element by desc "Back"
    And Wait for element by id "nlb-product-summary-card" to appear
    And Assert first product shown in my products is favorite account from Excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Click on element by text "My NLB"
    And Wait for element by id "card-row-product-card" to appear
    And Click on element by text "My Products"
    And Click on element by text "My NLB"
    And Assert element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"

    Examples:
      | rowindex |
      |        2 |



  @Product_Summary-Loan_List_[MOB_ANDROID]
  Scenario Outline: Product_Summary-Loan_List_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    When Click "My Products"
    And Wait for element by text "Edit list"

#    And Loan accounts are displayed, sorted by ascending
    When Scroll until element with text from excel "<rowindex>" columnName "loan_account_number" is in view

    #Then Assert that product card of name "loan_account_name" and bban "loan_account_number" from Excel "<rowindex>" for loan account are shown correctly
    Then Assert Loan accounts icons is displayed
    And Assert that product card with BBAN "<rowindex>" from Excel "loan_account_number" has name from Excel "loan_account_name"
    And Assert that whole product card of loan account with name "loan_account_name" and bban "loan_account_number" from Excel "<rowindex>" is clickable
    And Click on element by text from excel "<rowindex>" columnName "loan_account_number" and assert the correct page opens

    Examples:
      | rowindex |
      |        5 |

  @Product_Summary-Term_Deposits_Lists_[MOB_ANDROID]
  Scenario Outline: Product_Summary-Term_Deposits_Lists_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click on element by text "My Products"
    And Wait for first product in My products page
#    And Assert that products in My products page is loaded

    Then Scroll until element with text from excel "<rowindex>" columnName "term_deposit_number2" is in view
    And Assert Term deposits icons is displayed
    And Assert Term deposits product names is displayed
    And Assert Term deposits account numbers is displayed
    #TO DO: Odkomentarisi korak ispod kada se bug resi. Ne postoji separator za hiljade na odredjenim kreditima
    And Assert Term deposits current loan balance is displayed
    And Click on element by text from excel "<rowindex>" columnName "term_deposit_number2"
    And Wait element "Financial details" by text
    And Assert element by text "Financial details"
    And Assert element by text "Account details"

    Examples:
      | rowindex |
      |        1 |


  @Product_Summary_Sorting_on_the_Product_Summary_[ANDROID]
  Scenario Outline: Product_Summary_Sorting_on_the_Product_Summary_[ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products"
    And Wait for first product in My products page

    Then Verify product ordering in My Products

    Examples:
      | rowindex |
      |        1 |


  @Product_Summary-Edit_Product_view-edit_name_of_account-invalid_[MOB_ANDROID]
  Scenario Outline: Product_Summary-Edit_Product_view-edit_name_of_account-invalid_[MOB_ANDROID]

  #Current domestic account
    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products"
    And Wait for element by text "Edit list"
    And Click on element by desc "Edit list"
    And Wait for element by text "Set favorite account"

    Then Scroll until element with text from excel "<rowindex>" columnName "currentDomesticAccountBBAN" is in view
    And Click on Edit button for account with text from Excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Click on element by desc 'Alt="Clear field"'
    And Enter text "Lorem ipsum dolor sit amet, consectetuer adipiscing." in Rename product input field
    And Assert element by text "You have reached the maximum number of characters."
    And Click on element by desc 'Alt="Clear field"'
    And Click on element by text "Apply"
    And Assert element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Assert element by text from excel "<rowindex>" columnName "currentDomesticAccountName"

    Examples:
      | rowindex |
      |        1 |


  @Product_Summary-Edit_Product_view-edit_name_of_account-invalid_[MOB_ANDROID]_6
  Scenario Outline: Product_Summary-Edit_Product_view-edit_name_of_account-invalid_[MOB_ANDROID]_6

  #Current foreign account
    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products"
    And Wait for element by text "Edit list"
    And Click on element by desc "Edit list"
    And Wait for element by text "Set favorite account"

    Then Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on Edit button for account with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Click on element by desc 'Alt="Clear field"'
    And Enter text "Lorem ipsum dolor sit amet, consectetuer adipiscing." in Rename product input field
    And Assert element by text "You have reached the maximum number of characters."
    And Click on element by desc 'Alt="Clear field"'
    And Click on element by text "Apply"
    And Assert element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Assert element by text from excel "<rowindex>" columnName "personal_account_name"

    Examples:
      | rowindex |
      |        1 |


  @Product_Summary-Edit_Product_view-edit_name_of_account-invalid_[MOB_ANDROID]_2
  Scenario Outline: Product_Summary-Edit_Product_view-edit_name_of_account-invalid_[MOB_ANDROID]_2

    #Saving account
    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products"
    And Wait for element by text "Edit list"
    And Click on element by desc "Edit list"
    And Wait for element by text "Set favorite account"

    Then Scroll until element with text from excel "<rowindex>" columnName "saving_account_number" is in view
    And Click on Edit button for account with text from Excel "<rowindex>" columnName "saving_account_number"
    And Click on element by desc 'Alt="Clear field"'
    And Enter text "Lorem ipsum dolor sit amet, consectetuer adipiscing." in Rename product input field
    And Assert element by text "You have reached the maximum number of characters."
    And Click on element by desc 'Alt="Clear field"'
    And Click on element by text "Apply"
    And Assert element by text from excel "<rowindex>" columnName "saving_account_number"
    And Assert element by text from excel "<rowindex>" columnName "saving_account_name"


    Examples:
      | rowindex |
      |        1 |


  @Product_Summary-Edit_Product_view-edit_name_of_account-invalid_[MOB_ANDROID]_3
  Scenario Outline: Product_Summary-Edit_Product_view-edit_name_of_account-invalid_[MOB_ANDROID]_3

  #Credit card
    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products"
    And Wait for element by text "Edit list"
    And Click on element by desc "Edit list"
    And Wait for element by text "Set favorite account"

    Then Scroll until element with text from excel "<rowindex>" columnName "credit_card_2_number" is in view
    And Click on Edit button for account with text from Excel "<rowindex>" columnName "credit_card_2_number"
    And Click on element by desc 'Alt="Clear field"'
    And Enter text "Lorem ipsum dolor sit amet, consectetuer adipiscing." in Rename product input field
    And Assert element by text "You have reached the maximum number of characters."
    And Click on element by desc 'Alt="Clear field"'
    And Click on element by text "Apply"
    And Assert element by text from excel "<rowindex>" columnName "credit_card_2_number"
    And Assert element by text from excel "<rowindex>" columnName "credit_card_2_name"

    Examples:
      | rowindex |
      |        1 |


  @Product_Summary-Edit_Product_view-edit_name_of_account-invalid_[MOB_ANDROID]_4
  Scenario Outline: Product_Summary-Edit_Product_view-edit_name_of_account-invalid_[MOB_ANDROID]_4

  #Term deposit
    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products"
    And Wait for element by text "Edit list"
    And Click on element by desc "Edit list"
    And Wait for element by text "Set favorite account"

    Then Scroll until element with text from excel "<rowindex>" columnName "term_deposit_number2" is in view
    And Click on Edit button for account with text from Excel "<rowindex>" columnName "term_deposit_number2"
    And Click on element by desc 'Alt="Clear field"'
    And Enter text "Lorem ipsum dolor sit amet, consectetuer adipiscing." in Rename product input field
    And Assert element by text "You have reached the maximum number of characters."
    And Click on element by desc 'Alt="Clear field"'
    And Click on element by text "Apply"
    And Assert element by text from excel "<rowindex>" columnName "term_deposit_number2"
    And Assert element by text from excel "<rowindex>" columnName "term_deposit_name2"

    Examples:
      | rowindex |
      |        1 |


  @Product_Summary-Edit_Product_view-edit_name_of_account-invalid_[MOB_ANDROID]_5
  Scenario Outline: Product_Summary-Edit_Product_view-edit_name_of_account-invalid_[MOB_ANDROID]_5

  #Loans
    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products"
    And Wait for element by text "Edit list"
    And Click on element by desc "Edit list"
    And Wait for element by text "Set favorite account"

    Then Scroll until element with text from excel "<rowindex>" columnName "loan_account_number" is in view
    And Click on Edit button for account with text from Excel "<rowindex>" columnName "loan_account_number"
    And Click on element by desc 'Alt="Clear field"'
    And Enter text "Lorem ipsum dolor sit amet, consectetuer adipiscing." in Rename product input field
    And Assert element by text "You have reached the maximum number of characters."
    And Click on element by desc 'Alt="Clear field"'
    And Click on element by text "Apply"
    And Assert element by text from excel "<rowindex>" columnName "loan_account_number"
    And Assert element by text from excel "<rowindex>" columnName "loan_account_name"

    Examples:
      | rowindex |
      |        1 |


  @Product_Summary-Edit_Product_View-Edit_Name_Of_Account_[MOB_ANDROID]-Current_Domestic_Account
  Scenario Outline: Product_Summary-Edit_Product_View-Edit_Name_Of_Account_[MOB_ANDROID]-Current_Domestic_Account

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products"
    And Wait element "Edit list" by text

    Then Change name of product from Excel "<rowindex>" columnName "currentDomesticAccountBBAN" into "automatizacija domestic account android"
    And Assert product from Excel "<rowindex>" with bban "currentDomesticAccountBBAN" has name "automatizacija domestic account android"
    And Wait "4" seconds
    And Click on element by desc "Back"
    And Wait for first product in My products page
    And Scroll until element with text from excel "<rowindex>" columnName "currentDomesticAccountBBAN" is in view
    And Assert element by text "automatizacija domestic account android"
    And Scroll up until element with text "Edit list" is in view
    And Click on element by text "Edit list"
    And Scroll until element with text from excel "<rowindex>" columnName "currentDomesticAccountBBAN" is in view
    And Click on Edit button for account with text from Excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Click on element by desc 'Alt="Clear field"'
    And Click on element by text "Apply"
    And Assert element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Assert element by text from excel "<rowindex>" columnName "currentDomesticAccountName"

    Examples:
      | rowindex |
      |        1 |


  @Product_Summary-Edit_Product_View-Edit_Name_Of_Account_[MOB_ANDROID]-Current_Foreign_Account
  Scenario Outline: Product_Summary-Edit_Product_View-Edit_Name_Of_Account_[MOB_ANDROID]-Current_Foreign_Account

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products"
    And Wait element "Edit list" by text

    Then Change name of product from Excel "<rowindex>" columnName "personal_account_iban" into "automatizacija foreign account android"
    And Assert product from Excel "<rowindex>" with bban "personal_account_iban" has name "automatizacija foreign account android"
    And Wait "4" seconds
    And Click on element by desc "Back"
    And Wait for first product in My products page
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Assert element by text "automatizacija foreign account android"
    And Scroll up until element with text "Edit list" is in view
    And Click on element by text "Edit list"
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on Edit button for account with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Click on element by desc 'Alt="Clear field"'
    And Click on element by text "Apply"
    And Assert element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Assert element by text from excel "<rowindex>" columnName "personal_account_iban"

    Examples:
      | rowindex |
      |        1 |


  @Product_Summary-Edit_Product_View-Edit_Name_Of_Account_[MOB_ANDROID]-Credit_Card
  Scenario Outline: Product_Summary-Edit_Product_View-Edit_Name_Of_Account_[MOB_ANDROID]-Credit_Card

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products"
    And Wait element "Edit list" by text

    Then Change name of product from Excel "<rowindex>" columnName "credit_card_2_number" into "automatizacija kreditne kartice android"
    And Assert product from Excel "<rowindex>" with bban "credit_card_2_number" has name "automatizacija kreditne kartice android"
    And Wait "4" seconds
    And Click on element by desc "Back"
    And Wait for first product in My products page
    And Scroll until element with text from excel "<rowindex>" columnName "credit_card_2_number" is in view
    And Assert element by text "automatizacija kreditne kartice android"
    And Scroll up until element with text "Edit list" is in view
    And Click on element by text "Edit list"
    And Scroll until element with text from excel "<rowindex>" columnName "credit_card_2_number" is in view
    And Click on Edit button for account with text from Excel "<rowindex>" columnName "credit_card_2_number"
    And Click on element by desc 'Alt="Clear field"'
    And Click on element by text "Apply"
    And Assert element by text from excel "<rowindex>" columnName "credit_card_2_number"
    And Assert element by text from excel "<rowindex>" columnName "credit_card_2_number"

    Examples:
      | rowindex |
      |        1 |


  @Product_Summary-Edit_Product_View-Edit_Name_Of_Account_[MOB_ANDROID]-Savings_Account
  Scenario Outline: Product_Summary-Edit_Product_View-Edit_Name_Of_Account_[MOB_ANDROID]-Savings_Account

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products"
    And Wait element "Edit list" by text

    Then Change name of product from Excel "<rowindex>" columnName "saving_account_number" into "automatizacija savings account android"
    And Assert product from Excel "<rowindex>" with bban "saving_account_number" has name "automatizacija savings account android"
    And Wait "4" seconds
    And Click on element by desc "Back"
    And Wait for first product in My products page
    And Scroll until element with text from excel "<rowindex>" columnName "saving_account_number" is in view
    And Assert element by text "automatizacija savings account android"
    And Click on element by text "My NLB"
    And Wait for My NLB screen to load
    And Click on element by text "My Products"
    And Wait for first product in My products page
    And Click on element by text "Edit list"
    And Scroll until element with text from excel "<rowindex>" columnName "saving_account_number" is in view
    And Click on Edit button for account with text from Excel "<rowindex>" columnName "saving_account_number"
    And Click on element by desc 'Alt="Clear field"'
    And Click on element by text "Apply"
    And Assert element by text from excel "<rowindex>" columnName "saving_account_number"
    And Assert element by text from excel "<rowindex>" columnName "saving_account_number"

    Examples:
      | rowindex |
      |        1 |


  @Product_Summary-Edit_Product_View-Edit_Name_Of_Account_[MOB_ANDROID]-Term_Deposit_Accounts
  Scenario Outline: Product_Summary-Edit_Product_View-Edit_Name_Of_Account_[MOB_ANDROID]-Term_Deposit_Accounts

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products"
    And Wait element "Edit list" by text

    Then Change name of product from Excel "<rowindex>" columnName "term_deposit_number2" into "automatizacija orocena stednja android"
    And Assert product from Excel "<rowindex>" with bban "term_deposit_number2" has name "automatizacija orocena stednja android"
    And Wait "4" seconds
    And Click on element by desc "Back"
    And Wait for first product in My products page
    And Scroll until element with text from excel "<rowindex>" columnName "term_deposit_number2" is in view
    And Assert element by text "automatizacija orocena stednja android"
    And Scroll up until element with text "Edit list" is in view
    And Click on element by text "My NLB"
    And Wait for My NLB screen to load
    And Click on element by text "My Products"
    And Wait for first product in My products page
    And Click on element by text "Edit list"
    And Scroll until element with text from excel "<rowindex>" columnName "term_deposit_number2" is in view
    And Click on Edit button for account with text from Excel "<rowindex>" columnName "term_deposit_number2"
    And Click on element by desc 'Alt="Clear field"'
    And Click on element by text "Apply"
    And Assert element by text from excel "<rowindex>" columnName "term_deposit_number2"
    And Assert element by text from excel "<rowindex>" columnName "term_deposit_number2"

    Examples:
      | rowindex |
      |        1 |


  @Product_Summary-Edit_Product_View-Edit_Name_Of_Account_[MOB_ANDROID]-Loan_Accounts
  Scenario Outline: Product_Summary-Edit_Product_View-Edit_Name_Of_Account_[MOB_ANDROID]-Loan_Accounts

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products"
    And Wait element "Edit list" by text

    Then Change name of product from Excel "<rowindex>" columnName "loan_account_number" into "automatizacija kredita android"
    And Assert product from Excel "<rowindex>" with bban "loan_account_number" has name "automatizacija kredita android"
    And Wait "4" seconds
    And Click on element by desc "Back"
    And Wait for first product in My products page
    And Scroll until element with text from excel "<rowindex>" columnName "loan_account_number" is in view
    And Assert element by text "automatizacija kredita android"
    And Scroll up until element with text "Edit list" is in view
    And Click on element by text "My NLB"
    And Wait for My NLB screen to load
    And Click on element by text "My Products"
    And Wait for first product in My products page
    And Click on element by text "Edit list"
    And Scroll until element with text from excel "<rowindex>" columnName "loan_account_number" is in view
    And Click on Edit button for account with text from Excel "<rowindex>" columnName "loan_account_number"
    And Click on element by desc 'Alt="Clear field"'
    And Click on element by text "Apply"
    And Assert element by text from excel "<rowindex>" columnName "loan_account_number"
    And Assert element by text from excel "<rowindex>" columnName "loan_account_number"

    Examples:
      | rowindex |
      |        1 |


  @Product_Summary-Savings_Accounts_List_[MOB_ANDROID]
  Scenario Outline: Product_Summary-Savings_Accounts_List_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products"
    And Wait for first product in My products page

    Then Scroll until element with text from excel "<rowindex>" columnName "saving_account_number" is in view
    And Assert Saving accounts icons is displayed
    And Assert Saving accounts names is displayed
    And Assert Saving accounts account numbers is displayed
    And Assert Saving accounts current balance is displayed
    And Click on element by text from excel "<rowindex>" columnName "saving_account_number"
    And Wait element "Transactions" by text
    And Assert element by text "Transactions"

    Examples:
      | rowindex |
      |        1 |


  @Product_Summary-Credit_Card_List_[MOB_ANDROID]
  Scenario Outline: Product_Summary-Credit_Card_List_[MOB_ANDROID]
    #TODO: DODATI PROVERU SORTIRANOSTI KARTICE KADA SE UTVRDI KOJI JE NACIN SORTIRANJA
    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    When Click "My Products"
    And Scroll until element with text from excel "<rowindex>" columnName "credit_card_name" is in view
    And Swipe vertical short
    And Swipe vertical short

    #TODO: Ima li neki poseban nacin da se proveri prikazivanje ikonica za kartice?
    Then Assert that product card of name "credit_card_name" and detailed name "credit_card_2_number" from Excel "<rowindex>" for nlb credit card account are shown correctly
    And Assert that whole product card of credit card account with name "credit_card_name" and iban "credit_card_2_number" from Excel "<rowindex>" acts as a clickable button
    And Click on element by text from excel "<rowindex>" columnName "credit_card_name"
#    And Assert that credit cards account numbers are sorted correctly
    #Then Assert that product card of name "credit_card_premium_visa_one_name" and detailed name "credit_card_premium_visa_one_iban" from Excel "<rowindex>" for nlb credit card account are shown correctly
    #And Assert that whole product card of credit card account with name "credit_card_premium_visa_one_name" and iban "credit_card_premium_visa_one_iban" from Excel "<rowindex>" acts as a clickable button

    Examples:
      | rowindex |
      |        1 |


  @Product_Summary-Current_Foreign_Accounts_List_[MOB_ANDROID]
  Scenario Outline: Product_Summary-Current_Foreign_Accounts_List_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear

    When Scroll until element with text from Excel "<rowindex>" columnName "personal_account_iban" is in the view
    And Assert element by text from excel "<rowindex>" columnName "personal_account_name"
    And Assert element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Assert element by text from excel "<rowindex>" columnName "second_personal_account_iban"
    And Assert element by content desc "Current account"
    And Assert element by text "Available balance"
    And Assert element by text "Current balance"
    And Assert balance in current account cards are displayed in valid balance format

    Then Click on Product from Excel "<rowindex>" columnName "personal_account_iban" in My Products
    And Wait for element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Assert element by text "Transactions"

    Examples:
      | rowindex |
      |        1 |


  @Product_Summary-Current_Domestic_Accounts-List_[MOB_ANDROID]
  Scenario Outline: Product_Summary-Current_Domestic_Accounts-List_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear

    When Scroll until element with text from excel "<rowindex>" columnName "currentDomesticAccountBBAN" is in view

    Then Assert Current domestic accounts icons is displayed
    And Assert Current domestic accounts product names is displayed
    And Assert Current domestic accounts account numbers is displayed
    And Assert Current domestic accounts available balance is displayed
    And Assert Current domestic accounts current balance is displayed
    And Click on Product from Excel "<rowindex>" columnName "currentDomesticAccountBBAN" in My Products
    And Wait element "Transactions" by text
    And Assert button by text "Transactions"

    Examples:
      | rowindex |
      |        2 |


  @Product_Summary_Edit_Product_View_[MOB_ANDROID]
  Scenario Outline: Product_Summary_Edit_Product_View_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products"
    And Wait for element by text "Edit list"
    And Click on element by desc "Edit list"
    And Wait for element by text "Set favorite account"
    And Unhide all products

    And Scroll up until element with text from excel "<rowindex>" columnName "currentDomesticAccountBBAN" is in view
    And Hide account from Excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Hide account from Excel "<rowindex>" columnName "personal_account_iban"
    And Hide account from Excel "<rowindex>" columnName "credit_card_2_number"
    And Hide account from Excel "<rowindex>" columnName "saving_account_number"
    And Hide account from Excel "<rowindex>" columnName "term_deposit_number"
    And Hide account from Excel "<rowindex>" columnName "loan_account_number"

    Then Click on element by desc "Back"
    And Wait for first product in My products page
    And Assert account from excel "<rowindex>" columnName "currentDomesticAccountBBAN" is not displayed
    And Assert account from excel "<rowindex>" columnName "personal_account_iban" is not displayed
    And Assert account from excel "<rowindex>" columnName "credit_card_2_number" is not displayed
    And Swipe vertical
    And Assert account from excel "<rowindex>" columnName "saving_account_number" is not displayed
    And Assert account from excel "<rowindex>" columnName "term_deposit_number" is not displayed
    And Swipe vertical
    And Swipe vertical
    And Assert account from excel "<rowindex>" columnName "loan_account_number" is not displayed
#    And Scroll up until element with text "Edit list" is in view
    And Click on element by text "My NLB"
    And Click on element by text "My Products"
    And Wait for element by text "Edit list"
#    And Click on element by desc "Edit list"
    And Click on element by id "nlb-button-edit-products" and contains text "Edit list"
    And Wait element "Set favorite account" by text
    And Unhide all products

    Examples:
      | rowindex |
      |        1 |