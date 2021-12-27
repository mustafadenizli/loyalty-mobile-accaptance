
Feature: Landing Page

  31 dk

  AS Nisa
  I WANT to know about the features of the loyalty program
  SO THAT I can decide whether to enroll in the loyalty program

  | Emails                            | Passwords      | CustomerIDs |
  | userLoyaltyLanding@modanisa.com   | Modanisa1234.  | 12727253    |
  | toptanci.musteri@modanisa.com     | Testhb123      | 10183939    |
  | problemli.musteri@modanisa.com    | Testhb123      | 10183941    |
  | userLoyaltyLanding1@modanisa.com   | Modanisa1234. | 12727410    |
  | userLoyaltyLanding2@modanisa.com   | Modanisa1234. | 12727308    |
  | userLoyaltyLanding3@modanisa.com   | Modanisa1234. | 12727433	 |
  | userLoyaltyLanding4@modanisa.com   | Modanisa1234. | 12727434	 |
  | userLoyaltyLanding5@modanisa.com   | Modanisa1234. | 12727435	 |
  | userLoyaltyLanding6@modanisa.com   | Modanisa1234. | 12727436	 |
  | userLoyaltyLanding7@modanisa.com   | Modanisa1234. | 12727437	 |
  | userLoyaltyLanding8@modanisa.com   | Modanisa1234. | 12727438	 |
  | userLoyaltyLanding9@modanisa.com   | Modanisa1234. | 12727439	 |
  | userLoyaltyLanding10@modanisa.com  | Modanisa1234. | 12727440	 |




  Background:
    Given Nisa waits for Welcome page
    Given Nisa changes the Country to "Turkey" from the Shipping Country picker in Welcome page
    Given Nisa changes the Language to "Türkçe" from the Language picker in Welcome page
    Given Nisa taps on the Start Shopping button in Welcome page
    Given Nisa waits for Home page
    Given Nisa taps on the My Account button in bottom menu bar
    Given Nisa sendKey private api "customer-legacy-mdns-api-staging.modanisa.net" and restart app
    Given Nisa taps on the My Account button in bottom menu bar
    Given Nisa is not enrolled user with customerId: "12727253"

  @S74/74.1-LoggedIn/NotLoggedIn-CheckButton
  Scenario Outline: Nisa has landed "Landing Page" <TC>
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    Then Nisa should see Landing Page Title
    Then Nisa should see Description: "My Modanisa ayrıcalıklar dünyası bu kapının arkasında" in Landing Page
    Then Nisa should see Button: "<buttonType>" in Landing Page
    Examples:
      | TC | user   | email                           | password      | buttonType           |
      | 1  |        |                                 |               | Giriş Yap            |
      | 2  | normal | userLoyaltyLanding@modanisa.com | Modanisa1234. | My Modanisa'ya Katıl |
      | 3  | normal | toptanci.musteri@modanisa.com   | Testhb123     | My Modanisa'ya Katıl |
      | 4  | normal | problemli.musteri@modanisa.com  | Testhb123     | My Modanisa'ya Katıl |

 # @S74/74.1-LoggedIn/NotLoggedIn-CheckTab
  Scenario Outline: Nisa has taps "Program Features|Earn Points|Points Usage" <TC>
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    Then Nisa should see Tab: "<tab>" in Landing Page
    When Nisa click to Tab: "<tab>" in Landing Page
    Then Nisa should see Tab Card: "<tabCard>" in Landing Page
    Examples:
      | TC | user   | email                           | password      | tab                 | tabCard                 |
      #| 1  | normal | userLoyaltyLanding1@modanisa.com | Modanisa1234. | Program Özellikleri | Kargo Bedava Fırsatları |
      #| 2  | normal | userLoyaltyLanding2@modanisa.com | Modanisa1234. | Puan Kazanımı       | Hoş Geldin Puanı        |
      | 3  | normal | userLoyaltyLanding3@modanisa.com | Modanisa1234. | Hediye Seçimi       | Modanisa Hediye Çekleri |
      | 4  | normal | toptanci.musteri@modanisa.com   | Testhb123     | Program Özellikleri | Kargo Bedava Fırsatları |
      | 5  | normal | toptanci.musteri@modanisa.com   | Testhb123     | Puan Kazanımı       | Hoş Geldin Puanı        |
      | 6  | normal | toptanci.musteri@modanisa.com   | Testhb123     | Hediye Seçimi       | Modanisa Hediye Çekleri |
      | 7  | normal | problemli.musteri@modanisa.com  | Testhb123     | Program Özellikleri | Kargo Bedava Fırsatları |
      | 8  | normal | problemli.musteri@modanisa.com  | Testhb123     | Puan Kazanımı       | Hoş Geldin Puanı        |
      | 9  | normal | problemli.musteri@modanisa.com  | Testhb123     | Hediye Seçimi       | Modanisa Hediye Çekleri |
      | 10 |        |                                 |               | Program Özellikleri | Kargo Bedava Fırsatları |
      | 11 |        |                                 |               | Puan Kazanımı       | Hoş Geldin Puanı        |
      | 12 |        |                                 |               | Hediye Seçimi       | Modanisa Hediye Çekleri |

  @S74/74.1-LoggedIn/NotLoggedIn-CheckFaqContainer
  Scenario Outline: Nisa has taps Faq Container Element <TC>
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    Then Nisa should see Faq Area Name: "POPÜLER SORULAR" in Landing Page
    Then Nisa should see Faq Name: "<faqName>" in Landing Page
    When Nisa click to Faq Name: "<faqName>" in Landing Page
    Then Nisa should see Faq Modal Title "<faqName>"
    Then Nisa should see Faq Modal Description "<faqDescription>"
    When Nisa click to Faq Modal Close Button
    Then Nisa should see Landing Page Title
    Examples:
      | TC | user   | email                           | password      | faqName                                 | faqDescription                                            |
      | 1  | normal | userLoyaltyLanding4@modanisa.com | Modanisa1234. | My Modanisa nedir                       | My Modanisa, Modanisa müşterilerinin ayrıcaklı dünyasıdır |
