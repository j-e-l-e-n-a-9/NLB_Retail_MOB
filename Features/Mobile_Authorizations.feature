Feature: Mobile_Authorizations

  @Mobile_Authorizations-Successful_Authorization_Of_Payment_[MOB_ANDROID]
  Scenario Outline: Mobile_Authorizations-Successful_Authorization_Of_Payment_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click on element by text "Pay"
    And Wait for element by text "Domestic payment" to appear for "30" seconds
    And Click on element by text "Domestic payment"
    And Wait for element by id "nlb-input-creditor-account" to appear
    And Enter text "205900100779094488" in element id "nlb-input-creditor-account"
    And Send random text to field with id "nlb-input-creditor-name" and remember it under key "keyName"
    And Enter text "Ulica" in element id "nlb-input-creditor-address"
    And Enter text "Grad" in element id "nlb-input-creditor-city"
    And Swipe vertical
    And Enter text "1" in element id "nlb-amount-with-currency-field"
    And Scroll down until element with text "Confirm" is in view
    And Click on element by id "nlb-button-primary"

    Then Wait for element by text "Payment amount"
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Enter PIN"
    And Enter PIN
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "transactions-web-close-popup-icon" to appear
    And Assert element by text "Confirmation successful"
    And Assert element by contains text "Your payment was successfully accepted"
    And Assert element "transactions-web-close-popup-nlb-button" by id

    Examples:
      | rowindex |
      |        1 |