Feature: Domestic_Payments

  @Payments_Domestic_Payments_Cancel_Button_[MOB_ANDROID]
  Scenario Outline: Payments_Domestic_Payments_Cancel_Button_[MOB_ANDROID]
    #C75524
    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    #And Change language to english
    And Click on element by text "Pay"
    And Click on element by text "Domestic payment"

    And Enter text from excel "<rowindex>" columnName "currentDomesticAccountBBAN" in element id "nlb-input-creditor-account"
    And Enter text "IME" in element id "nlb-input-creditor-name"
    And Enter text "ADR" in element id "nlb-input-creditor-address"
    And Enter text "GRD" in element id "nlb-input-creditor-city"

    And Swipe vertical
    And Scroll down until element with text "Cancel" is in view
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Enter text "ABC" in element id "nlb-input-purpose"
    And Scroll down until element with text "Cancel" is in view
    And Click on element by text "Cancel"
    And Assert element by text "Are you sure?"
    And Assert element by text "Yes"
    And Assert element by text "No"
    And Click on element by text "No"
    And Click on element by id "nlb-dropdown-menu"
    And Click on element by text "DIGITAL ASSETS"
    #And Enter text "92" in element id "nlb-input-reference-number"
    And Click on element by text "Next"
    And Assert element by text "Payment review"
    And Assert that text "First and last name / Company name" has first following sibling with text "IME"
    And Assert that text "Address" has first following sibling with text "ADR"
    And Assert that text "Account number" has first following sibling from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Click on element by text "Cancel"
    And Assert element by text "Are you sure?"
    And Assert element by text "Cancelling now will terminate the payment process"
    And Click on element by text "Yes"
    
    And Assert element by text "Payments"
    And Assert element by text "Domestic payment"
    And Assert element by text "Own account Transfer"
    And Assert element by text "Photo pay"




    Examples:
      | rowindex |
      | 1        |
