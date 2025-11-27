Feature: Product_Summary

  @Product_Summary_Favorite_account_[MOB_ANDROID]
  Scenario Outline: Product_Summary_Favorite_account_[MOB_ANDROID]

    Given Open Application
    #And Wait "100" seconds
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    #And Change language to english
    When Click "My Products"
    And Wait for element by text "Edit list"
    And Click on element by text "Edit list"
    And Wait for element by text "Set favorite account"
    And Click on element by text "Set favorite account"
    And Wait for element by text "Apply"
    And Assert element by text "Default sorting"
    And Click on element by text from excel "<rowindex>" columnName "second_personal_account_iban"
    And Click on element by text "Apply"
    And Wait for element by text "Edit products view"
    And Click on element by desc "Back"
    And Wait for element by text "My Products"
    Then Assert first product shown in my products is favorite account from Excel "<rowindex>" columnName "second_personal_account_iban"

    Examples:
      | rowindex |
      |        1 |
  @Product_Summary-Loan_List_[MOB_ANDROID]
  Scenario Outline: Product_Summary-Loan_List_[MOB_ANDROID]

    Given Open Application
    #And Wait "100" seconds
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    #Open My products page
    When Click "My Products"
    And Wait for element by text "Edit list"

    #Loan accounts are displayed, sorted by ascending   -za sorting potreban user sa vise loan racuna...
    And Scroll until element with text from excel "<rowindex>" columnName "loan_account_iban" is in view
    And Swipe vertical short

    Then Assert that product card of name "loan_account_name" and iban "loan_account_iban" from Excel "<rowindex>" for loan account are shown correctly
    And Assert that whole product card of loan account with name "loan_account_name" and iban "loan_account_iban" from Excel "<rowindex>" is clickable
    And Click on element by text from excel "<rowindex>" columnName "loan_account_iban" and assert the correct page opens

    Examples:
      | rowindex |
      |        2 |


  @Product_Summary_Sorting_on_the_Product_Summary_[ANDROID]
  Scenario Outline: Product_Summary_Sorting_on_the_Product_Summary_[ANDROID]


    Given Open Application
    #And Wait "100" seconds
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    #Open My products page
    When Click "My Products"
    And Wait for element by text "Edit list"

    Then Verify product ordering in My Products

    Examples:
      | rowindex |
      |        1 |


  @Product_Summary-Edit_Product_view-edit_name_of_account-invalid_[MOB_ANDROID]
  Scenario Outline: Product_Summary-Edit_Product_view-edit_name_of_account-invalid_[MOB_ANDROID]


    Given Open Application
    #And Wait "100" seconds
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    #Open My products page
    When Click "My Products"
    And Wait for element by text "Edit list"
    When Click on element by desc "Edit list"
    And Wait for element by text "Edit products view"

    #@Products - Current account

    And Change the name od product from Excel "<rowindex>" column "personal_account_iban" with invalid "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    And Click on element by text "Apply"
    And Scroll down until element with text "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" is in view
    And Assert element by contains text "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    #Name of the product is reset to the original one
    And Delete name of product "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    And Click on element by text "Apply"

    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Assert product from Excel "<rowindex>" with iban "personal_account_iban" has name "personal_account_name"


    Examples:
      | rowindex |
      |        1 |


  @Product_Summary-Edit_Product_view-edit_name_of_account-invalid_[MOB_ANDROID]
  Scenario Outline: Product_Summary-Edit_Product_view-edit_name_of_account-invalid_[MOB_ANDROID]_2
  #Saving account


    Given Open Application
    #And Wait "100" seconds
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    #Open My products page
    When Click "My Products"
    And Wait for element by text "Edit list"
    When Click on element by desc "Edit list"
    And Wait for element by text "Edit products view"

    #@Products - Saving account

    And Change the name od product from Excel "<rowindex>" column "saving_account_iban" with invalid "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    And Click on element by text "Apply"
    And Scroll down until element with text "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" is in view
    And Assert element by contains text "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    #Name of the product is reset to the original one
    And Delete name of product "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    And Click on element by text "Apply"

    And Scroll until element with text from excel "<rowindex>" columnName "saving_account_iban" is in view
    And Assert product from Excel "<rowindex>" with iban "saving_account_iban" has name "saving_account_name"


    Examples:
      | rowindex |
      |        1 |


  @Product_Summary-Edit_Product_view-edit_name_of_account-invalid_[MOB_ANDROID]
  Scenario Outline: Product_Summary-Edit_Product_view-edit_name_of_account-invalid_[MOB_ANDROID]_3
  #Credit card


    Given Open Application
    #And Wait "100" seconds
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    #Open My products page
    When Click "My Products"
    And Wait for element by text "Edit list"
    When Click on element by desc "Edit list"
    And Wait for element by text "Edit products view"

    #@Products - Credit card

    And Change the name od product from Excel "<rowindex>" column "credit_card_name" with invalid "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    And Click on element by text "Apply"
    And Scroll down until element with text "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" is in view
    And Assert element by contains text "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    #Name of the product is reset to the original one
    And Delete name of product "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    And Click on element by text "Apply"

    And Scroll until element with text from excel "<rowindex>" columnName "credit_card_name" is in view
    And Assert product from Excel "<rowindex>" has name "credit_card_name"


    Examples:
      | rowindex |
      |        1 |


  @Product_Summary-Edit_Product_view-edit_name_of_account-invalid_[MOB_ANDROID]
  Scenario Outline: Product_Summary-Edit_Product_view-edit_name_of_account-invalid_[MOB_ANDROID]_4
  #Term deposit


    Given Open Application
    #And Wait "100" seconds
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    #Open My products page
    When Click "My Products"
    And Wait for element by text "Edit list"
    When Click on element by desc "Edit list"
    And Wait for element by text "Edit products view"

    #@Products - Term deposit

    And Change the name od product from Excel "<rowindex>" column "term_deposit_iban" with invalid "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    And Click on element by text "Apply"
    And Scroll down until element with text "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" is in view
    And Assert element by contains text "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    #Name of the product is reset to the original one
    And Delete name of product "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    And Click on element by text "Apply"

    And Scroll until element with text from excel "<rowindex>" columnName "term_deposit_iban" is in view
    And Assert product from Excel "<rowindex>" with iban "term_deposit_iban" has name "term_deposit_name"



    Examples:
      | rowindex |
      |        1 |

  @Product_Summary-Edit_Product_view-edit_name_of_account-invalid_[MOB_ANDROID]
  Scenario Outline: Product_Summary-Edit_Product_view-edit_name_of_account-invalid_[MOB_ANDROID]_5
  #Loan


    Given Open Application
    #And Wait "100" seconds
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    #Open My products page
    When Click "My Products"
    And Wait for element by text "Edit list"
    When Click on element by desc "Edit list"
    And Wait for element by text "Edit products view"

    #@Products - Loan

    And Change the name od product from Excel "<rowindex>" column "loan_account_iban" with invalid "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    And Click on element by text "Apply"
    And Scroll down until element with text "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" is in view
    And Assert element by contains text "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    #Name of the product is reset to the original one
    And Delete name of product "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    And Click on element by text "Apply"

    And Scroll until element with text from excel "<rowindex>" columnName "loan_account_iban" is in view
    And Assert product from Excel "<rowindex>" with iban "loan_account_iban" has name "loan_account_name"



    Examples:
      | rowindex |
      |        2 |