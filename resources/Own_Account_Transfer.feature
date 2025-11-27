Feature: Own_Account_Transfer

  @Payments_Own_Account_Transfer-Input_[MOB_ANDROID]
  Scenario Outline: Payments_Own_Account_Transfer-Input_[MOB_ANDROID]
    #C71233,C71235

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Click on element by id "nlb-button-alternate"
    And Wait for element with "Current account" content description from view tag "View"
    And Remove keyboard
    And Scroll until element with text from excel "<rowindex>" columnName "gradual_savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "gradual_savings_account_iban"
    And Wait for element by text "Set amount and currency" to appear for "30" seconds
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Click on element by text "Next"
    And Wait for element by id "nlb-input-purpose" to appear

    Then Assert element by contains text "Own account Transfer"
    And Assert element by contains text "Check data and choose"
    And Assert element by contains text "Debtor"
    And Assert Debtor in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "personal_account_name" and iban "personal_account_iban"
    And Assert Recipient in Own Account Transfer has content description "Savings" and from Excel "<rowindex>" account name "gradual_savings_account_name" and iban "gradual_savings_account_iban"
    And Assert element by text "Payment"
    And Assert element by contains text "In order to continue all input fields must be filled."
    And Assert element by text "Payment amount"
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Click on element by text "EUR"
    And Assert element by text "USD" is not displayed
    And Assert element by text "Purpose"
    And Assert text "INTERNAL TRANSFER" in element id "nlb-input-purpose"
    And Assert element by text "Payment date"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element with "Savings Account" content description from view tag "View"
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by id "nlb-input-purpose" to appear
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
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "savings_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_review"
    And Assert that second text "Address" has first following sibling with text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "gradual_savings_account_iban"
    #And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Swipe vertical
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI2X"
    And Assert element by text "Payment"
    And Assert that text "Purpose" has first following sibling with text "INTERNAL TRANSFER"
    And Assert that text "Payment date" has first following sibling with current date in format "d.M.yyyy"


    Examples:
      | rowindex |
      |        4 |

  @Payments_Own_Account_Transfer-Input-Invalid_[MOB_ANDROID]
  Scenario Outline: Payments_Own_Account_Transfer-Input-Invalid_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Click on element by id "nlb-button-alternate"
    And Wait for element with "Current account" content description from view tag "View"
    And Remove keyboard
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by text "Set amount and currency" to appear for "30" seconds
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Click on element by text "Next"
    And Wait for element by id "nlb-input-purpose" to appear

    Then Enter text "10000000000" in element id "nlb-amount-with-currency-field"
    And Assert element by contains text "Maximum amount is 999.999.999,99 EUR."
    And Enter text "0.00" in element id "nlb-amount-with-currency-field"
    And Assert element by contains text "Minimum amount is 0,01 EUR"
    And Enter text "" in element id "nlb-amount-with-currency-field"
    And Assert element by contains text "Payment amount is required"
    And Enter text "!@$" in element id "nlb-amount-with-currency-field"
    And Assert element by id "nlb-amount-with-currency-field" that has descendant text "0,00"
    And Swipe vertical
    And Enter text "_" in element id "nlb-input-purpose"
    And Assert element by contains text with special characters "Please use the following characters: A B C D E F G H I J K L M N O P Q R S T U V W X Y Z Č Ć Ž Š Đ 0 1 2 3 4 5 6 7 8 9 / - ? : ( ) . , ' & - space"
    And Enter text "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" in element id "nlb-input-purpose"
    And Assert element by contains text "Maximum number of characters is 140."
    And Enter text "" in element id "nlb-input-purpose"
    And Assert element by contains text "Purpose is required"
    And Assert element "nlb-button-primary" by id is disabled



    Examples:
      | rowindex |
      |        4 |

  @Payments_Own_Account_Transfer-In_Future-invalid_[MOB_ANDROID]
  Scenario Outline: Payments_Own_Account_Transfer-In_Future-invalid_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Click on element by id "nlb-button-alternate"
    And Wait for element with "Current account" content description from view tag "View"
    And Remove keyboard
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by text "Set amount and currency" to appear for "30" seconds
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Click "Expand dropdown menu" content description from tag "ImageView"
    And Scroll down until currency "USD" in selector is found and click
    And Click on element by text "Next"
    And Wait for element by id "nlb-input-purpose" to appear

    Then Assert Debtor in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "personal_account_name" and iban "personal_account_iban"
    And Swipe vertical
    And Assert element by id "nlb-input-payment-date-click-area" is not displayed



    Examples:
      | rowindex |
      |       1  |

  @Payments_Own_Account_Transfer-Cancel_Button_[MOB_ANDROID]_1
  Scenario Outline: Payments_Own_Account_Transfer-Cancel_Button_[MOB_ANDROID]_1

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Click on element by id "nlb-button-alternate"
    And Wait for element with "Current account" content description from view tag "View"
    And Remove keyboard
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by text "Set amount and currency" to appear for "30" seconds
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Click on element by text "Next"
    And Wait for element by id "nlb-input-purpose" to appear

    Then Assert element by contains text "Own account Transfer"
    And Assert text "INTERNAL TRANSFER" in element id "nlb-input-purpose"
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount"
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
      |        4 |


  @Payments_Own_Account_Transfer-Cancel_Button_[MOB_ANDROID]_2
  Scenario Outline: Payments_Own_Account_Transfer-Cancel_Button_[MOB_ANDROID]_2

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Click on element by id "nlb-button-alternate"
    And Wait for element with "Current account" content description from view tag "View"
    And Remove keyboard
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by text "Set amount and currency" to appear for "30" seconds
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Click on element by text "Next"
    And Wait for element by id "nlb-input-purpose" to appear

    Then Assert element by contains text "Own account Transfer"
    And Scroll down until element with text "Cancel" is in view
    And Click on element by text "Cancel"
    And Assert element by text "Are you sure?"
    And Assert element by text "Cancelling now will terminate the payment process."
    And Assert element by text "No"
    And Assert element by text "Yes"
    And Click on element by text "No"
    And Assert Recipient in Own Account Transfer has content description "Savings Account" and from Excel "<rowindex>" account name "savings_account_name" and iban "savings_account_iban"
    And Assert element by text "Payment"
    And Assert element by contains text "In order to continue all input fields must be filled."
    And Assert element by text "Payment amount"
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert element by text "Purpose"
    And Assert text "INTERNAL TRANSFER" in element id "nlb-input-purpose"
    And Assert element by text "Payment date"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by text "Cancel"
    And Click on element by text "Yes"
    And Assert element by text "Payments and transfers"



    Examples:
      | rowindex |
      |        4 |


  @Payments_Own_Account_Transfer-Back_Button_[MOB_ANDROID]
  Scenario Outline: Payments_Own_Account_Transfer-Back_Button_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Click on element by id "nlb-button-alternate"
    And Wait for element with "Current account" content description from view tag "View"
    And Remove keyboard
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by text "Set amount and currency" to appear for "30" seconds
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Click on element by text "Next"
    And Wait for element by id "nlb-input-purpose" to appear
    And Assert element by contains text "Own account Transfer"
    And Scroll down until element with text "Next" is in view
    And Click on element by text "Next"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Debtor" to appear for "60" seconds
    And Assert element by contains text "Check data and choose"
    And Assert element by contains text "Debtor"
    And Assert Debtor in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "personal_account_name" and iban "personal_account_iban"
    And Assert Recipient in Own Account Transfer has content description "Savings Account" and from Excel "<rowindex>" account name "savings_account_name" and iban "savings_account_iban"
    And Assert element by text "Payment"
    And Assert element by contains text "In order to continue all input fields must be filled."
    And Assert element by text "Payment amount"
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert element by text "Purpose"
    And Assert text "INTERNAL TRANSFER" in element id "nlb-input-purpose"
    And Assert element by text "Payment date"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Enter data and payment type will be automatically selected on next step." to appear for "60" seconds
    And Assert recipient in first step of payment is "Savings Account" from Excel "<rowindex>" account name "savings_account_name" and iban "savings_account_iban"
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"


    Examples:
      | rowindex |
      |        4 |



  @Personal_Account_to_Personal_account-EUR-[MOB_ANDROID]
  Scenario Outline: Personal_Account_to_Personal_account-EUR-[MOB_ANDROID]
    #C76150
    #This is also change balance test for internal transfer

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
    And Scroll until element with text from excel "<rowindex>" columnName "second_personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "second_personal_account_iban"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Remember available balance in currency "EUR" under key "IT_001_Creditor_Balance"
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-value-product-primary-balance" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Click on element by id "nlb-button-alternate"
    And Wait for element with "Current account" content description from view tag "View"
    And Remove keyboard
    And Scroll until element with text from excel "<rowindex>" columnName "second_personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "second_personal_account_iban"
    And Wait for element by text "Set amount and currency" to appear for "30" seconds
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Click on element by text "Next"
    And Wait for element by id "nlb-input-purpose" to appear

    Then Assert element by contains text "Own account Transfer"
    And Assert element by contains text "Check data and choose"
    And Assert element by contains text "Debtor"
    And Assert Debtor in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "personal_account_name" and iban "personal_account_iban"
    And Assert Recipient in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "second_personal_account_name" and iban "second_personal_account_iban"
    And Assert element by text "Payment"
    And Assert element by contains text "In order to continue all input fields must be filled."
    And Assert element by text "Payment amount"
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Click on element by text "EUR"
    And Assert element by text "USD" is not displayed
    And Assert element by text "Purpose"
    And Assert text "INTERNAL TRANSFER" in element id "nlb-input-purpose"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "int_01" in txt file
    And Assert element by text "Payment date"
    And Swipe vertical
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
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
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_review"
    And Assert that second text "Address" has first following sibling with text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "second_personal_account_iban"
    #And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Swipe vertical
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI2X"
    And Assert element by text "Payment"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "int_01"
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
    And Scroll until element with text from excel "<rowindex>" columnName "second_personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "second_personal_account_iban"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Check if current balance is increased by "10" using balance from key "IT_001_Creditor_Balance" for currency "EUR"
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

    And Scroll until element with text from txt file under key "int_01" is in view and click
    And Wait for element by text "Recipient"
    And Assert element by text "Payment details"
    And Assert element "nlb-date" by id has current date in format "d.M.yyyy"
    And Assert text under key "int_01" from txt file in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "user_name_for_payment_details" in element by id "nlb-details"

    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "username_and_address"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "second_personal_account_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI2X"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_details"
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Swipe vertical short
    And Scroll down until element with text "Executed" is in view
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert that text "Payment status" has first following sibling with text "Executed"

    Examples:
      | rowindex |
      |        4 |


  @Authorized_Personal_Account_to_Personal_account-EUR-[MOB_ANDROID]
  Scenario Outline: Authorized_Personal_Account_to_Personal_account-EUR-[MOB_ANDROID]
    #C76151

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Click on element by id "nlb-button-alternate"
    And Wait for element with "Current account" content description from view tag "View"
    And Remove keyboard
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by text "Set amount and currency" to appear for "30" seconds
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Click on element by text "Next"
    And Wait for element by id "nlb-input-purpose" to appear

    Then Assert element by contains text "Own account Transfer"
    And Assert element by contains text "Check data and choose"
    And Assert element by contains text "Debtor"
    #Changing debtor
    And Click on Debtor selector for payment
    And Wait for element by text "Select account"
    And Assert element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "auth_personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "auth_personal_account_iban"
    And Wait for element by text "Own account Transfer"
    #End of changing debtor
    And Assert Debtor in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "auth_personal_account_name" and iban "auth_personal_account_iban"
    And Assert Recipient in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "personal_account_name" and iban "personal_account_iban"
    And Assert element by text "Payment"
    And Assert element by contains text "In order to continue all input fields must be filled."
    And Assert element by text "Payment amount"
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Click on element by text "EUR"
    And Assert element by text "USD" is not displayed
    And Assert element by text "Purpose"
    And Assert text "INTERNAL TRANSFER" in element id "nlb-input-purpose"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "int_02" in txt file
    And Assert element by text "Payment date"
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
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_review"
    And Assert that second text "Address" has first following sibling with text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    #And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Swipe vertical
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI2X"
    And Assert element by text "Payment"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "int_02"
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

    And Scroll until element with text from txt file under key "int_02" is in view and click
    And Wait for element by text "Recipient"
    And Assert element by text "Payment details"
    And Assert element "nlb-date" by id has current date in format "d.M.yyyy"
    And Assert text under key "int_02" from txt file in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "user_name_for_payment_details" in element by id "nlb-details"

    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "username_and_address"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI2X"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "auth_user_name_for_payment_details"
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "auth_personal_account_iban"
    #And Assert that text "Debtor address" has first following sibling with text from Excel "<rowindex>" columnName "auth_personal_account_payment_address"
    And Swipe vertical short
    And Scroll down until element with text "Executed" is in view
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert that text "Payment status" has first following sibling with text "Executed"

    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    Examples:
      | rowindex |
      |        4 |


  @Personal_Account_to_Authorized_Personal_account-EUR-[MOB_ANDROID]
  Scenario Outline: Personal_Account_to_Authorized_Personal_account-EUR-[MOB_ANDROID]
    #C76152

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Click on element by id "nlb-button-alternate"
    And Wait for element with "Current account" content description from view tag "View"
    And Remove keyboard
    And Scroll until element with text from excel "<rowindex>" columnName "auth_personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "auth_personal_account_iban"
    And Wait for element by text "Set amount and currency" to appear for "30" seconds
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Click on element by text "Next"
    And Wait for element by id "nlb-input-purpose" to appear

    Then Assert element by contains text "Own account Transfer"
    And Assert element by contains text "Check data and choose"
    And Assert element by contains text "Debtor"
    And Assert Debtor in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "personal_account_name" and iban "personal_account_iban"
    And Assert Recipient in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "auth_personal_account_name" and iban "auth_personal_account_iban"
    And Assert element by text "Payment"
    And Assert element by contains text "In order to continue all input fields must be filled."
    And Assert element by text "Payment amount"
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Click on element by text "EUR"
    And Assert element by text "USD" is not displayed
    And Assert element by text "Purpose"
    And Assert text "INTERNAL TRANSFER" in element id "nlb-input-purpose"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "int_03" in txt file
    And Assert element by text "Payment date"
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
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "auth_user_name_for_payment_review"
    And Assert that second text "Address" has first following sibling with text from Excel "<rowindex>" columnName "auth_user_address_for_payment_review"
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "auth_personal_account_iban"
    #And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Swipe vertical
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI2X"
    And Assert element by text "Payment"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "int_03"
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

    And Scroll until element with text from txt file under key "int_03" is in view and click
    And Wait for element by text "Recipient"
    And Assert element by text "Payment details"
    And Assert element "nlb-date" by id has current date in format "d.M.yyyy"
    And Assert text under key "int_03" from txt file in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "auth_user_name_for_payment_details" in element by id "nlb-details"

    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "auth_username_and_address"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "auth_personal_account_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI2X"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_details"
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    #And Assert that text "Debtor address" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_payment_address"
    And Swipe vertical short
    And Swipe vertical short
    And Scroll down until element with text "Executed" is in view
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert that text "Payment status" has first following sibling with text "Executed"

    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    Examples:
      | rowindex |
      |        4 |



  @Personal_Account_to_Savings_account-EUR-[MOB_ANDROID]
  Scenario Outline: Personal_Account_to_Savings_account-EUR-[MOB_ANDROID]
    #C76153

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    #And Click "My Products" content description from view tag "View"
    #And Wait for element by id "nlb-value-product-primary-balance" to appear
    #And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    #And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    #And Wait for element by id "nlb-product-details-primary-balance" to appear
    #And Remember available balance in currency "EUR" under key "IT_001_Debtor_Balance"
    #And Click "Back" content description from view tag "View"
    #And Wait for element by id "nlb-value-product-primary-balance" to appear
    #And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    #And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    #And Wait for element by id "nlb-product-details-primary-balance" to appear
    #And Remember available balance in currency "EUR" under key "IT_001_Creditor_Balance"
    #And Click "Back" content description from view tag "View"
    #And Wait for element by id "nlb-value-product-primary-balance" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Click on element by id "nlb-button-alternate"
    And Wait for element with "Current account" content description from view tag "View"
    And Remove keyboard
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by text "Set amount and currency" to appear for "30" seconds
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Click on element by text "Next"
    And Wait for element by id "nlb-input-purpose" to appear

    Then Assert element by contains text "Own account Transfer"
    And Assert element by contains text "Check data and choose"
    And Assert element by contains text "Debtor"
    And Assert Debtor in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "personal_account_name" and iban "personal_account_iban"
    And Assert Recipient in Own Account Transfer has content description "Savings Account" and from Excel "<rowindex>" account name "savings_account_name" and iban "savings_account_iban"
    And Assert element by text "Payment"
    And Assert element by contains text "In order to continue all input fields must be filled."
    And Assert element by text "Payment amount"
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Click on element by text "EUR"
    And Assert element by text "USD" is not displayed
    And Assert element by text "Purpose"
    And Assert text "INTERNAL TRANSFER" in element id "nlb-input-purpose"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "int_04" in txt file
    And Assert element by text "Payment date"
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
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "savings_user_name_for_payment_review"
    And Assert that second text "Address" has first following sibling with text from Excel "<rowindex>" columnName "savings_user_address_for_payment_review"
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "savings_account_iban"
    #And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Swipe vertical
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI2X"
    And Assert element by text "Payment"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "int_04"
    And Assert that text "Payment date" has first following sibling with current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"

    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"
    #And Wait "60" seconds
    #And Click "My Products" content description from view tag "View"
    #And Wait for element by id "nlb-value-product-primary-balance" to appear
    #And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    #And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    #And Wait for element by id "nlb-product-details-primary-balance" to appear
    #And Check if current balance is lowered by "10" using balance from key "IT_001_Debtor_Balance" for currency "EUR"
    #And Click "Back" content description from view tag "View"
    #And Wait for element by id "nlb-value-product-primary-balance" to appear
    #And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    #And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    #And Wait for element by id "nlb-product-details-primary-balance" to appear
    #And Check if current balance is increased by "10" using balance from key "IT_001_Creditor_Balance" for currency "EUR"
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

    And Scroll until element with text from txt file under key "int_04" is in view and click
    And Wait for element by text "Recipient"
    And Assert element by text "Payment details"
    And Assert element "nlb-date" by id has current date in format "d.M.yyyy"
    And Assert text under key "int_04" from txt file in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "savings_user_name_for_past_payment" in element by id "nlb-details"

    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "savings_username_and_address_for_past_payments"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "savings_account_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI2X"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_details"
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    #And Assert that text "Debtor address" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_payment_address"
    And Swipe vertical short
    And Swipe vertical short
    And Scroll down until element with text "Executed" is in view
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert that text "Payment status" has first following sibling with text "Executed"

    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    Examples:
      | rowindex |
      |        4 |


  @Savings_Account_to_Personal_account-EUR-[MOB_ANDROID]
  Scenario Outline: Savings_Account_to_Personal_account-EUR-[MOB_ANDROID]
    #C76154

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Click on element by id "nlb-button-alternate"
    And Wait for element with "Current account" content description from view tag "View"
    And Remove keyboard
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by text "Set amount and currency" to appear for "30" seconds
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Click on element by text "Next"
    And Wait for element by id "nlb-input-purpose" to appear

    Then Assert element by contains text "Own account Transfer"
    And Assert element by contains text "Check data and choose"
    And Assert element by contains text "Debtor"
    #Changing debtor
    And Click on Debtor selector for payment
    And Wait for element by text "Select account"
    And Assert element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by text "Own account Transfer"
    #End of changing debtor
    And Assert Debtor in Own Account Transfer has content description "Savings Account" and from Excel "<rowindex>" account name "savings_account_name" and iban "savings_account_iban"
    And Assert Recipient in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "personal_account_name" and iban "personal_account_iban"
    And Assert element by text "Payment"
    And Assert element by contains text "In order to continue all input fields must be filled."
    And Assert element by text "Payment amount"
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Click on element by text "EUR"
    And Assert element by text "USD" is not displayed
    And Assert element by text "Purpose"
    And Assert text "INTERNAL TRANSFER" in element id "nlb-input-purpose"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "int_05" in txt file
    And Assert element by text "Payment date"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Assert element by text "Check info and correct it if necessary."
    And Assert that text "Payment amount" has first following sibling with text "10,00 EUR"
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert element by text "Debtor"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "savings_user_name_for_payment_review"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "savings_user_address_for_payment_review"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "savings_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_review"
    And Assert that second text "Address" has first following sibling with text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Swipe vertical short
    #And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI2X"
    And Swipe vertical
    And Assert element by text "Payment"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "int_05"
    And Assert that text "Payment date" has first following sibling with current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"

    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"

    And Click on element by text "Past payments"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    And Scroll until element with text from txt file under key "int_05" is in view and click
    And Wait for element by text "Recipient"
    And Assert element by text "Payment details"
    And Assert element "nlb-date" by id has current date in format "d.M.yyyy"
    And Assert text under key "int_05" from txt file in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert text from excel "<rowindex>" columnName "user_name_for_payment_details" in element by id "nlb-details"

    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "username_and_address"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI2X"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "savings_user_name_for_past_payment"
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "savings_account_iban"
    #And Assert that text "Debtor address" has first following sibling with text from Excel "<rowindex>" columnName "savings_user_address_for_past_payment_as_debtor_address"
    And Swipe vertical short
    And Swipe vertical short
    And Scroll down until element with text "Executed" is in view
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert that text "Payment status" has first following sibling with text "Executed"

    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    Examples:
      | rowindex |
      |        4 |


  @Personal_Account_to_Gradual_Savings_account-EUR-[MOB_ANDROID]
  Scenario Outline: Personal_Account_to_Gradual_Savings_account-EUR-[MOB_ANDROID]
    #C76156

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Click on element by id "nlb-button-alternate"
    And Wait for element with "Current account" content description from view tag "View"
    And Remove keyboard
    And Scroll until element with text from excel "<rowindex>" columnName "gradual_savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "gradual_savings_account_iban"
    And Wait for element by text "Set amount and currency" to appear for "30" seconds
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Click on element by text "Next"
    And Wait for element by id "nlb-input-purpose" to appear

    Then Assert element by contains text "Own account Transfer"
    And Assert element by contains text "Check data and choose"
    And Assert element by contains text "Debtor"
    And Assert Debtor in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "personal_account_name" and iban "personal_account_iban"
    And Assert Recipient in Own Account Transfer has content description "Savings" and from Excel "<rowindex>" account name "gradual_savings_account_name" and iban "gradual_savings_account_iban"
    And Assert element by text "Payment"
    And Assert element by contains text "In order to continue all input fields must be filled."
    And Assert element by text "Payment amount"
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Click on element by text "EUR"
    And Assert element by text "USD" is not displayed
    And Assert element by text "Purpose"
    And Assert text "INTERNAL TRANSFER" in element id "nlb-input-purpose"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "int_06" in txt file
    And Assert element by text "Payment date"
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
    And Assert that text "First and last name / Company name" has first following sibling that contains from Excel "<rowindex>" columnName "user_name_short"
    And Assert that second text "Address" has first following sibling with text from Excel "<rowindex>" columnName "gradual_savings_user_address_for_payment_review"
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "gradual_savings_account_iban"
    And Swipe vertical short
    #And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI2X"
    And Swipe vertical
    And Assert element by text "Payment"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "int_06"
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

    And Scroll until element with text from txt file under key "int_06" is in view and click
    And Wait for element by text "Recipient"
    And Assert element by text "Payment details"
    And Assert element "nlb-date" by id has current date in format "d.M.yyyy"
    And Assert text under key "int_06" from txt file in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert element by text from excel "<rowindex>" columnName "user_name_short" is contained in element by id "nlb-details"

    And Assert that text "Recipient" has first following sibling that contains from Excel "<rowindex>" columnName "user_name_short"
    And Assert that text "Recipient" has first following sibling that contains from Excel "<rowindex>" columnName "user_street_short"
    And Assert that text "Recipient" has first following sibling that contains from Excel "<rowindex>" columnName "user_city_short"
    And Assert that text "Recipient" has first following sibling that contains from Excel "<rowindex>" columnName "user_country_short"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "gradual_savings_account_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI2X"
    And Assert that text "First and last name / Company name" has first following sibling that contains from Excel "<rowindex>" columnName "user_name_short"
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    #And Assert that text "Debtor address" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_payment_address"
    And Swipe vertical short
    And Swipe vertical short
    And Scroll down until element with text "Executed" is in view
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert that text "Payment status" has first following sibling with text "Executed"

    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    Examples:
      | rowindex |
      |        4 |


  @Personal_Account_to_Savings_Account_In_The_Future_EUR
  Scenario Outline: Personal_Account_to_Savings_Account_In_The_Future_EUR
    #C76182

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Click on element by id "nlb-button-alternate"
    And Wait for element with "Current account" content description from view tag "View"
    And Remove keyboard
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by text "Set amount and currency" to appear for "30" seconds
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Click on element by text "Next"
    And Wait for element by id "nlb-input-purpose" to appear

    Then Assert element by contains text "Own account Transfer"
    And Assert element by contains text "Check data and choose"
    And Assert element by contains text "Debtor"
    And Assert Debtor in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "personal_account_name" and iban "personal_account_iban"
    And Assert Recipient in Own Account Transfer has content description "Savings Account" and from Excel "<rowindex>" account name "savings_account_name" and iban "savings_account_iban"
    And Assert element by text "Payment"
    And Assert element by contains text "In order to continue all input fields must be filled."
    And Assert element by text "Payment amount"
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Click on element by text "EUR"
    And Assert element by text "USD" is not displayed
    And Assert element by text "Purpose"
    And Assert text "INTERNAL TRANSFER" in element id "nlb-input-purpose"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "IT_001" in txt file
    And Assert element by text "Payment date"
    And Click on date "7" days in the future in calendar
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
    And Assert that text "First and last name / Company name" has first following sibling that contains from Excel "<rowindex>" columnName "user_name_short"
    And Assert that second text "Address" has first following sibling with text from Excel "<rowindex>" columnName "savings_user_address_for_payment_review"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "savings_account_iban"
    #And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI2X"
    And Swipe vertical
    And Assert element by text "Payment"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "IT_001"
    And Assert that text "Payment date" has first following sibling with future date "7" in format "d.M.yyyy"
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

    Then Scroll until element with text from txt file under key "IT_001" is in view and click
    And Wait for element by text "Recipient"
    And Assert element by text "Payment details"
    And Assert element by id "nlb-date" has date "7" day in the future in format "d.M.yyyy"
    And Assert text under key "IT_001" from txt file in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert text "10,00" in element id "nlb-amount"
    And Assert element by text from excel "<rowindex>" columnName "user_name_short" is contained in element by id "nlb-details"

    And Assert that text "Recipient" has first following sibling that contains from Excel "<rowindex>" columnName "user_name_short"
    And Assert that text "Recipient" has first following sibling that contains from Excel "<rowindex>" columnName "user_street_only_short"
    And Assert that text "Recipient" has first following sibling that contains from Excel "<rowindex>" columnName "user_city_short"
    And Assert that text "Recipient" has first following sibling that contains from Excel "<rowindex>" columnName "user_country_short"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "savings_account_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI2X"
    And Assert that text "First and last name / Company name" has first following sibling that contains from Excel "<rowindex>" columnName "user_name_short"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    #And Assert that text "Debtor address" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_payment_address"
    And Swipe vertical short
    And Swipe vertical short
    And Assert that text "Payment status" has first following sibling with text "Pending"

    Examples:
      | rowindex |
      |        4 |


  @Payments_Own_Account_Transfer-Confirmation_[MOB_ANDROID]
  Scenario Outline: Payments_Own_Account_Transfer-Confirmation_[MOB_ANDROID]
    #C71236

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Click on element by id "nlb-button-alternate"
    And Wait for element with "Current account" content description from view tag "View"
    And Remove keyboard
    And Scroll until element with text from excel "<rowindex>" columnName "second_personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "second_personal_account_iban"
    And Wait for element by text "Set amount and currency" to appear for "30" seconds
    And Enter text "1000" in element id "nlb-amount-with-currency-field"
    And Click on element by text "Next"
    And Wait for element by id "nlb-input-purpose" to appear
    And Assert element by contains text "Own account Transfer"
    And Swipe vertical
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount"
    And Swipe vertical
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Enter PIN"

    Then Assert "NLB logo" content description from tag "ImageView" is displayed
    And Assert element by text "Enter PIN"
    And Assert element "forgot-pin-button" by id
    And Send PIN from Excel "<rowindex>" columnName "pin_correct"
    And Wait for element by text "Confirm"
    And Assert element by text "0 min"
    And Assert element by text "3 min"
    And Assert element by text "IBAN:" has first following sibling from excel "<rowindex>" columnName "second_personal_account_iban"
    And Assert element by text "Amount:" has first following sibling "1,000.00"
    And Assert element by text "Currency:" has first following sibling "EUR"
    And Assert element by text "Confirm only payments initiated by you. If payment was not initiated by you in NLB Klik, select Reject."
    And Assert element by text "Reject"
    And Assert element by text "Confirm"

    Examples:
      | rowindex |
      |        4 |


  @Payments_Own_Account_Transfer-Modify_Data_[MOB_ANDROID]
  Scenario Outline: Payments_Own_Account_Transfer-Modify_Data_[MOB_ANDROID]
    #C71241

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Click on element by id "nlb-button-alternate"
    And Wait for element with "Current account" content description from view tag "View"
    And Remove keyboard
    And Scroll until element with text from excel "<rowindex>" columnName "second_personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "second_personal_account_iban"
    And Wait for element by text "Set amount and currency" to appear for "30" seconds
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Click on element by text "Next"
    And Wait for element by id "nlb-input-purpose" to appear

    Then Assert element by contains text "Own account Transfer"
    And Assert element by contains text "Check data and choose"
    And Assert element by contains text "Debtor"
    And Assert Debtor in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "personal_account_name" and iban "personal_account_iban"
    And Select account from Excel "<rowindex>" columnName "savings_account_iban" as debtor in payment screen
    And Wait for element by id "nlb-input-purpose" to appear
    And Assert Recipient in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "second_personal_account_name" and iban "second_personal_account_iban"
    And Assert element by text "Payment"
    And Assert element by contains text "In order to continue all input fields must be filled."
    And Assert element by text "Payment amount"
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Click on element by text "EUR"
    And Assert element by text "USD" is not displayed
    And Assert element by text "Purpose"
    And Assert text "INTERNAL TRANSFER" in element id "nlb-input-purpose"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "int_07" in txt file
    And Assert element by text "Payment date"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-input-purpose" to appear
    And Select account from Excel "<rowindex>" columnName "personal_account_iban" as debtor in payment screen
    And Enter text "15" in element id "nlb-amount-with-currency-field"
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
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_review"
    And Assert that second text "Address" has first following sibling with text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "second_personal_account_iban"
    #And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Swipe vertical
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI2X"
    And Assert element by text "Payment"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "int_07"
    And Assert that text "Payment date" has first following sibling with future date "7" in format "d.M.yyyy"
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

    Then Scroll until element with text from txt file under key "int_07" is in view and click
    And Wait for element by text "Recipient"
    And Assert element by text "Payment details"
    And Assert element by id "nlb-date" has date "7" day in the future in format "d.M.yyyy"
    And Assert text under key "int_07" from txt file in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert text "15,00" in element id "nlb-amount"
    And Assert element by text from excel "<rowindex>" columnName "user_name_short" is contained in element by id "nlb-details"

    And Assert that text "Recipient" has first following sibling with text from Excel "<rowindex>" columnName "username_and_address"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "second_personal_account_iban"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI2X"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_details"
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    #And Assert that text "Debtor address" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_payment_address"
    And Swipe vertical short
    And Swipe vertical short
    And Assert that text "Payment status" has first following sibling with text "Pending"

    Examples:
      | rowindex |
      |        4 |


  @Own_account_-Insufficient_funds[Android]
  Scenario Outline: Own_account_-Insufficient_funds[Android]
    #C76158

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Click on element by id "nlb-button-alternate"
    And Wait for element with "Current account" content description from view tag "View"
    And Remove keyboard
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by text "Set amount and currency" to appear for "30" seconds
    And Enter text "999999999" in element id "nlb-amount-with-currency-field"
    And Click on element by text "Next"
    And Wait for element by id "nlb-input-purpose" to appear

    Then Assert element by contains text "Own account Transfer"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "int_04" in txt file
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Scroll down until element with id "nlb-button-primary" is in view
    And Click on element by id "nlb-button-primary"

    And Try to assert that payment is "Check your data and try again. Insufficient funds " and send command to OTP method
    And Check if PIN is needed and complete payment for "Check your data and try again. Insufficient funds " with assert

    Examples:
      | rowindex |
      |        4 |


  @Payments_Own_Account_Transfer-Confirmation_invalid_Then_Confirm[MOB_ANDROID]
  Scenario Outline: Payments_Own_Account_Transfer-Confirmation_invalid_Then_Confirm[MOB_ANDROID]
    #C71237

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Click on element by id "nlb-button-alternate"
    And Wait for element with "Current account" content description from view tag "View"
    And Remove keyboard
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by text "Set amount and currency" to appear for "30" seconds
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Click on element by text "Next"
    And Wait for element by id "nlb-input-purpose" to appear

    Then Assert element by contains text "Own account Transfer"
    And Assert element by contains text "Check data and choose"
    And Assert element by contains text "Debtor"
    And Assert Debtor in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "personal_account_name" and iban "personal_account_iban"
    And Assert Recipient in Own Account Transfer has content description "Savings Account" and from Excel "<rowindex>" account name "savings_account_name" and iban "savings_account_iban"
    And Assert element by text "Payment"
    And Assert element by contains text "In order to continue all input fields must be filled."
    And Assert element by text "Payment amount"
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Click on element by text "EUR"
    And Assert element by text "USD" is not displayed
    And Assert element by text "Purpose"
    And Assert text "INTERNAL TRANSFER" in element id "nlb-input-purpose"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "int_04" in txt file
    And Assert element by text "Payment date"
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
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "savings_user_name_for_payment_review"
    And Assert that second text "Address" has first following sibling with text from Excel "<rowindex>" columnName "savings_user_address_for_payment_review"
    And Assert that second text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "savings_account_iban"
    #And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Swipe vertical
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI2X"
    And Assert element by text "Payment"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "int_04"
    And Assert that text "Payment date" has first following sibling with current date in format "d.M.yyyy"
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

    Then Assert element by text "Payment confirmation successful"

    Examples:
      | rowindex |
      |        4 |

  @Payments_Own_Account_Transfer-Confirmation_invalid_Then_Reject[MOB_ANDROID]
  Scenario Outline: Payments_Own_Account_Transfer-Confirmation_invalid_Then_Reject[MOB_ANDROID]
    #C71237

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Click on element by id "nlb-button-alternate"
    And Wait for element with "Current account" content description from view tag "View"
    And Remove keyboard
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by text "Set amount and currency" to appear for "30" seconds
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Click on element by text "Next"
    And Wait for element by id "nlb-input-purpose" to appear

    Then Assert element by contains text "Own account Transfer"
    And Assert element by contains text "Check data and choose"
    And Assert element by contains text "Debtor"
    And Assert Debtor in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "personal_account_name" and iban "personal_account_iban"
    And Assert Recipient in Own Account Transfer has content description "Savings Account" and from Excel "<rowindex>" account name "savings_account_name" and iban "savings_account_iban"
    And Assert element by text "Payment"
    And Assert element by contains text "In order to continue all input fields must be filled."
    And Assert element by text "Payment amount"
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Click on element by text "EUR"
    And Assert element by text "USD" is not displayed
    And Assert element by text "Purpose"
    And Assert text "INTERNAL TRANSFER" in element id "nlb-input-purpose"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "int_04" in txt file
    And Assert element by text "Payment date"
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
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "savings_user_name_for_payment_review"
    And Assert that second text "Address" has first following sibling with text from Excel "<rowindex>" columnName "savings_user_address_for_payment_review"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "savings_account_iban"
    #And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI20XXX"
    And Swipe vertical
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text "LJBASI2X"
    And Assert element by text "Payment"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "int_04"
    And Assert that text "Payment date" has first following sibling with current date in format "d.M.yyyy"
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

