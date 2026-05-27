Feature: Upcoming_Payments

  @Payments_Upcoming_Payments_List_Of_Transactions_[MOB_ANDROID]
  Scenario Outline: Payments_Upcoming_Payments_List_Of_Transactions_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click on Bottom navigation button "Pay"
    And Wait for element by text "Upcoming payments"
    And Click on element by text "Upcoming payments"
    And Wait for element by id "nlb-date" to appear
    And Assert current month on page
    And Remember transaction header sum for upcoming payments under key "upcoming_sum"
    And Assert list of element by id element by id "nlb-date" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert list of element by id element by id "nlb-currency" with regex "^[A-Z]{3}$"
    And Assert list of element by id element by id "nlb-amount" with regex "^[\-−]?(?:0|[1-9]\d{0,2}(?:\.\d{3})*),\d{2}$"
    And Assert list of element by id element by id "nlb-title" with regex "^.*$"
    And Assert list of element by id element by id "nlb-details" with regex "^.*$"
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Wait for element by text from excel "<rowindex>" columnName "auth_personal_account_number"
    And Click on element by text from excel "<rowindex>" columnName "auth_personal_account_number"
    And Wait for element by id "nlb-date" to appear
    And Assert transaction header sum for upcoming payments is different from one under key "upcoming_sum"

    Then Assert list of element by id element by id "nlb-date" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert list of element by id element by id "nlb-currency" with regex "^[A-Z]{3}$"
    And Assert list of element by id element by id "nlb-amount" with regex "^[\-−]?(?:0|[1-9]\d{0,2}(?:\.\d{3})*),\d{2}$"
    And Assert list of element by id element by id "nlb-title" with regex "^.*$"
    And Assert list of element by id element by id "nlb-details" with regex "^.*$"

    Examples:
      | rowindex |
      |        4 |


  @Payments_Upcoming_Payments_Cancel_Payment_[MOB_ANDROID]
  Scenario Outline: Payments_Upcoming_Payments_Cancel_Payment_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click on Bottom navigation button "Pay"
    And Wait for element by text "Upcoming payments"
    And Click on element by text "Upcoming payments"
    And Wait for element by id "nlb-date" to appear
    And Assert current month on page
    And Remember transaction header sum for upcoming payments under key "upcoming_sum"
    And Assert list of element by id element by id "nlb-date" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert list of element by id element by id "nlb-currency" with regex "^[A-Z]{3}$"
    And Assert list of element by id element by id "nlb-amount" with regex "^[\-−]?(?:0|[1-9]\d{0,2}(?:\.\d{3})*),\d{2}$"
    And Assert list of element by id element by id "nlb-title" with regex "^.*$"
    And Assert list of element by id element by id "nlb-details" with regex "^.*$"
    And Click on element by text from excel "<rowindex>" columnName "currentDomesticAccountBBAN"
    And Wait for element by text from excel "<rowindex>" columnName "auth_personal_account_number"
    And Click on element by text from excel "<rowindex>" columnName "auth_personal_account_number"
    And Wait for element by id "nlb-date" to appear
    And Assert transaction header sum for upcoming payments is different from one under key "upcoming_sum"

    Then Assert list of element by id element by id "nlb-date" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert list of element by id element by id "nlb-currency" with regex "^[A-Z]{3}$"
    And Assert list of element by id element by id "nlb-amount" with regex "^[\-−]?(?:0|[1-9]\d{0,2}(?:\.\d{3})*),\d{2}$"
    And Assert list of element by id element by id "nlb-title" with regex "^.*$"
    And Assert list of element by id element by id "nlb-details" with regex "^.*$"

    Examples:
      | rowindex |
      |        4 |