Feature: Currency_Exchange

  @Payments_Currency_Exchange_Pricelist_[MOB_ANDROID]-Overview
  Scenario Outline: Payments_Currency_Exchange_Pricelist_[MOB_ANDROID]-Overview

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click on element by text "Pay"
    And Wait for element by text "Domestic payment"
    And Click on element by text "Currency exchange"
    And Wait for element by text "From"
    And Assert "From" container in Currency exchange is displayed
    And Assert "To" container in Currency exchange is displayed
    And Swipe vertical
    And Assert element by contains text "Value date:"
    And Assert element by text "Amount"
    And Assert element "nlb-amount-with-currency-flag-field" by id
    And Assert element by id "nlb-amount-with-currency-flag-field-currency-alpha3" with regex "^[A-Z]{3}$"
    And Assert element by id "nlb-link-button-currency-exchange-discounted-pricelist" has text "Discounted exchange rates"
    And Assert element by id "nlb-link-button-currency-exchange-general-pricelist" has text "General exchange rates"
    And Assert element by id "nlb-button-primary" that has descendant text "Next"
    And Assert element by text "Next" is not clickable
    And Click on element by id "nlb-link-button-currency-exchange-general-pricelist"
    And Wait for element by id "nlb-card-container" to appear

    Then Assert Currency exchange date has current date in format "dd.MM.yyyy"
    And Assert "1 AUD" text from view tag "TextView" is displayed
    And Assert "Australia" text from view tag "TextView" is displayed
    And Assert "1 BAM" text from view tag "TextView" is displayed
    And Assert "Bosnia and Herzegovina" text from view tag "TextView" is displayed
    And Assert "1 CAD" text from view tag "TextView" is displayed
    And Assert "Canada" text from view tag "TextView" is displayed
    And Assert "1 CHF" text from view tag "TextView" is displayed
    And Assert "Switzerland" text from view tag "TextView" is displayed
    And Assert "1 CNY" text from view tag "TextView" is displayed
    And Assert "China" text from view tag "TextView" is displayed
    And Assert "1 DKK" text from view tag "TextView" is displayed
    And Assert "Denmark" text from view tag "TextView" is displayed
    And Assert "1 EUR" text from view tag "TextView" is displayed
    And Assert "European Union" text from view tag "TextView" is displayed
    And Swipe vertical
    And Assert "1 GBP" text from view tag "TextView" is displayed
    And Assert "United Kingdom" text from view tag "TextView" is displayed
    And Assert "100 JPY" text from view tag "TextView" is displayed
    And Assert "Japan" text from view tag "TextView" is displayed
    And Assert "1 NOK" text from view tag "TextView" is displayed
    And Assert "Norway" text from view tag "TextView" is displayed
    And Assert "1 RUB" text from view tag "TextView" is displayed
    And Assert "Russia" text from view tag "TextView" is displayed
    And Assert "1 SEK" text from view tag "TextView" is displayed
    And Assert "Sweden" text from view tag "TextView" is displayed
    And Assert "1 USD" text from view tag "TextView" is displayed
    And Assert "United States" text from view tag "TextView" is displayed
    And Click "Back" content description from view tag "View"
    And Wait for element by text "To"
    And Assert element by id "nlb-link-button-currency-exchange-discounted-pricelist" has text "Discounted exchange rates"
    And Assert element by id "nlb-link-button-currency-exchange-general-pricelist" has text "General exchange rates"

    Examples:
      | rowindex |
      |        4 |


  @Payments_Currency_Exchange_[MOB_ANDROID]-Buy_From_Payment
  Scenario Outline: Payments_Currency_Exchange_[MOB_ANDROID]-Buy_From_Payment

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    And Click on element by text "My Products"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "currentDomesticAccountBBAN" is in view
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Remember available balance in currency "RSD" under key "IT_001_Debtor_Balance"
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Remember available balance in currency "EUR" under key "IT_001_Creditor_Balance"
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-primary-balance" to appear

    When Click on element by text "Pay"
    And Wait for element by text "Internal transfer" to appear for "30" seconds
    And Click on element by text "Currency exchange"
    And Wait for element by text "From"
    And Click "From" account selector in Currency exchange
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Wait for element by text "From"
    And Click "To" account selector in Currency exchange
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by text "From"
    And Assert "Next" button primary is disabled
    And Click on element by text "Discounted exchange rates"
    And Wait for element by text "Sell"
    And Remember text of first following sibling of element by text "Sell" in txt under key "keySell"

    And Click "Back" content description
    And Wait for element by text "From"
    And Enter text "2" in element id "nlb-amount-with-currency-flag-field" and remember it under key "keyAmount"
    And Assert "Next" button primary is enabled
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-button-text" to appear

    And Assert element by text "Currency exchange review"
    And Assert that text "Exchange" has first following sibling that matches regex "^(?:0|[1-9]\d{0,2}(?:\.\d{3})*),\d{2}\s*RSD$"
    And Assert "Exchange" has a value under the key "keySell" when multiplied by the value under the key "keyAmount"
    And Assert that text "To" has first following sibling that matches regex "^(?:0|[1-9]\d{0,2}(?:\.\d{3})*),\d{2}\s*EUR$"
    And Assert that text "To" has first following sibling that contains text from key "keyAmount" with no spaces
    And Remember "Exchange" value in Currency exchange review screen under key "exchangeValueKey"