#     | 2  | normal | userLoyaltyLanding@modanisa.com | Modanisa1234. | My Modanisa’ya nasıl kayıt olurum       | My Modanisa’ya kayıt olmak için                           |
      | 3  | normal | userLoyaltyLanding5@modanisa.com | Modanisa1234. | My Modanisa ne gibi ayrıcalıklar sağlar | My Modanisa’ya kayıt olduktan sonra                       |
      | 4  | normal | toptanci.musteri@modanisa.com   | Testhb123     | My Modanisa nedir                       | My Modanisa, Modanisa müşterilerinin ayrıcaklı dünyasıdır |
#     | 5  | normal | toptanci.musteri@modanisa.com   | Testhb123     | My Modanisa’ya nasıl kayıt olurum       | My Modanisa’ya kayıt olmak için                           |
      | 6  | normal | toptanci.musteri@modanisa.com   | Testhb123     | My Modanisa ne gibi ayrıcalıklar sağlar | My Modanisa’ya kayıt olduktan sonra                       |
      | 7  | normal | problemli.musteri@modanisa.com  | Testhb123     | My Modanisa nedir                       | My Modanisa, Modanisa müşterilerinin ayrıcaklı dünyasıdır |
 #    | 8 | normal | problemli.musteri@modanisa.com  | Testhb123     | My Modanisa’ya nasıl kayıt olurum       | My Modanisa’ya kayıt olmak için                           |
      | 9  | normal | problemli.musteri@modanisa.com  | Testhb123     | My Modanisa ne gibi ayrıcalıklar sağlar | My Modanisa’ya kayıt olduktan sonra                       |
      | 10 |        |                                 |               | My Modanisa nedir                       | My Modanisa, Modanisa müşterilerinin ayrıcaklı dünyasıdır |
  #   | 11   |        |                                 |               | My Modanisa’ya nasıl kayıt olurum       | My Modanisa’ya kayıt olmak için                           |
      | 12 |        |                                 |               | My Modanisa ne gibi ayrıcalıklar sağlar | My Modanisa’ya kayıt olduktan sonra                       |

  @S74/74.1-LoggedIn/NotLoggedIn-CheckFaqContainerPhoneBack @Hatali
  Scenario Outline: Nisa has taps Faq Container Element <TC>
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    Then Nisa should see Faq Area Name: "POPÜLER SORULAR" in Landing Page
    Then Nisa should see Faq Name: "<faqName>" in Landing Page
    When Nisa click to Faq Name: "<faqName>" in Landing Page
    Then Nisa should see Faq Modal Title "<faqName>"
    Then Nisa click Phone back button
