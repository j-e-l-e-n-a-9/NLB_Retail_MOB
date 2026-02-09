Feature: Manage_Products

@Manage_Products-Hide/Show_account_on_Product_List_[MOB_ANDROID]
Scenario Outline: Manage_Products-Hide/Show_account_on_Product_List_[MOB_ANDROID]
#TODO kad se sakrije racun, provjeriti svuda da se ne pojavljuje, ne samo u my products
Given Open Application
And Select User from Excel "<rowindex>" columnName "username" and login
And Wait for My NLB screen to load

And Click on Bottom navigation button "My Products"
And Wait for element by id "nlb-button-edit-products" to appear
And Assert element by contains text "Edit list"
And Click on element by text "Edit list"

    #Saving accounts
And Scroll until element with BBAN from Excel "<rowindex>" columnName "saving_account_bban" is in the view
And Hide product card from Excel "<rowindex>" columnName "saving_account_bban"
And Assert that product card from Excel "<rowindex>" columnName "saving_account_bban" is hidden
And Click on element by desc "Back"
And Assert that product card with BBAN from Excel "<rowindex>" columnName "saving_account_bban" is not shown

And Click on Bottom navigation button "My NLB"
And Click on Bottom navigation button "My Products"
And Wait for element by id "nlb-button-edit-products" to appear
And Assert element by contains text "Edit list"
And Click on element by text "Edit list"



    #Term deposit
And Scroll until element with BBAN from Excel "<rowindex>" columnName "term_deposit_bban" is in the view
And Hide product card from Excel "<rowindex>" columnName "term_deposit_bban"
And Assert that product card from Excel "<rowindex>" columnName "term_deposit_bban" is hidden
And Click on element by desc "Back"
And Assert that product card with BBAN from Excel "<rowindex>" columnName "term_deposit_bban" is not shown

And Click on Bottom navigation button "My NLB"
And Click on Bottom navigation button "My Products"
And Wait for element by id "nlb-button-edit-products" to appear
And Assert element by contains text "Edit list"
And Click on element by text "Edit list"

     #Card
And Scroll until element with text from Excel "<rowindex>" columnName "credit_card_name" is in the view
And Hide product card from Excel "<rowindex>" columnName "credit_card_name"
And Assert that product card from Excel "<rowindex>" columnName "credit_card_name" is hidden
And Click on element by desc "Back"
And Assert that product card with BBAN from Excel "<rowindex>" columnName "credit_card_name" is not shown

And Click on Bottom navigation button "My NLB"
And Click on Bottom navigation button "My Products"
And Wait for element by id "nlb-button-edit-products" to appear
And Assert element by contains text "Edit list"
And Click on element by text "Edit list"

And Scroll until element with BBAN from Excel "<rowindex>" columnName "saving_account_bban" is in the view
And Show product card from Excel "<rowindex>" columnName "saving_account_bban"
And Scroll until element with BBAN from Excel "<rowindex>" columnName "credit_card_name" is in the view
And Show product card from Excel "<rowindex>" columnName "credit_card_name"
And Scroll until element with BBAN from Excel "<rowindex>" columnName "term_deposit_bban" is in the view
And Show product card from Excel "<rowindex>" columnName "term_deposit_bban"

Examples:
| rowindex |
|        1 |