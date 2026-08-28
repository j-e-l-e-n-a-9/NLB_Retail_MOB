Feature: Dashboard

  @General_Dashboard_Page_overview_[Android]
  Scenario Outline: General_Dashboard_Page_overview_[Android]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login

    When Wait for My NLB screen to load
    And Click "Notifications" content description
    And Wait for element by contains text "Mark all as read"
    And Go Back
    And Wait for My NLB screen to load
    
    And Wait for element by id "nlb-product-card-button-left" to appear
    And Click on element by text "My Products"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Remember current balance for favorite account under key "current_balance"
    And Remember available balance for favorite account under key "available_balance"
    And Click on element by text "My NLB"
    And Wait for My NLB screen to load
    And Assert active account in dashboard is from Excel "<rowindex>" with name "currentDomesticAccountName" and iban "currentDomesticAccountBBAN" and balance under keys "current_balance" and "available_balance"
    And Remember latest transaction purposes from dashboard under key "latest_transaction_purposes"

    And Click Next arrow in dashboard
    And Wait "1" seconds
    #And Assert element by text from excel "<rowindex>" columnName ""
    And Wait for element by id "nlb-title" to appear
    And Assert latest transaction purposes from dashboard are not the same as in key "latest_transaction_purposes"

    And Click Previous arrow in dashboard
    And Assert active account in dashboard is from Excel "<rowindex>" with name "currentDomesticAccountName" and iban "currentDomesticAccountBBAN" and balance under keys "current_balance" and "available_balance"
    And Assert element by contains text "All transactions"

    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Wait for element by id "nlb-title" to appear
    And Swipe vertical short
    And Swipe vertical short
    And Remember first "3" transaction purposes under key "payments_purposes"
    And Click "Back" content description
    And Wait for element by id "nlb-product-card-button-left" to appear
    And Wait for element by text "All transactions"
    And Wait for element by id "nlb-title" to appear
    And Assert transactions shown in dashboard are the same as in key "payments_purposes"

    Then Swipe vertical
    And Click on element by text "New payment"
    And Wait for element by text "Debtor"
    And Go Back
    And Wait for My NLB screen to load
    And Swipe vertical
    And Assert element by contains text "IPS QR"
#    And Click on element by text "IPS QR"
#    And Wait for element by text "Import from gallery"
#    And Go Back
#    And Wait for My NLB screen to load
#    And Swipe vertical
    And Click on element by text "Currency exchange"
    And Wait for element by text "From"
    And Go Back
    And Wait for element by contains text "Yes"
    And Click on element by text "Yes"
    And Wait for My NLB screen to load
    And Assert element by text "My NLB"
    And Assert element by text "My Products"
    And Assert element by text "Pay"
    And Assert element by text "Cards"
    And Assert element by text "More"


    Examples:
      | rowindex |
      | 4        |