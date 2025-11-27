Feature: E_Invoices

  @Payments_E_Invoices_Subscribe_To_E_Invoice_[MOB_ANDROID]
  Scenario Outline: Payments_E_Invoices_Subscribe_To_E_Invoice_[MOB_ANDROID]
    #C75629,C75630

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Upcoming payments"
    And Click "E-invoices" content description from view tag "View"
    And Wait for element by text "Subscribe to e-invoice"
    And Click on element by text "Subscribe to e-invoice"
    And Wait for element by id "nlb_search_text_field" to appear
    And Enter text "GOLOVEC" in element id "nlb_search_text_field"
    And Click on element by text "Search"
    And Wait for element by text "54827493"
    And Assert GOLOVEC invoice is shown after search
    And Click on element by text "54827493"
    And Wait for element by id "nlb-e-invoice-reference-id" to appear
    And Assert GOLOVEC invoice is shown after search
    And Click on element by text "Next"
    And Assert element by text "Reference ID is required"
    And Enter text "123456789" in element id "nlb-e-invoice-reference-id"
    And Assert e invoice debtor is from Excel "<rowindex>" columnName "personal_account_name" "personal_account_iban"
    And Click on element by text "Next"
    And Wait for element by text "User"
    And Assert element by text "For account" has first following sibling from excel "<rowindex>" columnName "personal_account_iban"
    #And Assert element by text "Your e-mail" has first following sibling from excel "<rowindex>" columnName "user_email"
    #And Assert element by text "Mobile number" has first following sibling from excel "<rowindex>" columnName "phone_number_hidden"
    And Assert element by text "Issuer details"
    And Assert element by text "Issuer name" has first following sibling "ŠPORTNO DRUŠTVO GOLOVEC"
    And Assert element by text "Issuer address" has first following sibling contains text "RUSJANOV TRG 2"
    And Assert element by text "Issuer address" has first following sibling contains text "1000 LJUBLJANA"
    And Assert element by text "Issuer address" has first following sibling contains text "SLOVENIA"
    And Assert element by text "Tax number" has first following sibling "54827493"
    And Assert element by text "Issuer account number" has first following sibling "SI56 0206 0001 0682 454"
    And Assert element by text "Issuer reference ID" has first following sibling "123456789"
    And Scroll down until element with text "Cancel" is in view
    And Swipe vertical
    And Assert element by text "Issuer’s terms and conditions"
    And Assert element by text "Kot naročnik soglašam, da mi izdajatelj vse račune posreduje v elektronski obliki v e-banko na račun, naveden v vlogi. Izdajatelju jamčim za resničnost in pravilnost podatkov iz te vloge in se zavezujem, da mu bom sam sporočal vsako spremembo, ki bi vplivala na prejem e-računa."
    And Assert element by text "Potrjujem, da sem seznanjen s Splošnimi pogoji poslovanja z NLB Osebnimi računi ter soglašam, da banka osebne podatke zbira, obdeluje in hrani skladno s Splošnimi pogoji poslovanja z NLB Osebnimi računi in za potrebe Sistema e-račun. "
    And Assert element "nlb-button-primary" by id is disabled
    And Click on element by id "nlb-issuer-terms-agree-checkbox"
    And Click on element by id "nlb-button-primary"

    Then Try to assert that payment is "Change confirmed" and send command to OTP method
    And Check if PIN is needed and complete payment for "Change confirmed"
    And Assert element by text "No e-documents to display"

    Examples:
      | rowindex |
      |        4 |


  @Payments_E_Invoices_Unsubscribe_To_E_Invoice_[MOB_ANDROID]
  Scenario Outline: Payments_E_Invoices_Unsubscribe_To_E_Invoice_[MOB_ANDROID]
    #C75631,C75632

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Upcoming payments"
    And Click "E-invoices" content description from view tag "View"
    And Wait for element by text "Cancel e-invoice"
    And Click on element by text "Cancel e-invoice"
    And Wait for element by id "nlb_search_text_field" to appear
    And Enter text "GOLOVEC" in element id "nlb_search_text_field"
    And Click on element by text "Search"
    And Wait for element by text "54827493"
    And Assert GOLOVEC invoice is shown after search
    And Click on element by text "54827493"
    And Wait for element by id "nlb-e-invoice-reference-id" to appear
    And Assert GOLOVEC invoice is shown after search
    And Click on element by text "Next"
    And Assert element by text "Reference ID is required"
    And Enter text "123456789" in element id "nlb-e-invoice-reference-id"
    And Assert e invoice debtor is from Excel "<rowindex>" columnName "personal_account_name" "personal_account_iban"
    And Click on element by text "Next"
    And Wait for element by text "User"
    And Assert element by text "For account" has first following sibling from excel "<rowindex>" columnName "personal_account_iban"
    #And Assert element by text "Your e-mail" has first following sibling from excel "<rowindex>" columnName "user_email"
    #And Assert element by text "Mobile number" has first following sibling from excel "<rowindex>" columnName "phone_number_hidden"
    And Assert element by text "Issuer details"
    And Assert element by text "Issuer name" has first following sibling "ŠPORTNO DRUŠTVO GOLOVEC"
    And Assert element by text "Issuer address" has first following sibling contains text "RUSJANOV TRG 2"
    And Assert element by text "Issuer address" has first following sibling contains text "1000 LJUBLJANA"
    And Assert element by text "Issuer address" has first following sibling contains text "SLOVENIA"
    And Assert element by text "Tax number" has first following sibling "54827493"
    And Assert element by text "Issuer account number" has first following sibling "SI56 0206 0001 0682 454"
    And Assert element by text "Issuer reference ID" has first following sibling "123456789"
    And Scroll down until element with text "Cancel" is in view
    And Swipe vertical
    And Assert element by text "Issuer’s terms and conditions"
    And Assert element by text "Kot naročnik soglašam, da mi izdajatelj vse račune posreduje v elektronski obliki v e-banko na račun, naveden v vlogi. Izdajatelju jamčim za resničnost in pravilnost podatkov iz te vloge in se zavezujem, da mu bom sam sporočal vsako spremembo, ki bi vplivala na prejem e-računa."
    And Assert element by text "Potrjujem, da sem seznanjen s splošnimi pogoji poslovanja z NLB Osebnimi računi ter soglašam, da banka osebne podatke zbira, obdeluje in hrani skladno s Splošnimi pogoji poslovanja z NLB Osebnimi računi in za potrebe Sistema e-račun."
    And Assert element "nlb-button-primary" by id is disabled
    And Click on element by id "nlb-issuer-terms-agree-checkbox"
    And Click on element by id "nlb-button-primary"

    Then Try to assert that payment is "Change confirmed" and send command to OTP method
    And Check if PIN is needed and complete payment for "Change confirmed"
    And Assert element by text "No e-documents to display"

    Examples:
      | rowindex |
      |        4 |


  @Payments_E_Invoices_Subscribe_To_E_Invoice-invalid_[MOB_ANDROID]
  Scenario Outline: Payments_E_Invoices_Subscribe_To_E_Invoice-invalid_[MOB_ANDROID]
    #C75630


    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Upcoming payments"
    And Click "E-invoices" content description from view tag "View"
    And Wait for element by text "Subscribe to e-invoice"
    And Click on element by text "Subscribe to e-invoice"
    And Wait for element by id "nlb_search_text_field" to appear
    And Enter text "GOLOVEC" in element id "nlb_search_text_field"
    And Click on element by text "Search"
    And Wait for element by text "54827493"
    And Assert GOLOVEC invoice is shown after search
    And Click on element by text "54827493"
    And Wait for element by id "nlb-e-invoice-reference-id" to appear
    And Assert GOLOVEC invoice is shown after search
    And Click on element by text "Next"
    And Assert element by text "Reference ID is required"
    And Enter text "123456789" in element id "nlb-e-invoice-reference-id"
    And Assert e invoice debtor is from Excel "<rowindex>" columnName "personal_account_name" "personal_account_iban"
    And Click on element by id "nlb-e-invoice-debtor-card"

    Then Assert shown accounts for invoice debit accounts are correct


    Examples:
      | rowindex |
      |        4 |

  @Payments_E_Invoices_Unsubscribe_To_E_Invoice-invalid_[MOB_ANDROID]
  Scenario Outline: Payments_E_Invoices_Unsubscribe_To_E_Invoice-invalid_[MOB_ANDROID]
    #C75632

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Upcoming payments"
    And Click "E-invoices" content description from view tag "View"
    And Wait for element by text "Cancel e-invoice"
    And Click on element by text "Cancel e-invoice"
    And Wait for element by id "nlb_search_text_field" to appear
    And Enter text "GOLOVEC" in element id "nlb_search_text_field"
    And Click on element by text "Search"
    And Wait for element by text "54827493"
    And Hide keyboard
    And Assert GOLOVEC invoice is shown after search
    And Click on element by text "54827493"
    And Wait for element by id "nlb-e-invoice-reference-id" to appear
    And Assert GOLOVEC invoice is shown after search
    And Click on element by text "Next"
    And Assert element by text "Reference ID is required."
    And Enter text "123456789" in element id "nlb-e-invoice-reference-id"
    And Assert e invoice debtor is from Excel "<rowindex>" columnName "personal_account_name" "personal_account_iban"
    And Click on element by id "nlb-e-invoice-debtor-card"

    Then Assert shown accounts for invoice debit accounts are correct

    Examples:
      | rowindex |
      |        4 |

  @Payments_E_Invoices_Pay_E_Invoices_[MOB_ANDROID]
  Scenario Outline: Payments_E_Invoices_Pay_E_Invoices_[MOB_ANDROID]
    #C75627

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Upcoming payments"
    And Click "E-invoices" content description from view tag "View"
    And Wait for element by text "Cancel e-invoice"
    And Wait for element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "shared_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "shared_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Click filter button in e-invoice list
    And Wait for element by text "Status"
    And Click on element by text "Status"
    And Wait for element by text "Waiting for payment"
    And Click on element by text "Waiting for payment"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Status"
    And Click on element by id "nlb-button-primary"
    And Wait for e-invoice to filter
    And Click on first element by id "nlb-title"
    And Wait for element by text "Mark as paid"
    And Remember element attribute "text" by id "nlb-title" in txt under key "e_invoice_just_purpose"
    And Remember element attribute "text" by id "nlb-amount" in txt under key "e_invoice_amount"
    And Remember text of first following sibling of element by text "Creditor address" in txt under key "e_invoice_creditor_address"
    And Remember text of first following sibling of element by text "Creditor account" in txt under key "e_invoice_creditor_account"
    And Remember text of first following sibling of element by text "SWIFT (BIC) Code" in txt under key "e_invoice_creditor_bic"
    And Remember text of first following sibling of element by text "Reference" in txt under key "e_invoice_creditor_reference"
    And Swipe vertical
    And Remember text of first following sibling of element by text "Purpose code" in txt under key "e_invoice_purpose_code"
    And Remember text of first following sibling of element by text "Issuer name" in txt under key "e_invoice_issuer_name"
    And Click on element by id "nlb-button-primary"
    And Wait for element by id "nlb-amount-with-currency-field" to appear
    And Assert element by text "UPN payment"
    And Assert Debtor in Own Account Transfer has content description "Current account" and from Excel "<rowindex>" account name "shared_account_name" and iban "shared_account_iban" with currency "EUR"
    And Assert SEPA Recipient has account name and iban from keys "e_invoice_issuer_name" and "e_invoice_creditor_account"
    And Click on element by text from key "e_invoice_creditor_account" from txt file
    And Assert element "nlb-input-recipient-name" by id is disabled
    And Assert element "nlb-input-recipient-address" by id is disabled
    And Assert element "nlb-input-recipient-city" by id is disabled
    And Assert element "nlb-input-recipient-country-click-area" by id is disabled
    And Assert text from element by id "nlb-input-recipient-name" is contained within text from key "e_invoice_issuer_name_noSpace"
    And Assert text from element by id "nlb-input-recipient-address" is contained within text from key "e_invoice_creditor_address_noSpace"
    And Assert text from element by id "nlb-input-recipient-city" is contained within text from key "e_invoice_creditor_address_noSpace"
    And Assert text from element by id "nlb-input-recipient-country" is contained within text from key "e_invoice_creditor_address_noSpace"
    And Swipe vertical
    And Assert element "nlb-amount-with-currency-field" by id is disabled
    And Assert text from element by id "nlb-amount-with-currency-field" is contained within text from key "e_invoice_amount"
    And Assert element "nlb-input-purpose-code-click-area" by id is disabled
    And Assert text from key "e_invoice_purpose_code" is contained within text from element by id "nlb-input-purpose-code"
    And Assert text from element by id "nlb-input-purpose" is contained within text from key "e_invoice_just_purpose"
    And Enter random purpose into field by id "nlb-input-purpose" and remember it under key "e_invoice_new_purpose" in txt file
    And Assert element by text "NRC - No reference"
    And Swipe vertical
    And Assert element "nlb-input-payment-date" by id has current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Payment amount" to appear for "60" seconds
    And Assert element by text "Payment review"
    And Assert element by text "Check data and pay."
    And Assert element by text "Payment amount" has first following sibling from key "e_invoice_amount" with currency "EUR"
    And Assert element by text "Debtor"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_review"
    And Assert that text "Address" has first following sibling with text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    And Assert that text "Debtor account" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Assert element by text "Recipient"
    And Assert that second text "Name" has first following sibling with text from key "e_invoice_issuer_name"
    And Assert that second text "Address" has first following sibling with text from key "e_invoice_creditor_address_noSpace" with no spaces
    And Assert that second text "Account number" has first following sibling with text from key "e_invoice_creditor_account"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text from key "e_invoice_creditor_bic"
    And Swipe vertical
    And Assert element by text "Payment"
    And Assert that text "Reference" has first following sibling with text from key "e_invoice_creditor_reference"
    And Assert that text "Purpose" has first following sibling with text from txt file under key "e_invoice_new_purpose"
    And Assert that text "Purpose code" has first following sibling with text from key "e_invoice_purpose_code"
    And Assert that text "Payment date" has first following sibling with current date in format "d.M.yyyy"
    And Click on element by id "nlb-button-primary"

    And Try to assert that payment is "Success" and send command to OTP method
    And Check if PIN is needed and complete payment for "Success"
    And Wait for element by text "Download as PDF"
    And Swipe vertical
    And Assert that text "Document status" has first following sibling with text "Payment sent"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Cancel e-invoice"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Past payments"

    Then Click on element by text "Past payments"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"
    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "personal_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Assert element by text "Past payments"
    And Scroll until element with text from txt file under key "e_invoice_new_purpose" is in view and click
    And Wait for element by text "Recipient"
    And Assert element by text "Payment details"
    And Assert element "nlb-date" by id has current date in format "d.M.yyyy"
    And Assert text under key "e_invoice_new_purpose" from txt file in element id "nlb-title"
    And Assert text "EUR" in element id "nlb-currency"
    And Assert text under key "e_invoice_amount" from txt file in element id "nlb-amount"
    And Assert text under key "e_invoice_issuer_name" from txt file in element id "nlb-details"
    And Assert element by text "Confirmation"
    And Assert element by text "Send message"
    And Assert that text "Recipient" has first following sibling that contains text from key "e_invoice_issuer_name_noSpace" with no spaces
    And Assert that text "Recipient" has first following sibling that contains text from key "e_invoice_creditor_address_noSpace" with no spaces
    And Assert that text "Debtor account number" has first following sibling with text from key "e_invoice_creditor_account"
    And Assert that text "SWIFT (BIC) Code" has first following sibling with text from key "e_invoice_creditor_bic"
    And Assert that text "Reference" has first following sibling with text from txt file under key "e_invoice_creditor_reference"
    And Assert that text "Purpose code" has first following sibling with text from txt file under key "e_invoice_purpose_code"
    And Assert that text "First and last name / Company name" has first following sibling with text from Excel "<rowindex>" columnName "user_name_for_payment_details"
    And Assert that text "Account number" has first following sibling with text from Excel "<rowindex>" columnName "personal_account_iban"
    And Scroll down until element with text "Executed" is in view
    And Assert that text "Informative fee" has first following sibling with text "0,00 EUR"
    And Assert that text "Payment status" has first following sibling with text "Executed"

    Examples:
      | rowindex |
      |        4 |

  @Payments_E_Invoices_List_Of_E_Invoices_For_Selected_Account_[MOB_ANDROID]
  Scenario Outline: Payments_E_Invoices_List_Of_E_Invoices_For_Selected_Account_[MOB_ANDROID]
    #C75618

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Upcoming payments"
    And Click "E-invoices" content description from view tag "View"
    And Wait for element by text "Cancel e-invoice"
    And Wait for element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "shared_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "shared_account_iban"
    And Wait for element by id "nlb-title" to appear

    Then Assert element by text "Cancel e-invoice"
    And Assert element by text "Subscribe to e-invoice"
    And Assert there are two filters for e-invoices shown on the screen
    And Assert list of element by id "nlb-date" is displayed
    And Assert list of element by id "nlb-title" is displayed
    And Assert list of element by id "nlb-amount" is displayed
    And Assert list of element by id "nlb-details" is displayed
    And Assert list of element by id "nlb-additional-info" is displayed
    And Assert e-invoices are grouped by month
    And Assert that dates by id "nlb-date" are correctly sorted


    Examples:
      | rowindex |
      | 4        |

  @Payments_E_Invoices_Details_Of_E_Invoices_E-invoice_[MOB_ANDROID]
  Scenario Outline: Payments_E_Invoices_Details_Of_E_Invoices_E-invoice_[MOB_ANDROID]
    #C75622

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Upcoming payments"
    And Click "E-invoices" content description from view tag "View"
    And Wait for element by text "Cancel e-invoice"
    And Wait for element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "shared_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "shared_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Click filter button in e-invoice list
    And Wait for element by text "Document type"
    And Click on element by text "Document type"
    And Wait for element by text "E-invoice"
    And Click on element by text "E-invoice"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Document type"
    And Click on element by id "nlb-button-primary"
    And Wait for e-invoice to filter
    And Click on first element by id "nlb-title"
    And Wait for element by text "Download as PDF"

    Then Assert element "nlb-date" by id
    And Assert element "nlb-currency" by id
    And Assert element "nlb-title" by id
    And Assert element "nlb-amount" by id
    And Assert element "nlb-details" by id
    And Assert element "nlb-additional-info" by id
    And Assert element by text "Download as PDF"
    And Assert element by text "Download as XML"
    And Assert element by text "Creditor address"
    And Assert that text "Creditor address" has first following sibling that is filled
    And Assert element by text "Creditor account"
    And Assert that text "Creditor account" has first following sibling that is filled
    And Assert element by text "SWIFT (BIC) Code"
    And Assert that text "SWIFT (BIC) Code" has first following sibling that is filled
    And Assert element by text "Reference"
    And Assert that text "Reference" has first following sibling that is filled
    And Assert element by text "Purpose code"
    And Assert that text "Purpose code" has first following sibling that is filled
    And Assert element by text "Issuer name"
    And Assert that text "Issuer name" has first following sibling that is filled
    And Swipe vertical
    And Assert element by text "Issuer account"
    And Assert that text "Issuer account" has first following sibling that is filled
    And Assert element by text "Document type"
    And Assert that text "Document type" has first following sibling that is filled
    And Assert element by text "Document status"
    And Assert that text "Document status" has first following sibling that is filled
    And Assert element by text "E-invoice ID"
    And Assert that text "E-invoice ID" has first following sibling that is filled


    Examples:
      | rowindex |
      | 4        |

  @Payments_E_Invoices_Details_Of_E_Invoices_E-proforma_[MOB_ANDROID]
  Scenario Outline: Payments_E_Invoices_Details_Of_E_Invoices_E-proforma_[MOB_ANDROID]
    #C75622

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Upcoming payments"
    And Click "E-invoices" content description from view tag "View"
    And Wait for element by text "Cancel e-invoice"
    And Wait for element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "shared_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "shared_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Click filter button in e-invoice list
    And Wait for element by text "Document type"
    And Click on element by text "Document type"
    And Wait for element by text "E-proforma"
    And Click on element by text "E-proforma"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Document type"
    And Click on element by id "nlb-button-primary"
    And Wait for e-invoice to filter
    And Click on first element by id "nlb-title"
    And Wait for element by text "Download as PDF"

    Then Assert element "nlb-date" by id
    And Assert element "nlb-currency" by id
    And Assert element "nlb-title" by id
    And Assert element "nlb-amount" by id
    And Assert element "nlb-details" by id
    And Assert element "nlb-additional-info" by id
    And Assert element by text "Download as PDF"
    And Assert element by text "Download as XML"
    And Assert element by text "Creditor address"
    And Assert that text "Creditor address" has first following sibling that is filled
    And Assert element by text "Creditor account"
    And Assert that text "Creditor account" has first following sibling that is filled
    And Assert element by text "SWIFT (BIC) Code"
    And Assert that text "SWIFT (BIC) Code" has first following sibling that is filled
    And Assert element by text "Reference"
    And Assert that text "Reference" has first following sibling that is filled
    And Assert element by text "Purpose code"
    And Assert that text "Purpose code" has first following sibling that is filled
    And Assert element by text "Issuer name"
    And Assert that text "Issuer name" has first following sibling that is filled
    And Swipe vertical
    And Assert element by text "Issuer account"
    And Assert that text "Issuer account" has first following sibling that is filled
    And Assert element by text "Document type"
    And Assert that text "Document type" has first following sibling that is filled
    And Assert element by text "Document status"
    And Assert that text "Document status" has first following sibling that is filled
    And Assert element by text "E-invoice ID"
    And Assert that text "E-invoice ID" has first following sibling that is filled


    Examples:
      | rowindex |
      | 4        |

  @Payments_E_Invoices_Details_Of_E_Invoices_E-payment_notice_[MOB_ANDROID]
  Scenario Outline: Payments_E_Invoices_Details_Of_E_Invoices_E-payment_notice_[MOB_ANDROID]
    #C75622

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Upcoming payments"
    And Click "E-invoices" content description from view tag "View"
    And Wait for element by text "Cancel e-invoice"
    And Wait for element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "shared_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "shared_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Click filter button in e-invoice list
    And Wait for element by text "Document type"
    And Click on element by text "Document type"
    And Wait for element by text "E-payment notice"
    And Click on element by text "E-payment notice"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Document type"
    And Click on element by id "nlb-button-primary"
    And Wait for e-invoice to filter
    And Click on first element by id "nlb-title"
    And Wait for element by text "Download as PDF"

    Then Assert element "nlb-date" by id
    And Assert element "nlb-currency" by id
    And Assert element "nlb-title" by id
    And Assert element "nlb-amount" by id
    And Assert element "nlb-details" by id
    And Assert element "nlb-additional-info" by id
    And Assert element by text "Download as PDF"
    And Assert element by text "Download as XML"
    And Assert element by text "Creditor address"
    And Assert that text "Creditor address" has first following sibling that is filled
    And Assert element by text "Creditor account"
    And Assert that text "Creditor account" has first following sibling that is filled
    And Assert element by text "SWIFT (BIC) Code"
    And Assert that text "SWIFT (BIC) Code" has first following sibling that is filled
    And Assert element by text "Reference"
    And Assert that text "Reference" has first following sibling that is filled
    And Assert element by text "Purpose code"
    And Assert that text "Purpose code" has first following sibling that is filled
    And Assert element by text "Issuer name"
    And Assert that text "Issuer name" has first following sibling that is filled
    And Assert element by text "Issuer account"
    And Assert that text "Issuer account" has first following sibling that is filled
    And Assert element by text "Document type"
    And Assert that text "Document type" has first following sibling that is filled
    And Swipe vertical
    And Assert element by text "Document status"
    And Assert that text "Document status" has first following sibling that is filled
    And Assert element by text "E-invoice ID"
    And Assert that text "E-invoice ID" has first following sibling that is filled


    Examples:
      | rowindex |
      | 4        |


  @Payments_E_Invoices_Details_Of_E_Invoices_E-credit_note_[MOB_ANDROID]
  Scenario Outline: Payments_E_Invoices_Details_Of_E_Invoices_E-credit_note_[MOB_ANDROID]
    #C75622

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Upcoming payments"
    And Click "E-invoices" content description from view tag "View"
    And Wait for element by text "Cancel e-invoice"
    And Wait for element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "shared_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "shared_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Click filter button in e-invoice list
    And Wait for element by text "Document type"
    And Click on element by text "Document type"
    And Wait for element by text "E-credit note"
    And Click on element by text "E-credit note"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Document type"
    And Click on element by id "nlb-button-primary"
    And Wait for e-invoice to filter
    And Click on first element by id "nlb-title"
    And Wait for element by text "Download as PDF"

    Then Assert element "nlb-date" by id
    And Assert element "nlb-title" by id
    And Assert element "nlb-details" by id
    And Assert element by text "Download as PDF"
    And Assert element by text "Download as XML"
    And Assert element by text "Issuer account"
    And Assert that text "Issuer account" has first following sibling that is filled
    And Assert element by text "Document type"
    And Assert that text "Document type" has first following sibling that is filled
    And Swipe vertical
    And Assert element by text "Document status"
    And Assert that text "Document status" has first following sibling that is filled
    And Assert element by text "E-invoice ID"
    And Assert that text "E-invoice ID" has first following sibling that is filled


    Examples:
      | rowindex |
      | 4        |

  @Payments_E_Invoices_Details_Of_E_Invoices_E-debit_note_[MOB_ANDROID]
  Scenario Outline: Payments_E_Invoices_Details_Of_E_Invoices_E-debit_note_[MOB_ANDROID]
    #C75622

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Upcoming payments"
    And Click "E-invoices" content description from view tag "View"
    And Wait for element by text "Cancel e-invoice"
    And Wait for element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "shared_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "shared_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Click filter button in e-invoice list
    And Wait for element by text "Document type"
    And Click on element by text "Document type"
    And Wait for element by text "E-debit note"
    And Click on element by text "E-debit note"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Document type"
    And Click on element by id "nlb-button-primary"
    And Wait for e-invoice to filter
    And Click on first element by id "nlb-title"
    And Wait for element by text "Download as PDF"

    Then Assert element "nlb-date" by id
    And Assert element "nlb-title" by id
    And Assert element "nlb-details" by id
    And Assert element by text "Download as PDF"
    And Assert element by text "Download as XML"
    And Assert element by text "Issuer account"
    And Assert that text "Issuer account" has first following sibling that is filled
    And Assert element by text "Document type"
    And Assert that text "Document type" has first following sibling that is filled
    And Swipe vertical
    And Assert element by text "Document status"
    And Assert that text "Document status" has first following sibling that is filled
    And Assert element by text "E-invoice ID"
    And Assert that text "E-invoice ID" has first following sibling that is filled


    Examples:
      | rowindex |
      | 4        |

  @Payments_E_Invoices_Options_On_Details_Of_E_Invoices_Mark_As_Paid_[MOB_ANDROID]
  Scenario Outline: Payments_E_Invoices_Options_On_Details_Of_E_Invoices_Mark_As_Paid_[MOB_ANDROID]
    #C75623

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Upcoming payments"
    And Click "E-invoices" content description from view tag "View"
    And Wait for element by text "Cancel e-invoice"
    And Wait for element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "shared_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "shared_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Click filter button in e-invoice list
    And Wait for element by text "Status"
    And Click on element by text "Status"
    And Wait for element by text "Executed"
    And Click on element by text "Executed"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Status"
    And Click on element by id "nlb-button-primary"
    And Wait for e-invoice to filter

    Then Find E-invoice from Excel "<rowindex>" columnName "e_invoice_marked_as_paid_purpose" and "e_invoice_marked_as_paid_amount" and click on it
    And Wait for element by text "Download as PDF"
    And Swipe vertical
    And Assert that text "Document status" has first following sibling with text "Marked as paid"
    And Swipe vertical up
    And Assert element by text "Download as PDF"
    And Assert element by text "Download as XML"
    And Assert element by text "Mark as paid" is not displayed
    And Assert element by text "Reject" is not displayed
    And Assert element by exact text "Pay" is not displayed



    Examples:
      | rowindex |
      | 4        |

  @Payments_E_Invoices_Options_On_Details_Of_E_Invoices_In_Rejection_[MOB_ANDROID]
  Scenario Outline: Payments_E_Invoices_Options_On_Details_Of_E_Invoices_In_Rejection_[MOB_ANDROID]
    #C75623

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Upcoming payments"
    And Click "E-invoices" content description from view tag "View"
    And Wait for element by text "Cancel e-invoice"
    And Wait for element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "shared_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "shared_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Click filter button in e-invoice list
    And Wait for element by text "Status"
    And Click on element by text "Status"
    And Wait for element by text "Rejected"
    And Click on element by text "Rejected"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Status"
    And Click on element by id "nlb-button-primary"
    And Wait for e-invoice to filter

    Then Find E-invoice from Excel "<rowindex>" columnName "e_invoice_in_rejection_purpose" and "e_invoice_in_rejection_amount" and click on it
    And Wait for element by text "Download as PDF"
    And Swipe vertical
    And Assert that text "Document status" has first following sibling with text "In rejection"
    And Swipe vertical up
    And Assert element by text "Download as PDF"
    And Assert element by text "Download as XML"
    And Assert element by text "Mark as paid" is not displayed
    And Assert element by text "Reject" is not displayed
    And Assert element by exact text "Pay" is not displayed



    Examples:
      | rowindex |
      | 4        |

  @Payments_E_Invoices_Options_On_Details_Of_E_Invoices_Rejected_[MOB_ANDROID]
  Scenario Outline: Payments_E_Invoices_Options_On_Details_Of_E_Invoices_Rejected_[MOB_ANDROID]
    #C75623

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Upcoming payments"
    And Click "E-invoices" content description from view tag "View"
    And Wait for element by text "Cancel e-invoice"
    And Wait for element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "shared_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "shared_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Click filter button in e-invoice list
    And Wait for element by text "Status"
    And Click on element by text "Status"
    And Wait for element by text "Rejected"
    And Click on element by text "Rejected"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Status"
    And Click on element by id "nlb-button-primary"
    And Wait for e-invoice to filter

    Then Find E-invoice from Excel "<rowindex>" columnName "e_invoice_rejected_purpose" and "e_invoice_rejected_amount" and click on it
    And Wait for element by text "Download as PDF"
    And Swipe vertical
    And Assert that text "Document status" has first following sibling with text "Rejected"
    And Swipe vertical up
    And Assert element by text "Download as PDF"
    And Assert element by text "Download as XML"
    And Assert element by text "Mark as paid" is not displayed
    And Assert element by text "Reject" is not displayed
    And Assert element by exact text "Pay" is not displayed



    Examples:
      | rowindex |
      | 4        |

  @Payments_E_Invoices_Options_On_Details_Of_E_Invoices_Payment_Sent_[MOB_ANDROID]
  Scenario Outline: Payments_E_Invoices_Options_On_Details_Of_E_Invoices_Payment_Sent_[MOB_ANDROID]
    #C75623

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Upcoming payments"
    And Click "E-invoices" content description from view tag "View"
    And Wait for element by text "Cancel e-invoice"
    And Wait for element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "shared_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "shared_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Click filter button in e-invoice list
    And Wait for element by text "Status"
    And Click on element by text "Status"
    And Wait for element by text "Executed"
    And Click on element by text "Executed"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Status"
    And Click on element by id "nlb-button-primary"
    And Wait for e-invoice to filter

    Then Find E-invoice from Excel "<rowindex>" columnName "e_invoice_payment_sent_purpose" and "e_invoice_payment_sent_amount" and click on it
    And Wait for element by text "Download as PDF"
    And Swipe vertical
    And Assert that text "Document status" has first following sibling with text "Payment sent"
    And Swipe vertical up
    And Assert element by text "Download as PDF"
    And Assert element by text "Download as XML"
    And Assert element by text "Mark as paid" is not displayed
    And Assert element by text "Reject" is not displayed
    And Assert element by exact text "Pay" is not displayed



    Examples:
      | rowindex |
      | 4        |


  @Payments_E_Invoices_Options_On_Details_Of_E_Invoices_Waiting_For_Payment_[MOB_ANDROID]
  Scenario Outline: Payments_E_Invoices_Options_On_Details_Of_E_Invoices_Waiting_For_Payment_[MOB_ANDROID]
    #C75623

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Upcoming payments"
    And Click "E-invoices" content description from view tag "View"
    And Wait for element by text "Cancel e-invoice"
    And Wait for element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "shared_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "shared_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Click filter button in e-invoice list
    And Wait for element by text "Status"
    And Click on element by text "Status"
    And Wait for element by text "Waiting for payment"
    And Click on element by text "Waiting for payment"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Status"
    And Click on element by id "nlb-button-primary"
    And Wait for e-invoice to filter

    Then Click on first element by id "nlb-title"
    And Wait for element by text "Download as PDF"
    And Assert element by text "Download as PDF"
    And Assert element by text "Download as XML"
    And Assert element by text "Mark as paid"
    And Assert element by text "Reject"
    And Assert element by text "Pay"



    Examples:
      | rowindex |
      | 4        |


  @Payments_E_Invoices_Mark_As_Paid_E_Invoices_[MOB_ANDROID]
  Scenario Outline: Payments_E_Invoices_Mark_As_Paid_E_Invoices_[MOB_ANDROID]
    #C75625
    #BUG redirekcija posle mark as paid, ostane na istoj stranici

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Upcoming payments"
    And Click "E-invoices" content description from view tag "View"
    And Wait for element by text "Cancel e-invoice"
    And Wait for element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "shared_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "shared_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Click filter button in e-invoice list
    And Wait for element by text "Status"
    And Click on element by text "Status"
    And Wait for element by text "Waiting for payment"
    And Click on element by text "Waiting for payment"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Status"
    And Click on element by id "nlb-button-primary"
    And Wait for e-invoice to filter
    And Click on first element by id "nlb-title"
    And Wait for element by text "Mark as paid"
    And Wait for element by id "nlb-title" to appear
    And Remember element attribute "text" by id "nlb-title" under key "e_invoice_purpose"
    And Remember element attribute "text" by id "nlb-amount" in txt under key "e_invoice_amount"
    And Remember text of first following sibling of element by text "Creditor address" in txt under key "e_invoice_creditor_address"
    And Remember text of first following sibling of element by text "Creditor account" in txt under key "e_invoice_creditor_account"
    And Remember text of first following sibling of element by text "Creditor BIC" in txt under key "e_invoice_creditor_bic"
    And Remember text of first following sibling of element by text "Creditor reference" in txt under key "e_invoice_creditor_reference"
    And Swipe vertical
    And Remember text of first following sibling of element by text "Purpose code" in txt under key "e_invoice_purpose_code"
    And Remember text of first following sibling of element by text "Issuer name" in txt under key "e_invoice_issuer_name"
    And Remember text of first following sibling of element by text "Issuer account" in txt under key "e_invoice_issuer_account"
    And Remember text of first following sibling of element by text "Document type" in txt under key "e_invoice_document_type"
    And Remember text of first following sibling of element by text "Document ID" in txt under key "e_invoice_document_id"
    And Swipe vertical up

    Then Click on element by text "Mark as paid"
    And Assert element by text "E-document is marked as paid"
    #And Click "Back" content description from view tag "View"
    And Wait for element by id "nlb-title" to appear
    And Click filter button in e-invoice list
    And Wait for element by text "Status"
    And Click on element by text "Status"
    And Wait for element by text "Waiting for payment"
    And Click on element by text "Waiting for payment"
    And Click on element by text "Executed"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Status"
    And Click on element by id "nlb-button-primary"
    And Wait for e-invoice to filter
    And Scroll down until element with text from key "e_invoice_purpose" is in view
    And Click on element by text from key "e_invoice_purpose"
    And Wait for element by text "Download as PDF"
    And Assert that text "Creditor account" has first following sibling with text from key "e_invoice_creditor_account"
    And Assert that text "Creditor BIC" has first following sibling with text from key "e_invoice_creditor_bic"
    And Assert that text "Creditor reference" has first following sibling with text from key "e_invoice_creditor_reference"
    And Swipe vertical
    And Assert that text "Purpose code" has first following sibling with text from key "e_invoice_purpose_code"
    And Assert that text "Issuer name" has first following sibling with text from key "e_invoice_issuer_name"
    And Assert that text "Issuer account" has first following sibling with text from key "e_invoice_issuer_account"
    And Assert that text "Document type" has first following sibling with text from key "e_invoice_document_type"
    And Assert that text "Document ID" has first following sibling with text from key "e_invoice_document_id"
    And Assert that text "Document status" has first following sibling that contains text "Marked as paid"


    Examples:
      | rowindex |
      | 4        |

  @Payments_E_Invoices_Reject_E_Invoices_Waiting_For_Payment_[MOB_ANDROID]
  Scenario Outline: Payments_E_Invoices_Reject_E_Invoices_Waiting_For_Payment_[MOB_ANDROID]
    #C75626

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Upcoming payments"
    And Click "E-invoices" content description from view tag "View"
    And Wait for element by text "Cancel e-invoice"
    And Wait for element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "shared_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "shared_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Click filter button in e-invoice list
    And Wait for element by text "Status"
    And Click on element by text "Status"
    And Wait for element by text "Waiting for payment"
    And Click on element by text "Waiting for payment"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Status"
    And Click on element by id "nlb-button-primary"
    And Wait for e-invoice to filter
    And Click on first element by id "nlb-title"
    And Wait for element by text "Mark as paid"
    And Wait for element by id "nlb-title" to appear

    Then Click on element by text "Reject"
    And Wait for element by id "nlb-text-field-with-max-char" to appear
    And Assert element by text "Write a short rejection reason that will be sent to the issuer."
    And Assert element by text "Your Message"
    And Assert element by text "0/250 znakov"
    And Enter text "This is a test" in element id "nlb-text-field-with-max-char"
    And Assert element by text "14/250 znakov"
    And Click on element by text "Confirm"
    And Assert element by text "Rejection was sent to the issuer."
    And Wait for element by id "nlb-title" to appear
    And Swipe vertical
    And Assert that text "Document status" has first following sibling that contains text "In rejection"

    Examples:
      | rowindex |
      | 4        |


  @Payments_E_Invoices_Reject_E_Invoices_Executed_[MOB_ANDROID]
  Scenario Outline: Payments_E_Invoices_Reject_E_Invoices_Executed_[MOB_ANDROID]
    #C75626

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Upcoming payments"
    And Click "E-invoices" content description from view tag "View"
    And Wait for element by text "Cancel e-invoice"
    And Wait for element by text from excel "<rowindex>" columnName "personal_account_iban"
    And Click on Account selector in Payment list
    And Wait for element by text "Select account"
    And Scroll until element with text from excel "<rowindex>" columnName "shared_account_iban" is in view
    And Click on element by text from excel "<rowindex>" columnName "shared_account_iban"
    And Wait for element by id "nlb-title" to appear
    And Click filter button in e-invoice list
    And Wait for element by text "Status"
    And Click on element by text "Status"
    And Wait for element by text "Executed"
    And Click on element by text "Executed"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Status"
    And Click on element by text "Document type"
    And Wait for element by text "E-credit note"
    And Click on element by text "E-credit note"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Status"
    And Click on element by id "nlb-button-primary"
    And Wait for e-invoice to filter
    And Click on first element by id "nlb-title"
    And Wait for element by text "Reject"
    And Wait for element by id "nlb-title" to appear

    Then Click on element by text "Reject"
    And Wait for element by id "nlb-text-field-with-max-char" to appear
    And Assert element by text "Write a short rejection reason that will be sent to the issuer."
    And Assert element by text "Your Message"
    And Assert element by text "0/250 znakov"
    And Enter text "This is a test" in element id "nlb-text-field-with-max-char"
    And Assert element by text "14/250 znakov"
    And Click on element by text "Confirm"
    And Assert element by text "Rejection was sent to the issuer."
    And Wait for element by id "nlb-title" to appear
    And Swipe vertical
    And Assert that text "Document status" has first following sibling that contains text "In rejection"

    Examples:
      | rowindex |
      | 4        |