Feature: Vita_Insurance_Accounts

  @Vita_Insurance_Accounts-Details-Insurance_Details_[MOB_ANDROID]
  Scenario Outline: Vita_Insurance_Accounts-Details-Insurance_Details_[MOB_ANDROID]
    #C71044

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "insurance_account_detailed_name" is in view
    And Click on element by text from excel "<rowindex>" columnName "insurance_account_detailed_name"
    And Wait for element by id "nlb-cta-button" to appear
    And Click on element by text "Details"
    And Wait for element by id "nlb-insurer" to appear

    Then Wait for element by text "Insurance details"
    And Assert element by text "Insurer"
    And Assert text from excel "<rowindex>" columnName "insurance_account_details_insurer" in element by id "nlb-insurer"
    And Assert element by text "Policy number"
    And Assert text from excel "<rowindex>" columnName "insurance_account_details_policy_number" in element by id "nlb-policy-number"
    And Assert element by text "Opening date"
    And Assert text from excel "<rowindex>" columnName "insurance_account_details_opening_date" in element by id "nlb-opening-date"
    And Assert element by text "Starting date"
    And Assert text from excel "<rowindex>" columnName "insurance_account_details_starting_date" in element by id "nlb-insurance-start-date"
    And Assert element by text "Closing date"
    And Assert text from excel "<rowindex>" columnName "insurance_account_details_closing_date" in element by id "nlb-closing-date"
    And Assert element by text "Policy status"
    And Assert text "Active" in element id "nlb-policy-status"
    And Assert element by text "Policy pledge"
    And Assert text "No" in element id "nlb-policy-pledge"

    Examples:
      | rowindex |
      |        1 |


  @Vita_Insurance_Accounts-Details-Financial_Details_[MOB_ANDROID]
  Scenario Outline: Vita_Insurance_Accounts-Details-Financial_Details_[MOB_ANDROID]
    #C71043

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "insurance_account_detailed_name" is in view
    And Click on element by text from excel "<rowindex>" columnName "insurance_account_detailed_name"
    And Wait for element by id "nlb-cta-button" to appear
    And Click on element by text "Details"
    And Wait for element by id "nlb-insurer" to appear

    Then Wait for element by text "Financial details"
    And Assert element by text "Financial details"
    And Assert element by text "Payment frequency"
    And Assert text "Once" in element id "nlb-payment-frequency"
    And Assert element by text "Last included premium"
    And Assert element by id "nlb-last-incl-premium-date" is date of format "dd. MM. yyyy"
    And Assert element by text "Last calculation of risk premium"
    And Assert element by id "nlb-last-calc-risk-premium" is date of format "dd. MM. yyyy"

    Examples:
      | rowindex |
      |        1 |

  @VITA_INSURANCE_ACCOUNTS-STATEMANTS-FILTER_[MOB_ANDROID]
  Scenario Outline: VITA_INSURANCE_ACCOUNTS-STATEMANTS-FILTER_[MOB_ANDROID]
  C71047

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear
    And Click on Product from Excel "<rowindex>" columnName "insurance_account_detailed_name" in My Products

    And Wait element "Premiums" by text
    And Assert Product page for product with name from Excel "<rowindex>" columnName "insurance_account_detailed_name"
    And Assert element with class "android.widget.TextView" and has text "Premiums" is displayed
    #And Assert list of element by id "nlb-item-row" is displayed
    And Assert list of transactions is displayed correctly in Insurance
    And Assert NLB feature button with text "Pay unpaid premiums"
    And Assert list of element by id "nlb-cta-button" is displayed
    And Assert Statement button in Product details index "2"

    And Click on button in Product details "Statements"
    And Wait for Statements screen to load

    And Wait "10" seconds
    When Assert screen header is "Statements"
    And Assert back button in screen "Statements"
    And Assert Year filter for statements
    And Assert Year filter for statements has expected options
    And Select Year "2023" in statements filter
    And Wait for first statement to appear

    Then Assert first statement in list is from year "2023"
    And Assert statements in list are displayed correctly


    Examples:
      | rowindex |
      | 1        |


  @VITA_INSURANCE_ACCOUNTS-STATEMANTS-DOWNLOADS_[MOB_ANDROID]
  Scenario Outline: VITA_INSURANCE_ACCOUNTS-STATEMANTS-DOWNLOADS_[MOB_ANDROID]
  C71046

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear
    And Click on Product from Excel "<rowindex>" columnName "insurance_account_detailed_name" in My Products

    And Wait element "Premiums" by text
    And Assert Product page for product with name from Excel "<rowindex>" columnName "insurance_account_detailed_name"
    And Assert element with class "android.widget.TextView" and has text "Premiums" is displayed
    #And Assert list of element by id "nlb-item-row" is displayed
    And Assert list of transactions is displayed correctly in Insurance
    And Assert NLB feature button with text "Pay unpaid premiums"
    And Assert list of element by id "nlb-cta-button" is displayed
    And Assert Statement button in Product details index "2"

    And Click on button in Product details "Statements"
    And Wait for Statements screen to load

    And Wait "10" seconds
    When Assert screen header is "Statements"
    And Assert back button in screen "Statements"
    And Assert Year filter for statements
    And Assert Year filter for statements has expected options
    And Select Year "2023" in statements filter
    And Wait for first statement to appear
    And Click on Download for first statement in statement list

    Then Assert element by complete id "com.google.android.apps.docs:id/projector_toolbar"
    And Go Back


    Examples:
      | rowindex |
      | 1        |


  @VITA_INSURANCE_ACCOUNTS-DETAILS_[MOB_ANDROID]
  Scenario Outline: VITA_INSURANCE_ACCOUNTS-DETAILS_[MOB_ANDROID]
  C71042

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear
    And Click on Product from Excel "<rowindex>" columnName "insurance_account_detailed_name" in My Products

    And Wait element "Premiums" by text
    And Assert Product page for product with name from Excel "<rowindex>" columnName "insurance_account_detailed_name"
    And Assert Insurance policy amount for Vita
    And Assert element with class "android.widget.TextView" and has text "Premiums" is displayed
    And Assert list of transactions is displayed correctly in Insurance
    # ne treba da se prikaze
    #And Assert NLB feature button with text "Pay unpaid premiums"
    And Assert list of element by id "nlb-cta-button" is displayed
    And Assert Details button in Product details index "1"
    And Assert Statement button in Product details index "2"
    And Assert Funds button in Product details index "3"
    And Click on button in Product details "Details"
    And Wait for Details screen to load for Vita

    When Assert screen header is "Details"
    And Assert back button in screen "Details"
    And Assert Insurance policy amount for Vita

    And Assert that Financial details in Details screen is index 1
    And Assert that Insurance details in Details screen is index 2
    And Assert there are is no Unpaid Premiums category in Vita details


    Examples:
      | rowindex |
      | 3        |