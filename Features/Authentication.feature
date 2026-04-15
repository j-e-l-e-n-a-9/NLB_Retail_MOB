Feature: Authentication

  @Authentication-Mobile_Login-Logout_[MOB_ANDROID]
  Scenario Outline: Authentication-Mobile_Login-Logout_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load

#    When Click on profile icon for user from Excel "<rowindex>" columnName "username"
    When Click on profile icon
    And Wait for element by text "Error"
    And Click on element by text "OK"
    
    Then Wait for element by text "Logout"
    And Click on element by id "nlb-button-alternate"
    And Wait for element by text "Login to NLB Klik"
    And Assert element by text "Login to NLB Klik"

    Examples:
      | rowindex |
      |        1 |


  @Authentication-Login_In_MOB-Login_Page_[MOB_ANDROID]
  Scenario Outline: Authentication-Login_In_MOB-Login_Page_[MOB_ANDROID]

    Given Open Application
    And Assert "NLB logo" content description from tag "ImageView" is displayed
    And Assert text "Security confirmations" in element by id "nlb-button-text" with descendant TextView widget
    And Assert text "One-time password" in element by id "nlb-button-alternate" with descendant TextView widget

    When Assert element by text "Login to NLB Klik"
    And Assert hamburger menu is displayed

    Then Click on element by text "Login to NLB Klik"
    And Assert element by content desc "NLB logo"
    And Assert element by text "Enter PIN"
    And Assert text "Forgot PIN?" in element id "forgot-pin-button"
    And Enter PIN
    And Wait for My NLB screen to load
    And Wait "2" seconds
    And Assert element by text "All transactions"

    Examples:
      | rowindex |
      |        1 |


  @Authentication-Login_With_PIN_[MOB_ANDROID]
  Scenario Outline: Authentication-Login_With_PIN_[MOB_ANDROID]

    Given Open Application
    And Assert "NLB logo" content description from tag "ImageView" is displayed
    And Assert text "Security confirmations" in element by id "nlb-button-text" with descendant TextView widget
    And Assert text "One-time password" in element by id "nlb-button-alternate" with descendant TextView widget

    When Assert element by text "Login to NLB Klik"
    And Assert hamburger menu is displayed

    Then Click on element by text "Login to NLB Klik"
    And Assert element by content desc "NLB logo"
    And Assert element by text "Enter PIN"
    And Assert text "Forgot PIN?" in element id "forgot-pin-button"
    And Enter PIN
    And Wait for My NLB screen to load
    And Wait "2" seconds
    And Assert element by text "All transactions"

    Examples:
      | rowindex |
      |        1 |