Feature: Manage_Products

#  @Manage_Products-Hide/Show_account_on_Product_List_[MOB_ANDROID]
#  Scenario Outline: Manage_Products-Hide/Show_account_on_Product_List_[MOB_ANDROID]
#
#    Given Open Application
#    And Select User from Excel "<rowindex>" columnName "username" and login
#    And Wait for My NLB screen to load
#
#    And Click on Bottom navigation button "My Products"
#    And Wait for element by id "nlb-button-edit-products" to appear
#    And Assert element by contains text "Edit list"
#    And Click on element by text "Edit list"
#    And Scroll until element with BBAN from Excel "<rowindex>" columnName "currentDomesticAccountBBAN" is in the view
#    And Hide product card from Excel "<rowindex>" columnName "currentDomesticAccountBBAN"
#    And Scroll until element with BBAN from Excel "<rowindex>" columnName "personal_account_iban" is in the view
#    And Hide product card from Excel "<rowindex>" columnName "personal_account_iban"
#    And Scroll until element with BBAN from Excel "<rowindex>" columnName "saving_account_number" is in the view
#    And Hide product card from Excel "<rowindex>" columnName "saving_account_number"
#    And Scroll until element with BBAN from Excel "<rowindex>" columnName "term_deposit_number" is in the view
#    And Hide product card from Excel "<rowindex>" columnName "term_deposit_number"
#    And Scroll until element with BBAN from Excel "<rowindex>" columnName "loan_account_number" is in the view
#    And Hide product card from Excel "<rowindex>" columnName "loan_account_number"
#
#    #Saving accounts
#    And Scroll until element with BBAN from Excel "<rowindex>" columnName "saving_account_number" is in the view
#    And Hide product card from Excel "<rowindex>" columnName "saving_account_number"
#    And Assert that product card from Excel "<rowindex>" columnName "saving_account_number" is hidden
#    And Click on element by desc "Back"
#    And Assert that product card with BBAN from Excel "<rowindex>" columnName "saving_account_number" is not shown
#
#    And Click on Bottom navigation button "My NLB"
#    And Click on Bottom navigation button "My Products"
#    And Wait for element by id "nlb-button-edit-products" to appear
#    And Assert element by contains text "Edit list"
#    And Click on element by text "Edit list"
#
#    #Term deposit
#    And Scroll until element with BBAN from Excel "<rowindex>" columnName "term_deposit_number" is in the view
#    And Hide product card from Excel "<rowindex>" columnName "term_deposit_number"
#    And Assert that product card from Excel "<rowindex>" columnName "term_deposit_number" is hidden
#    And Click on element by desc "Back"
#    And Assert that product card with BBAN from Excel "<rowindex>" columnName "term_deposit_number" is not shown
#
#    And Click on Bottom navigation button "My NLB"
#    And Click on Bottom navigation button "My Products"
#    And Wait for element by id "nlb-button-edit-products" to appear
#    And Assert element by contains text "Edit list"
#    And Click on element by text "Edit list"
#
#     #Card
#    And Scroll until element with text from Excel "<rowindex>" columnName "credit_card_name" is in the view
#    And Hide product card from Excel "<rowindex>" columnName "credit_card_name"
#    And Assert that product card from Excel "<rowindex>" columnName "credit_card_name" is hidden
#    And Click on element by desc "Back"
#    And Assert that product card with BBAN from Excel "<rowindex>" columnName "credit_card_name" is not shown
#
#    And Click on Bottom navigation button "My NLB"
#    And Click on Bottom navigation button "My Products"
#    And Wait for element by id "nlb-button-edit-products" to appear
#    And Assert element by contains text "Edit list"
#    And Click on element by text "Edit list"
#
#    And Scroll until element with BBAN from Excel "<rowindex>" columnName "saving_account_number" is in the view
#    And Show product card from Excel "<rowindex>" columnName "saving_account_number"
#    And Scroll until element with BBAN from Excel "<rowindex>" columnName "credit_card_name" is in the view
#    And Show product card from Excel "<rowindex>" columnName "credit_card_name"
#    And Scroll until element with BBAN from Excel "<rowindex>" columnName "term_deposit_number" is in the view
#    And Show product card from Excel "<rowindex>" columnName "term_deposit_number"
#
#    Examples:
#      | rowindex |
#      |        1 |


#  @Manage_Products_Hide/Show_account_on_Product_List_[MOB_ANDROID]
#  Scenario Outline: Manage_Products_Hide/Show_account_on_Product_List_[MOB_ANDROID]
#
#    Given Open Application
#    And Select User from Excel "<rowindex>" columnName "username" and login
#    And Wait for element by resource id "nlb-bottom-nav-button" to appear
#
#    When Click "My Products"
#    And Wait for element by text "Edit list"
#    And Click on element by desc "Edit list"
#    And Wait for element by text "Set favorite account"
#    And Unhide all products except card
#
##    And Scroll up until element with text from excel "<rowindex>" columnName "currentDomesticAccountBBAN" is in view
#    And Swipe vertical up
#    And Swipe vertical up
#    And Hide account from Excel "<rowindex>" columnName "currentDomesticAccountBBAN"
#    And Hide account from Excel "<rowindex>" columnName "personal_account_iban"
##    And Hide account from Excel "<rowindex>" columnName "credit_card_2_number"
#    And Hide account from Excel "<rowindex>" columnName "saving_account_number"
#    And Hide account from Excel "<rowindex>" columnName "term_deposit_number"
#    And Hide account from Excel "<rowindex>" columnName "loan_account_number"
#
#    Then Click on element by desc "Back"
#    And Wait for first product in My products page
#    And Assert account from excel "<rowindex>" columnName "currentDomesticAccountBBAN" is not displayed
#    And Assert account from excel "<rowindex>" columnName "personal_account_iban" is not displayed
##    And Assert account from excel "<rowindex>" columnName "credit_card_2_number" is not displayed
#    And Swipe vertical
#    And Assert account from excel "<rowindex>" columnName "saving_account_number" is not displayed
#    And Assert account from excel "<rowindex>" columnName "term_deposit_number" is not displayed
#    And Swipe vertical
#    And Swipe vertical
#    And Assert account from excel "<rowindex>" columnName "loan_account_number" is not displayed
#    And Click on element by text "My NLB"
#    And Click on element by text "My Products"
#    And Wait for element by text "Edit list"
#    And Click on element by id "nlb-button-edit-products" and contains text "Edit list"
#    And Wait element "Set favorite account" by text
#    And Unhide all products except card
#
#    Examples:
#      | rowindex |
#      |        1 |