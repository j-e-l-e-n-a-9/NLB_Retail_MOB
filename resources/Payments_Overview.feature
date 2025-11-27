Feature: Payments_Overview

  @Payments_Payments_Overview_[MOB_ANDROID]
  Scenario Outline: Payments_Payments_Overview_[MOB_ANDROID]
    #C75524

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Pay" content description from view tag "View"
    And Wait for element by text "Pay or transfer"

    And Assert "Pay or transfer" content description from view tag "View" is displayed
    And Assert element by text "Pay or transfer"
    And Assert "Photo pay" content description from view tag "View" is displayed
    And Assert element by text "Photo pay"
    And Assert "Repeat payment" content description from view tag "View" is displayed
    And Assert element by text "Repeat payment"
    And Assert "E-invoices" content description from view tag "View" is displayed
    And Assert element by text "E-invoices"
    And Assert "Flik" content description from view tag "View" is displayed
    And Assert element by text "Flik"
    #And Assert "Charity" content description from view tag "View" is displayed
    #And Assert element by text "Charity"
    And Assert element by text "Review and manage"
    And Assert element by text "Past payments"
    And Assert element by text "Upcoming payments"
    And Assert element by text "Standing orders"
    And Assert element by text "Recipients"


    Examples:
      | rowindex |
      | 1        |