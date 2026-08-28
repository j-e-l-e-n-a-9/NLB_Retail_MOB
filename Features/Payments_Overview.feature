Feature: Payments_Overview

  @Payments_Payments_Overview_[MOB_ANDROID]
  Scenario Outline: Payments_Payments_Overview_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click on element by text "Pay"
    And Wait for element by text "Domestic payment"
    And Assert element by text "Payments and transfers"
    And Assert Payments and transfers option buttons in Pay screen

    Then Assert element by text "Overview and edit"
    And Assert Overview and edit option buttons in Pay screen
    And Click on element by text "Past payments"
    And Wait for first Past payment or No past payments text
    And Click on Account selector in Payment list
    And Wait "1" seconds
    And Assert accounts are sorted by type in account selector

    Examples:
      | rowindex |
      |        1 |