
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
  | userLoyaltyLanding11@modanisa.com   | Modanisa1234.| 12727461    |
  | userLoyaltyLanding12@modanisa.com   | Modanisa1234.| 12727462    |
  | userLoyaltyLanding13@modanisa.com   | Modanisa1234.| 12727463	 |
  | userLoyaltyLanding14@modanisa.com   | Modanisa1234.| 12727464	 |
  | userLoyaltyLanding15@modanisa.com   | Modanisa1234.| 12727465    |
  | userLoyaltyLanding16@modanisa.com   | Modanisa1234.| 12727466	 |
  | userLoyaltyLanding17@modanisa.com   | Modanisa1234.| 12727467	 |
  | userLoyaltyLanding18@modanisa.com   | Modanisa1234.| 12727468	 |
  | userLoyaltyLanding19@modanisa.com   | Modanisa1234.| 12727469	 |
  | userLoyaltyLanding20@modanisa.com   | Modanisa1234. | 12727470	 |
  | userLoyaltyLanding21@modanisa.com   | Modanisa1234.| 12727471    |
  | userLoyaltyLanding22@modanisa.com   | Modanisa1234.| 12727472	 |
  | userLoyaltyLanding23@modanisa.com   | Modanisa1234.| 12727473	 |
  | userLoyaltyLanding24@modanisa.com   | Modanisa1234.| 12727474	 |
  | userLoyaltyLanding25@modanisa.com   | Modanisa1234.| 12727475	 |





  Background:
    Given Nisa waits for Welcome page
    Given Nisa changes the Country to "Turkey" from the Shipping Country picker in Welcome page
    Given Nisa changes the Language to "Türkçe" from the Language picker in Welcome page
    Given Nisa taps on the Start Shopping button in Welcome page
    Given Nisa waits for Home page
    Given Nisa taps on the My Account button in bottom menu bar
    Given Nisa sendKey private api "customer-legacy-mdns-api-staging.modanisa.net" and restart app
    Given Nisa taps on the My Account button in bottom menu bar
    #Given Nisa is not enrolled user with customerId: "12727253"

  @LandingPage
  Scenario Outline: Nisa check Landing Page with <email> email
    Given Nisa is not enrolled user with customerId: "<customerID>"
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    Then Nisa should see Landing Page Title
    Examples:
      | user   | customerID | email                           | password      |
      | normal | 12727253   | userLoyaltyLanding@modanisa.com | Modanisa1234. |
      |        |            |                                 |               |

  @LandingPage @CheckButton
  Scenario Outline: Nisa check <buttonType> Button in Landing Page with <email> email
    Given Nisa is not enrolled user with customerId: "<customerID>"
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    Then Nisa should see Description: "<description>" in Landing Page
    Then Nisa should see Button: "<buttonType>" in Landing Page
    Examples:
      | user   | customerID | email                            | password       | buttonType           | description                                           |
      | normal | 12727410   | userLoyaltyLanding1@modanisa.com | Modanisa1234.  | My Modanisa'ya Katıl | My Modanisa ayrıcalıklar dünyası bu kapının arkasında |
      |        |            |                                  |                | Giriş Yap            | My Modanisa ayrıcalıklar dünyası bu kapının arkasında |

  @LandingPage @CheckLandingPageBack
  Scenario Outline: Nisa check back in Landing Page with <email> email
    Given Nisa is not enrolled user with customerId: "<customerID>"
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    When Nisa click to Back Button in Landing Page
    Then Nisa should see My Account page
    Examples:
      | user   | customerID | email                            | password      |
      | normal | 12727308   | userLoyaltyLanding2@modanisa.com | Modanisa1234. |

  @LandingPage @CheckLandingPagePhoneBack
    #kontrol edilmeli çalışmadı denediğim cihaz android
  Scenario Outline: Nisa check phone back in Landing Page with <email> email
    Given Nisa is not enrolled user with customerId: "<customerID>"
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    When Nisa click Phone back button
    Then Nisa should see My Account page
    Examples:
      | user    | customerID | email                            | password      |
      | normal  | 12727433   | userLoyaltyLanding3@modanisa.com | Modanisa1234. |

  @LandingPage @CheckTab
  Scenario Outline: Nisa check <tab> Tab in Landing Page with <email> email
    Given Nisa is not enrolled user with customerId: "<customerID>"
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    Then Nisa should see Tab: "<tab>" in Landing Page
    Examples:
      | user   | customerID | email                            | password      | tab                 |
      | normal | 12727434   | userLoyaltyLanding4@modanisa.com | Modanisa1234. | Program Özellikleri |
      | normal | 12727435   | userLoyaltyLanding5@modanisa.com | Modanisa1234. | Puan Kazanımı       |
      | normal | 12727436   | userLoyaltyLanding6@modanisa.com | Modanisa1234. | Hediye Seçimi       |

  @LandingPage @CheckTabDetails
  Scenario Outline: Nisa check <tabDetail> Tab Detail opened in Landing Page with <email> email
    Given Nisa is not enrolled user with customerId: "<customerID>"
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    When Nisa click to Tab: "<tab>" in Landing Page
    Then Nisa should see Tab Card: "<tabDetail1>" in Landing Page
