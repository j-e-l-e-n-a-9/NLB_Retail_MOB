Feature: Payment_Wizard

  @Payments_Payment_Wizard_[MOB_ANDROID]
  Scenario Outline: Payments_Payment_Wizard_[MOB_ANDROID]
    #C71212

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear

    Then Assert element by contains text "Enter data and payment type will be automatically selected on next step."
    And Assert element by contains text "Select recipient or input an account number"
    And Assert element by id "nlb-button-alternate" that has descendant text "Select from list"
    And Assert element by contains text "Input account number"
    And Assert element "nlb-input-account-number" by id
    And Assert element by contains text "For payments in Slovenia and SEPA countries use IBAN number e.g.: SI, HR, AT, IT"
    And Assert element by contains text "For foreign payments make sure to use all special letters and symbols from the invoice."
    #And Assert element by contains text "For own account transfer, click the button above and select account."
    And Assert element by contains text "Set amount and currency"
    And Assert element by text "Payment amount"
    And Assert element "nlb-amount-with-currency-field" by id
    And Assert element "nlb-dropdown-menu" by id
    And Swipe vertical
    And Assert element by text "Cancel"
    And Assert element by text "Next"
    And Enter text "10000.00" in element id "nlb-amount-with-currency-field"
    And Assert text "10.000,00" in element id "nlb-amount-with-currency-field"
    And Click on element by id "nlb-button-alternate"
    And Wait for element by id "nlb-card-container" to appear
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-amount-with-currency-field" to appear
    And Assert element by contains text "Recipient"


    Examples:
      | rowindex |
      |        4 |


  @Payments_Payment_Wizard-Mandatory_Fields_[MOB_ANDROID]
  Scenario Outline: Payments_Payment_Wizard-Mandatory_Fields_[MOB_ANDROID]
    #C71213

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Swipe vertical
    
    Then Assert element "nlb-button-primary" by id is disabled
    And Enter text from excel "<rowindex>" columnName "personal_account_iban" in element id "nlb-input-account-number"
    And Assert element "nlb-button-primary" by id is disabled
    And Enter text "10.00" in element id "nlb-amount-with-currency-field"
    And Assert element "nlb-button-primary" by id is enabled


    Examples:
      | rowindex |
      |        4 |

  @Payments_Payment_Wizard-Invalid_Amount_Input_[MOB_ANDROID]
  Scenario Outline: Payments_Payment_Wizard-Invalid_Amount_Input_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Swipe vertical

    Then Enter text "10000000000" in element id "nlb-amount-with-currency-field"
    And Assert element by contains text "Maximum amount is 999.999.999,99 EUR."
    And Enter text "0.00" in element id "nlb-amount-with-currency-field"
    And Assert element by contains text "Minimum amount is 0,01 EUR."
    And Enter text "" in element id "nlb-amount-with-currency-field"
    And Assert element by contains text "Amount is required."
    And Enter text "!@$" in element id "nlb-amount-with-currency-field"
    And Assert element by id "nlb-amount-with-currency-field" that has descendant text "0,00"

    Examples:
      | rowindex |
      |        4 |

  @Payments_Payment_Wizard-Invalid_Account_Input_[MOB_ANDROID]
  Scenario Outline: Payments_Payment_Wizard-Invalid_Account_Input_[MOB_ANDROID]
    #C71215

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Swipe vertical

    Then Enter text "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" in element id "nlb-input-account-number"
    And Assert element by contains text "Maximum number of characters is 34."
    And Enter text "" in element id "nlb-input-account-number"
    And Assert element by contains text "Input account number is required"
    #And Assert element by contains text "Creditor account is required"
    And Enter text "!$%" in element id "nlb-input-account-number"
    And Assert text "" in element id "nlb-input-account-number" with descendant tag "TextView"
    And Enter text "0292 4025 3764 022" in element id "nlb-input-account-number"
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Click on element by text "Next"
    And Assert element by contains text "SI56 0292 4025 3764 022"
    And Assert element by contains text "Wrong account format."

    Examples:
      | rowindex |
      |        4 |

  @Payments_Payment_Wizard-Cancel_Button_[MOB_ANDROID]
  Scenario Outline: Payments_Payment_Wizard-Cancel_Button_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Swipe vertical

    Then Click on element by text "Cancel"
    And Assert element by contains text "Are you sure?"
    And Assert element by contains text "Cancelling now will terminate the payment process."
    And Assert element by contains text "No"
    And Assert element by contains text "Yes"
    And Click on element by text "No"
    And Wait for element by id "nlb-input-account-number" to appear
    And Assert element "nlb-input-account-number" by id
    And Click on element by text "Cancel"
    And Click on element by text "Yes"
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    And Assert element "nlb-bottom-nav-button" by id

    Examples:
      | rowindex |
      |        4 |