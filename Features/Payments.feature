Feature: Payments

  @Payments-Scan_And_Pay-Camera_Permission_Reject_[MOB_ANDROID]
  Scenario Outline: Payments-Scan_And_Pay-Camera_Permission_Reject_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load

    When Click on element in bottom menu by text "Pay"
    And Click on element by text "IPS Payments"

    Then Assert element by text "Scan"
    And Assert element by text "Show"
    And Assert element by text "Import from gallery"
    And Click on element by text "Show"
    And Assert button by text "Continue" is enabled
    And Assert element by contains text "The payment will be completed only after your confirmation. Do you want to continue?"

    Examples:
      | rowindex |
      |        1 |


  @Payments-Scan_And_Pay-Successful_Payment_Via_The_Scan_And_Pay_Option_[MOB_ANDROID]
  Scenario Outline: Payments-Scan_And_Pay-Successful_Payment_Via_The_Scan_And_Pay_Option_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load

    When Click on element in bottom menu by text "Pay"
    And Wait element "Domestic payment" by text
    And Click on element by text "IPS Payments"

    Then Assert element by text "IPS payment"
    And Assert element by text "Scan"
    And Assert element by text "Show"
    And Assert element by text "Import from gallery"
    And Click on element by text "Show"
    And Assert button by text "Continue" is enabled
    And Click on element by desc "Back"
    And Wait element "Domestic payment" by text

    Examples:
      | rowindex |
      |        2 |


  @Payments-Scan_And_Pay-Payment_Via_The_Scan_And_Pay_Option-invalid_[MOB_ANDROID]
  Scenario Outline: Payments-Scan_And_Pay-Payment_Via_The_Scan_And_Pay_Option-invalid_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load

    When Click on element in bottom menu by text "Pay"
    And Wait element "Domestic payment" by text
    And Click on element by text "IPS Payments"

    Then Assert element by text "IPS payment"
    And Assert element by text "Scan"
    And Assert element by text "Show"
    And Assert element by text "Import from gallery"
    And Click on element by text "Show"
    And Assert button by text "Continue" is enabled
    And Click on element by desc "Back"
    And Wait element "Domestic payment" by text

    Examples:
      | rowindex |
      |        3 |


  @Payments-Scan_And_Pay-QR_Code_Not_Recognized_[MOB_ANDROID]
  Scenario Outline: Payments-Scan_And_Pay-QR_Code_Not_Recognized_[MOB_ANDROID]

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for My NLB screen to load

    When Click on element in bottom menu by text "Pay"
    And Wait element "Domestic payment" by text
    And Click on element by text "IPS Payments"

    Then Assert element by text "IPS payment"
    And Assert element by text "Scan"
    And Assert element by text "Show"
    And Assert element by text "Import from gallery"
    And Click on element by text "Show"
    And Assert button by text "Continue" is enabled
    And Click on element by desc "Back"
    And Wait element "Domestic payment" by text

    Examples:
      | rowindex |
      |        4 |