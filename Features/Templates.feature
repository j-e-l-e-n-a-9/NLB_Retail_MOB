Feature: Templates

  @Payments_Recipient_Template_List_[MOB_ANDROID]
  Scenario Outline: Payments_Recipient_Template_List_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load

    When Click on Bottom navigation button "Pay"
    And Wait for Past payments button in Pay screen
    And Click on element by text "Templates"
    And Wait for element by id "nlb_search_text_field" to appear
    And Assert screen header is "Templates"
    And Assert back button in screen "Templates"
    And Remember number of templates under key "keyNumberOfTemplates"

    And Assert number of Template icons is same number as number of Templates under key "keyNumberOfTemplates"
    And Assert number of Template names is same number as number of Templates under key "keyNumberOfTemplates"
    And Assert number of Template account numbers is same number as number of Templates under key "keyNumberOfTemplates"
    And Assert section letters are sorted by alphabetical order in Templates
    And Enter text "C" in element id "nlb_search_text_field"
    And Assert element "nlb_search_row_close_button" by id
    And Assert number of Template account numbers is same number as number of Templates under key "keyNumberOfTemplates"
    And Remember part of random template name and remember it under key "keySearchNamePrefix"
    And Remember part of random template account number and remember it under key "keyAccountNumberPrefix"
    And Enter text from text key "keySearchNamePrefix" in element by id "nlb_search_text_field"
    And Assert Templates list with index "2" has value under key "keySearchNamePrefix"
    And Enter text from text key "keyAccountNumberPrefix" in element by id "nlb_search_text_field"
    And Assert Templates list with index "3" has value under key "keyAccountNumberPrefix"
    And Click on element by id "nlb_search_row_close_button"
    And Assert number of Template account numbers is same number as number of Templates under key "keyNumberOfTemplates"
    And Click "Back" content description
    And Wait for element by text "Internal transfer"
    And Click on element by text "Domestic payment"
    And Wait for element by text "Debtor"
    And Click on element by id "nlb-button-alternate"
    And Wait for element by id "nlb_search_text_field" to appear

    Then Assert number of Template icons is same number as number of Templates under key "keyNumberOfTemplates"
    And Assert number of Template names is same number as number of Templates under key "keyNumberOfTemplates"
    And Assert number of Template account numbers is same number as number of Templates under key "keyNumberOfTemplates"
    And Assert section letters are sorted by alphabetical order in Templates
    And Enter text "C" in element id "nlb_search_text_field"
    And Assert element "nlb_search_row_close_button" by id
    And Assert number of Template account numbers is same number as number of Templates under key "keyNumberOfTemplates"
    And Remember part of random template name and remember it under key "keySearchNamePrefix"
    And Remember part of random template account number and remember it under key "keyAccountNumberPrefix"
    And Enter text from text key "keySearchNamePrefix" in element by id "nlb_search_text_field"
    And Assert Templates list with index "2" has value under key "keySearchNamePrefix"
    And Enter text from text key "keyAccountNumberPrefix" in element by id "nlb_search_text_field"
    And Assert Templates list with index "3" has value under key "keyAccountNumberPrefix"
    And Click on element by id "nlb_search_row_close_button"
    And Assert number of Template account numbers is same number as number of Templates under key "keyNumberOfTemplates"

    Examples:
      | rowindex |
      |        7 |