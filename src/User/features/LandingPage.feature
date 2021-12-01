Feature: Landing Page

  31 dk

  AS Nisa
  I WANT to know about the features of the loyalty program
  SO THAT I can decide whether to enroll in the loyalty program

  | Emails                            | Passwords      | CustomerIDs |
  | userLoyaltyLanding@modanisa.com   | Modanisa1234.  | 12727253    |
  | toptanci.musteri@modanisa.com     | Testhb123      | 10183939    |
  | problemli.musteri@modanisa.com    | Testhb123      | 10183941    |

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
  Scenario Outline: Nisa has landed "Landing Page"
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    Then Nisa should see Landing Page Title
    Then Nisa should see Description: "My Modanisa ayrıcalıklar dünyası bu kapının arkasında" in Landing Page
    Then Nisa should see Button: "<buttonType>" in Landing Page
    Examples:
      | user   | email                           | password      | buttonType           |
      |        |                                 |               | Giriş Yap            |
      | normal | userLoyaltyLanding@modanisa.com | Modanisa1234. | My Modanisa'ya Katıl |
      | normal | toptanci.musteri@modanisa.com   | Testhb123     | My Modanisa'ya Katıl |
      | normal | problemli.musteri@modanisa.com  | Testhb123     | My Modanisa'ya Katıl |

  @S74/74.1-LoggedIn/NotLoggedIn-CheckTab
  Scenario Outline: Nisa has taps "Program Features|Earn Points|Points Usage"
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    Then Nisa should see Tab: "<tab>" in Landing Page
    When Nisa click to Tab: "<tab>" in Landing Page
    Then Nisa should see Tab Card: "<tabCard>" in Landing Page
    Examples:
      | user   | email                           | password      | tab                 | tabCard                 |
      | normal | userLoyaltyLanding@modanisa.com | Modanisa1234. | Program Özellikleri | Kargo Bedava Fırsatları |
      | normal | userLoyaltyLanding@modanisa.com | Modanisa1234. | Puan Kazanımı       | Hoş Geldin Puanı        |
      | normal | userLoyaltyLanding@modanisa.com | Modanisa1234. | Hediye Seçimi       | Modanisa Hediye Çekleri |
      | normal | toptanci.musteri@modanisa.com   | Testhb123     | Program Özellikleri | Kargo Bedava Fırsatları |
      | normal | toptanci.musteri@modanisa.com   | Testhb123     | Puan Kazanımı       | Hoş Geldin Puanı        |
      | normal | toptanci.musteri@modanisa.com   | Testhb123     | Hediye Seçimi       | Modanisa Hediye Çekleri |
      | normal | problemli.musteri@modanisa.com  | Testhb123     | Program Özellikleri | Kargo Bedava Fırsatları |
      | normal | problemli.musteri@modanisa.com  | Testhb123     | Puan Kazanımı       | Hoş Geldin Puanı        |
      | normal | problemli.musteri@modanisa.com  | Testhb123     | Hediye Seçimi       | Modanisa Hediye Çekleri |
      |        |                                 |               | Program Özellikleri | Kargo Bedava Fırsatları |
      |        |                                 |               | Puan Kazanımı       | Hoş Geldin Puanı        |
      |        |                                 |               | Hediye Seçimi       | Modanisa Hediye Çekleri |

  @S74/74.1-LoggedIn/NotLoggedIn-CheckFaqContainer
  Scenario Outline: Nisa has taps Faq Container Element
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
      | user   | email                           | password      | faqName                                 | faqDescription                                            |
      | normal | userLoyaltyLanding@modanisa.com | Modanisa1234. | My Modanisa nedir                       | My Modanisa, Modanisa müşterilerinin ayrıcaklı dünyasıdır |
#      | normal | userLoyaltyLanding@modanisa.com | Modanisa1234. | My Modanisa’ya nasıl kayıt olurum       | My Modanisa’ya kayıt olmak için                           |
      | normal | userLoyaltyLanding@modanisa.com | Modanisa1234. | My Modanisa ne gibi ayrıcalıklar sağlar | My Modanisa’ya kayıt olduktan sonra                       |
      | normal | toptanci.musteri@modanisa.com   | Testhb123     | My Modanisa nedir                       | My Modanisa, Modanisa müşterilerinin ayrıcaklı dünyasıdır |
