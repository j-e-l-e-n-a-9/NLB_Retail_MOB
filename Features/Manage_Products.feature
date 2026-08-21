Feature: Manage_Products

  @Manage_Products_Nickname_Product_[MOB_ANDROID]
  Scenario Outline: Manage_Products_Nickname_Product_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click "My Products"
    And Wait for element by text "Edit list"
    And Click on element by id "nlb-button-edit-products"
    And Wait for element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Wait "1" seconds

    #Tekući račun
    When Click on Edit button for account from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Click on element by contains content description "Clear"
    And Enter text "tekuci racun test" in Rename product input field
    And Click on element by contains text "Apply"
    And Wait "1" seconds
    # Devizni platni račun
    And Scroll until element with text from Excel "<rowindex>" columnName "personal_account_iban" is in the view
    And Click on Edit button for account from excel "<rowindex>" columnName "personal_account_iban"
    And Click on element by contains content description "Clear"
    And Enter text "devizni racun test" in Rename product input field
    And Click on element by contains text "Apply"
    And Wait "1" seconds
    # Visa Premium
    And Scroll until element with text from Excel "<rowindex>" columnName "credit_card_number" is in the view
    And Click on Edit button for account from excel "<rowindex>" columnName "credit_card_number"
    And Click on element by contains content description "Clear"
    And Enter text "visa premium test" in Rename product input field
    And Click on element by contains text "Apply"
    And Wait "1" seconds
    # A vista depozitni račun
    And Scroll until element with text from Excel "<rowindex>" columnName "saving_account_number" is in the view
    And Click on Edit button for account from excel "<rowindex>" columnName "saving_account_number"
    And Click on element by contains content description "Clear"
    And Enter text "a vista depozitni test" in Rename product input field
    And Click on element by contains text "Apply"
    And Wait "1" seconds
    # Oročeni depozit
    And Scroll until element with text from Excel "<rowindex>" columnName "term_deposit_number" is in the view
    And Click on Edit button for account from excel "<rowindex>" columnName "term_deposit_number"
    And Click on element by contains content description "Clear"
    And Enter text "oroceni depozit test" in Rename product input field
    And Click on element by contains text "Apply"
    And Wait "1" seconds
    # Gotovinski kredit
    And Scroll until element with text from Excel "<rowindex>" columnName "loan_account_number" is in the view
    And Click on Edit button for account from excel "<rowindex>" columnName "loan_account_number"
    And Click on element by contains content description "Clear"
    And Enter text "kredit test" in Rename product input field
    And Click on element by contains text "Apply"
    And Wait "1" seconds

    And Click "Back" content description
    And Wait for first product in My products page

    #assertions in product page
    And Scroll until element with text from Excel "<rowindex>" columnName "currentDomesticAccountBBAN" is in the view
    And Assert account number from Excel "<rowindex>" columnName "currentDomesticAccountBBAN" has name "tekuci racun test"

    And Scroll until element with text from Excel "<rowindex>" columnName "personal_account_iban" is in the view
    And Assert account number from Excel "<rowindex>" columnName "personal_account_iban" has name "devizni racun test"

    And Scroll until element with text from Excel "<rowindex>" columnName "credit_card_number" is in the view
    And Assert account number from Excel "<rowindex>" columnName "credit_card_number" has name "visa premium test"

    And Scroll until element with text from Excel "<rowindex>" columnName "saving_account_number" is in the view
    And Assert account number from Excel "<rowindex>" columnName "saving_account_number" has name "a vista depozitni test"

    And Scroll until element with text from Excel "<rowindex>" columnName "term_deposit_number" is in the view
    And Assert account number from Excel "<rowindex>" columnName "term_deposit_number" has name "oroceni depozit test"

    And Scroll until element with text from Excel "<rowindex>" columnName "loan_account_number" is in the view
    And Assert account number from Excel "<rowindex>" columnName "loan_account_number" has name "kredit test"

    # restoring on default names of products
    Then Scroll up until element with text "Edit list" is in view
    And Wait for element by text "Edit list"
    And Wait "1" seconds
    And Click on element by id "nlb-button-edit-products"
    And Wait element by contains Content desc "Hide Account" for "3" seconds

    # Tekući račun
    And Scroll until element with text from Excel "<rowindex>" columnName "currentDomesticAccountBBAN" is in the view
    And Click on Edit button for account from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Click on element by contains content description "Clear"
    And Click on element by contains text "Apply"
    And Wait "1" seconds
    # Devizni platni račun
    And Scroll until element with text from Excel "<rowindex>" columnName "personal_account_iban" is in the view
    And Click on Edit button for account from excel "<rowindex>" columnName "personal_account_iban"
    And Click on element by contains content description "Clear"
    And Click on element by contains text "Apply"
    And Wait "1" seconds
    # Visa Premium
    And Scroll until element with text from Excel "<rowindex>" columnName "credit_card_number" is in the view
    And Click on Edit button for account from excel "<rowindex>" columnName "credit_card_number"
    And Click on element by contains content description "Clear"
    And Click on element by contains text "Apply"
    And Wait "1" seconds
    # A vista depozitni račun
    And Scroll until element with text from Excel "<rowindex>" columnName "term_deposit_number" is in the view
    And Click on Edit button for account from excel "<rowindex>" columnName "term_deposit_number"
    And Click on element by contains content description "Clear"
    And Click on element by contains text "Apply"
    And Wait "1" seconds
    # Oročeni depozit
    And Scroll until element with text from Excel "<rowindex>" columnName "term_deposit_number" is in the view
    And Click on Edit button for account from excel "<rowindex>" columnName "term_deposit_number"
    And Click on element by contains content description "Clear"
    And Click on element by contains text "Apply"
    And Wait "1" seconds
    # Gotovinski kredit
    And Scroll until element with text from Excel "<rowindex>" columnName "loan_account_number" is in the view
    And Click on Edit button for account from excel "<rowindex>" columnName "loan_account_number"
    And Click on element by contains content description "Clear"
    And Click on element by contains text "Apply"


    Examples:
      | rowindex |
      | 8        |





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
#    And Unhide all products
#
##    And Scroll up until element with text from excel "<rowindex>" columnName "currentDomesticAccountBBAN" is in view
#    And Swipe vertical up
#    And Swipe vertical up
#    And Hide account from Excel "<rowindex>" columnName "currentDomesticAccountBBAN"
#    And Hide account from Excel "<rowindex>" columnName "personal_account_iban"
#    And Hide account from Excel "<rowindex>" columnName "credit_card_number"
#    And Hide account from Excel "<rowindex>" columnName "saving_account_number"
#    And Hide account from Excel "<rowindex>" columnName "term_deposit_number"
#    And Hide account from Excel "<rowindex>" columnName "loan_account_number"
#
#    Then Click on element by desc "Back"
#    And Wait for first product in My products page
#    And Assert account from excel "<rowindex>" columnName "currentDomesticAccountBBAN" is not displayed
#    And Assert account from excel "<rowindex>" columnName "personal_account_iban" is not displayed
#    And Assert account from excel "<rowindex>" columnName "credit_card_number" is not displayed
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
#    And Unhide all products
#
#    Examples:
#      | rowindex |
#      |        1 |