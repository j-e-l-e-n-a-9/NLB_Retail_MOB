Feature: Security_And_Authentication

  @Security_And_Authentication_Login_Page_Design_And_Elements_[MOB_ANDROID]
  Scenario Outline: Security_And_Authentication_Login_Page_Design_And_Elements_[MOB_ANDROID]

    Given Open Application

    When Click on element by text "Continue to the app"

    Then Assert "NLB logo" content description from tag "ImageView" is displayed
    And Assert text "Security confirmations" in element by id "nlb-button-text" with descendant TextView widget
    And Assert text "One time password OTP" in element by id "nlb-button-alternate" with descendant TextView widget
    And Assert text "One time password OTP" in element by id "nlb-button-alternate" with descendant TextView widget
    And Assert element by text "Login to NLB Klik"
    And Click on "4" android widget button
    #And Assert "Dropdown menu" content description from view tag "View" has descendant with text "Slovenian" Bilo je pre
    And Assert element by id "nlb-dropdown-menu" that has descendant text "Slovenian"
    And Click "Expand dropdown menu" content description from tag "ImageView"
    And Assert element by text "English"
    And Assert element by text "Slovenian"
    And Go Back
    And Assert text "About Us" in element id "onAboutUsClick"
    And Assert text "Digital bank safety" in element id "onDigitalBankSafetyClick"
    And Assert text "Privacy policy" in element id "onPrivacyPolicyClick"
    And Assert text "FAQ" in element id "onFaqClick"
    And Assert "Mail" content description from view tag "View" is displayed
    And Assert element by text "info@nlb.si"
    And Assert "Phone" content description from view tag "View" is displayed
    And Assert element by text "01 477 20 00"

    Examples:
      | rowindex |
      |        4 |

  @Security_And_Authentication_Login_With_Pin_[MOB_ANDROID]
  Scenario Outline: Security_And_Authentication_Login_With_Pin_[MOB_ANDROID]
    #C71383

    Given Open Application

    #When Click on element by text "Continue to the app"
    And Click on element by text "Login to NLB Klik"
    And Wait for element by text "Enter PIN" to appear for "30" seconds
    And Click "Back" content description from view tag "View"
    And Wait for element by text "Login to NLB Klik" to appear for "30" seconds
    And Click on element by text "Login to NLB Klik"
    And Wait for element by text "Enter PIN" to appear for "30" seconds

    Then Assert "NLB logo" content description from tag "ImageView" is displayed
    And Assert element by text "Enter PIN"
    And Assert text "Forgot PIN?" in element id "forgot-pin-button"
    And Send PIN from Excel "<rowindex>" columnName "pin_correct"
    And Wait for element by text "My NLB"
    And Assert element by text "My NLB"

    Examples:
      | rowindex |
      |        4 |

  @Security_And_Authentication_Forgot_Pin_[MOB_ANDROID]
  Scenario Outline: Security_And_Authentication_Forgot_Pin_[MOB_ANDROID]

    Given Open Application

    #When Click on element by text "Continue to the app"
    And Click on element by text "Login to NLB Klik"
    And Wait for element by text "Forgot your PIN?" to appear for "30" seconds

    Then Assert text "Forgot your PIN?" in element id "forgot-pin-button"
    And Click on element by id "forgot-pin-button"
    And Assert element by text "Forgot PIN?"
    And Assert element by text "In case you forgot your PIN, you will have to re-activate mobile application. First you will need to get a new activation code and serial number. Your request issuing the codes via a call to NLB contact center or in our branch. Once you receive the codes, you can click below on Enter codes button to enter them and set new PIN."
    And Assert element by text "Cancel"
    And Assert element by text "Enter codes"
    And Assert element by text "Call"
    And Click on element by text "Cancel"
    And Assert element by text "Enter PIN"
    And Click on element by id "forgot-pin-button"
    And Click on element by text "Enter codes"
    And Assert element by text "Enter codes"
    And Assert element by text "Are you sure you want to enter new activation codes? After this action, your PIN will be reset."
    And Assert element by text "Cancel"
    And Assert element by text "Continue"
    And Click on element by text "Cancel"
    And Assert element by text "Enter PIN"

    Examples:
      | rowindex |
      |        4 |


  @Security_And_Authentication_Logout_[MOB_ANDROID]
  Scenario Outline: Security_And_Authentication_Logout_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My profile" content description from view tag "View"
    And Wait for element by text "Logout"

    Then Click on element by text "Logout"
    And Wait for element by text "Login to NLB Klik"
    And Assert element by text "Login to NLB Klik"

    Examples:
      | rowindex |
      |        4 |


  @Security_And_Authentication_Generate_OTP_[MOB_ANDROID]
  Scenario Outline: Security_And_Authentication_Generate_OTP_[MOB_ANDROID]
    #C71394

    Given Open Application

    #When Click on element by text "Continue to the app"
    And Wait for element by text "One-time password"
    And Click on element by text "One-time password"
    And Wait for element by text "Enter PIN"
    And Assert element by text "Enter PIN"
    And Assert "NLB logo" content description from tag "ImageView" is displayed
    And Assert element by text "Forgot PIN?"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "One-time password"
    And Click on element by text "One-time password"
    And Wait for element by text "Enter PIN"
    And Assert element by text "Enter PIN"
    And Send PIN from Excel "<rowindex>" columnName "pin_correct"
    And Wait for element by text "One-time password"

    Then Assert element by text "One-time password"
    And Assert OTP container is correct


    Examples:
      | rowindex |
      |        4 |

  @Security_And_Authentication_Generate_OTP-invalid_[MOB_ANDROID]
  Scenario Outline: Security_And_Authentication_Generate_OTP-invalid_[MOB_ANDROID]
    #C71384
    #TODO

    When Click on element by text "Continue to the app"
    And Wait for element by text "One time password OTP"
    And Click on element by text "One time password OTP"
    And Wait for element by text "Enter PIN"
    And Assert element by text "Enter PIN"
    And Assert "NLB logo" content description from tag "ImageView" is displayed
    And Assert element by text "Forgot your PIN?"
    And Click "Back" content description from view tag "View"
    And Wait for element by text "One time password OTP"
    And Click on element by text "One time password OTP"
    And Wait for element by text "Enter PIN"
    And Assert element by text "Enter PIN"
    And Send PIN from Excel "<rowindex>" columnName "pin_wrong"
    And Wait for element by text "One-time password OTP"

    Then Assert element by text "One-time password OTP"
    And Assert OTP container is correct
    And Try wrong otp on web page from excel "<rowindex>" columnName "webpage"

    Examples:
      | rowindex |
      |        4 |
    
  @Security_And_Authentication_Session_Expired_Due_To_Inactivity_[MOB_ANDROID]
  Scenario Outline: Security_And_Authentication_Session_Expired_Due_To_Inactivity_[MOB_ANDROID]
    #C71391

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    
    When Wait "240" seconds

    Then Assert element by text "Your session is about to expire"
    And Assert element by widget "ProgressBar"
    And Assert element by text "0 s"
    And Assert element by text "1 min"
    And Assert element by contains text with special characters "You will be signed out due to inactivity. Click Resume to continue your work."
    And Assert element by text "Resume"
    And Wait "55" seconds
    And Assert element by text "Alert"
    #And Assert element by text "You have been logged out due to inactivity."
    And Assert text "One-time password" in element by id "nlb-button-alternate" with descendant TextView widget

    Examples:
      | rowindex |
      |        4 |

  @Security_And_Authentication_Session_Expired_Due_To_Inactivity_Resume_Activity_[MOB_ANDROID]
  Scenario Outline: Security_And_Authentication_Session_Expired_Due_To_Inactivity_Resume_Activity_[MOB_ANDROID]
    #C71391

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Wait "240" seconds

    Then Assert element by text "Your session is about to expire"
    And Click on element by text "Resume"
    And Click "My Products" content description from view tag "View"

    Examples:
      | rowindex |
      |        4 |