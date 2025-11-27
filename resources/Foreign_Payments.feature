Feature: Foreign_Payments

  @Payments_Foreign_Payments-Input_[MOB_ANDROID]
  Scenario Outline: Payments_Foreign_Payments-Input_[MOB_ANDROID]
    #C71298,C71300
    #BUG ima dosta samo stavi retest i idi dalje, review prolazi

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "united_kingdom_iban" in element id "nlb-input-account-number"
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by text "Who will cover the payment cost?" to appear for "60" seconds
    And Assert element by text "Who will cover the payment cost?"
    And Assert element by text "Cost of payment will be shared."
    And Assert element by text "Either you or recipient will cover the entire cost of payment."
    And Click on element by text "Either you or recipient will cover the entire cost of payment."
    And Click on element by text "Apply"
    And Wait for element by id "nlb-input-recipient-name" to appear

    Then Assert element by text "Foreign payment"
    And Assert element by contains text "Check data and choose"
    And Assert element by text "Debtor"
    And Assert Debtor in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "personal_account_name" and iban "personal_account_iban"
    And Assert element by text "Recipient"
    And Assert element by text "Recipient details"
    And Assert element by text "First and last name / Company name"

    And Enter text "ABCDEFGHIJKLMNOPQRSTUVWXYZČĆŽŠĐ0123456789/-?:().,'&" in element id "nlb-input-recipient-name"
    And Assert text "ABCDEFGHIJKLMNOPQRSTUVWXYZČĆŽŠĐ0123456789/-?:().,'&" in element id "nlb-input-recipient-name"
    And Enter text "GBCONTACT" in element id "nlb-input-recipient-name" with clear

    And Enter text "ABCDEFGHIJKLMNOPQRSTUVWXYZČĆŽŠĐ0123456789/-?:().,'&" in element id "nlb-input-recipient-address"
    And Assert text "ABCDEFGHIJKLMNOPQRSTUVWXYZČĆŽŠĐ0123456789/-?:().,'&" in element id "nlb-input-recipient-address"
    And Enter text "TEST" in element id "nlb-input-recipient-address" with clear

    And Enter text "ABCDEFGHIJKLMNOPQRSTUVWXYZČĆŽŠĐ0123456789/-?:().,'&" in element id "nlb-input-recipient-city"
    And Assert text "ABCDEFGHIJKLMNOPQRSTUVWXYZČĆŽŠĐ0123456789/-?:().,'&" in element id "nlb-input-recipient-city"
    And Enter text "TEST" in element id "nlb-input-recipient-city" with clear

    And Swipe vertical

    And Click on element by id "nlb-input-recipient-country-click-area"
    And Wait for element by text "AFGHANISTAN" to appear for "60" seconds
    And Enter text "UNITED KINGDOM" into search field for country selection
    And Click second element with text "UNITED KINGDOM"

    And Assert element by text "Bank information"

    And Assert element by text "Bank name (optional)"
    And Enter text "ABCDEFGHIJKLMNOPQRSTUVWXYZČĆŽŠĐ0123456789/-?:().,'&" in element id "nlb-input-bank-name"
    And Assert text "ABCDEFGHIJKLMNOPQRSTUVWXYZČĆŽŠĐ0123456789/-?:().,'&" in element id "nlb-input-bank-name"
    And Enter text "TEST" in element id "nlb-input-bank-name" with clear

    And Assert element by text "Bank street and street number (optional)"
    And Enter text "ABCDEFGHIJKLMNOPQRSTUVWXYZČĆŽŠĐ0123456789/-?:().,'&" in element id "nlb-input-bank-address"
    And Assert text "ABCDEFGHIJKLMNOPQRSTUVWXYZČĆŽŠĐ0123456789/-?:().,'&" in element id "nlb-input-bank-address"
    And Enter text "TEST" in element id "nlb-input-bank-address" with clear

    And Assert element by text "Post number and city (optional)"
    And Enter text "ABCDEFGHIJKLMNOPQRSTUVWXYZČĆŽŠĐ0123456789/-?:().,'&" in element id "nlb-input-bank-city"
    And Assert text "ABCDEFGHIJKLMNOPQRSTUVWXYZČĆŽŠĐ0123456789/-?:().,'&" in element id "nlb-input-bank-city"
    And Enter text "TEST" in element id "nlb-input-bank-city" with clear

    And Assert element by text "Country (optional)"
    And Click on element by id "nlb-input-bank-country-click-area"
    And Wait for element by text "AFGHANISTAN" to appear for "60" seconds
    And Enter text "UNITED KINGDOM" into search field for country selection
    And Click second element with text "UNITED KINGDOM"

    And Assert element by text "Additional info for the bank (optional)"
    And Enter text "ABCDEFGHIJKLMNOPQRSTUVWXYZČĆŽŠĐ0123456789/-?:().,'&" in element id "nlb-input-bank-additional-info"
    And Assert text "ABCDEFGHIJKLMNOPQRSTUVWXYZČĆŽŠĐ0123456789/-?:().,'&" in element id "nlb-input-bank-additional-info"
    And Enter text "TEST" in element id "nlb-input-bank-additional-info" with clear

    And Assert element by text "SWIFT (BIC) code"
    And Assert text "BARCGB22" in element id "nlb-input-bank-swift-code"

    And Swipe vertical
    And Assert element "nlb-checkbox-update-recipient" by id
    And Assert element by text "Save recipient"

    And Assert element by text "Payment"
    And Assert element by text "In order to continue all input fields must be filled."

    And Assert element by text "Payment amount"
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Enter text "20" in element id "nlb-amount-with-currency-field"

    And Assert element by text "Purpose"
    And Enter text "ABCDEFGHIJKLMNOPQRSTUVWXYZČĆŽŠĐ0123456789/-?:().,'&" in element id "nlb-input-purpose"
    And Assert text "ABCDEFGHIJKLMNOPQRSTUVWXYZČĆŽŠĐ0123456789/-?:().,'&" in element id "nlb-input-purpose"
    And Enter text "TESTING" in element id "nlb-input-purpose" with clear
    And Scroll down until element with text "Next" is in view

    And Assert element by text "Payer of expenditure"
    And Assert element by text "SHA - Costs are shared between creditor and debtor"
    And Click "Expand dropdown menu" content description from tag "ImageView"
    And Assert element by text "BEN - All fees paid by creditor"
    And Assert element by text "OUR - All fees paid by debtor"
    And Click on element by text "SHA - Costs are shared between creditor and debtor"
    #And Assert text "Costs of the expenditure" in element id "nlb-hint-text-link"
    And Assert text "Costs of the expenditure" in element id "nlb-info-link-payer-of-expenditure"
    #Ovaj id je trenutno samo na tst

    And Assert element by text "Payment date"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"

    And Assert element "nlb-checkbox-urgent-payment" by id
    And Assert element by text "Urgent payment"

    #And Assert text "Faster payment execution" in element id "nlb-hint-link-urgent-payment" Ovaj id je trenutno samo na tst
    And Assert element by contains text "Faster payment execution"

    And Scroll down until element with text "Next" is in view
    And Click on element by text "Next"
    And Wait for element by text "Payment amount" to appear for "60" seconds

    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "20,00 EUR"
    And Assert that text "Debited amount" has first following sibling with text "20,00 EUR"
    #And Assert that text "Fee" has first following sibling with text "7,00 EUR"
    And Assert element by text "Debtor"
    #And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_review"
    And Assert that text "First and last name / Company name" has first following sibling that contains from Excel "<rowindex>" columnName "user_name_short"
    #And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "united_kingdom_name"
    And Assert that second text "Address" has first following sibling with text from Excel "<rowindex>" columnName "united_kingdom_full_address_payment_preview"
    And Swipe vertical
    And Assert that text "Debtor account number" has first following sibling with text from Excel "<rowindex>" columnName "united_kingdom_iban"
    And Assert that text "Bank name" has first following sibling with text from Excel "<rowindex>" columnName "united_kingdom_bank_name_payment_preview"
    And Assert that text "Bank address" has first following sibling with text from Excel "<rowindex>" columnName "united_kingdom_bank_address_payment_preview"
    And Assert that text "Additional information for bank" has first following sibling with text from Excel "<rowindex>" columnName "united_kingdom_additional_info_payment_preview"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "BARCGB22"
    And Swipe vertical
    And Assert element by text "Payment"
    And Assert that text "Purpose" has first following sibling with text "TESTING"
    And Assert that text "Payee of expenditure" has first following sibling with text "SHA"
    And Assert that text "Payment date" has first following sibling with current date in format "d.M.yyyy"
    And Assert that text "Urgent payment" has first following sibling with text "No"


    Examples:
      | rowindex |
      |        4 |

  @Payments_Foreign_Payments-Input-invalid_[MOB_ANDROID]
  Scenario Outline: Payments_Foreign_Payments-Input-invalid_[MOB_ANDROID]
    #Ovaj test je napravljen da padne
      # Postoji bug gde info za recipienta nema dodatu limitaciju na 35 karaktera vec na 70
      # Postoji bug gde za bank info nema greske

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "united_kingdom_iban" in element id "nlb-input-account-number"
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by text "Who will cover the payment cost?" to appear for "60" seconds
    And Assert element by text "Who will cover the payment cost?"
    And Assert element by text "Cost of payment will be shared."
    And Assert element by text "Either you or recipient will cover the entire cost of payment."
    And Click on element by text "Either you or recipient will cover the entire cost of payment."
    And Click on element by text "Apply"
    And Wait for element by id "nlb-input-recipient-name" to appear

    Then Enter text "_" in element id "nlb-input-recipient-name"
    And Assert element by contains text with special characters "Please use the following characters: A B C D E F G H I J K L M N O P Q R S T U V W X Y Z Č Ć Ž Š Đ 0 1 2 3 4 5 6 7 8 9 / - ? : ( ) . , ' & - space"
    And Enter text "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" in element id "nlb-input-recipient-name"
    And Assert element by text "Maximum number of characters is 35."
    And Enter text "" in element id "nlb-input-recipient-name"
    And Assert element by text "First and last name / Company name is required"
    And Enter text "TESTNAME" in element id "nlb-input-recipient-name"

    And Enter text "_" in element id "nlb-input-recipient-address"
    And Assert element by contains text with special characters "Please use the following characters: A B C D E F G H I J K L M N O P Q R S T U V W X Y Z Č Ć Ž Š Đ 0 1 2 3 4 5 6 7 8 9 / - ? : ( ) . , ' & - space"
    And Enter text "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" in element id "nlb-input-recipient-address"
    And Assert element by text "Maximum number of characters is 35."
    And Enter text "" in element id "nlb-input-recipient-address"
    And Assert element by text "Address is required"
    And Enter text "TEST" in element id "nlb-input-recipient-address"

    And Enter text "_" in element id "nlb-input-recipient-city"
    And Assert element by contains text with special characters "Please use the following characters: A B C D E F G H I J K L M N O P Q R S T U V W X Y Z Č Ć Ž Š Đ 0 1 2 3 4 5 6 7 8 9 / - ? : ( ) . , ' & - space"
    And Enter text "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" in element id "nlb-input-recipient-city"
    And Assert element by text "Maximum number of characters is 35."
    And Enter text "" in element id "nlb-input-recipient-city"
    And Assert element by text "City is required"
    And Enter text "TEST" in element id "nlb-input-recipient-city"

    And Swipe vertical


    And Enter text "_" in element id "nlb-input-bank-name"
    And Assert element by contains text with special characters "Please use the following characters: A B C D E F G H I J K L M N O P Q R S T U V W X Y Z Č Ć Ž Š Đ 0 1 2 3 4 5 6 7 8 9 / - ? : ( ) . , ' & - space"
    And Enter text "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" in element id "nlb-input-bank-name"
    And Assert element by text "Maximum number of characters is 35."
    And Enter text "TEST" in element id "nlb-input-bank-name"

    And Enter text "_" in element id "nlb-input-bank-address"
    And Assert element by contains text with special characters "Please use the following characters: A B C D E F G H I J K L M N O P Q R S T U V W X Y Z Č Ć Ž Š Đ 0 1 2 3 4 5 6 7 8 9 / - ? : ( ) . , ' & - space"
    And Enter text "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" in element id "nlb-input-bank-address"
    And Assert element by text "Maximum number of characters is 35."
    And Enter text "TEST" in element id "nlb-input-bank-address"

    And Enter text "_" in element id "nlb-input-bank-city"
    And Assert element by contains text with special characters "Please use the following characters: A B C D E F G H I J K L M N O P Q R S T U V W X Y Z Č Ć Ž Š Đ 0 1 2 3 4 5 6 7 8 9 / - ? : ( ) . , ' & - space"
    And Enter text "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" in element id "nlb-input-bank-city"
    And Assert element by text "Maximum number of characters is 35."
    And Enter text "TEST" in element id "nlb-input-bank-city"

    And Enter text "_" in element id "nlb-input-bank-additional-info"
    And Assert element by contains text with special characters "Please use the following characters: A B C D E F G H I J K L M N O P Q R S T U V W X Y Z Č Ć Ž Š Đ 0 1 2 3 4 5 6 7 8 9 / - ? : ( ) . , ' & - space"
    And Enter text "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" in element id "nlb-input-bank-additional-info"
    And Assert element by text "Maximum number of characters is 35."
    And Enter text "TEST" in element id "nlb-input-bank-additional-info"

    And Scroll down until element with text "In order to continue all input fields must be filled." is in view

    And Assert element by text "SWIFT (BIC) code"
    And Assert text "BARCGB22" in element id "nlb-input-bank-swift-code"
    And Enter text "" in element id "nlb-input-bank-swift-code"
    And Assert element by text "SWIFT (BIC) code is required."
    And Enter text "111111111111111111111111111111111111" in element id "nlb-input-bank-swift-code"
    And Assert element by text "Data must be 8 or 11 length (letters and numbers), first 6 must be characters."

    And Scroll down until element with text "Next" is in view

    And Enter text "_" in element id "nlb-input-purpose"
    And Assert element by contains text with special characters "Please use the following characters: A B C D E F G H I J K L M N O P Q R S T U V W X Y Z Č Ć Ž Š Đ 0 1 2 3 4 5 6 7 8 9 / - ? : ( ) . , ' & - space"
    And Enter text "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" in element id "nlb-input-purpose"
    And Assert element by contains text "Maximum number of characters is 140."
    And Enter text "" in element id "nlb-input-purpose"
    And Assert element by contains text "Purpose is required."
    And Enter text "TESTING" in element id "nlb-input-purpose"

    And Assert element "nlb-button-primary" by id is disabled
    Examples:
      | rowindex |
      |        4 |

  @Payments_Foreign_Payments_Cancel_Button_[MOB_ANDROID]_1
  Scenario Outline: Payments_Foreign_Payments_Cancel_Button_[MOB_ANDROID]_1

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "united_kingdom_iban" in element id "nlb-input-account-number"
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by text "Who will cover the payment cost?" to appear for "60" seconds
    And Click on element by text "Either you or recipient will cover the entire cost of payment - Foreign payment"
    And Click on element by text "Apply"
    And Wait for element by id "nlb-input-recipient-name" to appear
    And Assert element by text "Foreign payment"
    And Enter text "GBCONTACT" in element id "nlb-input-recipient-name"
    And Enter text "TEST" in element id "nlb-input-recipient-address"
    And Enter text "TEST" in element id "nlb-input-recipient-city"
    And Swipe vertical
    And Click on element by id "nlb-input-recipient-country-click-area"
    And Wait for element by text "AFGHANISTAN" to appear for "60" seconds
    And Enter text "UNITED KINGDOM" into search field for country selection
    And Click second element with text "UNITED KINGDOM"
    And Enter text "TEST" in element id "nlb-input-bank-name"
    And Enter text "TEST" in element id "nlb-input-bank-address"
    And Enter text "TEST" in element id "nlb-input-bank-city"
    And Assert element by text "Country (optional)"
    And Click on element by id "nlb-input-bank-country-click-area"
    And Wait for element by text "AFGHANISTAN" to appear for "60" seconds
    And Enter text "UNITED KINGDOM" into search field for country selection
    And Click second element with text "UNITED KINGDOM"
    And Enter text "TEST" in element id "nlb-input-bank-additional-info"
    And Scroll down until element with text "Next" is in view
    And Enter text "TESTING" in element id "nlb-input-purpose"
    And Click on element by text "Next"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"

    Then Scroll down until element with text "Cancel" is in view
    And Click on element by text "Cancel"
    And Assert element by text "Are you sure?"
    And Assert element by text "Cancelling now will terminate the payment process."
    And Assert element by text "No"
    And Assert element by text "Yes"
    And Click on element by text "No"
    And Assert element by text "Payment date"
    And Click on element by text "Cancel"
    And Click on element by text "Yes"
    And Assert element by text "Payments and transfers"


    Examples:
      | rowindex |
      |        4 |


  @Payments_Foreign_Payments_Cancel_Button_[MOB_ANDROID]_2
  Scenario Outline: Payments_Foreign_Payments_Cancel_Button_[MOB_ANDROID]_2

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "united_kingdom_iban" in element id "nlb-input-account-number"
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by text "Who will cover the payment cost?" to appear for "60" seconds
    And Click on element by text "Either you or recipient will cover the entire cost of payment - Foreign payment"
    And Click on element by text "Apply"
    And Wait for element by id "nlb-input-recipient-name" to appear
    And Assert element by text "Foreign payment"
    And Enter text "GBCONTACT" in element id "nlb-input-recipient-name"
    And Enter text "TEST" in element id "nlb-input-recipient-address"
    And Enter text "TEST" in element id "nlb-input-recipient-city"
    And Swipe vertical
    And Click on element by id "nlb-input-recipient-country-click-area"
    And Wait for element by text "AFGHANISTAN" to appear for "60" seconds
    And Enter text "UNITED KINGDOM" into search field for country selection
    And Click second element with text "UNITED KINGDOM"
    And Enter text "TEST" in element id "nlb-input-bank-name"
    And Enter text "TEST" in element id "nlb-input-bank-address"
    And Enter text "TEST" in element id "nlb-input-bank-city"
    And Assert element by text "Country (optional)"
    And Click on element by id "nlb-input-bank-country-click-area"
    And Wait for element by text "AFGHANISTAN" to appear for "60" seconds
    And Enter text "UNITED KINGDOM" into search field for country selection
    And Click second element with text "UNITED KINGDOM"
    And Enter text "TEST" in element id "nlb-input-bank-additional-info"
    And Scroll down until element with text "Next" is in view
    And Enter text "TESTING" in element id "nlb-input-purpose"

    Then Scroll down until element with text "Cancel" is in view
    And Click on element by text "Cancel"
    And Assert element by text "Are you sure?"
    And Assert element by text "Cancelling now will terminate the payment process."
    And Assert element by text "No"
    And Assert element by text "Yes"
    And Click on element by text "No"
    And Assert text "TESTING" in element id "nlb-input-purpose"
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Scroll up until element with text "Recipient details" is in view
    And Assert text "GBCONTACT" in element id "nlb-input-recipient-name"
    And Assert text "TEST" in element id "nlb-input-recipient-address"
    And Assert text "TEST" in element id "nlb-input-recipient-address"
    And Scroll down until element with text "Cancel" is in view
    And Click on element by text "Cancel"
    And Click on element by text "Yes"
    And Assert element by text "Payments and transfers"


    Examples:
      | rowindex |
      |        4 |

  @Payments_Foreign_Payments-Back_Button_[MOB_ANDROID]
  Scenario Outline: Payments_Foreign_Payments-Back_Button_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "united_kingdom_iban" in element id "nlb-input-account-number"
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by text "Who will cover the payment cost?" to appear for "60" seconds
    And Click on element by text "Either you or recipient will cover the entire cost of payment - Foreign payment"
    And Click on element by text "Apply"
    And Wait for element by id "nlb-input-recipient-name" to appear
    And Assert element by text "Foreign payment"
    And Enter text "GBCONTACT" in element id "nlb-input-recipient-name"
    And Enter text "TEST" in element id "nlb-input-recipient-address"
    And Enter text "TEST" in element id "nlb-input-recipient-city"
    And Swipe vertical
    And Click on element by id "nlb-input-recipient-country-click-area"
    And Wait for element by text "AFGHANISTAN" to appear for "60" seconds
    And Enter text "UNITED KINGDOM" into search field for country selection
    And Click second element with text "UNITED KINGDOM"
    And Enter text "TEST" in element id "nlb-input-bank-name"
    And Enter text "TEST" in element id "nlb-input-bank-address"
    And Enter text "TEST" in element id "nlb-input-bank-city"
    And Assert element by text "Country (optional)"
    And Click on element by id "nlb-input-bank-country-click-area"
    And Wait for element by text "AFGHANISTAN" to appear for "60" seconds
    And Enter text "UNITED KINGDOM" into search field for country selection
    And Click second element with text "UNITED KINGDOM"
    And Enter text "TEST" in element id "nlb-input-bank-additional-info"
    And Scroll down until element with text "Next" is in view
    And Enter text "TESTING" in element id "nlb-input-purpose"
    And Click on element by text "Next"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"

    Then Click "Back" content description from view tag "View"
    And Wait for element by text "Debtor" to appear for "60" seconds
    And Assert text "TESTING" in element id "nlb-input-purpose"
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert Debtor in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "personal_account_name" and iban "personal_account_iban"
    And Assert SEPA Recipient has icon "G" and from Excel "<rowindex>" account name "united_kingdom_name" and iban "united_kingdom_iban"
    And Click on element by text from excel "<rowindex>" columnName "united_kingdom_iban"
    And Assert text "GBCONTACT" in element id "nlb-input-recipient-name"
    And Assert text "TEST" in element id "nlb-input-recipient-address"
    And Assert text "TEST" in element id "nlb-input-recipient-address"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Enter data and payment type will be automatically selected on next step." to appear for "60" seconds
    And Assert text from excel "<rowindex>" columnName "united_kingdom_iban" in element by id "nlb-input-account-number"
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"


    Examples:
      | rowindex |
      |        4 |


  @Foreign_Payments_Payment_To_SI_Account-Foreign_Currency_Currency_Exists_On_The_Account
  Scenario Outline: Foreign_Payments_Payment_To_SI_Account-Foreign_Currency_Currency_Exists_On_The_Account
    #C76169

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    And Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Remember available balance in currency "EUR" under key "IT_001_Debtor_Balance_EUR"
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Remember available balance in currency "USD" under key "IT_001_Debtor_Balance_USD"
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-primary-balance" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer"
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "retail_recipient_iban" in element id "nlb-input-account-number"
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    #And Click "Expand dropdown menu" content description from view tag "View"
    #And Wait "30" seconds
    And Click on element by id "nlb-dropdown-menu"
    And Scroll down until currency "USD" in selector is found and click
    And Scroll down until element with id "nlb-button-primary" is in view
    And Click on element by text "Next"
    And Wait for element by text "Foreign payment"
    #Entering recipient info
    And Enter text "TESTNAME" in element id "nlb-input-recipient-name"
    And Enter text "TEST" in element id "nlb-input-recipient-address"
    And Enter text "TEST" in element id "nlb-input-recipient-city"
    #End of entering recipient info
    And Scroll down until element with id "nlb-input-bank-swift-code" is in view
    And Assert element by text "SWIFT (BIC) Code"
    And Assert text "LJBASI20XXX" in element id "nlb-input-bank-swift-code"
    And Scroll down until element with id "nlb-button-primary" is in view
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "USD"
    #And Assert that info message for currency conversion in second step of payment is of correct format
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "FP_001" in txt file
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 USD"
    And Assert that text "Debited amount" has first following sibling with text "10,00 USD"
    And Assert that text "Informative fee" has first following sibling with text "6,80 EUR"
    And Assert element by text "Debtor"
    And Assert that text "First and last name / Company name" has first following sibling that contains from Excel "<rowindex>" columnName "user_name_short"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_name"
    And Assert that second text "Address" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_full_address_payment_preview"
    And Scroll down until element with id "nlb-button-primary" is in view
    #And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Assert element by text "Payment"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "FP_001"
    And Assert that text "Payee of expenditure" has first following sibling with text "SHA"
    And Assert that text "Payment date" has first following sibling with current date in format "d.M.yyyy"
    And Assert that text "Urgent payment" has first following sibling with text "No"
    And Click on element by id "nlb-button-primary"
    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"
    And Wait "60" seconds
    And Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Check if current balance is lowered by "10" using balance from key "IT_001_Debtor_Balance_USD" for currency "USD"
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Check if current balance is lowered by "6.80" using balance from key "IT_001_Debtor_Balance_EUR" for currency "EUR"
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Click "Pay" content description from view tag "View"
    And Click on element by text "Past payments"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"
    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"
    And Scroll until element with text from txt file under key "FP_001" is in view and click
    And Wait for element by text "Recipient"

    Then Assert element by text "Payment details"
    And Assert element "nlb-date" by id has current date in format "d.M.yyyy"
    And Assert text under key "FP_001" from txt file in element id "nlb-title"
    And Assert text "USD" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "retail_recipient_name" in element by id "nlb-details"
    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_name_and_address_past_payment"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_iban"
    And Assert element by text "Creditor bank name" is not displayed
    And Assert element by text "Creditor bank address" is not displayed
    And Assert element by text "Additional creditor bank info" is not displayed
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Assert that text "Urgent payment" has first following sibling that contains text "No"
    And Scroll down until element with text "Executed" is in view
    And Assert that text "Payee of expenditure" has first following sibling that contains text "SHA"
    And Assert that text "Debit currency" has first following sibling that contains text "USD"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_details"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    #And Assert that text "Debtor address" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_payment_address"
    And Assert that text "Informative fee" has first following sibling with text "6,80 EUR"
    And Assert that text "Payment status" has first following sibling with text "Executed"


    Examples:
      | rowindex |
      |        4 |

  @Foreign_Payments_Payment_To_SI_Account-Foreign_Currency_Currency_Does_Not_Exist_On_The_Account
  Scenario Outline: Foreign_Payments_Payment_To_SI_Account-Foreign_Currency_Currency_Does_Not_Exist_On_The_Account
    #TODO uraditi kada poprave bug za placanje

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    And Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-id" to appear
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by text "Currency exchange"
    And Click "Currency exchange" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And Click on element by text "Check exchange rates"
    And Wait for element by id "nlb-exchange-buy" to appear
    And Store exchange "buy" for country "JAPAN" under key "FP_002_Buy_Currency" in txt file
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Check exchange rates"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Are you sure?"
    And Click on element by text "Yes"
    And Wait for element by text "Statements"
    And Click "Back" content description from view tag "View"
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer"
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "retail_recipient_iban" in element id "nlb-input-account-number"
    And Enter text "1000" in element id "nlb-amount-with-currency-field"
    And Click "Expand dropdown menu" content description from tag "ImageView"
    And Scroll down until currency "JPY" in selector is found and click
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by text "Foreign payment"
    #Change debtor
    And Click on Debtor selector for payment
    And Wait for element by text "Select account"
    And Assert element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by text "Foreign payment"
    #Entering recipient info
    And Enter text "TESTNAME" in element id "nlb-input-recipient-name"
    And Enter text "TEST" in element id "nlb-input-recipient-address"
    And Enter text "TEST" in element id "nlb-input-recipient-city"
    #End of entering recipient info
    And Swipe vertical
    And Assert element by text "SWIFT (BIC) code"
    And Assert text "LJBASI20XXX" in element id "nlb-input-bank-swift-code"
    And Swipe vertical
    And Assert text "1000,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "JPY"
    And Assert that info message for currency conversion in second step of payment is correct using amount "1000" currency "JPY" and exchange rate "FP_002_Buy_Currency"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "FP_002" in txt file
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "1.000,00 JPY"
    And Assert that text "Debited amount" has first following sibling with text from key "debitedAmount" from txt file
    And Assert that text "Informative fee" has first following sibling with text "6,80 EUR"
    And Assert element by text "Debtor"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_review"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_name"
    And Assert that second text "Address" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_full_address_payment_preview"
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Swipe vertical
    And Assert element by text "Payment"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "FP_002"
    And Assert that text "Payee of expenditure" has first following sibling with text "SHA"
    And Assert that text "Payment date" has first following sibling with current date in format "d.M.yyyy"
    And Assert that text "Urgent payment" has first following sibling with text "No"
    And Click on element by id "nlb-button-primary"
    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"
    #Ovde sam stao sa radom
    And Click on element by text "Past payments"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"
    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"
    And Scroll until element with text from txt file under key "FP_001" is in view and click
    And Wait for element by text "Recipient"

    Then Assert element by text "Payment details"
    And Assert element "nlb-date" by id has current date in format "d.M.yyyy"
    And Assert text under key "FP_001" from txt file in element id "nlb-title"
    And Assert text "USD" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "retail_recipient_name" in element by id "nlb-details"
    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_name_and_address_past_payment"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_iban"
    And Assert element by text "Creditor bank name" is not displayed
    And Assert element by text "Creditor bank address" is not displayed
    And Assert element by text "Additional creditor bank info" is not displayed
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Assert that text "Urgent payment" has first following sibling that contains text "No"
    And Scroll down until element with text "Executed" is in view
    And Assert that text "Payee of expenditure" has first following sibling that contains text "SHA"
    And Assert that text "Debit currency" has first following sibling that contains text "USD"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_details"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert that text "Debtor address" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_payment_address"
    And Assert that text "Informative fee" has first following sibling with text "6,80 EUR"
    And Assert that text "Payment status" has first following sibling with text "Executed"


    Examples:
      | rowindex |
      |        4 |

  @Foreign_Payments_Payment_To_Foreign_Account_EUR
  Scenario Outline: Foreign_Payments_Payment_To_Foreign_Account_EUR
    #C76171

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer"
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "united_kingdom_iban" in element id "nlb-input-account-number"
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    #And Click "Expand dropdown menu" content description from tag "ImageView"
    #And Scroll down until currency "USD" in selector is found and click
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by text "Who will cover the payment cost?"
    And Click on element by contains text "Either you or recipient will cover the entire cost of payment."
    And Click on element by text "Apply"
    And Wait for element by id "nlb-input-recipient-name" to appear
    And Assert element by text "Foreign payment"
    #Entering recipient info
    And Enter text from excel "<rowindex>" columnName "united_kingdom_name" in element id "nlb-input-recipient-name"
    And Enter text "TEST" in element id "nlb-input-recipient-address"
    And Enter text "TEST" in element id "nlb-input-recipient-city"
    #End of entering recipient info
    #Enter Recipient country
    And Click on element by id "nlb-input-recipient-country-click-area"
    And Wait for element by text "AFGHANISTAN" to appear for "60" seconds
    And Enter text "UNITED KINGDOM" into search field for country selection
    And Click second element with text "UNITED KINGDOM"
    #End of entering recipient country
    And Wait for element by id "nlb-input-recipient-address" to appear
    And Swipe vertical
    #Enter bank info
    And Enter text "TEST" in element id "nlb-input-bank-name"
    And Enter text "TEST" in element id "nlb-input-bank-address"
    And Enter text "TEST" in element id "nlb-input-bank-city"
    And Click on element by id "nlb-input-bank-country-click-area"
    And Wait for element by text "AFGHANISTAN" to appear for "60" seconds
    And Enter text "UNITED KINGDOM" into search field for country selection
    And Click second element with text "UNITED KINGDOM"
    And Enter text "TEST" in element id "nlb-input-bank-additional-info"
    And Scroll down until element with text "Save recipient" is in view
    And Assert text "BARCGB22" in element id "nlb-input-bank-swift-code"
    #End of enter bank info
    And Swipe vertical
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "FP_003" in txt file
    And Swipe vertical
    And Assert element by text "SHA - Costs are shared between creditor and debtor"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount"
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 EUR"
    And Assert that text "Debited amount" has first following sibling with text "10,00 EUR"
    And Assert that text "Informative fee" has first following sibling with text "7,00 EUR"
    And Assert element by text "Debtor"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_review"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "united_kingdom_name"
    And Assert that second text "Address" has first following sibling with text from Excel "<rowindex>" columnName "united_kingdom_full_address_payment_preview"
    And Swipe vertical
    #And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "united_kingdom_iban"
    And Assert that text "Bank name" has first following sibling with text "TEST"
    And Assert that text "Bank address" has first following sibling with text from Excel "<rowindex>" columnName "united_kingdom_bank_address_payment_preview"
    And Assert that text "Additional info for bank" has first following sibling with text "TEST"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "BARCGB22"
    And Assert element by text "Payment"
    And Swipe vertical
    And Assert that text "Purpose" has first following sibling with text from txt file under key "FP_003"
    And Assert that text "Payee of expenditure" has first following sibling with text "SHA"
    And Assert that text "Payment date" has first following sibling with current date in format "d.M.yyyy"
    And Assert that text "Urgent payment" has first following sibling with text "No"
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"
    And Click on element by text "Past payments"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"
    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"
    And Scroll until element with text from txt file under key "FP_003" is in view and click
    And Wait for element by text "Recipient"

    Then Assert element by text "Payment details"
    And Assert element "nlb-date" by id has current date in format "d.M.yyyy"
    And Assert text under key "FP_003" from txt file in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "united_kingdom_name" in element by id "nlb-details"
    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "united_kingdom_recipient_name_and_address_past_payment"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "united_kingdom_iban"
    And Assert that text "Bank name" has first following sibling that contains text "TEST"
    And Assert that text "Bank address" has first following sibling with text from Excel "<rowindex>" columnName "united_kingdom_bank_address_payment_preview"
    And Assert that text "Additional info for bank" has first following sibling that contains text "TEST"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "BARCGB22"
    And Scroll down until element with text "Executed" is in view
    And Assert that text "Urgent payment" has first following sibling that contains text "No"
    And Assert that text "Payee of expenditure" has first following sibling that contains text "SHA"
    And Assert that text "Debit currency" has first following sibling that contains text "EUR"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_details"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    #And Assert that text "Debtor address" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_payment_address"
    And Assert that text "Informative fee" has first following sibling with text "7,00 EUR"
    And Assert that text "Payment status" has first following sibling with text "Executed"


    Examples:
      | rowindex |
      |        4 |


  @Foreign_Payments_Payment_To_Foreign_Account_USD
  Scenario Outline: Foreign_Payments_Payment_To_Foreign_Account_USD
    #C76172

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer"
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "united_kingdom_iban" in element id "nlb-input-account-number"
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Click "Expand dropdown menu" content description from view tag "View"
    And Scroll down until currency "USD" in selector is found and click
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by id "nlb-input-recipient-name" to appear
    And Assert element by text "Foreign payment"
    #Entering recipient info
    And Enter text from excel "<rowindex>" columnName "united_kingdom_name" in element id "nlb-input-recipient-name"
    And Enter text "TEST" in element id "nlb-input-recipient-address"
    And Enter text "TEST" in element id "nlb-input-recipient-city"
    #End of entering recipient info
    #Enter Recipient country
    And Click on element by id "nlb-input-recipient-country-click-area"
    And Wait for element by text "AFGHANISTAN" to appear for "60" seconds
    And Enter text "UNITED KINGDOM" into search field for country selection
    And Click second element with text "UNITED KINGDOM"
    #End of entering recipient country
    And Wait for element by id "nlb-input-recipient-address" to appear
    And Swipe vertical
    #Enter bank info
    And Enter text "TEST" in element id "nlb-input-bank-name"
    And Enter text "TEST" in element id "nlb-input-bank-address"
    And Enter text "TEST" in element id "nlb-input-bank-city"
    And Click on element by id "nlb-input-bank-country-click-area"
    And Wait for element by text "AFGHANISTAN" to appear for "60" seconds
    And Enter text "UNITED KINGDOM" into search field for country selection
    And Click second element with text "UNITED KINGDOM"
    And Enter text "TEST" in element id "nlb-input-bank-additional-info"
    And Scroll down until element with text "Save recipient" is in view
    And Assert text "BARCGB22" in element id "nlb-input-bank-swift-code"
    #End of enter bank info
    And Swipe vertical
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "USD"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "FP_004" in txt file
    And Swipe vertical
    And Assert element by text "SHA - Costs are shared between creditor and debtor"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount"
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 USD"
    And Assert that text "Debited amount" has first following sibling with text "10,00 USD"
    And Assert that text "Informative fee" has first following sibling with text "7,00 EUR"
    And Assert element by text "Debtor"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_review"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "united_kingdom_name"
    And Assert that second text "Address" has first following sibling with text from Excel "<rowindex>" columnName "united_kingdom_full_address_payment_preview"
    And Swipe vertical
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "united_kingdom_iban"
    And Assert that text "Bank name" has first following sibling with text "TEST"
    And Assert that text "Bank address" has first following sibling with text from Excel "<rowindex>" columnName "united_kingdom_bank_address_payment_preview"
    And Assert that text "Additional info for bank" has first following sibling with text "TEST"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "BARCGB22"
    And Assert element by text "Payment"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "FP_004"
    And Assert that text "Payee of expenditure" has first following sibling with text "SHA"
    And Assert that text "Payment date" has first following sibling with current date in format "d.M.yyyy"
    And Assert that text "Urgent payment" has first following sibling with text "No"
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"
    And Click on element by text "Past payments"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"
    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"
    And Scroll until element with text from txt file under key "FP_004" is in view and click
    And Wait for element by text "Recipient"

    Then Assert element by text "Payment details"
    And Assert element "nlb-date" by id has current date in format "d.M.yyyy"
    And Assert text under key "FP_004" from txt file in element id "nlb-title"
    And Assert text "USD" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "united_kingdom_name" in element by id "nlb-details"
    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "united_kingdom_recipient_name_and_address_past_payment"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "united_kingdom_iban"
    And Assert that text "Bank name" has first following sibling that contains text "TEST"
    And Assert that text "Bank address" has first following sibling with text from Excel "<rowindex>" columnName "united_kingdom_bank_address_payment_preview"
    And Assert that text "Additional info for bank" has first following sibling that contains text "TEST"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "BARCGB22"
    And Scroll down until element with text "Executed" is in view
    And Assert that text "Urgent payment" has first following sibling that contains text "No"
    And Assert that text "Payee of expenditure" has first following sibling that contains text "SHA"
    And Assert that text "Debit currency" has first following sibling that contains text "USD"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_details"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    #And Assert that text "Debtor address" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_payment_address"
    And Assert that text "Informative fee" has first following sibling with text "7,00 EUR"
    And Assert that text "Payment status" has first following sibling with text "Executed"


    Examples:
      | rowindex |
      |        4 |


  @Foreign_Payments_Payment_To_EGP_Account_EUR
  Scenario Outline: Foreign_Payments_Payment_To_EGP_Account_EUR
    #C71307,C76173

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    And Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Remember available balance in currency "EUR" under key "IT_001_Debtor_Balance"
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-primary-balance" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer"
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "bosnia_iban" in element id "nlb-input-account-number"
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    #And Click "Expand dropdown menu" content description from tag "ImageView"
    #And Scroll down until currency "USD" in selector is found and click
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by id "nlb-input-recipient-name" to appear
    And Assert element by text "Foreign payment"
    #Entering recipient info
    And Enter text from excel "<rowindex>" columnName "bosnia_name" in element id "nlb-input-recipient-name"
    And Enter text "TEST" in element id "nlb-input-recipient-address"
    And Enter text "TEST" in element id "nlb-input-recipient-city"
    #End of entering recipient info
    #Enter Recipient country
    And Click on element by id "nlb-input-recipient-country-click-area"
    And Wait for element by text "AFGHANISTAN" to appear for "60" seconds
    And Enter text "BOSNIA AND HERZEGOVINA" into search field for country selection
    And Click second element with text "BOSNIA AND HERZEGOVINA"
    #End of entering recipient country
    And Wait for element by id "nlb-input-recipient-address" to appear
    And Swipe vertical
    #Enter bank info
    And Enter text "TEST" in element id "nlb-input-bank-name"
    And Enter text "TEST" in element id "nlb-input-bank-address"
    And Enter text "TEST" in element id "nlb-input-bank-city"
    And Click on element by id "nlb-input-bank-country-click-area"
    And Wait for element by text "AFGHANISTAN" to appear for "60" seconds
    And Enter text "BOSNIA AND HERZEGOVINA" into search field for country selection
    And Click second element with text "BOSNIA AND HERZEGOVINA"
    And Enter text "TEST" in element id "nlb-input-bank-additional-info"
    And Scroll down until element with text "Save recipient" is in view
    And Assert text "RAZBBA22" in element id "nlb-input-bank-swift-code"
    #End of enter bank info
    And Swipe vertical
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "FP_005" in txt file
    And Swipe vertical
    And Assert element by text "SHA - Costs are shared between creditor and debtor"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount"
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 EUR"
    And Assert that text "Debited amount" has first following sibling with text "10,00 EUR"
    And Assert that text "Informative fee" has first following sibling with text "5,00 EUR"
    And Assert element by text "Debtor"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_review"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "bosnia_name"
    And Assert that second text "Address" has first following sibling with text from Excel "<rowindex>" columnName "bosnia_full_address_payment_preview"
    And Swipe vertical
    #And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "bosnia_iban"
    And Assert that text "Bank name" has first following sibling with text "TEST"
    And Assert that text "Bank address" has first following sibling with text from Excel "<rowindex>" columnName "bosnia_bank_address_payment_preview"
    And Assert that text "Additional info for bank" has first following sibling with text "TEST"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "RAZBBA22"
    And Assert element by text "Payment"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "FP_005"
    And Assert that text "Payee of expenditure" has first following sibling with text "SHA"
    And Swipe vertical
    And Assert that text "Payment date" has first following sibling with current date in format "d.M.yyyy"
    And Assert that text "Urgent payment" has first following sibling with text "No"
    And Click on element by id "nlb-button-primary"
    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"
    And Wait "60" seconds
    And Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Check if current balance is lowered by "15" using balance from key "IT_001_Debtor_Balance" for currency "EUR"
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Click "Pay" content description from view tag "View"
    And Click on element by text "Past payments"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"
    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"
    And Scroll until element with text from txt file under key "FP_005" is in view and click
    And Wait for element by text "Recipient"

    Then Assert element by text "Payment details"
    And Assert element "nlb-date" by id has current date in format "d.M.yyyy"
    And Assert text under key "FP_005" from txt file in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "bosnia_name" in element by id "nlb-details"
    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "bosnia_recipient_name_and_address_past_payment"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "bosnia_iban"
    And Assert that text "Bank name" has first following sibling that contains text "TEST"
    And Assert that text "Bank address" has first following sibling with text from Excel "<rowindex>" columnName "bosnia_bank_address_payment_preview"
    And Assert that text "Additional info for bank" has first following sibling that contains text "TEST"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "RAZBBA22"
    And Scroll down until element with text "Executed" is in view
    And Assert that text "Urgent payment" has first following sibling that contains text "No"
    And Assert that text "Payee of expenditure" has first following sibling that contains text "SHA"
    And Assert that text "Debit currency" has first following sibling that contains text "EUR"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_details"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    #And Assert that text "Debtor address" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_payment_address"
    And Assert that text "Informative fee" has first following sibling with text "5,00 EUR"
    And Assert that text "Payment status" has first following sibling with text "Executed"


    Examples:
      | rowindex |
      |        4 |

  @Foreign_Payments_Payment_To_NON_EGP_Account_EUR
  Scenario Outline: Foreign_Payments_Payment_To_NON_EGP_Account_EUR
    #C71308,C76174

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    And Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Remember available balance in currency "EUR" under key "IT_001_Debtor_Balance"
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-primary-balance" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer"
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "united_kingdom_iban" in element id "nlb-input-account-number"
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    #And Click "Expand dropdown menu" content description from tag "ImageView"
    #And Scroll down until currency "USD" in selector is found and click
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by text "Who will cover the payment cost?"
    And Click on element by contains text "Either you or recipient will cover the entire cost of payment"
    And Click on element by text "Apply"
    And Wait for element by id "nlb-input-recipient-name" to appear
    And Assert element by text "Foreign payment"
    #Entering recipient info
    And Enter text from excel "<rowindex>" columnName "united_kingdom_name" in element id "nlb-input-recipient-name"
    And Enter text "TEST" in element id "nlb-input-recipient-address"
    And Enter text "TEST" in element id "nlb-input-recipient-city"
    #End of entering recipient info
    #Enter Recipient country
    And Click on element by id "nlb-input-recipient-country-click-area"
    And Wait for element by text "AFGHANISTAN" to appear for "60" seconds
    And Enter text "UNITED KINGDOM" into search field for country selection
    And Click second element with text "UNITED KINGDOM"
    #End of entering recipient country
    And Wait for element by id "nlb-input-recipient-address" to appear
    And Swipe vertical
    #Enter bank info
    And Enter text "TEST" in element id "nlb-input-bank-name"
    And Enter text "TEST" in element id "nlb-input-bank-address"
    And Enter text "TEST" in element id "nlb-input-bank-city"
    And Click on element by id "nlb-input-bank-country-click-area"
    And Wait for element by text "AFGHANISTAN" to appear for "60" seconds
    And Enter text "UNITED KINGDOM" into search field for country selection
    And Click second element with text "UNITED KINGDOM"
    And Enter text "TEST" in element id "nlb-input-bank-additional-info"
    And Scroll down until element with text "Save recipient" is in view
    And Assert text "BARCGB22" in element id "nlb-input-bank-swift-code"
    #End of enter bank info
    And Swipe vertical
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "FP_006" in txt file
    And Swipe vertical
    And Assert element by text "SHA - Costs are shared between creditor and debtor"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount"
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 EUR"
    And Assert that text "Debited amount" has first following sibling with text "10,00 EUR"
    And Assert that text "Informative fee" has first following sibling with text "7,00 EUR"
    And Assert element by text "Debtor"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_review"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "united_kingdom_name"
    And Assert that second text "Address" has first following sibling with text from Excel "<rowindex>" columnName "united_kingdom_full_address_payment_preview"
    And Swipe vertical
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "united_kingdom_iban"
    And Assert that text "Bank name" has first following sibling with text "TEST"
    And Assert that text "Bank address" has first following sibling with text from Excel "<rowindex>" columnName "united_kingdom_bank_address_payment_preview"
    And Assert that text "Additional info for bank" has first following sibling with text "TEST"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "BARCGB22"
    And Assert element by text "Payment"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "FP_006"
    And Assert that text "Payee of expenditure" has first following sibling with text "SHA"
    And Swipe vertical
    And Assert that text "Payment date" has first following sibling with current date in format "d.M.yyyy"
    And Assert that text "Urgent payment" has first following sibling with text "No"
    And Click on element by id "nlb-button-primary"
    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"
    #And Wait "60" seconds
    #And Click "My Products" content description from view tag "View"
    #And Wait for element by id "nlb-value-product-primary-balance" to appear
    #And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    #And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    #And Wait for element by id "nlb-product-details-primary-balance" to appear
    #And Check if current balance is lowered by "17" using balance from key "IT_001_Debtor_Balance" for currency "EUR"
    #And Click "Back" content description from view tag "View"
    #And Wait for element by id "nlb-value-product-primary-balance" to appear
    #And Click "Pay" content description from view tag "View"
    And Click on element by text "Past payments"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"
    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"
    And Scroll until element with text from txt file under key "FP_006" is in view and click
    And Wait for element by text "Recipient"

    Then Assert element by text "Payment details"
    And Assert element "nlb-date" by id has current date in format "d.M.yyyy"
    And Assert text under key "FP_006" from txt file in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "united_kingdom_name" in element by id "nlb-details"
    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "united_kingdom_recipient_name_and_address_past_payment"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "united_kingdom_iban"
    And Assert that text "Bank name" has first following sibling that contains text "TEST"
    And Assert that text "Bank address" has first following sibling with text from Excel "<rowindex>" columnName "united_kingdom_bank_address_payment_preview"
    And Assert that text "Additional info for bank" has first following sibling that contains text "TEST"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "BARCGB22"
    And Scroll down until element with text "Executed" is in view
    And Assert that text "Urgent payment" has first following sibling that contains text "No"
    And Assert that text "Payee of expenditure" has first following sibling that contains text "SHA"
    And Assert that text "Debit currency" has first following sibling that contains text "EUR"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_details"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    #And Assert that text "Debtor address" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_payment_address"
    And Assert that text "Informative fee" has first following sibling with text "7,00 EUR"
    And Assert that text "Payment status" has first following sibling with text "Executed"


    Examples:
      | rowindex |
      |        4 |


  @Foreign_Payments_Payment_In_The_Future
  Scenario Outline: Foreign_Payments_Payment_In_The_Future
    #C76176

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer"
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "united_kingdom_iban" in element id "nlb-input-account-number"
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    #And Click "Expand dropdown menu" content description from tag "ImageView"
    #And Scroll down until currency "USD" in selector is found and click
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by text "Who will cover the payment cost?"
    And Click on element by contains text "Either you or recipient will cover the entire cost of payment."
    And Click on element by text "Apply"
    And Wait for element by id "nlb-input-recipient-name" to appear
    And Assert element by text "Foreign payment"
    #Change of debtor
    And Click on Debtor selector for payment
    And Wait for element by text "Select account"
    And Assert element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "second_personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "second_personal_account_iban"
    And Wait for element by text "Foreign payment"
    #Entering recipient info
    And Enter text from excel "<rowindex>" columnName "united_kingdom_name" in element id "nlb-input-recipient-name"
    And Enter text "TEST" in element id "nlb-input-recipient-address"
    And Enter text "TEST" in element id "nlb-input-recipient-city"
    #End of entering recipient info
    #Enter Recipient country
    And Click on element by id "nlb-input-recipient-country-click-area"
    And Wait for element by text "AFGHANISTAN" to appear for "60" seconds
    And Enter text "UNITED KINGDOM" into search field for country selection
    And Click second element with text "UNITED KINGDOM"
    #End of entering recipient country
    And Wait for element by id "nlb-input-recipient-address" to appear
    And Swipe vertical
    #Enter bank info
    And Enter text "TEST" in element id "nlb-input-bank-name"
    And Enter text "TEST" in element id "nlb-input-bank-address"
    And Enter text "TEST" in element id "nlb-input-bank-city"
    And Click on element by id "nlb-input-bank-country-click-area"
    And Wait for element by text "AFGHANISTAN" to appear for "60" seconds
    And Enter text "UNITED KINGDOM" into search field for country selection
    And Click second element with text "UNITED KINGDOM"
    And Enter text "TEST" in element id "nlb-input-bank-additional-info"
    And Scroll down until element with text "Save recipient" is in view
    And Assert text "BARCGB22" in element id "nlb-input-bank-swift-code"
    #End of enter bank info
    And Swipe vertical
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "FP_007" in txt file
    And Swipe vertical
    And Assert element by text "SHA - Costs are shared between creditor and debtor"
    And Click on date "7" days in the future in calendar
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount"
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 EUR"
    And Assert that text "Debited amount" has first following sibling with text "10,00 EUR"
    And Assert that text "Informative fee" has first following sibling with text "7,00 EUR"
    And Assert element by text "Debtor"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_review"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "second_personal_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "united_kingdom_name"
    And Assert that second text "Address" has first following sibling with text from Excel "<rowindex>" columnName "united_kingdom_full_address_payment_preview"
    And Swipe vertical
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "united_kingdom_iban"
    And Assert that text "Bank name" has first following sibling with text "TEST"
    And Assert that text "Bank address" has first following sibling with text from Excel "<rowindex>" columnName "united_kingdom_bank_address_payment_preview"
    And Assert that text "Additional info for bank" has first following sibling with text "TEST"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "BARCGB22"
    And Assert element by text "Payment"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "FP_007"
    And Swipe vertical
    And Assert that text "Payee of expenditure" has first following sibling with text "SHA"
    And Assert that text "Payment date" has first following sibling with future date "7" in format "d.M.yyyy"
    And Assert that text "Urgent payment" has first following sibling with text "No"
    And Click on element by id "nlb-button-primary"
    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"
    And Click on element by text "Upcoming payments"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Upcoming payments"
    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "second_personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "second_personal_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Upcoming payments"
    And Scroll until element with text from txt file under key "FP_007" is in view and click
    And Wait for element by text "Recipient"

    Then Assert element by text "Payment details"
    And Assert element by id "nlb-date" has date "7" day in the future in format "d.M.yyyy"
    And Assert text under key "FP_007" from txt file in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "united_kingdom_name" in element by id "nlb-details"
    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "united_kingdom_recipient_name_and_address_past_payment"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "united_kingdom_iban"
    And Assert that text "Bank name" has first following sibling that contains text "TEST"
    And Assert that text "Bank address" has first following sibling with text from Excel "<rowindex>" columnName "united_kingdom_bank_address_payment_preview"
    And Assert that text "Additional info for bank" has first following sibling that contains text "TEST"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "BARCGB22"
    And Scroll down until element with text "Pending" is in view
    And Assert that text "Urgent payment" has first following sibling that contains text "No"
    And Assert that text "Payee of expenditure" has first following sibling that contains text "SHA"
    And Assert that text "Debit currency" has first following sibling that contains text "EUR"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_details"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "second_personal_account_iban"
    #And Assert that text "Debtor address" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_payment_address"
    And Assert that text "Payment status" has first following sibling with text "Pending"


    Examples:
      | rowindex |
      |        4 |


  @Payments_Foreign_Payments-Confirmation_[MOB_ANDROID]
  Scenario Outline: Payments_Foreign_Payments-Confirmation_[MOB_ANDROID]
    #C71301
    #BUG On android 16 1.000,00 is 1000,00
    #Only happens on 4 digit numbers

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer"
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "united_kingdom_iban" in element id "nlb-input-account-number"
    And Enter text "1000" in element id "nlb-amount-with-currency-field"
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by text "Who will cover the payment cost?"
    And Click on element by contains text "Either you or recipient will cover the entire cost of payment."
    And Click on element by text "Apply"
    And Wait for element by id "nlb-input-recipient-name" to appear
    And Assert element by text "Foreign payment"
    #Entering recipient info
    And Enter text from excel "<rowindex>" columnName "united_kingdom_name" in element id "nlb-input-recipient-name"
    And Enter text "TEST" in element id "nlb-input-recipient-address"
    And Enter text "TEST" in element id "nlb-input-recipient-city"
    #End of entering recipient info
    #Enter Recipient country
    And Click on element by id "nlb-input-recipient-country-click-area"
    And Wait for element by text "AFGHANISTAN" to appear for "60" seconds
    And Enter text "UNITED KINGDOM" into search field for country selection
    And Click second element with text "UNITED KINGDOM"
    #End of entering recipient country
    And Wait for element by id "nlb-input-recipient-address" to appear
    And Swipe vertical
    #Enter bank info
    And Enter text "TEST" in element id "nlb-input-bank-name"
    And Enter text "TEST" in element id "nlb-input-bank-address"
    And Enter text "TEST" in element id "nlb-input-bank-city"
    And Click on element by id "nlb-input-bank-country-click-area"
    And Wait for element by text "AFGHANISTAN" to appear for "60" seconds
    And Enter text "UNITED KINGDOM" into search field for country selection
    And Click second element with text "UNITED KINGDOM"
    And Enter text "TEST" in element id "nlb-input-bank-additional-info"
    And Scroll down until element with text "Save recipient" is in view
    And Assert text "BARCGB22" in element id "nlb-input-bank-swift-code"
    #End of enter bank info
    And Swipe vertical
    And Click on element by text "Save recipient"
    And Assert currency in second payment screen is "EUR"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "FP_006" in txt file
    And Swipe vertical
    And Assert element by text "SHA - Costs are shared between creditor and debtor"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount"
    And Assert element by text "Payment review"
    And Swipe vertical
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Enter PIN"

    #Then Assert "NLB logo" content description from tag "ImageView" is displayed
    And Assert element by text "Enter PIN"
    And Assert element "forgot-pin-button" by id
    And Send PIN from Excel "<rowindex>" columnName "pin_correct"
    And Wait for element by text "Confirm"
    And Assert element by text "0 min"
    And Assert element by text "3 min"
    And Assert element by text "IBAN:" has first following sibling from excel "<rowindex>" columnName "united_kingdom_iban"
    And Assert element by text "Amount:" has first following sibling "1.000,00"
    And Assert element by text "Currency:" has first following sibling "EUR"
    And Assert element by text "Only confirm payments you’ve entered yourself. If you don’t recognize this payment, reject it."
    And Assert element by text "Reject"
    And Assert element by text "Confirm"
    And Click on element by text "Reject"


    Examples:
      | rowindex |
      |        4 |

  @Payments_Foreign_Payments-Modify_Data_[MOB_ANDROID]
  Scenario Outline: Payments_Foreign_Payments-Modify_Data_[MOB_ANDROID]
    #C71306

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer"
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "bosnia_iban" in element id "nlb-input-account-number"
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    #And Click "Expand dropdown menu" content description from tag "ImageView"
    #And Scroll down until currency "USD" in selector is found and click
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by id "nlb-input-recipient-name" to appear
    And Select account from Excel "<rowindex>" columnName "second_personal_account_iban" as debtor in payment screen
    And Assert element by text "Foreign payment"
    #Entering recipient info
    And Enter text from excel "<rowindex>" columnName "bosnia_name" in element id "nlb-input-recipient-name"
    And Enter text "TEST" in element id "nlb-input-recipient-address"
    And Enter text "TEST" in element id "nlb-input-recipient-city"
    #End of entering recipient info
    #Enter Recipient country
    And Click on element by id "nlb-input-recipient-country-click-area"
    And Wait for element by text "AFGHANISTAN" to appear for "60" seconds
    And Enter text "BOSNIA AND HERZEGOVINA" into search field for country selection
    And Click second element with text "BOSNIA AND HERZEGOVINA"
    #End of entering recipient country
    And Wait for element by id "nlb-input-recipient-address" to appear
    And Swipe vertical
    #Enter bank info
    And Enter text "TEST" in element id "nlb-input-bank-name"
    And Enter text "TEST" in element id "nlb-input-bank-address"
    And Enter text "TEST" in element id "nlb-input-bank-city"
    And Click on element by id "nlb-input-bank-country-click-area"
    And Wait for element by text "AFGHANISTAN" to appear for "60" seconds
    And Enter text "BOSNIA AND HERZEGOVINA" into search field for country selection
    And Click second element with text "BOSNIA AND HERZEGOVINA"
    And Enter text "TEST" in element id "nlb-input-bank-additional-info"
    And Scroll down until element with text "Save recipient" is in view
    And Assert text "RAZBBA22" in element id "nlb-input-bank-swift-code"
    #End of enter bank info
    And Swipe vertical
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "FP_005" in txt file
    And Swipe vertical
    And Assert element by text "SHA - Costs are shared between creditor and debtor"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount"
    And Assert element by text "Payment review"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Save recipient"
    And Select account from Excel "<rowindex>" columnName "personal_account_iban" as debtor in payment screen
    And Wait for element by text "Save recipient"
    And Scroll down until element with text "Faster payment execution" is in view
    And Enter text "15" in element id "nlb-amount-with-currency-field"
    And Click on date "7" days in the future in calendar
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "15,00 EUR"
    And Assert that text "Debited amount" has first following sibling with text "15,00 EUR"
    And Assert that text "Informative fee" has first following sibling with text "5,00 EUR"
    And Assert element by text "Debtor"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_review"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "bosnia_name"
    And Assert that second text "Address" has first following sibling with text from Excel "<rowindex>" columnName "bosnia_full_address_payment_preview"
    And Swipe vertical
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "bosnia_iban"
    And Assert that text "Bank name" has first following sibling with text "TEST"
    And Assert that text "Bank address" has first following sibling with text from Excel "<rowindex>" columnName "bosnia_bank_address_payment_preview"
    And Assert that text "Additional info for bank" has first following sibling with text "TEST"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "RAZBBA22"
    And Assert element by text "Payment"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "FP_005"
    And Assert that text "Payee of expenditure" has first following sibling with text "SHA"
    And Swipe vertical
    And Assert that text "Payment date" has first following sibling with future date "7" in format "d.M.yyyy"
    And Assert that text "Urgent payment" has first following sibling with text "No"
    And Click on element by id "nlb-button-primary"
    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"
    And Click on element by text "Upcoming payments"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Upcoming payments"
    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Upcoming payments"
    And Scroll until element with text from txt file under key "FP_005" is in view and click
    And Wait for element by text "Recipient"

    Then Assert element by text "Payment details"
    And Assert element by id "nlb-date" has date "7" day in the future in format "d.M.yyyy"
    And Assert text under key "FP_005" from txt file in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert text "15,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "bosnia_name" in element by id "nlb-details"
    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "bosnia_recipient_name_and_address_past_payment"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "bosnia_iban"
    And Assert that text "Bank name" has first following sibling that contains text "TEST"
    And Assert that text "Bank address" has first following sibling with text from Excel "<rowindex>" columnName "bosnia_bank_address_payment_preview"
    And Assert that text "Additional info for bank" has first following sibling that contains text "TEST"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "RAZBBA22"
    And Scroll down until element with text "Pending" is in view
    And Assert that text "Urgent payment" has first following sibling that contains text "No"
    And Assert that text "Payee of expenditure" has first following sibling that contains text "SHA"
    And Assert that text "Debit currency" has first following sibling that contains text "EUR"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_details"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    #And Assert that text "Debtor address" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_payment_address"
    And Assert that text "Payment status" has first following sibling with text "Pending"


    Examples:
      | rowindex |
      |        4 |


  @Payments_Foreign_Payments-Confirmation-invalid_Then_Confirm[MOB_ANDROID]
  Scenario Outline: Payments_Foreign_Payments-Confirmation-invalid_Then_Confirm[MOB_ANDROID]
    #C71302

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer"
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "united_kingdom_iban" in element id "nlb-input-account-number"
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by text "Who will cover the payment cost?"
    And Click on element by contains text "Either you or recipient will cover the entire cost of payment."
    And Click on element by text "Apply"
    And Wait for element by id "nlb-input-recipient-name" to appear
    And Assert element by text "Foreign payment"
    #Entering recipient info
    And Enter text from excel "<rowindex>" columnName "united_kingdom_name" in element id "nlb-input-recipient-name"
    And Enter text "TEST" in element id "nlb-input-recipient-address"
    And Enter text "TEST" in element id "nlb-input-recipient-city"
    #End of entering recipient info
    #Enter Recipient country
    And Click on element by id "nlb-input-recipient-country-click-area"
    And Wait for element by text "AFGHANISTAN" to appear for "60" seconds
    And Enter text "UNITED KINGDOM" into search field for country selection
    And Click second element with text "UNITED KINGDOM"
    #End of entering recipient country
    And Wait for element by id "nlb-input-recipient-address" to appear
    And Swipe vertical
    #Enter bank info
    And Enter text "TEST" in element id "nlb-input-bank-name"
    And Enter text "TEST" in element id "nlb-input-bank-address"
    And Enter text "TEST" in element id "nlb-input-bank-city"
    And Click on element by id "nlb-input-bank-country-click-area"
    And Wait for element by text "AFGHANISTAN" to appear for "60" seconds
    And Enter text "UNITED KINGDOM" into search field for country selection
    And Click second element with text "UNITED KINGDOM"
    And Enter text "TEST" in element id "nlb-input-bank-additional-info"
    And Scroll down until element with text "Save recipient" is in view
    And Click on element by text "Save recipient"
    And Assert text "BARCGB22" in element id "nlb-input-bank-swift-code"
    #End of enter bank info
    And Swipe vertical
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "FP_006" in txt file
    And Swipe vertical
    And Assert element by text "SHA - Costs are shared between creditor and debtor"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount"
    And Assert element by text "Payment review"
    And Scroll down until element with id "nlb-button-primary" is in view
    And Click on element by id "nlb-button-primary"
    And Assert "NLB logo" content description from tag "ImageView" is displayed
    And Assert element by text "Enter PIN"
    And Assert element "forgot-pin-button" by id
    And Send PIN from Excel "<rowindex>" columnName "pin_wrong"
    And Wait for element by text "Attempts remaining: 4 "
    And Assert element by text "Attempts remaining: 4 "
    And Assert element by text "Incorrect PIN"
    And Click on element by text "OK"
    And Wait for element by id "forgot-pin-button" to appear
    And Send PIN from Excel "<rowindex>" columnName "pin_correct"
    And Wait for element by id "nlb-button-primary" to appear
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Recipients"

    Then Click on element by text "Recipients"
    And Wait for element by id "nlb_search_text_field" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "united_kingdom_iban" is in view
    And Assert saved contact has short "G" and name from Excel "<rowindex>" columnName "united_kingdom_name" and iban from Excel "<rowindex>" columnName "united_kingdom_iban"
    And Click on element by text from excel "<rowindex>" columnName "united_kingdom_iban"
    And Assert element by text "Recipient details"
    And Assert element by text "Address"
    And Assert that text "Address" has first following sibling that contains text "TEST"
    And Assert that text "Address" has first following sibling that contains text "UNITED KINGDOM"
    And Assert that text "Bank name" has first following sibling that contains text "TEST"
    And Assert that text "Bank address" has first following sibling that contains text "TEST"
    And Assert that text "Bank address" has first following sibling that contains text "UNITED KINGDOM"
    And Assert element by text "SWIFT (BIC) Code"
    And Assert that text "SWIFT (BIC) Code" has first following sibling that contains text "BARCGB22"
    And Click on element by text "Delete "
    And Wait for element by text "Delete recipient"
    And Click on element by text "Delete"


    Examples:
      | rowindex |
      |        4 |


  @Payments_Foreign_Payments-Confirmation-invalid_Then_Reject[MOB_ANDROID]
  Scenario Outline: Payments_Foreign_Payments-Confirmation-invalid_Then_Reject[MOB_ANDROID]
    #C71302

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer"
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "united_kingdom_iban" in element id "nlb-input-account-number"
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by text "Who will cover the payment cost?"
    And Click on element by contains text "Either you or recipient will cover the entire cost of payment."
    And Click on element by text "Apply"
    And Wait for element by id "nlb-input-recipient-name" to appear
    And Assert element by text "Foreign payment"
    #Entering recipient info
    And Enter text from excel "<rowindex>" columnName "united_kingdom_name" in element id "nlb-input-recipient-name"
    And Enter text "TEST" in element id "nlb-input-recipient-address"
    And Enter text "TEST" in element id "nlb-input-recipient-city"
    #End of entering recipient info
    #Enter Recipient country
    And Click on element by id "nlb-input-recipient-country-click-area"
    And Wait for element by text "AFGHANISTAN" to appear for "60" seconds
    And Enter text "UNITED KINGDOM" into search field for country selection
    And Click second element with text "UNITED KINGDOM"
    #End of entering recipient country
    And Wait for element by id "nlb-input-recipient-address" to appear
    And Swipe vertical
    #Enter bank info
    And Enter text "TEST" in element id "nlb-input-bank-name"
    And Enter text "TEST" in element id "nlb-input-bank-address"
    And Enter text "TEST" in element id "nlb-input-bank-city"
    And Click on element by id "nlb-input-bank-country-click-area"
    And Wait for element by text "AFGHANISTAN" to appear for "60" seconds
    And Enter text "UNITED KINGDOM" into search field for country selection
    And Click second element with text "UNITED KINGDOM"
    And Enter text "TEST" in element id "nlb-input-bank-additional-info"
    And Scroll down until element with text "Save recipient" is in view
    And Click on element by text "Save recipient"
    And Assert text "BARCGB22" in element id "nlb-input-bank-swift-code"
    #End of enter bank info
    And Swipe vertical
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "FP_006" in txt file
    And Swipe vertical
    And Assert element by text "SHA - Costs are shared between creditor and debtor"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount"
    And Assert element by text "Payment review"
    And Swipe vertical
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Assert "NLB logo" content description from tag "ImageView" is displayed
    And Assert element by text "Enter PIN"
    And Assert element "forgot-pin-button" by id
    And Send PIN from Excel "<rowindex>" columnName "pin_wrong"
    And Wait for element by text "Attempts remaining: 4 "
    And Assert element by text "Attempts remaining: 4 "
    And Assert element by text "Incorrect PIN"
    And Click on element by text "OK"
    And Wait for element by id "forgot-pin-button" to appear
    And Send PIN from Excel "<rowindex>" columnName "pin_correct"
    And Wait for element by id "nlb-button-primary" to appear
    And Click on element by id "nlb-button-alternate"

    Then Assert element by text "Payment confirmation rejected"


    Examples:
      | rowindex |
      |        4 |


  @Foreign_Payment_Fee_Change_Balance_Foreign_SEPA_Foreign_[ANDROID]
  Scenario Outline: Foreign_Payment_Fee_Change_Balance_Foreign_SEPA_Foreign_[ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    And Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Remember available balance in currency "EUR" under key "IT_001_Debtor_Balance"
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-primary-balance" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer"
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "united_kingdom_iban" in element id "nlb-input-account-number"
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    #And Click "Expand dropdown menu" content description from tag "ImageView"
    #And Scroll down until currency "USD" in selector is found and click
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by text "Who covers the payment cost"
    And Click on element by contains text "Foreign payment"
    And Click on element by text "Apply"
    And Wait for element by id "nlb-input-recipient-name" to appear
    And Assert element by text "Foreign payment"
    #Entering recipient info
    And Enter text from excel "<rowindex>" columnName "united_kingdom_name" in element id "nlb-input-recipient-name"
    And Enter text "TEST" in element id "nlb-input-recipient-address"
    And Enter text "TEST" in element id "nlb-input-recipient-city"
    #End of entering recipient info
    #Enter Recipient country
    And Click on element by id "nlb-input-recipient-country-click-area"
    And Wait for element by text "AFGHANISTAN" to appear for "60" seconds
    And Enter text "UNITED KINGDOM" into search field for country selection
    And Click second element with text "UNITED KINGDOM"
    #End of entering recipient country
    And Wait for element by id "nlb-input-recipient-address" to appear
    And Swipe vertical
    #Enter bank info
    And Enter text "TEST" in element id "nlb-input-bank-name"
    And Enter text "TEST" in element id "nlb-input-bank-address"
    And Enter text "TEST" in element id "nlb-input-bank-city"
    And Click on element by id "nlb-input-bank-country-click-area"
    And Wait for element by text "AFGHANISTAN" to appear for "60" seconds
    And Enter text "UNITED KINGDOM" into search field for country selection
    And Click second element with text "UNITED KINGDOM"
    And Enter text "TEST" in element id "nlb-input-bank-additional-info"
    And Scroll down until element with text "Save recipient" is in view
    And Assert text "BARCGB22" in element id "nlb-input-bank-swift-code"
    #End of enter bank info
    And Swipe vertical
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "FP_006" in txt file
    And Swipe vertical
    And Assert element by text "SHA - Costs are shared between creditor and debtor"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount"
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 EUR"
    And Assert that text "Debited amount" has first following sibling with text "10,00 EUR"
    And Assert that text "Informative fee" has first following sibling with text "7,00 EUR"
    And Assert element by text "Debtor"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_review"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert element by text "Recipient"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "united_kingdom_name"
    And Assert that second text "Address" has first following sibling with text from Excel "<rowindex>" columnName "united_kingdom_full_address_payment_preview"
    And Swipe vertical
    And Assert that text "Debtor account number" has first following sibling with text from Excel "<rowindex>" columnName "united_kingdom_iban"
    And Assert that text "Bank name" has first following sibling with text "TEST"
    And Assert that text "Bank address" has first following sibling with text from Excel "<rowindex>" columnName "united_kingdom_bank_address_payment_preview"
    And Assert that text "Additional info for bank" has first following sibling with text "TEST"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "BARCGB22"
    And Assert element by text "Payment"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "FP_006"
    And Assert that text "Payee of expenditure" has first following sibling with text "SHA"
    And Assert that text "Payment date" has first following sibling with current date in format "d.M.yyyy"
    And Swipe vertical
    And Assert that text "Urgent payment" has first following sibling with text "No"
    And Click on element by id "nlb-button-primary"
    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"
    And Wait "60" seconds
    And Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Check if current balance is lowered by "17" using balance from key "IT_001_Debtor_Balance" for currency "EUR"
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-primary-balance" to appear

    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Remember available balance in currency "EUR" under key "IT_001_Debtor_Balance"
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-primary-balance" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "retail_recipient_iban" in element id "nlb-input-account-number"
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by id "nlb-input-recipient-name" to appear
    And Enter text from excel "<rowindex>" columnName "retail_recipient_name" in element id "nlb-input-recipient-name"
    And Enter text "TEST" in element id "nlb-input-recipient-address"
    And Enter text "TEST" in element id "nlb-input-recipient-city"
    And Swipe vertical
    And Swipe vertical
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Assert text "OTHR - Other" in element id "nlb-input-purpose-code"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "SP_001" in txt file
    And Assert element by text "NRC - No reference"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Swipe vertical

    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 EUR"
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert element by text "Debtor"
    And Assert that text "First and last name / Company name" has first following sibling that contains from Excel "<rowindex>" columnName "user_name_short"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_name"
    And Assert that second text "Address" has first following sibling that contains text "TEST"
    And Assert that second text "Address" has first following sibling that contains text "SLOVENIA"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Swipe vertical
    And Assert element by text "Payment"
    And Assert that text "Reference" has first following sibling with text "NRC"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "SP_001"
    And Assert that text "Purpose code" has first following sibling with text "OTHR"
    And Assert that text "Payment date" has first following sibling with current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"

    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"
    And Wait "60" seconds
    And Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Check if current balance is lowered by "10" using balance from key "IT_001_Debtor_Balance" for currency "EUR"
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-primary-balance" to appear

    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Remember available balance in currency "EUR" under key "IT_001_Debtor_Balance"
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-primary-balance" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer"
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "united_kingdom_iban" in element id "nlb-input-account-number"
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    #And Click "Expand dropdown menu" content description from tag "ImageView"
    #And Scroll down until currency "USD" in selector is found and click
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by text "Who covers the payment cost"
    And Click on element by contains text "Foreign payment"
    And Click on element by text "Apply"
    And Wait for element by id "nlb-input-recipient-name" to appear
    And Assert element by text "Foreign payment"
    #Entering recipient info
    And Enter text from excel "<rowindex>" columnName "united_kingdom_name" in element id "nlb-input-recipient-name"
    And Enter text "TEST" in element id "nlb-input-recipient-address"
    And Enter text "TEST" in element id "nlb-input-recipient-city"
    #End of entering recipient info
    #Enter Recipient country
    And Click on element by id "nlb-input-recipient-country-click-area"
    And Wait for element by text "AFGHANISTAN" to appear for "60" seconds
    And Enter text "UNITED KINGDOM" into search field for country selection
    And Click second element with text "UNITED KINGDOM"
    #End of entering recipient country
    And Wait for element by id "nlb-input-recipient-address" to appear
    And Swipe vertical
    #Enter bank info
    And Enter text "TEST" in element id "nlb-input-bank-name"
    And Enter text "TEST" in element id "nlb-input-bank-address"
    And Enter text "TEST" in element id "nlb-input-bank-city"
    And Click on element by id "nlb-input-bank-country-click-area"
    And Wait for element by text "AFGHANISTAN" to appear for "60" seconds
    And Enter text "UNITED KINGDOM" into search field for country selection
    And Click second element with text "UNITED KINGDOM"
    And Enter text "TEST" in element id "nlb-input-bank-additional-info"
    And Scroll down until element with text "Save recipient" is in view
    And Assert text "BARCGB22" in element id "nlb-input-bank-swift-code"
    #End of enter bank info
    And Swipe vertical
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "FP_006" in txt file
    And Swipe vertical
    And Assert element by text "SHA - Costs are shared between creditor and debtor"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount"
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 EUR"
    And Assert that text "Debited amount" has first following sibling with text "10,00 EUR"
    And Assert that text "Informative fee" has first following sibling with text "7,00 EUR"
    And Assert element by text "Debtor"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_review"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert element by text "Recipient"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "united_kingdom_name"
    And Assert that second text "Address" has first following sibling with text from Excel "<rowindex>" columnName "united_kingdom_full_address_payment_preview"
    And Swipe vertical
    And Assert that text "Debtor account number" has first following sibling with text from Excel "<rowindex>" columnName "united_kingdom_iban"
    And Swipe vertical
    And Assert that text "Bank name" has first following sibling with text "TEST"
    And Assert that text "Bank address" has first following sibling with text from Excel "<rowindex>" columnName "united_kingdom_bank_address_payment_preview"
    And Assert that text "Additional info for bank" has first following sibling with text "TEST"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "BARCGB22"
    And Assert element by text "Payment"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "FP_006"
    And Assert that text "Payee of expenditure" has first following sibling with text "SHA"
    And Assert that text "Payment date" has first following sibling with current date in format "d.M.yyyy"
    And Assert that text "Urgent payment" has first following sibling with text "No"
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"
    And Wait "60" seconds
    And Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Check if current balance is lowered by "17" using balance from key "IT_001_Debtor_Balance" for currency "EUR"


    Examples:
      | rowindex |
      |        4 |