#    Then Nisa should see Tab Card: "<tabDetail2>" in Landing Page
#    Then Nisa should see Tab Card: "<tabDetail3>" in Landing Page
#    Then Nisa should see Tab Card: "<tabDetail4>" in Landing Page
#####  Elementler aşağıda kaldığı ve liste olarak aldığım için aşağıya kaymıyor. Daha sonra eklemeye çalış
    Examples:
      | user   | customerID | email                            | password      | tab                 | tabDetail1              | tabDetail2                            | tabDetail3                  | tabDetail4                      |
      | normal | 12727437   | userLoyaltyLanding7@modanisa.com | Modanisa1234. | Program Özellikleri | Kargo Bedava Fırsatları | Sana Özel Teklifler                   | Her Döneme Özel Hediyeler   | Seviye Atladıkça Daha Çok Kazan |
      | normal | 12727438   | userLoyaltyLanding8@modanisa.com | Modanisa1234. | Puan Kazanımı       | Hoş Geldin Puanı        | Modanisa Alışverişlerinden Puan Kazan | Özel Günlerde Puan Kazanımı | Anlık Puan Kazanımları          |
      | normal | 12727439   | userLoyaltyLanding9@modanisa.com | Modanisa1234. | Hediye Seçimi       | Modanisa Hediye Çekleri | Çeşitli Markaların Hediye Çekleri     | Eşsiz Deneyim Fırsatları    | Kargo Bedava                    |

  @LandingPage @CheckFaqArea
  Scenario Outline: Nisa check <faqAreaName> Faq Area in Landing Page with <email> email
    Given Nisa is not enrolled user with customerId: "<customerID>"
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    Then Nisa should see Faq Area Name: "<faqAreaName>" in Landing Page
    Examples:
      | user   | customerID | email                             | password      | faqAreaName     |
      | normal | 12727440   | userLoyaltyLanding10@modanisa.com | Modanisa1234. | POPÜLER SORULAR |

  @LandingPage @CheckFaq
  Scenario Outline: Nisa check <faqName> Faq in Landing Page with <email>
    Given Nisa is not enrolled user with customerId: "<customerID>"
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    Then Nisa should see Faq Name: "<faqName>" in Landing Page
    Examples:
      | user   | customerID | email                           | password      | faqName                                 |
      | normal | 12727461   | userLoyaltyLanding11@modanisa.com | Modanisa1234. | My Modanisa nedir                       |
      | normal | 12727462   | userLoyaltyLanding12@modanisa.com | Modanisa1234. | My Modanisa’ya nasıl kayıt olurum       |
      | normal | 12727463   | userLoyaltyLanding12@modanisa.com | Modanisa1234. | My Modanisa ne gibi ayrıcalıklar sağlar |

  @LandingPage @CheckFaqModal @Hatali
  Scenario Outline: Nisa check <faqDescription> Faq Description Modal opened in Landing Page with <email> email
    Given Nisa is not enrolled user with customerId: "<customerID>"
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    When Nisa click to Faq Name: "<faqName>" in Landing Page
    Then Nisa should see Faq Modal Title "<faqName>"
    Then Nisa should see Faq Modal Description "<faqDescription>"
    Examples:
      | user   | customerID | email                           | password      | faqName                                 | faqDescription                                            |
      | normal | 12727463   | userLoyaltyLanding13@modanisa.com | Modanisa1234. | My Modanisa nedir                       | My Modanisa, Modanisa müşterilerinin ayrıcaklı dünyasıdır |
      #| normal | 12727464   | userLoyaltyLanding14@modanisa.com | Modanisa1234. | My Modanisa’ya nasıl kayıt olurum       | My Modanisa’ya kayıt olduktan sonra                       |
      #| normal | 12727465   | userLoyaltyLanding15@modanisa.com | Modanisa1234. | My Modanisa ne gibi ayrıcalıklar sağlar | My Modanisa, Modanisa müşterilerinin ayrıcaklı dünyasıdır |
     # son ikisi hatalı. faqDescription kısmı text'i eşleştiremiyor fail veriyor. sepete tıklıyor sonuncuda orayı görüntüleyemediğinden sanırım.

  @LandingPage @CheckFaqModalClose @Hatali
  Scenario Outline: Nisa check <faqName> Faq Modal close in Landing Page with <email> email
    Given Nisa is not enrolled user with customerId: "<customerID>"
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    When Nisa click to Faq Name: "<faqName>" in Landing Page
    When Nisa click to Faq Modal Close Button
    Then Nisa should see Landing Page Title
    Examples:
      | user   | customerID | email                           | password      | faqName                                 |
      | normal | 12727466   | userLoyaltyLanding16@modanisa.com | Modanisa1234. | My Modanisa nedir                       |
      | normal | 12727467   | userLoyaltyLanding17@modanisa.com | Modanisa1234. | My Modanisa’ya nasıl kayıt olurum       |
      #| normal | 12727468   | userLoyaltyLanding18@modanisa.com | Modanisa1234. | My Modanisa ne gibi ayrıcalıklar sağlar |
     # görüntüleyemedi tıklayamadı. My modanisa ne gibi ayrıcalıklar sağlar'ı.

  @LandingPage @CheckFaqModalPhoneBack @Hatali
  Scenario Outline: Nisa check <faqName> Faq Modal Phone Back close in Landing Page with <email> email
    Given Nisa is not enrolled user with customerId: "<customerID>"
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    When Nisa click to Faq Name: "<faqName>" in Landing Page
    When Nisa click Phone back button
    Then Nisa should see Landing Page Title
    Examples:
      | user   | customerID | email                           | password      | faqName                                 |
      #| normal | 12727469   | userLoyaltyLanding19@modanisa.com | Modanisa1234. | My Modanisa nedir                       |
      #| normal | 12727470   | userLoyaltyLanding20@modanisa.com | Modanisa1234. | My Modanisa’ya nasıl kayıt olurum       |
      #| normal | 12727471   | userLoyaltyLanding21@modanisa.com | Modanisa1234. | My Modanisa ne gibi ayrıcalıklar sağlar |
    #geri tuşu yaptığında modal açıkken landing page'e değil hesabım sayfasına attı dolayısıyla landing page title'ı yakalayamadığından hata veriyor.

  @LandingPage @CheckAllFaq @Hatali
  Scenario Outline: Nisa check <allFaq> All Faq in Landing Page with <email> email
    Given Nisa is not enrolled user with customerId: "<customerID>"
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    Then Nisa should see All Faq: "<allFaq>" in Landing Page
    Examples:
      | user   | customerID | email                             | password      | allFaq      |
      | normal | 12727472   | userLoyaltyLanding22@modanisa.com | Modanisa1234. | Tüm Sorular |
    #Sayfa kaydırıldığında tüm sorular'ı göremiyor o yüzden fail.
   # ios'ta sorun yok.

  @LandingPage @CheckAllFaqPage @Hatali
  Scenario Outline: Nisa check All Faq Page opened in Landing Page with <email> email
    Given Nisa is not enrolled user with customerId: "<customerID>"
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    When Nisa click to All Faq in Landing Page
    Then Nisa should see Faq Page Title
    Examples:
      | user   | customerID | email                             | password      |
      | normal | 12727473   | userLoyaltyLanding23@modanisa.com | Modanisa1234. |
     # cihaz android 10 5.0 boyut yine Tüm soruları görüp tıklayamadı.
     # ios'ta sorun yok.

  @LandingPage @CheckAllFaqPageBack @Hatali
  Scenario Outline: Nisa check All Faq Page Back in Landing Page with <email> email
    Given Nisa is not enrolled user with customerId: "<customerID>"
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    When Nisa click to All Faq in Landing Page
    When Nisa click to Back Button in Faq Page
    Then Nisa should see Landing Page Title
    Examples:
      | user   | customerID | email                             | password      |
      | normal | 12727474   | userLoyaltyLanding24@modanisa.com | Modanisa1234. |
    # cihaz android 10 5.0 boyut yine Tüm soruları görüp tıklayamadığı için ilerlemedi case fail.
   # ios'ta sorun yok.

  @LandingPage @CheckAllFaqPagePhoneBack @Hatali
  Scenario Outline: Nisa check All Faq Phone Back  in Landing Page with <email> email
    Given Nisa is not enrolled user with customerId: "<customerID>"
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    When Nisa click to All Faq in Landing Page
    When Nisa click Phone back button
    Then Nisa should see Landing Page Title
    Examples:
      | user   | customerID | email                             | password      |
      | normal | 12727475  | userLoyaltyLanding25@modanisa.com  | Modanisa1234. |
    # cihaz android 10 5.0 boyut yine Tüm soruları görüp tıklayamadığı için ilerlemedi case fail.
    # ios'ta sorun yok.

  @LandingPage @CheckWarningMessage
  Scenario Outline: Nisa click <buttonType> with <email> email and opened Warning Message in Landing Page
    Given Nisa is not enrolled user with customerId: "<customerID>"
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    When Nisa click Button: "<buttonType>" in Landing Page
    Then Nisa should see Popup Message "<message>" in Landing Page
    Examples:
      | user   | customerID | email                          | password  | buttonType           | message                                                                                                                                               |
      | normal | 10183939   | toptanci.musteri@modanisa.com  | Testhb123 | My Modanisa'ya Katıl | My Modanisa kayıt ve kullanım koşulları gereği, kayıt işleminiz yapılamamaktadır. Detaylı bilgi için Modanisa Müşteri Hizmetleri ile görüşebilirsiniz |
      | normal | 10183941   | problemli.musteri@modanisa.com | Testhb123 | My Modanisa'ya Katıl | My Modanisa kayıt ve kullanım koşulları gereği, kayıt işleminiz yapılamamaktadır. Detaylı bilgi için Modanisa Müşteri Hizmetleri ile görüşebilirsiniz |

  @LandingPage @CheckWarningMessageClose
  Scenario Outline: Nisa click <buttonType> with <email> email and click Warning Message close in Landing Page
    Given Nisa is not enrolled user with customerId: "<customerID>"
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    When Nisa click Button: "<buttonType>" in Landing Page
    When Nisa click Popup Button "<popupButton>" in Landing Page
    Then Nisa should see Landing Page Title
    Examples:
      | user   | customerID | email                          | password  | buttonType           | popupButton |
      | normal | 10183939   | toptanci.musteri@modanisa.com  | Testhb123 | My Modanisa'ya Katıl | Kapat       |
      | normal | 10183941   | problemli.musteri@modanisa.com | Testhb123 | My Modanisa'ya Katıl | Kapat       |

  @LandingPage @CheckWarningMessagePhoneBack @Hatali
  Scenario Outline: Nisa click <buttonType> with <email> email and opened Warning Message phone back in Landing Page
    Given Nisa is not enrolled user with customerId: "<customerID>"
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    When Nisa click Button: "<buttonType>" in Landing Page
    When Nisa click Phone back button
    Then Nisa should see Landing Page Title
    Examples:
      | user   | customerID | email                          | password  | buttonType           |
      | normal | 10183939   | toptanci.musteri@modanisa.com  | Testhb123 | My Modanisa'ya Katıl |
      | normal | 10183941   | problemli.musteri@modanisa.com | Testhb123 | My Modanisa'ya Katıl |
    # phone back button yaptığında hesabım sayfasına atıyor. o yüzden title'ı doğru yerde aramıyor.



