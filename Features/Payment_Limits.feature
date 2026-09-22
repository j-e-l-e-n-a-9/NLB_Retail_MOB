Feature: Payment_Limits

  @View_Edit_User_Data_Personal_Data_Change_Limit_[ANDROID]-Single_Transaction
  Scenario Outline: View_Edit_User_Data_Personal_Data_Change_Limit_[ANDROID]-Single_Transaction

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    #And Check if cash credit offer appears and dismiss it
    And Wait for My NLB screen to load

    When Click icon of user profile
    And Wait for element by contains text "User Settings"
    And Click on element by text "Payments"
    And Wait for element by contains text "limit"
    And Click on element by contains text "limit"
    And Wait element by contains Content desc "Open editing of field" for "3" seconds
    And Click "Open editing of field" content description
    And Wait for element by id "nlb-amount-with-currency-field" to appear
    And Enter text "10" in element id "nlb-amount-with-currency-field" on index "1" and remember it under key "keySingleLimitNew"
    And Remember text from element by id "nlb-amount-with-currency-field" on index "2 "under key "keyDailyLimitDefault"
    And Remember text from element by id "nlb-amount-with-currency-field" on index "3 "under key "keyMonthlyLimitDefault"

    And Click on element by contains text "Save"
    And Wait for element by text "Enter PIN"
    And Enter PIN
    And Wait for element by contains text "Payment limits change"

    And Assert "Single transaction limit" has value from key "keySingleLimitNew" and currency "RSD" in payment limits
    And Assert "Daily transaction limit" has value from key "keyDailyLimitDefault" and currency "RSD" in payment limits
    And Assert "Monthly transaction limit" has value from key "keyMonthlyLimitDefault" and currency "RSD" in payment limits

    And Click on element by text "Confirm"
    And Wait for element by contains text "Success"
    And Wait element by contains Content desc "Open editing of field" for "3" seconds

    And Assert "Single transaction limit" has value from key "keySingleLimitNew" and currency "RSD" in payment limits
    And Assert "Daily transaction limit" has value from key "keyDailyLimitDefault" and currency "RSD" in payment limits
    And Assert "Monthly transaction limit" has value from key "keyMonthlyLimitDefault" and currency "RSD" in payment limits
    And Click "Back" content description
    And Wait for element by contains text "IPS"
    And Click "Back" content description
    And Wait for element by contains text "About"
    And Click "Back" content description
    #And Check if cash credit offer appears and dismiss it
    And Click on element by text "Pay"
    And Wait for element by contains text "Domestic payment"
    And Click on element by text "Domestic payment"

    And Wait for element by id "nlb-input-creditor-account" to appear
    And Enter text "205-0000000251954-50" in element id "nlb-input-creditor-account"
    And Enter text "rade" in element id "nlb-input-creditor-name"
    And Enter text "niska 45" in element id "nlb-input-creditor-address"
    And Enter text "vranje" in element id "nlb-input-creditor-city"
    And Swipe vertical
    And Swipe vertical
    And Wait for element by id "nlb-amount-with-currency-field" to appear
    And Enter text "11" in element id "nlb-amount-with-currency-field"
    And Click on element by contains text "Next"
    And Wait for element by text "Error"
    And Assert element by contains text "Transaction limit exceeded"
    And Click on element by text "OK"
    And Click "Back" content description
    And Wait for element by text "My NLB"
    And Click on element by text "My NLB"
    #And Check if cash credit offer appears and dismiss it
    And Wait for My NLB screen to load

    And Click icon of user profile
    And Wait for element by contains text "User Settings"
    And Click on element by text "Payments"
    And Wait for element by contains text "limit"
    And Click on element by contains text "limit"
    And Wait element by contains Content desc "Open editing of field" for "3" seconds
    And Click "Open editing of field" content description
    And Wait for element by id "nlb-amount-with-currency-field" to appear

    And Assert element by id "nlb-amount-with-currency-field" and index "1" contains text from key "keySingleLimitNew"
    And Assert element by id "nlb-amount-with-currency-field" and index "2" contains text from key "keyDailyLimitDefault"
    And Assert element by id "nlb-amount-with-currency-field" and index "3" contains text from key "keyMonthlyLimitDefault"
    And Enter text "300000" in element id "nlb-amount-with-currency-field" on index "1" and remember it under key "keySingleLimitNewSecond"
    And Remember text from element by id "nlb-amount-with-currency-field" on index "2 "under key "keyDailyLimitDefault"
    And Remember text from element by id "nlb-amount-with-currency-field" on index "3 "under key "keyMonthlyLimitDefault"

    And Click on element by contains text "Save"
    And Wait for element by text "Enter PIN"
    And Enter PIN
    And Wait for element by contains text "Payment limits change"

    And Assert "Single transaction limit" has value from key "keySingleLimitNewSecond" and currency "RSD" in payment limits
    And Assert "Daily transaction limit" has value from key "keyDailyLimitDefault" and currency "RSD" in payment limits
    And Assert "Monthly transaction limit" has value from key "keyMonthlyLimitDefault" and currency "RSD" in payment limits

    And Click on element by text "Confirm"
    And Wait for element by contains text "Success"
    And Wait element by contains Content desc "Open editing of field" for "3" seconds
    And Assert "Single transaction limit" has value from key "keySingleLimitNewSecond" and currency "RSD" in payment limits
    And Assert "Daily transaction limit" has value from key "keyDailyLimitDefault" and currency "RSD" in payment limits
    And Assert "Monthly transaction limit" has value from key "keyMonthlyLimitDefault" and currency "RSD" in payment limits
    And Click "Back" content description
    And Wait for element by contains text "IPS"
    And Click "Back" content description
    And Wait for element by contains text "About"
    And Click "Back" content description
    #And Check if cash credit offer appears and dismiss it
    And Click on element by text "Pay"
    And Wait for element by contains text "Domestic payment"
    And Click on element by text "Domestic payment"

    Then Wait for element by id "nlb-input-creditor-account" to appear
    And Enter text "205-0000000251954-50" in element id "nlb-input-creditor-account"
    And Enter text "pera" in element id "nlb-input-creditor-name"
    And Enter text "beogradska 45" in element id "nlb-input-creditor-address"
    And Enter text "uzice" in element id "nlb-input-creditor-city"
    And Swipe vertical
    And Swipe vertical
    And Wait for element by id "nlb-amount-with-currency-field" to appear
    And Enter text "12" in element id "nlb-amount-with-currency-field"
    
    And Click on element by text "Next"
    And Wait for element by text "Fee"
    And Swipe vertical
    And Wait for element by text "Confirm"
    And Click on element by text "Confirm"
    And Wait for element by text "Enter PIN"
    And Enter PIN
    And Wait for element by text "Pay"
    And Click on element by text "Pay"
    And Wait for element by id "transactions-web-close-popup-icon" to appear
    And Assert element by contains text "Your payment was successfully accepted."

    Examples:
      | rowindex |
      | 4        |


  @View_Edit_User_Data_Personal_Data_Change_Limit_[ANDROID]-Monthly_Transaction
  Scenario Outline: View_Edit_User_Data_Personal_Data_Change_Limit_[ANDROID]-Monthly_Transaction

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    #And Check if cash credit offer appears and dismiss it
    And Wait for My NLB screen to load

    When Click icon of user profile
    And Wait for element by contains text "User Settings"
    And Click on element by text "Payments"
    And Wait for element by contains text "limit"
    And Click on element by contains text "limit"
    And Wait element by contains Content desc "Open editing of field" for "3" seconds
    And Click "Open editing of field" content description
    And Wait for element by id "nlb-amount-with-currency-field" to appear

    And Enter text "555" in element id "nlb-amount-with-currency-field" on index "3" and remember it under key "xxx"
    And Wait element "Transaction limit cannot be higher than Monthly limit! Please change the amount and try again." by text
    And Assert element by text "Daily limit cannot be higher than Monthly limit! Please change the amount and try again."
    And Swipe vertical
    And Assert element by text "Save" is not clickable
    And Go Back
    And Wait element by contains Content desc "Open editing of field" for "3" seconds
    And Click "Open editing of field" content description
    And Wait for element by id "nlb-amount-with-currency-field" to appear

    And Enter text "15" in element id "nlb-amount-with-currency-field" on index "1" and remember it under key "keySingleLimitNew"
    And Enter text "15" in element id "nlb-amount-with-currency-field" on index "2" and remember it under key "keyDailyLimitNew"
    And Enter text "15" in element id "nlb-amount-with-currency-field" on index "3" and remember it under key "keyMonthlyLimitNew"

    And Click on element by contains text "Save"
    And Wait for element by text "Enter PIN"
    And Enter PIN
    And Wait for element by contains text "Payment limits change"

    And Assert "Single transaction limit" has value from key "keySingleLimitNew" and currency "RSD" in payment limits
    And Assert "Daily transaction limit" has value from key "keyDailyLimitNew" and currency "RSD" in payment limits
    And Assert "Monthly transaction limit" has value from key "keyMonthlyLimitNew" and currency "RSD" in payment limits

    And Click on element by text "Confirm"
    And Wait for element by contains text "Success"
    And Wait element by contains Content desc "Open editing of field" for "3" seconds

    And Assert "Single transaction limit" has value from key "keySingleLimitNew" and currency "RSD" in payment limits
    And Assert "Daily transaction limit" has value from key "keyDailyLimitNew" and currency "RSD" in payment limits
    And Assert "Monthly transaction limit" has value from key "keyMonthlyLimitNew" and currency "RSD" in payment limits
    And Click "Back" content description
    And Wait for element by contains text "IPS"
    And Click "Back" content description
    And Wait for element by contains text "About"
    And Click "Back" content description
    #And Check if cash credit offer appears and dismiss it
    And Click on element by text "Pay"
    And Wait for element by contains text "Domestic payment"
    And Click on element by text "Domestic payment"

    And Wait for element by id "nlb-input-creditor-account" to appear
    And Enter text "205-0000000251954-50" in element id "nlb-input-creditor-account"
    And Enter text "rade" in element id "nlb-input-creditor-name"
    And Enter text "niska 45" in element id "nlb-input-creditor-address"
    And Enter text "vranje" in element id "nlb-input-creditor-city"
    And Swipe vertical
    And Swipe vertical
    And Wait for element by id "nlb-amount-with-currency-field" to appear
    And Enter text "16" in element id "nlb-amount-with-currency-field"
    And Click on element by contains text "Next"

    And Wait for element by text "Error"
    And Assert element by contains text "Transaction limit exceeded"
    And Click on element by text "OK"
    And Click "Back" content description
    And Wait for element by text "My NLB"
    And Click on element by text "My NLB"
    #And Check if cash credit offer appears and dismiss it
    And Wait for My NLB screen to load

    And Click icon of user profile
    And Wait for element by contains text "User Settings"
    And Click on element by text "Payments"
    And Wait for element by contains text "limit"
    And Click on element by contains text "limit"
    And Wait element by contains Content desc "Open editing of field" for "3" seconds
    And Click "Open editing of field" content description
    And Wait for element by id "nlb-amount-with-currency-field" to appear

    And Assert element by id "nlb-amount-with-currency-field" and index "1" contains text from key "keySingleLimitNew"
    And Assert element by id "nlb-amount-with-currency-field" and index "2" contains text from key "keyDailyLimitNew"
    And Assert element by id "nlb-amount-with-currency-field" and index "3" contains text from key "keyMonthlyLimitNew"

    And Enter text "300000" in element id "nlb-amount-with-currency-field" on index "1" and remember it under key "keySingleLimitNewSecond"
    And Enter text "300000" in element id "nlb-amount-with-currency-field" on index "2" and remember it under key "keyDailyLimitNewSecond"
    And Enter text "600000" in element id "nlb-amount-with-currency-field" on index "3" and remember it under key "keyMonthlyLimitNewSecond"

    And Click on element by contains text "Save"
    And Wait for element by text "Enter PIN"
    And Enter PIN
    And Wait for element by contains text "Payment limits change"

    And Assert "Single transaction limit" has value from key "keySingleLimitNewSecond" and currency "RSD" in payment limits
    And Assert "Daily transaction limit" has value from key "keyDailyLimitNewSecond" and currency "RSD" in payment limits
    And Assert "Monthly transaction limit" has value from key "keyMonthlyLimitNewSecond" and currency "RSD" in payment limits

    And Click on element by text "Confirm"
    And Wait for element by contains text "Success"
    And Wait element by contains Content desc "Open editing of field" for "3" seconds
    And Assert "Single transaction limit" has value from key "keySingleLimitNewSecond" and currency "RSD" in payment limits
    And Assert "Daily transaction limit" has value from key "keyDailyLimitNewSecond" and currency "RSD" in payment limits
    And Assert "Monthly transaction limit" has value from key "keyMonthlyLimitNewSecond" and currency "RSD" in payment limits
    And Click "Back" content description
    And Wait for element by contains text "IPS"
    And Click "Back" content description
    And Wait for element by contains text "About"
    And Click "Back" content description
    #And Check if cash credit offer appears and dismiss it
    And Click on element by text "Pay"
    And Wait for element by contains text "Domestic payment"
    And Click on element by text "Domestic payment"

    Then Wait for element by id "nlb-input-creditor-account" to appear
    And Enter text "205-0000000251954-50" in element id "nlb-input-creditor-account"
    And Enter text "pera" in element id "nlb-input-creditor-name"
    And Enter text "beogradska 45" in element id "nlb-input-creditor-address"
    And Enter text "uzice" in element id "nlb-input-creditor-city"
    And Swipe vertical
    And Swipe vertical
    And Wait for element by id "nlb-amount-with-currency-field" to appear
    And Enter text "16" in element id "nlb-amount-with-currency-field"

    And Click on element by text "Next"
    And Wait for element by text "Fee"
    And Swipe vertical
    And Wait for element by text "Confirm"
    And Click on element by text "Confirm"
    And Wait for element by text "Enter PIN"
    And Enter PIN
    And Wait for element by text "Pay"
    And Click on element by text "Pay"
    And Wait for element by id "transactions-web-close-popup-icon" to appear
    And Assert element by contains text "Your payment was successfully accepted."

    Examples:
      | rowindex |
      | 4        |