#      | normal | toptanci.musteri@modanisa.com   | Testhb123     | My Modanisa’ya nasıl kayıt olurum       | My Modanisa’ya kayıt olmak için                           |
      | normal | toptanci.musteri@modanisa.com   | Testhb123     | My Modanisa ne gibi ayrıcalıklar sağlar | My Modanisa’ya kayıt olduktan sonra                       |
      | normal | problemli.musteri@modanisa.com  | Testhb123     | My Modanisa nedir                       | My Modanisa, Modanisa müşterilerinin ayrıcaklı dünyasıdır |
 #     | normal | problemli.musteri@modanisa.com  | Testhb123     | My Modanisa’ya nasıl kayıt olurum       | My Modanisa’ya kayıt olmak için                           |
      | normal | problemli.musteri@modanisa.com  | Testhb123     | My Modanisa ne gibi ayrıcalıklar sağlar | My Modanisa’ya kayıt olduktan sonra                       |
      |        |                                 |               | My Modanisa nedir                       | My Modanisa, Modanisa müşterilerinin ayrıcaklı dünyasıdır |
  #    |        |                                 |               | My Modanisa’ya nasıl kayıt olurum       | My Modanisa’ya kayıt olmak için                           |
      |        |                                 |               | My Modanisa ne gibi ayrıcalıklar sağlar | My Modanisa’ya kayıt olduktan sonra                       |

  @S74/74.1-LoggedIn/NotLoggedIn-CheckFaqContainerPhoneBack @Hatali
  Scenario Outline: Nisa has taps Faq Container Element
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    Then Nisa should see Faq Area Name: "POPÜLER SORULAR" in Landing Page
    Then Nisa should see Faq Name: "<faqName>" in Landing Page
    When Nisa click to Faq Name: "<faqName>" in Landing Page
    Then Nisa should see Faq Modal Title "<faqName>"
    Then Nisa click Phone back button
#    Then Nisa should see Landing Page Title
    Examples:
      | user   | email                           | password      | faqName           |
      | normal | userLoyaltyLanding@modanisa.com | Modanisa1234. | My Modanisa nedir |
      | normal | toptanci.musteri@modanisa.com   | Testhb123     | My Modanisa nedir |
      | normal | problemli.musteri@modanisa.com  | Testhb123     | My Modanisa nedir |
      |        |                                 |               | My Modanisa nedir |


  @S74/74.1-LoggedIn/NotLoggedIn-CheckLandFaqPage
  Scenario Outline: Nisa has taps All Questions
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    Then Nisa should see Landing Page Title
    Then Nisa should see All Faq: "Tüm Sorular" in Landing Page
    When Nisa click to All Faq in Landing Page
    Then Nisa should see Faq Page Title
    When Nisa click to Back Button in Faq Page
    Then Nisa should see Landing Page Title
    Examples:
      | user   | email                           | password      |
      | normal | userLoyaltyLanding@modanisa.com | Modanisa1234. |
      | normal | toptanci.musteri@modanisa.com   | Testhb123     |
      | normal | problemli.musteri@modanisa.com  | Testhb123     |
      |        |                                 |               |

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
      | normal | userLoyaltyLanding@modanisa.com | Modanisa1234. |

  @S56
  Scenario Outline: Nisa Has Not See Enroll Button And Warning Message When She Is Wholesaler
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    When Nisa click Button: "My Modanisa'ya Katıl" in Landing Page
    Then Nisa should see Popup Message "<message>" in Landing Page
    Examples:
      | user   | email                          | password  | message                                                                                                                                               |
      | normal | toptanci.musteri@modanisa.com  | Testhb123 | My Modanisa kayıt ve kullanım koşulları gereği, kayıt işleminiz yapılamamaktadır. Detaylı bilgi için Modanisa Müşteri Hizmetleri ile görüşebilirsiniz |
      | normal | problemli.musteri@modanisa.com | Testhb123 | My Modanisa kayıt ve kullanım koşulları gereği, kayıt işleminiz yapılamamaktadır. Detaylı bilgi için Modanisa Müşteri Hizmetleri ile görüşebilirsiniz |

  @S56
  Scenario Outline: Nisa Has see Warning Button and Phone back button
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
      | user   | email                          | password  | message                                                                                                                                               |
      | normal | toptanci.musteri@modanisa.com  | Testhb123 | My Modanisa kayıt ve kullanım koşulları gereği, kayıt işleminiz yapılamamaktadır. Detaylı bilgi için Modanisa Müşteri Hizmetleri ile görüşebilirsiniz |
      | normal | problemli.musteri@modanisa.com | Testhb123 | My Modanisa kayıt ve kullanım koşulları gereği, kayıt işleminiz yapılamamaktadır. Detaylı bilgi için Modanisa Müşteri Hizmetleri ile görüşebilirsiniz |

  @S57.1
  Scenario Outline: Nisa Goes Back To My Account Page From Loyalty Page
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    When Nisa click to Back Button in Landing Page
    Then Nisa should see My Account page
    Examples:
      | user   | email                           | password      |
      | normal | userLoyaltyLanding@modanisa.com | Modanisa1234. |
      | normal | toptanci.musteri@modanisa.com   | Testhb123     |
      | normal | problemli.musteri@modanisa.com  | Testhb123     |
      |        |                                 |               |

  @S57.1
  Scenario Outline: Nisa Goes Phone Back To My Account Page From Loyalty Page
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    When Nisa click Phone back button
    Then Nisa should see My Account page
    Examples:
      | user   | email                           | password      |
      | normal | userLoyaltyLanding@modanisa.com | Modanisa1234. |
      | normal | toptanci.musteri@modanisa.com   | Testhb123     |
      | normal | problemli.musteri@modanisa.com  | Testhb123     |
      |        |                                 |               |

