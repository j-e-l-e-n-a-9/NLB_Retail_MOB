#Feature: General
#
#  @General-Login_Page_Elements-Buttons-Activated_Users_[MOB_ANDROID]
#  Scenario Outline: General-Login_Page_Elements-Buttons-Activated_Users_[MOB_ANDROID]
#
#    Given Open Application
#    And Assert "NLB logo" content description from tag "ImageView" is displayed
##    And Assert text "Security confirmations" in element by id "nlb-button-text" with descendant TextView widget
##    And Assert text "One-time password" in element by id "nlb-button-alternate" with descendant TextView widget
#    And Assert element by text "Login to NLB Klik"
#    And Assert hamburger menu is displayed
#    And Click on hamburger menu
##    And Click on "4" android widget button
#
#    When Assert element by id "nlb-dropdown-menu" that has descendant text "English"
#    And Click on element by id "nlb-dropdown-menu"
#    And Assert element by text "English"
#    And Assert element by text "Serbian"
#    And Go Back
#    And Assert text "About us" in element id "onAboutUsClick"
#    And Assert text "Digital bank safety" in element id "onDigitalBankSafetyClick"
#    And Assert text "Privacy policy" in element id "onPrivacyPolicyClick"
#    And Assert text "App analytics" in element id "onAnalyticsClick"
#    And Assert text "FAQ" in element id "onFaqClick"
#    And Assert "Mail" content description from view tag "View" is displayed
#    And Assert element by text "info@nlb.si"
#    And Assert "Phone" content description from view tag "View" is displayed
#    And Assert element by text "01 477 20 00"
#
#    Then Click on hamburger menu
#    And Click on element by text "mToken"
#    And Assert element by content desc "NLB Logo"
#    And Assert element by text "Enter your 8-digit mToken PIN"
#    And Enter PIN
#    And Wait for element by text "One Time Password"
#    And Assert OTP container is correct without waiting
##    And Click on element by desc "Back"
#    And Go Back
#
#    And Click on element by text "Login to NLB Klik"
#    And Assert element by content desc "NLB logo"
#    And Assert element by text "Enter PIN"
#    And Assert text "Forgot PIN?" in element id "forgot-pin-button"
#    And Enter PIN
#    And Wait for My NLB screen to load
#    And Wait "2" seconds
#    And Assert element by text "All transactions"
#
#    Examples:
#      | rowindex |
#      |        1 |