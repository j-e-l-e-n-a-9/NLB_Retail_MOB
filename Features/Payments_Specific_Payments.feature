Feature: Payments_Specific_Payments


#  Payments_Specific_Payment_Credit_Card_Repayment_[ANDROID]-From_Current_Domestic_Account
#  Payments_Specific_Payment_Credit_Card_Repayment_[ANDROID]-From_Saving_Account
    #todo skloni tekst
  @Payments_Specific_Payment_Credit_Card_Repayment_[ANDROID]-From_Current_Domestic_Account
  Scenario Outline: Payments_Specific_Payment_Credit_Card_Repayment_[ANDROID]-From_Current_Domestic_Account

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load

    When Click on Bottom navigation button "My Products"
    And Wait for first product in My products page

    And Scroll until element with text from excel "<rowindex>" columnName "currentDomesticAccountBBAN" is in view
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Remember available balance in currency "RSD" under key "IT_001_Debtor_Balance"
    And Click "Back" content description
    And Scroll until element with text from excel "<rowindex>" columnName "credit_card_number" is in view
    And Click on element by text from excel "<rowindex>" columnName "credit_card_number"
    And Remember available balance in currency "RSD" under key "key_Card_Balance"
    And Wait for element by contains text "Details"
    And Click on element by contains text "Details"
    And Wait for element by contains text "repayment"
    And Click on element by contains text "repayment"
    And Wait for element by contains text "Internal transfer"

    And Assert element by text "Debtor"
    And Assert element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Assert element by text "Recipient"
    And Assert element by text from excel "<rowindex>" columnName "credit_card_number"

    And Enter text "1" into EditText element and remember it under key "keyPaymentAmount"
    And Assert that text "Purpose" has first following sibling with text "INTERNAL TRANSFER"
    And Assert element by text "Payment date" has first following sibling match regex "^\d{2}\.\d{2}\.\d{4}$"
    And Swipe vertical
    And Click on element by contains text "Confirm"
    And Wait for element by text "Fee"
    

    Examples:
      | rowindex |
      |        5 |