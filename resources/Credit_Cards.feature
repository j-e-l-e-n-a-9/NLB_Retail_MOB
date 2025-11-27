Feature: Credit_Cards

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

    Then Assert element by text "Approved overdraft"
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
    And Assert element by text "Change limit"
    And Assert element by text "Repay limit"
    And Click on element by text "Repay limit"
    And Wait for element by text "UPN payment"
    And Assert element by text "UPN payment"
    And Click "Back" content description from view tag "View"
    And Click on element by text "Yes"
    And Wait for element by text "Change limit"
    And Click on element by text "Change overdraft"
    And Assert element by text "Change card limit order"
    And Click on element by text "Cancel"
    And Assert element by text "Financial details"

    Examples:
      | rowindex |
      |        4 |

  @Credit_Cards-Details-Card_Details_[MOB_ANDROID]
  Scenario Outline: Credit_Cards-Details-Card_Details_[MOB_ANDROID]
    #C71176

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

    Then Scroll down until element with text "Documents archive" is in view
    And Assert element by text "Card details"
    And Assert element by text "Cardholder name"
    And Assert text from excel "<rowindex>" columnName "credit_card_premium_visa_one_card_holder_name" in element by id "nlb-card-holder-name"
    And Assert element by text "Billing Day"
    And Assert text from excel "<rowindex>" columnName "credit_card_premium_visa_one_billing_day" in element by id "nlb-billing-day"
    And Assert element by text "Settlement day"
    And Assert text from excel "<rowindex>" columnName "credit_card_premium_visa_one_settlement_day" in element by id "nlb-settlement-day"
    And Assert element by text "Valid through"
    And Assert text from excel "<rowindex>" columnName "credit_card_premium_visa_one_valid_through" in element by id "nlb-valid-through"
    And Assert element by text "Payment status"
    And Assert text "Active" in element id "nlb-card-status"
    And Assert element by text "Documents archive"
    And Click on element by text "Document archive"
    And Assert element by text "Documents archive"
    And Wait for element by id "nlb-title" to appear
    And Assert element "nlb-title" by id

    Examples:
      | rowindex |
      |        4 |


  @Credit_Cards-Details_[MOB_ANDROID]
  Scenario Outline: Credit_Cards-Details_[MOB_ANDROID]
    #C71174

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "credit_card_premium_visa_one_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "credit_card_premium_visa_one_iban"
    And Wait for element by id "nlb-feature-button" to appear

    Then Assert element by text "Available balance"
    And Assert element by id "nlb-product-details-primary-balance" ends in "EUR"
    And Assert "Details" content description from view tag "View" is displayed
    And Assert element by text "Details"
    And Assert "Statements" content description from view tag "View" is displayed
    And Assert element by text "Statements"
    And Assert "Card Settings" content description from view tag "View" is displayed
    And Assert element by text "Card Settings"
    And Assert element by text "Change limit"
    And Click "Details" content description from view tag "View"
    And Wait for element by text "Financial details"
    And Assert element by text "Available balance"
    And Assert element by id "nlb-product-details-primary-balance" ends in "EUR"



    Examples:
      | rowindex |
      |        4 |

  @Credit_Cards-Tranasctions-List_[MOB_ANDROID]
  Scenario Outline: Credit_Cards-Tranasctions-List_[MOB_ANDROID]
    #C71155
    #Ovaj test treba popraviti kada rese bugove i dodju kartice na uat user-a
    #Amount za svaki mesec ne broji kako treba. Zakucan je na 0,0

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "credit_card_premium_visa_one_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "credit_card_premium_visa_one_iban"
    And Wait for element by id "nlb-feature-button" to appear

    Then Assert element by text "Transactions"
    And Click on date filter for NLB Funds
    And Wait for element by id "nlb-settings-menu" to appear
    And Assert element by text "Date"
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-title" to appear
    And Click on search for NLB Funds
    And Assert element by text "Search"
    And Click "Clear Text" content description from tag "ImageView"
    And Assert text "−0,04 EUR" in element id "nlb-transaction-header-sum"
    And Assert list of element by id "nlb-date" is displayed
    And Assert list of element by id "nlb-currency" is displayed
    And Assert list of element by id "nlb-title" is displayed
    And Assert list of element by id "nlb-amount" is displayed
    And Assert list of element by id "nlb-details" is displayed



    Examples:
      | rowindex |
      |        1 |

  @Credit_Cards-Tranasctions-Details-Transaction_Confirmation_[MOB_ANDROID]
  Scenario Outline: Credit_Cards-Tranasctions-Details-Transaction_Confirmation_[MOB_ANDROID]
    #C71172


    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "credit_card_premium_visa_one_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "credit_card_premium_visa_one_iban"
    And Wait for element by id "nlb-title" to appear

    When Click on first transaction
    And Wait element "Get receipt" by text
    And Click on button "Get receipt" in transaction details

    Then Assert element by complete id "com.google.android.apps.docs:id/projector_toolbar"
    And Go Back

    Examples:
      | rowindex |
      |        1 |

  @Credit_Cards-Tranasctions-Details_[MOB_ANDROID]
  Scenario Outline: Credit_Cards-Tranasctions-Details_[MOB_ANDROID]
    #C71171
    #Test ce pasti zbog postojanja Number of installments polja

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "credit_card_premium_visa_one_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "credit_card_premium_visa_one_iban"
    And Wait for element by id "nlb-title" to appear

    When Click on first transaction
    And Wait element "Send complaint" by text
    And Assert element "nlb-date" by id
    And Assert element "nlb-currency" by id
    And Assert element "nlb-title" by id
    And Assert element "nlb-amount" by id
    #And Assert element by text "Get receipt"
    And Assert element by text "Send message"
    And Assert that text "Transaction ID" has first following sibling that is filled
    And Assert that text "Settlement date" has first following sibling that matches regex "^\d{1,2}\.\s\d{1,2}\.\s\d{4}$"
    And Assert that text "Payment amount" has first following sibling that matches regex "^\d{1,3},\d{2}\sEUR$"
    And Assert element by text "Number of installments" is not displayed

    Examples:
      | rowindex |
      |        1 |