#    And Assert that text "From account" has first following sibling from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
#    And Assert that text "To account" has first following sibling from excel "<rowindex>" columnName "personal_account_iban"
    And Assert Exchange rate label is displayed for amount under key "keyAmount"
    And Assert element by contains text "Exchange rate for" has first following sibling with regex "^(?:0|[1-9]\d{0,2}(?:\.\d{3})*),\d{4}$"
    And Assert element by contains text "Exchange rate for" has first following sibling with text from key "keySell"
    And Assert element by text "Value date"
    And Assert Value date is todays date and in valid date format
    And Assert that text "Fee" has first following sibling that contains text "0,00 RSD"
    And Assert element by text "Cancel"
    And Assert element by text "Exchange"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Enter PIN"
    And Enter PIN
    And Wait for element by text "Reject"
    And Assert element by text "Exchange:" has first following sibling from key "exchangeValueKey"
    And Assert that text "To:" has first following sibling that contains text from key "keyAmount" with no spaces
#    And Assert that text "From account:" has first following sibling from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
#    And Assert that text "To account:" has first following sibling from excel "<rowindex>" columnName "personal_account_iban"
#    And Assert Exchange rate label is displayed for amount under key "keyAmount"
    And Assert element by contains text "Exchange rate for" has first following sibling with regex "^(?:0|[1-9]\d{0,2}(?:\.\d{3})*),\d{4}$"
    And Assert that text "Value date:" has first following sibling that matches regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert that text "Fee:" has first following sibling that contains text "0,00 RSD"
    And Assert element "nlb-button-alternate" by id
    And Assert element "nlb-button-primary" by id
    And Click on element by id "nlb-button-primary"

    And Wait for element by id "transactions-web-close-popup-icon" to appear
    And Assert element by text "Confirmation successful"
    And Assert element by contains text "Your payment was successfully accepted"
    And Click on element by id "transactions-web-close-popup-nlb-button"
    And Click on element by text "My Products"
    And Wait for element by id "nlb-value-product-primary-balance" to appear

    Then Scroll until element with text from excel "<rowindex>" columnName "currentDomesticAccountBBAN" is in view
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Check if current balance is lowered by value from key "exchangeValueKey" using balance from key "IT_001_Debtor_Balance" for currency "RSD"
    And Click "Back" content description
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Check if current balance is increased by "2" using balance from key "IT_001_Creditor_Balance" for currency "EUR"


    Examples:
      | rowindex |
      |        5 |


  @Payments_Currency_Exchange_[MOB_ANDROID]-Sell_From_Payment
  Scenario Outline: Payments_Currency_Exchange_[MOB_ANDROID]-Sell_From_Payment

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    And Click on element by text "My Products"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "currentDomesticAccountBBAN" is in view
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Remember available balance in currency "RSD" under key "IT_001_Creditor_Balance"
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Remember available balance in currency "EUR" under key "IT_001_Debtor_Balance"
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-primary-balance" to appear

    When Click on element by text "Pay"
    And Wait for element by text "Internal transfer" to appear for "30" seconds
    And Click on element by text "Currency exchange"
    And Wait for element by text "From"
    And Click "From" account selector in Currency exchange
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by text "From"
    And Click "To" account selector in Currency exchange
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Wait for element by text "From"
    And Assert "Next" button primary is disabled
    And Click on element by text "Discounted exchange rates"
    And Wait for element by text "Bundle"
    And Remember text of first following sibling of element by text "Buy" in txt under key "keyBuy"
    And Click "Back" content description
    And Wait for element by text "From"
    And Enter text "3" in element id "nlb-amount-with-currency-flag-field" and remember it under key "keyAmount"
    And Assert "Next" button primary is enabled
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-button-text" to appear

    And Assert element by text "Currency exchange review"
    And Assert that text "Exchange" has first following sibling that matches regex "^(?:0|[1-9]\d{0,2}(?:\.\d{3})*),\d{2}\s*EUR$"
    And Assert "To" has a value under the key "keyBuy" when multiplied by the value under the key "keyAmount"
    And Assert that text "To" has first following sibling that matches regex "^(?:0|[1-9]\d{0,2}(?:\.\d{3})*),\d{2}\s*RSD$"
    And Assert that text "Exchange" has first following sibling that contains text from key "keyAmount" with no spaces
    And Remember "To" value in Currency exchange review screen under key "exchangeValueKey"
