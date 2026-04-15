Feature: Loan_Accounts

  @Loan_Accounts-Product_On_The_List_[MOB_ANDROID]
  Scenario Outline: Loan_Accounts-Product_On_The_List_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear

    When Scroll until element with text from excel "<rowindex>" columnName "loan_account_number" is in view

    Then Assert Loan accounts icons is displayed
    And Assert Loan accounts product names is displayed
    And Assert Loan accounts account numbers is displayed
    #TO DO: Odkomentarisi korak ispod kada se bug resi. Ne postoji separator za hiljade na odredjenim kreditima
#    And Assert Loan accounts current loan balance is displayed

    Examples:
      | rowindex |
      |        5 |


  @Loan_Accounts-Details_[MOB_ANDROID]
  Scenario Outline: Loan_Accounts-Details_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
#    And Click on Bottom navigation button "My Products"
    And Click on element by text "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear

    When Scroll until element with text from excel "<rowindex>" columnName "loan_account_number" is in view
    And Assert Loan accounts icons is displayed
    And Assert Loan accounts product names is displayed
    And Assert Loan accounts account numbers is displayed
    #TO DO: Odkomentarisi kada korak ispod se bug resi. Ne postoji separator za hiljade na odredjenim kreditima
#    And Assert Loan accounts current loan balance is displayed

    Then Click on Product from Excel "<rowindex>" columnName "loan_account_number" in My Products
    And Wait for element by text "Financial details"
    And Assert element by text from excel "<rowindex>" columnName "loan_account_name"
    And Assert element by text from excel "<rowindex>" columnName "loan_account_number"
    And Assert button by text "Annuity plan"
    And Assert button by text "Payments"
    And Assert labels are displayed in the following order:
      | Financial details    |
      | Account details      |

    Examples:
      | rowindex |
      |        5 |


  @Loan_Accounts-Annuity_Plan_[MOB_ANDROID]
  Scenario Outline: Loan_Accounts-Annuity_Plan_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear

    When Scroll until element with text from excel "<rowindex>" columnName "loan_account_number2" is in view
    And Assert Loan accounts icons is displayed
    And Assert Loan accounts product names is displayed
    And Assert Loan accounts account numbers is displayed
    #TO DO: Odkomentarisi kada korak ispod se bug resi. Ne postoji separator za hiljade na odredjenim kreditima
#    And Assert Loan accounts current loan balance is displayed

    Then Click on Product from Excel "<rowindex>" columnName "loan_account_number2" in My Products
    And Wait for element by text "Financial details"
    And Assert element by text from excel "<rowindex>" columnName "loan_account_name2"
    And Assert element by text from excel "<rowindex>" columnName "loan_account_number2"
    And Assert button by text "Annuity plan"
    And Assert button by text "Payments"
    And Assert element by text "Financial details"
    And Assert element by text "Account details"
    And Assert element by id "nlb-product-details-primary-balance" has text in format "^\d{1,3}(\.\d{3})*,\d{2}\s*[A-Z]{3}$"
    And Click on element by text "Annuities"
    
    And Wait for element by contains text "Installments found"
    And Assert element by text "From"
    And Assert element by text "To"
    And Assert element by id "nlb-input-standing-order-start-date" and index "1" is displayed
    And Assert element by id "nlb-input-standing-order-start-date" and index "2" is displayed
    And Assert element by text "Annuity"
    And Assert element by text "Principal"
    And Assert Upcoming installments dates are sorted ascending for Loan annuitys
    And Assert list of Annuity amount is displayed correctly
    And Assert list of Principal amount is displayed correctly

    Examples:
      | rowindex |
      |        5 |


  @Loan_Accounts-Annuity_Plan-Filter_[MOB_ANDROID]
  Scenario Outline: Loan_Accounts-Annuity_Plan-Filter_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear

    When Scroll until element with text from excel "<rowindex>" columnName "loan_account_number2" is in view
    And Assert Loan accounts icons is displayed
    And Assert Loan accounts product names is displayed
    And Assert Loan accounts account numbers is displayed
    #TO DO: Odkomentarisi kada korak ispod se bug resi. Ne postoji separator za hiljade na odredjenim kreditima
