Feature: Current_Foreign_Accounts



  @Current_Foreign_Accounts-Product_Details-Financial-Details_Is_Not_Visible_[MOB_ANDROID]
  Scenario Outline: Current_Foreign_Accounts-Product_Details-Financial-Details_Is_Not_Visible_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear

    When Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Assert element by contains text "Transactions"
    And Assert element "nlb-icon-button" by id
    
    And Click on element by text "Details"
    And Assert nlb-product-details-card by text "Financial details" is not visible


    Examples:
      | rowindex |
      |        2 |
