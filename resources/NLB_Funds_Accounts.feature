Feature: NLB_Funds_Accounts

  @NLB_Funds_Accounts-Details-Financial_Details_[MOB_ANDROID]
  Scenario Outline: NLB_Funds_Accounts-Details-Financial_Details_[MOB_ANDROID]
    #C71110

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "nlb_funds_account_detailed_name" is in view
    And Swipe vertical short
    And Swipe vertical short
    And Remember secondary balance of product from Excel "<rowindex>" columnName "nlb_funds_account_detailed_name" under key "Funds_Secondary_Balance"
    And Click on element by text from excel "<rowindex>" columnName "nlb_funds_account_detailed_name"
    And Wait for element by id "nlb-cta-button" to appear
    And Click on element by text "Details"
    And Wait for element by id "nlb-asset-unit-value" to appear

    Then Assert element by text "Financial details"
    And Assert element by text "Asset unit value"
    And Assert element by id "nlb-asset-unit-value" ends in "EUR"
    And Assert element by text "Total investment value"
    And Assert element by id "nlb-total-investment-value" ends in "EUR"
    And Assert element by text "Total number of asset units"
    And Assert text from key "Funds_Secondary_Balance" in element by id "nlb-num-of-units"

    Examples:
      | rowindex |
      |        1 |

  @NLB_Funds_Accounts-Details-Sub_Fund_Details_[MOB_ANDROID]
  Scenario Outline: NLB_Funds_Accounts-Details-Sub_Fund_Details_[MOB_ANDROID]
    #C71111

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "nlb_funds_account_detailed_name" is in view
    And Click on element by text from excel "<rowindex>" columnName "nlb_funds_account_detailed_name"
    And Wait for element by id "nlb-cta-button" to appear
    And Click on element by text "Details"
    And Wait for element by id "nlb-asset-unit-value" to appear
    And Swipe vertical

    Then Assert element by text "Subfund details"
    And Assert element by text "Account owner"
    And Assert text from excel "<rowindex>" columnName "nlb_funds_account_details_owner" in element by id "nlb-owner-name"
    And Assert element by text "Subfund ownership"
    And Assert text "Owned" in element id "nlb-subfund-ownership"
    And Assert element by text "Application form number"
    And Assert text from excel "<rowindex>" columnName "nlb_funds_account_details_form_number" in element by id "nlb-app-form-id"
    And Assert element by text "Subfund name"
    And Assert text from excel "<rowindex>" columnName "nlb_funds_account_detailed_name" in element by id "nlb-subfund-name"
    And Assert element by text "Subfund account number"
    And Assert text from excel "<rowindex>" columnName "nlb_funds_account_details_subfund_account_number" in element by id "nlb-subfund-account-number"

    Examples:
      | rowindex |
      |        1 |


  @NLB_Funds_Accounts-Details-Movement_Of_Net_Asset_Value_[MOB_ANDROID]
  Scenario Outline: NLB_Funds_Accounts-Details-Movement_Of_Net_Asset_Value_[MOB_ANDROID]
    #C71112

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-account-name" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "nlb_funds_account_detailed_name" is in view
    And Click on element by text from excel "<rowindex>" columnName "nlb_funds_account_detailed_name"
    And Wait for element by id "nlb-cta-button" to appear
    And Click on element by text "Details"
    And Wait for element by id "nlb-asset-unit-value" to appear
    And Swipe vertical

    Then Assert element by text "Movement of net asset value"
    And Assert element by text "For more information on movement of net asset values per subfund unit see NLB Skladi Tečajnica"
    And Assert element by id "nlb-button-text" that has descendant text "Go to NLB Skladi Tečajnica"
    And Click on element by text "Go to NLB Skladi Tečajnica"
    And Assert element by text "nlbskladi.si/tecajnica"
    And Go Back

    Examples:
      | rowindex |
      |        1 |


  @NLB_FUNDS_ACCOUNTS-TRANSACTIONS-FILTER_BY_DATE-(custom_date_range)_[MOB_ANDROID]
  Scenario Outline: NLB_FUNDS_ACCOUNTS-TRANSACTIONS-FILTER_BY_DATE-(custom_date_range)_[MOB_ANDROID]
  C70906

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear
    And Click on Product from Excel "<rowindex>" columnName "funds_account_subtitle" in My Products

    #And Wait for first transaction to load
    And Assert Product page for product with name from Excel "<rowindex>" columnName "funds_account_name"
    And Assert element with class "android.widget.TextView" and has text "Transactions" is displayed
    And Assert list of element by id "nlb-item-row" is displayed
    And Assert Transaction filter button in Product
    And Click Transaction filter button in Product
    And Wait first Transaction filter

    And Assert screen header is "Transaction filter"
    And Assert back button in screen "Transaction filter"
    And Assert Date transaction filter is displayed correctly
    And Assert "Apply" button is not enabled

    And Click on element by text "Date"
    And Wait for element by id "nlb-radio-button-LAST_7_DAYS" to appear
    And Assert screen header is "Date"
    And Assert back button in screen "Date"
    And Assert element "nlb-radio-button-LAST_7_DAYS" by id
    And Assert element "nlb-radio-button-THIS_MONTH" by id
    And Assert element "nlb-radio-button-LAST_MONTH" by id
    And Assert element "nlb-radio-button-CUSTOM_DATE_RANGE" by id
    And Assert element "nlb-input-date-from-click-area" by id
    And Assert element "nlb-input-date-to-click-area" by id
    And Assert From label in Date transactions filter
    And Assert To label in Date transactions filter
    And Assert From field is correctly displayed in Date transactions filter
    And Assert To field is correctly displayed in Date transactions filter
    And Assert Type transaction filter that is currently selected is one with id "nlb-radio-button-LAST_7_DAYS"
    And Assert "Apply" button primary is enabled
    #custom date range
    And Assert From field in Date transactions filter has today date
    And Assert To field in Date transactions filter has today date
    #from

    When Click on element by id "nlb-input-date-from-click-area"
    #         preset day before yesterday
    #And Click on day before yesterday date in Calendar and assert that it is shown correctly
    And Click on date in Calendar with year 2021 month 12 day 1 and assert that it is shown correctly
    And Assert button Cancel in Calendar is enabled
    And Assert button Confirm in Calendar is enabled
    And Click on button Confirm in Calendar
    And Assert From field in Date transactions filter has date year 2021 month 12 day 1
    #And Assert From field in Date transactions filter has day before yesterday date

    #to
    #         preset yesterday
    And Click on element by id "nlb-input-date-to-click-area"
    #And Click on yesterday date in Calendar and assert that it is shown correctly
    And Click on date in Calendar with year 2022 month 1 day 15 and assert that it is shown correctly
    And Assert button Cancel in Calendar is enabled
    And Assert button Confirm in Calendar is enabled
    And Click on button Confirm in Calendar
    #And Assert To field in Date transactions filter has yesterday date
    And Assert To field in Date transactions filter has date year 2022 month 1 day 15
    And Assert "Apply" button primary is enabled
    And Click on element by id "nlb-button-primary"
    And Wait first Transaction filter
    #And Assert subtitle of Transaction filter Date is correct for day before yesterday to yesterday
    And Assert subtitle of Transaction filter Date is correct for dates year 2021 month 12 day 1 and year 2022 month 1 day 15
    And Assert "Apply" button primary is enabled
    And Assert "Clear filters" button alternate is enabled
    And Click on element by id "nlb-button-primary"
    And Wait for first transaction to load after filter

    #Then Assert transactions dates are from day before yesterday to yesterday
    Then Assert transactions dates are between dates year 2021 month 12 day 1 and year 2022 month 1 day 15

    Examples:
      | rowindex |
      | 3        |


  @NLB_FUNDS_ACCOUNTS-TRANSACTIONS-FILTER_BY_DATE-(custom_date_range)-invalid_[MOB_ANDROID]
  Scenario Outline: NLB_FUNDS_ACCOUNTS-TRANSACTIONS-FILTER_BY_DATE-(custom_date_range)-invalid_[MOB_ANDROID]
  C70906

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "My Products"
    And Wait for element by id "nlb-button-edit-products" to appear
    And Click on Product from Excel "<rowindex>" columnName "funds_account_subtitle" in My Products

    #And Wait for first transaction to load
    And Assert Product page for product with name from Excel "<rowindex>" columnName "funds_account_name"
    And Assert element with class "android.widget.TextView" and has text "Transactions" is displayed
    And Assert list of element by id "nlb-item-row" is displayed
    And Assert Transaction filter button in Product
    And Click Transaction filter button in Product
    And Wait first Transaction filter

    And Assert screen header is "Transaction filter"
    And Assert back button in screen "Transaction filter"
    And Assert Date transaction filter is displayed correctly
    And Assert Categories transaction filter is displayed correctly
    And Assert Type transaction filter is displayed correctly
    And Assert Amount transaction filter is displayed correctly
    And Assert Tags transaction filter is displayed correctly
    And Assert "Apply" button is not enabled

    And Click on element by text "Date"
    And Wait for element by id "nlb-radio-button-LAST_7_DAYS" to appear
    And Assert screen header is "Date"
    And Assert back button in screen "Date"
    And Assert element "nlb-radio-button-LAST_7_DAYS" by id
    And Assert element "nlb-radio-button-THIS_MONTH" by id
    And Assert element "nlb-radio-button-LAST_MONTH" by id
    And Assert element "nlb-radio-button-CUSTOM_DATE_RANGE" by id
    And Assert element "nlb-input-date-from-click-area" by id
    And Assert element "nlb-input-date-to-click-area" by id
    And Assert From label in Date transactions filter
    And Assert To label in Date transactions filter
    And Assert From field is correctly displayed in Date transactions filter
    And Assert To field is correctly displayed in Date transactions filter
    And Assert Type transaction filter that is currently selected is one with id "nlb-radio-button-LAST_7_DAYS"
    And Assert "Apply" button primary is enabled
    And Assert From field in Date transactions filter has today date
    And Assert To field in Date transactions filter has today date

    #set To one month before, 5th
    When Click on element by id "nlb-input-date-to-click-area"
    And Click on date last month fifth and assert that it is shown correctly
    And Assert button Cancel in Calendar is enabled
    And Assert button Confirm in Calendar is enabled
    And Click on button Confirm in Calendar
    And Assert To field in Date transactions filter has date last month fifth
    And Assert "Apply" button primary is disabled

    #try to set From to one month before, 10th
    And Click on element by id "nlb-input-date-from-click-area"

    Then Click on date last month tenth and assert that it is not shown correctly
    And Assert button Cancel in Calendar is enabled
    And Assert button Confirm in Calendar is enabled
    And Click on button Confirm in Calendar
    And Assert From field in Date transactions filter has today date
    And Assert To field in Date transactions filter has date last month fifth
    #BUG, ne radi trenutno
    And Assert "Apply" button primary is disabled


    Examples:
      | rowindex |
      | 3        |

  @NLB_Funds_Accounts-Transactions-List_[MOB_ANDROID]
  Scenario Outline: NLB_Funds_Accounts-Transactions-List_[MOB_ANDROID]
    #C71092
    #BUG Amount for each month doesn't exist

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "nlb_funds_account_detailed_name" is in view
    And Click on element by text from excel "<rowindex>" columnName "nlb_funds_account_detailed_name"
    And Wait for element by id "nlb-product-details-primary-balance" to appear

    Then Assert element by text "Current balance"
    And Assert element by id "nlb-product-details-primary-balance" with regex "^(?:(?:0|[1-9]\d{0,2})(?:.\d{3})*),\d{2} EUR$"
    And Assert element by text "Number of asset units"
    And Assert element by id "nlb-product-details-secondary-balance" with regex "^\d+,\d{6}$"
    And Assert element by text "Details"
    And Assert element by text "Savings and payments"
    And Assert element by text "Transactions"
    And Click on date filter for NLB Funds
    And Wait for element by id "nlb-settings-menu" to appear
    And Assert element by text "Date"
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-title" to appear
    And Assert text "100,00 EUR" in element id "nlb-transaction-header-sum"
    And Assert element by text "February"
    And Assert list of element by id "nlb-date" is displayed
    And Assert list of element by id "nlb-currency" is displayed
    And Assert list of element by id "nlb-title" is displayed
    And Assert list of element by id "nlb-amount" is displayed
    And Assert list of element by id "nlb-details" is displayed

    Examples:
      | rowindex |
      | 5        |

  @NLB_Funds_Accounts-Transactions-Details_[MOB_ANDROID]
  Scenario Outline: NLB_Funds_Accounts-Transactions-Details_[MOB_ANDROID]
    #C71108
    #Postoji dugme Get receipt a ne bi trebalo
    #Postoji dugme Send complaint a ne bi trebalo
    #Postoji polje Name u detaljima transakcije a ne bi trebalo
    #Amount za svaki mesec ne broji kako treba. Zakucan je na 0,0


    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My Products" content description from view tag "View"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "nlb_funds_account_detailed_name" is in view
    And Click on element by text from excel "<rowindex>" columnName "nlb_funds_account_detailed_name"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Click on element by text "Vplačilo v podsklad"
    #And Wait for element by text "Confirmation"

    Then Assert element by text "Transaction details"
    And Assert text "4. 2. 2025" in element id "nlb-date"
    And Assert text "Vplačilo v podsklad" in element id "nlb-title"
    And Assert text "NLB Skladi - Azija delniški" in element id "nlb-details"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert text "100,00" in element id "nlb-amount"
    And Assert element by text "Confirmation" is not displayed
    And Assert element by text "Send message" is not displayed
    And Assert element by text "Name" is not displayed
    And Assert element by text "Transaction cost" has first following sibling "1,96 EUR"
    And Assert element by text "Net value" has first following sibling "98,04 EUR"
    And Assert element by text "Asset unit value" has first following sibling "19,5796 EUR"
    And Assert element by text "No. of asset units" has first following sibling "5,007252"
    And Assert element by text "Transaction ID" has first following sibling "TX-EXT-IF$ASlSozAe-qEmhSqo_z13L3Dvp-vbF5-2_F_9pXJ2eQtyW80M_glnOwc7CQiYVlbn1VhrKWI"


    Examples:
      | rowindex |
      | 5        |