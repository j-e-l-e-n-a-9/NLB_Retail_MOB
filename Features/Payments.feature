Feature: Payments



  @Payments-Scan_And_Pay-Camera_Permission_Reject_[MOB_ANDROID]
  Scenario Outline: Payments-Scan_And_Pay-Camera_Permission_Reject_[MOB_ANDROID]

    Given Open Application
    #And Wait "100" seconds
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear
    #Go to Payments page
    When Click on element in bottom menu by text "Pay"

    #And Click on element by text "IPS QR"
    And Click on element by text "Photo pay"
    And Under prompt "Photo pay" there are options:
      |Take photo|
      |Import from gallery|

    And Under prompt "Photo pay" choose option "Take photo"

    #TODO
    #promt za dozvolu
    #biranje opcije Dont allow

    And Under prompt "Permission denied" there are options:
      |Close|
      |Settings|
    And Under prompt "Permission denied" choose option "Close"

    #TODO Klikne se Ok, ali nema te opcije sad

    Examples:
      | rowindex |
      |        1 |