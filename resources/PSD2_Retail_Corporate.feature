Feature: PSD2_Retail_Corporate

  #These tests use a user with both retail and corporate accounts
  #Currently that is user dbpart02

  @Android-Izbira_racuna_(Context_selector)
  Scenario Outline: Android-Izbira_racuna_(Context_selector)
    #C76461

    Given Send TPP Registration API call
    And Send Login call
    And TPP Create Consent on Android and expect failure
    And Send Login call
    And TPP Create Consent on android

    When Start PSD2 app
    And Wait for element by text "Login to NLB Klik"
    And Click on element by text "Login to NLB Klik"
    And Wait for element by text "Enter PIN"
    And Enter PIN
    And Wait for element by text "User role"

    Then Assert element by text "User role"
    And Assert element by text "Please select your role."
    And Assert element by text from excel "<rowindex>" columnName "personal_account_details_owner"
    And Assert element by text from excel "<rowindex>" columnName "psd2_user_selection_business_account_one"
    And Assert element by text from excel "<rowindex>" columnName "psd2_user_selection_business_account_two"
    And Assert element by text from excel "<rowindex>" columnName "psd2_user_selection_business_account_three"
    And Click on element by text from excel "<rowindex>" columnName "personal_account_details_owner"
    And Wait for element by text "Third party site or app provider"
    And Assert element by text from excel "<rowindex>" columnName "shared_account_iban"
    And Go Back
    And Wait for element by text "User role"
    And Click on element by text from excel "<rowindex>" columnName "psd2_user_selection_business_account_one"
    And Wait for element by text "Third party site or app provider"
    And Assert element by text from excel "<rowindex>" columnName "psd2_user_selection_business_name_one"
    And Assert element by text from excel "<rowindex>" columnName "psd2_user_selection_business_iban_one"

    Examples:
      | rowindex |
      |        4 |

  @Android-Kreiranje_novega_soglasja_na_OR
  Scenario Outline: Android-Kreiranje_novega_soglasja_na_OR
    #C76462

    Given Send TPP Registration API call
    And Send Login call
    And TPP Create Consent on Android and expect failure
    And Send Login call
    And TPP Create Consent on android

    When Start PSD2 app
    And Wait for element by text "Login to NLB Klik"
    And Click on element by text "Login to NLB Klik"
    And Wait for element by text "Enter PIN"
    And Enter PIN
    And Wait for element by text "User role"
    And Click on element by text from excel "<rowindex>" columnName "personal_account_details_owner"
    And Wait for element by text "Third party site or app provider"
    And Assert tpp name from key "new_tpp_name" is displayed
    And Assert element by text "Valid license for payment services (PSD2)"
    And Select account from Excel "<rowindex>" columnName "personal_account_iban" as debtor in payment screen for PSD2 consent
    And Wait for element by text "Third party site or app provider"
    And Assert element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Assert element by text "Permissions"
    And Assert element by text "Account information"
    And Assert element by text "Name of account or bundle, account number, account owner name"
    And Assert element by text "Balance"
    And Assert element by text "Balance of the selected account"
    And Assert element by text "Transactions"
    And Assert element by text "Details about executed transactions"
    And Swipe vertical
    And Assert element by text "Valid until"
    And Assert PSD2 is valid until today date
    And Click on element by id "nlb-button-primary"
    #And Assert element by text "nlb.si"

    #Then Open Application
    And Wait for element by text "Login to NLB Klik"
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    And Click "Default Icon" content description from view tag "View"
    And Wait for element by text "Security and privacy"
    And Click on element by text "Security and privacy"
    And Wait for element by text "Third party consents"
    And Click on element by text "Third party consents"
    And Wait for element by id "nlb-valid-license" to appear
    And Scroll down until element with text from key "new_tpp_name" is in view
    And Click on element by text from key "new_tpp_name"
    And Wait for element by text "Consent details"
    And Assert element by text "Consent details"
    And Assert tpp name from key "new_tpp_name" is displayed
    And Assert Expiry date for PSD2 consent is today date
    And Assert element by text "Valid license for payment services (PSD2)"
    And Assert element by text "Exposed accounts"
    And Assert element by text from excel "<rowindex>" columnName "personal_account_name"
    And Assert element by text "Permissions"
    And Assert element by text "Account information"
    And Assert element by text "Name of account or bundle, account number, account owner name"
    And Assert element by text "Balance"
    And Assert element by text "Balance of the selected account"
    And Assert element by text "Transactions"
    And Assert element by text "Details about executed transactions"
    And Assert element by text "Consent date"
    And Assert PSD2 is valid until today date
    And Assert PSD2 consent date is today date
    And Swipe vertical
    And Assert element by text "Remove access"



    Examples:
      | rowindex |
      |        4 |


  @Android-Izvedba_PSD2_placila_v_breme_OR(Debit_ACC_je_definiran_v_API)
  Scenario Outline: Android-Izvedba_PSD2_placila_v_breme_OR(Debit_ACC_je_definiran_v_API)
    #C76469

    Given Send TPP Registration API call
    And Send Login call
    And Create Payment on Android PSD2 with debtor "<rowindex>" columnName "personal_account_iban" and expect failure
    And Send Login call
    And Create Payment on Android PSD2 with debtor "<rowindex>" columnName "personal_account_iban"

    When Start PSD2 app
    And Wait for element by text "Login to NLB Klik"
    And Click on element by text "Login to NLB Klik"
    And Wait for element by text "Enter PIN"
    And Enter PIN
    And Wait for element by text "User role"
    And Click on element by text from excel "<rowindex>" columnName "personal_account_details_owner"


    Examples:
      | rowindex |
      |        4 |