#    Then Nisa should see Landing Page Title
    Examples:
      | TC | user   | email                           | password      | faqName           |
      | 1  | normal | userLoyaltyLanding6@modanisa.com | Modanisa1234. | My Modanisa nedir |
      | 2  | normal | toptanci.musteri@modanisa.com   | Testhb123     | My Modanisa nedir |
      | 3  | normal | problemli.musteri@modanisa.com  | Testhb123     | My Modanisa nedir |
      | 4  |        |                                 |               | My Modanisa nedir |


  @S74/74.1-LoggedIn/NotLoggedIn-CheckLandFaqPage
  Scenario Outline: Nisa has taps All Questions <TC>
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    Then Nisa should see Landing Page Title
    Then Nisa should see All Faq: "Tüm Sorular" in Landing Page
    When Nisa click to All Faq in Landing Page
    Then Nisa should see Faq Page Title
    When Nisa click to Back Button in Faq Page
    Then Nisa should see Landing Page Title
    Examples:
      | TC | user   | email                           | password      |
      | 1  | normal | userLoyaltyLanding7@modanisa.com | Modanisa1234. |
      | 2  | normal | toptanci.musteri@modanisa.com   | Testhb123     |
      | 3  | normal | problemli.musteri@modanisa.com  | Testhb123     |
      | 4  |        |                                 |               |

  @S74
  Scenario: Nisa Has Tapped 'Login Button' on ‘Loyalty Page’ Navigate To Legacy Login Page
    When Nisa taps to My Modanisa section
    When Nisa click Button: "Giriş Yap" in Landing Page
    Then Nisa should see Login Page

  @S74
  Scenario: Nisa Has Tapped 'Login Button' in Langing Page button change 'Enroll Button'
    When Nisa taps to My Modanisa section
    When Nisa click Button: "Giriş Yap" in Landing Page
    Then Nisa should see Login Page
    When Nisa login with email: "userLoyaltyLanding@modanisa.com" and password: "Modanisa1234." in Landing Page
    Then Nisa should see Landing Page Title
    Then Nisa should see Button: "My Modanisa'ya Katıl" in Landing Page

  @S74
  Scenario Outline: Nisa Has Tapped 'Login Button' on ‘Loyalty Page’ Navigate To Legacy Login Page
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    When Nisa click Button: "My Modanisa'ya Katıl" in Landing Page
    Then Nisa should see Enrollment Page
    Examples:
      | user   | email                           | password      |
      | normal | userLoyaltyLanding8@modanisa.com | Modanisa1234. |

  @S56
  Scenario Outline: Nisa Has Not See Enroll Button And Warning Message When She Is Wholesaler <TC>
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    When Nisa click Button: "My Modanisa'ya Katıl" in Landing Page
    Then Nisa should see Popup Message "<message>" in Landing Page
    Examples:
      | TC | user   | email                          | password  | message                                                                                                                                               |
      | 1  | normal | toptanci.musteri@modanisa.com  | Testhb123 | My Modanisa kayıt ve kullanım koşulları gereği, kayıt işleminiz yapılamamaktadır. Detaylı bilgi için Modanisa Müşteri Hizmetleri ile görüşebilirsiniz |
      | 2  | normal | problemli.musteri@modanisa.com | Testhb123 | My Modanisa kayıt ve kullanım koşulları gereği, kayıt işleminiz yapılamamaktadır. Detaylı bilgi için Modanisa Müşteri Hizmetleri ile görüşebilirsiniz |

  @S56
  Scenario Outline: Nisa Has see Warning Button and Phone back button <TC>
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    When Nisa click Button: "My Modanisa'ya Katıl" in Landing Page
    Then Nisa should see Popup Message "<message>" in Landing Page
    Then Nisa click Phone back button
    Then Nisa should see Popup Message "<message>" in Landing Page
    When Nisa click Popup Button "Kapat" in Landing Page
    Then Nisa should see Landing Page Title
    When Nisa click Phone back button
    Then Nisa should see My Account page
    Examples:
      | TC | user   | email                          | password  | message                                                                                                                                               |
      | 1  | normal | toptanci.musteri@modanisa.com  | Testhb123 | My Modanisa kayıt ve kullanım koşulları gereği, kayıt işleminiz yapılamamaktadır. Detaylı bilgi için Modanisa Müşteri Hizmetleri ile görüşebilirsiniz |
      | 2  | normal | problemli.musteri@modanisa.com | Testhb123 | My Modanisa kayıt ve kullanım koşulları gereği, kayıt işleminiz yapılamamaktadır. Detaylı bilgi için Modanisa Müşteri Hizmetleri ile görüşebilirsiniz |

  @S57.1
  Scenario Outline: Nisa Goes Back To My Account Page From Loyalty Page <TC>
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    When Nisa click to Back Button in Landing Page
    Then Nisa should see My Account page
    Examples:
      | TC | user   | email                           | password      |
      | 1  | normal | userLoyaltyLanding9@modanisa.com | Modanisa1234. |
      | 2  | normal | toptanci.musteri@modanisa.com   | Testhb123     |
      | 3  | normal | problemli.musteri@modanisa.com  | Testhb123     |
      | 4  |        |                                 |               |

  @S57.1
  Scenario Outline: Nisa Goes Phone Back To My Account Page From Loyalty Page <TC>
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    When Nisa click Phone back button
    Then Nisa should see My Account page
    Examples:
      | TC | user   | email                           | password      |
      | 1  | normal | userLoyaltyLanding10@modanisa.com | Modanisa1234. |
      | 2  | normal | toptanci.musteri@modanisa.com   | Testhb123     |
      | 3  | normal | problemli.musteri@modanisa.com  | Testhb123     |
      | 4  |        |                                 |               |

