Feature: Daily_TST_Run

  @Current_Accounts-Transactions-Details_[MOB_ANDROID]
  Scenario Outline: Current_Accounts-Transactions-Details_[MOB_ANDROID]

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
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by text "Set amount and currency" to appear for "30" seconds
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Click on element by text "Next"
    And Wait for element by id "nlb-input-purpose" to appear

    Then Assert element by contains text "Own account Transfer"
    And Assert element by contains text "Check data and choose"
    And Assert element by contains text "Debtor"
    #Changing debtor
    And Click on Debtor selector for payment
    And Wait for element by text "Select account"
    And Assert element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by text "Own account Transfer"
    #End of changing debtor
    And Assert Debtor in Own Account Transfer has content description "Savings Account" and from Excel "<rowindex>" account name "savings_account_name" and iban "savings_account_iban"
    And Assert Recipient in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "personal_account_name" and iban "personal_account_iban"
    And Assert element by text "Payment"
    And Assert element by contains text "In order to continue all input fields must be filled."
    And Assert element by text "Payment amount"
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Click on element by text "EUR"
    And Assert element by text "USD" is not displayed
    And Assert element by text "Purpose"
    And Assert text "INTERNAL TRANSFER" in element id "nlb-input-purpose"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "int_05" in txt file
    And Assert element by text "Payment date"
    And Swipe vertical
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 EUR"
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert element by text "Debtor"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "savings_user_name_for_payment_review"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "savings_user_address_for_payment_review"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "savings_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_review"
    And Assert that second text "Address" has first following sibling with text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    #And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Swipe vertical
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI2X"
    And Assert element by text "Payment"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "int_05"
    And Assert that text "Payment date" has first following sibling with current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"

    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"

    Then Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Scroll until element with text from txt file under key "int_05" is in view and click
    And Wait for element by text "Confirmation"
    And Assert element "nlb-date" by id
    And Assert element "nlb-currency" by id
    And Assert element "nlb-title" by id
    And Assert element "nlb-amount" by id
    And Assert element "nlb-details" by id
    And Assert element by text "Confirmation"
    And Assert element by text "Send message"
    And Assert element by text "Creditor"
    And Assert that text "Name and address" has first following sibling that contains from Excel "<rowindex>" columnName "user_name_short"
    And Assert that text "Name and address" has first following sibling that contains from Excel "<rowindex>" columnName "user_street_short"
    And Assert that text "Name and address" has first following sibling that contains from Excel "<rowindex>" columnName "user_city_short"
    And Assert that text "Name and address" has first following sibling that contains text "SI"
    And Assert element by text "Account number"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "savings_account_iban"
    And Assert element by text "Creditor Reference"
    And Assert that text "Creditor Reference" has first following sibling that contains text "NRC00"
    And Assert that text "SWIFT BIC code" has first following sibling that contains text "LJBASI2X"
    And Assert element by text "Settlement date"
    And Assert element by text "Transaction ID"
    And Swipe vertical
    And Assert element by text "Add tag"

    Examples:
      | rowindex |
      | 4        |


  @Current_Accounts-Details-Financial_Details_[MOB_ANDROID]
  Scenario Outline: Current_Accounts-Details-Financial_Details_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click on element by text "Details"
    And Wait for element by id "nlb-product-details-overdraft" to appear

    Then Assert element by text "Financial details"
    And Assert element by text "Overdraft"
    And Assert element by id "nlb-product-details-overdraft" ends in "EUR"
    And Scroll down until element with text "Currency exchange" is in view
    And Assert element by text "Overdraft expiration date"
    And Assert text "until changed" in element id "nlb-product-details-overdraft-expiration-date"
    And Assert element by text "Interest rate"
    And Assert element by id "nlb-product-details-interest-rate" ends in "%"
    #And Swipe vertical
    And Assert element by id "nlb-button-text" that has descendant text "Currency exchange"
    And Assert element by id "nlb-button-text" that has descendant text "Change overdraft"
    And Assert element by id "nlb-product-details-interest-rate" with regex "^(?:(?:0|[1-9]\d{0,2})(?:.\d{3})*),\d{4} [%]{1}$"
    And Click on element by text "Currency exchange"
    And Wait for element by text "Check exchange rates"
    And Assert element by text "Check exchange rates"
    And Click "Back" content description from view tag "View"
    And Click on element by text "Yes"
    And Wait for element by id "nlb-product-details-overdraft" to appear
    And Click on element by text "Change overdraft"
    And Assert element by text "Basic info about overdraft"


    Examples:
      | rowindex |
      |        4 |


  @Current_Accounts-Details-Bundle_Service_[MOB_ANDROID]
  Scenario Outline: Current_Accounts-Details-Bundle_Service_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click on element by text "Details"
    And Wait for element by id "nlb-product-details-overdraft" to appear
    And Scroll down until element with text "Change bundle" is in view

    Then Assert element by text "Bundle services available"
    And Click on following sibling of text "Bundle services available"
    And Wait for element by text "Number of free Direct Debits (SEPA DD)"
    And Assert element by text "Bundle services available"
    And Assert element by text "Direct Debits (SEPA DD)"
    And Assert element by text "Number of free Direct Debits (SEPA DD)"
    And Assert element by text "UPN payment"
    And Assert element by text "Number of free UPN payments at NLB branch or NLB ATM"
    And Assert element by text "UPN e-payment"
    And Assert element by text "Number of free UPN payments in NLB Klik"
    And Assert element by text "ATM withdrawals"
    And Assert element by text "Number of free cash withdrawals at ATMs of other banks in Slovenia"
    And Click on element by text "Close"
    And Assert element by text "Direct Debits (SEPA DD)"
    And Assert text "unlimited" in element id "nlb-product-details-bundled-sdds"
    And Assert element by text "UPN payment"
    And Assert text "4/4" in element id "nlb-product-details-bundled-upns"
    And Assert element by text "UPN e-payment"
    And Assert text "unlimited" in element id "nlb-product-details-bundled-e-upns"
    And Assert element by text "ATM withdrawals"
    And Assert text "unlimited" in element id "nlb-product-details-bundled-counter-upns"
    And Swipe vertical short
    And Assert element by id "nlb-button-text" that has descendant text "Change bundle"
    And Click on element by text "Change bundle"
    And Assert element by text "Compare bundles and select the right one for you"
    And Assert element by text "Paket Premium"


    Examples:
      | rowindex |
      |        4 |

  @Current_Accounts-Details-Account_Details_[MOB_ANDROID]
  Scenario Outline: Current_Accounts-Details-Account_Details_[MOB_ANDROID]


    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click on element by text "Details"
    And Wait for element by id "nlb-product-details-overdraft" to appear
    And Scroll down until element with text "Document archive" is in view

    Then Assert element by text "Account details"
    And Click on following sibling of text "Account details"
    And Assert element by text "Account details data have been copied to clipboard."
    And Assert value from clipboard is the same as from Excel "<rowindex>" columnName "personal_account_details"
    And Assert element by text "Account type"
    And Assert text "Current account" in element id "nlb-product-details-account-type"
    And Assert element by text "Account owner"
    And Assert text from excel "<rowindex>" columnName "personal_account_details_owner" in element by id "nlb-product-details-account-owner"
    And Assert element by text "Account number"
    And Assert text from excel "<rowindex>" columnName "personal_account_iban" in element by id "nlb-product-details-account-number"
    And Assert element by text "BIC"
    And Assert text from excel "<rowindex>" columnName "personal_account_BIC" in element by id "nlb-product-details-bic"
    And Assert element by id "nlb-button-text" that has descendant text "Document archive"
    And Click on element by text "Document archive"
    And Wait for element by id "nlb-icon-button" to appear
    And Assert element by text "No documents for selected filters."

    Examples:
      | rowindex |
      |        4 |

  @Savings_Accounts-Transactions_List_[MOB_ANDROID]
  Scenario Outline: Savings_Accounts-Transactions_List_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Assert element "nlb-date" by id
    And Assert element "nlb-currency" by id
    And Assert element "nlb-title" by id
    And Assert element "nlb-amount" by id
    And Assert element "nlb-details" by id
    And Assert element "nlb-transaction-header-sum" by id
    And Assert element "nlb-transaction-header-sum" by id
    And Assert current month on page
    And Click on Filter button in my product
    And Wait for element by text "Date"
    And Click on element by text "Date"
    And Wait for element by text "Current month"
    And Click on element by text "Current month"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Date"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-title" to appear
    And Calculate sum of all transactions in transaction list and put in key "sumOfTransactions"
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by id "nlb-transaction-header-sum" to appear
    And Assert sum of monthly transactions is correct with key "sumOfTransactions"

    #And Assert there are more than "30" payments using id "nlb-title"

    Examples:
      | rowindex |
      | 4        |

  @Savings_Accounts-Transactions-Details_[MOB_ANDROID]
  Scenario Outline: Savings_Accounts-Transactions-Details_[MOB_ANDROID]

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
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by text "Set amount and currency" to appear for "30" seconds
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Click on element by text "Next"
    And Wait for element by id "nlb-input-purpose" to appear

    Then Assert element by contains text "Own account Transfer"
    And Assert element by contains text "Check data and choose"
    And Assert element by contains text "Debtor"
    #Changing debtor
    And Click on Debtor selector for payment
    And Wait for element by text "Select account"
    And Assert element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by text "Own account Transfer"
    #End of changing debtor
    And Assert Debtor in Own Account Transfer has content description "Savings Account" and from Excel "<rowindex>" account name "savings_account_name" and iban "savings_account_iban"
    And Assert Recipient in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "personal_account_name" and iban "personal_account_iban"
    And Assert element by text "Payment"
    And Assert element by contains text "In order to continue all input fields must be filled."
    And Assert element by text "Payment amount"
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Click on element by text "EUR"
    And Assert element by text "USD" is not displayed
    And Assert element by text "Purpose"
    And Assert text "INTERNAL TRANSFER" in element id "nlb-input-purpose"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "int_05" in txt file
    And Assert element by text "Payment date"
    And Swipe vertical
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 EUR"
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert element by text "Debtor"
    And Assert that text "First and last name / Company name" has first following sibling that contains from Excel "<rowindex>" columnName "user_name_short"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "savings_user_address_for_payment_review"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "savings_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "First and last name / Company name" has first following sibling that contains text from Excel "<rowindex>" columnName "user_name_short"
    And Assert that second text "Address" has first following sibling with text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    #And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Scroll down until element with text "Pay" is in view
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI2X"
    And Assert element by text "Payment"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "int_05"
    And Assert that text "Payment date" has first following sibling with current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"

    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"

    Then Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Scroll until element with text from txt file under key "int_05" is in view and click
    And Wait for element by text "Confirmation"
    And Assert element "nlb-date" by id
    And Assert element "nlb-currency" by id
    And Assert element "nlb-title" by id
    And Assert element "nlb-amount" by id
    And Assert element "nlb-details" by id
    And Assert element by text "Confirmation"
    And Assert element by text "Send message"
    And Assert element by contains text from excel "<rowindex>" columnName "user_name_short"
    And Assert element by contains text from excel "<rowindex>" columnName "user_street_short"
    And Assert element by contains text from excel "<rowindex>" columnName "user_city_short_other"
    And Assert element by text "Account number"
    And Assert element by contains text from excel "<rowindex>" columnName "personal_account_iban"
    And Assert element by text "Creditor Reference"
    And Assert element by text "NRC00"
    And Assert element by text "SWIFT BIC code"
    And Assert element by text "LJBASI20"
    And Assert element by text "Settlement date"
    And Assert element by text "Transaction ID"
    And Swipe vertical
    And Assert element by text "Add tag" is not displayed

    Examples:
      | rowindex |
      | 4        |

  @Savings_Accounts_Details-Financial_Details_[MOB_ANDROID]
  Scenario Outline: Savings_Accounts_Details-Financial_Details_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click on element by text "Details"
    And Wait for element by id "nlb-interest-rate" to appear
    And Swipe vertical

    Then Assert element by text "Financial details"
    And Assert element by text "Interest rate"
    And Assert element by id "nlb-interest-rate" ends in "%"
    And Assert element by id "nlb-interest-rate" with regex "^(?:(?:0|[1-9]\d{0,2})(?:.\d{3})*),\d{4} [%]{1}$"
    And Assert element by text "Accrued interest"
    And Assert element by id "nlb-accrued-interest" ends in "EUR"
    And Assert element by id "nlb-button-text" that has descendant text "Currency exchange"
    And Click on element by text "Currency exchange"
    And Wait for element by text "Check exchange rates"
    And Assert element by text "Check exchange rates"

    Examples:
      | rowindex |
      |        4 |

  @Savings_Accounts-Details-Account_Details_[MOB_ANDROID]
  Scenario Outline: Savings_Accounts-Details-Account_Details_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click on element by text "Details"
    And Wait for element by id "nlb-interest-rate" to appear
    And Scroll down until element with text "Document archive" is in view

    Then Assert element by text "Account details"
    And Assert element by text "Account type"
    And Assert text "Savings Account" in element id "nlb-account-type"
    And Assert element by text "Account owner"
    #And Assert text from excel "<rowindex>" columnName "savings_account_details_owner" in element by id "nlb-account-owner"
    And Assert element by text from excel "<rowindex>" columnName "user_name_short" is contained in element by id "nlb-account-owner"
    And Assert element by text "Account number"
    And Assert text from excel "<rowindex>" columnName "savings_account_iban" in element by id "nlb-account-number"
    And Assert element by text "Purpose"
    And Assert text "VARČEVALNI RAČUN" in element id "nlb-purpose"
    And Assert element by text "Opening date"
    And Assert text from excel "<rowindex>" columnName "savings_account_details_opening_date" in element by id "nlb-opening-date"
    And Swipe vertical
    And Assert element by id "nlb-button-text" that has descendant text "Document archive"
    And Click on element by text "Document archive"
    And Assert element by text "No documents for selected filters."

    Examples:
      | rowindex |
      |        4 |

  @Gradual_Savings_Accounts-Details-Account_Details_[MOB_ANDROID]
  Scenario Outline: Gradual_Savings_Accounts-Details-Account_Details_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "gradual_savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "gradual_savings_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click on element by text "Details"
    And Wait for element by id "nlb-interest-rate" to appear

    Then Assert element by text "Account details"
    And Assert element by text "Account type"
    And Assert text "Savings" in element id "nlb-account-type"
    And Assert element by text "Account owner"
    And Assert element by text from excel "<rowindex>" columnName "user_name_short" is contained in element by id "nlb-account-owner"
    And Assert element by text "Account number"
    And Assert text from excel "<rowindex>" columnName "gradual_savings_account_iban" in element by id "nlb-account-number"
    And Assert element by text "Purpose"
    And Assert text "TST Varčevanje DBP" in element id "nlb-purpose"
    And Assert element by text "Opening date"
    And Assert text from excel "<rowindex>" columnName "gradual_savings_account_details_opening_date" in element by id "nlb-opening-date"
    And Assert element by text "Expiration date"
    And Assert text from excel "<rowindex>" columnName "gradual_savings_account_details_expiration_date" in element by id "nlb-expiration-date"
    And Assert element by id "nlb-button-text" that has descendant text "Document archive"
    And Click on element by text "Document archive"
    And Assert element by text "No documents for selected filters."

    Examples:
      | rowindex |
      |        4 |

  @Credit_Cards-Details-Financial_Details_[MOB_ANDROID]
  Scenario Outline: Credit_Cards-Details-Financial_Details_[MOB_ANDROID]
    #C71175

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "credit_card_premium_visa_one_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "credit_card_premium_visa_one_iban"
    And Wait for element by id "nlb-feature-button" to appear
    And Click "Details" content description from view tag "View"
    And Wait for element by text "Financial details"

    Then Assert element by text "Approved limit"
    And Assert element by id "nlb-product-details-approved-overdraft" has two decimal places and ends in "EUR"
    And Assert element by text "Spent this month"
    And Assert element by id "nlb-product-details-spent-this-month" has two decimal places and ends in "EUR"
    And Assert element by text "Last statement amount"
    And Assert element by id "nlb-product-details-last-statement-amount" has two decimal places and ends in "EUR"
    And Assert element by text "Total spent"
    And Assert element by id "nlb-product-details-total-spent" has two decimal places and ends in "EUR"
    And Assert element by text "Monthly ATM withdrawal limit"
    And Assert element by id "nlb-product-details-monthly-atm-limits" has two decimal places and ends in "EUR"
    And Assert element by text "Limit expiration"
    And Assert text "Until cancellation" in element id "nlb-product-details-limit-expiration-date"
    And Assert element by text "Change limit amount"
    And Assert element by text "Repay limit"
    And Click on element by text "Repay limit"
    And Wait for element by text "UPN payment"
    And Assert element by text "UPN payment"
    And Click "Back" content description from view tag "View"
    And Click on element by text "Yes"
    And Wait for element by text "Change limit amount"
    And Click on element by text "Change limit amount"
    And Assert element by text "Change card limit order"
    And Click on element by text "Cancel"
    And Assert element by text "All transactions"

    Examples:
      | rowindex |
      |        5 |

  @Credit_Cards-Details-Card_Details_[MOB_ANDROID]
  Scenario Outline: Credit_Cards-Details-Card_Details_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "credit_card_premium_visa_one_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "credit_card_premium_visa_one_iban"
    And Wait for element by id "nlb-feature-button" to appear
    And Click "Details" content description from view tag "View"
    And Wait for element by text "Financial details"

    Then Scroll down until element with text "Document archive" is in view
    And Assert element by text "Card details"
    And Assert element by text "Cardholder name"
    And Assert text from excel "<rowindex>" columnName "credit_card_premium_visa_one_card_holder_name" in element by id "nlb-card-holder-name"
    And Assert element by text "Billing day"
    And Assert text from excel "<rowindex>" columnName "credit_card_premium_visa_one_billing_day" in element by id "nlb-billing-day"
    And Assert element by text "Settlement day"
    And Assert text from excel "<rowindex>" columnName "credit_card_premium_visa_one_settlement_day" in element by id "nlb-settlement-day"
    And Assert element by text "Valid thru"
    And Assert text from excel "<rowindex>" columnName "credit_card_premium_visa_one_valid_through" in element by id "nlb-valid-through"
    And Assert element by text "Status"
    And Assert text "Active" in element id "nlb-card-status"
    And Assert element by text "Document archive"
    And Click on element by text "Document archive"
    And Assert element by text "Documents archive"
    And Wait for element by id "nlb-title" to appear
    And Assert element "nlb-title" by id

    Examples:
      | rowindex |
      |        5 |

  @Payments_Payment_Wizard_[MOB_ANDROID]
  Scenario Outline: Payments_Payment_Wizard_[MOB_ANDROID]
    #RET-5741,RET-5792
    #RET-7711 Treba da se doda kada se sazna pravilno ponasanje

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

  @Payments_Upcoming_Payments_Cancel_Payment_[MOB_ANDROID]
  Scenario Outline: Payments_Upcoming_Payments_Cancel_Payment_[MOB_ANDROID]
    #C71583

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "retail_recipient_iban" in element id "nlb-input-account-number"
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by id "nlb-input-recipient-name" to appear
    And Enter text from excel "<rowindex>" columnName "retail_recipient_name" in element id "nlb-input-recipient-name"
    And Enter text "TEST" in element id "nlb-input-recipient-address"
    And Enter text "TEST" in element id "nlb-input-recipient-city"
    And Swipe vertical
    And Swipe vertical
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Assert text "OTHR - Other" in element id "nlb-input-purpose-code"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "SP_008" in txt file
    And Assert element by text "NRC - No reference"
    And Click on date "7" days in the future in calendar
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 EUR"
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert element by text "Debtor"
    #And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_review"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_name"
    And Assert that second text "Address" has first following sibling that contains text "TEST"
    And Assert that second text "Address" has first following sibling that contains text "SLOVENIA"
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_iban"
    And Swipe vertical
    And Swipe vertical
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Assert element by text "Payment"
    And Assert that text "Reference" has first following sibling with text "NRC"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "SP_008"
    And Assert that text "Purpose code" has first following sibling with text "OTHR"
    And Assert that text "Payment date" has first following sibling with future date "7" in format "d.M.yyyy"
    And Scroll down until element with id "nlb-button-primary" is in view
    And Click on element by id "nlb-button-primary"
    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"
    And Wait for element by text "Upcoming payments"
    And Click on element by text "Upcoming payments"
    And Wait for element by id "nlb-title" to appear
    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Scroll until element with text from txt file under key "SP_008" is in view and click
    And Wait for element by text "Recipient"


    Then Assert element by text "Payment details"
    And Assert element by id "nlb-date" has date "7" day in the future in format "d.M.yyyy"
    And Assert text under key "SP_008" from txt file in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "retail_recipient_name" in element by id "nlb-details"
    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_name_and_address_past_payment"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Assert that text "Reference" has first following sibling with text "NRC"
    And Assert that text "Purpose code" has first following sibling with text "OTHR"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_details"
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Scroll down until element with text "Pending" is in view
    #And Assert that text "Debtor address" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_payment_address"
    And Assert that text "Payment status" has first following sibling with text "Pending"
    And Scroll until element with text "Cancel payment" is in view
    And Click on element by text "Cancel payment"
    And Wait for element by text "Do you wish to cancel?"
    And Click on element by text "Yes"
    And Assert element by text "Success"
    And Assert payment under key "SP_008" is not displayed in upcoming payments
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Past payments"
    And Click on element by text "Past payments"
    And Wait for element by id "nlb-title" to appear
    And Scroll until element with text from txt file under key "SP_008" is in view and click
    And Wait for element by text "Recipient"
    And Assert element by text "Payment details"
    And Assert element by id "nlb-date" has date "7" day in the future in format "d.M.yyyy"
    And Assert text under key "SP_008" from txt file in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "retail_recipient_name" in element by id "nlb-details"
    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_name_and_address_past_payment"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Assert that text "Reference" has first following sibling with text "NRC"
    And Assert that text "Purpose code" has first following sibling with text "OTHR"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_details"
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Swipe vertical short
    #And Assert that text "Debtor address" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_payment_address"+
    And Scroll down until element with text "Canceled" is in view
    And Assert that text "Payment status" has first following sibling with text "Canceled"




    Examples:
      | rowindex |
      |        4 |

  @Security_And_Authentication_Login_With_Pin_[MOB_ANDROID]
  Scenario Outline: Security_And_Authentication_Login_With_Pin_[MOB_ANDROID]

    Given Open Application

    When Click on element by text "Continue to the app"
    And Click on element by text "Login to NLB Klik"
    And Wait for element by text "Enter PIN" to appear for "30" seconds
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Login to NLB Klik" to appear for "30" seconds
    And Click on element by text "Login to NLB Klik"
    And Wait for element by text "Enter PIN" to appear for "30" seconds

    Then Assert "NLB logo" content description from tag "ImageView" is displayed
    And Assert element by text "Enter PIN"
    And Assert text "Forgot PIN?" in element id "forgot-pin-button"
    And Send PIN from Excel "<rowindex>" columnName "pin_correct"
    And Wait for element by text "My NLB"
    And Assert element by text "My NLB"

    Examples:
      | rowindex |
      |        4 |


  @Security_And_Authentication_Generate_OTP_[MOB_ANDROID]
  Scenario Outline: Security_And_Authentication_Generate_OTP_[MOB_ANDROID]

    Given Open Application

    When Click on element by text "Continue to the app"
    And Wait for element by text "One-time password"
    And Click on element by text "One-time password"
    And Wait for element by text "Enter PIN"
    And Assert element by text "Enter PIN"
    And Assert "NLB logo" content description from tag "ImageView" is displayed
    And Assert element by text "Forgot PIN?"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "One-time password"
    And Click on element by text "One-time password"
    And Wait for element by text "Enter PIN"
    And Assert element by text "Enter PIN"
    And Send PIN from Excel "<rowindex>" columnName "pin_correct"
    And Wait for element by text "One-time password"

    Then Assert element by text "One-time password"
    And Assert OTP container is correct


    Examples:
      | rowindex |
      |        4 |


  @PFM_Categorization_Manual_Categorization_Of_Transactions_[ANDROID]
  Scenario Outline: PFM_Categorization_Manual_Categorization_Of_Transactions_[ANDROID]

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

  @Own_account_-Insufficient_funds[Android]
  Scenario Outline: Own_account_-Insufficient_funds[Android]


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
    And Enter text "999999999" in element id "nlb-amount-with-currency-field"
    And Click on element by text "Next"
    And Wait for element by id "nlb-input-purpose" to appear

    Then Assert element by contains text "Own account Transfer"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "int_04" in txt file
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Scroll down until element with id "nlb-button-primary" is in view
    And Click on element by id "nlb-button-primary"

    And Try to assert that payment is "Check your data and try again. Insufficient funds " and send command to OTP method
    And Check if PIN is needed and complete payment for "Check your data and try again. Insufficient funds " with assert

    Examples:
      | rowindex |
      |        4 |

  @Payments_SEPA_Personal_Account_to_Retail_Account-EUR_[MOB_ANDROID]
  Scenario Outline: Payments_SEPA_Personal_Account_to_Retail_Account-EUR_[MOB_ANDROID]
    #This is also change balance test for sepa payments

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    And Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Remember available balance in currency "EUR" under key "IT_001_Debtor_Balance"
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-primary-balance" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "retail_recipient_iban" in element id "nlb-input-account-number"
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by id "nlb-input-recipient-name" to appear
    And Enter text from excel "<rowindex>" columnName "retail_recipient_name" in element id "nlb-input-recipient-name"
    And Enter text "TEST" in element id "nlb-input-recipient-address"
    And Enter text "TEST" in element id "nlb-input-recipient-city"
    And Swipe vertical
    And Swipe vertical
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Assert text "OTHR - Other" in element id "nlb-input-purpose-code"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "SP_001" in txt file
    And Assert element by text "NRC - No reference"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Swipe vertical

    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 EUR"
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert element by text "Debtor"
    And Assert that text "First and last name / Company name" has first following sibling that contains from Excel "<rowindex>" columnName "user_name_short"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_name"
    And Assert that second text "Address" has first following sibling that contains text "TEST"
    And Assert that second text "Address" has first following sibling that contains text "SLOVENIA"
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_iban"
    And Swipe vertical
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Assert element by text "Payment"
    And Assert that text "Reference" has first following sibling with text "NRC"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "SP_001"
    And Assert that text "Purpose code" has first following sibling with text "OTHR"
    And Assert that text "Payment date" has first following sibling with current date in format "d.M.yyyy"
    And Swipe vertical
    And Click on element by id "nlb-button-primary"

    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"
    And Wait "60" seconds
    And Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Check if current balance is lowered by "10" using balance from key "IT_001_Debtor_Balance" for currency "EUR"
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Click "Pay" content description from view tag "View"

    And Click on element by text "Past payments"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    And Scroll until element with text from txt file under key "SP_001" is in view and click
    And Wait for element by text "Recipient"


    Then Assert element by text "Payment details"
    And Assert element "nlb-date" by id has current date in format "d.M.yyyy"
    And Assert text under key "SP_001" from txt file in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "retail_recipient_name" in element by id "nlb-details"
    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_name_and_address_past_payment"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Assert that text "Reference" has first following sibling with text "NRC"
    And Assert that text "Purpose code" has first following sibling with text "OTHR"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_details"
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Scroll down until element with text "Executed" is in view
    #And Assert that text "Debtor address" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_payment_address"
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert that text "Payment status" has first following sibling with text "Executed"



    Examples:
      | rowindex |
      |        4 |


  @Payments_SEPA_Personal_Account_to_Corporate_Account-EUR_[MOB_ANDROID]
  Scenario Outline: Payments_SEPA_Personal_Account_to_Corporate_Account-EUR_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    And Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Remember available balance in currency "EUR" under key "IT_001_Debtor_Balance"
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-primary-balance" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "corporate_recipient_iban" in element id "nlb-input-account-number"
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by id "nlb-checkbox-update-recipient" to appear
    And Scroll down until element with id "nlb-button-primary" is in view
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Assert text "OTHR - Other" in element id "nlb-input-purpose-code"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "SP_003" in txt file
    And Click "Expand dropdown menu" content description from tag "ImageView"
    And Click on element by text "NRC - No reference"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 EUR"
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert element by text "Debtor"
    And Assert that text "First and last name / Company name" has first following sibling that contains from Excel "<rowindex>" columnName "user_name_short"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "corporate_recipient_name"
    #And Assert that second text "Address" has first following sibling that contains text "VEROVŠKOVA ULICA 62"
    And Assert that second text "Address" has first following sibling that contains text from Excel "<rowindex>" columnName "corporate_recipient_address"
    And Assert that second text "Address" has first following sibling that contains text "SLOVENIA"
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "corporate_recipient_iban"
    And Swipe vertical
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Assert element by text "Payment"
    And Assert that text "Reference" has first following sibling with text "NRC"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "SP_003"
    And Assert that text "Purpose code" has first following sibling with text "OTHR"
    And Assert that text "Payment date" has first following sibling with current date in format "d.M.yyyy"
    And Swipe vertical
    And Click on element by id "nlb-button-primary"

    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"
    And Wait "60" seconds
    And Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Check if current balance is lowered by "10" using balance from key "IT_001_Debtor_Balance" for currency "EUR"
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Click "Pay" content description from view tag "View"
    And Click on element by text "Past payments"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    And Scroll until element with text from txt file under key "SP_003" is in view and click
    And Wait for element by text "Recipient"


    Then Assert element by text "Payment details"
    And Assert element "nlb-date" by id has current date in format "d.M.yyyy"
    And Assert text under key "SP_003" from txt file in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "corporate_recipient_name" in element by id "nlb-details"
    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "corporate_recipient_name_and_address_past_payment"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "corporate_recipient_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Assert that text "Reference" has first following sibling with text "NRC"
    And Assert that text "Purpose code" has first following sibling with text "OTHR"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_details"
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Scroll down until element with text "Executed" is in view
    #And Assert that text "Debtor address" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_payment_address"
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert that text "Payment status" has first following sibling with text "Executed"



    Examples:
      | rowindex |
      |        4 |


  @SEPA_-Insufficient_funds[Android]
  Scenario Outline: SEPA_-Insufficient_funds[Android]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "corporate_recipient_iban" in element id "nlb-input-account-number"
    And Enter text "999999999" in element id "nlb-amount-with-currency-field"
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by id "nlb-checkbox-update-recipient" to appear
    And Swipe vertical
    And Swipe vertical
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "SP_003" in txt file
    And Click "Expand dropdown menu" content description from tag "ImageView"
    And Click on element by text "NRC - No reference"
    And Scroll down until element with id "nlb-button-primary" is in view
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Scroll down until element with id "nlb-button-primary" is in view
    And Click on element by id "nlb-button-primary"

    And Try to assert that payment is "Confirmation failed" and send command to OTP method
    And Check if PIN is needed and complete payment for "Confirmation failed" with assert



    Examples:
      | rowindex |
      |        4 |

  @Foreign_Payments_Payment_To_SI_Account-Foreign_Currency_Currency_Exists_On_The_Account
  Scenario Outline: Foreign_Payments_Payment_To_SI_Account-Foreign_Currency_Currency_Exists_On_The_Account

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    And Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Remember available balance in currency "EUR" under key "IT_001_Debtor_Balance_EUR"
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Remember available balance in currency "USD" under key "IT_001_Debtor_Balance_USD"
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-primary-balance" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer"
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "retail_recipient_iban" in element id "nlb-input-account-number"
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Click "Expand dropdown menu" content description from tag "ImageView"
    And Scroll down until currency "USD" in selector is found and click
    And Scroll down until element with id "nlb-button-primary" is in view
    And Click on element by text "Next"
    And Wait for element by text "Foreign payment"
    #Entering recipient info
    And Enter text "TESTNAME" in element id "nlb-input-recipient-name"
    And Enter text "TEST" in element id "nlb-input-recipient-address"
    And Enter text "TEST" in element id "nlb-input-recipient-city"
    #End of entering recipient info
    And Scroll down until element with id "nlb-input-bank-swift-code" is in view
    And Assert element by text "SWIFT (BIC) Code"
    And Assert text "LJBASI20XXX" in element id "nlb-input-bank-swift-code"
    And Scroll down until element with id "nlb-button-primary" is in view
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "USD"
    #And Assert that info message for currency conversion in second step of payment is of correct format
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "FP_001" in txt file
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 USD"
    And Assert that text "Debited amount" has first following sibling with text "10,00 USD"
    And Assert that text "Informative fee" has first following sibling with text "6,20 EUR"
    And Assert element by text "Debtor"
    And Assert that text "First and last name / Company name" has first following sibling that contains from Excel "<rowindex>" columnName "user_name_short"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_name"
    And Assert that second text "Address" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_full_address_payment_preview"
    And Scroll down until element with id "nlb-button-primary" is in view
    #And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Assert element by text "Payment"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "FP_001"
    And Assert that text "Payee of expenditure" has first following sibling with text "SHA"
    And Assert that text "Payment date" has first following sibling with current date in format "d.M.yyyy"
    And Assert that text "Urgent payment" has first following sibling with text "No"
    And Click on element by id "nlb-button-primary"
    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"
    And Wait "60" seconds
    And Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Check if current balance is lowered by "10" using balance from key "IT_001_Debtor_Balance_USD" for currency "USD"
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Check if current balance is lowered by "6.20" using balance from key "IT_001_Debtor_Balance_EUR" for currency "EUR"
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Click "Pay" content description from view tag "View"
    And Click on element by text "Past payments"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"
    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"
    And Scroll until element with text from txt file under key "FP_001" is in view and click
    And Wait for element by text "Recipient"

    Then Assert element by text "Payment details"
    And Assert element "nlb-date" by id has current date in format "d.M.yyyy"
    And Assert text under key "FP_001" from txt file in element id "nlb-title"
    And Assert text "USD" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "retail_recipient_name" in element by id "nlb-details"
    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_name_and_address_past_payment"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_iban"
    And Assert element by text "Creditor bank name" is not displayed
    And Assert element by text "Creditor bank address" is not displayed
    And Assert element by text "Additional creditor bank info" is not displayed
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Assert that text "Urgent payment" has first following sibling that contains text "No"
    And Scroll down until element with text "Executed" is in view
    And Assert that text "Payee of expenditure" has first following sibling that contains text "SHA"
    And Assert that text "Debit currency" has first following sibling that contains text "USD"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_details"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    #And Assert that text "Debtor address" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_payment_address"
    And Assert that text "Informative fee" has first following sibling with text "6,20 EUR"
    And Assert that text "Payment status" has first following sibling with text "Executed"


    Examples:
      | rowindex |
      |        4 |


  @Payments_Recipient_Save_New_Recipient_UPN_Account_Number_[MOB_ANDROID]
  Scenario Outline: Payments_Recipient_Save_New_Recipient_UPN_Account_Number_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "corporate_recipient_iban" in element id "nlb-input-account-number"
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by id "nlb-checkbox-update-recipient" to appear
    And Click on element by text "Save recipient"
    And Scroll down until element with id "nlb-button-primary" is in view
    And Assert currency in second payment screen is "EUR"
    And Assert text "OTHR - Other" in element id "nlb-input-purpose-code"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "SP_003" in txt file

    And Click "Expand dropdown menu" content description from tag "ImageView"
    And Click on element by text "NRC - No reference"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Scroll down until element with id "nlb-button-primary" is in view
    And Click on element by id "nlb-button-primary"

    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"
    And Wait for element by text "Recipients"

    Then Click on element by text "Recipients"
    And Wait for element by id "nlb_search_text_field" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "corporate_recipient_iban" is in view
    And Assert saved contact has short "EL" and name from Excel "<rowindex>" columnName "corporate_recipient_name" and iban from Excel "<rowindex>" columnName "corporate_recipient_iban"
    And Click on element by text from excel "<rowindex>" columnName "corporate_recipient_iban"
    And Assert element by text "Recipient details"
    And Assert element by text "Address"
    And Assert that text "Address" has first following sibling that contains from Excel "<rowindex>" columnName "corporate_recipient_address"
    And Assert that text "Address" has first following sibling that contains from Excel "<rowindex>" columnName "corporate_recipient_city"
    And Assert that text "Address" has first following sibling that contains from Excel "<rowindex>" columnName "corporate_recipient_country"
    And Assert element by text "SWIFT (BIC) Code"
    And Assert that text "SWIFT (BIC) Code" has first following sibling that contains text "LJBASI20XXX"
    And Click on element by text "Delete "
    And Wait for element by text "Delete recipient"
    And Click on element by text "Delete"


    Examples:
      | rowindex |
      |        4 |

  @Payments_Recipient_Save_New_Recipient_Foreign_Payment_EGP_[MOB_ANDROID]
  Scenario Outline: Payments_Recipient_Save_New_Recipient_Foreign_Payment_EGP_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer"
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "bosnia_iban" in element id "nlb-input-account-number"
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    #And Click "Expand dropdown menu" content description from tag "ImageView"
    #And Scroll down until currency "USD" in selector is found and click
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by id "nlb-input-recipient-name" to appear
    And Assert element by text "Foreign payment"
    #Entering recipient info
    And Enter text from excel "<rowindex>" columnName "bosnia_name" in element id "nlb-input-recipient-name"
    And Enter text "TEST" in element id "nlb-input-recipient-address"
    And Enter text "TEST" in element id "nlb-input-recipient-city"
    #End of entering recipient info
    #Enter Recipient country
    And Scroll down until element with id "nlb-input-recipient-country-click-area" is in view
    And Click on element by id "nlb-input-recipient-country-click-area"
    And Wait for element by text "AFGHANISTAN" to appear for "60" seconds
    And Enter text "BOSNIA AND HERZEGOVINA" into search field for country selection
    And Click second element with text "BOSNIA AND HERZEGOVINA"
    #End of entering recipient country
    And Wait for element by id "nlb-input-recipient-address" to appear
    And Swipe vertical
    #Enter bank info
    And Enter text "TEST" in element id "nlb-input-bank-name"
    And Enter text "TEST" in element id "nlb-input-bank-address"
    And Enter text "TEST" in element id "nlb-input-bank-city"
    And Click on element by id "nlb-input-bank-country-click-area"
    And Wait for element by text "AFGHANISTAN" to appear for "60" seconds
    And Enter text "BOSNIA AND HERZEGOVINA" into search field for country selection
    And Click second element with text "BOSNIA AND HERZEGOVINA"
    And Enter text "TEST" in element id "nlb-input-bank-additional-info"
    And Scroll down until element with text "Save recipient" is in view
    And Assert text "RAZBBA22" in element id "nlb-input-bank-swift-code"
    #End of enter bank info
    And Swipe vertical
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "FP_005" in txt file
    And Scroll until element with text "Save recipient" is in view
    And Swipe vertical short
    And Click on element by text "Save recipient"
    And Swipe vertical
    And Assert element by text "SHA - Costs are shared between creditor and debtor"
    #And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount"
    And Assert element by text "Payment review"
    And Swipe vertical
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"

    And Wait for element by text "Recipients"

    Then Click on element by text "Recipients"
    And Wait for element by id "nlb_search_text_field" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "bosnia_iban" is in view
    And Assert saved contact has short "B" and name from Excel "<rowindex>" columnName "bosnia_name" and iban from Excel "<rowindex>" columnName "bosnia_iban"
    And Click on element by text from excel "<rowindex>" columnName "bosnia_iban"
    And Assert element by text "Recipient details"
    And Assert element by text "Address"
    And Assert that text "Address" has first following sibling that contains text "TEST"
    And Assert that text "Address" has first following sibling that contains text "BOSNIA AND HERZEGOVINA"
    And Assert that text "Bank name" has first following sibling that contains text "TEST"
    And Assert that text "Bank address" has first following sibling that contains text "TEST"
    And Assert that text "Bank address" has first following sibling that contains text "BOSNIA AND HERZEGOVINA"
    And Assert element by text "SWIFT (BIC) Code"
    And Assert that text "SWIFT (BIC) Code" has first following sibling that contains text "RAZBBA22"
    And Click on element by text "Delete "
    And Wait for element by text "Delete recipient"
    And Click on element by text "Delete"

    Examples:
      | rowindex |
      |        4 |