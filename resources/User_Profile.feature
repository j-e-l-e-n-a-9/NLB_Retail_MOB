Feature: User_Profile

  @General_User_Profile_View_User_Data_On_User_Profile_[MOB_ANDROID]
  Scenario Outline: General_User_Profile_View_User_Data_On_User_Profile_[MOB_ANDROID]
    #C75896

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My profile" content description from view tag "View"
    And Wait for element by text "My profile"
    And Click on element by text "My profile"
    And Wait for element by text "E-mail"

    Then Assert element by text "E-mail"
    And Assert that text "E-mail" has first following sibling with text from Excel "<rowindex>" columnName "user_email"
    And Assert element by text "Mobile number"
    And Assert that text "Mobile number" has first following sibling with text from Excel "<rowindex>" columnName "phone_number_hidden"
    And Assert element by text "Phone number"
    And Assert element by text "Contact address"
    And Assert that text "Contact address" has first following sibling that contains from Excel "<rowindex>" columnName "user_street_short"
    And Assert that text "Contact address" has first following sibling that contains from Excel "<rowindex>" columnName "user_city_short"
    And Assert that text "Contact address" has first following sibling that contains from Excel "<rowindex>" columnName "user_country_short"
    And Assert element by text "Permanent address"
    And Assert that text "Permanent address" has first following sibling that contains from Excel "<rowindex>" columnName "user_street_short"
    And Assert that text "Permanent address" has first following sibling that contains from Excel "<rowindex>" columnName "user_city_short"
    And Assert that text "Permanent address" has first following sibling that contains from Excel "<rowindex>" columnName "user_country_short"
    And Assert element by text "Permanent address can be changed by video call or visiting NLB branch"
    And Assert there are five edit icons on my profile screen

    Examples:
      | rowindex |
      |        4 |

  @General_User_Profile_Edit_Email_On_User_Profile_[MOB_ANDROID]
  Scenario Outline: General_User_Profile_Edit_Email_On_User_Profile_[MOB_ANDROID]
    #C75897,C76285

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My profile" content description from view tag "View"
    And Wait for element by text "My profile"
    And Click on element by text "My profile"
    And Wait for element by text "E-mail"

    Then Click on edit button for "E-mail" in user profile
    And Wait for element by id "nlb-input-customer-email" to appear
    And Enter text "JOVAN.JACOV@DTC.COM" in element id "nlb-input-customer-email"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Enter PIN"
    And Enter PIN
    And Assert element by text "Contact data change"
    And Assert element by text "Purpose:"
    And Assert element by text "JOVAN.JACOV@DTC.COM"
    And Click on element by id "nlb-button-primary"
    And Assert element by text "Change confirmed"
    And Assert that text "E-mail" has first following sibling that contains text "JOVAN.JACOV@DTC.COM"
    And Click on edit button for "E-mail" in user profile
    And Wait for element by id "nlb-input-customer-email" to appear
    And Enter text from excel "<rowindex>" columnName "user_email" in element id "nlb-input-customer-email"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Enter PIN"
    And Enter PIN
    And Click on element by id "nlb-button-primary"
    And Assert element by text "Change confirmed"

    Examples:
      | rowindex |
      |        4 |

  @General_User_Profile_Edit_Email_On_User_Profile-invalid_[MOB_ANDROID]
  Scenario Outline: General_User_Profile_Edit_Email_On_User_Profile-invalid_[MOB_ANDROID]
    #C75898

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "Default Icon" content description from view tag "View"
    And Wait for element by text "My profile"
    And Click on element by text "My profile"
    And Wait for element by text "E-mail"

    Then Click on edit button for "E-mail" in user profile
    And Wait for element by id "nlb-input-customer-email" to appear
    And Click on element by id "nlb-button-primary"
    And Assert element by text "Error"
    And Click on element by text "OK"
    And Enter text "JOVANJACOV@DTCCOM" in element id "nlb-input-customer-email"
    And Assert element by text "Data must be entered in correct format"
    And Assert element "nlb-button-primary" by id is disabled
    And Enter text "JOVANJACOVDTC.COM" in element id "nlb-input-customer-email"
    And Assert element by text "Data must be entered in correct format"
    And Assert element "nlb-button-primary" by id is disabled



    Examples:
      | rowindex |
      |        4 |


  @General_User_Profile_Edit_Mobile_Number_On_User_Profile_[MOB_ANDROID]
  Scenario Outline: General_User_Profile_Edit_Mobile_Number_On_User_Profile_[MOB_ANDROID]
    #C75899

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My profile" content description from view tag "View"
    And Wait for element by text "My profile"
    And Click on element by text "My profile"
    And Wait for element by text "E-mail"

    Then Click on edit button for "Mobile number" in user profile
    And Wait for element by id "nlb-input-customer-mobile-phone" to appear
    And Enter text "+381641111111" in element id "nlb-input-customer-mobile-phone"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Enter PIN"
    And Enter PIN
    And Assert element by text "New mobile number"
    And Assert element by text "+381641111111"
    And Click on element by id "nlb-button-primary"
    And Assert element by text "Change confirmed"
    And Assert that text "Mobile number" has first following sibling that contains text "XXXXXXXXXXX11"
    And Click on edit button for "Mobile number" in user profile
    And Wait for element by id "nlb-input-customer-mobile-phone" to appear
    And Enter text "+381641111102" in element id "nlb-input-customer-mobile-phone"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Enter PIN"
    And Enter PIN
    And Assert element by text "New mobile number"
    And Assert element by text "+381641111102"
    And Click on element by id "nlb-button-primary"
    And Assert element by text "Change confirmed"
    And Assert that text "Mobile number" has first following sibling that contains text "XXXXXXXXXXX02"


    Examples:
      | rowindex |
      |        4 |

  @General_User_Profile_Edit_Mobile_Number_On_User_Profile-invalid_[MOB_ANDROID]
  Scenario Outline: General_User_Profile_Edit_Mobile_Number_On_User_Profile-invalid_[MOB_ANDROID]
    #C75900

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My profile" content description from view tag "View"
    And Wait for element by text "My profile"
    And Click on element by text "My profile"
    And Wait for element by text "E-mail"

    Then Click on edit button for "Mobile number" in user profile
    And Wait for element by id "nlb-input-customer-mobile-phone" to appear

    And Enter text "12345678" in element id "nlb-input-customer-mobile-phone"
    And Assert element by text "Data must be entered in correct format"
    And Assert element "nlb-button-primary" by id is disabled

    And Enter text "123456789" in element id "nlb-input-customer-mobile-phone"
    And Assert element "nlb-button-primary" by id is enabled

    And Enter text "+12345678" in element id "nlb-input-customer-mobile-phone"
    And Assert element by text "Data must be entered in correct format"
    And Assert element "nlb-button-primary" by id is disabled

    And Enter text "+123456789" in element id "nlb-input-customer-mobile-phone"
    And Assert element "nlb-button-primary" by id is enabled

    And Enter text "123456789a" in element id "nlb-input-customer-mobile-phone"
    And Assert element by text "Data must be entered in correct format"
    And Assert element "nlb-button-primary" by id is disabled

    And Enter text "123456789%" in element id "nlb-input-customer-mobile-phone"
    And Assert element by text "Data must be entered in correct format"
    And Assert element "nlb-button-primary" by id is disabled

    And Enter text "+1234567891234567" in element id "nlb-input-customer-mobile-phone"
    And Assert element by text "Data must be entered in correct format"
    And Assert element "nlb-button-primary" by id is disabled

    And Enter text "+123456789123456" in element id "nlb-input-customer-mobile-phone"
    And Assert element "nlb-button-primary" by id is enabled

    And Enter text "" in element id "nlb-input-customer-mobile-phone"
    And Assert element "nlb-button-primary" by id is disabled

    Examples:
      | rowindex |
      |        4 |


  @General_User_Profile_Edit_Fix_Phone_Number_On_User_Profile_[MOB_ANDROID]
  Scenario Outline: General_User_Profile_Edit_Fix_Phone_Number_On_User_Profile_[MOB_ANDROID]
    #C76289
    #BUG ne moze da se promeni broj

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My profile" content description from view tag "View"
    And Wait for element by text "My profile"
    And Click on element by text "My profile"
    And Wait for element by text "E-mail"

    Then Click on edit button for "Phone number" in user profile
    And Wait for element by id "nlb-input-customer-phone-number" to appear
    And Enter text "+38611234567" in element id "nlb-input-customer-phone-number"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Enter PIN"
    And Enter PIN
    And Assert element by text "New phone number"
    And Assert element by text "+38611234567"
    And Click on element by id "nlb-button-primary"
    And Assert element by text "Change confirmed"
    And Assert that text "Phone number" has first following sibling that contains text "XXXXXXXXXXX67"
    And Click on edit button for "Phone number" in user profile
    And Wait for element by id "nlb-input-customer-phone-number" to appear
    And Enter text "+38611234566" in element id "nlb-input-customer-phone-number"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Enter PIN"
    And Enter PIN
    And Assert element by text "New phone number"
    And Assert element by text "+38611234566"
    And Click on element by id "nlb-button-primary"
    And Assert element by text "Change confirmed"
    And Assert that text "Phone number" has first following sibling that contains text "XXXXXXXXXXX66"

    Examples:
      | rowindex |
      |        4 |

  @General_User_Profile_Edit_Fix_Phone_Number_On_User_Profile-invalid_[MOB_ANDROID]
  Scenario Outline: General_User_Profile_Edit_Fix_Phone_Number_On_User_Profile-invalid_[MOB_ANDROID]
    #C75902

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My profile" content description from view tag "View"
    And Wait for element by text "My profile"
    And Click on element by text "My profile"
    And Wait for element by text "E-mail"

    Then Click on edit button for "Phone number" in user profile
    And Wait for element by id "nlb-input-customer-phone-number" to appear

    And Enter text "12345678" in element id "nlb-input-customer-phone-number"
    And Assert element by text "Data must be entered in correct format"
    And Assert element "nlb-button-primary" by id is disabled

    And Enter text "123456789" in element id "nlb-input-customer-phone-number"
    And Assert element "nlb-button-primary" by id is enabled

    And Enter text "+12345678" in element id "nlb-input-customer-phone-number"
    And Assert element by text "Data must be entered in correct format"
    And Assert element "nlb-button-primary" by id is disabled

    And Enter text "+123456789" in element id "nlb-input-customer-phone-number"
    And Assert element "nlb-button-primary" by id is enabled

    And Enter text "123456789a" in element id "nlb-input-customer-phone-number"
    And Assert element by text "Data must be entered in correct format"
    And Assert element "nlb-button-primary" by id is disabled

    And Enter text "123456789%" in element id "nlb-input-customer-phone-number"
    And Assert element by text "Data must be entered in correct format"
    And Assert element "nlb-button-primary" by id is disabled

    And Enter text "+1234567891234567" in element id "nlb-input-customer-phone-number"
    And Assert element by text "Data must be entered in correct format"
    And Assert element "nlb-button-primary" by id is disabled

    And Enter text "+123456789123456" in element id "nlb-input-customer-phone-number"
    And Assert element "nlb-button-primary" by id is enabled

    And Enter text "" in element id "nlb-input-customer-phone-number"
    And Assert element "nlb-button-primary" by id is disabled

    Examples:
      | rowindex |
      |        4 |

  @General_User_Profile_Edit_Contact_Address_On_User_Profile_[MOB_ANDROID]
  Scenario Outline: General_User_Profile_Edit_Contact_Address_On_User_Profile_[MOB_ANDROID]
    #C75903
    #BUG Postoji dosta bugova vezanih za promenu podataka
    #Test zavrsiti kada se bug popravi
    #Snimak se zove PROFIL adress bug

    Given Open Application
    And Select User from Excel "<rowindex>" columnName "username" and login
    And Wait for element by resource id "nlb-bottom-nav-button" to appear

    When Click "My profile" content description from view tag "View"
    And Wait for element by text "My profile"
    And Click on element by text "My profile"
    And Wait for element by text "E-mail"

    Then Click on edit button for "Contact address" in user profile
    And Wait for element by id "nlb-input-customer-country" to appear
    And Assert element by text from excel "<rowindex>" columnName "user_country_short" is contained in element by id "nlb-input-customer-country"
    And Assert element by text from excel "<rowindex>" columnName "user_street_only_short" is contained in element by id "nlb-input-customer-address"
    And Assert element by text from excel "<rowindex>" columnName "user_street_number" is contained in element by id "nlb-input-customer-building-number"
    And Assert element by text from excel "<rowindex>" columnName "user_postal_code" is contained in element by id "nlb-input-customer-postal-code"
    And Assert element by text from excel "<rowindex>" columnName "user_city_short" is contained in element by id "nlb-input-customer-city"
    And Click on element by id "nlb-input-customer-country"
    And Wait for element by text "AFGHANISTAN"
    And Click on element by text "AFGHANISTAN"
    And Wait for element by id "nlb-input-customer-country" to appear
    And Assert text "AFGHANISTAN" in element id "nlb-input-customer-country"
    And Enter text "TESTNA ULICA" in element id "nlb-input-customer-address"
    And Enter text "99" in element id "nlb-input-customer-building-number"
    And Enter text "1001" in element id "nlb-input-customer-postal-code"
    And Enter text "TESTNIGRAD" in element id "nlb-input-customer-city"
    And Click on element by id "nlb-button-primary"
    And Wait for element by text "Enter PIN"
    And Enter PIN
    And Assert element by text "TESTNA ULICA 99"
    And Assert element by text "TESTNIGRAD"
    And Assert element by text "1001"
    And Click on element by id "nlb-button-primary"
    And Assert element by text "Change confirmed"
    And Assert that text "Contact address" has first following sibling that contains text "TESTNA ULICA 99"
    And Assert that text "Contact address" has first following sibling that contains text "TESTNIGRAD"
    And Assert that text "Contact address" has first following sibling that contains text "1001"
    And Assert that text "Contact address" has first following sibling that contains text "AFGHANISTAN"
    And Click on edit button for "Contact address" in user profile
    And Wait for element by id "nlb-input-customer-country" to appear
    And Assert text "AFGHANISTAN" in element id "nlb-input-customer-country"
    And Assert text "TESTNA ULICA" in element id "nlb-input-customer-address"
    And Assert text "99" in element id "nlb-input-customer-building-number"
    And Assert text "1001" in element id "nlb-input-customer-postal-code"
    And Assert text "TESTNIGRAD" in element id "nlb-input-customer-city"
    And Click on element by id "nlb-input-customer-country"
    And Enter text "SLOVENIA" into EditText element
    And Click on country "SLOVENIA" after search
    And Wait for element by id "nlb-input-customer-country" to appear
    And Enter text from excel "<rowindex>" columnName "user_street_only_short" in element id "nlb-input-customer-address"
    And Enter text from excel "<rowindex>" columnName "user_street_number" in element id "nlb-input-customer-building-number"
    And Click on element by id "nlb-input-customer-postal-code"
    And Wait for element by text "1000"
    And Click on element by text "1000"


    Examples:
      | rowindex |
      |        4 |