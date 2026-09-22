Feature: Authentication

  @Authentication-Mobile_Login-Logout_[MOB_ANDROID]
  Scenario Outline: Authentication-Mobile_Login-Logout_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load

    When Click on profile icon
    And Wait for element by text "Logout"
    And Click on element by id "nlb-button-alternate"

    Then Wait for element by text "Login to NLB Klik"
    And Assert element by text "Login to NLB Klik"

    Examples:
      | rowindex |
      |        1 |


  @Authentication-Login_In_MOB-Login_Page_[MOB_ANDROID]
  Scenario Outline: Authentication-Login_In_MOB-Login_Page_[MOB_ANDROID]

    Given Open Application
    And Assert "NLB logo" content description from tag "ImageView" is displayed
#    And Assert text "Security confirmations" in element by id "nlb-button-text" with descendant TextView widget
    And Assert element by text "mToken"
#    And Assert text "One-time password" in element by id "nlb-button-alternate" with descendant TextView widget

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
    And Click on element by contains text "Continue"
    And Wait for element by text "mToken"
    And Assert "NLB logo" content description from tag "ImageView" is displayed
#    And Assert text "Security confirmations" in element by id "nlb-button-text" with descendant TextView widget
#    And Assert text "One-time password" in element by id "nlb-button-alternate" with descendant TextView widget

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


  @Authentication_Mobile_Login_Forgot_PIN_[MOB_ANDROID]
  Scenario Outline: Authentication_Mobile_Login_Forgot_PIN_[MOB_ANDROID]

    Given Open Application
    And Click login button
    And Wait for element by contains text "Forgot PIN?"

    When Click on element by contains text "Forgot PIN?"
    And Wait for element by contains text "Forgot your PIN?"
    And Assert element by contains text "In case you forgot your PIN, you will have to re-activate mobile application."
    And Click on element by contains text "Cancel"
    And Wait for element by contains text "Forgot PIN?"
    And Click on element by contains text "Forgot PIN?"
    And Wait for element by contains text "Forgot your PIN?"

    Then Assert element by contains text "Enter code"
    And Click on element by text "Call"
    And Wait element by contains Content desc "backspace" for "8" seconds
    And Assert element by contains text "011 2018 600"

    Examples:
      | rowindex |
      |        1 |