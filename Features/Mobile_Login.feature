Feature: Mobile_Login

  @Mobile_Login-Generate_OTP-mToken_From_Login_Screen_[MOB_ANDROID]
  Scenario Outline: Mobile_Login-Generate_OTP-mToken_From_Login_Screen_[MOB_ANDROID]

    Given Open Application
    And Assert element by content desc "NLB logo"
    And Assert element by text "Security confirmations"
    And Assert element by text "One-time password"
    And Assert element by text "Login to NLB Klik"

    When Click on element by text "One-time password"
    And Enter PIN

    Then Wait for element by text "One Time Password"
    And Assert OTP container is correct

    Examples:
      | rowindex |
      |        1 |