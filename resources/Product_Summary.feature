Feature: Product_Summary

  @Product_Summmary-Current_Accounts_List_[MOB_ANDROID]_1
  Scenario Outline: Product_Summmary-Current_Accounts_List_[MOB_ANDROID]_1

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Hide account from Excel "<rowindex>" columnName "auth_personal_account_iban" if needed

    Then Assert that product card of name "personal_account_name" and iban "personal_account_iban" from Excel "<rowindex>" for personal account are shown correctly
    And Assert that whole product card of current account with name "personal_account_name" and iban "personal_account_iban" from Excel "<rowindex>" acts as a clickable button
    And Unhide account from Excel "<rowindex>" columnName "auth_personal_account_iban" if needed



    Examples:
      | rowindex |
      |        1 |


  @Product_Summmary-Current_Accounts_List_[MOB_ANDROID]_2
  Scenario Outline: Product_Summmary-Current_Accounts_List_[MOB_ANDROID]_2

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Hide account from Excel "<rowindex>" columnName "personal_account_iban" if needed

    Then Assert that product card of name "auth_personal_account_name" and iban "auth_personal_account_iban" from Excel "<rowindex>" for personal account are shown correctly
    And Assert that whole product card of current account with name "auth_personal_account_name" and iban "auth_personal_account_iban" from Excel "<rowindex>" acts as a clickable button
    And Unhide account from Excel "<rowindex>" columnName "personal_account_iban" if needed



    Examples:
      | rowindex |
      |        1 |


  @Product_Summmary-Current_Accounts_List_[MOB_ANDROID]_3
  Scenario Outline: Product_Summmary-Current_Accounts_List_[MOB_ANDROID]_3
    #C70779

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by resource id "nlb-value-product-primary-balance" to appear

    Then Assert that product card of name "personal_account_name" and iban "personal_account_iban" from Excel "<rowindex>" for personal account are shown correctly
    And Assert that whole product card of current account with name "personal_account_name" and iban "personal_account_iban" from Excel "<rowindex>" acts as a clickable button
    And Scroll until element with text from excel "<rowindex>" columnName "auth_personal_account_iban" is in view
    And Assert that product card of name "auth_personal_account_name" and iban "auth_personal_account_iban" from Excel "<rowindex>" for personal account are shown correctly
    And Assert that whole product card of current account with name "auth_personal_account_name" and iban "auth_personal_account_iban" from Excel "<rowindex>" acts as a clickable button



    Examples:
      | rowindex |
      |        1 |


  @Product_Summary-Savings_Accounts_List_[MOB_ANDROID]_1
  Scenario Outline: Product_Summary-Savings_Accounts_List_[MOB_ANDROID]_1

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Hide account from Excel "<rowindex>" columnName "auth_savings_account_iban" if needed
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Swipe vertical short

    Then Assert that product card of name "savings_account_name" and iban "savings_account_iban" from Excel "<rowindex>" for savings account are shown correctly
    And Assert that whole product card of savings account with name "savings_account_name" and iban "savings_account_iban" from Excel "<rowindex>" acts as a clickable button
    And Unhide account from Excel "<rowindex>" columnName "auth_savings_account_iban" if needed

    Examples:
      | rowindex |
      |        2 |


  @Product_Summary-Savings_Accounts_List_[MOB_ANDROID]_2
  Scenario Outline: Product_Summary-Savings_Accounts_List_[MOB_ANDROID]_2

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Hide account from Excel "<rowindex>" columnName "savings_account_iban" if needed
    And Scroll until element with text from excel "<rowindex>" columnName "auth_savings_account_iban" is in view
    And Swipe vertical short

    Then Assert that product card of name "auth_savings_account_name" and iban "auth_savings_account_iban" from Excel "<rowindex>" for savings account are shown correctly
    And Assert that whole product card of savings account with name "auth_savings_account_name" and iban "auth_savings_account_iban" from Excel "<rowindex>" acts as a clickable button
    And Unhide account from Excel "<rowindex>" columnName "savings_account_iban" if needed

    Examples:
      | rowindex |
      |        2 |


  @Product_Summary-Savings_Accounts_List_[MOB_ANDROID]_3
  Scenario Outline: Product_Summary-Savings_Accounts_List_[MOB_ANDROID]_3
    #C70780

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by resource id "nlb-value-product-primary-balance" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Swipe vertical short

    Then Assert that product card of name "savings_account_name" and iban "savings_account_iban" from Excel "<rowindex>" for savings account are shown correctly
    And Assert that whole product card of savings account with name "savings_account_name" and iban "savings_account_iban" from Excel "<rowindex>" acts as a clickable button
    #And Scroll until element with text from excel "<rowindex>" columnName "auth_savings_account_iban" is in view
    #And Scroll until Booked balance of product card of name "auth_savings_account_name" and iban "auth_savings_account_iban" from Excel "<rowindex>" is in view
    #And Swipe vertical short
    #And Assert that product card of name "auth_savings_account_name" and iban "auth_savings_account_iban" from Excel "<rowindex>" for savings account are shown correctly
    #And Assert that whole product card of savings account with name "auth_savings_account_name" and iban "auth_savings_account_iban" from Excel "<rowindex>" acts as a clickable button


    Examples:
      | rowindex |
      |        2 |


  @Product_Summary-Financial_Instruments_List_[MOB_ANDROID]_1
  Scenario Outline: Product_Summary-Financial_Instruments_List_[MOB_ANDROID]_1
    #C70782

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Hide account from Excel "<rowindex>" columnName "auth_financial_instruments_trading_account_detailed_name" if needed
    And Scroll until element with text from excel "<rowindex>" columnName "financial_instruments_trading_account_detailed_name" is in view
    And Swipe vertical short

    Then Assert that product card of name "financial_instruments_trading_account_name" and iban "financial_instruments_trading_account_detailed_name" from Excel "<rowindex>" for financial instruments are shown correctly
    And Assert that whole product card of financial instruments with name "financial_instruments_trading_account_name" and iban "financial_instruments_trading_account_detailed_name" from Excel "<rowindex>" acts as clickable button
    And Unhide account from Excel "<rowindex>" columnName "auth_financial_instruments_trading_account_detailed_name" if needed



    Examples:
      | rowindex |
      |        1 |


  @Product_Summary-Financial_Instruments_List_[MOB_ANDROID]_2
  Scenario Outline: Product_Summary-Financial_Instruments_List_[MOB_ANDROID]_2

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Hide account from Excel "<rowindex>" columnName "financial_instruments_trading_account_detailed_name" if needed
    And Scroll until element with text from excel "<rowindex>" columnName "auth_financial_instruments_trading_account_detailed_name" is in view
    And Swipe vertical short

    Then Assert that product card of name "auth_financial_instruments_trading_account_name" and iban "auth_financial_instruments_trading_account_detailed_name" from Excel "<rowindex>" for financial instruments are shown correctly
    And Assert that whole product card of financial instruments with name "auth_financial_instruments_trading_account_name" and iban "auth_financial_instruments_trading_account_detailed_name" from Excel "<rowindex>" acts as clickable button
    And Unhide account from Excel "<rowindex>" columnName "financial_instruments_trading_account_detailed_name" if needed



    Examples:
      | rowindex |
      |        1 |

  @Product_Summary-Financial_Instruments_List_[MOB_ANDROID]_3
  Scenario Outline: Product_Summary-Financial_Instruments_List_[MOB_ANDROID]_3

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Scroll until element with text from excel "<rowindex>" columnName "financial_instruments_trading_account_detailed_name" is in view
    And Swipe vertical short

    Then Assert that product card of name "financial_instruments_trading_account_name" and iban "financial_instruments_trading_account_detailed_name" from Excel "<rowindex>" for financial instruments are shown correctly
    And Assert that whole product card of financial instruments with name "financial_instruments_trading_account_name" and iban "financial_instruments_trading_account_detailed_name" from Excel "<rowindex>" acts as clickable button
    And Scroll until element with text from excel "<rowindex>" columnName "auth_financial_instruments_trading_account_detailed_name" is in view
    And Assert that product card of name "auth_financial_instruments_trading_account_name" and iban "auth_financial_instruments_trading_account_detailed_name" from Excel "<rowindex>" for financial instruments are shown correctly
    And Assert that whole product card of financial instruments with name "auth_financial_instruments_trading_account_name" and iban "auth_financial_instruments_trading_account_detailed_name" from Excel "<rowindex>" acts as clickable button



    Examples:
      | rowindex |
      |        1 |


  @Product_Summary-Financial_Instruments_List_[MOB_ANDROID]_4
  Scenario Outline: Product_Summary-Financial_Instruments_List_[MOB_ANDROID]_4

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Hide account from Excel "<rowindex>" columnName "auth_financial_instruments_custody_account_detailed_name" if needed
    And Scroll until element with text from excel "<rowindex>" columnName "financial_instruments_custody_account_detailed_name" is in view
    And Swipe vertical short

    Then Assert that product card of name "financial_instruments_custody_account_name" and iban "financial_instruments_custody_account_detailed_name" from Excel "<rowindex>" for financial instruments are shown correctly
    And Assert that whole product card of financial instruments with name "financial_instruments_custody_account_name" and iban "financial_instruments_custody_account_detailed_name" from Excel "<rowindex>" acts as clickable button
    And Unhide account from Excel "<rowindex>" columnName "auth_financial_instruments_custody_account_detailed_name" if needed



    Examples:
      | rowindex |
      |        1 |


  @Product_Summary-Financial_Instruments_List_[MOB_ANDROID]_5
  Scenario Outline: Product_Summary-Financial_Instruments_List_[MOB_ANDROID]_5

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Hide account from Excel "<rowindex>" columnName "financial_instruments_custody_account_detailed_name" if needed
    And Scroll until element with text from excel "<rowindex>" columnName "auth_financial_instruments_custody_account_detailed_name" is in view
    And Swipe vertical short

    Then Assert that product card of name "auth_financial_instruments_custody_account_name" and iban "auth_financial_instruments_custody_account_detailed_name" from Excel "<rowindex>" for financial instruments are shown correctly
    And Assert that whole product card of financial instruments with name "auth_financial_instruments_custody_account_name" and iban "auth_financial_instruments_custody_account_detailed_name" from Excel "<rowindex>" acts as clickable button
    And Unhide account from Excel "<rowindex>" columnName "financial_instruments_custody_account_detailed_name" if needed



    Examples:
      | rowindex |
      |        1 |


  @Product_Summary-Financial_Instruments_List_[MOB_ANDROID]_6
  Scenario Outline: Product_Summary-Financial_Instruments_List_[MOB_ANDROID]_6

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Scroll until element with text from excel "<rowindex>" columnName "financial_instruments_custody_account_detailed_name" is in view
    And Swipe vertical short

    Then Assert that product card of name "financial_instruments_custody_account_name" and iban "financial_instruments_custody_account_detailed_name" from Excel "<rowindex>" for financial instruments are shown correctly
    And Assert that whole product card of financial instruments with name "financial_instruments_custody_account_name" and iban "financial_instruments_custody_account_detailed_name" from Excel "<rowindex>" acts as clickable button
    And Scroll until element with text from excel "<rowindex>" columnName "auth_financial_instruments_custody_account_detailed_name" is in view
    And Assert that product card of name "auth_financial_instruments_custody_account_name" and iban "auth_financial_instruments_custody_account_detailed_name" from Excel "<rowindex>" for financial instruments are shown correctly
    And Assert that whole product card of financial instruments with name "auth_financial_instruments_custody_account_name" and iban "auth_financial_instruments_custody_account_detailed_name" from Excel "<rowindex>" acts as clickable button



    Examples:
      | rowindex |
      |        1 |

  @Product_Summary-Gradual_Savings_List_[MOB_ANDROID]_1
  Scenario Outline: Product_Summary-Gradual_Savings_List_[MOB_ANDROID]_1
    #C70785

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    #And Hide account from Excel "<rowindex>" columnName "auth_gradual_savings_account_iban" if needed
    And Scroll until element with text from excel "<rowindex>" columnName "gradual_savings_account_iban" is in view
    And Swipe vertical short

    Then Assert that product card of name "gradual_savings_account_name" and iban "gradual_savings_account_iban" from Excel "<rowindex>" for gradual savings account are shown correctly
    And Assert that whole product card of gradual savings account with name "gradual_savings_account_name" and iban "gradual_savings_account_iban" from Excel "<rowindex>" acts as a clickable button
    #And Unhide account from Excel "<rowindex>" columnName "auth_gradual_savings_account_iban" if needed

    Examples:
      | rowindex |
      |        1 |


  @Product_Summary-Gradual_Savings_List_[MOB_ANDROID]_2
  Scenario Outline: Product_Summary-Gradual_Savings_List_[MOB_ANDROID]_2

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Hide account from Excel "<rowindex>" columnName "gradual_savings_account_iban" if needed
    And Scroll until element with text from excel "<rowindex>" columnName "auth_gradual_savings_account_iban" is in view
    And Swipe vertical short

    Then Assert that product card of name "auth_gradual_savings_account_name" and iban "auth_gradual_savings_account_iban" from Excel "<rowindex>" for gradual savings account are shown correctly
    And Assert that whole product card of gradual savings account with name "auth_gradual_savings_account_name" and iban "auth_gradual_savings_account_iban" from Excel "<rowindex>" acts as a clickable button
    And Unhide account from Excel "<rowindex>" columnName "gradual_savings_account_iban" if needed

    Examples:
      | rowindex |
      |        1 |


  @Product_Summary-Gradual_Savings_List_[MOB_ANDROID]_3
  Scenario Outline: Product_Summary-Gradual_Savings_List_[MOB_ANDROID]_3

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Scroll until element with text from excel "<rowindex>" columnName "gradual_savings_account_iban" is in view
    And Swipe vertical short

    Then Assert that product card of name "gradual_savings_account_name" and iban "gradual_savings_account_iban" from Excel "<rowindex>" for gradual savings account are shown correctly
    And Assert that whole product card of gradual savings account with name "gradual_savings_account_name" and iban "gradual_savings_account_iban" from Excel "<rowindex>" acts as a clickable button
    And Scroll until element with text from excel "<rowindex>" columnName "auth_gradual_savings_account_iban" is in view
    And Assert that product card of name "auth_gradual_savings_account_name" and iban "auth_gradual_savings_account_iban" from Excel "<rowindex>" for gradual savings account are shown correctly
    And Assert that whole product card of gradual savings account with name "auth_gradual_savings_account_name" and iban "auth_gradual_savings_account_iban" from Excel "<rowindex>" acts as a clickable button

    Examples:
      | rowindex |
      |        1 |


  @Product_Summary-Loan_List_[MOB_ANDROID]
  Scenario Outline: Product_Summary-Loan_List_[MOB_ANDROID]
    #C70783

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Scroll until element with text from excel "<rowindex>" columnName "loan_account_iban" is in view
    And Swipe vertical short

    Then Assert that product card of name "loan_account_name" and iban "loan_account_iban" from Excel "<rowindex>" for loan account are shown correctly
    And Assert that whole product card of loan account with name "loan_account_name" and iban "loan_account_iban" from Excel "<rowindex>" acts as a clickable button

    Examples:
      | rowindex |
      |        1 |


  @Product_Summary-Edit_Product_view-edit_name_of_account_[MOB_ANDROID]_1
  Scenario Outline: Product_Summary-Edit_Product_view-edit_name_of_account_[MOB_ANDROID]_1

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"

    Then Change name of product from Excel "<rowindex>" columnName "second_personal_account_iban" into "NLB Klasicni racun2"
    And Assert product from Excel "<rowindex>" with iban "second_personal_account_iban" has name "NLB Klasicni racun2"
    And Change name of product from Excel "<rowindex>" columnName "second_personal_account_iban" into "NLB Klasicni racun"

    Examples:
      | rowindex |
      |        1 |

  @Product_Summary-Edit_Product_view-edit_name_of_account_[MOB_ANDROID]_2
  Scenario Outline: Product_Summary-Edit_Product_view-edit_name_of_account_[MOB_ANDROID]_2

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"

    Then Change name of product from Excel "<rowindex>" columnName "savings_account_iban" into "NLB Varcevalni racun2"
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Assert product from Excel "<rowindex>" with iban "savings_account_iban" has name "NLB Varcevalni racun2"
    And Scroll up until element with text "Edit list" is in view
    And Change name of product from Excel "<rowindex>" columnName "savings_account_iban" into "NLB Varcevalni racun"

    Examples:
      | rowindex |
      |        1 |



  @Product_Summary-Edit_Product_view-edit_name_of_account_[MOB_ANDROID]_3
  Scenario Outline: Product_Summary-Edit_Product_view-edit_name_of_account_[MOB_ANDROID]_3

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"

    Then Change name of product from Excel "<rowindex>" columnName "deposit_account_iban" into "NLB Depozit2"
    And Scroll until element with text from excel "<rowindex>" columnName "deposit_account_iban" is in view
    And Assert product from Excel "<rowindex>" with iban "deposit_account_iban" has name "NLB Depozit2"
    And Scroll up until element with text "Edit list" is in view
    And Change name of product from Excel "<rowindex>" columnName "deposit_account_iban" into "NLB Depozit"

    Examples:
      | rowindex |
      |        1 |


  @Product_Summary-Edit_Product_view-edit_name_of_account_[MOB_ANDROID]_4
  Scenario Outline: Product_Summary-Edit_Product_view-edit_name_of_account_[MOB_ANDROID]_4

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"

    Then Change name of product from Excel "<rowindex>" columnName "insurance_account_detailed_name" into "Zavarovanja2"
    And Scroll until element with text from excel "<rowindex>" columnName "insurance_account_detailed_name" is in view
    And Assert product from Excel "<rowindex>" with iban "insurance_account_detailed_name" has name "Zavarovanja2"
    And Scroll up until element with text "Edit list" is in view
    And Change name of product from Excel "<rowindex>" columnName "insurance_account_detailed_name" into "Zavarovanja"

    Examples:
      | rowindex |
      |        1 |


  @Product_Summary-Edit_Product_view-edit_name_of_account_[MOB_ANDROID]_5
  Scenario Outline: Product_Summary-Edit_Product_view-edit_name_of_account_[MOB_ANDROID]_5

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"

    Then Change name of product from Excel "<rowindex>" columnName "loan_account_iban" into "NLB Stanovanjski kredit2"
    And Scroll until element with text from excel "<rowindex>" columnName "loan_account_iban" is in view
    And Assert product from Excel "<rowindex>" with iban "loan_account_iban" has name "NLB Stanovanjski kredit2"
    And Scroll up until element with text "Edit list" is in view
    And Change name of product from Excel "<rowindex>" columnName "loan_account_iban" into "NLB Stanovanjski kredit"

    Examples:
      | rowindex |
      |        3 |


  @Product_Summary-Edit_Product_view-edit_name_of_account-invalid_[MOB_ANDROID]_1
  Scenario Outline: Product_Summary-Edit_Product_view-edit_name_of_account-invalid_[MOB_ANDROID]_1

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"

    #Then Change name of product from Excel "<rowindex>" columnName "personal_account_iban" into "NLB Klasicni racun2"
    Then Change name of product from Excel "<rowindex>" columnName "personal_account_iban" into invalid "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    And Click on element by text "Apply"
    And Scroll until element with text "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" is in view
    And Assert element by contains text "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    And Change name of product "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" into default
    And Click on element by text "Apply"
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    #And Assert product from Excel "<rowindex>" with iban "personal_account_iban" has name "NLB Klasicni racun2"
    #And Change name of product from Excel "<rowindex>" columnName "personal_account_iban" into "NLB Klasicni racun"

    Examples:
      | rowindex |
      |        1 |

  @Product_Summary-Edit_Product_view-edit_name_of_account-invalid_[MOB_ANDROID]_2
  Scenario Outline: Product_Summary-Edit_Product_view-edit_name_of_account-invalid_[MOB_ANDROID]_2

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"

    #Then Change name of product from Excel "<rowindex>" columnName "personal_account_iban" into "NLB Klasicni racun2"
    Then Change name of product from Excel "<rowindex>" columnName "savings_account_iban" into invalid "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    And Click on element by text "Apply"
    And Scroll down until element with text "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" is in view
    And Assert element by contains text "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    And Change name of product "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" into default
    And Click on element by text "Apply"
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    #And Assert product from Excel "<rowindex>" with iban "personal_account_iban" has name "NLB Klasicni racun2"
    #And Change name of product from Excel "<rowindex>" columnName "personal_account_iban" into "NLB Klasicni racun"

    Examples:
      | rowindex |
      |        3 |

  @Product_Summary-Edit_Product_view-edit_name_of_account-invalid_[MOB_ANDROID]_3
  Scenario Outline: Product_Summary-Edit_Product_view-edit_name_of_account-invalid_[MOB_ANDROID]_3

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"

    #Then Change name of product from Excel "<rowindex>" columnName "personal_account_iban" into "NLB Klasicni racun2"
    Then Change name of product from Excel "<rowindex>" columnName "deposit_account_iban" into invalid "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    And Click on element by text "Apply"
    And Scroll down until element with text "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" is in view
    And Assert element by contains text "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    And Change name of product "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" into default
    And Click on element by text "Apply"
    And Scroll until element with text from excel "<rowindex>" columnName "deposit_account_iban" is in view
    #And Assert product from Excel "<rowindex>" with iban "personal_account_iban" has name "NLB Klasicni racun2"
    #And Change name of product from Excel "<rowindex>" columnName "personal_account_iban" into "NLB Klasicni racun"

    Examples:
      | rowindex |
      |        3 |

  @Product_Summary-Edit_Product_view-edit_name_of_account-invalid_[MOB_ANDROID]_4
  Scenario Outline: Product_Summary-Edit_Product_view-edit_name_of_account-invalid_[MOB_ANDROID]_4

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"

    #Then Change name of product from Excel "<rowindex>" columnName "personal_account_iban" into "NLB Klasicni racun2"
    Then Change name of product from Excel "<rowindex>" columnName "insurance_account_detailed_name" into invalid "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    And Click on element by text "Apply"
    And Scroll down until element with text "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" is in view
    And Assert element by contains text "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    And Change name of product "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" into default
    And Click on element by text "Apply"
    And Scroll until element with text from excel "<rowindex>" columnName "insurance_account_detailed_name" is in view
    #And Assert product from Excel "<rowindex>" with iban "personal_account_iban" has name "NLB Klasicni racun2"
    #And Change name of product from Excel "<rowindex>" columnName "personal_account_iban" into "NLB Klasicni racun"

    Examples:
      | rowindex |
      |        1 |


  @Product_Summary-Edit_Product_view-edit_name_of_account-invalid_[MOB_ANDROID]_5
  Scenario Outline: Product_Summary-Edit_Product_view-edit_name_of_account-invalid_[MOB_ANDROID]_5

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"

    #Then Change name of product from Excel "<rowindex>" columnName "personal_account_iban" into "NLB Klasicni racun2"
    Then Change name of product from Excel "<rowindex>" columnName "loan_account_iban" into invalid "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    And Click on element by text "Apply"
    And Scroll down until element with text "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" is in view
    And Assert element by contains text "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    And Change name of product "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" into default
    And Click on element by text "Apply"
    And Scroll until element with text from excel "<rowindex>" columnName "loan_account_iban" is in view
    #And Assert product from Excel "<rowindex>" with iban "personal_account_iban" has name "NLB Klasicni racun2"
    #And Change name of product from Excel "<rowindex>" columnName "personal_account_iban" into "NLB Klasicni racun"

    Examples:
      | rowindex |
      |        3 |


  @Product_Summary-Edit_Product_view_[MOB_ANDROID]_1
  Scenario Outline: Product_Summary-Edit_Product_view_[MOB_ANDROID]_1
    #C70790

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Hide account from Excel "<rowindex>" columnName "personal_account_iban"


    Then Assert that product card of name "personal_account_name" and iban "personal_account_iban" from Excel "<rowindex>" is not displayed
    And Click "Pay" content description from view tag "View"
    And Click "My Products" content description from view tag "View"
    And Unhide account from Excel "<rowindex>" columnName "personal_account_iban" if needed
    And Assert that product card of name "personal_account_name" and iban "personal_account_iban" from Excel "<rowindex>" for personal account are shown correctly

    Examples:
      | rowindex |
      |        3 |

  @Product_Summary-Edit_Product_view_[MOB_ANDROID]_2
  Scenario Outline: Product_Summary-Edit_Product_view_[MOB_ANDROID]_2
    #C70790

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Hide account from Excel "<rowindex>" columnName "savings_account_iban"

    Then Assert that product card of name "savings_account_name" and iban "savings_account_iban" from Excel "<rowindex>" is not displayed
    And Click "Pay" content description from view tag "View"
    And Click "My Products" content description from view tag "View"
    And Unhide account from Excel "<rowindex>" columnName "savings_account_iban" if needed
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view

    Examples:
      | rowindex |
      |        3 |


  @Product_Summary-Edit_Product_view_[MOB_ANDROID]_3
  Scenario Outline: Product_Summary-Edit_Product_view_[MOB_ANDROID]_3

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Hide account from Excel "<rowindex>" columnName "deposit_account_iban"

    Then Assert that product card of name "deposit_account_name" and iban "deposit_account_iban" from Excel "<rowindex>" is not displayed
    And Scroll up until element with text "Edit list" is in view
    And Unhide account from Excel "<rowindex>" columnName "deposit_account_iban" if needed
    And Scroll until element with text from excel "<rowindex>" columnName "deposit_account_iban" is in view

    Examples:
      | rowindex |
      |        3 |


  @Product_Summary-Edit_Product_view_[MOB_ANDROID]_4
  Scenario Outline: Product_Summary-Edit_Product_view_[MOB_ANDROID]_4

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Hide account from Excel "<rowindex>" columnName "insurance_account_detailed_name"

    Then Assert that product card of name "insurance_account_name" and iban "insurance_account_detailed_name" from Excel "<rowindex>" is not displayed
    And Scroll up until element with text "Edit list" is in view
    And Unhide account from Excel "<rowindex>" columnName "insurance_account_detailed_name" if needed
    And Scroll until element with text from excel "<rowindex>" columnName "insurance_account_detailed_name" is in view

    Examples:
      | rowindex |
      |        1 |


  @Product_Summary-Edit_Product_view_[MOB_ANDROID]_5
  Scenario Outline: Product_Summary-Edit_Product_view_[MOB_ANDROID]_5

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Hide account from Excel "<rowindex>" columnName "loan_account_iban"

    Then Assert that product card of name "loan_account_name" and iban "loan_account_iban" from Excel "<rowindex>" is not displayed
    And Scroll up until element with text "Edit list" is in view
    And Unhide account from Excel "<rowindex>" columnName "loan_account_iban" if needed
    And Scroll until element with text from excel "<rowindex>" columnName "loan_account_iban" is in view

    Examples:
      | rowindex |
      |        3 |


  @Product_Summary-Vita_Insurance_List_[MOB_ANDROID]
  Scenario Outline: Product_Summary-Vita_Insurance_List_[MOB_ANDROID]
    #C70781
    #BUG On android 16 1.700,00 is 1700,00
    #Only happens on 4 digit numbers

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Scroll until element with text from excel "<rowindex>" columnName "insurance_account_detailed_name" is in view
    And Swipe vertical short

    Then Assert that product card of name "insurance_account_name" and iban "insurance_account_detailed_name" from Excel "<rowindex>" for vita insurance account are shown correctly
    And Assert that whole product card of vita insurance account with name "insurance_account_name" and iban "insurance_account_detailed_name" from Excel "<rowindex>" acts as a clickable button

    Examples:
      | rowindex |
      |        1 |


  @Product_Summary-Term_Deposit_List_[MOB_ANDROID]
  Scenario Outline: Product_Summary-Term_Deposit_List_[MOB_ANDROID]
    #C70786
    #BUG On android 16 1.700,00 is 1700,00
    #Only happens on 4 digit numbers

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Scroll until element with text from excel "<rowindex>" columnName "deposit_account_iban" is in view
    And Swipe vertical short

    Then Assert that product card of name "deposit_account_name" and iban "deposit_account_iban" from Excel "<rowindex>" for term deposit account are shown correctly
    And Assert that whole product card of term deposit account with name "deposit_account_name" and iban "deposit_account_iban" from Excel "<rowindex>" acts as a clickable button

    Examples:
      | rowindex |
      |        1 |

  @Product_Summary-NLB_Funds_List_[MOB_ANDROID]
  Scenario Outline: Product_Summary-NLB_Funds_List_[MOB_ANDROID]
    #C70787

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    #And Scroll until element with text from excel "<rowindex>" columnName "nlb_funds_account_detailed_name" is in view
    And Scroll until Number of Asset Units for NLB Funds from Excel "<rowindex>" columnName "nlb_funds_account_name" "nlb_funds_account_detailed_name" is in view

    Then Assert that product card of name "nlb_funds_account_name" and detailed name "nlb_funds_account_detailed_name" from Excel "<rowindex>" for nlb funds account are shown correctly
    And Assert that whole product card of nlb funds account with name "nlb_funds_account_name" and iban "nlb_funds_account_detailed_name" from Excel "<rowindex>" acts as a clickable button

    Examples:
      | rowindex |
      |        1 |

  @Product_Summary-Credit_Card_List_[MOB_ANDROID]
  Scenario Outline: Product_Summary-Credit_Card_List_[MOB_ANDROID]
    #C70784

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Scroll until element with text from excel "<rowindex>" columnName "credit_card_premium_visa_one_iban" is in view
    And Swipe vertical short
    And Swipe vertical short

    Then Assert that product card of name "credit_card_premium_visa_one_name" and detailed name "credit_card_premium_visa_one_iban" from Excel "<rowindex>" for nlb credit card account are shown correctly
    And Assert that whole product card of credit card account with name "credit_card_premium_visa_one_name" and iban "credit_card_premium_visa_one_iban" from Excel "<rowindex>" acts as a clickable button


    Examples:
      | rowindex |
      |        1 |

  @Product_Summary_Favorite_account_[MOB_ANDROID]
  Scenario Outline: Product_Summary_Favorite_account_[MOB_ANDROID]
    #C75516

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by text "Edit list"
    And Click on element by text "Edit list"
    And Wait for element by text "Set favorite account"
    And Click on element by text "Set favorite account"
    And Wait for element by text "Apply"
    And Assert element by text "Default sorting"
    And Click on element by text from excel "<rowindex>" columnName "second_personal_account_iban"
    And Click on element by text "Apply"
    And Wait for element by text "Edit products view"
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-secondary-balance" to appear

    Then Assert first product shown in my products is favorite account from Excel "<rowindex>" columnName "second_personal_account_iban"
    And Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer"
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Click on element by id "nlb-button-alternate"
    And Wait for element with "Current account" content description from view tag "View"
    And Remove keyboard
    And Scroll until element with text from excel "<rowindex>" columnName "sepa_contact_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "sepa_contact_iban"
    And Wait for element by text "Set amount and currency" to appear for "30" seconds
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Click on element by text "Next"
    And Wait for element by id "nlb-checkbox-update-recipient" to appear
    And Assert Debtor in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "second_personal_account_name" and iban "second_personal_account_iban" with currency "EUR"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Pay or transfer"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Past payments"
    And Click "My Products" content description from view tag "View"
    And Wait for element by text "Edit list"
    And Click on element by text "Edit list"
    And Wait for element by text "Set favorite account"
    And Click on element by text "Set favorite account"
    And Wait for element by text "Apply"
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Click on element by text "Apply"
    And Wait for element by text "Edit products view"
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-secondary-balance" to appear
    And Assert first product shown in my products is favorite account from Excel "<rowindex>" columnName "personal_account_iban"


    Examples:
      | rowindex |
      |        1 |

  @Product_Summary_Sorting_on_the_Product_Summary_[ANDROID]
  Scenario Outline: Product_Summary_Sorting_on_the_Product_Summary_[ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-id" to appear
    And Remember all product ibans under key "product_ibans"

    Then Compare text from Excel "<rowindex>" columnName "correctly_sorted_products" and text from key "product_ibans"

    Examples:
      | rowindex |
      |        1 |