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
#    And Click on element by id "nlb-button-primary"
    And Wait first Transaction filter

    And Assert subtitle of Transaction filter Date is correct for Last seven days
    And Assert "Apply" button primary is enabled
    And Assert "Clear filters" button alternate is enabled
    And Click on element by id "nlb-button-primary"

    And Wait for first Past payment
    And Assert transactions dates are from last seven days

    #last month
#    And Wait for element by id "nlb-icon-button" to appear
#    And Click on payment filter
#    And Wait element "Date" by text
#    And Assert subtitle of Transaction filter Date is correct for Last seven days
#    And Click on element by text "Date"
#    And Wait for element by id "nlb-radio-button-LAST_7_DAYS" to appear
#    And Assert Type transaction filter that is currently selected is one with id "nlb-radio-button-LAST_7_DAYS"
#    And Click on element by id "nlb-radio-button-LAST_MONTH"
#    And Assert Type transaction filter that is currently selected is one with id "nlb-radio-button-LAST_MONTH"
#    And Assert "Apply" button primary is enabled
#    And Click on element by id "nlb-button-primary"
#    And Wait first Transaction filter
#    And Assert subtitle of Transaction filter date is correct for Last month
#    And Assert "Apply" button primary is enabled
#    And Assert "Clear filters" button alternate is enabled
#    And Click on element by id "nlb-button-primary"
#
#    And Wait for first Past payment
#    And Assert transactions dates are from Last month
#
#    #this month
#    Then Click on payment filter
#    And Wait element "Payment status" by text
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
#    #Trenutno nema transakcija
#    And Wait for first Past payment
#    And Assert transactions dates are from This month

    #custom range
    And Click on payment filter
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
    And Assert button Confirm in Calendar is enabled
    And Click on button Confirm in Calendar
#    And Click on element by text "Add filter"
    And Assert From field in Date transactions filter has date year 2026 month 1 day 9

    #to
    And Click on element by id "nlb-input-date-to-click-area"
    And Click on date in Calendar with year 2026 month 4 day 13 and assert that it is shown correctly
    And Assert button Cancel in Calendar is enabled
    And Assert button Confirm in Calendar is enabled
    And Click on button Confirm in Calendar
#    And Click on element by text "Add filter"
    And Assert To field in Date transactions filter has date year 2026 month 4 day 13
    And Assert "Apply" button primary is enabled
    And Click on element by id "nlb-button-primary"
    And Wait first Transaction filter
    And Assert subtitle of Transaction filter Date is correct for dates year 2026 month 1 day 9 and year 2026 month 4 day 13
    And Assert "Apply" button primary is enabled
    And Assert "Clear filters" button alternate is enabled
    And Click on element by id "nlb-button-primary"
    And Wait for first Past payment

    And Assert transactions dates are between dates year 2026 month 1 day 9 and year 2026 month 4 day 13

    Examples:
      | rowindex |
      |        4 |


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
#    And Assert button Confirm in Calendar is enabled
#    And Click on button Confirm in Calendar
#    And Click on element by text "Add filter"
    And Click on button Confirm in Calendar
    And Assert To field in Date transactions filter has date last month fifth
    And Assert "Apply" button primary is disabled

    #try to set From to one month before, 10th
    And Click on element by id "nlb-input-date-from-click-area"