#    And Assert Loan accounts current loan balance is displayed

    Then Click on Product from Excel "<rowindex>" columnName "loan_account_number2" in My Products
    And Wait for element by text "Financial details"
    And Assert element by text from excel "<rowindex>" columnName "loan_account_name2"
    And Assert element by text from excel "<rowindex>" columnName "loan_account_number2"
    And Assert button by text "Annuity plan"
    And Assert button by text "Payments"
    And Assert element by text "Financial details"
    And Assert element by text "Account details"
    And Assert element by id "nlb-product-details-primary-balance" has text in format "^\d{1,3}(\.\d{3})*,\d{2}\s*[A-Z]{3}$"
    And Click on element by text "Annuity plan"

    And Wait for element by contains text "Installments found"
    And Assert element by text "From"
    And Assert element by text "To"
    And Assert element by id "nlb-input-standing-order-start-date" and index "1" is displayed
    And Assert element by id "nlb-input-standing-order-start-date" and index "2" is displayed
    And Assert element by text "Annuity"
    And Assert element by text "Principal"
    And Assert Upcoming installments dates are sorted ascending for Loan annuitys
    And Assert list of Annuity amount is displayed correctly
    And Assert list of Principal amount is displayed correctly
    
    And Click on calendar icon with index "1"
    And Click on date in Calendar with year 2027 month 1 day 2 and assert that it is shown correctly
#    And Click on button Apply in Calendar
    And Click on element by text "Add filter"

    And Click on calendar icon with index "2"
    And Click on date in Calendar with year 2027 month 8 day 15 and assert that it is shown correctly
#    And Click on button Apply in Calendar
    And Click on element by text "Add filter"

    And Assert Loans payments dates are between dates year 2027 month 1 day 2 and year 2027 month 8 day 15

    Examples:
      | rowindex |
      |        5 |


  @Loan_Accounts-Annuity_Plan-Filter-invalid_[MOB_ANDROID]
  Scenario Outline: Loan_Accounts-Annuity_Plan-Filter-invalid_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear

    When Scroll until element with text from excel "<rowindex>" columnName "loan_account_number2" is in view
    And Assert Loan accounts icons is displayed
    And Assert Loan accounts product names is displayed
    And Assert Loan accounts account numbers is displayed
    #TO DO: Odkomentarisi kada korak ispod se bug resi. Ne postoji separator za hiljade na odredjenim kreditima
#    And Assert Loan accounts current loan balance is displayed

    And Click on Product from Excel "<rowindex>" columnName "loan_account_number2" in My Products
    And Wait for element by text "Financial details"
    And Assert element by text from excel "<rowindex>" columnName "loan_account_name2"
    And Assert element by text from excel "<rowindex>" columnName "loan_account_number2"
    And Assert button by text "Annuity plan"
    And Assert button by text "Payments"
    And Assert element by text "Financial details"
    And Assert element by text "Account details"
    And Assert element by id "nlb-product-details-primary-balance" has text in format "^\d{1,3}(\.\d{3})*,\d{2}\s*[A-Z]{3}$"

    Then Click on element by text "Annuity plan"
    And Wait for element by contains text "Installments found"
    And Assert element by text "From"
    And Assert element by text "To"
    And Assert element by id "nlb-input-standing-order-start-date" and index "1" is displayed
    And Assert element by id "nlb-input-standing-order-start-date" and index "2" is displayed
    And Assert element by text "Annuity"
    And Assert element by text "Principal"
    And Assert Upcoming installments dates are sorted ascending for Loan annuitys
    And Assert list of Annuity amount is displayed correctly
    And Assert list of Principal amount is displayed correctly

    And Click on calendar icon with index "1"
    And Click on date in Calendar with year 2027 month 6 day 6 and assert that it is shown correctly
