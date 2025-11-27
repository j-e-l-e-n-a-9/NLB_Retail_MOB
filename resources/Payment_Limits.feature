Feature: Payment_Limits

  @Instant_Payments_Limit-Set_Daily_Limit_[Android]
  Scenario Outline: Instant_Payments_Limit-Set_Daily_Limit_[Android]
    #C99737,C99739

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click on element by text "Details"
    And Wait for element by id "nlb-product-details-overdraft" to appear
    And Scroll down until element with text "Transaction limit" is in view
    And Assert element by text "Payment limit amount"
    And Click on info button for Payment limit amount
    And Wait for element by text "Close"
    And Assert element by text "Payment limit amount"
    And Assert element by contains text "Payment amount limit is set per account for all digital channels where SEPA credit transfers are executed (NLB Klik, Flik payments and third party providers apps)."
    And Assert element by contains text "The payment limit restricts payments for all account users, but it does not affect own account transfers."
    And Click on element by text "Close"
    And Assert element by text "Daily limit"
    And Assert text "no limit" in element id "nlb-product-details-daily-limit"
    And Assert element by text "Limit per transaction"
    And Assert text "no limit" in element id "nlb-product-details-transaction-limit"
    And Click on element by id "nlb-button-text" with descendant text "Daily limit"
    And Wait for element by text "Set limit"

    Then Assert element by text "Set daily limit"
    And Assert element by text "The daily limit determines the amount you can spend for payments per day."
    And Assert element by text "Daily limit"
    And Assert no limit is placeholder in set daily limit screen
    And Assert element by text "EUR"
    And Enter text "5000" in element id "nlb-amount-with-currency-field"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Enter PIN"
    And Enter PIN
    And Wait for element by text "Set payment limit per account"
    And Assert element by text "Set payment limit per account"
    And Assert element by text "Account:"
    And Assert element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Assert element by text "Limit type:"
    And Assert element by text "Daily limit"
    And Assert element by text "Limit amount:"
    #And Assert element by text "5.000,00 EUR"
    And Assert element by text "Confirm only requests initiated by you. If request was not initiated by you, select Reject."
    And Click on element by id "nlb-button-primary"
    And Assert element by text "Success"
    And Assert text "5000,00 EUR" in element id "nlb-product-details-daily-limit"
    And Click on element by id "nlb-button-text" with descendant text "Daily limit"
    And Wait for element by text "Set limit"
    And Enter text "" in element id "nlb-amount-with-currency-field"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Enter PIN"
    And Enter PIN
    And Wait for element by text "Set payment limit per account"
    And Click on element by id "nlb-button-primary"
    And Assert element by text "Success"
    And Assert text "no limit" in element id "nlb-product-details-daily-limit"


    Examples:
      | rowindex |
      |        4 |

  @Instant_Payments_Limit-Set_Limit_per_Transaction_[Android]
  Scenario Outline: Instant_Payments_Limit-Set_Limit_per_Transaction_[Android]
    #C99738,C99740

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click on element by text "Details"
    And Wait for element by id "nlb-product-details-overdraft" to appear
    And Scroll down until element with text "Transaction limit" is in view
    And Assert element by text "Payment limit amount"
    And Click on info button for Payment limit amount
    And Wait for element by text "Close"
    And Assert element by text "Payment limit amount"
    And Assert element by contains text "Payment amount limit is set per account for all digital channels where SEPA credit transfers are executed (NLB Klik, Flik payments and third party providers apps)."
    And Assert element by contains text "The payment limit restricts payments for all account users, but it does not affect own account transfers."
    And Click on element by text "Close"
    And Assert element by text "Daily limit"
    And Assert text "no limit" in element id "nlb-product-details-daily-limit"
    And Assert element by text "Limit per transaction"
    And Assert text "no limit" in element id "nlb-product-details-transaction-limit"
    And Click on element by id "nlb-button-text" with descendant text "Transaction limit"
    And Wait for element by text "Set transaction limit"

    Then Assert element by text "Set transaction limit"
    And Assert element by text "Limit per transaction determines the max amount per one initiated payment."
    And Assert element by text "Limit per transaction"
    And Assert no limit is placeholder in set daily limit screen
    And Assert element by text "EUR"
    And Enter text "5000" in element id "nlb-amount-with-currency-field"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Enter PIN"
    And Enter PIN
    And Wait for element by text "Set payment limit per account"
    And Assert element by text "Set payment limit per account"
    And Assert element by text "Account:"
    And Assert element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Assert element by text "Limit type:"
    And Assert element by text "Limit per transaction"
    And Assert element by text "Limit amount:"
    And Assert element by text "5000,00 EUR"
    And Assert element by text "Confirm only requests initiated by you. If request was not initiated by you, select Reject."
    And Click on element by id "nlb-button-primary"
    And Assert element by text "Success"
    And Assert text "5000,00 EUR" in element id "nlb-product-details-transaction-limit"
    And Click on element by id "nlb-button-text" with descendant text "Transaction limit"
    And Wait for element by text "Set transaction limit"
    And Enter text "" in element id "nlb-amount-with-currency-field"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Enter PIN"
    And Enter PIN
    And Wait for element by text "Set payment limit per account"
    And Click on element by id "nlb-button-primary"
    And Assert element by text "Success"
    And Assert text "no limit" in element id "nlb-product-details-transaction-limit"


    Examples:
      | rowindex |
      |        4 |

  @Instant_Payments_Limit_Exceed_Limit_Current_Payment_Date_[Android]_Invalid_Daily_Limit
  Scenario Outline: Instant_Payments_Limit_Exceed_Limit_Current_Payment_Date_[Android]_Invalid_Daily_Limit
    #C99743

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click on element by text "Details"
    And Wait for element by id "nlb-product-details-overdraft" to appear
    And Scroll down until element with text "Transaction limit" is in view
    And Assert element by text "Payment limit amount"
    And Click on element by id "nlb-button-text" with descendant text "Daily limit"
    And Wait for element by text "Set limit"
    And Enter text "5000" in element id "nlb-amount-with-currency-field"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Enter PIN"
    And Enter PIN
    And Wait for element by text "Set payment limit per account"
    And Click on element by id "nlb-button-primary"
    And Assert element by text "Success"
    And Assert text "5000,00 EUR" in element id "nlb-product-details-daily-limit"
    And Go Back
    And Wait for element by id "nlb-title" to appear
    And Go Back
    And Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    #And Click on element by text "Pay or transfer"
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "retail_recipient_iban" in element id "nlb-input-account-number"
    And Enter text "6000" in element id "nlb-amount-with-currency-field"
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by id "nlb-input-recipient-name" to appear
    And Enter text from excel "<rowindex>" columnName "retail_recipient_name" in element id "nlb-input-recipient-name"
    And Enter text "TEST" in element id "nlb-input-recipient-address"
    And Enter text "TEST" in element id "nlb-input-recipient-city"
    And Swipe vertical
    And Swipe vertical
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "SP_001" in txt file
    And Swipe vertical
    And Click on element by id "nlb-button-primary"

    Then Assert element by text "Payment limit exceeded"
    And Assert element by text "Payment not possible, exceeded daily transaction limit. You can change it inside your payment settings. "
    And Click on element by text "Cancel"
    And Assert element by text "NRC - No reference"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Change payment limit"
    And Click on element by text "Change payment limit"
    And Wait for element by id "nlb-product-details-overdraft" to appear
    And Scroll down until element with text "Transaction limit" is in view
    And Assert element by text "Payment limit amount"
    And Click on element by id "nlb-button-text" with descendant text "Daily limit"
    And Wait for element by text "Set limit"
    And Enter text "" in element id "nlb-amount-with-currency-field"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Enter PIN"
    And Enter PIN
    And Wait for element by text "Set payment limit per account"
    And Click on element by id "nlb-button-primary"
    And Assert element by text "Success"
    And Assert text "no limit" in element id "nlb-product-details-daily-limit"


    Examples:
      | rowindex |
      |        4 |

  @Instant_Payments_Limit_Exceed_Limit_Current_Payment_Date_[Android]_Invalid_Daily_Limit_Second_Account
  Scenario Outline: Instant_Payments_Limit_Exceed_Limit_Current_Payment_Date_[Android]_Invalid_Daily_Limit_Second_Account
    #C99743
    #BUG Redirected to first account instead of selected second account

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Click on element by text from excel "<rowindex>" columnName "second_personal_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click on element by text "Details"
    And Wait for element by id "nlb-product-details-overdraft" to appear
    And Scroll down until element with text "Transaction limit" is in view
    And Assert element by text "Payment limit amount"
    And Click on element by id "nlb-button-text" with descendant text "Daily limit"
    And Wait for element by text "Set limit"
    And Enter text "5000" in element id "nlb-amount-with-currency-field"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Enter PIN"
    And Enter PIN
    And Wait for element by text "Set payment limit per account"
    And Click on element by id "nlb-button-primary"
    And Assert element by text "Success"
    And Assert text "5000,00 EUR" in element id "nlb-product-details-daily-limit"
    And Go Back
    And Wait for element by id "nlb-title" to appear
    And Go Back
    And Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    #And Click on element by text "Pay or transfer"
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "retail_recipient_iban" in element id "nlb-input-account-number"
    And Enter text "6000" in element id "nlb-amount-with-currency-field"
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by id "nlb-input-recipient-name" to appear
    And Select account from Excel "<rowindex>" columnName "second_personal_account_iban" as debtor in payment screen
    And Enter text from excel "<rowindex>" columnName "retail_recipient_name" in element id "nlb-input-recipient-name"
    And Enter text "TEST" in element id "nlb-input-recipient-address"
    And Enter text "TEST" in element id "nlb-input-recipient-city"
    And Swipe vertical
    And Swipe vertical
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "SP_001" in txt file
    And Swipe vertical
    And Click on element by id "nlb-button-primary"

    Then Assert element by text "Payment limit exceeded"
    And Assert element by text "Payment not possible, exceeded daily transaction limit. You can change it inside your payment settings. "
    And Click on element by text "Cancel"
    And Assert element by text "NRC - No reference"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Change payment limit"
    And Click on element by text "Change payment limit"
    And Wait for element by id "nlb-product-details-overdraft" to appear
    And Scroll down until element with text "Transaction limit" is in view
    And Assert element by text "Payment limit amount"
    And Assert text "5000,00 EUR" in element id "nlb-product-details-daily-limit"
    And Click on element by id "nlb-button-text" with descendant text "Daily limit"
    And Wait for element by text "Set limit"
    And Enter text "" in element id "nlb-amount-with-currency-field"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Enter PIN"
    And Enter PIN
    And Wait for element by text "Set payment limit per account"
    And Click on element by id "nlb-button-primary"
    And Assert element by text "Success"
    And Assert text "no limit" in element id "nlb-product-details-daily-limit"


    Examples:
      | rowindex |
      |        4 |

  @Instant_Payments_Limit_Exceed_Limit_Current_Payment_Date_[Android]_Invalid_Transaction_Limit
  Scenario Outline: Instant_Payments_Limit_Exceed_Limit_Current_Payment_Date_[Android]_Invalid_Transaction_Limit
    #C99743

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click on element by text "Details"
    And Wait for element by id "nlb-product-details-overdraft" to appear
    And Scroll down until element with text "Transaction limit" is in view
    And Assert element by text "Payment limit amount"
    And Click on element by id "nlb-button-text" with descendant text "Transaction limit"
    And Wait for element by text "Set transaction limit"
    And Enter text "5000" in element id "nlb-amount-with-currency-field"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Enter PIN"
    And Enter PIN
    And Wait for element by text "Set payment limit per account"
    And Click on element by id "nlb-button-primary"
    And Assert element by text "Success"
    And Assert text "5.000,00 EUR" in element id "nlb-product-details-transaction-limit"
    And Go Back
    And Wait for element by id "nlb-title" to appear
    And Go Back
    And Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "retail_recipient_iban" in element id "nlb-input-account-number"
    And Enter text "6000" in element id "nlb-amount-with-currency-field"
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by id "nlb-input-recipient-name" to appear
    And Enter text from excel "<rowindex>" columnName "retail_recipient_name" in element id "nlb-input-recipient-name"
    And Enter text "TEST" in element id "nlb-input-recipient-address"
    And Enter text "TEST" in element id "nlb-input-recipient-city"
    And Swipe vertical
    And Swipe vertical
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "SP_001" in txt file
    And Swipe vertical
    And Click on element by id "nlb-button-primary"

    Then Assert element by text "Payment limit exceeded"
    And Assert element by text "Payment not possible, exceeded transaction limit. You can change it inside your payment settings. "
    And Click on element by text "Cancel"
    And Assert element by text "NRC - No reference"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Change payment limit"
    And Click on element by text "Change payment limit"
    And Wait for element by id "nlb-product-details-overdraft" to appear
    And Scroll down until element with text "Transaction limit" is in view
    And Assert element by text "Payment limit amount"
    And Click on element by id "nlb-button-text" with descendant text "Transaction limit"
    And Wait for element by text "Set transaction limit"
    And Enter text "" in element id "nlb-amount-with-currency-field"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Enter PIN"
    And Enter PIN
    And Wait for element by text "Set payment limit per account"
    And Click on element by id "nlb-button-primary"
    And Assert element by text "Success"
    And Assert text "no limit" in element id "nlb-product-details-transaction-limit"


    Examples:
      | rowindex |
      |        4 |

  @Instant_Payments_Limit_Exceed_Limit_Current_Payment_Date_[Android]_Invalid_Transaction_Limit_Second_Account
  Scenario Outline: Instant_Payments_Limit_Exceed_Limit_Current_Payment_Date_[Android]_Invalid_Transaction_Limit_Second_Account
    #C99743
    #BUG Redirected to first account instead of selected second account

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Click on element by text from excel "<rowindex>" columnName "second_personal_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click on element by text "Details"
    And Wait for element by id "nlb-product-details-overdraft" to appear
    And Scroll down until element with text "Transaction limit" is in view
    And Assert element by text "Payment limit amount"
    And Click on element by id "nlb-button-text" with descendant text "Transaction limit"
    And Wait for element by text "Set transaction limit"
    And Enter text "5000" in element id "nlb-amount-with-currency-field"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Enter PIN"
    And Enter PIN
    And Wait for element by text "Set payment limit per account"
    And Click on element by id "nlb-button-primary"
    And Assert element by text "Success"
    And Assert text "5.000,00 EUR" in element id "nlb-product-details-transaction-limit"
    And Go Back
    And Wait for element by id "nlb-title" to appear
    And Go Back
    And Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "retail_recipient_iban" in element id "nlb-input-account-number"
    And Enter text "6000" in element id "nlb-amount-with-currency-field"
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by id "nlb-input-recipient-name" to appear
    And Select account from Excel "<rowindex>" columnName "second_personal_account_iban" as debtor in payment screen
    And Enter text from excel "<rowindex>" columnName "retail_recipient_name" in element id "nlb-input-recipient-name"
    And Enter text "TEST" in element id "nlb-input-recipient-address"
    And Enter text "TEST" in element id "nlb-input-recipient-city"
    And Swipe vertical
    And Swipe vertical
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "SP_001" in txt file
    And Swipe vertical
    And Click on element by id "nlb-button-primary"

    Then Assert element by text "Payment limit exceeded"
    And Assert element by text "Payment not possible, exceeded transaction limit. You can change it inside your payment settings. "
    And Click on element by text "Cancel"
    And Assert element by text "NRC - No reference"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Change payment limit"
    And Click on element by text "Change payment limit"
    And Wait for element by id "nlb-product-details-overdraft" to appear
    And Scroll down until element with text "Transaction limit" is in view
    And Assert element by text "Payment limit amount"
    And Assert text "5.000,00 EUR" in element id "nlb-product-details-transaction-limit"
    And Click on element by id "nlb-button-text" with descendant text "Transaction limit"
    And Wait for element by text "Set transaction limit"
    And Enter text "" in element id "nlb-amount-with-currency-field"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Enter PIN"
    And Enter PIN
    And Wait for element by text "Set payment limit per account"
    And Click on element by id "nlb-button-primary"
    And Assert element by text "Success"
    And Assert text "no limit" in element id "nlb-product-details-transaction-limit"


    Examples:
      | rowindex |
      |        4 |


  @Instant_Payments_Limit_Transaction_Limit_Above_Daily_[Android]_Invalid
  Scenario Outline: Instant_Payments_Limit_Transaction_Limit_Above_Daily_[Android]_Invalid
    #C99741

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click on element by text "Details"
    And Wait for element by id "nlb-product-details-overdraft" to appear
    And Scroll down until element with text "Transaction limit" is in view
    And Assert element by text "Payment limit amount"
    And Click on element by id "nlb-button-text" with descendant text "Daily limit"
    And Wait for element by text "Set limit"
    And Assert element by text "Set daily limit"
    And Enter text "5000" in element id "nlb-amount-with-currency-field"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Enter PIN"
    And Enter PIN
    And Wait for element by text "Set payment limit per account"
    And Click on element by id "nlb-button-primary"
    And Assert element by text "Success"
    And Assert text "5000,00 EUR" in element id "nlb-product-details-daily-limit"
    And Click on element by id "nlb-button-text" with descendant text "Transaction limit"
    And Wait for element by text "Limit per transaction"
    And Enter text "6000" in element id "nlb-amount-with-currency-field"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Enter PIN"
    And Enter PIN
    And Wait for element by text "Set payment limit per account"
    And Click on element by id "nlb-button-primary"

    Then Assert element by text "Check your data and try again. Limit na transakcijo mora biti manjši oz. enak nastavljenemu dnevnemu limitu. "
    And Click on element by text "OK"
    And Wait for element by text "Daily limit"
    And Click on element by id "nlb-button-text" with descendant text "Daily limit"
    And Wait for element by text "Set limit"
    And Assert element by text "Set daily limit"
    And Enter text "" in element id "nlb-amount-with-currency-field"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Enter PIN"
    And Enter PIN
    And Wait for element by text "Set payment limit per account"
    And Click on element by id "nlb-button-primary"
    And Assert element by text "Success"


    Examples:
      | rowindex |
      |        4 |

  @Instant_Payments_Limit_Daily_Limit_Below_Transaction_[Android]_Invalid
  Scenario Outline: Instant_Payments_Limit_Daily_Limit_Below_Transaction_[Android]_Invalid
    #C99742

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click on element by text "Details"
    And Wait for element by id "nlb-product-details-overdraft" to appear
    And Scroll down until element with text "Transaction limit" is in view
    And Assert element by text "Payment limit amount"
    And Click on element by id "nlb-button-text" with descendant text "Transaction limit"
    And Wait for element by text "Set limit"
    And Assert element by text "Set transaction limit"
    And Enter text "6000" in element id "nlb-amount-with-currency-field"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Enter PIN"
    And Enter PIN
    And Wait for element by text "Set payment limit per account"
    And Click on element by id "nlb-button-primary"
    And Assert element by text "Success"
    And Assert text "6000,00 EUR" in element id "nlb-product-details-transaction-limit"
    And Click on element by id "nlb-button-text" with descendant text "Daily limit"
    And Wait for element by text "Set daily limit"
    And Enter text "5000" in element id "nlb-amount-with-currency-field"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Enter PIN"
    And Enter PIN
    And Wait for element by text "Set payment limit per account"
    And Click on element by id "nlb-button-primary"

    Then Assert element by text "Check your data and try again. Limit na transakcijo mora biti manjši oz. enak nastavljenemu dnevnemu limitu. "
    And Click on element by text "OK"
    And Wait for element by text "Daily limit"
    And Click on element by id "nlb-button-text" with descendant text "Transaction limit"
    And Wait for element by text "Set limit"
    And Assert element by text "Set transaction limit"
    And Enter text "" in element id "nlb-amount-with-currency-field"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Enter PIN"
    And Enter PIN
    And Wait for element by text "Set payment limit per account"
    And Click on element by id "nlb-button-primary"
    And Assert element by text "Success"



    Examples:
      | rowindex |
      |        4 |

  @Instant_Payments_Limit_Daily_Limit_Invalid_[Android]
  Scenario Outline: Instant_Payments_Limit_Daily_Limit_Invalid_[Android]
    #C99746

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click on element by text "Details"
    And Wait for element by id "nlb-product-details-overdraft" to appear
    And Scroll down until element with text "Transaction limit" is in view
    And Assert element by text "Payment limit amount"
    And Click on element by id "nlb-button-text" with descendant text "Daily limit"
    And Wait for element by text "Set limit"
    And Assert element by text "Set daily limit"

    Then Enter text "0.00" in element id "nlb-amount-with-currency-field"
    And Assert element by text "Minimum amount is 0,01 EUR"
    And Enter text "0.01" in element id "nlb-amount-with-currency-field"
    And Assert text "Minimum amount is 0,01 EUR" is not displayed
    And Enter text "99999999999" in element id "nlb-amount-with-currency-field"
    And Assert element by text "Maximum amount is 999.999.999,99 EUR."
    And Enter text "999999999" in element id "nlb-amount-with-currency-field"
    And Assert text "Maximum amount is 999.999.999,99 EUR." is not displayed

    Examples:
      | rowindex |
      |        4 |

  @Instant_Payments_Limit_Transaction_Limit_Invalid_[Android]
  Scenario Outline: Instant_Payments_Limit_Transaction_Limit_Invalid_[Android]
    #C99747

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click on element by text "Details"
    And Wait for element by id "nlb-product-details-overdraft" to appear
    And Scroll down until element with text "Transaction limit" is in view
    And Assert element by text "Payment limit amount"
    And Click on element by id "nlb-button-text" with descendant text "Transaction limit"
    And Wait for element by text "Set limit"
    And Assert element by text "Set transaction limit"

    Then Enter text "0.00" in element id "nlb-amount-with-currency-field"
    And Assert element by text "Minimum amount is 0,01 EUR"
    And Enter text "0.01" in element id "nlb-amount-with-currency-field"
    And Assert text "Minimum amount is 0,01 EUR" is not displayed
    And Enter text "99999999999" in element id "nlb-amount-with-currency-field"
    And Assert element by text "Maximum amount is 999.999.999,99 EUR."
    And Enter text "999999999" in element id "nlb-amount-with-currency-field"
    And Assert text "Maximum amount is 999.999.999,99 EUR." is not displayed

    Examples:
      | rowindex |
      |        4 |