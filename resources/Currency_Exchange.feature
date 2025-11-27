Feature: Currency_Exchange

  @Payments_Currency_Exchange_EUR_To_USD_Personal_Account_Source_[Android]
  Scenario Outline: Payments_Currency_Exchange_EUR_To_USD_Personal_Account_Source_[Android]
    #C75510

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click "Currency exchange" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And Enter text "30" in "1" element by id "nlb-amount-with-currency-flag-field"
    And Click on element by text "Check exchange rates"
    And Wait for element by id "nlb-exchange-buy" to appear
    And Remember "sell" currency rate for country "USD" under key "sell_rate"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And For currency exchange rate "sell_rate" and source amount "30" calculate destination amount
    And Click on element by text "Next"
    And Wait for element by id "currency-exchange-review-exchange-from" to appear
    And Assert text "30,00 EUR" in element id "currency-exchange-review-exchange-from"
    And Assert To currency in currency exchange review has value from key "destination_amount" and currency "USD"
    And Assert element by text from excel "<rowindex>" columnName "user_name_short" is contained in element by id "currency-exchange-review-account-owner-name"
    And Assert element by text from excel "<rowindex>" columnName "personal_account_iban" in element by id "currency-exchange-review-account-number"
    And Assert element "currency-exchange-review-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-cta-button" to appear
    And Wait "10" seconds
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Wait for currency exchange to finish
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-cta-button" to appear

    Then Click on first transaction
    And Wait for element by text "Confirmation"
    And Assert text "−30,00" in element id "nlb-amount"
    And Assert that amount for opened transaction in product screen is from key "destination_amount" and currency "USD"
    And Assert that foreign exchange rate for opened transaction in product screen is formed from "1" "EUR" key "sell_rate" "USD"

    Examples:
      | rowindex |
      |        4 |


  @Payments_Currency_Exchange_EUR_To_USD_Auth_Personal_Account_Source_[Android]
  Scenario Outline: Payments_Currency_Exchange_EUR_To_USD_Auth_Personal_Account_Source_[Android]
    #C76197

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "auth_personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "auth_personal_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click "Currency exchange" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And Enter text "30" in "1" element by id "nlb-amount-with-currency-flag-field"
    And Click on element by text "Check exchange rates"
    And Wait for element by id "nlb-exchange-buy" to appear
    And Remember "sell" currency rate for country "USD" under key "sell_rate"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And For currency exchange rate "sell_rate" and source amount "30" calculate destination amount
    #And Click on element by id "nlb-button-primary"
    And Click on element by text "Next"
    And Wait for element by id "currency-exchange-review-exchange-from" to appear
    And Assert text "30,00 EUR" in element id "currency-exchange-review-exchange-from"
    And Assert To currency in currency exchange review has value from key "destination_amount" and currency "USD"
    And Assert element by text from excel "<rowindex>" columnName "auth_user_name_short" is contained in element by id "currency-exchange-review-account-owner-name"
    And Assert element by text from excel "<rowindex>" columnName "auth_personal_account_iban" in element by id "currency-exchange-review-account-number"
    And Assert element "currency-exchange-review-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-cta-button" to appear
    And Wait "10" seconds
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Wait for currency exchange to finish
    And Scroll until element with text from excel "<rowindex>" columnName "auth_personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "auth_personal_account_iban"
    And Wait for element by id "nlb-cta-button" to appear

    Then Click on first transaction
    And Wait for element by text "Confirmation"
    And Assert text "−30,00" in element id "nlb-amount"
    And Assert that amount for opened transaction in product screen is from key "destination_amount" and currency "USD"
    And Assert that foreign exchange rate for opened transaction in product screen is formed from "1" "EUR" key "sell_rate" "USD"

    Examples:
      | rowindex |
      |        4 |


  @Payments_Currency_Exchange_EUR_To_USD_Personal_Account_Destination_[Android]
  Scenario Outline: Payments_Currency_Exchange_EUR_To_USD_Personal_Account_Destination_[Android]
  #C75510

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click "Currency exchange" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And Enter text "30" in "2" element by id "nlb-amount-with-currency-flag-field"
    And Click on element by text "Check exchange rates"
    And Wait for element by id "nlb-exchange-buy" to appear
    And Remember "sell" currency rate for country "UNITED STATES" under key "sell_rate"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And For currency exchange rate "sell_rate" and destination amount "30" calculate source amount
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "currency-exchange-review-exchange-from" to appear
    And Assert I Wish to Exchange in currency exchange review has value from key "source_amount" and currency "EUR"
    And Assert text "30,00 USD" in element id "currency-exchange-review-exchange-to"
    And Assert element by text from excel "<rowindex>" columnName "user_name_short" is contained in element by id "currency-exchange-review-account-owner-name"
    And Assert element by text from excel "<rowindex>" columnName "personal_account_iban" in element by id "currency-exchange-review-account-number"
    And Assert element "currency-exchange-review-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-cta-button" to appear
    And Wait "10" seconds
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Wait for currency exchange to finish
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-cta-button" to appear

    Then Click on first transaction
    And Wait for element by text "Confirmation"
    And Assert text from key "source_amount" for currency exchange amount in id "nlb-amount"
    And Assert that amount for opened transaction in product screen is "30,00 USD"
    And Assert that foreign exchange rate for opened transaction in product screen is formed from "1" "EUR" key "sell_rate" "USD"


    Examples:
      | rowindex |
      |        4 |

  @Payments_Currency_Exchange_EUR_To_CHF_Personal_Account_Source_[Android]
  Scenario Outline: Payments_Currency_Exchange_EUR_To_CHF_Personal_Account_Source_[Android]
    #C75510,C76189

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "auth_personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "auth_personal_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click "Currency exchange" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And Enter text "50" in "1" element by id "nlb-amount-with-currency-flag-field"
    And Wait "3" seconds
    And Select currency "CHF" in currency selection for To currency in exchange screen
    And Click on element by text "Check exchange rates"
    And Wait for element by id "nlb-exchange-buy" to appear
    And Remember "sell" currency rate for country "CHF" under key "sell_rate"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And For currency exchange rate "sell_rate" and source amount "50" calculate destination amount
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "currency-exchange-review-exchange-from" to appear
    And Assert text "50,00 EUR" in element id "currency-exchange-review-exchange-from"
    And Assert To currency in currency exchange review has value from key "destination_amount" and currency "CHF"
    And Assert element by text from excel "<rowindex>" columnName "auth_user_name_short" is contained in element by id "currency-exchange-review-account-owner-name"
    And Assert element by text from excel "<rowindex>" columnName "auth_personal_account_iban" in element by id "currency-exchange-review-account-number"
    And Assert element "currency-exchange-review-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-cta-button" to appear
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Wait for currency exchange to finish
    And Scroll until element with text from excel "<rowindex>" columnName "auth_personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "auth_personal_account_iban"
    And Wait for element by id "nlb-cta-button" to appear

    Then Click on first transaction
    And Wait for element by text "Confirmation"
    And Assert text "−50,00" in element id "nlb-amount"
    And Assert that amount for opened transaction in product screen is from key "destination_amount" and currency "CHF"
    And Assert that foreign exchange rate for opened transaction in product screen is formed from "1" "EUR" key "sell_rate" "CHF"

    Examples:
      | rowindex |
      |        2 |


  @Payments_Currency_Exchange_EUR_To_CHF_Personal_Account_Destination_[Android]
  Scenario Outline: Payments_Currency_Exchange_EUR_To_CHF_Personal_Account_Destination_[Android]
    #C75510

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "auth_personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "auth_personal_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click "Currency exchange" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And Select currency "CHF" in currency selection for To currency in exchange screen
    And Enter text "50" in "2" element by id "nlb-amount-with-currency-flag-field"
    And Click on element by text "Check exchange rates"
    And Wait for element by id "nlb-exchange-buy" to appear
    And Remember "sell" currency rate for country "SWITZERLAND" under key "sell_rate"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And For currency exchange rate "sell_rate" and destination amount "50" calculate source amount
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "currency-exchange-review-exchange-from" to appear
    And Assert I Wish to Exchange in currency exchange review has value from key "source_amount" and currency "EUR"
    And Assert text "50,00 CHF" in element id "currency-exchange-review-exchange-to"
    And Assert element by text from excel "<rowindex>" columnName "auth_user_name_short" is contained in element by id "currency-exchange-review-account-owner-name"
    And Assert element by text from excel "<rowindex>" columnName "auth_personal_account_iban" in element by id "currency-exchange-review-account-number"
    And Assert element "currency-exchange-review-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-cta-button" to appear
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Wait for currency exchange to finish
    And Scroll until element with text from excel "<rowindex>" columnName "auth_personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "auth_personal_account_iban"
    And Wait for element by id "nlb-cta-button" to appear

    Then Click on first transaction
    And Wait for element by text "Confirmation"
    And Assert text from key "source_amount" for currency exchange amount in id "nlb-amount"
    And Assert that amount for opened transaction in product screen is "50,00 CHF"
    And Assert that foreign exchange rate for opened transaction in product screen is formed from "1" "EUR" key "sell_rate" "CHF"


    Examples:
      | rowindex |
      |        2 |

  @Payments_Currency_Exchange_EUR_To_NOK_Personal_Account_Source_[Android]
  Scenario Outline: Payments_Currency_Exchange_EUR_To_NOK_Personal_Account_Source_[Android]
    #C75510

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click "Currency exchange" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And Enter text "50" in "1" element by id "nlb-amount-with-currency-flag-field"
    And Select currency "NOK" in currency selection for To currency in exchange screen
    And Click on element by text "Check exchange rates"
    And Wait for element by id "nlb-exchange-buy" to appear
    And Remember "sell" currency rate for country "NORWAY" under key "sell_rate"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And For currency exchange rate "sell_rate" and source amount "50" calculate destination amount
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "currency-exchange-review-exchange-from" to appear
    And Assert text "50,00 EUR" in element id "currency-exchange-review-exchange-from"
    And Assert To currency in currency exchange review has value from key "destination_amount" and currency "NOK"
    And Assert element by text from excel "<rowindex>" columnName "user_name_short" is contained in element by id "currency-exchange-review-account-owner-name"
    And Assert element by text from excel "<rowindex>" columnName "personal_account_iban" in element by id "currency-exchange-review-account-number"
    And Assert element "currency-exchange-review-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-cta-button" to appear
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Wait for currency exchange to finish
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-cta-button" to appear

    Then Click on first transaction
    And Wait for element by text "Confirmation"
    And Assert text "−50,00" in element id "nlb-amount"
    And Assert that amount for opened transaction in product screen is from key "destination_amount" and currency "NOK"
    And Assert that foreign exchange rate for opened transaction in product screen is formed from "1" "EUR" key "sell_rate" "NOK"

    Examples:
      | rowindex |
      |        2 |

  @Payments_Currency_Exchange_EUR_To_NOK_Personal_Account_Destination_[Android]
  Scenario Outline: Payments_Currency_Exchange_EUR_To_NOK_Personal_Account_Destination_[Android]
    #C75510

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click "Currency exchange" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And Select currency "NOK" in currency selection for To currency in exchange screen
    And Enter text "500" in "2" element by id "nlb-amount-with-currency-flag-field"
    And Click on element by text "Check exchange rates"
    And Wait for element by id "nlb-exchange-buy" to appear
    And Remember "sell" currency rate for country "NORWAY" under key "sell_rate"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And For currency exchange rate "sell_rate" and destination amount "500" calculate source amount
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "currency-exchange-review-exchange-from" to appear
    And Assert I Wish to Exchange in currency exchange review has value from key "source_amount" and currency "EUR"
    And Assert text "500" and currency "NOK" in element id "currency-exchange-review-exchange-to"
    And Assert element by text from excel "<rowindex>" columnName "user_name_short" is contained in element by id "currency-exchange-review-account-owner-name"
    And Assert element by text from excel "<rowindex>" columnName "personal_account_iban" in element by id "currency-exchange-review-account-number"
    And Assert element "currency-exchange-review-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-cta-button" to appear
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Wait for currency exchange to finish
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-cta-button" to appear

    Then Click on first transaction
    And Wait for element by text "Confirmation"
    And Assert text from key "source_amount" for currency exchange amount in id "nlb-amount"
    And Assert that amount for opened transaction in product screen has amount "500" and currency "NOK"
    And Assert that foreign exchange rate for opened transaction in product screen is formed from "1" "EUR" key "sell_rate" "NOK"


    Examples:
      | rowindex |
      |        2 |


  @Payments_Currency_Exchange_EUR_To_GBP_Personal_Account_Source_[Android]
  Scenario Outline: Payments_Currency_Exchange_EUR_To_GBP_Personal_Account_Source_[Android]
    #C75510

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click "Currency exchange" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And Enter text "50" in "1" element by id "nlb-amount-with-currency-flag-field"
    And Select currency "GBP" in currency selection for To currency in exchange screen
    And Click on element by text "Check exchange rates"
    And Wait for element by id "nlb-exchange-buy" to appear
    And Remember "sell" currency rate for country "UNITED KINGDOM" under key "sell_rate"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And For currency exchange rate "sell_rate" and source amount "50" calculate destination amount
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "currency-exchange-review-exchange-from" to appear
    And Assert text "50,00 EUR" in element id "currency-exchange-review-exchange-from"
    And Assert To currency in currency exchange review has value from key "destination_amount" and currency "GBP"
    And Assert element by text from excel "<rowindex>" columnName "user_name_short" is contained in element by id "currency-exchange-review-account-owner-name"
    And Assert element by text from excel "<rowindex>" columnName "personal_account_iban" in element by id "currency-exchange-review-account-number"
    And Assert element "currency-exchange-review-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-cta-button" to appear
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Wait for currency exchange to finish
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-cta-button" to appear

    Then Click on first transaction
    And Wait for element by text "Confirmation"
    And Assert text "−50,00" in element id "nlb-amount"
    And Assert that amount for opened transaction in product screen is from key "destination_amount" and currency "GBP"
    And Assert that foreign exchange rate for opened transaction in product screen is formed from "1" "EUR" key "sell_rate" "GBP"

    Examples:
      | rowindex |
      |        2 |

  @Payments_Currency_Exchange_EUR_To_GBP_Personal_Account_Destination_[Android]
  Scenario Outline: Payments_Currency_Exchange_EUR_To_GBP_Personal_Account_Destination_[Android]
    #C75510

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click "Currency exchange" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And Select currency "GBP" in currency selection for To currency in exchange screen
    And Enter text "50" in "2" element by id "nlb-amount-with-currency-flag-field"
    And Click on element by text "Check exchange rates"
    And Wait for element by id "nlb-exchange-buy" to appear
    And Remember "sell" currency rate for country "UNITED KINGDOM" under key "sell_rate"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And For currency exchange rate "sell_rate" and destination amount "50" calculate source amount
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "currency-exchange-review-exchange-from" to appear
    And Assert I Wish to Exchange in currency exchange review has value from key "source_amount" and currency "EUR"
    And Assert text "50,00 GBP" in element id "currency-exchange-review-exchange-to"
    And Assert element by text from excel "<rowindex>" columnName "user_name_short" is contained in element by id "currency-exchange-review-account-owner-name"
    And Assert element by text from excel "<rowindex>" columnName "personal_account_iban" in element by id "currency-exchange-review-account-number"
    And Assert element "currency-exchange-review-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-cta-button" to appear
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Wait for currency exchange to finish
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-cta-button" to appear

    Then Click on first transaction
    And Wait for element by text "Confirmation"
    And Assert text from key "source_amount" for currency exchange amount in id "nlb-amount"
    And Assert that amount for opened transaction in product screen is "50,00 GBP"
    And Assert that foreign exchange rate for opened transaction in product screen is formed from "1" "EUR" key "sell_rate" "GBP"


    Examples:
      | rowindex |
      |        2 |


  @Payments_Currency_Exchange_EUR_To_HUF_Personal_Account_Source_[Android]
  Scenario Outline: Payments_Currency_Exchange_EUR_To_HUF_Personal_Account_Source_[Android]
    #C75510

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click "Currency exchange" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And Enter text "1" in "1" element by id "nlb-amount-with-currency-flag-field"
    And Select currency "HUF" in currency selection for To currency in exchange screen
    And Click on element by text "Check exchange rates"
    And Wait for element by id "nlb-exchange-buy" to appear
    And Remember "sell" currency rate for country "HUNGARY" under key "sell_rate"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And For currency exchange rate "sell_rate" and source amount "1" calculate destination amount
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "currency-exchange-review-exchange-from" to appear
    And Assert text "1,00 EUR" in element id "currency-exchange-review-exchange-from"
    And Assert To currency in currency exchange review has value from key "destination_amount" and currency "HUF"
    And Assert element by text from excel "<rowindex>" columnName "user_name_short" is contained in element by id "currency-exchange-review-account-owner-name"
    And Assert element by text from excel "<rowindex>" columnName "personal_account_iban" in element by id "currency-exchange-review-account-number"
    And Assert element "currency-exchange-review-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-cta-button" to appear
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Wait for currency exchange to finish
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-cta-button" to appear

    Then Click on first transaction
    And Wait for element by text "Confirmation"
    And Assert text "−1,00" in element id "nlb-amount"
    And Assert that amount for opened transaction in product screen is from key "destination_amount" and currency "HUF"
    And Assert that foreign exchange rate for opened transaction in product screen is formed from "1" "EUR" key "sell_rate" "HUF"

    Examples:
      | rowindex |
      |        2 |

  @Payments_Currency_Exchange_EUR_To_HUF_Personal_Account_Destination_[Android]
  Scenario Outline: Payments_Currency_Exchange_EUR_To_HUF_Personal_Account_Destination_[Android]
    #C75510

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click "Currency exchange" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And Select currency "HUF" in currency selection for To currency in exchange screen
    And Enter text "500" in "2" element by id "nlb-amount-with-currency-flag-field"
    And Click on element by text "Check exchange rates"
    And Wait for element by id "nlb-exchange-buy" to appear
    And Remember "sell" currency rate for country "HUNGARY" under key "sell_rate"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And For currency exchange rate "sell_rate" and destination amount "500" calculate source amount
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "currency-exchange-review-exchange-from" to appear
    And Assert I Wish to Exchange in currency exchange review has value from key "source_amount" and currency "EUR"
    #And Assert text "500,00 HUF" in element id "currency-exchange-review-exchange-to"
    And Assert element by text from excel "<rowindex>" columnName "user_name_short" is contained in element by id "currency-exchange-review-account-owner-name"
    And Assert element by text from excel "<rowindex>" columnName "personal_account_iban" in element by id "currency-exchange-review-account-number"
    And Assert element "currency-exchange-review-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-cta-button" to appear
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Wait for currency exchange to finish
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-cta-button" to appear

    Then Click on first transaction
    And Wait for element by text "Confirmation"
    And Assert text from key "source_amount" for currency exchange amount in id "nlb-amount"
    #And Assert that amount for opened transaction in product screen is "500,00 HUF"
    And Assert that foreign exchange rate for opened transaction in product screen is formed from "1" "EUR" key "sell_rate" "HUF"


    Examples:
      | rowindex |
      |        2 |

  @Payments_Currency_Exchange_EUR_To_USD_Savings_Account_Source_[Android]
  Scenario Outline: Payments_Currency_Exchange_EUR_To_USD_Savings_Account_Source_[Android]
    #C75510

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click "Currency exchange" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And Enter text "30" in "1" element by id "nlb-amount-with-currency-flag-field"
    And Click on element by text "Check exchange rates"
    And Wait for element by id "nlb-exchange-buy" to appear
    And Remember "sell" currency rate for country "UNITED STATES" under key "sell_rate"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And For currency exchange rate "sell_rate" and source amount "30" calculate destination amount
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "currency-exchange-review-exchange-from" to appear
    And Assert text "30,00 EUR" in element id "currency-exchange-review-exchange-from"
    And Assert To currency in currency exchange review has value from key "destination_amount" and currency "USD"
    And Assert element by text from excel "<rowindex>" columnName "user_name_short" is contained in element by id "currency-exchange-review-account-owner-name"
    And Assert element by text from excel "<rowindex>" columnName "savings_account_iban" in element by id "currency-exchange-review-account-number"
    And Assert element "currency-exchange-review-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-cta-button" to appear
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Wait for currency exchange to finish
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by id "nlb-cta-button" to appear

    Then Click on first transaction
    And Wait for element by text "Confirmation"
    And Assert text "−30,00" in element id "nlb-amount"
    And Assert that amount for opened transaction in product screen is from key "destination_amount" and currency "USD"
    And Assert that foreign exchange rate for opened transaction in product screen is formed from "1" "EUR" key "sell_rate" "USD"

    Examples:
      | rowindex |
      |        2 |


  @Payments_Currency_Exchange_EUR_To_USD_Savings_Account_Destination_[Android]
  Scenario Outline: Payments_Currency_Exchange_EUR_To_USD_Savings_Account_Destination_[Android]
  #C75510

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click "Currency exchange" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And Enter text "30" in "2" element by id "nlb-amount-with-currency-flag-field"
    And Click on element by text "Check exchange rates"
    And Wait for element by id "nlb-exchange-buy" to appear
    And Remember "sell" currency rate for country "UNITED STATES" under key "sell_rate"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And For currency exchange rate "sell_rate" and destination amount "30" calculate source amount
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "currency-exchange-review-exchange-from" to appear
    And Assert I Wish to Exchange in currency exchange review has value from key "source_amount" and currency "EUR"
    And Assert text "30,00 USD" in element id "currency-exchange-review-exchange-to"
    And Assert element by text from excel "<rowindex>" columnName "user_name_short" is contained in element by id "currency-exchange-review-account-owner-name"
    And Assert element by text from excel "<rowindex>" columnName "savings_account_iban" in element by id "currency-exchange-review-account-number"
    And Assert element "currency-exchange-review-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-cta-button" to appear
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Wait for currency exchange to finish
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by id "nlb-cta-button" to appear

    Then Click on first transaction
    And Wait for element by text "Confirmation"
    And Assert text from key "source_amount" for currency exchange amount in id "nlb-amount"
    And Assert that amount for opened transaction in product screen is "30,00 USD"
    And Assert that foreign exchange rate for opened transaction in product screen is formed from "1" "EUR" key "sell_rate" "USD"


    Examples:
      | rowindex |
      |        2 |

  @Payments_Currency_Exchange_EUR_To_CHF_Savings_Account_Source_[Android]
  Scenario Outline: Payments_Currency_Exchange_EUR_To_CHF_Savings_Account_Source_[Android]
    #C75510

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click "Currency exchange" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And Enter text "50" in "1" element by id "nlb-amount-with-currency-flag-field"
    And Select currency "CHF" in currency selection for To currency in exchange screen
    And Click on element by text "Check exchange rates"
    And Wait for element by id "nlb-exchange-buy" to appear
    And Remember "sell" currency rate for country "SWITZERLAND" under key "sell_rate"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And For currency exchange rate "sell_rate" and source amount "50" calculate destination amount
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "currency-exchange-review-exchange-from" to appear
    And Assert text "50,00 EUR" in element id "currency-exchange-review-exchange-from"
    And Assert To currency in currency exchange review has value from key "destination_amount" and currency "CHF"
    And Assert element by text from excel "<rowindex>" columnName "user_name_short" is contained in element by id "currency-exchange-review-account-owner-name"
    And Assert element by text from excel "<rowindex>" columnName "savings_account_iban" in element by id "currency-exchange-review-account-number"
    And Assert element "currency-exchange-review-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-cta-button" to appear
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Wait for currency exchange to finish
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by id "nlb-cta-button" to appear

    Then Click on first transaction
    And Wait for element by text "Confirmation"
    And Assert text "−50,00" in element id "nlb-amount"
    And Assert that amount for opened transaction in product screen is from key "destination_amount" and currency "CHF"
    And Assert that foreign exchange rate for opened transaction in product screen is formed from "1" "EUR" key "sell_rate" "CHF"

    Examples:
      | rowindex |
      |        2 |


  @Payments_Currency_Exchange_EUR_To_CHF_Savings_Account_Destination_[Android]
  Scenario Outline: Payments_Currency_Exchange_EUR_To_CHF_Savings_Account_Destination_[Android]
    #C75510

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click "Currency exchange" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And Select currency "CHF" in currency selection for To currency in exchange screen
    And Enter text "50" in "2" element by id "nlb-amount-with-currency-flag-field"
    And Click on element by text "Check exchange rates"
    And Wait for element by id "nlb-exchange-buy" to appear
    And Remember "sell" currency rate for country "SWITZERLAND" under key "sell_rate"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And For currency exchange rate "sell_rate" and destination amount "50" calculate source amount
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "currency-exchange-review-exchange-from" to appear
    And Assert I Wish to Exchange in currency exchange review has value from key "source_amount" and currency "EUR"
    And Assert text "50,00 CHF" in element id "currency-exchange-review-exchange-to"
    And Assert element by text from excel "<rowindex>" columnName "user_name_short" is contained in element by id "currency-exchange-review-account-owner-name"
    And Assert element by text from excel "<rowindex>" columnName "savings_account_iban" in element by id "currency-exchange-review-account-number"
    And Assert element "currency-exchange-review-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-cta-button" to appear
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Wait for currency exchange to finish
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by id "nlb-cta-button" to appear

    Then Click on first transaction
    And Wait for element by text "Confirmation"
    And Assert text from key "source_amount" for currency exchange amount in id "nlb-amount"
    And Assert that amount for opened transaction in product screen is "50,00 CHF"
    And Assert that foreign exchange rate for opened transaction in product screen is formed from "1" "EUR" key "sell_rate" "CHF"


    Examples:
      | rowindex |
      |        2 |

  @Payments_Currency_Exchange_EUR_To_NOK_Savings_Account_Source_[Android]
  Scenario Outline: Payments_Currency_Exchange_EUR_To_NOK_Savings_Account_Source_[Android]
    #C75510

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click "Currency exchange" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And Enter text "50" in "1" element by id "nlb-amount-with-currency-flag-field"
    And Select currency "NOK" in currency selection for To currency in exchange screen
    And Click on element by text "Check exchange rates"
    And Wait for element by id "nlb-exchange-buy" to appear
    And Remember "sell" currency rate for country "NORWAY" under key "sell_rate"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And For currency exchange rate "sell_rate" and source amount "50" calculate destination amount
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "currency-exchange-review-exchange-from" to appear
    And Assert text "50,00 EUR" in element id "currency-exchange-review-exchange-from"
    And Assert To currency in currency exchange review has value from key "destination_amount" and currency "NOK"
    And Assert element by text from excel "<rowindex>" columnName "user_name_short" is contained in element by id "currency-exchange-review-account-owner-name"
    And Assert element by text from excel "<rowindex>" columnName "savings_account_iban" in element by id "currency-exchange-review-account-number"
    And Assert element "currency-exchange-review-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-cta-button" to appear
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Wait for currency exchange to finish
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by id "nlb-cta-button" to appear

    Then Click on first transaction
    And Wait for element by text "Confirmation"
    And Assert text "−50,00" in element id "nlb-amount"
    And Assert that amount for opened transaction in product screen is from key "destination_amount" and currency "NOK"
    And Assert that foreign exchange rate for opened transaction in product screen is formed from "1" "EUR" key "sell_rate" "NOK"

    Examples:
      | rowindex |
      |        2 |

  @Payments_Currency_Exchange_EUR_To_NOK_Savings_Account_Destination_[Android]
  Scenario Outline: Payments_Currency_Exchange_EUR_To_NOK_Savings_Account_Destination_[Android]
    #C75510

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click "Currency exchange" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And Select currency "NOK" in currency selection for To currency in exchange screen
    And Enter text "500" in "2" element by id "nlb-amount-with-currency-flag-field"
    And Click on element by text "Check exchange rates"
    And Wait for element by id "nlb-exchange-buy" to appear
    And Remember "sell" currency rate for country "NORWAY" under key "sell_rate"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And For currency exchange rate "sell_rate" and destination amount "500" calculate source amount
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "currency-exchange-review-exchange-from" to appear
    And Assert I Wish to Exchange in currency exchange review has value from key "source_amount" and currency "EUR"
    And Assert text "500" and currency "NOK" in element id "currency-exchange-review-exchange-to"
    And Assert element by text from excel "<rowindex>" columnName "user_name_short" is contained in element by id "currency-exchange-review-account-owner-name"
    And Assert element by text from excel "<rowindex>" columnName "savings_account_iban" in element by id "currency-exchange-review-account-number"
    And Assert element "currency-exchange-review-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-cta-button" to appear
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Wait for currency exchange to finish
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by id "nlb-cta-button" to appear

    Then Click on first transaction
    And Wait for element by text "Confirmation"
    And Assert text from key "source_amount" for currency exchange amount in id "nlb-amount"
    And Assert that amount for opened transaction in product screen has amount "500" and currency "NOK"
    And Assert that foreign exchange rate for opened transaction in product screen is formed from "1" "EUR" key "sell_rate" "NOK"


    Examples:
      | rowindex |
      |        2 |


  @Payments_Currency_Exchange_EUR_To_GBP_Savings_Account_Source_[Android]
  Scenario Outline: Payments_Currency_Exchange_EUR_To_GBP_Savings_Account_Source_[Android]
    #C75510

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click "Currency exchange" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And Enter text "50" in "1" element by id "nlb-amount-with-currency-flag-field"
    And Select currency "GBP" in currency selection for To currency in exchange screen
    And Click on element by text "Check exchange rates"
    And Wait for element by id "nlb-exchange-buy" to appear
    And Remember "sell" currency rate for country "UNITED KINGDOM" under key "sell_rate"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And For currency exchange rate "sell_rate" and source amount "50" calculate destination amount
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "currency-exchange-review-exchange-from" to appear
    And Assert text "50,00 EUR" in element id "currency-exchange-review-exchange-from"
    And Assert To currency in currency exchange review has value from key "destination_amount" and currency "GBP"
    And Assert element by text from excel "<rowindex>" columnName "user_name_short" is contained in element by id "currency-exchange-review-account-owner-name"
    And Assert element by text from excel "<rowindex>" columnName "savings_account_iban" in element by id "currency-exchange-review-account-number"
    And Assert element "currency-exchange-review-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-cta-button" to appear
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Wait for currency exchange to finish
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by id "nlb-cta-button" to appear

    Then Click on first transaction
    And Wait for element by text "Confirmation"
    And Assert text "−50,00" in element id "nlb-amount"
    And Assert that amount for opened transaction in product screen is from key "destination_amount" and currency "GBP"
    And Assert that foreign exchange rate for opened transaction in product screen is formed from "1" "EUR" key "sell_rate" "GBP"

    Examples:
      | rowindex |
      |        2 |

  @Payments_Currency_Exchange_EUR_To_GBP_Savings_Account_Destination_[Android]
  Scenario Outline: Payments_Currency_Exchange_EUR_To_GBP_Savings_Account_Destination_[Android]
    #C75510

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click "Currency exchange" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And Select currency "GBP" in currency selection for To currency in exchange screen
    And Enter text "50" in "2" element by id "nlb-amount-with-currency-flag-field"
    And Click on element by text "Check exchange rates"
    And Wait for element by id "nlb-exchange-buy" to appear
    And Remember "sell" currency rate for country "UNITED KINGDOM" under key "sell_rate"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And For currency exchange rate "sell_rate" and destination amount "50" calculate source amount
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "currency-exchange-review-exchange-from" to appear
    And Assert I Wish to Exchange in currency exchange review has value from key "source_amount" and currency "EUR"
    And Assert text "50,00 GBP" in element id "currency-exchange-review-exchange-to"
    And Assert element by text from excel "<rowindex>" columnName "user_name_short" is contained in element by id "currency-exchange-review-account-owner-name"
    And Assert element by text from excel "<rowindex>" columnName "savings_account_iban" in element by id "currency-exchange-review-account-number"
    And Assert element "currency-exchange-review-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-cta-button" to appear
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Wait for currency exchange to finish
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by id "nlb-cta-button" to appear

    Then Click on first transaction
    And Wait for element by text "Confirmation"
    And Assert text from key "source_amount" for currency exchange amount in id "nlb-amount"
    And Assert that amount for opened transaction in product screen is "50,00 GBP"
    And Assert that foreign exchange rate for opened transaction in product screen is formed from "1" "EUR" key "sell_rate" "GBP"


    Examples:
      | rowindex |
      |        2 |


  @Payments_Currency_Exchange_EUR_To_HUF_Savings_Account_Source_[Android]
  Scenario Outline: Payments_Currency_Exchange_EUR_To_HUF_Savings_Account_Source_[Android]
    #C75510

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click "Currency exchange" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And Enter text "1" in "1" element by id "nlb-amount-with-currency-flag-field"
    And Select currency "HUF" in currency selection for To currency in exchange screen
    And Click on element by text "Check exchange rates"
    And Wait for element by id "nlb-exchange-buy" to appear
    And Remember "sell" currency rate for country "HUNGARY" under key "sell_rate"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And For currency exchange rate "sell_rate" and source amount "1" calculate destination amount
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "currency-exchange-review-exchange-from" to appear
    And Assert text "1,00 EUR" in element id "currency-exchange-review-exchange-from"
    And Assert To currency in currency exchange review has value from key "destination_amount" and currency "HUF"
    And Assert element by text from excel "<rowindex>" columnName "user_name_short" is contained in element by id "currency-exchange-review-account-owner-name"
    And Assert element by text from excel "<rowindex>" columnName "savings_account_iban" in element by id "currency-exchange-review-account-number"
    And Assert element "currency-exchange-review-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-cta-button" to appear
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Wait for currency exchange to finish
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by id "nlb-cta-button" to appear

    Then Click on first transaction
    And Wait for element by text "Confirmation"
    And Assert text "−1,00" in element id "nlb-amount"
    And Assert that amount for opened transaction in product screen is from key "destination_amount" and currency "HUF"
    And Assert that foreign exchange rate for opened transaction in product screen is formed from "1" "EUR" key "sell_rate" "HUF"

    Examples:
      | rowindex |
      |        2 |

  @Payments_Currency_Exchange_EUR_To_HUF_Savings_Account_Destination_[Android]
  Scenario Outline: Payments_Currency_Exchange_EUR_To_HUF_Savings_Account_Destination_[Android]
    #C75510

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click "Currency exchange" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And Select currency "HUF" in currency selection for To currency in exchange screen
    And Enter text "500" in "2" element by id "nlb-amount-with-currency-flag-field"
    And Click on element by text "Check exchange rates"
    And Wait for element by id "nlb-exchange-buy" to appear
    And Remember "sell" currency rate for country "HUNGARY" under key "sell_rate"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And For currency exchange rate "sell_rate" and destination amount "500" calculate source amount
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "currency-exchange-review-exchange-from" to appear
    And Assert I Wish to Exchange in currency exchange review has value from key "source_amount" and currency "EUR"
    #And Assert text "500,00 HUF" in element id "currency-exchange-review-exchange-to"
    And Assert element by text from excel "<rowindex>" columnName "user_name_short" is contained in element by id "currency-exchange-review-account-owner-name"
    And Assert element by text from excel "<rowindex>" columnName "savings_account_iban" in element by id "currency-exchange-review-account-number"
    And Assert element "currency-exchange-review-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-cta-button" to appear
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Wait for currency exchange to finish
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by id "nlb-cta-button" to appear

    Then Click on first transaction
    And Wait for element by text "Confirmation"
    And Assert text from key "source_amount" for currency exchange amount in id "nlb-amount"
    #And Assert that amount for opened transaction in product screen is "500,00 HUF"
    And Assert that foreign exchange rate for opened transaction in product screen is formed from "1" "EUR" key "sell_rate" "HUF"


    Examples:
      | rowindex |
      |        2 |


  @Payments_Currency_Exchange-Pricelist_[MOB_ANDROID]
  Scenario Outline: Payments_Currency_Exchange-Pricelist_[MOB_ANDROID]
    #C75509

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click "Currency exchange" content description from view tag "View"
    And Wait for element by text "Check exchange rates"

    Then Click on element by text "Check exchange rates"
    And Wait for element by id "nlb-exchange-date" to appear
    And Assert element "nlb-exchange-date" by id has current date in format "d.M.yyyy"
    And Assert element by text "Currency"
    And Assert element by text "Bid"
    And Assert element by text "Ask"
    #And Assert list of element by id "nlb-exchange-flag" is displayed
    #And Assert list of element by id "nlb-exchange-foreign-currency" is displayed
    #And Assert list of element by id "nlb-exchange-country-name" is displayed
    #And Assert list of element by id "nlb-exchange-buy" is displayed
    #And Assert list of element by id "nlb-exchange-sell" is displayed
    And Swipe vertical
    #And Assert there are "10" elements by id "nlb-exchange-flag"
    #And Assert there are "10" elements by id "nlb-exchange-foreign-currency"
    #And Assert there are "10" elements by id "nlb-exchange-country-name"
    And Assert there are "10" elements by id "nlb-exchange-buy"
    And Assert there are "10" elements by id "nlb-exchange-sell"
    And Assert element by id "nlb-exchange-buy" with regex "[0-9]{1},[0-9]{4}"
    And Assert element by id "nlb-exchange-sell" with regex "[0-9]{1},[0-9]{4}"
    And Assert "AUD" content description from view tag "View" is displayed
    And Assert "CAD" content description from view tag "View" is displayed
    And Assert "CHF" content description from view tag "View" is displayed
    And Assert "DKK" content description from view tag "View" is displayed
    And Assert "GBP" content description from view tag "View" is displayed
    And Assert "HUF" content description from view tag "View" is displayed
    And Assert "JPY" content description from view tag "View" is displayed
    And Assert "NOK" content description from view tag "View" is displayed
    And Assert "SEK" content description from view tag "View" is displayed
    And Assert "USD" content description from view tag "View" is displayed
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And Assert element by text "Check exchange rates"


    Examples:
      | rowindex |
      |        4 |


  @Payments_Currency_Exchange_USD_To_EUR_Personal_Account_Source_[Android]
  Scenario Outline: Payments_Currency_Exchange_USD_To_EUR_Personal_Account_Source_[Android]
    #C75511

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click "Currency exchange" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And Select currency "DKK" in currency selection for To currency in exchange screen
    And Wait for element by id "nlb-amount-with-currency-flag-field-currency-alpha3" to appear
    And Select currency "USD" in currency selection for From currency in exchange screen
    And Wait for element by id "nlb-amount-with-currency-flag-field-currency-alpha3" to appear
    And Select currency "EUR" in currency selection for To currency in exchange screen
    And Wait for element by id "nlb-amount-with-currency-flag-field-currency-alpha3" to appear
    And Enter text "30" in "1" element by id "nlb-amount-with-currency-flag-field"
    And Click on element by text "Check exchange rates"
    And Wait for element by id "nlb-exchange-buy" to appear
    And Remember "buy" currency rate for country "USD" under key "buy_rate"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And For currency exchange rate "buy_rate" and source amount "30" calculate foreign destination amount
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "currency-exchange-review-exchange-from" to appear
    And Assert text "30,00 USD" in element id "currency-exchange-review-exchange-from"
    And Assert To currency in currency exchange review has value from key "destination_amount" and currency "EUR"
    And Assert element by text from excel "<rowindex>" columnName "user_name_short" is contained in element by id "currency-exchange-review-account-owner-name"
    And Assert element by text from excel "<rowindex>" columnName "personal_account_iban" in element by id "currency-exchange-review-account-number"
    And Assert element "currency-exchange-review-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-cta-button" to appear
    And Wait "10" seconds
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Wait for currency exchange to finish
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-cta-button" to appear


    Then Click on first transaction
    And Wait for element by text "Confirmation"
    And Assert text from key "destination_amount" in element by id "nlb-amount"
    And Assert that amount for opened transaction in product screen has amount "30,00" and currency "USD"

    Examples:
      | rowindex |
      |        4 |

  @Payments_Currency_Exchange_USD_To_EUR_Savings_Account_Source_[Android]
  Scenario Outline: Payments_Currency_Exchange_USD_To_EUR_Savings_Account_Source_[Android]
    #C75510

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click "Currency exchange" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And Select currency "DKK" in currency selection for To currency in exchange screen
    And Wait for element by id "nlb-amount-with-currency-flag-field-currency-alpha3" to appear
    And Select currency "USD" in currency selection for From currency in exchange screen
    And Wait for element by id "nlb-amount-with-currency-flag-field-currency-alpha3" to appear
    And Select currency "EUR" in currency selection for To currency in exchange screen
    And Wait for element by id "nlb-amount-with-currency-flag-field-currency-alpha3" to appear
    And Enter text "30" in "1" element by id "nlb-amount-with-currency-flag-field"
    And Click on element by text "Check exchange rates"
    And Wait for element by id "nlb-exchange-buy" to appear
    And Remember "buy" currency rate for country "UNITED STATES" under key "buy_rate"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And For currency exchange rate "buy_rate" and source amount "30" calculate foreign destination amount
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "currency-exchange-review-exchange-from" to appear
    And Assert text "30,00 USD" in element id "currency-exchange-review-exchange-from"
    And Assert To currency in currency exchange review has value from key "destination_amount" and currency "EUR"
    And Assert element by text from excel "<rowindex>" columnName "user_name_short" is contained in element by id "currency-exchange-review-account-owner-name"
    And Assert element by text from excel "<rowindex>" columnName "savings_account_iban" in element by id "currency-exchange-review-account-number"
    And Assert element "currency-exchange-review-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-cta-button" to appear
    And Wait "10" seconds
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Wait for currency exchange to finish
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by id "nlb-cta-button" to appear


    Then Click on first transaction
    And Wait for element by text "Confirmation"
    And Assert text from key "destination_amount" in element by id "nlb-amount"
    And Assert that amount for opened transaction in product screen has amount "30,00" and currency "USD"

    Examples:
      | rowindex |
      |        4 |


  @Payments_Currency_Exchange_USD_To_EUR_Auth_Personal_Account_Source_[Android]
  Scenario Outline: Payments_Currency_Exchange_USD_To_EUR_Auth_Personal_Account_Source_[Android]
    #C75510

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "auth_personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "auth_personal_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click "Currency exchange" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And Select currency "DKK" in currency selection for To currency in exchange screen
    And Wait for element by id "nlb-amount-with-currency-flag-field-currency-alpha3" to appear
    And Select currency "USD" in currency selection for From currency in exchange screen
    And Wait for element by id "nlb-amount-with-currency-flag-field-currency-alpha3" to appear
    And Select currency "EUR" in currency selection for To currency in exchange screen
    And Wait for element by id "nlb-amount-with-currency-flag-field-currency-alpha3" to appear
    And Enter text "30" in "1" element by id "nlb-amount-with-currency-flag-field"
    And Click on element by text "Check exchange rates"
    And Wait for element by id "nlb-exchange-buy" to appear
    And Remember "buy" currency rate for country "UNITED STATES" under key "buy_rate"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And For currency exchange rate "buy_rate" and source amount "30" calculate foreign destination amount
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "currency-exchange-review-exchange-from" to appear
    And Assert text "30,00 USD" in element id "currency-exchange-review-exchange-from"
    And Assert To currency in currency exchange review has value from key "destination_amount" and currency "EUR"
    And Assert element by text from excel "<rowindex>" columnName "auth_user_name_short" is contained in element by id "currency-exchange-review-account-owner-name"
    And Assert element by text from excel "<rowindex>" columnName "auth_personal_account_iban" in element by id "currency-exchange-review-account-number"
    And Assert element "currency-exchange-review-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-cta-button" to appear
    And Wait "10" seconds
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Wait for currency exchange to finish
    And Scroll until element with text from excel "<rowindex>" columnName "auth_personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "auth_personal_account_iban"
    And Wait for element by id "nlb-cta-button" to appear


    Then Click on first transaction
    And Wait for element by text "Confirmation"
    And Assert text from key "destination_amount" in element by id "nlb-amount"
    And Assert that amount for opened transaction in product screen has amount "30,00" and currency "USD"

    Examples:
      | rowindex |
      |        4 |

  @Payments_Currency_Exchange_USD_To_EUR_Auth_Savings_Account_Source_[Android]
  Scenario Outline: Payments_Currency_Exchange_USD_To_EUR_Auth_Savings_Account_Source_[Android]
    #C75510

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "auth_savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "auth_savings_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click "Currency exchange" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And Select currency "DKK" in currency selection for To currency in exchange screen
    And Wait for element by id "nlb-amount-with-currency-flag-field-currency-alpha3" to appear
    And Select currency "USD" in currency selection for From currency in exchange screen
    And Wait for element by id "nlb-amount-with-currency-flag-field-currency-alpha3" to appear
    And Select currency "EUR" in currency selection for To currency in exchange screen
    And Wait for element by id "nlb-amount-with-currency-flag-field-currency-alpha3" to appear
    And Enter text "30" in "1" element by id "nlb-amount-with-currency-flag-field"
    And Click on element by text "Check exchange rates"
    And Wait for element by id "nlb-exchange-buy" to appear
    And Remember "buy" currency rate for country "UNITED STATES" under key "buy_rate"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And For currency exchange rate "buy_rate" and source amount "30" calculate foreign destination amount
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "currency-exchange-review-exchange-from" to appear
    And Assert text "30,00 USD" in element id "currency-exchange-review-exchange-from"
    And Assert To currency in currency exchange review has value from key "destination_amount" and currency "EUR"
    And Assert element by text from excel "<rowindex>" columnName "auth_user_name_short" is contained in element by id "currency-exchange-review-account-owner-name"
    And Assert element by text from excel "<rowindex>" columnName "auth_savings_account_iban" in element by id "currency-exchange-review-account-number"
    And Assert element "currency-exchange-review-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-cta-button" to appear
    And Wait "10" seconds
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Wait for currency exchange to finish
    And Scroll until element with text from excel "<rowindex>" columnName "auth_savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "auth_savings_account_iban"
    And Wait for element by id "nlb-cta-button" to appear


    Then Click on first transaction
    And Wait for element by text "Confirmation"
    And Assert text from key "destination_amount" in element by id "nlb-amount"
    And Assert that amount for opened transaction in product screen has amount "30,00" and currency "USD"

    Examples:
      | rowindex |
      |        4 |

  #Pocetak CHF testova

  @Payments_Currency_Exchange_CHF_To_EUR_Personal_Account_Source_[Android]
  Scenario Outline: Payments_Currency_Exchange_CHF_To_EUR_Personal_Account_Source_[Android]
    #C75510

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click "Currency exchange" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And Select currency "DKK" in currency selection for To currency in exchange screen
    And Wait for element by id "nlb-amount-with-currency-flag-field-currency-alpha3" to appear
    And Select currency "CHF" in currency selection for From currency in exchange screen
    And Wait for element by id "nlb-amount-with-currency-flag-field-currency-alpha3" to appear
    And Select currency "EUR" in currency selection for To currency in exchange screen
    And Wait for element by id "nlb-amount-with-currency-flag-field-currency-alpha3" to appear
    And Enter text "30" in "1" element by id "nlb-amount-with-currency-flag-field"
    And Click on element by text "Check exchange rates"
    And Wait for element by id "nlb-exchange-buy" to appear
    And Remember "buy" currency rate for country "SWITZERLAND" under key "buy_rate"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And For currency exchange rate "buy_rate" and source amount "30" calculate foreign destination amount
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "currency-exchange-review-exchange-from" to appear
    And Assert text "30,00 CHF" in element id "currency-exchange-review-exchange-from"
    And Assert To currency in currency exchange review has value from key "destination_amount" and currency "EUR"
    And Assert element by text from excel "<rowindex>" columnName "user_name_short" is contained in element by id "currency-exchange-review-account-owner-name"
    And Assert element by text from excel "<rowindex>" columnName "personal_account_iban" in element by id "currency-exchange-review-account-number"
    And Assert element "currency-exchange-review-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-cta-button" to appear
    And Wait "10" seconds
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Wait for currency exchange to finish
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-cta-button" to appear


    Then Click on first transaction
    And Wait for element by text "Confirmation"
    And Assert text from key "destination_amount" in element by id "nlb-amount"
    And Assert that amount for opened transaction in product screen has amount "30,00" and currency "CHF"

    Examples:
      | rowindex |
      |        4 |

  @Payments_Currency_Exchange_CHF_To_EUR_Savings_Account_Source_[Android]
  Scenario Outline: Payments_Currency_Exchange_CHF_To_EUR_Savings_Account_Source_[Android]
    #C75510

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click "Currency exchange" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And Select currency "DKK" in currency selection for To currency in exchange screen
    And Wait for element by id "nlb-amount-with-currency-flag-field-currency-alpha3" to appear
    And Select currency "CHF" in currency selection for From currency in exchange screen
    And Wait for element by id "nlb-amount-with-currency-flag-field-currency-alpha3" to appear
    And Select currency "EUR" in currency selection for To currency in exchange screen
    And Wait for element by id "nlb-amount-with-currency-flag-field-currency-alpha3" to appear
    And Enter text "30" in "1" element by id "nlb-amount-with-currency-flag-field"
    And Click on element by text "Check exchange rates"
    And Wait for element by id "nlb-exchange-buy" to appear
    And Remember "buy" currency rate for country "SWITZERLAND" under key "buy_rate"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And For currency exchange rate "buy_rate" and source amount "30" calculate foreign destination amount
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "currency-exchange-review-exchange-from" to appear
    And Assert text "30,00 CHF" in element id "currency-exchange-review-exchange-from"
    And Assert To currency in currency exchange review has value from key "destination_amount" and currency "EUR"
    And Assert element by text from excel "<rowindex>" columnName "user_name_short" is contained in element by id "currency-exchange-review-account-owner-name"
    And Assert element by text from excel "<rowindex>" columnName "savings_account_iban" in element by id "currency-exchange-review-account-number"
    And Assert element "currency-exchange-review-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-cta-button" to appear
    And Wait "10" seconds
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Wait for currency exchange to finish
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by id "nlb-cta-button" to appear


    Then Click on first transaction
    And Wait for element by text "Confirmation"
    And Assert text from key "destination_amount" in element by id "nlb-amount"
    And Assert that amount for opened transaction in product screen has amount "30,00" and currency "CHF"

    Examples:
      | rowindex |
      |        4 |


  @Payments_Currency_Exchange_CHF_To_EUR_Auth_Personal_Account_Source_[Android]
  Scenario Outline: Payments_Currency_Exchange_CHF_To_EUR_Auth_Personal_Account_Source_[Android]
    #C75510

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "auth_personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "auth_personal_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click "Currency exchange" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And Select currency "DKK" in currency selection for To currency in exchange screen
    And Wait for element by id "nlb-amount-with-currency-flag-field-currency-alpha3" to appear
    And Select currency "CHF" in currency selection for From currency in exchange screen
    And Wait for element by id "nlb-amount-with-currency-flag-field-currency-alpha3" to appear
    And Select currency "EUR" in currency selection for To currency in exchange screen
    And Wait for element by id "nlb-amount-with-currency-flag-field-currency-alpha3" to appear
    And Enter text "30" in "1" element by id "nlb-amount-with-currency-flag-field"
    And Click on element by text "Check exchange rates"
    And Wait for element by id "nlb-exchange-buy" to appear
    And Remember "buy" currency rate for country "SWITZERLAND" under key "buy_rate"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And For currency exchange rate "buy_rate" and source amount "30" calculate foreign destination amount
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "currency-exchange-review-exchange-from" to appear
    And Assert text "30,00 CHF" in element id "currency-exchange-review-exchange-from"
    And Assert To currency in currency exchange review has value from key "destination_amount" and currency "EUR"
    And Assert element by text from excel "<rowindex>" columnName "auth_user_name_short" is contained in element by id "currency-exchange-review-account-owner-name"
    And Assert element by text from excel "<rowindex>" columnName "auth_personal_account_iban" in element by id "currency-exchange-review-account-number"
    And Assert element "currency-exchange-review-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-cta-button" to appear
    And Wait "10" seconds
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Wait for currency exchange to finish
    And Scroll until element with text from excel "<rowindex>" columnName "auth_personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "auth_personal_account_iban"
    And Wait for element by id "nlb-cta-button" to appear


    Then Click on first transaction
    And Wait for element by text "Confirmation"
    And Assert text from key "destination_amount" in element by id "nlb-amount"
    And Assert that amount for opened transaction in product screen has amount "30,00" and currency "CHF"

    Examples:
      | rowindex |
      |        4 |

  @Payments_Currency_Exchange_CHF_To_EUR_Auth_Savings_Account_Source_[Android]
  Scenario Outline: Payments_Currency_Exchange_CHF_To_EUR_Auth_Savings_Account_Source_[Android]
    #C75510

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "auth_savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "auth_savings_account_iban"
    And Wait for element by id "nlb-cta-button" to appear
    And Click "Currency exchange" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And Select currency "DKK" in currency selection for To currency in exchange screen
    And Wait for element by id "nlb-amount-with-currency-flag-field-currency-alpha3" to appear
    And Select currency "CHF" in currency selection for From currency in exchange screen
    And Wait for element by id "nlb-amount-with-currency-flag-field-currency-alpha3" to appear
    And Select currency "EUR" in currency selection for To currency in exchange screen
    And Wait for element by id "nlb-amount-with-currency-flag-field-currency-alpha3" to appear
    And Enter text "30" in "1" element by id "nlb-amount-with-currency-flag-field"
    And Click on element by text "Check exchange rates"
    And Wait for element by id "nlb-exchange-buy" to appear
    And Remember "buy" currency rate for country "SWITZERLAND" under key "buy_rate"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And For currency exchange rate "buy_rate" and source amount "30" calculate foreign destination amount
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "currency-exchange-review-exchange-from" to appear
    And Assert text "30,00 CHF" in element id "currency-exchange-review-exchange-from"
    And Assert To currency in currency exchange review has value from key "destination_amount" and currency "EUR"
    And Assert element by text from excel "<rowindex>" columnName "auth_user_name_short" is contained in element by id "currency-exchange-review-account-owner-name"
    And Assert element by text from excel "<rowindex>" columnName "auth_savings_account_iban" in element by id "currency-exchange-review-account-number"
    And Assert element "currency-exchange-review-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-cta-button" to appear
    And Wait "10" seconds
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Wait for currency exchange to finish
    And Scroll until element with text from excel "<rowindex>" columnName "auth_savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "auth_savings_account_iban"
    And Wait for element by id "nlb-cta-button" to appear


    Then Click on first transaction
    And Wait for element by text "Confirmation"
    And Assert text from key "destination_amount" in element by id "nlb-amount"
    And Assert that amount for opened transaction in product screen has amount "30,00" and currency "CHF"

    Examples:
      | rowindex |
      |        4 |