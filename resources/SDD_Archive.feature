Feature: SDD_Archive

  @Payments_SDD_Archive_Payments_Transaction_List_[ANDROID]
  Scenario Outline: Payments_SDD_Archive_Payments_Transaction_List_[ANDROID]
    #C71518
    #BUG Savings account should not have SDD option in transaction list

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer"
    And Click on element by text "Past payments"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"
    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "shared_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "shared_account_iban"
    And Wait for element by id "nlb-title" to appear

    Then Click on element by text "SEPA DD"
    And Wait for element by id "nlb-title" to appear
    And Assert list of element by id "nlb-date" is displayed
    And Assert list of element by id "nlb-currency" is displayed
    And Assert list of element by id "nlb-title" is displayed
    And Assert list of element by id "nlb-amount" is displayed
    And Assert list of element by id "nlb-details" is displayed

    #And Assert SEPA DD is grouped by months

    And Click on element by id "nlb-icon-button"
    And Wait for element by text "Date"
    And Assert element by text "Date"
    And Assert element by text "Payment status"
    And Assert element by text "Amount range"
    And Click on element by text "Payment status"
    And Wait for element by text "Executed"
    And Click on element by text "Executed"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Date"
    And Click on element by id "nlb-button-primary"
    And Wait for SEPA DD to filter
    And Wait for element by id "nlb-title" to appear
    And Click on first element by id "nlb-title"
    And Wait for element by text "Recipient"
    And Scroll down until element with text "Executed" is in view
    And Assert that text "Payment status" has first following sibling with text "Executed"
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    And Click on element by id "nlb-icon-button"
    And Wait for element by text "Date"
    And Assert element by text "Date"
    And Assert element by text "Payment status"
    And Assert element by text "Amount range"
    And Click on element by text "Payment status"
    And Wait for element by text "Executed"
    And Click on element by text "Executed"
    And Click on element by text "Rejected"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Date"
    And Click on element by id "nlb-button-primary"
    And Wait for SEPA DD to filter
    And Assert element by text "No past payments"

    And Click on element by id "nlb-icon-button"
    And Wait for element by text "Date"
    And Assert element by text "Date"
    And Assert element by text "Payment status"
    And Assert element by text "Amount range"
    And Click on element by text "Payment status"
    And Wait for element by text "Executed"
    And Click on element by text "Rejected"
    And Click on element by text "Refused"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Date"
    And Click on element by id "nlb-button-primary"
    And Wait for SEPA DD to filter
    And Wait for element by id "nlb-title" to appear
    And Click on first element by id "nlb-title"
    And Wait for element by text "Recipient"
    And Scroll down until element with text "Refused" is in view
    And Assert that text "Payment status" has first following sibling with text "Refused"
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    And Click on element by id "nlb-icon-button"
    And Wait for element by text "Date"
    And Assert element by text "Date"
    And Assert element by text "Payment status"
    And Assert element by text "Amount range"
    And Click on element by text "Payment status"
    And Wait for element by text "Executed"
    And Click on element by text "Refused"
    And Click on element by text "Refunded"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Date"
    And Click on element by id "nlb-button-primary"
    And Wait for SEPA DD to filter
    And Wait for element by id "nlb-title" to appear
    And Click on first element by id "nlb-title"
    And Wait for element by text "Recipient"
    And Scroll down until element with text "Refunded" is in view
    And Assert that text "Payment status" has first following sibling with text "Refunded"
    And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"

    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "savings_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "savings_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "SEPA DD" is not displayed


    Examples:
      | rowindex |
      | 4        |

  @Payments_SDD_Archive_Payments_Transaction_Details_Executed_[ANDROID]
  Scenario Outline: Payments_SDD_Archive_Payments_Transaction_Details_Executed_[ANDROID]
    #C71519

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer"
    And Click on element by text "Past payments"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"
    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "shared_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "shared_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Click on element by text "SEPA DD"
    And Wait for element by id "nlb-title" to appear
    And Click on element by id "nlb-icon-button"
    And Wait for element by text "Date"
    And Click on element by text "Payment status"
    And Wait for element by text "Executed"
    And Click on element by text "Executed"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Date"
    And Click on element by id "nlb-button-primary"
    And Wait for SEPA DD to filter
    And Wait for element by id "nlb-title" to appear
    And Click on first element by id "nlb-title"
    And Wait for element by text "Recipient"

    Then Assert element by text "Confirmation"
    And Assert element by text "Refund"
    And Assert that text "Recipient" has first following sibling that is filled
    And Assert that text "Account number" has first following sibling that is filled
    And Assert that text "Unique mandate number" has first following sibling that is filled
    And Assert that text "Purpose" has first following sibling that is filled
    And Assert that text "First and last name / Company name" has first following sibling that is filled
    #And Assert that second text "Account number" has first following sibling that is filled
    And Assert that second text "Account number" has first following sibling that is filled
    And Assert that text "Address" has first following sibling that is filled
    And Swipe vertical
    And Assert that text "Informative fee" has first following sibling that is filled
    And Assert that text "Payment status" has first following sibling with text "Executed"
    And Assert element by text "Reference" is not displayed

    Examples:
      | rowindex |
      | 4        |


  @Payments_SDD_Archive_Payments_Transaction_Details_Refused_[ANDROID]
  Scenario Outline: Payments_SDD_Archive_Payments_Transaction_Details_Refused_[ANDROID]
    #C71519

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer"
    And Click on element by text "Past payments"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"
    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "shared_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "shared_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Click on element by text "SEPA DD"
    And Wait for element by id "nlb-title" to appear
    And Click on element by id "nlb-icon-button"
    And Wait for element by text "Date"
    And Click on element by text "Payment status"
    And Wait for element by text "Refused"
    And Click on element by text "Refused"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Date"
    And Click on element by id "nlb-button-primary"
    And Wait for SEPA DD to filter
    And Wait for element by id "nlb-title" to appear
    And Click on first element by id "nlb-title"
    And Wait for element by text "Recipient"

    Then Assert element by text "Confirmation" is not displayed
    And Assert element by text "Refund" is not displayed
    And Assert that text "Recipient" has first following sibling that is filled
    And Assert that text "Account number" has first following sibling that is filled
    And Assert that text "Unique mandate number" has first following sibling that is filled
    And Assert that text "Purpose" has first following sibling that is filled
    And Assert that text "First and last name / Company name" has first following sibling that is filled
    And Assert that second text "Account number" has first following sibling that is filled
    And Assert that text "Address" has first following sibling that is filled
    And Swipe vertical
    And Assert that text "Informative fee" has first following sibling that is filled
    And Assert that text "Refusal reason" has first following sibling that is filled
    And Assert that text "Refusal date" has first following sibling that is filled
    And Assert that text "Payment status" has first following sibling with text "Refused"
    And Assert element by text "Reference" is not displayed

    Examples:
      | rowindex |
      | 4        |

  @Payments_SDD_Archive_Payments_Transaction_Details_Refunded_[ANDROID]
  Scenario Outline: Payments_SDD_Archive_Payments_Transaction_Details_Refunded_[ANDROID]
    #C71519

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer"
    And Click on element by text "Past payments"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"
    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "shared_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "shared_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Click on element by text "SEPA DD"
    And Wait for element by id "nlb-title" to appear
    And Click on element by id "nlb-icon-button"
    And Wait for element by text "Date"
    And Click on element by text "Payment status"
    And Wait for element by text "Refunded"
    And Click on element by text "Refunded"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Date"
    And Click on element by id "nlb-button-primary"
    And Wait for SEPA DD to filter
    And Wait for element by id "nlb-title" to appear
    And Click on first element by id "nlb-title"
    And Wait for element by text "Recipient"

    Then Assert element by text "Confirmation" is not displayed
    And Assert element by exact text "Refund" is not displayed
    And Assert that text "Recipient" has first following sibling that is filled
    And Assert that text "Account number" has first following sibling that is filled
    And Assert that text "Unique mandate number" has first following sibling that is filled
    And Assert that text "Purpose" has first following sibling that is filled
    And Assert that text "First and last name / Company name" has first following sibling that is filled
    And Assert that second text "Account number" has first following sibling that is filled
    And Assert that text "Address" has first following sibling that is filled
    And Swipe vertical
    And Assert that text "Informative fee" has first following sibling that is filled
    And Assert that text "Refund date" has first following sibling that is filled
    And Assert that text "Payment status" has first following sibling with text "Refunded"
    And Assert element by text "Reference" is not displayed

    Examples:
      | rowindex |
      | 4        |

  @Payments_SDD_Archive_Request_SDD_Refund_For_Transaction_That_Already_Was_Requested_Invalid_[ANDROID]
  Scenario Outline: Payments_SDD_Archive_Request_SDD_Refund_For_Transaction_That_Already_Was_Requested_Invalid_[ANDROID]
    #C71535

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer"
    And Click on element by text "Past payments"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"
    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "shared_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "shared_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Click on element by text "SEPA DD"
    And Wait for element by id "nlb-title" to appear
    And Click on element by id "nlb-icon-button"
    And Wait for element by text "Date"
    And Click on element by text "Payment status"
    And Wait for element by text "Executed"
    And Click on element by text "Executed"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Date"
    And Click on element by id "nlb-button-primary"
    And Wait for SEPA DD to filter
    And Wait for element by id "nlb-title" to appear
    And Click on first element by id "nlb-title"
    And Wait for element by text "Recipient"
    And Remember element value "text" by id "nlb-date" under key "date"
    And Remember element value "text" by id "nlb-currency" under key "currency"
    And Remember element value "text" by id "nlb-details" under key "details"
    And Remember element value "text" by id "nlb-amount" under key "amount"
    And Click on element by text "Refund"
    And Wait for element by text "Refund request"
    And Assert element by text "Refund request"
    And Assert element by text "Payment amount"
    And Assert amount for refund request is from keys "amount" and "currency"
    And Assert element by text "Payment date"
    And Assert text from key "date" in element by id "payment-date-text-value"
    And Assert element by text "Creditor name"
    And Assert text from key "details" in element by id "creditor-name-text-value"
    And Assert element by text "Purpose"
    And Assert text "SEPA direct debit" in element id "purpose-text-value"
    And Assert element by text "If you are requesting a refund more than 8 weeks after executed payment, your request status will be shown with some delay, because we need to run additional checkup."
    And Click on element by id "nlb-button-primary"
    And Assert element by text "Refund request was successfully sent."

    Then Click on first element by id "nlb-title"
    And Wait for element by text "Recipient"
    And Remember element value "text" by id "nlb-date" under key "date"
    And Remember element value "text" by id "nlb-currency" under key "currency"
    And Remember element value "text" by id "nlb-details" under key "details"
    And Remember element value "text" by id "nlb-amount" under key "amount"
    And Click on element by text "Refund"
    And Wait for element by text "Refund request"
    And Assert element by text "Payment amount"
    And Assert amount for refund request is from keys "amount" and "currency"
    And Assert element by text "Payment date"
    And Assert text from key "date" in element by id "payment-date-text-value"
    And Assert element by text "Creditor name"
    And Assert text from key "details" in element by id "creditor-name-text-value"
    And Assert element by text "Purpose"
    And Assert text "SEPA direct debit" in element id "purpose-text-value"
    And Assert element by text "If you are requesting a refund more than 8 weeks after executed payment, your request status will be shown with some delay, because we need to run additional checkup."
    And Click on element by id "nlb-button-primary"
    And Assert element by text "Failed sending request"


    Examples:
      | rowindex |
      | 4        |