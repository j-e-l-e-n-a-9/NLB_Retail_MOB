Feature: Verification_Of_Payee

  @Instant_Payment-VOP_Match-Recipient_Name_Fully_Matches_With_VOP_Register_[ANDROID]
  Scenario Outline: Instant_Payment-VOP_Match-Recipient_Name_Fully_Matches_With_VOP_Register_[ANDROID]
    #C93400,C93406

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "vop_recipient_iban" in element id "nlb-input-account-number"
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by id "nlb-input-recipient-name" to appear
    And Enter text from excel "<rowindex>" columnName "vop_recipient_name" in element id "nlb-input-recipient-name"
    #And Enter text from excel "<rowindex>" columnName "vop_recipient_name" in element id "nlb-input-recipient-name" using android typer
    And Enter text "TEST" in element id "nlb-input-recipient-address"
    And Enter text "TEST" in element id "nlb-input-recipient-city"
    And Click on element by id "nlb-input-recipient-name"
    And Hide keyboard
    And Click on element by text from excel "<rowindex>" columnName "vop_recipient_short"
    And Click on element by text from excel "<rowindex>" columnName "vop_recipient_short"
    And Assert element by contains text with special characters "Name matches account holder's name."
    And Scroll down until element with id "nlb-button-primary" is in view
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Assert text "OTHR - Other" in element id "nlb-input-purpose-code"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "SP_001" in txt file
    And Assert element by text "NRC - No reference"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by contains text with special characters "Name matches account holder's name."
    And Go Back
    And Click on element by text from excel "<rowindex>" columnName "vop_recipient_short"
    And Assert element by contains text with special characters "Name matches account holder's name."
    And Scroll down until element with id "nlb-button-primary" is in view
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by contains text with special characters "Name matches account holder's name."
    And Scroll down until element with id "nlb-button-primary" is in view
    And Click on element by id "nlb-button-primary"

    Then Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success" with assert

    Examples:
      | rowindex |
      |        4 |

  @Instant_Payment-VOP_On_New_Standing_Order-VOP_Match-Recipient_Name_Fully_Matches_With_VOP_Register_[ANDROID]
  Scenario Outline: Instant_Payment-VOP_On_New_Standing_Order-VOP_Match-Recipient_Name_Fully_Matches_With_VOP_Register_[ANDROID]
    #C99459

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    And Click "Pay" content description from view tag "View"
    And Wait for Past payments button in Pay screen

    When Click on element by text "Standing orders"
    And Wait for element by id "nlb-title" to appear
    And Click on element by text "New standing order"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "vop_recipient_iban" in element id "nlb-input-account-number"
    And Enter random amount in element by id "nlb-amount-with-currency-field" and remember it under key "SO_001" in txt file
    And Scroll until element with text "Next" is in view
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-checkbox-update-recipient" to appear
    And Select account from Excel "<rowindex>" columnName "personal_account_iban" as debtor in payment screen
    And Wait for element by id "nlb-input-recipient-name" to appear
    And Enter text from excel "<rowindex>" columnName "vop_recipient_name" in element id "nlb-input-recipient-name"
    And Enter text "TEST" in element id "nlb-input-recipient-address"
    And Enter text "TEST" in element id "nlb-input-recipient-city"
    And Click on element by id "nlb-input-recipient-name"
    And Hide keyboard
    And Click on element by text from excel "<rowindex>" columnName "vop_recipient_short"
    And Click on element by text from excel "<rowindex>" columnName "vop_recipient_short"
    And Assert element by contains text with special characters "Name matches account holder's name."
    #And Assert element by contains text with special characters "Verification of payee is not possible at the moment. You can proceed the payment without verification or try later."
    And Scroll down until element with id "nlb-input-purpose" is in view
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "SP_001" in txt file
    And Scroll down until element with id "nlb-button-primary" is in view
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by contains text with special characters "Name matches account holder's name."
    #And Assert element by contains text with special characters "Verification of payee is not possible at the moment. You can proceed the payment without verification or try later."
    And Go Back
    And Click on element by text from excel "<rowindex>" columnName "vop_recipient_short"
    And Assert element by contains text with special characters "Name matches account holder's name."
    #And Assert element by contains text with special characters "Verification of payee is not possible at the moment. You can proceed the payment without verification or try later."
    And Scroll down until element with id "nlb-button-primary" is in view
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by contains text with special characters "Name matches account holder's name."
    #And Assert element by contains text with special characters "Verification of payee is not possible at the moment. You can proceed the payment without verification or try later."
    And Scroll down until element with id "nlb-button-primary" is in view
    And Click on element by id "nlb-button-primary"

    Then Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success" with assert

    Examples:
      | rowindex |
      |        4 |

  @Instant_Payment-VOP_Failure_Invalid_[ANDROID]
  Scenario Outline: Instant_Payment-VOP_Failure_Invalid_[ANDROID]
    #Ovaj test moze da radi samo u uslovima da VOP nije dostupan
    #C93806,C93406

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "vop_recipient_iban" in element id "nlb-input-account-number"
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by id "nlb-input-recipient-name" to appear
    And Enter text from excel "<rowindex>" columnName "vop_recipient_name" in element id "nlb-input-recipient-name"
    And Enter text "TEST" in element id "nlb-input-recipient-address"
    And Enter text "TEST" in element id "nlb-input-recipient-city"
    And Click on element by id "nlb-input-recipient-name"
    And Hide keyboard
    And Click on element by text from excel "<rowindex>" columnName "vop_recipient_short"
    And Click on element by text from excel "<rowindex>" columnName "vop_recipient_short"
    And Assert element by contains text with special characters "Verification of payee is not possible at the moment. You can proceed the payment without verification or try later."
    And Scroll down until element with id "nlb-button-primary" is in view
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Assert text "OTHR - Other" in element id "nlb-input-purpose-code"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "SP_001" in txt file
    And Assert element by text "NRC - No reference"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by contains text with special characters "Verification of payee is not possible at the moment. You can proceed the payment without verification or try later."
    And Go Back
    And Click on element by text from excel "<rowindex>" columnName "vop_recipient_short"
    And Assert element by contains text with special characters "Verification of payee is not possible at the moment. You can proceed the payment without verification or try later."
    And Scroll down until element with id "nlb-button-primary" is in view
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by contains text with special characters "Verification of payee is not possible at the moment. You can proceed the payment without verification or try later."
    And Scroll down until element with id "nlb-button-primary" is in view
    And Click on element by id "nlb-button-primary"

    Then Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success" with assert

    Examples:
      | rowindex |
      |        4 |

  @Instant_Payment-VOP_No_Match-Recipient_Name_Does_Not_Match_With_VOP_Register_[ANDROID]
  Scenario Outline: Instant_Payment-VOP_No_Match-Recipient_Name_Does_Not_Match_With_VOP_Register_[ANDROID]
    #C93402,C93406

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "vop_recipient_iban" in element id "nlb-input-account-number"
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by id "nlb-input-recipient-name" to appear
    And Enter text "TESTNAME" in element id "nlb-input-recipient-name"
    And Enter text "TEST" in element id "nlb-input-recipient-address"
    And Enter text "TEST" in element id "nlb-input-recipient-city"
    And Click on element by id "nlb-input-recipient-name"
    And Hide keyboard
    And Click on element by text from excel "<rowindex>" columnName "vop_recipient_iban"
    And Click on element by text from excel "<rowindex>" columnName "vop_recipient_iban"
    And Assert element by contains text with special characters "Name does not match the account holder. Check your data and try again. If you proceed with the payment, the amount may be transferred to the wrong recipient."
    And Scroll down until element with id "nlb-button-primary" is in view
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Assert text "OTHR - Other" in element id "nlb-input-purpose-code"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "SP_001" in txt file
    And Assert element by text "NRC - No reference"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by contains text with special characters "Name does not match the account holder. Check your data and try again. If you proceed with the payment, the amount may be transferred to the wrong recipient."
    And Go Back
    And Click on element by text from excel "<rowindex>" columnName "vop_recipient_iban"
    And Assert element by contains text with special characters "Name does not match the account holder. Check your data and try again. If you proceed with the payment, the amount may be transferred to the wrong recipient."
    And Scroll down until element with id "nlb-button-primary" is in view
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by contains text with special characters "Name does not match the account holder. Check your data and try again. If you proceed with the payment, the amount may be transferred to the wrong recipient."
    And Scroll down until element with id "nlb-button-primary" is in view
    And Click on element by id "nlb-button-primary"

    Then Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success" with assert

    Examples:
      | rowindex |
      |        4 |

  @Instant_Payment-VOP_On_New_Standing_Order-VOP_No_Match-Recipient_Name_Does_Not_Match_With_VOP_Register_[ANDROID]
  Scenario Outline: Instant_Payment-VOP_On_New_Standing_Order-VOP_No_Match-Recipient_Name_Does_Not_Match_With_VOP_Register_[ANDROID]
    #C99461,C93407

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    And Click "Pay" content description from view tag "View"
    And Wait for Past payments button in Pay screen

    When Click on element by text "Standing orders"
    And Wait for element by id "nlb-title" to appear
    And Click on element by text "New standing order"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "vop_recipient_iban" in element id "nlb-input-account-number"
    And Enter random amount in element by id "nlb-amount-with-currency-field" and remember it under key "SO_001" in txt file
    And Scroll until element with text "Next" is in view
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-checkbox-update-recipient" to appear
    And Select account from Excel "<rowindex>" columnName "personal_account_iban" as debtor in payment screen
    And Wait for element by id "nlb-input-recipient-name" to appear
    And Enter text "TESTNAME" in element id "nlb-input-recipient-name"
    And Enter text "TEST" in element id "nlb-input-recipient-address"
    And Enter text "TEST" in element id "nlb-input-recipient-city"
    And Click on element by id "nlb-input-recipient-name"
    And Hide keyboard
    And Click on element by text from excel "<rowindex>" columnName "vop_recipient_iban"
    And Click on element by text from excel "<rowindex>" columnName "vop_recipient_iban"
    And Assert element by contains text with special characters "Name does not match the account holder. Check your data and try again. If you proceed with the payment, the amount may be transferred to the wrong recipient."
    And Scroll down until element with id "nlb-button-primary" is in view
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "SP_001" in txt file
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by contains text with special characters "Name does not match the account holder. Check your data and try again. If you proceed with the payment, the amount may be transferred to the wrong recipient."
    And Go Back
    And Click on element by text from excel "<rowindex>" columnName "vop_recipient_iban"
    And Assert element by contains text with special characters "Name does not match the account holder. Check your data and try again. If you proceed with the payment, the amount may be transferred to the wrong recipient."
    And Scroll down until element with id "nlb-button-primary" is in view
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by contains text with special characters "Name does not match the account holder. Check your data and try again. If you proceed with the payment, the amount may be transferred to the wrong recipient."
    And Scroll down until element with id "nlb-button-primary" is in view
    And Click on element by id "nlb-button-primary"

    Then Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success" with assert

    Examples:
      | rowindex |
      |        4 |

  @Instant_Payment-VOP_Partial_Match-Recipient_Name_Partially_Matches_With_VOP_Register_[ANDROID]_1
  Scenario Outline: Instant_Payment-VOP_Partial_Match-Recipient_Name_Partially_Matches_With_VOP_Register_[ANDROID]_1
    #C93401
    #Ovde se iz imena brise random karakter

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "vop_recipient_iban" in element id "nlb-input-account-number"
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by id "nlb-input-recipient-name" to appear
    And Enter text from excel "<rowindex>" columnName "vop_recipient_name" with random deleted character in element id "nlb-input-recipient-name"
    And Enter text "TEST" in element id "nlb-input-recipient-address"
    And Enter text "TEST" in element id "nlb-input-recipient-city"
    And Click on element by id "nlb-input-recipient-name"
    And Hide keyboard
    And Click on element by text from excel "<rowindex>" columnName "vop_recipient_iban"
    And Click on element by text from excel "<rowindex>" columnName "vop_recipient_iban"
    And Assert element by contains text with special characters "Name partially matches the account holder. Check your data and try again. If you proceed with the payment, the amount may be transferred to the wrong recipient."
    And Scroll down until element with id "nlb-button-primary" is in view
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Assert text "OTHR - Other" in element id "nlb-input-purpose-code"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "SP_001" in txt file
    And Assert element by text "NRC - No reference"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by contains text with special characters "Name partially matches the account holder. Check your data and try again. If you proceed with the payment, the amount may be transferred to the wrong recipient."
    And Go Back
    And Click on element by text from excel "<rowindex>" columnName "vop_recipient_iban"
    And Assert element by contains text with special characters "Name partially matches the account holder. Check your data and try again. If you proceed with the payment, the amount may be transferred to the wrong recipient."
    And Scroll down until element with id "nlb-button-primary" is in view
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by contains text with special characters "Name partially matches the account holder. Check your data and try again. If you proceed with the payment, the amount may be transferred to the wrong recipient."
    And Scroll down until element with id "nlb-button-primary" is in view
    And Click on element by id "nlb-button-primary"

    Then Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success" with assert

    Examples:
      | rowindex |
      |        4 |

  @Instant_Payment-VOP_Partial_Match-Recipient_Name_Partially_Matches_With_VOP_Register_[ANDROID]_2
  Scenario Outline: Instant_Payment-VOP_Partial_Match-Recipient_Name_Partially_Matches_With_VOP_Register_[ANDROID]_2
    #C93401
    #Ovde dva slova zamene mesto

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "vop_recipient_iban" in element id "nlb-input-account-number"
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by id "nlb-input-recipient-name" to appear
    And Enter text from excel "<rowindex>" columnName "vop_recipient_name" with random letters permuted in element id "nlb-input-recipient-name"
    And Enter text "TEST" in element id "nlb-input-recipient-address"
    And Enter text "TEST" in element id "nlb-input-recipient-city"
    And Click on element by id "nlb-input-recipient-name"
    And Hide keyboard
    And Click on element by text from excel "<rowindex>" columnName "vop_recipient_iban"
    And Click on element by text from excel "<rowindex>" columnName "vop_recipient_iban"
    And Assert element by contains text with special characters "Name partially matches the account holder. Check your data and try again. If you proceed with the payment, the amount may be transferred to the wrong recipient."
    And Scroll down until element with id "nlb-button-primary" is in view
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Assert text "OTHR - Other" in element id "nlb-input-purpose-code"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "SP_001" in txt file
    And Assert element by text "NRC - No reference"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by contains text with special characters "Name partially matches the account holder. Check your data and try again. If you proceed with the payment, the amount may be transferred to the wrong recipient."
    And Go Back
    And Click on element by text from excel "<rowindex>" columnName "vop_recipient_iban"
    And Assert element by contains text with special characters "Name partially matches the account holder. Check your data and try again. If you proceed with the payment, the amount may be transferred to the wrong recipient."
    And Scroll down until element with id "nlb-button-primary" is in view
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by contains text with special characters "Name partially matches the account holder. Check your data and try again. If you proceed with the payment, the amount may be transferred to the wrong recipient."
    And Scroll down until element with id "nlb-button-primary" is in view
    And Click on element by id "nlb-button-primary"

    Then Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success" with assert

    Examples:
      | rowindex |
      |        4 |

  @Instant_Payment-VOP_Partial_Match-Recipient_Name_Partially_Matches_With_VOP_Register_[ANDROID]_3
  Scenario Outline: Instant_Payment-VOP_Partial_Match-Recipient_Name_Partially_Matches_With_VOP_Register_[ANDROID]_3
    #C93401
    #Ovde zadnje slovo menjamo

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "vop_recipient_iban" in element id "nlb-input-account-number"
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by id "nlb-input-recipient-name" to appear
    #And Enter text from excel "<rowindex>" columnName "vop_recipient_name" with random letters changed to A in element id "nlb-input-recipient-name"
    And Enter text from excel "<rowindex>" columnName "vop_recipient_name" with last letter changed in element id "nlb-input-recipient-name"
    And Enter text "TEST" in element id "nlb-input-recipient-address"
    And Enter text "TEST" in element id "nlb-input-recipient-city"
    And Click on element by id "nlb-input-recipient-name"
    And Hide keyboard
    And Click on element by text from excel "<rowindex>" columnName "vop_recipient_iban"
    And Click on element by text from excel "<rowindex>" columnName "vop_recipient_iban"
    And Assert element by contains text with special characters "Name partially matches the account holder. Check your data and try again. If you proceed with the payment, the amount may be transferred to the wrong recipient."
    And Scroll down until element with id "nlb-button-primary" is in view
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Assert text "OTHR - Other" in element id "nlb-input-purpose-code"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "SP_001" in txt file
    And Assert element by text "NRC - No reference"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by contains text with special characters "Name partially matches the account holder. Check your data and try again. If you proceed with the payment, the amount may be transferred to the wrong recipient."
    And Go Back
    And Click on element by text from excel "<rowindex>" columnName "vop_recipient_iban"
    And Assert element by contains text with special characters "Name partially matches the account holder. Check your data and try again. If you proceed with the payment, the amount may be transferred to the wrong recipient."
    And Scroll down until element with id "nlb-button-primary" is in view
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by contains text with special characters "Name partially matches the account holder. Check your data and try again. If you proceed with the payment, the amount may be transferred to the wrong recipient."
    And Scroll down until element with id "nlb-button-primary" is in view
    And Click on element by id "nlb-button-primary"

    Then Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success" with assert

    Examples:
      | rowindex |
      |        4 |

  @Instant_Payment-VOP_Invalid_Input_[ANDROID]
  Scenario Outline: Instant_Payment-VOP_Invalid_Input_[ANDROID]
    #C93804

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "vop_recipient_iban" in element id "nlb-input-account-number"
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by id "nlb-input-recipient-name" to appear

    Then Enter text "%^%$" in element id "nlb-input-recipient-name"
    And Click on element by id "nlb-input-recipient-name"
    And Hide keyboard
    And Click on element by text from excel "<rowindex>" columnName "vop_recipient_iban"
    And Click on element by text from excel "<rowindex>" columnName "vop_recipient_iban"
    And Assert element by contains text with special characters "Please use the following characters: A B C D E F G H I J K L M N O P Q R S T U V W X Y Z Č Ć Ž Š Đ 0 1 2 3 4 5 6 7 8 9 / - ? : ( ) . , ' & - space"
    And Enter text "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" in element id "nlb-input-recipient-name"
    And Assert element by text "Maximum number of characters is 70."


    Examples:
      | rowindex |
      |        4 |

  @Instant_Payment-VOP_On_New_Standing_Order-VOP_Partial_Match-Recipient_Name_Partially_Matches_With_VOP_Register_[ANDROID]_1
  Scenario Outline: Instant_Payment-VOP_On_New_Standing_Order-VOP_Partial_Match-Recipient_Name_Partially_Matches_With_VOP_Register_[ANDROID]_1
    #C99460,C93407

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    And Click "Pay" content description from view tag "View"
    And Wait for Past payments button in Pay screen

    When Click on element by text "Standing orders"
    And Wait for element by id "nlb-title" to appear
    And Click on element by text "New standing order"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "vop_recipient_iban" in element id "nlb-input-account-number"
    And Enter random amount in element by id "nlb-amount-with-currency-field" and remember it under key "SO_001" in txt file
    And Scroll until element with text "Next" is in view
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-checkbox-update-recipient" to appear
    And Select account from Excel "<rowindex>" columnName "personal_account_iban" as debtor in payment screen
    And Wait for element by id "nlb-input-recipient-name" to appear
    And Enter text from excel "<rowindex>" columnName "vop_recipient_name" with random deleted character in element id "nlb-input-recipient-name"
    And Enter text "TEST" in element id "nlb-input-recipient-address"
    And Enter text "TEST" in element id "nlb-input-recipient-city"
    And Click on element by id "nlb-input-recipient-name"
    And Hide keyboard
    And Click on element by text from excel "<rowindex>" columnName "vop_recipient_iban"
    And Click on element by text from excel "<rowindex>" columnName "vop_recipient_iban"
    And Assert element by contains text with special characters "Name partially matches the account holder. Check your data and try again. If you proceed with the payment, the amount may be transferred to the wrong recipient."
    And Scroll down until element with id "nlb-input-purpose" is in view
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "SP_001" in txt file
    And Scroll down until element with id "nlb-button-primary" is in view
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by contains text with special characters "Name partially matches the account holder. Check your data and try again. If you proceed with the payment, the amount may be transferred to the wrong recipient."
    And Go Back
    And Click on element by text from excel "<rowindex>" columnName "vop_recipient_iban"
    And Assert element by contains text with special characters "Name partially matches the account holder. Check your data and try again. If you proceed with the payment, the amount may be transferred to the wrong recipient."
    And Scroll down until element with id "nlb-button-primary" is in view
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by contains text with special characters "Name partially matches the account holder. Check your data and try again. If you proceed with the payment, the amount may be transferred to the wrong recipient."
    And Scroll down until element with id "nlb-button-primary" is in view
    And Click on element by id "nlb-button-primary"

    Then Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success" with assert

    Examples:
      | rowindex |
      |        4 |

  @Instant_Payment-VOP_On_New_Standing_Order-VOP_Partial_Match-Recipient_Name_Partially_Matches_With_VOP_Register_[ANDROID]_2
  Scenario Outline: Instant_Payment-VOP_On_New_Standing_Order-VOP_Partial_Match-Recipient_Name_Partially_Matches_With_VOP_Register_[ANDROID]_2
    #C99460,C93407

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    And Click "Pay" content description from view tag "View"
    And Wait for Past payments button in Pay screen

    When Click on element by text "Standing orders"
    And Wait for element by id "nlb-title" to appear
    And Click on element by text "New standing order"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "vop_recipient_iban" in element id "nlb-input-account-number"
    And Enter random amount in element by id "nlb-amount-with-currency-field" and remember it under key "SO_001" in txt file
    And Scroll until element with text "Next" is in view
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-checkbox-update-recipient" to appear
    And Select account from Excel "<rowindex>" columnName "personal_account_iban" as debtor in payment screen
    And Wait for element by id "nlb-input-recipient-name" to appear
    And Enter text from excel "<rowindex>" columnName "vop_recipient_name" with random letters permuted in element id "nlb-input-recipient-name"
    And Enter text "TEST" in element id "nlb-input-recipient-address"
    And Enter text "TEST" in element id "nlb-input-recipient-city"
    And Click on element by id "nlb-input-recipient-name"
    And Hide keyboard
    And Click on element by text from excel "<rowindex>" columnName "vop_recipient_iban"
    And Click on element by text from excel "<rowindex>" columnName "vop_recipient_iban"
    And Assert element by contains text with special characters "Name partially matches the account holder. Check your data and try again. If you proceed with the payment, the amount may be transferred to the wrong recipient."
    And Scroll down until element with id "nlb-input-purpose" is in view
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "SP_001" in txt file
    And Scroll down until element with id "nlb-button-primary" is in view
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by contains text with special characters "Name partially matches the account holder. Check your data and try again. If you proceed with the payment, the amount may be transferred to the wrong recipient."
    And Go Back
    And Click on element by text from excel "<rowindex>" columnName "vop_recipient_iban"
    And Wait "3" seconds
    And Assert element by contains text with special characters "Name partially matches the account holder. Check your data and try again. If you proceed with the payment, the amount may be transferred to the wrong recipient."
    And Scroll down until element with id "nlb-button-primary" is in view
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by contains text with special characters "Name partially matches the account holder. Check your data and try again. If you proceed with the payment, the amount may be transferred to the wrong recipient."
    And Scroll down until element with id "nlb-button-primary" is in view
    And Click on element by id "nlb-button-primary"

    Then Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success" with assert

    Examples:
      | rowindex |
      |        4 |

  @Instant_Payment-VOP_On_New_Standing_Order-VOP_Partial_Match-Recipient_Name_Partially_Matches_With_VOP_Register_[ANDROID]_3
  Scenario Outline: Instant_Payment-VOP_On_New_Standing_Order-VOP_Partial_Match-Recipient_Name_Partially_Matches_With_VOP_Register_[ANDROID]_3
    #C99460,C93407

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    And Click "Pay" content description from view tag "View"
    And Wait for Past payments button in Pay screen

    When Click on element by text "Standing orders"
    And Wait for element by id "nlb-title" to appear
    And Click on element by text "New standing order"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "vop_recipient_iban" in element id "nlb-input-account-number"
    And Enter random amount in element by id "nlb-amount-with-currency-field" and remember it under key "SO_001" in txt file
    And Scroll until element with text "Next" is in view
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-checkbox-update-recipient" to appear
    And Select account from Excel "<rowindex>" columnName "personal_account_iban" as debtor in payment screen
    And Wait for element by id "nlb-input-recipient-name" to appear
    And Enter text from excel "<rowindex>" columnName "vop_recipient_name" with last letter changed in element id "nlb-input-recipient-name"
    And Enter text "TEST" in element id "nlb-input-recipient-address"
    And Enter text "TEST" in element id "nlb-input-recipient-city"
    And Click on element by id "nlb-input-recipient-name"
    And Hide keyboard
    And Click on element by text from excel "<rowindex>" columnName "vop_recipient_iban"
    And Click on element by text from excel "<rowindex>" columnName "vop_recipient_iban"
    And Assert element by contains text with special characters "Name partially matches the account holder. Check your data and try again. If you proceed with the payment, the amount may be transferred to the wrong recipient."
    And Scroll down until element with id "nlb-input-purpose" is in view
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "SP_001" in txt file
    And Scroll down until element with id "nlb-button-primary" is in view
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by contains text with special characters "Name partially matches the account holder. Check your data and try again. If you proceed with the payment, the amount may be transferred to the wrong recipient."
    And Go Back
    And Click on element by text from excel "<rowindex>" columnName "vop_recipient_iban"
    And Assert element by contains text with special characters "Name partially matches the account holder. Check your data and try again. If you proceed with the payment, the amount may be transferred to the wrong recipient."
    And Scroll down until element with id "nlb-button-primary" is in view
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by contains text with special characters "Name partially matches the account holder. Check your data and try again. If you proceed with the payment, the amount may be transferred to the wrong recipient."
    And Scroll down until element with id "nlb-button-primary" is in view
    And Click on element by id "nlb-button-primary"

    Then Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success" with assert

    Examples:
      | rowindex |
      |        4 |

  @Instant_Payment-VOP_Skipped-Recipient_Prefilled_From_Legal_Entities_Public_Registry_[ANDROID]
  Scenario Outline: Instant_Payment-VOP_Skipped-Recipient_Prefilled_From_Legal_Entities_Public_Registry_[ANDROID]
    #C93404

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer" to appear for "30" seconds
    And Click on element by text "Pay or transfer"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "vop_legal_entity_iban" in element id "nlb-input-account-number"
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by text "Save recipient"
    And Click on element by text from excel "<rowindex>" columnName "vop_legal_entity_iban"
    And Assert text from excel "<rowindex>" columnName "vop_legal_entity_name" in element by id "nlb-input-recipient-name"
    And Click on element by id "nlb-input-recipient-name"
    And Hide keyboard
    And Click on element by text from excel "<rowindex>" columnName "vop_legal_entity_iban"
    And Click on element by text from excel "<rowindex>" columnName "vop_legal_entity_iban"
    And Assert element by contains text with special characters "Name matches account holder's name."
    And Scroll down until element with id "nlb-button-primary" is in view
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Assert text "OTHR - Other" in element id "nlb-input-purpose-code"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "SP_001" in txt file
    And Click "Expand dropdown menu" content description from tag "ImageView"
    And Click on element by text "NRC - No reference"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by contains text with special characters "Name matches account holder's name."
    And Go Back
    And Click on element by text from excel "<rowindex>" columnName "vop_legal_entity_iban"
    And Assert element by contains text with special characters "Name matches account holder's name."
    And Scroll down until element with id "nlb-button-primary" is in view
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by contains text with special characters "Name matches account holder's name."
    And Scroll down until element with id "nlb-button-primary" is in view
    And Click on element by id "nlb-button-primary"

    Then Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success" with assert

    Examples:
      | rowindex |
      |        4 |

  @Instant_Payment-VOP_On_New_Standing_Order-VOP_Skipped-Recipient_Prefilled_From_Legal_Entities_Public_Registry_[ANDROID]
  Scenario Outline: Instant_Payment-VOP_On_New_Standing_Order-VOP_Skipped-Recipient_Prefilled_From_Legal_Entities_Public_Registry_[ANDROID]
    #C99463

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    And Click "Pay" content description from view tag "View"
    And Wait for Past payments button in Pay screen

    When Click on element by text "Standing orders"
    And Wait for element by id "nlb-title" to appear
    And Click on element by text "New standing order"
    And Wait for element by id "nlb-input-account-number" to appear
    And Enter text from excel "<rowindex>" columnName "vop_legal_entity_iban" in element id "nlb-input-account-number"
    And Enter random amount in element by id "nlb-amount-with-currency-field" and remember it under key "SO_001" in txt file
    And Scroll until element with text "Next" is in view
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-checkbox-update-recipient" to appear
    And Select account from Excel "<rowindex>" columnName "personal_account_iban" as debtor in payment screen
    And Wait for element by id "nlb-checkbox-update-recipient" to appear
    And Click on element by text from excel "<rowindex>" columnName "vop_legal_entity_iban"
    And Assert text from excel "<rowindex>" columnName "vop_legal_entity_name" in element by id "nlb-input-recipient-name"
    And Click on element by id "nlb-input-recipient-name"
    And Hide keyboard
    And Click on element by text from excel "<rowindex>" columnName "vop_legal_entity_iban"
    And Click on element by text from excel "<rowindex>" columnName "vop_legal_entity_iban"
    And Assert element by contains text with special characters "Name matches account holder's name."
    And Scroll down until element with id "nlb-input-purpose" is in view
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "SP_001" in txt file
    And Scroll down until element with text "Schedule" is in view
    And Click "Expand dropdown menu" content description from tag "ImageView"
    And Click on element by text "NRC - No reference"
    And Scroll down until element with id "nlb-button-primary" is in view
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by contains text with special characters "Name matches account holder's name."
    And Go Back
    And Click on element by text from excel "<rowindex>" columnName "vop_legal_entity_iban"
    And Assert element by contains text with special characters "Name matches account holder's name."
    And Scroll down until element with id "nlb-button-primary" is in view
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by contains text with special characters "Name matches account holder's name."
    And Scroll down until element with id "nlb-button-primary" is in view
    And Click on element by id "nlb-button-primary"

    Then Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success" with assert

    Examples:
      | rowindex |
      |        4 |

  @Instant_Payment-VOP_Recipient_Already_Saved_SEPA_[ANDROID]
  Scenario Outline: Instant_Payment-VOP_Recipient_Already_Saved_SEPA_[ANDROID]
    #C99724

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
    And Scroll until element with text from excel "<rowindex>" columnName "vop_correct_contact_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "vop_correct_contact_iban"
    And Wait for element by text "Set amount and currency" to appear for "30" seconds
    And Enter text "10" in element id "nlb-amount-with-currency-field"
    And Swipe vertical
    And Click on element by text "Next"
    And Wait for element by text "Update recipient"
    And Click on element by text from excel "<rowindex>" columnName "vop_correct_contact_iban"
    And Assert text from excel "<rowindex>" columnName "vop_correct_contact_name" in element by id "nlb-input-recipient-name"
    And Assert element by contains text with special characters "Name matches account holder's name."
    And Scroll down until element with id "nlb-button-primary" is in view
    And Assert text "10,00" in element id "nlb-amount-with-currency-field"
    And Assert currency in second payment screen is "EUR"
    And Assert text "OTHR - Other" in element id "nlb-input-purpose-code"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "SP_001" in txt file
    And Assert element by text "NRC - No reference"
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by contains text with special characters "Name matches account holder's name."
    And Go Back
    And Click on element by text from excel "<rowindex>" columnName "vop_correct_contact_iban"
    And Assert element by contains text with special characters "Name matches account holder's name."
    And Scroll down until element with id "nlb-button-primary" is in view
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by contains text with special characters "Name matches account holder's name."
    And Scroll down until element with id "nlb-button-primary" is in view
    And Click on element by id "nlb-button-primary"

    Then Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success" with assert

    Examples:
      | rowindex |
      |        4 |


  @Instant_Payment-VOP_Recipient_Already_Saved_Standing_Order_[ANDROID]
  Scenario Outline: Instant_Payment-VOP_Recipient_Already_Saved_Standing_Order_[ANDROID]
    #C99724

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    And Click "Pay" content description from view tag "View"
    And Wait for Past payments button in Pay screen

    When Click on element by text "Standing orders"
    And Wait for element by id "nlb-title" to appear
    And Click on element by text "New standing order"
    And Wait for element by id "nlb-input-account-number" to appear
    And Click on element by id "nlb-button-alternate"
    And Wait for element with "Current account" content description from view tag "View"
    And Remove keyboard
    And Scroll until element with text from excel "<rowindex>" columnName "vop_correct_contact_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "vop_correct_contact_iban"
    And Wait for element by text "Set amount and currency" to appear for "30" seconds
    And Enter random amount in element by id "nlb-amount-with-currency-field" and remember it under key "SO_001" in txt file
    And Scroll until element with text "Next" is in view
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-checkbox-update-recipient" to appear
    And Select account from Excel "<rowindex>" columnName "personal_account_iban" as debtor in payment screen
    And Wait for element by text "Update recipient"
    And Click on element by text from excel "<rowindex>" columnName "vop_correct_contact_iban"
    And Assert text from excel "<rowindex>" columnName "vop_correct_contact_name" in element by id "nlb-input-recipient-name"
    And Assert element by contains text with special characters "Name matches account holder's name."
    And Scroll down until element with id "nlb-button-primary" is in view
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "SP_001" in txt file
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by contains text with special characters "Name matches account holder's name."
    And Go Back
    And Click on element by text from excel "<rowindex>" columnName "vop_correct_contact_iban"
    And Assert element by contains text with special characters "Name matches account holder's name."
    And Scroll down until element with id "nlb-button-primary" is in view
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by contains text with special characters "Name matches account holder's name."
    And Scroll down until element with id "nlb-button-primary" is in view
    And Click on element by id "nlb-button-primary"

    Then Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success" with assert

    Examples:
      | rowindex |
      |        4 |