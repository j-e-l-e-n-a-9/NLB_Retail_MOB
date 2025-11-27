Feature: Recipients

  @Payments_Recipient_Save_New_Recipient_UPN_Account_Number_[MOB_ANDROID]
  Scenario Outline: Payments_Recipient_Save_New_Recipient_UPN_Account_Number_[MOB_ANDROID]
    #C71331,C75582,C71334,C76185

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
    And Scroll down until element with id "nlb-button-primary" is in view
    And Assert currency in second payment screen is "EUR"
    And Assert text "OTHR - Other" in element id "nlb-input-purpose-code"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "SP_003" in txt file
    
    And Click "Expand dropdown menu" content description from tag "ImageView"
    And Click on element by text "NRC - No reference"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Scroll down until element with id "nlb-button-primary" is in view
    And Click on element by id "nlb-button-primary"

    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"
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

  @Payments_Recipient_Save_New_Recipient_Foreign_Payment_EGP_[MOB_ANDROID]
  Scenario Outline: Payments_Recipient_Save_New_Recipient_Foreign_Payment_EGP_[MOB_ANDROID]
    #C71331,C75583,C76186

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
    And Assert element by text "Foreign payment"
    #Entering recipient info
    And Enter text from excel "<rowindex>" columnName "bosnia_name" in element id "nlb-input-recipient-name"
    And Enter text "TEST" in element id "nlb-input-recipient-address"
    And Enter text "TEST" in element id "nlb-input-recipient-city"
    #End of entering recipient info
    #Enter Recipient country
    And Scroll down until element with id "nlb-input-recipient-country-click-area" is in view
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
    And Scroll until element with text "Save recipient" is in view
    And Swipe vertical short
    And Click on element by text "Save recipient"
    And Swipe vertical
    And Assert element by text "SHA - Costs are shared between creditor and debtor"
    #And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount"
    And Assert element by text "Payment review"
    And Swipe vertical
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"

    And Wait for element by text "Recipients"

    Then Click on element by text "Recipients"
    And Wait for element by id "nlb_search_text_field" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "bosnia_iban" is in view
    And Assert saved contact has short "B" and name from Excel "<rowindex>" columnName "bosnia_name" and iban from Excel "<rowindex>" columnName "bosnia_iban"
    And Click on element by text from excel "<rowindex>" columnName "bosnia_iban"
    And Assert element by text "Recipient details"
    And Assert element by text "Address"
    And Assert that text "Address" has first following sibling that contains text "TEST"
    And Assert that text "Address" has first following sibling that contains text "BOSNIA AND HERZEGOVINA"
    And Assert that text "Bank name" has first following sibling that contains text "TEST"
    And Assert that text "Bank address" has first following sibling that contains text "TEST"
    And Assert that text "Bank address" has first following sibling that contains text "BOSNIA AND HERZEGOVINA"
    And Assert element by text "SWIFT (BIC) Code"
    And Assert that text "SWIFT (BIC) Code" has first following sibling that contains text "RAZBBA22"
    And Click on element by text "Delete "
    And Wait for element by text "Delete recipient"
    And Click on element by text "Delete"

    Examples:
      | rowindex |
      |        4 |

  @Payments_Recipient_Save_New_Recipient_Foreign_Payment_NON_EGP_[MOB_ANDROID]
  Scenario Outline: Payments_Recipient_Save_New_Recipient_Foreign_Payment_NON_EGP_[MOB_ANDROID]
    #C71331,C75583

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
    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"
    And Wait for element by text "Saved recipients"

    Then Click on element by text "Saved recipients"
    And Wait for element by id "nlb_search_text_field" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "united_kingdom_iban" is in view
    And Assert saved contact has short "G" and name from Excel "<rowindex>" columnName "united_kingdom_name" and iban from Excel "<rowindex>" columnName "united_kingdom_iban"
    And Click on element by text from excel "<rowindex>" columnName "united_kingdom_iban"
    And Assert element by text "Contact data"
    And Assert element by text "Address"
    And Assert that text "Address" has first following sibling that contains text "TEST"
    And Assert that text "Address" has first following sibling that contains text "UNITED KINGDOM"
    And Assert that text "Bank name" has first following sibling that contains text "TEST"
    And Assert that text "Bank address" has first following sibling that contains text "TEST"
    And Assert that text "Bank address" has first following sibling that contains text "UNITED KINGDOM"
    And Assert element by text "SWIFT (BIC)"
    And Assert that text "SWIFT (BIC)" has first following sibling that contains text "BARCGB22"
    And Click on element by text "Delete"
    And Wait for element by text "Delete recipient"
    And Click on element by text "Delete"


    Examples:
      | rowindex |
      |        4 |


  @Payments_Recipient_Save_New_Recipient-Invalid_SEPA_[MOB_ANDROID]
  Scenario Outline: Payments_Recipient_Save_New_Recipient-Invalid_SEPA_[MOB_ANDROID]
    #C71332

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
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "forgot-pin-button" to appear
    And Enter PIN
    And Wait for element by text "IBAN:"
    And Click on element by id "nlb-button-alternate"

    Then Assert element by text "Payment confirmation rejected"
    And Wait for element by text "Saved recipients"
    And Click on element by text "Saved recipients"
    And Wait for element by id "nlb_search_text_field" to appear
    And Assert account from excel "<rowindex>" columnName "corporate_recipient_iban" is not displayed

    Examples:
      | rowindex |
      |        4 |

  @Payments_Recipient_Save_New_Recipient-Invalid_EGP_[MOB_ANDROID]
  Scenario Outline: Payments_Recipient_Save_New_Recipient-Invalid_EGP_[MOB_ANDROID]
    #C71332

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer"
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "bosnia_iban" in element id "nlb-input-account-number"
    And Enter text "10" in element id "nlb-amount-with-currency-field"
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
    And Scroll until element with text "Save recipient" is in view
    And Swipe vertical short
    And Click on element by text "Save recipient"
    And Swipe vertical
    And Assert element by text "SHA - Costs are shared between creditor and debtor"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount"
    And Assert element by text "Payment review"
    And Swipe vertical
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "forgot-pin-button" to appear
    And Enter PIN
    And Wait for element by text "IBAN:"
    And Click on element by id "nlb-button-alternate"

    Then Assert element by text "Payment confirmation rejected"
    And Wait for element by text "Saved recipients"
    And Click on element by text "Saved recipients"
    And Wait for element by id "nlb_search_text_field" to appear
    And Assert account from excel "<rowindex>" columnName "bosnia_iban" is not displayed

    Examples:
      | rowindex |
      |        4 |

  @Payments_Recipient_Save_New_Recipient-Invalid_Non-EGP_[MOB_ANDROID]
  Scenario Outline: Payments_Recipient_Save_New_Recipient-Invalid_Non-EGP_[MOB_ANDROID]
    #C71332

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
    And Wait for element by id "forgot-pin-button" to appear
    And Enter PIN
    And Wait for element by text "IBAN:"
    And Click on element by id "nlb-button-alternate"

    Then Assert element by text "Payment confirmation rejected"
    And Wait for element by text "Saved recipients"
    And Click on element by text "Saved recipients"
    And Wait for element by id "nlb_search_text_field" to appear
    And Assert account from excel "<rowindex>" columnName "united_kingdom_iban" is not displayed

    Examples:
      | rowindex |
      |        4 |


  @Payments_Recipient_Recipient_List_[MOB_ANDROID]
  Scenario Outline: Payments_Recipient_Recipient_List_[MOB_ANDROID]
    #C71333

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Saved recipients"
    And Click on element by text "Saved recipients"
    And Wait for element by id "nlb-icon-row" to appear

    Then Assert saved contact has short "A" and name from Excel "<rowindex>" columnName "sepa_contact_name" and iban from Excel "<rowindex>" columnName "sepa_contact_iban"
    And Assert saved contact has short "B" and name from Excel "<rowindex>" columnName "foreign_contact_name" and iban from Excel "<rowindex>" columnName "foreign_contact_iban"
    And Assert element "nlb_search_text_field" by id
    And Assert element by text "A"
    And Assert element by text "B"
    And Assert saved contacts are displayed in correct order


    Examples:
      | rowindex |
      |        4 |

  @Payments_Recipient_Search_Recipient_[MOB_ANDROID]
  Scenario Outline: Payments_Recipient_Search_Recipient_[MOB_ANDROID]
    #C71335

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Saved recipients"
    And Click on element by text "Saved recipients"
    And Wait for element by id "nlb-icon-row" to appear

    Then Enter text from excel "<rowindex>" columnName "sepa_contact_iban" in element id "nlb_search_text_field"
    And Assert saved contact has short "A" and name from Excel "<rowindex>" columnName "sepa_contact_name" and iban from Excel "<rowindex>" columnName "sepa_contact_iban"
    And Assert account from excel "<rowindex>" columnName "foreign_contact_iban" is not displayed
    And Enter text from excel "<rowindex>" columnName "foreign_contact_name" in element id "nlb_search_text_field"
    And Assert saved contact has short "B" and name from Excel "<rowindex>" columnName "foreign_contact_name" and iban from Excel "<rowindex>" columnName "foreign_contact_iban"
    And Assert account from excel "<rowindex>" columnName "sepa_contact_iban" is not displayed

    Examples:
      | rowindex |
      |        4 |


  @Payments_Recipient_Update_And_Edit_Recipient_[MOB_ANDROID]
  Scenario Outline: Payments_Recipient_Update_And_Edit_Recipient_[MOB_ANDROID]
    #C75636,C71336

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
    And Scroll until element with text from excel "<rowindex>" columnName "foreign_contact_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "foreign_contact_iban"
    And Wait for element by text "Set amount and currency" to appear for "30" seconds
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Click on element by text "Next"
    And Wait for element by id "nlb-checkbox-update-recipient" to appear
    And Click on element by text from excel "<rowindex>" columnName "foreign_contact_iban"
    And Assert text from excel "<rowindex>" columnName "foreign_contact_name" in element by id "nlb-input-recipient-name"
    And Enter text "CONTACTNAME" in element id "nlb-input-recipient-name"
    And Assert text "TEST" in element id "nlb-input-recipient-address"
    And Enter text "TESTADDRESS" in element id "nlb-input-recipient-address"
    And Assert text "TEST" in element id "nlb-input-recipient-city"
    And Enter text "TESTCITY" in element id "nlb-input-recipient-city"
    And Assert text "BOSNIA AND HERZEGOVINA" in element id "nlb-input-recipient-country"
    And Click on element by id "nlb-input-recipient-country-click-area"
    And Wait for element by text "AFGHANISTAN"
    And Enter text "SLOVENIA" into search field for country selection
    And Click on country "SLOVENIA" after search
    And Wait for element by id "nlb-input-recipient-country" to appear
    And Assert text "SLOVENIA" in element id "nlb-input-recipient-country"
    And Swipe vertical
    And Assert text "TEST" in element id "nlb-input-bank-name"
    And Enter text "BANKNAMETEST" in element id "nlb-input-bank-name"
    And Assert text "TEST" in element id "nlb-input-bank-address"
    And Enter text "BANKADDRESSTEST" in element id "nlb-input-bank-address"
    And Assert text "TEST" in element id "nlb-input-bank-city"
    And Enter text "BANKCITYTEST" in element id "nlb-input-bank-city"
    And Assert text "BOSNIA AND HERZEGOVINA" in element id "nlb-input-bank-country"
    And Click on element by id "nlb-input-bank-country-click-area"
    And Wait for element by text "AFGHANISTAN"
    And Enter text "SLOVENIA" into search field for country selection
    And Click on country "SLOVENIA" after search
    And Wait for element by id "nlb-input-bank-country" to appear
    And Assert text "SLOVENIA" in element id "nlb-input-bank-country"
    And Enter text "TEST" in element id "nlb-input-bank-additional-info"
    And Scroll down until element with id "nlb-input-purpose" is in view
    And Click on element by id "nlb-checkbox-update-recipient"
    And Enter text "TESTING" in element id "nlb-input-purpose"
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount"
    And Scroll down until element with text "Pay" is in view
    And Click on element by id "nlb-button-primary"
    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"

    And Wait for element by text "Recipients"
    And Click on element by text "Recipients"
    And Wait for element by id "nlb-icon-row" to appear
    And Click on element by text from excel "<rowindex>" columnName "foreign_contact_iban"
    And Wait for element by text "Edit"
    And Assert that text "Address" has first following sibling that contains text "TESTADDRESS"
    And Assert that text "Address" has first following sibling that contains text "TESTCITY"
    And Assert that text "Address" has first following sibling that contains text "SLOVENIA"
    And Assert that text "Bank name" has first following sibling that contains text "BANKNAMETEST"
    And Assert that text "Bank address" has first following sibling that contains text "TEST"
    And Assert that text "Bank address" has first following sibling that contains text "SLOVENIA"
    And Click on element by text "Edit"
    And Wait for element by id "nlb-input-recipient-name" to appear

    Then Assert element by text "Recipient"
    And Assert element by contains text from excel "<rowindex>" columnName "foreign_contact_iban"
    And Assert text "CONTACTNAME" in element id "nlb-input-recipient-name"
    And Enter text "BCONTACT" in element id "nlb-input-recipient-name"
    And Assert text "TESTADDRESS" in element id "nlb-input-recipient-address"
    And Enter text "TEST" in element id "nlb-input-recipient-address"
    And Assert text "TESTCITY" in element id "nlb-input-recipient-city"
    And Enter text "TEST" in element id "nlb-input-recipient-city"
    And Assert text "SLOVENIA" in element id "nlb-input-recipient-country"
    And Click on element by id "nlb-input-recipient-country-click-area"
    And Wait for element by text "AFGHANISTAN"
    And Enter text "BOSNIA AND HERZEGOVINA" into search field for country selection
    And Click on country "BOSNIA AND HERZEGOVINA" after search
    And Wait for element by id "nlb-input-recipient-country" to appear
    And Assert text "BOSNIA AND HERZEGOVINA" in element id "nlb-input-recipient-country"
    And Assert text "BANKNAMETEST" in element id "nlb-input-bank-name"
    And Enter text "TEST" in element id "nlb-input-bank-name"
    And Assert text "BANKADDRESSTEST" in element id "nlb-input-bank-address"
    And Enter text "TEST" in element id "nlb-input-bank-address"
    And Assert text "BANKCITYTEST" in element id "nlb-input-bank-city"
    And Enter text "TEST" in element id "nlb-input-bank-city"
    And Swipe vertical
    And Assert text "SLOVENIA" in element id "nlb-input-bank-country"
    And Click on element by id "nlb-input-bank-country-click-area"
    And Wait for element by text "AFGHANISTAN"
    And Enter text "BOSNIA AND HERZEGOVINA" into search field for country selection
    And Click on country "BOSNIA AND HERZEGOVINA" after search
    And Wait for element by id "nlb-input-bank-country" to appear
    And Assert text "BOSNIA AND HERZEGOVINA" in element id "nlb-input-bank-country"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Delete "
    And Wait "3" seconds
    And Assert that text "Address" has first following sibling that contains text "TEST"
    And Assert that text "Address" has first following sibling that contains text "BOSNIA AND HERZEGOVINA"
    And Assert that text "Bank name" has first following sibling that contains text "TEST"
    And Assert that text "Bank address" has first following sibling that contains text "TEST"
    And Assert that text "Bank address" has first following sibling that contains text "BOSNIA AND HERZEGOVINA"


    Examples:
      | rowindex |
      |        4 |


  @Payments_Recipient_Repeat_Payment_From_Last_5_Payments_Of_Recipient_[MOB_ANDROID]
  Scenario Outline: Payments_Recipient_Repeat_Payment_From_Last_5_Payments_Of_Recipient_[MOB_ANDROID]
    #C71339,C75547
    #BUG order of payments is not correct
    #BUG canceled payments are shown in last 5 payments

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
    And Scroll until element with text from excel "<rowindex>" columnName "sepa_contact_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "sepa_contact_iban"
    And Wait for element by text "Set amount and currency" to appear for "30" seconds
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Click on element by text "Next"
    And Wait for element by id "nlb-checkbox-update-recipient" to appear
    And Swipe vertical
    And Enter text "TEST1" in element id "nlb-input-purpose"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount"
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"

    And Wait for element by text "Recipients"
    And Click on element by text "Recipients"
    And Wait for element by id "nlb_search_text_field" to appear
    And Click on element by text from excel "<rowindex>" columnName "sepa_contact_iban"
    And Wait for element by text "TEST1"
    And Click on element by text "TEST1"
    And Wait for element by id "nlb-checkbox-update-recipient" to appear
    And Assert Debtor in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "personal_account_name" and iban "personal_account_iban"
    And Assert SEPA Recipient has icon "A" and from Excel "<rowindex>" account name "sepa_contact_name" and iban "sepa_contact_iban"
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Swipe vertical
    And Assert text "TEST1" in element id "nlb-input-purpose"
    And Enter text "TEST2" in element id "nlb-input-purpose"
    And Assert element by text "NRC - No reference"
    And Assert element by id "nlb-input-payment-date" is date of format "dd. M. yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount"
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"

    And Wait for element by text "Recipient details"
    And Wait for element with "Back" content description from view tag "View"
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb_search_text_field" to appear
    And Click on element by text from excel "<rowindex>" columnName "sepa_contact_iban"
    And Wait for element by text "TEST2"
    And Click on element by text "TEST2"
    And Wait for element by id "nlb-checkbox-update-recipient" to appear
    And Assert Debtor in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "personal_account_name" and iban "personal_account_iban"
    And Assert SEPA Recipient has icon "A" and from Excel "<rowindex>" account name "sepa_contact_name" and iban "sepa_contact_iban"
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Swipe vertical
    And Assert text "TEST2" in element id "nlb-input-purpose"
    And Enter text "TEST3" in element id "nlb-input-purpose"
    And Assert element by text "NRC - No reference"
    And Assert element by id "nlb-input-payment-date" is date of format "dd. M. yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount"
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"

    And Wait for element by text "Recipient details"
    And Wait for element with "Back" content description from view tag "View"
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb_search_text_field" to appear
    And Click on element by text from excel "<rowindex>" columnName "sepa_contact_iban"
    And Wait for element by text "TEST3"
    And Click on element by text "TEST3"
    And Wait for element by id "nlb-checkbox-update-recipient" to appear
    And Assert Debtor in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "personal_account_name" and iban "personal_account_iban"
    And Assert SEPA Recipient has icon "A" and from Excel "<rowindex>" account name "sepa_contact_name" and iban "sepa_contact_iban"
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Swipe vertical
    And Assert text "TEST3" in element id "nlb-input-purpose"
    And Enter text "TEST4" in element id "nlb-input-purpose"
    And Assert element by text "NRC - No reference"
    And Assert element by id "nlb-input-payment-date" is date of format "dd. M. yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount"
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"

    And Wait for element by text "Recipient details"
    And Wait for element with "Back" content description from view tag "View"
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb_search_text_field" to appear
    And Click on element by text from excel "<rowindex>" columnName "sepa_contact_iban"
    And Wait for element by text "TEST4"
    And Click on element by text "TEST4"
    And Wait for element by id "nlb-checkbox-update-recipient" to appear
    And Assert Debtor in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "personal_account_name" and iban "personal_account_iban"
    And Assert SEPA Recipient has icon "A" and from Excel "<rowindex>" account name "sepa_contact_name" and iban "sepa_contact_iban"
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Swipe vertical
    And Assert text "TEST4" in element id "nlb-input-purpose"
    And Enter text "TEST5" in element id "nlb-input-purpose"
    And Assert element by text "NRC - No reference"
    And Assert element by id "nlb-input-payment-date" is date of format "dd. M. yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount"
    And Swipe vertical
    And Click on element by id "nlb-button-primary"
    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"
    And Wait for element by text "Recipient details"
    And Wait for element with "Back" content description from view tag "View"
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb_search_text_field" to appear
    And Click on element by text from excel "<rowindex>" columnName "sepa_contact_iban"
    And Wait for element by text "TEST5"

    And Swipe vertical
    And Assert element by text "Repeat one of the last 5 payments"
    And Assert list of element by id "nlb-payment-date" is displayed
    And Assert list of element by id "nlb-payment-currency" is displayed
    And Assert list of element by id "nlb-purpose" is displayed
    And Assert list of element by id "nlb-payment-amount" is displayed
    And Assert list of element by id "nlb-creditor-name" is displayed
    And Assert there are five payments in last five payments


    Examples:
      | rowindex |
      |        4 |