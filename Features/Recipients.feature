Feature: Recipients

  @Payments_Recipient_Edit_Recipient_[MOB_ANDROID]
  Scenario Outline: Payments_Recipient_Edit_Recipient_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load

    When Click on Bottom navigation button "Pay"
    And Wait for Past payments button in Pay screen
    And Click on Review and edit button "Recipients" in Pay screen
    And Wait for first recipient
    And Remember recipient name under key "nameOfFirstRecipientKey" in Select recipient by index "1"
    And Remember recipient account number under key "accountNumberOfFirstRecipientKey" in Select recipient by index "1"
    And Click on Recipient with index "1" in Recipients screen
    And Assert element by text "Delete"
    And Assert element by text "Edit"
    And Assert element by text "Pay"
    And Click on element by text "Edit"

    And Assert screen header is "Edit recipient"
    And Assert back button in screen "Edit recipient"
    And Assert element by text "Name"
    And Send random text to field with id "nlb-input-recipient-name" and remember it under key "keyName"
    And Assert element by text "Street and street number"
    And Send random text to field with id "nlb-input-recipient-address" and remember it under key "keyAddress"
    And Assert element by text "City"
    And Send random text to field with id "nlb-input-recipient-city" and remember it under key "keyCity"
    And Assert element by text "Country"
    And Assert element "nlb-input-recipient-country" by id
    And Assert element by id "nlb-button-text" that has descendant text "Cancel"
    And Assert element by id "nlb-button-primary" that has descendant text "Save"
    And Click on element by id "nlb-button-primary"
    And Wait "2" seconds
    And Assert element by text from key "keyName" is displayed
    And Assert element by text "Address" has first following sibling that contains value from key "keyAddress"
    And Assert element by text "Address" has first following sibling that contains value from key "keyCity"
    And Click "Back" content description
    And Wait for first recipient

    Then Scroll down until element with text from key "accountNumberOfFirstRecipientKey" is in view
    And Assert element by text from key "nameOfFirstRecipientKey" is not displayed
    And Assert element by text from key "accountNumberOfFirstRecipientKey" is displayed
    And Assert element by text from key "keyName" is displayed
    And Click "Back" content description
    And Wait for Past payments button in Pay screen
    And Click on element by text "Domestic payment"
    And Wait for element by id "nlb-input-creditor-account" to appear
    And Click on element by id "nlb-button-alternate"
    And Wait for element by id "nlb_search_text_field" to appear
    And Click on "Select recipient" option in Select recipient page
    And Wait for first recipient
    And Scroll down until element with text from key "accountNumberOfFirstRecipientKey" is in view
    And Assert element by text from key "nameOfFirstRecipientKey" is not displayed
    And Assert element by text from key "keyName" is displayed

    Examples:
      | rowindex |
      |        5 |