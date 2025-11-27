Feature: PSD2_Base

  @Android-PSD2_Login-vnos_pravilnih_podatkov
  Scenario Outline: Android-PSD2_Login-vnos_pravilnih_podatkov
    #C76392

    Given Send TPP Registration API call
    And Send Login call
    And TPP Create Consent on Android and expect failure
    And Send Login call
    And TPP Create Consent on android

    When Start PSD2 app
    And Assert element by text "Confirm access to your account The app wants to access your account. You need to login mobile bank. "
    And Assert element by text "Need help?"
    And Assert element by text "Forgotten credentials?"
    And Assert element by text "Login to NLB Klik"
    And Assert element by text "Cancel"
    And Click on element by text "Login to NLB Klik"
    And Wait for element by text "Enter PIN"
    And Assert element by text "Enter PIN"
    And Assert element "forgot-pin-button" by id

    Then Enter PIN
    And Wait for Role selector or Consent screen and assert

    Examples:
      | rowindex |
      |        4 |

  @Android-PSD2_Login-napacni_vnos
  Scenario Outline: Android-PSD2_Login-napacni_vnos
    #C76393

    Given Send TPP Registration API call
    And Send Login call
    And TPP Create Consent on Android and expect failure
    And Send Login call
    And TPP Create Consent on android

    When Start PSD2 app
    And Wait for element by text "Login to NLB Klik"
    And Click on element by text "Login to NLB Klik"
    And Wait for element by text "Enter PIN"

    Then Enter PIN "<rowindex>" from "pin_wrong" column
    And Assert element by text "Attempts remaining: 4 "
    And Click on element by text "OK"
    And Wait for element by text "Enter PIN"
    And Enter PIN
    And Wait for Role selector or Consent screen and assert

    Examples:
      | rowindex |
      |        4 |