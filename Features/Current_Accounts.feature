Feature: Current_Accounts



  @Current_Accounts-Transactions_Details-Create_Confirmation_[MOB_ANDROID]
  Scenario Outline: Current_Accounts-Transactions_Details-Create_Confirmation_[MOB_ANDROID]

    Given Open Application
    #And Wait "100" seconds
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    #Open My products page
    When Click "My Products"
    And Wait for element by text "Edit list"
    #Open current account
    And Click on Product from Excel "<rowindex>" columnName "third_personal_account_bban" in My Products

    And Wait for first transaction to load
    And Assert Product page for product with name from Excel "<rowindex>" columnName "third_personal_account_bban"
    And Assert element with class "android.widget.TextView" and has text "Transactions" is displayed
    When Click on first transaction

    And Wait element "Confirmation" by text
    And Assert buttons Get receipt and Send complaint are displayed in Transaction details
    And Remember transaction details

    And Click on button "Confirmation" in transaction details

    Then Assert element by complete id "com.google.android.apps.docs:id/projector_toolbar"
    And Assert transaction details by remembered values
    And Go Back

    Examples:
      | rowindex |
      |        1 |

  @Current_Accounts_Transactions_Details_Transaction_Confirmation_[MOB_ANDROID]
  Scenario Outline: Current_Accounts_Transactions_Details_Transaction_Confirmation_[MOB_ANDROID]
    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    And Click on element by text "My Products"

    When Scroll down until element with text "205-9001015647000-10" is in view
    And Click on element by contains text "-10"
    And Wait for element by text "Available balance"
    And Assert account number is displayed in BBAN format by xPath "//android.widget.TextView[@text=\"205-9001015647000-10\"]"
    And Assert account name from excel "<rowindex>" column name "currentDomesticAccountName" is displayed
    #Available balance
    And Assert amount and currency are displayed by Android xpath "//android.widget.TextView[@resource-id=\"nlb-product-details-primary-balance\"]"
    #Current balance
    And Assert amount and currency are displayed by Android xpath "//android.widget.TextView[@resource-id=\"nlb-product-details-secondary-balance\"]"
    And Scroll down until element with text "Porez na kapitalnu dobit" is in view
    And Click on element by text "Porez na kapitalnu dobit"
    And Assert element by xPath "//android.widget.TextView[@text=\"Confirmation\"]" is displayed
    And Click on element by text "Confirmation"

    Examples:
      | rowindex |
      |        2 |