Feature: Term_Deposits_Accounts

  @Term_Deposits_Lists_[MOB_ANDROID]
  Scenario Outline: Term_Deposits_Lists_[MOB_ANDROID]
    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    And Assert that products in My products page is loaded

    Then Assert amount and currency are displayed by Android xpath "//android.widget.TextView[@resource-id=\"nlb-value-product-primary-balance\" and @text=\"5304,55 EUR\"]"
    And Assert Product number is in BBAN format by xPath "//android.widget.TextView[@resource-id=\"nlb-value-product-account-id\" and @text=\"205-9032022325800-66\"]"
    And Assert Product page for product with name from Excel "<rowindex>" columnName "termDepositBBAN"
    And Assert that whole product card of term deposit account with name "termDepositName" and bban "termDepositBBAN" from Excel "<rowindex>" acts as a clickable button


    Examples:
      | rowindex |
      |        1 |
