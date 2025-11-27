Feature: PFM_Categorization

  @PFM_Categorization_Cancel_Manual_Categorization_Of_Transactions_[MOB_ANDROID]
  Scenario Outline: PFM_Categorization_Cancel_Manual_Categorization_Of_Transactions_[MOB_ANDROID]
    #TODO Uraditi varijaciju za kartice kad ih dobijemo

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-id" to appear
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-item-row" to appear
    And Swipe vertical

    Then Find the appropriate transaction for canceling manual categorization
    And Remember current category of transaction
    And Click on edit button to change category
    And Wait for element by id "nlb-button-primary" to appear
    And Click on category from key "current_category" to get to category selection window
    And Wait for element with "Drugi prihodki" content description from view tag "View"
    And Click "Dom" content description from view tag "View"
    And Wait for element by id "nlb-button-primary" to appear
    And Click on element by id "nlb-button-alternate"
    And Wait for element by id "nlb-date" to appear
    And Assert category from key "current_category" is shown


    Examples:
      | rowindex |
      |        4 |


  @PFM_Categorization_Add_Existing_Tag_To_Transaction_[MOB_ANDROID]
  Scenario Outline: PFM_Categorization_Add_Existing_Tag_To_Transaction_[MOB_ANDROID]
    #TODO Zavrsiti kad budu dodali lokatore, ovaj test i Add new tag

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-id" to appear
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-item-row" to appear
    And Swipe vertical

    Then Find the appropriate transaction adding tags
    And Click on element by text "Add tag"



    Examples:
      | rowindex |
      |        4 |

  @PFM_Categorization_Manual_Categorization_Of_Transactions_[ANDROID]
  Scenario Outline: PFM_Categorization_Manual_Categorization_Of_Transactions_[ANDROID]
    #C71436

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-id" to appear
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-item-row" to appear
    And Swipe vertical

    Then Find the appropriate transaction for manual categorization
    And Click on edit button to change category
    And Wait for element by id "nlb-button-primary" to appear
    And Change category to "Other income"
    And Assert element by text "Other income"
    And Click on edit button to change category
    And Wait for element by id "nlb-button-primary" to appear
    And Change category to "Personal income"
    And Assert element by text "Personal income"
    And Click on edit button to change category
    And Wait for element by id "nlb-button-primary" to appear
    And Change category to "Transfers"
    And Assert element by text "Transfers"
    And Click on edit button to change category
    And Wait for element by id "nlb-button-primary" to appear
    And Change category to "Groceries"
    And Assert element by text "Groceries"
    And Click on edit button to change category
    And Wait for element by id "nlb-button-primary" to appear
    And Change category to "Home"
    And Assert element by text "Home"
    And Click on edit button to change category
    And Wait for element by id "nlb-button-primary" to appear
    And Change category to "Bars & Restaurants"
    And Assert element by text "Bars & Restaurants"
    And Click on edit button to change category
    And Wait for element by id "nlb-button-primary" to appear
    And Change category to "Health & Personal care"
    And Assert element by text "Health & Personal care"
    And Click on edit button to change category
    And Wait for element by id "nlb-button-primary" to appear
    And Change category to "Savings & Investments"
    And Assert element by text "Savings & Investments"
    And Click on edit button to change category
    And Wait for element by id "nlb-button-primary" to appear
    And Change category to "Finances & Insurance"
    And Assert element by text "Finances & Insurance"
    And Click on edit button to change category
    And Wait for element by id "nlb-button-primary" to appear
    And Change category to "Shopping"
    And Assert element by text "Shopping"
    And Click on edit button to change category
    And Wait for element by id "nlb-button-primary" to appear
    And Change category to "Kids"
    And Assert element by text "Kids"
    And Click on edit button to change category
    And Wait for element by id "nlb-button-primary" to appear
    And Change category to "Education"
    And Assert element by text "Education"
    And Click on edit button to change category
    And Wait for element by id "nlb-button-primary" to appear
    And Change category to "Car & Transport"
    And Assert element by text "Car & Transport"
    And Click on edit button to change category
    And Wait for element by id "nlb-button-primary" to appear
    And Change category to "Sport & Leisure"
    And Assert element by text "Sport & Leisure"
    And Click on edit button to change category
    And Wait for element by id "nlb-button-primary" to appear
    And Change category to "Cash"
    And Assert element by text "Cash"
    And Click on edit button to change category
    And Wait for element by id "nlb-button-primary" to appear
    And Change category to "Other"
    And Assert element by text "Other"


    Examples:
      | rowindex |
      |        4 |


  @PFM_Categorization_Split_Of_Transactions_[ANDROID]
  Scenario Outline: PFM_Categorization_Split_Of_Transactions_[ANDROID]
    #C71438,C71441

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-id" to appear
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-item-row" to appear
    And Swipe vertical

    Then Find the appropriate transaction for manual categorization
    And Click on edit button to change category
    And Wait for element by id "nlb-button-primary" to appear
    And Assert element by text "Split transaction"
    And Assert element by text "Enable split"
    And Click on element by id "nlb-switch"
    And Wait for element by text "Split transaction"
    And Remember remaning amount of transaction for splitting under key "amount"
    And Split first category into "Shopping"
    And Wait for element by text "Split transaction"
    And Enter amount "1" into "1" split
    And Split second category into "Kids"
    And Enter amount from key "amount" into "2" split minus "1"
    And Assert remaining amount is "0,00 EUR"
    And Scroll down until element with text "Apply" is in view
    And Click on element by text "Apply"
    And Wait for element by text "Send message"
    And Assert element by text "Category is split into multiple categories"
    And Assert element by text "Shopping"
    And Assert element by text "Kids"
    And Click on edit button to change category
    And Wait for element by id "nlb-switch" to appear
    And Click on element by id "nlb-switch"
    And Wait for element by text "Enable split"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Confirmation"
    And Assert element by text "Split transaction" is not displayed

    Examples:
      | rowindex |
      |        4 |


  @PFM_Categorization_Automatic_Categorization_Of_Transactions_[ANDROID]
  Scenario Outline: PFM_Categorization_Automatic_Categorization_Of_Transactions_[ANDROID]
    #C71435

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Click on element by id "nlb-button-alternate"
    And Wait for element with "Current account" content description from view tag "View"
    And Remove keyboard
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by text "Set amount and currency" to appear for "30" seconds
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Click on element by text "Next"
    And Wait for element by id "nlb-input-purpose" to appear
    And Assert element by contains text "Own account Transfer"
    And Assert element by contains text "Check data and choose"
    And Assert element by contains text "Debtor"
    And Assert Debtor in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "personal_account_name" and iban "personal_account_iban"
    And Assert Recipient in Own Account Transfer has content description "Savings Account" and from Excel "<rowindex>" account name "savings_account_name" and iban "savings_account_iban"
    And Assert element by text "Payment"
    And Assert element by contains text "In order to continue all input fields must be filled."
    And Assert element by text "Payment amount"
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Click on element by text "EUR"
    And Assert element by text "USD" is not displayed
    And Assert element by text "Purpose"
    And Assert text "INTERNAL TRANSFER" in element id "nlb-input-purpose"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "int_04" in txt file
    And Assert element by text "Payment date"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 EUR"
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert element by text "Debtor"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_review"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "Name" has first following sibling with text from Excel "<rowindex>" columnName "savings_user_name_for_payment_review"
    And Assert that second text "Address" has first following sibling with text from Excel "<rowindex>" columnName "savings_user_address_for_payment_review"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "savings_account_iban"
    #And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI2X"
    And Swipe vertical
    And Assert element by text "Payment"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "int_04"
    And Assert that text "Payment date" has first following sibling with current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"

    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"

    And Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Click on first element by id "nlb-title"
    And Wait for element by text "Confirmation"

    Then Assert element by exact text "Debit" is not displayed

    Examples:
      | rowindex |
      |        4 |