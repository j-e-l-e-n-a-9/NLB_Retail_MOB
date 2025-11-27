Feature: SEPA_Payments

  @Payments_SEPA_Payments-Input_[MOB_ANDROID]
  Scenario Outline: Payments_SEPA_Payments-Input_[MOB_ANDROID]
    #C71264,C71266

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "corporate_recipient_iban" in element id "nlb-input-account-number"
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by id "nlb-input-purpose-code" to appear

    Then Assert element by text "UPN payment"
    And Assert element by text "Debtor"
    And Assert Debtor in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "personal_account_name" and iban "personal_account_iban"
    And Assert element by text "Recipient"
    And Assert SEPA Recipient has icon "EL" and from Excel "<rowindex>" account name "corporate_recipient_name" and iban "corporate_recipient_iban"
    And Click on element by id "nlb-icon-row"
    And Assert text in excel "<rowindex>" columnName "corporate_recipient_name" in element id "nlb-input-recipient-name"
    #And Assert text in excel "<rowindex>" columnName "corporate_recipient_address" in element id "nlb-input-recipient-address"
    And Assert text in excel "<rowindex>" columnName "corporate_recipient_city" in element id "nlb-input-recipient-city"
    And Assert text in excel "<rowindex>" columnName "corporate_recipient_country" in element id "nlb-input-recipient-country"
    And Click on element by text from excel "<rowindex>" columnName "corporate_recipient_iban"
    And Assert element by text "Save recipient"
    And Assert element "nlb-checkbox-update-recipient" by id
    And Assert element by text "Payment"
    And Assert element by text "In order to continue all input fields must be filled."
    And Assert element by text "Payment amount"
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert element by text "EUR"
    And Assert element by text "Purpose code"
    And Assert text "OTHR - Other" in element id "nlb-input-purpose-code"
    And Swipe vertical
    And Assert element by text "Purpose"
    And Enter text "TESTING" in element id "nlb-input-purpose"
    And Enter text "ABCDEFGHIJKLMNOPQRSTUVWXYZČĆŽŠĐ0123456789/-?:().,'&" in element id "nlb-input-purpose"
    And Assert text "ABCDEFGHIJKLMNOPQRSTUVWXYZČĆŽŠĐ0123456789/-?:().,'&" in element id "nlb-input-purpose"
    And Enter text "TESTING" in element id "nlb-input-purpose"
    And Assert element by text "Reference"
    And Assert element by text "SI"
    And Assert element by text "Model"
    And Enter text "123" in element id "nlb-input-reference-model"
    And Assert text "12" in element id "nlb-input-reference-model"
    And Assert element by text "Reference number"
    And Enter text "123456789" in element id "nlb-input-reference-number"
    And Assert text "123456789" in element id "nlb-input-reference-number"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Click "Expand dropdown menu" content description from tag "ImageView"
    And Assert element by text "SI"
    And Assert element by text "RF"
    And Assert element by text "NRC - No reference"
    And Click on element by text "RF"
    And Assert element by text "Reference number"
    And Enter text "123456789" in element id "nlb-input-reference-number"
    And Assert text "123456789" in element id "nlb-input-reference-number"
    And Click "Expand dropdown menu" content description from tag "ImageView"
    And Click on element by text "NRC - No reference"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 EUR"
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert element by text "Debtor"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_review"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "user_address_for_payment_review_for_personal_account"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "corporate_recipient_name"
    #And Assert that second text "Address" has first following sibling with text from Excel "<rowindex>" columnName "corporate_recipient_full_address_payment_preview"
    #Dodati stepove da se proverava contains za svaki od elemenata adrese pojedinacno
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "corporate_recipient_iban"
    And Swipe vertical
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Assert element by text "Payment"
    And Assert that text "Reference" has first following sibling with text "NRC"
    And Assert that text "Purpose" has first following sibling with text "TESTING"
    And Assert that text "Purpose code" has first following sibling with text "OTHR"
    And Assert that text "Payment date" has first following sibling with current date in format "d.M.yyyy"



    Examples:
      | rowindex |
      |        4 |


  @Payments_SEPA_Payments-Input-invalid_[MOB_ANDROID]
  Scenario Outline: Payments_SEPA_Payments-Input-invalid_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "retail_recipient_iban" in element id "nlb-input-account-number"
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by id "nlb-input-recipient-name" to appear

    Then Enter text "_" in element id "nlb-input-recipient-name"
    And Assert element by contains text with special characters "Please use the following characters: A B C D E F G H I J K L M N O P Q R S T U V W X Y Z Č Ć Ž Š Đ 0 1 2 3 4 5 6 7 8 9 / - ? : ( ) . , ' & - space"
    And Enter text "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" in element id "nlb-input-recipient-name"
    And Assert element by text "Maximum number of characters is 70."
    And Enter text "" in element id "nlb-input-recipient-name"
    And Assert element by text "First and last name / Company name is required"
    And Enter text "TESTNAME" in element id "nlb-input-recipient-name"

    And Enter text "_" in element id "nlb-input-recipient-address"
    And Assert element by contains text with special characters "Please use the following characters: A B C D E F G H I J K L M N O P Q R S T U V W X Y Z Č Ć Ž Š Đ 0 1 2 3 4 5 6 7 8 9 / - ? : ( ) . , ' & - space"
    And Enter text "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" in element id "nlb-input-recipient-address"
    And Assert element by text "Maximum number of characters is 70."
    And Enter text "" in element id "nlb-input-recipient-address"
    And Assert element by text "Address is required"
    And Enter text "TEST" in element id "nlb-input-recipient-address"

    And Enter text "_" in element id "nlb-input-recipient-city"
    And Assert element by contains text with special characters "Please use the following characters: A B C D E F G H I J K L M N O P Q R S T U V W X Y Z Č Ć Ž Š Đ 0 1 2 3 4 5 6 7 8 9 / - ? : ( ) . , ' & - space"
    And Enter text "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" in element id "nlb-input-recipient-city"
    And Assert element by text "Maximum number of characters is 70."
    And Enter text "" in element id "nlb-input-recipient-city"
    And Assert element by text "City is required"
    And Enter text "TEST" in element id "nlb-input-recipient-city"

    And Swipe vertical

    And Enter text "_" in element id "nlb-input-purpose"
    And Assert element by contains text with special characters "Please use the following characters: A B C D E F G H I J K L M N O P Q R S T U V W X Y Z Č Ć Ž Š Đ 0 1 2 3 4 5 6 7 8 9 / - ? : ( ) . , ' & - space"
    And Enter text "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" in element id "nlb-input-purpose"
    And Assert element by contains text "Maximum number of characters is 140."
    And Enter text "" in element id "nlb-input-purpose"
    And Assert element by contains text "Purpose is required"
    And Enter text "TESTING" in element id "nlb-input-purpose"

    And Click "Expand dropdown menu" content description from tag "ImageView"
    And Click on element by text "SI"

    And Enter text "A" in element id "nlb-input-reference-model"
    And Assert text "Model" in element by id "nlb-input-reference-model" with descendant TextView widget
    And Enter text "123" in element id "nlb-input-reference-model"
    And Assert text "12" in element id "nlb-input-reference-model"
    And Enter text "" in element id "nlb-input-reference-model"
    And Assert element by text "Model is required"

    And Enter text "$$" in element id "nlb-input-reference-number"
    And Assert element by text "Up to 13 characters in segment, altogether up to 22 characters, up to 20 numbers and up to 2 dashes."
    And Enter text "" in element id "nlb-input-reference-number"
    And Assert element by text "Reference number is required"




    Examples:
      | rowindex |
      |        2 |


  @Payments_SEPA_Payments-Cancel_Button_[MOB_ANDROID]_1
  Scenario Outline: Payments_SEPA_Payments-Cancel_Button_[MOB_ANDROID]_1

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "corporate_recipient_iban" in element id "nlb-input-account-number"
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by id "nlb-input-purpose-code" to appear

    Then Assert element by text "UPN payment"
    And Assert element by text "Debtor"
    And Swipe vertical
    And Enter text "Testing" in element id "nlb-input-purpose"
    And Enter text "00" in element id "nlb-input-reference-model"
    And Enter text "123456789" in element id "nlb-input-reference-number"
    And Click on element by text "Next"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Scroll down until element with text "Cancel" is in view
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
      |        2 |

  @Payments_SEPA_Payments-Cancel_Button_[MOB_ANDROID]_2
  Scenario Outline: Payments_SEPA_Payments-Cancel_Button_[MOB_ANDROID]_2

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "corporate_recipient_iban" in element id "nlb-input-account-number"
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by id "nlb-input-purpose-code" to appear
    And Assert element by text "UPN payment"
    And Assert element by text "Debtor"
    And Swipe vertical
    And Enter text "Testing" in element id "nlb-input-purpose"
    And Enter text "00" in element id "nlb-input-reference-model"
    And Enter text "123456789" in element id "nlb-input-reference-number"

    Then Click on element by text "Cancel"
    And Assert element by text "Are you sure?"
    And Assert element by text "Cancelling now will terminate the payment process."
    And Assert element by text "No"
    And Assert element by text "Yes"
    And Click on element by text "No"
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert element by text "EUR"
    And Assert text "OTHR - Other" in element id "nlb-input-purpose-code"
    And Assert text "TESTING" in element id "nlb-input-purpose"
    And Assert text "00" in element id "nlb-input-reference-model"
    And Assert text "123456789" in element id "nlb-input-reference-number"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by text "Cancel"
    And Click on element by text "Yes"
    And Assert element by text "Payments and transfers"

    Examples:
      | rowindex |
      |        2 |


  @Payments_SEPA_Payments-Back_Button_[MOB_ANDROID]
  Scenario Outline: Payments_SEPA_Payments-Back_Button_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "corporate_recipient_iban" in element id "nlb-input-account-number"
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by id "nlb-input-purpose-code" to appear

    Then Assert element by text "UPN payment"
    And Assert element by text "Debtor"
    And Swipe vertical
    And Enter text "Testing" in element id "nlb-input-purpose"
    And Enter text "00" in element id "nlb-input-reference-model"
    And Enter text "123456789" in element id "nlb-input-reference-number"
    And Click on element by text "Next"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Debtor" to appear for "60" seconds

    And Assert element by text "Debtor"
    And Assert Debtor in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "personal_account_name" and iban "personal_account_iban"
    And Assert element by text "Recipient"
    And Assert SEPA Recipient has icon "EL" and from Excel "<rowindex>" account name "corporate_recipient_name" and iban "corporate_recipient_iban"
    And Click on element by id "nlb-icon-row"
    And Assert text in excel "<rowindex>" columnName "corporate_recipient_name" in element id "nlb-input-recipient-name"
    #And Assert text in excel "<rowindex>" columnName "corporate_recipient_address" in element id "nlb-input-recipient-address"
    And Assert text in excel "<rowindex>" columnName "corporate_recipient_city" in element id "nlb-input-recipient-city"
    And Assert text in excel "<rowindex>" columnName "corporate_recipient_country" in element id "nlb-input-recipient-country"
    And Click on element by text from excel "<rowindex>" columnName "corporate_recipient_iban"
    And Assert element by text "Save recipient"
    And Assert element "nlb-checkbox-update-recipient" by id
    And Assert element by text "Payment"
    And Assert element by text "In order to continue all input fields must be filled."
    And Assert element by text "Payment amount"
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert element by text "EUR"
    And Assert element by text "Purpose code"
    And Assert text "OTHR - Other" in element id "nlb-input-purpose-code"
    And Swipe vertical
    And Assert element by text "Purpose"
    And Assert text "TESTING" in element id "nlb-input-purpose"
    And Assert element by text "Reference"
    And Assert element by text "SI"
    And Assert element by text "Model"
    And Assert text "00" in element id "nlb-input-reference-model"
    And Assert element by text "Reference number"
    And Assert text "123456789" in element id "nlb-input-reference-number"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Enter data and payment type will be automatically selected on next step." to appear for "60" seconds
    And Assert text from excel "<rowindex>" columnName "corporate_recipient_iban" in element by id "nlb-input-account-number"

    Examples:
      | rowindex |
      |        4 |


  @Payments_SEPA_Personal_Account_to_Retail_Account-EUR_[MOB_ANDROID]
  Scenario Outline: Payments_SEPA_Personal_Account_to_Retail_Account-EUR_[MOB_ANDROID]
    #C76159,C76165
    #This is also change balance test for sepa payments

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
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_name"
    And Assert that second text "Address" has first following sibling that contains text "TEST"
    And Assert that second text "Address" has first following sibling that contains text "SLOVENIA"
    And Swipe vertical
    And Swipe vertical
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Assert element by text "Payment"
    And Assert that text "Reference" has first following sibling with text "NRC"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "SP_001"
    And Assert that text "Purpose code" has first following sibling with text "OTHR"
    And Assert that text "Payment date" has first following sibling with current date in format "d.M.yyyy"
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
    And Check if current balance is lowered by "10" using balance from key "IT_001_Debtor_Balance" for currency "EUR"
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

    And Scroll until element with text from txt file under key "SP_001" is in view and click
    And Wait for element by text "Recipient"


    Then Assert element by text "Payment details"
    And Assert element "nlb-date" by id has current date in format "d.M.yyyy"
    And Assert text under key "SP_001" from txt file in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "retail_recipient_name" in element by id "nlb-details"
    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_name_and_address_past_payment"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Assert that text "Reference" has first following sibling with text "NRC"
    And Assert that text "Purpose code" has first following sibling with text "OTHR"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_details"
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Scroll down until element with text "Executed" is in view
    #And Assert that text "Debtor address" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_payment_address"
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert that text "Payment status" has first following sibling with text "Executed"



    Examples:
      | rowindex |
      |        4 |


  @Payments_SEPA_Authorized_Personal_Account_to_Retail_Account-EUR_[MOB_ANDROID]
  Scenario Outline: Payments_SEPA_Authorized_Personal_Account_to_Retail_Account-EUR_[MOB_ANDROID]
    #C76160

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "retail_recipient_iban" in element id "nlb-input-account-number"
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by id "nlb-input-recipient-name" to appear
    #Changing debtor
    And Click on Debtor selector for payment
    And Wait for element by text "Select account"
    And Assert element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "auth_personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "auth_personal_account_iban"
    #And Wait for element by text "nlb-input-recipient-name"
    #End of changing debtor
    And Enter text from excel "<rowindex>" columnName "retail_recipient_name" in element id "nlb-input-recipient-name"
    And Enter text "TEST" in element id "nlb-input-recipient-address"
    And Enter text "TEST" in element id "nlb-input-recipient-city"
    And Swipe vertical
    And Swipe vertical
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Assert text "OTHR - Other" in element id "nlb-input-purpose-code"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "SP_002" in txt file
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
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "auth_user_name_for_payment_review"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "auth_user_address_for_payment_review"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "auth_personal_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_name"
    And Assert that second text "Address" has first following sibling that contains text "TEST"
    And Assert that second text "Address" has first following sibling that contains text "SLOVENIA"
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_iban"
    And Swipe vertical
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Assert element by text "Payment"
    And Assert that text "Reference" has first following sibling with text "NRC"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "SP_002"
    And Assert that text "Purpose code" has first following sibling with text "OTHR"
    And Assert that text "Payment date" has first following sibling with current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"

    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"

    And Click on element by text "Past payments"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "auth_personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "auth_personal_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    And Scroll until element with text from txt file under key "SP_002" is in view and click
    And Wait for element by text "Recipient"


    Then Assert element by text "Payment details"
    And Assert element "nlb-date" by id has current date in format "d.M.yyyy"
    And Assert text under key "SP_002" from txt file in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "retail_recipient_name" in element by id "nlb-details"
    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_name_and_address_past_payment"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Assert that text "Reference" has first following sibling with text "NRC"
    And Assert that text "Purpose code" has first following sibling with text "OTHR"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "auth_user_name_for_payment_details"
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "auth_personal_account_iban"
    And Scroll down until element with text "Executed" is in view
    #And Assert that text "Debtor address" has first following sibling with text from Excel "<rowindex>" columnName "auth_personal_account_payment_address"
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert that text "Payment status" has first following sibling with text "Executed"


    Examples:
      | rowindex |
      |        4 |


  @Payments_SEPA_Personal_Account_to_Corporate_Account-EUR_[MOB_ANDROID]
  Scenario Outline: Payments_SEPA_Personal_Account_to_Corporate_Account-EUR_[MOB_ANDROID]
    #C76161

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
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "corporate_recipient_iban" in element id "nlb-input-account-number"
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by id "nlb-checkbox-update-recipient" to appear
    And Scroll down until element with id "nlb-button-primary" is in view
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Assert text "OTHR - Other" in element id "nlb-input-purpose-code"
    And Set flag "corp" in framework
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "SP_003" in txt file
    And Click "Expand dropdown menu" content description from tag "ImageView"
    And Click on element by text "NRC - No reference"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 EUR"
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert element by text "Debtor"
    And Assert that text "First and last name / Company name" has first following sibling that contains from Excel "<rowindex>" columnName "user_name_short"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "corporate_recipient_name"
    #And Assert that second text "Address" has first following sibling that contains text "VEROVŠKOVA ULICA 62"
    And Assert that second text "Address" has first following sibling that contains text from Excel "<rowindex>" columnName "corporate_recipient_address"
    And Assert that second text "Address" has first following sibling that contains text "SLOVENIA"
    And Swipe vertical
    And Swipe vertical
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "corporate_recipient_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Assert element by text "Payment"
    And Assert that text "Reference" has first following sibling with text "NRC"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "SP_003"
    And Assert that text "Purpose code" has first following sibling with text "OTHR"
    And Assert that text "Payment date" has first following sibling with current date in format "d.M.yyyy"
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
    And Check if current balance is lowered by "10" using balance from key "IT_001_Debtor_Balance" for currency "EUR"
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

    And Scroll until element with text from txt file under key "SP_003" is in view and click
    And Wait for element by text "Recipient"


    Then Assert element by text "Payment details"
    And Assert element "nlb-date" by id has current date in format "d.M.yyyy"
    And Assert text under key "SP_003" from txt file in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "corporate_recipient_name" in element by id "nlb-details"
    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "corporate_recipient_name_and_address_past_payment"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "corporate_recipient_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Assert that text "Reference" has first following sibling with text "NRC"
    And Assert that text "Purpose code" has first following sibling with text "OTHR"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_details"
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Scroll down until element with text "Executed" is in view
    #And Assert that text "Debtor address" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_payment_address"
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert that text "Payment status" has first following sibling with text "Executed"



    Examples:
      | rowindex |
      |        4 |

  @Payments_SEPA_Authorized_Personal_Account_to_Corporate_Account-EUR_[MOB_ANDROID]
  Scenario Outline: Payments_SEPA_Authorized_Personal_Account_to_Corporate_Account-EUR_[MOB_ANDROID]
    #C76162

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "corporate_recipient_iban" in element id "nlb-input-account-number"
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by id "nlb-checkbox-update-recipient" to appear
    #Changing debtor
    And Click on Debtor selector for payment
    And Wait for element by text "Select account"
    And Assert element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "auth_personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "auth_personal_account_iban"
    #And Wait for element by text "nlb-input-recipient-name"
    #End of changing debtor
    And Swipe vertical
    And Swipe vertical
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Assert text "OTHR - Other" in element id "nlb-input-purpose-code"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "SP_004" in txt file
    And Click "Expand dropdown menu" content description from tag "ImageView"
    And Click on element by text "NRC - No reference"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Swipe vertical

    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 EUR"
    And Assert that text "Informative fee" has first following sibling with text "0,40 EUR"
    And Assert element by text "Debtor"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "auth_user_name_for_payment_review"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "auth_user_address_for_payment_review"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "auth_personal_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "corporate_recipient_name"
    And Assert that second text "Address" has first following sibling that contains text "VEROVŠKOVA ULICA 62"
    And Assert that second text "Address" has first following sibling that contains text "SLOVENIA"
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "corporate_recipient_iban"
    And Swipe vertical
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Assert element by text "Payment"
    And Assert that text "Reference" has first following sibling with text "NRC"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "SP_004"
    And Assert that text "Purpose code" has first following sibling with text "OTHR"
    And Assert that text "Payment date" has first following sibling with current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"

    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"

    And Click on element by text "Past payments"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "auth_personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "auth_personal_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    And Scroll until element with text from txt file under key "SP_004" is in view and click
    And Wait for element by text "Recipient"


    Then Assert element by text "Payment details"
    And Assert element "nlb-date" by id has current date in format "d.M.yyyy"
    And Assert text under key "SP_004" from txt file in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "corporate_recipient_name" in element by id "nlb-details"
    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "corporate_recipient_name_and_address_past_payment"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "corporate_recipient_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Assert that text "Reference" has first following sibling with text "NRC"
    And Assert that text "Purpose code" has first following sibling with text "OTHR"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "auth_user_name_for_payment_details"
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "auth_personal_account_iban"
    And Scroll down until element with text "Executed" is in view
    #And Assert that text "Debtor address" has first following sibling with text from Excel "<rowindex>" columnName "auth_personal_account_payment_address"
    And Assert that text "Informative fee" has first following sibling with text "0,40 EUR"
    And Assert that text "Payment status" has first following sibling with text "Executed"



    Examples:
      | rowindex |
      |        4 |

  @Payments_SEPA_Personal_Account_Reference_SI_to_Corporate_Account-EUR_[MOB_ANDROID]
  Scenario Outline: Payments_SEPA_Personal_Account_Reference_SI_to_Corporate_Account-EUR_[MOB_ANDROID]
    #C76163

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "corporate_recipient_iban" in element id "nlb-input-account-number"
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by id "nlb-checkbox-update-recipient" to appear
    And Swipe vertical
    And Swipe vertical
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Assert text "OTHR - Other" in element id "nlb-input-purpose-code"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "SP_005" in txt file
    And Enter text "12" in element id "nlb-input-reference-model"
    And Enter text "1009992424964" in element id "nlb-input-reference-number"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Swipe vertical

    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 EUR"
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert element by text "Debtor"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_review"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "corporate_recipient_name"
    And Assert that second text "Address" has first following sibling that contains text "VEROVŠKOVA ULICA 62"
    And Assert that second text "Address" has first following sibling that contains text "SLOVENIA"
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "corporate_recipient_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Swipe vertical
    And Assert element by text "Payment"
    And Assert that text "Reference" has first following sibling with text "SI12 1009992424964"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "SP_005"
    And Assert that text "Purpose code" has first following sibling with text "OTHR"
    And Assert that text "Payment date" has first following sibling with current date in format "d.M.yyyy"
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

    And Scroll until element with text from txt file under key "SP_005" is in view and click
    And Wait for element by text "Recipient"


    Then Assert element by text "Payment details"
    And Assert element "nlb-date" by id has current date in format "d.M.yyyy"
    And Assert text under key "SP_005" from txt file in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "corporate_recipient_name" in element by id "nlb-details"
    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "corporate_recipient_name_and_address_past_payment"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "corporate_recipient_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Assert that text "Reference" has first following sibling with text "SI12 1009992424964"
    And Assert that text "Purpose code" has first following sibling with text "OTHR"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_details"
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Scroll down until element with text "Executed" is in view
    #And Assert that text "Debtor address" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_payment_address"
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert that text "Payment status" has first following sibling with text "Executed"



    Examples:
      | rowindex |
      |        4 |


  @Payments_SEPA_Personal_Account_Reference_RF_to_Corporate_Account-EUR_[MOB_ANDROID]
  Scenario Outline: Payments_SEPA_Personal_Account_Reference_RF_to_Corporate_Account-EUR_[MOB_ANDROID]
    #C76164

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "corporate_recipient_iban" in element id "nlb-input-account-number"
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by id "nlb-checkbox-update-recipient" to appear
    And Swipe vertical
    And Swipe vertical
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Assert text "OTHR - Other" in element id "nlb-input-purpose-code"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "SP_006" in txt file
    And Click "Expand dropdown menu" content description from tag "ImageView"
    And Click on element by text "RF"
    And Enter text "45G72UUR" in element id "nlb-input-reference-number"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Swipe vertical

    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 EUR"
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert element by text "Debtor"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_review"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "corporate_recipient_name"
    And Assert that second text "Address" has first following sibling that contains text "VEROVŠKOVA ULICA 62"
    And Assert that second text "Address" has first following sibling that contains text "SLOVENIA"
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "corporate_recipient_iban"
    And Swipe vertical
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Assert element by text "Payment"
    And Assert that text "Reference" has first following sibling with text "RF 45G72UUR"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "SP_006"
    And Assert that text "Purpose code" has first following sibling with text "OTHR"
    And Assert that text "Payment date" has first following sibling with current date in format "d.M.yyyy"
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

    And Scroll until element with text from txt file under key "SP_006" is in view and click
    And Wait for element by text "Recipient"


    Then Assert element by text "Payment details"
    And Assert element "nlb-date" by id has current date in format "d.M.yyyy"
    And Assert text under key "SP_006" from txt file in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "corporate_recipient_name" in element by id "nlb-details"
    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "corporate_recipient_name_and_address_past_payment"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "corporate_recipient_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Assert that text "Reference" has first following sibling with text "RF45G72UUR"
    And Assert that text "Purpose code" has first following sibling with text "OTHR"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_details"
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Scroll down until element with text "Executed" is in view
    #And Assert that text "Debtor address" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_payment_address"
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert that text "Payment status" has first following sibling with text "Executed"



    Examples:
      | rowindex |
      |        4 |


  @Payments_SEPA_Personal_Account_Reference_SI_99_to_Corporate_Account-EUR_[MOB_ANDROID]
  Scenario Outline: Payments_SEPA_Personal_Account_Reference_SI_99_to_Corporate_Account-EUR_[MOB_ANDROID]
    #C76166

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "corporate_recipient_iban" in element id "nlb-input-account-number"
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by id "nlb-checkbox-update-recipient" to appear
    And Swipe vertical
    And Swipe vertical
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Assert text "OTHR - Other" in element id "nlb-input-purpose-code"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "SP_007" in txt file
    And Enter text "99" in element id "nlb-input-reference-model"
    And Assert element by text "Reference number" is not displayed
    And Assert element by id "nlb-input-reference-number" is not displayed
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Swipe vertical

    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 EUR"
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert element by text "Debtor"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_review"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "corporate_recipient_name"
    And Assert that second text "Address" has first following sibling that contains text "VEROVŠKOVA ULICA 62"
    And Assert that second text "Address" has first following sibling that contains text "SLOVENIA"
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "corporate_recipient_iban"
    And Swipe vertical
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Assert element by text "Payment"
    And Assert that text "Reference" has first following sibling with text "SI99"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "SP_007"
    And Assert that text "Purpose code" has first following sibling with text "OTHR"
    And Assert that text "Payment date" has first following sibling with current date in format "d.M.yyyy"
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

    And Scroll until element with text from txt file under key "SP_007" is in view and click
    And Wait for element by text "Recipient"


    Then Assert element by text "Payment details"
    And Assert element "nlb-date" by id has current date in format "d.M.yyyy"
    And Assert text under key "SP_007" from txt file in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "corporate_recipient_name" in element by id "nlb-details"
    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "corporate_recipient_name_and_address_past_payment"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "corporate_recipient_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Assert that text "Reference" has first following sibling with text "SI99 "
    And Assert that text "Purpose code" has first following sibling with text "OTHR"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_details"
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Scroll down until element with text "Executed" is in view
    #And Assert that text "Debtor address" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_payment_address"
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert that text "Payment status" has first following sibling with text "Executed"



    Examples:
      | rowindex |
      |        4 |

  @Payments_SEPA_Personal_Account_to_Retail_Account_In_Future-EUR_[MOB_ANDROID]
  Scenario Outline: Payments_SEPA_Personal_Account_to_Retail_Account_In_Future-EUR_[MOB_ANDROID]
    #C76167

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

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
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "SP_008" in txt file
    And Assert element by text "NRC - No reference"
    And Click on date "7" days in the future in calendar
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 EUR"
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert element by text "Debtor"
    #And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_review"
    And Assert that text "First and last name / Company name" has first following sibling that contains from Excel "<rowindex>" columnName "user_name_short"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_name"
    And Assert that second text "Address" has first following sibling that contains text "TEST"
    And Assert that second text "Address" has first following sibling that contains text "SLOVENIA"
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_iban"
    And Swipe vertical
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Assert element by text "Payment"
    And Assert that text "Reference" has first following sibling with text "NRC"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "SP_008"
    And Assert that text "Purpose code" has first following sibling with text "OTHR"
    And Assert that text "Payment date" has first following sibling with future date "7" in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"
    And Wait for element by text "Upcoming payments"
    And Click on element by text "Upcoming payments"
    And Wait for element by id "nlb-title" to appear
    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Scroll until element with text from txt file under key "SP_008" is in view and click
    And Wait for element by text "Recipient"


    Then Assert element by text "Payment details"
    And Assert element by id "nlb-date" has date "7" day in the future in format "d.M.yyyy"
    And Assert text under key "SP_008" from txt file in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "retail_recipient_name" in element by id "nlb-details"
    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_name_and_address_past_payment"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "retail_recipient_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Assert that text "Reference" has first following sibling with text "NRC"
    And Assert that text "Purpose code" has first following sibling with text "OTHR"
    And Assert that text "First and last name / Company name" has first following sibling that contains from Excel "<rowindex>" columnName "user_name_short"
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Swipe vertical short
    #And Assert that text "Debtor address" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_payment_address"
    And Assert that text "Payment status" has first following sibling with text "Pending"



    Examples:
      | rowindex |
      |        4 |


  @Payments_SEPA_Payments-Confirmation_[MOB_ANDROID]
  Scenario Outline: Payments_SEPA_Payments-Confirmation_[MOB_ANDROID]
    #C71267
    #BUG On android 16 1.000,00 is 1000,00
    #Only happens on 4 digit numbers

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "corporate_recipient_iban" in element id "nlb-input-account-number"
    And Enter text "1000" in element id "nlb-amount-with-currency-field"
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by id "nlb-checkbox-update-recipient" to appear
    And Click on element by text "Save recipient"
    And Assert currency in second payment screen is "EUR"
    And Assert text "OTHR - Other" in element id "nlb-input-purpose-code"
    And Swipe vertical
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "SP_003" in txt file
    And Click "Expand dropdown menu" content description from tag "ImageView"
    And Click on element by text "NRC - No reference"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
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
    And Assert element by text "IBAN:" has first following sibling from excel "<rowindex>" columnName "corporate_recipient_iban"
    And Assert element by text "Amount:" has first following sibling "1.000,00"
    And Assert element by text "Currency:" has first following sibling "EUR"
    And Assert element by text "Only confirm payments you’ve entered yourself. If you don’t recognize this payment, reject it."
    And Assert element by text "Reject"
    And Assert element by text "Confirm"
    And Click on element by text "Reject"




    Examples:
      | rowindex |
      |        4 |

  @Payments_SEPA_Payments-Modify_Data_[MOB_ANDROID]
  Scenario Outline: Payments_SEPA_Payments-Modify_Data_[MOB_ANDROID]
    #C71272

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "corporate_recipient_iban" in element id "nlb-input-account-number"
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by id "nlb-checkbox-update-recipient" to appear
    And Select account from Excel "<rowindex>" columnName "second_personal_account_iban" as debtor in payment screen
    And Swipe vertical
    And Swipe vertical
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Assert text "OTHR - Other" in element id "nlb-input-purpose-code"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "SP_003" in txt file
    And Click "Expand dropdown menu" content description from tag "ImageView"
    And Click on element by text "NRC - No reference"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-input-purpose-code" to appear
    And Select account from Excel "<rowindex>" columnName "personal_account_iban" as debtor in payment screen
    And Wait for element by id "nlb-input-purpose-code" to appear
    And Enter text "15" in element id "nlb-amount-with-currency-field"
    And Swipe vertical
    And Click on date "7" days in the future in calendar
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "15,00 EUR"
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert element by text "Debtor"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_review"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "corporate_recipient_name"
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "corporate_recipient_iban"
    And Swipe vertical
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Assert element by text "Payment"
    And Assert that text "Reference" has first following sibling with text "NRC"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "SP_003"
    And Assert that text "Purpose code" has first following sibling with text "OTHR"
    And Assert that text "Payment date" has first following sibling with future date "7" in format "d.M.yyyy"
    And Scroll down until element with id "nlb-button-primary" is in view
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

    And Scroll until element with text from txt file under key "SP_003" is in view and click
    And Wait for element by text "Recipient"


    Then Assert element by text "Payment details"
    And Assert element by id "nlb-date" has date "7" day in the future in format "d.M.yyyy"
    And Assert text under key "SP_003" from txt file in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert text "15,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "corporate_recipient_name" in element by id "nlb-details"
    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "corporate_recipient_name_and_address_past_payment"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "corporate_recipient_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Assert that text "Reference" has first following sibling with text "NRC"
    And Assert that text "Purpose code" has first following sibling with text "OTHR"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_details"
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Scroll down until element with text "Pending" is in view
    And Assert that text "Payment status" has first following sibling with text "Pending"



    Examples:
      | rowindex |
      |        4 |


  @SEPA_-Insufficient_funds[Android]
  Scenario Outline: SEPA_-Insufficient_funds[Android]
    #C76168

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "corporate_recipient_iban" in element id "nlb-input-account-number"
    And Enter text "999999999" in element id "nlb-amount-with-currency-field"
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by id "nlb-checkbox-update-recipient" to appear
    And Swipe vertical
    And Swipe vertical
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "SP_003" in txt file
    And Click "Expand dropdown menu" content description from tag "ImageView"
    And Click on element by text "NRC - No reference"
    And Scroll down until element with id "nlb-button-primary" is in view
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Scroll down until element with id "nlb-button-primary" is in view
    And Click on element by id "nlb-button-primary"

    And Try to assert that payment is "Confirmation failed" and send command to OTP method
    And Check if PIN is needed and complete payment for "Confirmation failed" with assert



    Examples:
      | rowindex |
      |        4 |

  @Payments_SEPA_Payments-Confirmation-invalid_Then_Confirm_[MOB_ANDROID]
  Scenario Outline: Payments_SEPA_Payments-Confirmation-invalid_Then_Confirm_[MOB_ANDROID]
    #C71268

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "corporate_recipient_iban" in element id "nlb-input-account-number"
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by id "nlb-checkbox-update-recipient" to appear
    And Click on element by text "Save recipient"
    And Assert currency in second payment screen is "EUR"
    And Assert text "OTHR - Other" in element id "nlb-input-purpose-code"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "SP_003" in txt file
    And Swipe vertical
    And Click "Expand dropdown menu" content description from tag "ImageView"
    And Click on element by text "NRC - No reference"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
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
    And Scroll until element with text from excel "<rowindex>" columnName "corporate_recipient_iban" is in view
    And Assert saved contact has short "EL" and name from Excel "<rowindex>" columnName "corporate_recipient_name" and iban from Excel "<rowindex>" columnName "corporate_recipient_iban"
    And Click on element by text from excel "<rowindex>" columnName "corporate_recipient_iban"
    And Assert element by text "Recipient details"
    And Assert element by text "Address"
    And Assert that text "Address" has first following sibling that contains from Excel "<rowindex>" columnName "corporate_recipient_address"
    And Assert that text "Address" has first following sibling that contains from Excel "<rowindex>" columnName "corporate_recipient_city"
    And Assert that text "Address" has first following sibling that contains from Excel "<rowindex>" columnName "corporate_recipient_country"
    And Assert element by text "SWIFT (BIC) Code"
    And Assert that text "SWIFT (BIC) Code" has first following sibling that contains text "LJBASI20XXX"
    And Click on element by text "Delete "
    And Wait for element by text "Delete recipient"
    And Click on element by text "Delete"


    Examples:
      | rowindex |
      |        4 |


  @Payments_SEPA_Payments-Confirmation-invalid_Then_Reject_[MOB_ANDROID]
  Scenario Outline: Payments_SEPA_Payments-Confirmation-invalid_Then_Reject_[MOB_ANDROID]
    #C71268

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "corporate_recipient_iban" in element id "nlb-input-account-number"
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by id "nlb-checkbox-update-recipient" to appear
    And Click on element by text "Save recipient"
    And Assert currency in second payment screen is "EUR"
    And Assert text "OTHR - Other" in element id "nlb-input-purpose-code"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "SP_003" in txt file
    And Swipe vertical
    And Click "Expand dropdown menu" content description from tag "ImageView"
    And Click on element by text "NRC - No reference"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
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
    And Click on element by id "nlb-button-alternate"

    Then Assert element by text "Payment confirmation rejected"



    Examples:
      | rowindex |
      |        4 |