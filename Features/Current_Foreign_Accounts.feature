Feature: Current_Foreign_Accounts



  @Current_Foreign_Accounts-Product_Details-Financial-Details_Is_Not_Visible_[MOB_ANDROID]
  Scenario Outline: Current_Foreign_Accounts-Product_Details-Financial-Details_Is_Not_Visible_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear

    And Scroll until element with IBAN from Excel "<rowindex>" columnName "second_personal_account_bban" is in the view
    When Click on element by text from excel "<rowindex>" columnName "second_personal_account_bban"
    And Assert element by contains text "Transactions"
    And Assert element "nlb-icon-button" by id
    
    And Click on element by text "Details"
    And Wait for element by text "Account details"
    And Assert nlb-product-details-card by text "Financial details" is not visible


    Examples:
      | rowindex |
      |        1 |

   @Current_Foreign_Accounts_Product_Details_Acccount_Details_[MOB_ANDROID]
   Scenario Outline: Current_Foreign_Accounts_Product_Details_Acccount_Details_[MOB_ANDROID]
     Given Open Application
     And Select User from Excel "<rowindex>" columnName "username" and login
     And Wait for My NLB screen to load
     And Click on Bottom navigation button "My Products"
     And Wait for element by id "nlb-button-edit-products" to appear

     And Scroll until element with IBAN from Excel "<rowindex>" columnName "second_personal_account_bban" is in the view
     When Click on element by text from excel "<rowindex>" columnName "second_personal_account_bban"
     And Assert element by contains text "Details"
     And Click on element by text "Details"
     And Wait for element by text "Account details"
     And Assert element by content desc "Copy account details"
     And Assert element by text "Account details"
     And Assert that text "Account type" has first following sibling that contains text "Current account"
     And Assert that text "Account owner" has first following sibling that contains from Excel "<rowindex>" columnName "username"
     And Assert that text "Account number" has first following sibling that contains from Excel "<rowindex>" columnName "second_personal_account_bban"
     And Assert that text "IBAN" has first following sibling that contains from Excel "<rowindex>" columnName "second_personal_account_bban"
     And Assert that text "BIC" has first following sibling that contains text "KOBBRSBG"

   Examples:
     | rowindex |
     |        1 |