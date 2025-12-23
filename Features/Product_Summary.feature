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
    And Click on element by text from excel "<rowindex>" columnName "second_personal_account_bban"
    And Click on element by text "Apply"
    And Wait for element by text "Edit products view"
    And Click on element by desc "Back"
    And Wait for element by text "My Products"
    Then Assert first product shown in my products is favorite account from Excel "<rowindex>" columnName "second_personal_account_bban"

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
    And Scroll until element with text from excel "<rowindex>" columnName "loan_account_bban" is in view
    And Swipe vertical short

    #Then Assert that product card of name "loan_account_name" and bban "loan_account_bban" from Excel "<rowindex>" for loan account are shown correctly
    Then Assert that product card with BBAN "<rowindex>" from Excel "loan_account_bban" has name from Excel "loan_account_name"
    And Assert that whole product card of loan account with name "loan_account_name" and bban "loan_account_bban" from Excel "<rowindex>" is clickable
    And Click on element by text from excel "<rowindex>" columnName "loan_account_bban" and assert the correct page opens

    Examples:
      | rowindex |
      |        5 |

  @Product_Summary-Term_Deposits_Lists_[MOB_ANDROID]
  Scenario Outline: Product_Summary-Term_Deposits_Lists_[MOB_ANDROID]
    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    And Assert that products in My products page is loaded

    Then Assert amount and currency are displayed by Android xpath "//android.widget.TextView[@resource-id=\"nlb-value-product-primary-balance\" and @text=\"5304,55 EUR\"]"
    And Assert Product number is in BBAN format by xPath "//android.widget.TextView[@resource-id=\"nlb-value-product-account-id\" and @text=\"205-9032022325800-66\"]"
    And Assert Product page for product with name from Excel "<rowindex>" columnName "termDepositBBAN"
    And Assert that whole product card of term deposit account with name "termDepositName" and bban "termDepositBBAN" from Excel "<rowindex>" acts as a clickable button

    Examples:
      | rowindex |
      |        1 |


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
  #Current account

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

    And Change the name od product from Excel "<rowindex>" column "second_personal_account_bban" with invalid "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    And Click on element by text "Apply"
    And Scroll down until element with text "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" is in view
    And Assert element by contains text "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    #Name of the product is reset to the original one
    And Delete name of product "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    And Click on element by text "Apply"

    And Scroll until element with text from excel "<rowindex>" columnName "second_personal_account_bban" is in view
    And Assert product from Excel "<rowindex>" with bban "second_personal_account_bban" has name "second_personal_account_name"


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

    And Change the name od product from Excel "<rowindex>" column "saving_account_bban" with invalid "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    And Click on element by text "Apply"
    And Scroll down until element with text "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" is in view
    And Assert element by contains text "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    #Name of the product is reset to the original one
    And Delete name of product "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    And Click on element by text "Apply"

    And Scroll until element with text from excel "<rowindex>" columnName "saving_account_bban" is in view
    And Assert product from Excel "<rowindex>" with bban "saving_account_bban" has name "saving_account_name"


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

    And Change the name od product from Excel "<rowindex>" column "term_deposit_bban" with invalid "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    And Click on element by text "Apply"
    And Scroll down until element with text "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" is in view
    And Assert element by contains text "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    #Name of the product is reset to the original one
    And Delete name of product "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    And Click on element by text "Apply"

    And Scroll until element with text from excel "<rowindex>" columnName "term_deposit_bban" is in view
    And Assert product from Excel "<rowindex>" with bban "term_deposit_bban" has name "term_deposit_name"



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

    And Change the name od product from Excel "<rowindex>" column "loan_account_bban" with invalid "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    And Click on element by text "Apply"
    And Scroll down until element with text "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" is in view
    And Assert element by contains text "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    #Name of the product is reset to the original one
    And Delete name of product "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    And Click on element by text "Apply"

    And Scroll until element with text from excel "<rowindex>" columnName "loan_account_bban" is in view
    And Assert product from Excel "<rowindex>" with bban "loan_account_bban" has name "loan_account_name"



    Examples:
      | rowindex |
      |        5 |

  @Product_Summary_Edit_Product_View[MOB_ANDROID]
  Scenario Outline: Product_Summary_Edit_Product_View[MOB_ANDROID]

    Given Open Application
  #And Wait "100" seconds
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
  #And Change language to english
    When Click "My Products"
    And Hide account from Excel "<rowindex>" columnName "second_personal_account_bban" V
    Then Assert that product card of name "second_personal_account_name" and bban "second_personal_account_bban" from Excel "<rowindex>" is not displayed
    When Click "My NLB"
    When Click "My Products"
    And Unhide account from Excel "<rowindex>" columnName "second_personal_account_name" if needed V
    #TODO: Radi i ovaj assert, pada ako se manjaju imena racuna And Assert that product card of name "second_personal_account_name" and bban "second_personal_account_bban" from Excel "<rowindex>" for personal account are shown correctly V

    Examples:
      | rowindex |
      |        1 |

  @Product_Summary-Edit_Product_view-edit_name_of_account_[MOB_ANDROID]_1
  Scenario Outline: Product_Summary-Edit_Product_view-edit_name_of_account_[MOB_ANDROID]_1

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products"

    Then Change name of product from Excel "<rowindex>" columnName "second_personal_account_bban" into "NLB Klasicni racun2" V
    And Assert product from Excel "<rowindex>" with bban "second_personal_account_bban" has name "NLB Klasicni racun2" V
    #And Change name of product from Excel "<rowindex>" columnName "second_personal_account_bban" into "Devizni platni račun" V
    And Change name of "second_personal_account_bban" from Excel "<rowindex>" to previous name

    Examples:
      | rowindex |
      |        1 |

  @Product_Summary-Edit_Product_view-edit_name_of_card_[MOB_ANDROID]_1
  Scenario Outline: Product_Summary-Edit_Product_view-edit_name_of_card_[MOB_ANDROID]_1

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products"

    Then Change name of product from Excel "<rowindex>" columnName "credit_card_name" into "NLB Kartica 1" V
    Then Scroll down until element with text "NLB Kartica 1" is in view
    Then Scroll up until element with text "Edit list" is in view
    When Click "My NLB"
    When Click "My Products"
    And Restart name of "NLB Kartica 1" card to original name


    Examples:
      | rowindex |
      |        1 |


  @Product_Summary-Edit_Product_view-edit_name_of_deposit_[MOB_ANDROID]_1
  Scenario Outline: Product_Summary-Edit_Product_view-edit_name_of_deposit_[MOB_ANDROID]_1

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products"

    Then Change name of product from Excel "<rowindex>" columnName "term_deposit_bban" into "NLB Deposit 1" V
    Then Scroll down until element with text "NLB Deposit 1" is in view
    And Assert product from Excel "<rowindex>" with bban "term_deposit_bban" has name "NLB Deposit 1" V

    When Click "My NLB"
    When Click "My Products"
    Then Scroll up until element with text "Edit list" is in view
    When Click "My NLB"
    When Click "My Products"
    And Restart name of "NLB Deposit 1" card to original name

    Examples:
      | rowindex |
      |        1 |