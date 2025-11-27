Feature: Financial_Instruments_Feature

  @Financial_Instruments_Accounts-Details-Recipient_Data_[MOB_ANDROID]
  Scenario Outline: Financial_Instruments_Accounts-Details-Recipient_Data_[MOB_ANDROID]
    #C71069

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "financial_instruments_trading_account_detailed_name" is in view
    And Click on element by text from excel "<rowindex>" columnName "financial_instruments_trading_account_detailed_name"
    And Wait for element by id "nlb-account-owner" to appear

    Then Assert element by text "Recipient details"
    And Assert element by text "Address"
    And Assert element by text from excel "<rowindex>" columnName "user_name_short" is contained in element by id "nlb-address"
    And Assert element by text from excel "<rowindex>" columnName "user_street_only_short" is contained in element by id "nlb-address"
    And Assert element by text from excel "<rowindex>" columnName "user_city_short" is contained in element by id "nlb-address"
    And Assert element by text from excel "<rowindex>" columnName "user_postal_code" is contained in element by id "nlb-address"
    And Assert element by text "Country"
    And Assert text "Slovenia" in element id "nlb-country"
    And Assert element by text from excel "<rowindex>" columnName "financial_instruments_trading_account_details_email" is contained in element by id "nlb-email"

    Examples:
      | rowindex |
      |        1 |


  @Financial_Instruments_Accounts-Details-Account_Details_[MOB_ANDROID]
  Scenario Outline: Financial_Instruments_Accounts-Details-Account_Details_[MOB_ANDROID]
    #C71070

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "financial_instruments_trading_account_detailed_name" is in view
    And Click on element by text from excel "<rowindex>" columnName "financial_instruments_trading_account_detailed_name"
    And Wait for element by id "nlb-account-owner" to appear

    Then Assert element by text "Account details"
    And Assert element by text "Account owner"
    And Assert element by text from excel "<rowindex>" columnName "user_name_short" is contained in element by id "nlb-account-owner"
    And Assert element by text "Account number"
    And Assert text from excel "<rowindex>" columnName "financial_instruments_trading_account_details_account_number" in element by id "nlb-account-number"
    And Assert element by text "Opening date"
    And Assert text from excel "<rowindex>" columnName "financial_instruments_trading_account_details_opening_date" in element by id "nlb-opening-date"

    Examples:
      | rowindex |
      |        1 |

  @Financial_Instruments_Accounts-Details-NLB_Application_For_Financial_Instruments_[MOB_ANDROID]
  Scenario Outline: Financial_Instruments_Accounts-Details-NLB_Application_For_Financial_Instruments_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "financial_instruments_trading_account_detailed_name" is in view
    And Click on element by text from excel "<rowindex>" columnName "financial_instruments_trading_account_detailed_name"
    And Wait for element by id "nlb-account-owner" to appear
    And Swipe vertical
    
    Then Assert element by text "NLB web application for financial instruments"
    And Assert element by text "For additional features like portfolio review, buy/sell orders, advance payments see our financial instruments app - NLB Trading"
    And Assert element by id "nlb-button-text" that has descendant text "NLB Trading"
    And Click on element by text "NLB Trading"
    And Assert element by text "nlbtrading.nlb.si/User/LogOn"
    And Go Back

    Examples:
      | rowindex |
      |        1 |