#    And Assert that text "From account" has first following sibling from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
#    And Assert that text "To account" has first following sibling from excel "<rowindex>" columnName "personal_account_iban"
    And Assert Exchange rate label is displayed for amount under key "keyAmount"
    And Assert element by contains text "Exchange rate for" has first following sibling with regex "^(?:0|[1-9]\d{0,2}(?:\.\d{3})*),\d{4}$"
    And Assert element by contains text "Exchange rate for" has first following sibling with text from key "keyBuy"
    And Assert element by text "Value date"
    And Assert Value date is todays date and in valid date format
    And Assert that text "Fee" has first following sibling that contains text "0,00 RSD"
    And Assert element by text "Cancel"
    And Assert element by text "Exchange"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Enter PIN"
    And Enter PIN
    And Wait for element by text "Reject"
    And Assert that text "Exchange:" has first following sibling that contains text from key "keyAmount" with no spaces
    And Assert element by text "To:" has first following sibling from key "exchangeValueKey"
#    And Assert that text "From account:" has first following sibling from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
#    And Assert that text "To account:" has first following sibling from excel "<rowindex>" columnName "personal_account_iban"
#    And Assert Exchange rate label is displayed for amount under key "keyAmount"
    And Assert element by contains text "Exchange rate for" has first following sibling with regex "^(?:0|[1-9]\d{0,2}(?:\.\d{3})*),\d{4}$"
    And Assert that text "Value date:" has first following sibling that matches regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert that text "Fee:" has first following sibling that contains text "0,00 RSD"
    And Assert element "nlb-button-alternate" by id
    And Assert element "nlb-button-primary" by id
    And Click on element by id "nlb-button-primary"

    And Wait for element by id "transactions-web-close-popup-icon" to appear
    And Assert element by text "Confirmation successful"
    And Assert element by contains text "Your payment was successfully accepted"
    And Click on element by id "transactions-web-close-popup-nlb-button"
    And Click on element by text "My Products"
    And Wait for element by id "nlb-value-product-primary-balance" to appear

    Then Scroll until element with text from excel "<rowindex>" columnName "currentDomesticAccountBBAN" is in view
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Check if current balance is increased by value from key "exchangeValueKey" using balance from key "IT_001_Creditor_Balance" for currency "RSD"
    And Click "Back" content description
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Check if current balance is lowered by "3" using balance from key "IT_001_Debtor_Balance" for currency "EUR"

    Examples:
      | rowindex |
      |        5 |