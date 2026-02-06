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
    And Scroll until element with text from excel "<rowindex>" columnName "loan_account_bban" is in view
    And Swipe vertical short

    #Then Assert that product card of name "loan_account_name" and bban "loan_account_bban" from Excel "<rowindex>" for loan account are shown correctly
    Then Assert that product card with BBAN "<rowindex>" from Excel "loan_account_bban" has name from Excel "loan_account_name"
    And Assert that whole product card of loan account with name "loan_account_name" and bban "loan_account_bban" from Excel "<rowindex>" is clickable
    And Click on element by text from excel "<rowindex>" columnName "loan_account_bban" and assert the correct page opens

    Examples:
      | rowindex |
      |        5 |

#  @Product_Summary-Term_Deposits_Lists_[MOB_ANDROID]
#  Scenario Outline: Product_Summary-Term_Deposits_Lists_[MOB_ANDROID]
#    Given Open Application
#    And Select User from Excel "<rowindex>" columnName "username" and login
#    And Wait for element by resource id "nlb-bottom-nav-button" to appear
#    And Assert that products in My products page is loaded
#
#    Then Assert amount and currency are displayed by Android xpath "//android.widget.TextView[@resource-id=\"nlb-value-product-primary-balance\" and @text=\"5304,55 EUR\"]"
#    And Assert Product number is in BBAN format by xPath "//android.widget.TextView[@resource-id=\"nlb-value-product-account-id\" and @text=\"205-9032022325800-66\"]"
#    And Assert Product page for product with name from Excel "<rowindex>" columnName "termDepositBBAN"
#    And Assert that whole product card of term deposit account with name "termDepositName" and bban "termDepositBBAN" from Excel "<rowindex>" acts as a clickable button
#
#    Examples:
#      | rowindex |
#      |        1 |


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

    And Change the name od product from Excel "<rowindex>" column "second_personal_account_iban" with invalid "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    And Click on element by text "Apply"
    And Scroll down until element with text "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" is in view
    And Assert element by contains text "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    #Name of the product is reset to the original one
    And Delete name of product "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    And Click on element by text "Apply"

    And Scroll until element with text from excel "<rowindex>" columnName "second_personal_account_iban" is in view
    And Assert product from Excel "<rowindex>" with bban "second_personal_account_iban" has name "second_personal_account_name"


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
#BUG - TRENUTNO NE RADI LOAN (NEMA NIKO LOAN)
#  @Product_Summary-Edit_Product_view-edit_name_of_account-invalid_[MOB_ANDROID]
#  Scenario Outline: Product_Summary-Edit_Product_view-edit_name_of_account-invalid_[MOB_ANDROID]_5
#  #Loan
#
#
#    Given Open Application
#    #And Wait "100" seconds
#    And Select User from Excel "<rowindex>" columnName "username" and login
#    And Wait for element by resource id "nlb-bottom-nav-button" to appear
#    #Open My products page
#    When Click "My Products"
#    And Wait for element by text "Edit list"
#    When Click on element by desc "Edit list"
#    And Wait for element by text "Edit products view"
#
#    #@Products - Loan
#
#    And Change the name od product from Excel "<rowindex>" column "loan_account_bban" with invalid "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
#    And Click on element by text "Apply"
#    And Scroll down until element with text "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" is in view
#    And Assert element by contains text "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
#    #Name of the product is reset to the original one
#    And Delete name of product "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
#    And Click on element by text "Apply"
#
#    And Scroll until element with text from excel "<rowindex>" columnName "loan_account_bban" is in view
#    And Assert product from Excel "<rowindex>" with bban "loan_account_bban" has name "loan_account_name"
#
#
#
#    Examples:
#      | rowindex |
#      |        5 |

  @Product_Summary_Edit_Product_View[MOB_ANDROID]
  Scenario Outline: Product_Summary_Edit_Product_View[MOB_ANDROID]

    Given Open Application
  #And Wait "100" seconds
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
  #And Change language to english
    When Click "My Products"
    And Hide account from Excel "<rowindex>" columnName "second_personal_account_iban" V
    Then Assert that product card of name "second_personal_account_name" and bban "second_personal_account_iban" from Excel "<rowindex>" is not displayed
    When Click "My NLB"
    When Click "My Products"
    And Unhide account from Excel "<rowindex>" columnName "second_personal_account_iban" if needed V
    #TODO: Radi i ovaj assert, pada ako se manjaju imena racuna And Assert that product card of name "second_personal_account_name" and bban "second_personal_account_iban" from Excel "<rowindex>" for personal account are shown correctly V

    Examples:
      | rowindex |
      |        1 |

  @Product_Summary-Edit_Product_view-edit_name_of_account_[MOB_ANDROID]_1
  Scenario Outline: Product_Summary-Edit_Product_view-edit_name_of_account_[MOB_ANDROID]_1

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products"

    Then Change name of product from Excel "<rowindex>" columnName "second_personal_account_iban" into "NLB Klasicni racun2" V
    And Assert product from Excel "<rowindex>" with bban "second_personal_account_iban" has name "NLB Klasicni racun2" V
    #And Change name of product from Excel "<rowindex>" columnName "second_personal_account_iban" into "Devizni platni račun" V
    And Change name of "second_personal_account_iban" from Excel "<rowindex>" to previous name

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


  @Product_Summary-Savings_Accounts_List_[MOB_ANDROID]
  Scenario Outline: Product_Summary-Savings_Accounts_List_[MOB_ANDROID]
    #C70780

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products"

    And Scroll until element with text from excel "<rowindex>" columnName "saving_account_2_bban" is in view
    #And Swipe vertical short
    And Assert that "Savings Account" are sorted correctly
    And Assert that whole product card of gradual savings account with name "saving_account_name" and iban "saving_account_bban" from Excel "<rowindex>" acts as a clickable button
    And Click on element by text from excel "<rowindex>" columnName "saving_account_name"
    And Assert element by text "Details"
    And Assert element by text "Statements"
    And Assert element by text "Currency exchange"
    #TODO: Proveriti da li treba da se nalazi Currency Exchange ili ne
    #Then Assert that product card of name "saving_account_name" and iban "saving_account_bban" from Excel "<rowindex>" for savings account are shown correctly
    #TODO: Assertovati i transakcije kada se pronadje saving racun sa njima

    Examples:
      | rowindex |
      |        1 |


  @Credit_Cards_Details_Card_Details_[MOB_ANDROID]
  Scenario Outline: Credit_Cards_Details_Card_Details_[MOB_ANDROID]
    #C70780

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    When Click "My Products"
    And Scroll until element with text from excel "<rowindex>" columnName "credit_card_name" is in view
    And Swipe vertical short
    And Click on element by text from excel "<rowindex>" columnName "credit_card_name"
    #And Assert element
    And Assert Credit Card from excel "<rowindex>" columnname "credit_card_name" is displayed correctly
    And Assert element by text "Details"
    And Assert element by text "Statements"
    And Assert element by text "Settings"
    And Assert element by text "Transactions"
    And Click on element by text "Details"
    And Assert order of card details


    Examples:
      | rowindex |
      |        1 |


  @Saving_Accounts_Details_Financial_Details[MOB_ANDROID]
  Scenario Outline: Saving_Accounts_Details_Financial_Details[MOB_ANDROID]
    #C70780

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    When Click "My Products"
    And Scroll until element with text from excel "<rowindex>" columnName "saving_account_name" is in view
    And Swipe vertical short
    And Click on element by text from excel "<rowindex>" columnName "saving_account_name"
    #And Assert Credit Card from excel "<rowindex>" columnname "saving_account_name" is displayed correctly
    And Assert element by text "Details"
    And Assert element by text "Statements"
    #And Assert element by text "Settings"
    And Assert element by text "Transactions"
    And Assert element by content desc "Filters"
    And Assert element by text "Search..."
    And Click on element by text "Details"
    #TODO: Dodati proveru Financial Details kada se pojavi user koji ima Financial Details

    Examples:
      | rowindex |
      |        1 |

    @Product_Summary-Term_Deposit_Accounts_Details_Account_Details_[MOB_ANDROID]
    Scenario Outline: Product_Summary-Term_Deposit_Accounts_Details_Account_Details_[MOB_ANDROID]
      #TODO: TEST TREBA DOVRSITI U TRENUTKU KADA PRORADI Documents archive
      Given Open Application
      And Select User from Excel "<rowindex>" columnName "username" and login
      And Wait for element by resource id "nlb-bottom-nav-button" to appear
      When Click "My Products"
      And Scroll until element with text from excel "<rowindex>" columnName "termDepositName" is in view
      And Swipe vertical short
      And Assert that product card of name "termDepositName" and iban "termDepositBBAN" from Excel "<rowindex>" for term deposit account are shown correctly
      #And Wait for element by text from excel "<rowindex>" columnName "termDepositName"
      And Scroll until element with text from excel "<rowindex>" columnName "termDepositName" is in view
      And Click on element by text from excel "<rowindex>" columnName "termDepositName"

      Then Assert element by text "Account details"
      And Assert element by text "Account type"
      And Assert text "Deposit" in element id "nlb-account-type"
      And Assert element by text "Account owner"
      And Assert text from excel "<rowindex>" columnName "username" in element by id "nlb-account-owner"
      And Assert element by text "Account number"
      And Assert text from excel "<rowindex>" columnName "termDepositBBAN" in element by id "nlb-account-number"
      And Assert element by text "Opening date"
      And Assert text from excel "<rowindex>" columnName "term_deposit_account_details_opening_date" in element by id "nlb-opening-date"
      And Assert element by text "Expiration date"
      And Assert text from excel "<rowindex>" columnName "term_deposit_account_details_expiration_date" in element by id "nlb-expiration-date"
      And Click on element by text "Document archive"

        Examples:
          | rowindex |
          |        1 |

      @Product_Summary-Term_Deposits_Accounts_Details_[MOB_ANDROID]
      Scenario Outline: Product_Summary-Term_Deposits_Accounts_Details_[MOB_ANDROID]
      Given Open Application
      And Select User from Excel "<rowindex>" columnName "username" and login
      And Wait for element by resource id "nlb-bottom-nav-button" to appear
      When Click "My Products"

      And Scroll until element with text from excel "<rowindex>" columnName "termDepositBBAN" is in view
      And Scroll until element with text from excel "<rowindex>" columnName "termDepositName" is in view
      And Swipe vertical short
      And Assert that product card of name "termDepositName" and iban "termDepositBBAN" from Excel "<rowindex>" for term deposit account are shown correctly
      And Wait for element by text from excel "<rowindex>" columnName "termDepositName"
      #And Click on element by text from excel "<rowindex>" columnName "termDepositName"
      And Click on element by text "Oročeni depozit"
      Then Assert element by text "Financial details"
      And Assert element by text "Term deposit amount"
      #TODO: Ako se resi ovaj bag sa emulatorom i prikazivanjem amounta, tj da na svake 3 cifre ide . promeniti regex ispod, samo umesto d{0,3} staviti d{0,2}
      And Assert element by id "nlb-deposited-amount" with regex "^(?:(?:0|[1-9]\d{0,3})(?:.\d{3})*),\d{2} EUR$"
      And Assert element by text "Interest rate"
      And Assert element by id "nlb-interest-rate" with regex "^\d{1,2},\d{4} \%$"
      And Assert element by text "Accrued interest"
      And Assert element by id "nlb-accrued-interest" ends in "EUR"
      And Assert text from excel "<rowindex>" columnName "maturity_account" in element by id "nlb-maturity-account"
      And Assert element "nlb-header-card" by id
      And Assert element by text "Term deposit amount"
      #TODO: Ako se resi ovaj bag sa emulatorom i prikazivanjem amounta, tj da na svake 3 cifre ide . promeniti regex ispod, samo umesto d{0,3} staviti d{0,2}
      And Assert element by id "nlb-product-details-primary-balance" with regex "^(?:(?:0|[1-9]\d{0,3})(?:.\d{3})*),\d{2} EUR$"
      Then Assert element by text "Account details"
      And Assert element by text "Account type"
      And Assert text "Deposit" in element id "nlb-account-type"
      And Assert element by text "Account owner"
      And Assert text from excel "<rowindex>" columnName "username" in element by id "nlb-account-owner"
      And Assert element by text "Account number"
      And Assert text from excel "<rowindex>" columnName "termDepositBBAN" in element by id "nlb-account-number"
      And Assert element by text "Opening date"
      And Assert text from excel "<rowindex>" columnName "term_deposit_account_details_opening_date" in element by id "nlb-opening-date"
      And Assert element by text "Expiration date"
      And Assert text from excel "<rowindex>" columnName "term_deposit_account_details_expiration_date" in element by id "nlb-expiration-date"

      Examples:
        | rowindex |
        |         2|



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
  Then Assert that product card of name "credit_card_name" and detailed name "credit_card_number" from Excel "<rowindex>" for nlb credit card account are shown correctly
  And Assert that whole product card of credit card account with name "credit_card_name" and iban "credit_card_number" from Excel "<rowindex>" acts as a clickable button
  And Click on element by text from excel "<rowindex>" columnName "credit_card_name"
  #And Assert that credit cards account numbers are sorted correctly
  #Then Assert that product card of name "credit_card_premium_visa_one_name" and detailed name "credit_card_premium_visa_one_iban" from Excel "<rowindex>" for nlb credit card account are shown correctly
  #And Assert that whole product card of credit card account with name "credit_card_premium_visa_one_name" and iban "credit_card_premium_visa_one_iban" from Excel "<rowindex>" acts as a clickable button

  Examples:
    | rowindex |
    |        1 |


  @Product_Summary-Term_Deposit_List_[MOB_ANDROID]
  Scenario Outline: Product_Summary-Term_Deposit_List_[MOB_ANDROID]
    #C70786
    #BUG On android 16 1.700,00 is 1700,00
    #Only happens on 4 digit numbers
      #TODO: TESTIRATI KADA SE POJAVI USER KOJI IMA VISE DEPOZITA
      #TODO: TAKODJE KADA SE POJAVE AUTORIZOVANU DEPOSIT RACUNI TESTIRATI SORTIRANJE
      Given Open Application
      And Select User from Excel "<rowindex>" columnName "username" and login
      And Wait for element by resource id "nlb-bottom-nav-button" to appear
      When Click "My Products"

      And Scroll until element with text from excel "<rowindex>" columnName "termDepositBBAN" is in view
      And Swipe vertical short
      And Assert that "Deposit" are sorted correctly

      #And Click on element by text from excel "<rowindex>" columnName "termDepositBBAN"
      And Wait "3" seconds
      And Assert that product card of name "termDepositName" and iban "termDepositBBAN" from Excel "<rowindex>" for term deposit account are shown correctly
      When Click "My Products"
      And Scroll until element with text from excel "<rowindex>" columnName "termDepositBBAN" is in view
      #And Click on element by text from excel "<rowindex>" columnName "termDepositBBAN"
      And Wait "10" seconds
      And Assert that whole product card of term deposit account with name "termDepositName" and iban "termDepositBBAN" from Excel "<rowindex>" acts as a clickable button

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

    When Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Assert element by contains text "Transactions"
    And Assert element "nlb-icon-button" by id


    #TODO - AUTORIZED ACCOUNT kad ih bude bilo
    Examples:
      | rowindex |
      |        1 |


  @Manage_Products-Hide/Show_account_on_Product_List_[MOB_ANDROID]
  Scenario Outline: Manage_Products-Hide/Show_account_on_Product_List_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear
    And Assert element by contains text "Edit list"
    And Click on element by text "Edit list"

    #Saving accounts
    And Scroll until element with BBAN from Excel "<rowindex>" columnName "saving_account_bban" is in the view
    And Hide product card from Excel "<rowindex>" columnName "saving_account_bban"
    And Assert that product card from Excel "<rowindex>" columnName "saving_account_bban" is hidden
    And Click on element by desc "Back"
    And Assert that product card with BBAN from Excel "<rowindex>" columnName "saving_account_bban" is not shown

    And Click on Bottom navigation button "My NLB"
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear
    And Assert element by contains text "Edit list"
    And Click on element by text "Edit list"



    #Term deposit
    And Scroll until element with BBAN from Excel "<rowindex>" columnName "term_deposit_bban" is in the view
    And Hide product card from Excel "<rowindex>" columnName "term_deposit_bban"
    And Assert that product card from Excel "<rowindex>" columnName "term_deposit_bban" is hidden
    And Click on element by desc "Back"
    And Assert that product card with BBAN from Excel "<rowindex>" columnName "term_deposit_bban" is not shown

    And Click on Bottom navigation button "My NLB"
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear
    And Assert element by contains text "Edit list"
    And Click on element by text "Edit list"

     #Card
    And Scroll until element with text from Excel "<rowindex>" columnName "credit_card_name" is in the view
    And Hide product card from Excel "<rowindex>" columnName "credit_card_name"
    And Assert that product card from Excel "<rowindex>" columnName "credit_card_name" is hidden
    And Click on element by desc "Back"
    And Assert that product card with BBAN from Excel "<rowindex>" columnName "credit_card_name" is not shown

    And Click on Bottom navigation button "My NLB"
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear
    And Assert element by contains text "Edit list"
    And Click on element by text "Edit list"

    And Scroll until element with BBAN from Excel "<rowindex>" columnName "saving_account_bban" is in the view
    And Show product card from Excel "<rowindex>" columnName "saving_account_bban"
    And Scroll until element with BBAN from Excel "<rowindex>" columnName "credit_card_name" is in the view
    And Show product card from Excel "<rowindex>" columnName "credit_card_name"
    And Scroll until element with BBAN from Excel "<rowindex>" columnName "term_deposit_bban" is in the view
    And Show product card from Excel "<rowindex>" columnName "term_deposit_bban"
    
    Examples:
      | rowindex |
      |        1 |