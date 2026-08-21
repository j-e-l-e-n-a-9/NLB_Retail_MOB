Feature: Mobile_Login

  @Mobile_Login-Generate_OTP-mToken_From_Login_Screen_[MOB_ANDROID]
  Scenario Outline: Mobile_Login-Generate_OTP-mToken_From_Login_Screen_[MOB_ANDROID]

    Given Open Application
    And Click on element by contains text "Continue to the app"
    And Wait for element by text "mToken"
    And Assert element by content desc "NLB logo"
    And Assert element by text "mToken"
    And Assert element by text "Login to NLB Klik"

    When Click on element by text "mToken"
    And Wait for element by text "Enter PIN"
    And Enter PIN

    Then Wait for element by text "One-time password"
    And Assert OTP container is correct

    Examples:
      | rowindex |
      |        1 |


    # Incorrect pin upozorenje se ne pojavljuje
    # stabilizovano do koraka And Assert element by text "Incorrect PIN"
  @Mobile_Login-Generate_OTP-Inside_30_Seconds_[MOB_ANDROID]
  Scenario Outline: Mobile_Login-Generate_OTP-Inside_30_Seconds_[MOB_ANDROID]

    Given Open Application
    And Click on element by contains text "Continue to the app"
    And Wait for element by text "mToken"
    And Assert element by content desc "NLB logo"
    And Assert element by text "mToken"
    And Assert element by text "Login to NLB Klik"

    When Click on element by text "mToken"
    And Wait for element by text "Enter PIN"
    And Enter wrong PIN
    And Wait for element by text "Enter PIN"
    And Assert element by text "Incorrect PIN"
    And Enter PIN

    Then Wait for element by text "One-time password"
    And Assert OTP container is correct

    Examples:
      | rowindex |
      |        1 |