#    And Click on button Apply in Calendar
    And Click on element by text "Add filter"

    And Click on calendar icon with index "2"
    And Assert date in Calendar with year 2027 month 4 day 15 is not clickable

    Examples:
      | rowindex |
      |        5 |


  @Loan_Accounts-Payments_[MOB_ANDROID]
  Scenario Outline: Loan_Accounts-Payments_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear

    When Scroll until element with text from excel "<rowindex>" columnName "loan_account_number2" is in view
    And Assert Loan accounts icons is displayed
    And Assert Loan accounts product names is displayed
    And Assert Loan accounts account numbers is displayed
    #TO DO: Odkomentarisi kada korak ispod se bug resi. Ne postoji separator za hiljade na odredjenim kreditima
#    And Assert Loan accounts current loan balance is displayed

    And Click on Product from Excel "<rowindex>" columnName "loan_account_number2" in My Products
    And Wait for element by text "Financial details"
    And Assert element by text from excel "<rowindex>" columnName "loan_account_name2"
    And Assert element by text from excel "<rowindex>" columnName "loan_account_number2"
    And Assert button by text "Annuity plan"
    And Assert button by text "Payments"
    And Assert element by text "Financial details"
    And Assert element by text "Account details"
    And Assert element by id "nlb-product-details-primary-balance" has text in format "^\d{1,3}(\.\d{3})*,\d{2}\s*[A-Z]{3}$"

    Then Click on element by text "Payments"
    And Wait for element by contains text "Payments found"
    And Assert element by text "RSD"
    And Assert Repayments dates are sorted descending for Loans payments
    And Assert list of Value in loan currency amount is displayed correctly
    And Assert list of Value in local currency amount is displayed correctly
    
    And Assert element by id "nlb-input-standing-order-start-date" and index "1" is displayed
    And Assert element by id "nlb-input-standing-order-start-date" and index "2" is displayed


    Examples:
      | rowindex |
      |        5 |


  @Loan_Accounts-Payments-Filter_[MOB_ANDROID]
  Scenario Outline: Loan_Accounts-Payments-Filter_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear

    When Scroll until element with text from excel "<rowindex>" columnName "loan_account_number2" is in view
    And Assert Loan accounts icons is displayed
    And Assert Loan accounts product names is displayed
    And Assert Loan accounts account numbers is displayed
    #TO DO: Odkomentarisi kada korak ispod se bug resi. Ne postoji separator za hiljade na odredjenim kreditima
#    And Assert Loan accounts current loan balance is displayed

    And Click on Product from Excel "<rowindex>" columnName "loan_account_number2" in My Products
    And Wait for element by text "Financial details"
    And Assert element by text from excel "<rowindex>" columnName "loan_account_name2"
    And Assert element by text from excel "<rowindex>" columnName "loan_account_number2"
    And Assert button by text "Annuity plan"
    And Assert button by text "Payments"
    And Assert element by text "Financial details"
    And Assert element by text "Account details"
    And Assert element by id "nlb-product-details-primary-balance" has text in format "^\d{1,3}(\.\d{3})*,\d{2}\s*[A-Z]{3}$"

    Then Click on element by text "Payments"
    And Wait for element by contains text "Payments found"
    And Assert element by text "EUR"
    And Assert element by text "RSD"
    And Assert Repayments dates are sorted descending for Loans payments
    And Assert list of Value in loan currency amount is displayed correctly
    And Assert list of Value in local currency amount is displayed correctly

    And Assert element by id "nlb-input-standing-order-start-date" and index "1" is displayed
    And Assert element by id "nlb-input-standing-order-start-date" and index "2" is displayed

    And Click on calendar icon with index "1"
    And Click on date in Calendar with year 2025 month 4 day 30 and assert that it is shown correctly
#    And Click on button Apply in Calendar
    And Click on element by text "Add filter"

    And Click on calendar icon with index "2"
    And Click on date in Calendar with year 2025 month 6 day 30 and assert that it is shown correctly
#    And Click on button Apply in Calendar
    And Click on element by text "Add filter"

    And Assert Loans payments dates are between dates year 2025 month 4 day 30 and year 2025 month 6 day 30


    Examples:
      | rowindex |
      |        5 |