Feature: Payments_Archive

  @PAYMENTS-PAYMENTS_ARCHIVE-FILTER_PAYMENTS_BY_DATE_[ANDROID]
  Scenario Outline: PAYMENTS-PAYMENTS_ARCHIVE-FILTER_PAYMENTS_BY_DATE_[ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "Pay"
    And Wait for Past payments button in Pay screen
    And Click on Review and edit button "Past payments" in Pay screen
    And Wait for first Past payment

    When Click on payment filter
    And Wait element "Date" by text
    And Assert screen header is "Advanced filters"
    And Assert back button in screen "Advanced filters"
    And Assert Past payment filter options are displayed correctly
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

    #7 days
    And Click on element by id "nlb-button-primary"
    And Click on element by id "nlb-button-primary"
#    And Wait first Transaction filter
#
#    And Assert subtitle of Transaction filter Date is correct for Last seven days
#    And Assert "Apply" button primary is enabled
#    And Assert "Clear filters" button alternate is enabled
#    And Click on element by id "nlb-button-primary"
#
#    And Wait for first Past payment
    #Then Assert transactions dates are from last seven days

    #last month
    And Wait for element by id "nlb-icon-button" to appear
    When Click on payment filter
    And Wait element "Date" by text
    And Assert subtitle of Transaction filter Date is correct for Last seven days
    And Click on element by text "Date"
    And Wait for element by id "nlb-radio-button-LAST_7_DAYS" to appear
    And Assert Type transaction filter that is currently selected is one with id "nlb-radio-button-LAST_7_DAYS"
    And Click on element by id "nlb-radio-button-LAST_MONTH"
    And Assert Type transaction filter that is currently selected is one with id "nlb-radio-button-LAST_MONTH"
    And Assert "Apply" button primary is enabled
    And Click on element by id "nlb-button-primary"
    And Wait first Transaction filter
    And Assert subtitle of Transaction filter date is correct for Last month
    And Assert "Apply" button primary is enabled
    And Assert "Clear filters" button alternate is enabled
    And Click on element by id "nlb-button-primary"

    And Wait for first Past payment
    Then Assert transactions dates are from Last month

    #this month

#    When Click on payment filter
#    And Wait element "Status" by text
#    And Assert subtitle of Transaction filter date is correct for Last month
#    And Click on element by text "Date"
#    And Wait for element by id "nlb-radio-button-LAST_MONTH" to appear
#    And Assert Type transaction filter that is currently selected is one with id "nlb-radio-button-LAST_MONTH"
#    And Click on element by id "nlb-radio-button-THIS_MONTH"
#    And Assert Type transaction filter that is currently selected is one with id "nlb-radio-button-THIS_MONTH"
#    And Assert "Apply" button primary is enabled
#    And Click on element by id "nlb-button-primary"
#    And Wait first Transaction filter
#    And Assert subtitle of Transaction filter Date is correct for This month
#    And Assert "Apply" button primary is enabled
#    And Assert "Clear filters" button alternate is enabled
#    And Click on element by id "nlb-button-primary"
#    And Wait "5" seconds
    #Trenutno nema transakcija
    #And Wait for first Past payment
    #Then Assert transactions dates are from This month

    #custom range
    When Click on payment filter
    And Wait element "Date" by text
#    And Assert subtitle of Transaction filter Date is correct for This month
    And Assert "Clear filters" button alternate is enabled
    And Click on "Clear filters" button alternate
    And Assert Past payment filter options are displayed correctly
    And Click on element by text "Date"
    And Wait for element by id "nlb-radio-button-LAST_7_DAYS" to appear

    #from
    And Click on element by id "nlb-input-date-from-click-area"
    And Click on date in Calendar with year 2026 month 1 day 9 and assert that it is shown correctly
    And Assert button Cancel in Calendar is enabled
#    And Assert button Apply in Calendar is enabled
#    And Click on button Apply in Calendar
    And Click on element by text "Add filter"
    And Assert From field in Date transactions filter has date year 2026 month 1 day 9

    #to
    And Click on element by id "nlb-input-date-to-click-area"
    And Click on date in Calendar with year 2026 month 1 day 13 and assert that it is shown correctly
    And Assert button Cancel in Calendar is enabled
#    And Assert button Apply in Calendar is enabled
#    And Click on button Apply in Calendar
    And Click on element by text "Add filter"
    And Assert To field in Date transactions filter has date year 2026 month 1 day 13
    And Assert "Apply" button primary is enabled
    And Click on element by id "nlb-button-primary"
    And Wait first Transaction filter
    And Assert subtitle of Transaction filter Date is correct for dates year 2026 month 1 day 9 and year 2026 month 1 day 13
    And Assert "Apply" button primary is enabled
    And Assert "Clear filters" button alternate is enabled
    And Click on element by id "nlb-button-primary"
    And Wait for first Past payment

    Then Assert transactions dates are between dates year 2026 month 1 day 9 and year 2026 month 1 day 13

    Examples:
      | rowindex |
      |        1 |


  @PAYMENTS-PAYMENTS_ARCHIVE-FILTER_PAYMENTS_BY_DATE-invalid_[ANDROID]
  Scenario Outline: PAYMENTS-PAYMENTS_ARCHIVE-FILTER_PAYMENTS_BY_DATE-invalid_[ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "Pay"
    And Wait for Past payments button in Pay screen
    And Click on Review and edit button "Past payments" in Pay screen
    And Wait for first Past payment

    When Click on payment filter
    And Wait element "Date" by text
    And Assert screen header is "Advanced filters"
    And Assert back button in screen "Advanced filters"
    And Assert Past payment filter options are displayed correctly
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

    #izaberi peti dan proslog meseca
    Then Click on element by id "nlb-input-date-to-click-area"
    And Click on date last month fifth and assert that it is shown correctly
    And Assert button Cancel in Calendar is enabled
#    And Assert button Apply in Calendar is enabled
#    And Click on button Apply in Calendar
    And Click on element by text "Add filter"
    And Assert To field in Date transactions filter has date last month fifth
    And Assert "Apply" button primary is disabled

    #try to set From to one month before, 10th
    And Click on element by id "nlb-input-date-from-click-area"

    Then Click on date last month tenth and assert that it is not shown correctly
    And Assert button Cancel in Calendar is enabled
#    And Assert button Apply in Calendar is enabled
#    And Click on button Apply in Calendar
    And Click on element by text "Add filter"
    And Assert To field in Date transactions filter has date last month fifth
    And Assert "Apply" button primary is disabled

    Examples:
      | rowindex |
      |        1 |


  @PAYMENTS-PAYMENTS_ARCHIVE-FILTER_PAYMENTS_BY_AMOUNT_[ANDROID]
  Scenario Outline: PAYMENTS-PAYMENTS_ARCHIVE-FILTER_PAYMENTS_BY_AMOUNT_[ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "Pay"
    And Wait for Past payments button in Pay screen
    And Click on Review and edit button "Past payments" in Pay screen
    And Wait for first Past payment

    When Click on payment filter
    And Wait element "Amount range" by text
    And Assert screen header is "Advanced filters"
    And Assert back button in screen "Advanced filters"
    And Assert Past payment filter options are displayed correctly
    And Assert "Apply" button is not enabled
    And Click on element by text "Amount range"

    And Wait for element by id "nlb-button-primary" to appear
    And Assert screen header is "Set amount"
    And Assert back button in screen "Set amount"
    And Assert From label in Set amount filter
    And Assert To label in Set amount filter
    And Assert currencies in From and To input field is RSD
    And Assert "Apply" button primary is disabled

    #from
    And Enter text "50" in From label in Set amount filter
    And Assert element "nlb-button-primary" by id is enabled
    #to
    And Enter text "200" in To label in Set amount filter
    And Assert element "nlb-button-primary" by id is enabled

    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Apply"
    And Assert subtitle of Transaction filter Amount range is "50,00 - 200,00"
    And Assert element "nlb-button-alternate" by id is enabled
    And Assert element "nlb-button-primary" by id is enabled
    And Click on element by id "nlb-button-primary"

    Then Assert transactions amounts are between from "50,00" to "200,00" and currency is "RSD"
    And Click on element by id "nlb-icon-button"
    And Assert element "nlb-button-alternate" by id is enabled
    And Assert element "nlb-button-primary" by id is enabled
    And Click on element by id "nlb-button-alternate"
    And Assert Past payment filter options are displayed correctly

    Examples:
      | rowindex |
      |        1 |


  @PAYMENTS-PAYMENTS_ARCHIVE-FILTER_PAYMENTS_BY_AMOUNT-invalid_[ANDROID]
  Scenario Outline: PAYMENTS-PAYMENTS_ARCHIVE-FILTER_PAYMENTS_BY_AMOUNT-invalid_[ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "Pay"
    And Wait for Past payments button in Pay screen
    And Click on Review and edit button "Past payments" in Pay screen
    And Wait for first Past payment

    When Click on payment filter
    And Wait element "Amount range" by text
    And Assert screen header is "Advanced filters"
    And Assert back button in screen "Advanced filters"
    And Assert Past payment filter options are displayed correctly
    And Assert "Apply" button is not enabled
    And Click on element by text "Amount range"

    And Wait for element by id "nlb-button-primary" to appear
    And Assert screen header is "Set amount"
    And Assert back button in screen "Set amount"
    And Assert From label in Set amount filter
    And Assert To label in Set amount filter
    And Assert "Apply" button primary is disabled

    #from
    Then Enter text "250" in From label in Set amount filter
    And Assert element "nlb-button-primary" by id is enabled
    #to
    And Enter text "200" in To label in Set amount filter
    And Assert element "nlb-button-primary" by id is disabled
#    And Assert element by text "From amount must be less than To amount."
    And Click on element by desc "Back"
    And Assert Past payment filter options are displayed correctly
    
    Examples:
      | rowindex |
      |        1 |


  @PAYMENTS-PAYMENTS_ARCHIVE-FILTER_PAYMENTS_BY_STATUS_[ANDROID]
  Scenario Outline: PAYMENTS-PAYMENTS_ARCHIVE-FILTER_PAYMENTS_BY_STATUS_[ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "Pay"
    And Wait for Past payments button in Pay screen
    And Click on Review and edit button "Past payments" in Pay screen
    And Wait for first Past payment

    When Click on payment filter
    And Wait element "Amount range" by text
    And Assert screen header is "Advanced filters"
    And Assert back button in screen "Advanced filters"
    And Assert Past payment filter options are displayed correctly
    And Assert "Apply" button is not enabled
    And Click on element by text "Payment status"

    And Wait for element by id "nlb-button-primary" to appear
    And Assert screen header is "Status"
    And Assert back button in screen "Status"
    And Assert "Apply" button primary is enabled

    And Assert element "nlb-checkbox-tag-Executed" by id
    And Assert element "nlb-checkbox-tag-Rejected" by id
    And Assert element "nlb-checkbox-tag-Canceled" by id

    #executed
    And Click on element by id "nlb-checkbox-tag-Executed"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Apply"
    And Assert subtitle of Transaction filter Payment status is "Executed"
    And Click on element by id "nlb-button-primary"
    And Assert transactions status in Past payment is in status "Executed"
    
    And Click on element by id "nlb-icon-button"
    And Assert subtitle of Transaction filter Payment status is "Executed"
    And Assert "Apply" button primary is enabled
    And Click on element by text "Payment status"
    And Wait for element by id "nlb-button-primary" to appear
    And Assert screen header is "Status"
    And Assert back button in screen "Status"
    And Assert "Apply" button primary is enabled

    #rejected
    And Click on element by id "nlb-checkbox-tag-Executed"
    And Click on element by id "nlb-checkbox-tag-Rejected"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Apply"
    And Assert subtitle of Transaction filter Payment status is "Rejected"
    And Click on element by id "nlb-button-primary"
    And Assert transactions status in Past payment is in status "Rejected"

    And Click on element by id "nlb-icon-button"
    And Assert subtitle of Transaction filter Payment status is "Rejected"
    And Assert "Apply" button primary is enabled
    And Click on element by text "Payment status"
    And Wait for element by id "nlb-button-primary" to appear
    And Assert screen header is "Status"
    And Assert back button in screen "Status"
    And Assert "Apply" button primary is enabled

    #canceled
    And Click on element by id "nlb-checkbox-tag-Rejected"
    And Click on element by id "nlb-checkbox-tag-Canceled"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Apply"
    And Wait "2" seconds
    And Assert subtitle of Transaction filter Payment status is "Canceled"
    And Click on element by id "nlb-button-primary"
    And Assert transactions status in Past payment is in status "Canceled"

    #executed and rejected
    And Click on element by id "nlb-icon-button"
    And Assert element "nlb-button-alternate" by id is enabled
    And Assert element "nlb-button-primary" by id is enabled
    And Click on element by id "nlb-button-alternate"
    And Click on element by text "Payment status"
    And Click on element by id "nlb-checkbox-tag-Executed"
    And Click on element by id "nlb-checkbox-tag-Rejected"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Apply"
    And Assert subtitle of Transaction filter Payment status is "Executed, Rejected"
    And Click on element by id "nlb-button-primary"
    And Assert transactions statuses in Past payment are only "Executed" or "Rejected"

    #canceled and rejected
    And Click on element by id "nlb-icon-button"
    And Assert element "nlb-button-alternate" by id is enabled
    And Assert element "nlb-button-primary" by id is enabled
    And Click on element by id "nlb-button-alternate"
    And Click on element by text "Payment status"
    And Click on element by id "nlb-checkbox-tag-Canceled"
    And Click on element by id "nlb-checkbox-tag-Rejected"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Apply"
    And Assert subtitle of Transaction filter Payment status is "Rejected, Canceled"
    And Click on element by id "nlb-button-primary"
    And Assert transactions statuses in Past payment are only "Canceled" or "Rejected"

    Examples:
      | rowindex |
      |        1 |


  @PAYMENTS-PAYMENTS_ARCHIVE-CREATE_CONFIRMATION_[ANDROID]
  Scenario Outline: PAYMENTS-PAYMENTS_ARCHIVE-CREATE_CONFIRMATION_[ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "Pay"
    And Wait for Past payments button in Pay screen
    And Click on Review and edit button "Past payments" in Pay screen
    And Wait for first Past payment

    When Scroll until element with content-desc "Executed" is in view
    And Click on first "Executed" past payment
    And Wait for element by text "Confirmation"
    And Click on element by text "Confirmation"

    Then Assert element by complete id "com.google.android.apps.docs:id/zoomed_view"
    And Go Back

    Examples:
      | rowindex |
      |        1 |


  @Payments_Payments_Archive_Payments_Transaction_List_[ANDROID]
  Scenario Outline: Payments_Payments_Archive_Payments_Transaction_List_[ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "Pay"
    And Wait for Past payments button in Pay screen

    When Click on Review and edit button "Past payments" in Pay screen
    And Wait for first Past payment

    Then Assert list of element by id "nlb-date" is displayed
    And Assert list of element by id "nlb-currency" is displayed
    And Assert list of element by id "nlb-title" is displayed
    And Assert list of element by id "nlb-amount" is displayed
    And Assert list of element by id "nlb-details" is displayed

    Examples:
      | rowindex |
      |        1 |