#    Then Click on date last month tenth and assert that it is not shown correctly
#    And Assert button Cancel in Calendar is enabled
##    And Assert button Confirm in Calendar is enabled
##    And Click on button Confirm in Calendar
#    And Click on element by text "Add filter"
#    And Click on button Confirm in Calendar
#    And Assert To field in Date transactions filter has date last month fifth
#    And Assert "Apply" button primary is disabled

    And Assert tenth day of previous month is disabled

    Examples:
      | rowindex |
      |        4 |


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
    And Wait element "Amount" by text
    And Assert screen header is "Advanced filters"
    And Assert back button in screen "Advanced filters"
    And Assert Past payment filter options are displayed correctly
    And Assert "Apply" button is not enabled
    And Click on element by text "Amount"

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

    Then Wait for first Past payment
    And Assert transactions amounts are between from "50,00" to "200,00" and currency is "RSD"
    And Click on element by id "nlb-icon-button"
    And Assert element "nlb-button-alternate" by id is enabled
    And Assert element "nlb-button-primary" by id is enabled
    And Click on element by id "nlb-button-alternate"
    And Assert Past payment filter options are displayed correctly

    Examples:
      | rowindex |
      |        4 |


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
    And Wait element "Amount" by text
    And Assert screen header is "Advanced filters"
    And Assert back button in screen "Advanced filters"
    And Assert Past payment filter options are displayed correctly
    And Assert "Apply" button is not enabled
    And Click on element by text "Amount"

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
      |        4 |


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
    And Wait element "Amount" by text
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
    And Wait "2" seconds
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
    And Wait "2" seconds
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
    And Wait "2" seconds
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
    And Wait "2" seconds
    And Assert subtitle of Transaction filter Payment status is "Rejected, Canceled"
    And Click on element by id "nlb-button-primary"
    And Wait "3" seconds
    And Assert transactions statuses in Past payment are only "Canceled" or "Rejected"

    Examples:
      | rowindex |
      |        4 |


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
    And Wait for element by text "Payment confirmation"
    And Click on element by text "Payment confirmation"

    Then Assert element by complete id "com.google.android.apps.docs:id/zoomed_view"
    And Go Back

    Examples:
      | rowindex |
      |        4 |


  @Payments_Payments_Archive_Payments_Transaction_List_[ANDROID]
  Scenario Outline: Payments_Payments_Archive_Payments_Transaction_List_[ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on Bottom navigation button "Pay"
    And Wait for Past payments button in Pay screen

    When Click on Review and edit button "Past payments" in Pay screen
    And Wait for first Past payment
    And Assert list of element by id element by id "nlb-date" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert list of element by id element by id "nlb-currency" with regex "^RSD$"
    And Assert list of element by id element by id "nlb-title" with regex "^.+$"
    And Assert list of element by id element by id "nlb-amount" with regex "^(?:0|[1-9]\d{0,2})(?:\.\d{3})*,\d{2}$"
    And Assert list of element by id "nlb-details" is displayed
    And Assert list of element by id element by id "nlb-details" with regex "^.+$"

    Then Swipe vertical
    And Assert list of element by id element by id "nlb-date" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert list of element by id element by id "nlb-currency" with regex "^RSD$"
    And Assert list of element by id element by id "nlb-title" with regex "^.+$"
    And Assert list of element by id element by id "nlb-amount" with regex "^(?:0|[1-9]\d{0,2})(?:\.\d{3})*,\d{2}$"
    And Assert list of element by id "nlb-details" is displayed

    Examples:
      | rowindex |
      |        4 |


  @PAYMENTS-PAYMENTS_ARCHIVE-PAYMENTS_LIST_[ANDROID]
  Scenario Outline: PAYMENTS-PAYMENTS_ARCHIVE-PAYMENTS_LIST_[ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load

    When Click on Bottom navigation button "Pay"
    And Wait for Past payments button in Pay screen
    And Click on Review and edit button "Past payments" in Pay screen
    And Wait for first Past payment

    And Assert list of element by id element by id "nlb-date" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert list of element by id element by id "nlb-currency" with regex "^[A-Z]{3}$"
    And Assert list of element by id element by id "nlb-amount" with regex "^[\-−]?(?:0|[1-9]\d{0,2}(?:\.\d{3})*),\d{2}$"
    And Assert list of element by id element by id "nlb-title" with regex "^.*$"
    And Assert list of element by id element by id "nlb-details" with regex "^.*$"

    And Swipe vertical
    And Assert list of element by id element by id "nlb-date" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert list of element by id element by id "nlb-currency" with regex "^[A-Z]{3}$"
    And Assert list of element by id element by id "nlb-title" with regex "^.+$"
    And Assert list of element by id element by id "nlb-amount" with regex "^(?:0|[1-9]\d{0,2})(?:\.\d{3})*,\d{2}$"
    And Assert list of element by id "nlb-details" is displayed

    And Swipe vertical up
    And Swipe vertical up
    And Click on Account selector in Payment list
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for first Past payment
    And Assert list of element by id element by id "nlb-date" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert list of element by id element by id "nlb-currency" with regex "^[A-Z]{3}$"
    And Assert list of element by id element by id "nlb-amount" with regex "^[\-−]?(?:0|[1-9]\d{0,2}(?:\.\d{3})*),\d{2}$"
    And Assert list of element by id element by id "nlb-title" with regex "^.*$"
    And Assert list of element by id element by id "nlb-details" with regex "^.*$"

    And Swipe vertical
    And Assert list of element by id element by id "nlb-date" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert list of element by id element by id "nlb-currency" with regex "^[A-Z]{3}$"
    And Assert list of element by id element by id "nlb-title" with regex "^.+$"
    And Assert list of element by id element by id "nlb-amount" with regex "^(?:0|[1-9]\d{0,2})(?:\.\d{3})*,\d{2}$"
    And Assert list of element by id "nlb-details" is displayed

    And Swipe vertical up
    And Swipe vertical up
    And Click on Account selector in Payment list
    And Scroll until element with text from excel "<rowindex>" columnName "auth_personal_account_number" is in view
    And Click on element by text from excel "<rowindex>" columnName "auth_personal_account_number"
    And Wait for first Past payment
    And Assert list of element by id element by id "nlb-date" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert list of element by id element by id "nlb-currency" with regex "^[A-Z]{3}$"
    And Assert list of element by id element by id "nlb-amount" with regex "^[\-−]?(?:0|[1-9]\d{0,2}(?:\.\d{3})*),\d{2}$"
    And Assert list of element by id element by id "nlb-title" with regex "^.*$"
    And Assert list of element by id element by id "nlb-details" with regex "^.*$"

    And Swipe vertical
    And Assert list of element by id element by id "nlb-date" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert list of element by id element by id "nlb-currency" with regex "^[A-Z]{3}$"
    And Assert list of element by id element by id "nlb-title" with regex "^.+$"
    And Assert list of element by id element by id "nlb-amount" with regex "^(?:0|[1-9]\d{0,2})(?:\.\d{3})*,\d{2}$"
    And Assert list of element by id "nlb-details" is displayed

    Then Swipe vertical up
    And Swipe vertical up
    And Click on Account selector in Payment list
    And Scroll until element with text from excel "<rowindex>" columnName "saving_account_number" is in view
    And Click on element by text from excel "<rowindex>" columnName "saving_account_number"
    And Wait for element by contains text "No past payments"
    And Assert element by contains text "No past payments"
#    And Wait for first Past payment
#    And Assert list of element by id element by id "nlb-date" with regex "^\d{2}\.\d{2}\.\d{4}$"
#    And Assert list of element by id element by id "nlb-currency" with regex "^[A-Z]{3}$"
#    And Assert list of element by id element by id "nlb-amount" with regex "^[\-−]?(?:0|[1-9]\d{0,2}(?:\.\d{3})*),\d{2}$"
#    And Assert list of element by id element by id "nlb-title" with regex "^.*$"
#    And Assert list of element by id element by id "nlb-details" with regex "^.*$"
#
#    And Swipe vertical
#    And Assert list of element by id element by id "nlb-date" with regex "^\d{2}\.\d{2}\.\d{4}$"
#    And Assert list of element by id element by id "nlb-currency" with regex "^[A-Z]{3}$"
#    And Assert list of element by id element by id "nlb-title" with regex "^.+$"
#    And Assert list of element by id element by id "nlb-amount" with regex "^(?:0|[1-9]\d{0,2})(?:\.\d{3})*,\d{2}$"
#    And Assert list of element by id "nlb-details" is displayed

    And Click on Account selector in Payment list
    And Scroll until element with text from excel "<rowindex>" columnName "saving_account_number" is in view
    And Click on element by text from excel "<rowindex>" columnName "saving_account_number"
    And Wait for element by contains text "No past payments"
    And Assert element by contains text "No past payments"
#    And Wait for first Past payment
#    And Assert list of element by id element by id "nlb-date" with regex "^\d{2}\.\d{2}\.\d{4}$"
#    And Assert list of element by id element by id "nlb-currency" with regex "^[A-Z]{3}$"
#    And Assert list of element by id element by id "nlb-amount" with regex "^[\-−]?(?:0|[1-9]\d{0,2}(?:\.\d{3})*),\d{2}$"
#    And Assert list of element by id element by id "nlb-title" with regex "^.*$"
#    And Assert list of element by id element by id "nlb-details" with regex "^.*$"
#
#    And Swipe vertical
#    And Assert list of element by id element by id "nlb-date" with regex "^\d{2}\.\d{2}\.\d{4}$"
#    And Assert list of element by id element by id "nlb-currency" with regex "^[A-Z]{3}$"
#    And Assert list of element by id element by id "nlb-title" with regex "^.+$"
#    And Assert list of element by id element by id "nlb-amount" with regex "^(?:0|[1-9]\d{0,2})(?:\.\d{3})*,\d{2}$"
#    And Assert list of element by id "nlb-details" is displayed

    Examples:
      | rowindex |
      |        5 |


    #PURPOSE labela nije prikazana u past payment detaljima transakcije
    # stabilizovan do -  And Assert element by text "Purpose" has first following sibling with regex "^.+$"
  @PAYMENTS-PAYMENTS_ARCHIVE-PAYMENTS_DETAILS_[ANDROID]
  Scenario Outline: PAYMENTS-PAYMENTS_ARCHIVE-PAYMENTS_DETAILS_[ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load

    When Click on Bottom navigation button "Pay"
    And Wait for Past payments button in Pay screen
    And Click on Review and edit button "Past payments" in Pay screen
    And Wait for first Past payment

    And Click on first "Executed" past payment
    And Wait element "Payment confirmation" by text
    And Assert element by id "nlb-date" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element "nlb-title" by id
    And Assert element "nlb-details" by id
    And Assert element by id "nlb-currency" has text "RSD"
    And Assert element by id "nlb-amount" with regex "^(?:0|[1-9]\d{0,2}(?:\.\d{3})*),\d{2}$"

    And Assert element by text "Recipient name" has first following sibling with regex "^.+$"
    And Assert element by text "Recipient address" has first following sibling with regex "(?s)^.+$"
    And Assert element by text "Recipient account number" has first following sibling with regex "^\d{3}-\d{13}-\d{2}$"
    #And Assert element by text "Urgent payment" has first following sibling with regex "^(Yes|No)$"
    #And Assert element by text "Purpose code" has first following sibling with regex "^\d{3}$"
    And Assert element by text "Purpose" has first following sibling with regex "^.+$"
    And Swipe vertical
    And Assert element by text "Debtor name" has first following sibling from excel "<rowindex>" columnName "account_details_owner"
    And Assert element by text "Debtor account number" has first following sibling from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Assert element by text "Debtor Address" has first following sibling with regex "(?s)^.+$"
    And Assert element by text "Fee" has first following sibling with regex "^\d+,\d{2}[\s\u00A0]*RSD$"
    And Assert element by text "Payment status" has first following sibling contains text "Executed"
    And Assert element by id "nlb-button-primary" that has descendant text "Repeat payment"

    Examples:
      | rowindex |
      |        5 |


  @Payments_Payments_Arhive_Resubmit_Payments_From_Past_Payment_List_[WEB]-Internal_Transfer
  Scenario Outline: Payments_Payments_Arhive_Resubmit_Payments_From_Past_Payment_List_[WEB]-Internal_Transfer

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on element by text "My Products"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "currentDomesticAccountBBAN" is in view
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Remember available balance in currency "RSD" under key "IT_001_Debtor_Balance"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Pay"

    When Click on Bottom navigation button "Pay"
    And Wait for Past payments button in Pay screen
    And Click on Review and edit button "Past payments" in Pay screen
    And Wait for first Past payment
    And Enter text "internal" into EditText element
    And Wait "2" seconds
    And Wait for first transaction to load
    And Click on first Past payment
    And Wait for element by contains text "Recipient name"

    And Remember text from element by id "nlb-amount" under key "keyPaymentAmount"
    And Remember text of first following sibling of element by text "Recipient name" in txt under key "keyRecipientName"
    #And Remember text of first following sibling of element by text "Recipient address" in txt under key "keyRecipientAddress"
    And Remember text of first following sibling of element by text "Recipient account number" in txt under key "keyRecipientAccountNumber"
    And Remember text of first following sibling of element by text "Debtor name" in txt under key "keyDebtorName"
    And Remember text of first following sibling of element by text "Debtor account number" in txt under key "keyDebtorAccountNumber"
    And Swipe vertical
    And Remember text of first following sibling of element by text "Fee" in txt under key "keyFeeWithCurrency"
    And Click on element by contains text "Repeat"
    And Wait for element by contains text "In order to continue"
    
    And Assert element by text "Debtor"
    And Assert element by text from key "keyDebtorAccountNumber" is displayed
    And Assert element by text "Recipient"
    And Assert element by text from key "keyRecipientAccountNumber" is displayed
    And Assert element by id "nlb-amount-with-currency-field" has text that contains value from key "keyPaymentAmount"
    And Assert that text "Purpose" has first following sibling with text "INTERNAL TRANSFER"
    And Assert element by text "Payment date" has first following sibling match regex "\d{2}\.\d{2}\.\d{4}"
    And Swipe vertical
    And Wait "1" seconds
    And Click on element by contains text "Confirm"
    And Wait for element by text "Fee"

    And Assert payment amount in payment review is from key "keyPaymentAmount" and has currency "RSD"
    And Assert element by text "Fee" has first following sibling from key "keyFeeWithCurrency"
    And Assert element by text "Debtor"
    And Assert element by text "Name" with index "1" has first following sibling containing text from key "keyDebtorName"
    And Assert element by text "Account number" with index "1" has first following sibling containing text from key "keyDebtorAccountNumber"
    And Assert element by text "Recipient"
    And Assert element by text "Name" with index "2" has first following sibling containing text from key "keyRecipientName"
    And Assert element by text "Account number" with index "2" has first following sibling containing text from key "keyRecipientAccountNumber"
    
    And Assert that text "Purpose" has first following sibling with text "INTERNAL TRANSFER"
    And Assert element by text "Payment date" has first following sibling match regex "^\d{2}\.\d{2}\.\d{4}$"
    And Swipe vertical
    And Click on element by text "Pay"
    And Wait for element by text "Enter PIN"
    And Enter PIN

    And Wait for element by text "Payment amount"
    And Assert payment amount in payment confirmation is from key "keyPaymentAmount" and currency "RSD"
    And Assert that text "Fee" has first following sibling with text "0,00 RSD"
    And Assert element by text from key "keyRecipientName" is displayed
#    And Assert element by text from key "keyAccountNumber" is displayed
    And Scroll to element by text "Purpose"
#    And Assert element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Assert element by text from excel "<rowindex>" columnName "account_details_owner"
    And Assert element by text "Payment date" has first following sibling match regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert that text "Purpose" has first following sibling with text "INTERNAL TRANSFER"
    And Swipe vertical

    And Assert element by id "nlb-button-alternate" that has descendant text "Reject"
    And Assert element by id "nlb-button-primary" that has descendant text "Pay"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "transactions-web-close-popup-icon" to appear
    And Assert element by text "Confirmation successful"
    And Assert element by contains text "Your payment was successfully accepted"
    And Click on element by id "transactions-web-close-popup-nlb-button"
    
    And Wait for element by contains text "Repeat"
    And Click "Back" content description
    And Wait for element by contains text "Past payments"
    And Click "Back" content description
    And Wait for element by contains text "Payments and transfers"
    And Click on element by text "Past payments"
    And Wait for first Past payment
    And Click on first Past payment
    And Wait for element by contains text "Recipient name"

    And Assert element by id "nlb-date" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by id "nlb-currency" has text "RSD"
    And Assert element by id "nlb-title" has text "INTERNAL TRANSFER"
    And Assert element by id "nlb-details" has text that contains value from key "keyRecipientName"
    And Assert that amount in past or upcoming payment title is from key "keyPaymentAmount"
    And Assert element by text "Recipient name" has first following sibling from key "keyRecipientName"
    #todo address
    And Assert element by text "Recipient account number" has first following sibling from key "keyRecipientAccountNumber"
    And Assert element by text "Debtor name" has first following sibling from key "keyDebtorName"
    And Assert element by text "Debtor account number" has first following sibling from key "keyDebtorAccountNumber"
    And Swipe vertical
    And Assert element by text "Payment date" has first following sibling match regex "^\d{2}\.\d{2}\.\d{4}\r?\n\d{2}:\d{2}:\d{2}$"
    And Assert element by text "Value date" has first following sibling match regex "^\d{2}\.\d{2}\.\d{4}$"
    And Swipe vertical
    And Assert element by text "Fee" has first following sibling from key "keyFeeWithCurrency"
    And Assert that text "Payment status" has first following sibling with text "Executed"
    And Click "Back" content description
    And Wait for element by contains text "Search"
    And Click "Back" content description
    And Wait for element by contains text "My Products"
    And Click on element by contains text "My Products"
    And Wait for first product in My products page
    And Scroll until element with text from excel "<rowindex>" columnName "currentDomesticAccountBBAN" is in view
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Wait for element by id "nlb-product-details-primary-balance" to appear

    And Check if current balance is lowered by amount from key "keyPaymentAmount" using balance from key "IT_001_Debtor_Balance"
    And Wait for first transaction to load

    Then Click on first transaction in product details
    And Wait for element by text "Settlement date"
    And Assert element by text "Transaction details"
    And Assert element by id "nlb-date" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by id "nlb-title" has text "INTERNAL TRANSFER"
    And Assert element by id "nlb-currency" has text "RSD"
    And Assert amount in transaction title is from key "keyPaymentAmount" with minus
    #And Assert that text "Account number" has first following sibling from excel "<rowindex>" columnName ""
    And Assert that text "Purpose" has first following sibling with text "INTERNAL TRANSFER"
    And Assert element by text "Settlement date" has first following sibling match regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by text "Value date" has first following sibling match regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert that amount label in transaction details has value from key "keyPaymentAmount" in currency "RSD"
    And Assert element by text "Transaction ID" has first following sibling match regex "^.{14}$"

    Examples:
      | rowindex |
      |        5 |


  @Payments_Payments_Arhive_Resubmit_Payments_From_Past_Payment_List_[WEB]-Domestic_Payment
  Scenario Outline: Payments_Payments_Arhive_Resubmit_Payments_From_Past_Payment_List_[WEB]-Domestic_Payment

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on element by text "My Products"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "currentDomesticAccountBBAN" is in view
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Remember available balance in currency "RSD" under key "IT_001_Debtor_Balance"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Pay"

    When Click on Bottom navigation button "Pay"
    And Wait for Past payments button in Pay screen
    And Click on Review and edit button "Past payments" in Pay screen
    And Wait for first Past payment
    And Enter text "citizen" into EditText element
    And Wait "2" seconds
    And Wait for first transaction to load
    And Click on first Past payment
    And Wait for element by contains text "Recipient name"

    And Remember text from element by id "nlb-amount" under key "keyPaymentAmount"
    And Remember text of first following sibling of element by text "Recipient name" in txt under key "keyRecipientName"
    #And Remember text of first following sibling of element by text "Recipient address" in txt under key "keyRecipientAddress"
    And Remember text of first following sibling of element by text "Recipient account number" in txt under key "keyRecipientAccountNumber"
    And Remember text of first following sibling of element by text "Purpose code" in txt under key "keyPurposeCode"
    And Swipe vertical
    And Remember text of first following sibling of element by text "Purpose" in txt under key "keyPurpose"
    And Remember text of first following sibling of element by text "Debtor name" in txt under key "keyDebtorName"
    And Remember text of first following sibling of element by text "Debtor account number" in txt under key "keyDebtorAccountNumber"
    And Scroll down until element with text "Fee" is in view
    And Remember text of first following sibling of element by text "Fee" in txt under key "keyFeeWithCurrency"
    And Click on element by contains text "Repeat"
    And Wait for element by contains text "Select from list"

    And Assert element by text "Debtor"
    And Assert element by text from key "keyDebtorAccountNumber" is displayed
    And Assert element by text "Recipient"
    And Assert element by text from key "keyRecipientAccountNumber" is displayed
    And Swipe vertical
    And Swipe vertical
    And Assert element by id "nlb-amount-with-currency-field" has text that contains value from key "keyPaymentAmount"
    And Assert element by text from key "keyPurposeCode" is displayed
    And Assert element by text from key "keyPurpose" is displayed
    And Assert payment date is todays date and in valid date format
    And Check if urgent checkbox is checked and if not set to urgent
    And Assert element by id "nlb-checkbox-urgent-payment" is checked "true"
    And Click on element by contains text "Next"
    And Wait for element by text "Fee"

    And Assert payment amount in payment review for domestic payment is from key "keyPaymentAmount" and has currency "RSD"
    And Assert fee amount in payment review for domestic payment is from key "keyFeeWithCurrency"

    And Assert element by text "Debtor"
    And Assert element by text "Name" with index "1" has first following sibling containing text from key "keyDebtorName"
    And Assert element by text "Account number" with index "1" has first following sibling containing text from key "keyDebtorAccountNumber"
    And Assert element by text "Recipient"
    And Assert element by text "Name" with index "2" has first following sibling containing text from key "keyRecipientName"
    And Assert element by text "Account number" with index "2" has first following sibling containing text from key "keyRecipientAccountNumber"
    And Swipe vertical

    And Assert element by contains text "Urgent" has first following sibling containing text "Yes"
    And Assert element by text "Value date" has first following sibling match regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by text "Purpose code" has first following sibling from key "keyPurposeCode"
    And Assert element by text "Purpose" has first following sibling from key "keyPurpose"
    And Assert element by text "Value date" has first following sibling match regex "^\d{2}\.\d{2}\.\d{4}$"
    And Swipe vertical
    And Click on element by text "Confirm"
    And Wait for element by text "Enter PIN"
    And Enter PIN

    And Wait for element by text "Payment amount"
    And Assert payment amount in payment confirmation is from key "keyPaymentAmount" and currency "RSD"
    And Assert element by text "Fee" has first following sibling from key "keyFeeWithCurrency"
    And Assert element by text from key "keyRecipientName" is displayed
#    And Assert element by text from key "keyAccountNumber" is displayed
    And Scroll to element by text "Purpose"
#    And Assert element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Assert element by text from excel "<rowindex>" columnName "account_details_owner"
    And Assert element by text "Value date" has first following sibling match regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by text "Purpose code" has first following sibling from key "keyPurposeCode"
    And Assert element by text "Purpose" has first following sibling from key "keyPurpose"
    And Swipe vertical

    And Assert element by text "Reject"
    And Assert element by id "nlb-button-primary" that has descendant text "Pay"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "transactions-web-close-popup-icon" to appear
    And Assert element by text "Confirmation successful"
    And Assert element by contains text "Your payment was successfully accepted"
    And Click on element by id "transactions-web-close-popup-nlb-button"

    And Wait for element by contains text "Past payments"
    And Click on element by text "Past payments"
    And Wait for first Past payment
    And Click on first Past payment
    And Wait for element by contains text "Recipient name"

    And Assert element by id "nlb-date" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by id "nlb-currency" has text "RSD"
    And Assert element by id "nlb-details" has text that contains value from key "keyRecipientName"
    And Assert that amount in past or upcoming payment title is from key "keyPaymentAmount"
    And Assert element by text "Recipient name" has first following sibling from key "keyRecipientName"
    #todo address
    And Assert element by text "Recipient account number" has first following sibling from key "keyRecipientAccountNumber"
    And Assert element by contains text "Urgent" has first following sibling containing text "Yes"
    And Assert element by text "Purpose code" has first following sibling from key "keyPurposeCode"
    And Assert element by text "Purpose" has first following sibling from key "keyPurpose"
    And Swipe vertical
    And Swipe vertical
    And Assert element by text "Debtor name" has first following sibling from key "keyDebtorName"
    And Assert element by text "Debtor account number" has first following sibling from key "keyDebtorAccountNumber"
    And Assert element by text "Order number" has first following sibling match regex "^\d{14}$"
    And Assert element by text "Payment date" has first following sibling match regex "^\d{2}\.\d{2}\.\d{4}\r?\n\d{2}:\d{2}:\d{2}$"
    And Assert element by text "Value date" has first following sibling match regex "^\d{2}\.\d{2}\.\d{4}$"
    And Swipe vertical
    And Assert element by text "Fee" has first following sibling from key "keyFeeWithCurrency"
    And Assert that text "Payment status" has first following sibling with text "Executed"
    And Click "Back" content description
    And Wait for element by contains text "Search"
    And Click "Back" content description
    And Wait for element by contains text "My Products"
    And Click on element by contains text "My Products"
    And Wait for first product in My products page
    And Scroll until element with text from excel "<rowindex>" columnName "currentDomesticAccountBBAN" is in view
    
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Check if current balance is lowered by amount from key "keyPaymentAmount" and with fee from key "keyFeeWithCurrency" using balance from key "IT_001_Debtor_Balance"
    And Wait for first transaction to load
    And Wait "1" seconds

    Then Click on first transaction in product details
    And Wait for element by text "Settlement date"
    And Assert element by text "Transaction details"
    And Assert element by id "nlb-date" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by id "nlb-title" has text that contains value from key "keyPurpose"
    And Assert element by id "nlb-currency" has text "RSD"
    And Assert amount in transaction title is from key "keyPaymentAmount" with minus
    And Assert element by text "Account number" has first following sibling from key "keyRecipientAccountNumber"
    And Assert element by text "Purpose" has first following sibling from key "keyPurpose"
    And Assert element by text "Settlement date" has first following sibling match regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by text "Value date" has first following sibling match regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert that amount label in transaction details has value from key "keyPaymentAmount" in currency "RSD"
    And Assert element by text "Transaction ID" has first following sibling match regex "^.{14}$"

    Examples:
      | rowindex |
      |        5 |


  @Payments_Payments_Arhive_Resubmit_Payments_From_Past_Payment_List_[WEB]-Prenesi
  Scenario Outline: Payments_Payments_Arhive_Resubmit_Payments_From_Past_Payment_List_[WEB]-Prenesi

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load
    And Click on element by text "My Products"
    And Wait for element by id "nlb-value-product-primary-balance" to appear
    And Scroll until element with text from excel "<rowindex>" columnName "currentDomesticAccountBBAN" is in view
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Wait for element by id "nlb-product-details-primary-balance" to appear
    And Remember available balance in currency "RSD" under key "IT_001_Debtor_Balance"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Pay"

    When Click on Bottom navigation button "Pay"
    And Wait for Past payments button in Pay screen
    And Click on Review and edit button "Past payments" in Pay screen
    And Wait for first Past payment
    And Enter text "prenesi" into EditText element
    And Wait "2" seconds
    And Wait for first transaction to load
    And Click on first Past payment
    And Wait for element by contains text "Recipient name"

    #TODO DOVDE
#    And Remember text from element by id "nlb-amount" under key "keyPaymentAmount"
#    And Remember text of first following sibling of element by text "Recipient name" in txt under key "keyRecipientName"
#    #And Remember text of first following sibling of element by text "Recipient address" in txt under key "keyRecipientAddress"
#    And Remember text of first following sibling of element by text "Recipient account number" in txt under key "keyRecipientAccountNumber"
#    And Remember text of first following sibling of element by text "Purpose code" in txt under key "keyPurposeCode"
#    And Swipe vertical
#    And Remember text of first following sibling of element by text "Purpose" in txt under key "keyPurpose"
#    And Remember text of first following sibling of element by text "Debtor name" in txt under key "keyDebtorName"
#    And Remember text of first following sibling of element by text "Debtor account number" in txt under key "keyDebtorAccountNumber"
#    And Scroll down until element with text "Fee" is in view
#    And Remember text of first following sibling of element by text "Fee" in txt under key "keyFeeWithCurrency"
#    And Click on element by contains text "Repeat"
#    And Wait for element by contains text "Select from list"
#
#    And Assert element by text "Debtor"
#    And Assert element by text from key "keyDebtorAccountNumber" is displayed
#    And Assert element by text "Recipient"
#    And Assert element by text from key "keyRecipientAccountNumber" is displayed
#    And Swipe vertical
#    And Swipe vertical
#    And Assert element by id "nlb-amount-with-currency-field" has text that contains value from key "keyPaymentAmount"
#    And Assert element by text from key "keyPurposeCode" is displayed
#    And Assert element by text from key "keyPurpose" is displayed
#    And Assert payment date is todays date and in valid date format
#    And Check if urgent checkbox is checked and if not set to urgent
#    And Assert element by id "nlb-checkbox-urgent-payment" is checked "true"
#    And Click on element by contains text "Next"
#    And Wait for element by text "Fee"
#
#    And Assert payment amount in payment review for domestic payment is from key "keyPaymentAmount" and has currency "RSD"
#    And Assert fee amount in payment review for domestic payment is from key "keyFeeWithCurrency"
#
#    And Assert element by text "Debtor"
#    And Assert element by text "Name" with index "1" has first following sibling containing text from key "keyDebtorName"
#    And Assert element by text "Account number" with index "1" has first following sibling containing text from key "keyDebtorAccountNumber"
#    And Assert element by text "Recipient"
#    And Assert element by text "Name" with index "2" has first following sibling containing text from key "keyRecipientName"
#    And Assert element by text "Account number" with index "2" has first following sibling containing text from key "keyRecipientAccountNumber"
#    And Swipe vertical
#
#    And Assert element by contains text "Urgent" has first following sibling containing text "Yes"
#    And Assert element by text "Value date" has first following sibling match regex "^\d{2}\.\d{2}\.\d{4}$"
#    And Assert element by text "Purpose code" has first following sibling from key "keyPurposeCode"
#    And Assert element by text "Purpose" has first following sibling from key "keyPurpose"
#    And Assert element by text "Value date" has first following sibling match regex "^\d{2}\.\d{2}\.\d{4}$"
#    And Swipe vertical
#    And Click on element by text "Confirm"
#    And Wait for element by text "Enter PIN"
#    And Enter PIN
#
#    And Wait for element by text "Payment amount"
#    And Assert payment amount in payment confirmation is from key "keyPaymentAmount" and currency "RSD"
#    And Assert element by text "Fee" has first following sibling from key "keyFeeWithCurrency"
#    And Assert element by text from key "keyRecipientName" is displayed
##    And Assert element by text from key "keyAccountNumber" is displayed
#    And Scroll to element by text "Purpose"
##    And Assert element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
#    And Assert element by text from excel "<rowindex>" columnName "account_details_owner"
#    And Assert element by text "Value date" has first following sibling match regex "^\d{2}\.\d{2}\.\d{4}$"
#    And Assert element by text "Purpose code" has first following sibling from key "keyPurposeCode"
#    And Assert element by text "Purpose" has first following sibling from key "keyPurpose"
#    And Swipe vertical
#
#    And Assert element by text "Reject"
#    And Assert element by id "nlb-button-primary" that has descendant text "Pay"
#    And Click on element by id "nlb-button-primary"
#    And Wait for element by id "transactions-web-close-popup-icon" to appear
#    And Assert element by text "Confirmation successful"
#    And Assert element by contains text "Your payment was successfully accepted"
#    And Click on element by id "transactions-web-close-popup-nlb-button"
#
#    And Wait for element by contains text "Past payments"
#    And Click on element by text "Past payments"
#    And Wait for first Past payment
#    And Click on first Past payment
#    And Wait for element by contains text "Recipient name"
#
#    And Assert element by id "nlb-date" with regex "^\d{2}\.\d{2}\.\d{4}$"
#    And Assert element by id "nlb-currency" has text "RSD"
#    And Assert element by id "nlb-details" has text that contains value from key "keyRecipientName"
#    And Assert that amount in past or upcoming payment title is from key "keyPaymentAmount"
#    And Assert element by text "Recipient name" has first following sibling from key "keyRecipientName"
#    #todo address
#    And Assert element by text "Recipient account number" has first following sibling from key "keyRecipientAccountNumber"
#    And Assert element by contains text "Urgent" has first following sibling containing text "Yes"
#    And Assert element by text "Purpose code" has first following sibling from key "keyPurposeCode"
#    And Assert element by text "Purpose" has first following sibling from key "keyPurpose"
#    And Swipe vertical
#    And Swipe vertical
#    And Assert element by text "Debtor name" has first following sibling from key "keyDebtorName"
#    And Assert element by text "Debtor account number" has first following sibling from key "keyDebtorAccountNumber"
#    And Assert element by text "Order number" has first following sibling match regex "^\d{14}$"
#    And Assert element by text "Payment date" has first following sibling match regex "^\d{2}\.\d{2}\.\d{4}\r?\n\d{2}:\d{2}:\d{2}$"
#    And Assert element by text "Value date" has first following sibling match regex "^\d{2}\.\d{2}\.\d{4}$"
#    And Swipe vertical
#    And Assert element by text "Fee" has first following sibling from key "keyFeeWithCurrency"
#    And Assert that text "Payment status" has first following sibling with text "Executed"
#    And Click "Back" content description
#    And Wait for element by contains text "Search"
#    And Click "Back" content description
#    And Wait for element by contains text "My Products"
#    And Click on element by contains text "My Products"
#    And Wait for first product in My products page
#    And Scroll until element with text from excel "<rowindex>" columnName "currentDomesticAccountBBAN" is in view
#
#    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
#    And Wait for element by id "nlb-product-details-primary-balance" to appear
#    And Check if current balance is lowered by amount from key "keyPaymentAmount" and with fee from key "keyFeeWithCurrency" using balance from key "IT_001_Debtor_Balance"
#    And Wait for first transaction to load
#    And Wait "1" seconds
#
#    Then Click on first transaction in product details
#    And Wait for element by text "Settlement date"
#    And Assert element by text "Transaction details"
#    And Assert element by id "nlb-date" with regex "^\d{2}\.\d{2}\.\d{4}$"
#    And Assert element by id "nlb-title" has text that contains value from key "keyPurpose"
#    And Assert element by id "nlb-currency" has text "RSD"
#    And Assert amount in transaction title is from key "keyPaymentAmount" with minus
#    And Assert element by text "Account number" has first following sibling from key "keyRecipientAccountNumber"
#    And Assert element by text "Purpose" has first following sibling from key "keyPurpose"
#    And Assert element by text "Settlement date" has first following sibling match regex "^\d{2}\.\d{2}\.\d{4}$"
#    And Assert element by text "Value date" has first following sibling match regex "^\d{2}\.\d{2}\.\d{4}$"
#    And Assert that amount label in transaction details has value from key "keyPaymentAmount" in currency "RSD"
#    And Assert element by text "Transaction ID" has first following sibling match regex "^.{14}$"

    Examples:
      | rowindex |
      |        5 |