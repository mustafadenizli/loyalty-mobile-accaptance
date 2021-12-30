Feature: Enrollment Page

  As Nisa
  I want to be able to access Loyalty Page with an Enrollment button
  So that I will be attracted to the Loyalty Program and start my enrollment process.

  | status    | Emails                            | Passwords      | CustomerIDs |
  | facebook  | userloyaltyEnroll@yandex.com      | Modanisa1234.  | 12727273    |
  | normal    | userLoyaltyEnroll1@modanisa.com   | Modanisa1234.  | 12727275    |
  | normal    | userLoyaltyEnroll2@modanisa.com   | Modanisa1234.  | 12727309	    |
  | normal    | userLoyaltyEnroll3@modanisa.com   | Modanisa1234.  | 12727310    |
  | normal    | userLoyaltyEnroll4@modanisa.com   | Modanisa1234.  | 12727311    |
  | normal    | userLoyaltyEnroll5@modanisa.com   | Modanisa1234.  | 12727417	 |
  | normal    | userLoyaltyEnroll6@modanisa.com   | Modanisa1234.  | 12727418	 |
  | normal    | userLoyaltyEnroll7@modanisa.com   | Modanisa1234.  | 12727419	 |
  | normal    | userLoyaltyEnroll8@modanisa.com   | Modanisa1234.  | 12727420	 |
  | normal    | userLoyaltyEnroll9@modanisa.com   | Modanisa1234.  | 12727421	 |
  | normal    | userLoyaltyEnroll10@modanisa.com  | Modanisa1234.  | 12727422	 |
  | normal    | userLoyaltyEnroll11@modanisa.com  | Modanisa1234.  | 12727423	 |
  | normal    | userLoyaltyEnroll12@modanisa.com  | Modanisa1234.  | 12727424    |


  Background:
    Given Nisa waits for Welcome page
    Given Nisa changes the Country to "Turkey" from the Shipping Country picker in Welcome page
    Given Nisa changes the Language to "Türkçe" from the Language picker in Welcome page
    Given Nisa taps on the Start Shopping button in Welcome page
    Given Nisa waits for Home page
    Given Nisa taps on the My Account button in bottom menu bar
    Given Nisa sendKey private api "customer-legacy-mdns-api-staging.modanisa.net" and restart app
    Given Nisa taps on the My Account button in bottom menu bar

  @EnrollmentPage
  Scenario Outline: Nisa Open Loyalty Page as Logged In and Not Enrolled User with <email> email
    Given Nisa is not enrolled user with customerId: "<customerId>"
    Given Nisa login with user:"<status>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    When Nisa click Button: "My Modanisa'ya Katıl" in Landing Page
    Then Nisa should see Enrollment Page
    Examples:
      | status | email                           | password      | customerId |
      | normal | userLoyaltyEnroll1@modanisa.com | Modanisa1234. | 12727275   |

  @EnrollmentPage @RegisteredUser
  Scenario Outline: Nisa Open Loyalty Page as Logged In and Enrolled User with <email> email
    Given Nisa is not enrolled user with customerId: "<customerId>"
    Given Nisa is enrolled user with customerId: "<customerId>" and e-mail: "<email>"
    Given Nisa login with user:"<status>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    Then Nisa should see Dashboard Main Page
    Examples:
      | status | email                           | password      | customerId |
      | normal | userLoyaltyEnroll2@modanisa.com | Modanisa1234. | 12727309   |

  @EnrollmentPage @Hatali
  Scenario Outline: Nisa Enrolls Successfully With Default User Data
    Given Nisa is not enrolled user with customerId: "<customerId>"
    Given Nisa login with user:"<status>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    When Nisa click Button: "My Modanisa'ya Katıl" in Landing Page
    Then Nisa should see Enroll Button: "Kayıt Ol" in Enrollment Page
    When Nisa click Enroll Button in Enrollment Page
    When Nisa click Complete Button in Enrollment Page
    Then Nisa should see Dashboard Main Page
    Examples:
      | status | email                           | password      | customerId |
      | normal | userLoyaltyEnroll3@modanisa.com | Modanisa1234. | 12727310   |

   @EnrollmentPage @Hatali
    # Facebook ile bir kere giriş yapıldığında mail adresi kaydoluyor. Bunun silinmesinin yolu bulunmadan bu case iptal
  Scenario Outline: Nisa Enrolls Successfully With Custom Email
    Given Nisa is not enrolled user with customerId: "<customerId>"
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    When Nisa click Button: "My Modanisa'ya Katıl" in Landing Page
    When Nisa sendKeys Email: "automated.email.adress@gmail.com" in Enrollment Page
    When Nisa click Enroll Button in Enrollment Page
    When Nisa click Complete Button in Enrollment Page
    Then Nisa should see Dashboard Main Page
    Examples:
      | user     | email                            | password  | customerId |
      | facebook | automated.email.adress@gmail.com | Mdns1234. | 12727364   |

  @EnrollmentPage @BackLandingPage
  Scenario Outline: Nisa Go Back to Loyalty Page From Enrollment Form Page with <email> email
    Given Nisa is not enrolled user with customerId: "<customerId>"
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    When Nisa click Button: "My Modanisa'ya Katıl" in Landing Page
    Then Nisa should see Enrollment Page
    When Nisa click to Back Button in Enrollment Page
    Then Nisa should see Button: "My Modanisa'ya Katıl" in Landing Page
    Examples:
      | user   | email                           | password      | customerId |
      | normal | userLoyaltyEnroll4@modanisa.com | Modanisa1234. | 12727311   |

   @enrollmentPage @PhoneBackLandingPage
  Scenario Outline: Nisa Go Back to Loyalty Page From Enrollment Form Page with <email> email
    Given Nisa is not enrolled user with customerId: "<customerId>"
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    When Nisa click Button: "My Modanisa'ya Katıl" in Landing Page
    Then Nisa should see Enrollment Page
    When Nisa click Phone back button
    Then Nisa should see Button: "My Modanisa'ya Katıl" in Landing Page
    Examples:
      | user   | email                           | password      | customerId |
      | normal | userLoyaltyEnroll5@modanisa.com | Modanisa1234. | 12727417   |

  @EnrollmentPage @Hatali
  Scenario Outline: Nisa Try To Enroll With Invalid Email
    Given Nisa is not enrolled user with customerId: "<customerId>"
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    When Nisa click Button: "My Modanisa'ya Katıl" in Landing Page
    When Nisa sendKeys Email: "enes.erdogan@modanisa.com" in Enrollment Page
    When Nisa click Enroll Button in Enrollment Page
    Then Nisa should see Popup Message "Bu e-posta adresine kayıtlı başka bir kullanıcı bulunmaktadır. Lütfen e-posta bilgisini kontrol ediniz." in Enrollment Page
    Examples:
      | user     | email                            | password  | customerId |
      | facebook | automated.email.adress@gmail.com | Mdns1234. | 11064273   |

  @EnrollmentPage @Hatali
  Scenario Outline: Nisa Enrolls Successfully With Custom Email
    Given Nisa is not enrolled user with customerId: "<customerId>"
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    When Nisa click Button: "My Modanisa'ya Katıl" in Landing Page
    When Nisa sendKeys Email: "<sendKeyEmail>" in Enrollment Page
    When Nisa click Enroll Button in Enrollment Page
    When Nisa click Complete Button in Enrollment Page
    Then Nisa should see Dashboard Main Page
    Examples:
      | user     | email                            | password  | customerId | sendKeyEmail          |
      | facebook | automated.email.adress@gmail.com | Mdns1234. | 11064273   | asli.testhb@gmail.com |

  @EnrollmentPage @Hatali
  Scenario Outline: Nisa Check Email Consention Checkbox Facebook
    Given Nisa is not allow any notification permission with customerId: "<customerId>"
    Given Nisa is not enrolled user with customerId: "<customerId>"
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    When Nisa click Button: "My Modanisa'ya Katıl" in Landing Page
    When Nisa sendKeys Email: "<sendKeyEmail>" in Enrollment Page
#    When Nisa click Email Checkbox in Enrollment Page
    When Nisa click Enroll Button in Enrollment Page
    Given Nisa taps on the My Account button in bottom menu bar
    Then Nisa should go to notification settings page
#    Then Nisa should seen "E-mail ile haberdar Olmak İstiyorum" section as "true"
    Examples:
      | user     | email                            | password  | customerId | sendKeyEmail                     |
      | facebook | automated.email.adress@gmail.com | Mdns1234. | 11064273   | automated.email.adress@gmail.com |

  @EnrollmentPage @Hatali
  Scenario Outline: Nisa Check Email Consention Checkbox
    Given Nisa is not allow any notification permission with customerId: "<customerId>"
    Given Nisa is not enrolled user with customerId: "<customerId>"
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    When Nisa click Button: "My Modanisa'ya Katıl" in Landing Page
#    When Nisa click Email Checkbox in Enrollment Page
    When Nisa click Enroll Button in Enrollment Page
    Given Nisa taps on the My Account button in bottom menu bar
    Then Nisa should go to notification settings page
#    Then Nisa should seen "E-mail ile haberdar Olmak İstiyorum" section as "true"
    Examples:
      | user   | email                           | password      | customerId |
      | normal | userLoyaltyEnroll6@modanisa.com | Modanisa1234. | 12727418   |


  @EnrollmentPage @ClickKullanımKoşulları
  Scenario Outline: Nisa displays and clicks on the Terms Of Use on the Enrollment Page with <email> email.
    Given Nisa is not enrolled user with customerId: "<customerId>"
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    When Nisa click Button: "My Modanisa'ya Katıl" in Landing Page
    Then Nisa should see Enrollment Page
    Then Nisa should see Button: "Kullanım Koşulları" in Enrollment Page
    When Nisa click Button: "Kullanım Koşulları" in Enrollment Page
    Examples:
      | user   | email                           | password      | customerId |
      | normal | userLoyaltyEnroll7@modanisa.com | Modanisa1234. | 12727419   |


  @EnrollmentPage @CloseKullanımKoşullari
  Scenario Outline: Nisa closes on the Terms Of Use on the Enrollment Page with <email> email.
    Given Nisa is not enrolled user with customerId: "<customerId>"
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    When Nisa click Button: "My Modanisa'ya Katıl" in Landing Page
    Then Nisa should see Enrollment Page
    When Nisa click Button: "Kullanım Koşulları" in Enrollment Page
    Then Nisa should see Page Terms Title: "Kullanım Koşulları" in Enrollment Page
    When Nisa click Page Terms Close Button in Enrollment Page
    Then Nisa should see Enrollment Page
    Examples:
      | user   | email                           | password      | customerId |
      | normal | userLoyaltyEnroll8@modanisa.com | Modanisa1234. | 12727420   |

  @EnrollmentPage @Hatali123
    #Android'te çalışıyor.
  Scenario Outline: Nisa closes Kullanım Koşulları Phone back
    Given Nisa is not enrolled user with customerId: "<customerId>"
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    When Nisa click Button: "My Modanisa'ya Katıl" in Landing Page
    Then Nisa should see Enrollment Page
    When Nisa click Button: "Kullanım Koşulları" in Enrollment Page
    Then Nisa should see Page Terms Title: "Kullanım Koşulları" in Enrollment Page
    When Nisa click Phone back button
    Then Nisa should see Enrollment Page
    Examples:
      | user   | email                           | password      | customerId |
      | normal | userLoyaltyEnroll9@modanisa.com | Modanisa1234. | 12727421   |

  @EnrollmentPage @ClickGizlilikBildirimleri
  Scenario Outline: Nisa displays and clicks on the Privacy Notices on the Enrollment Page with <email> email.
    Given Nisa is not enrolled user with customerId: "<customerId>"
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    When Nisa click Button: "My Modanisa'ya Katıl" in Landing Page
    Then Nisa should see Enrollment Page
    Then Nisa should see Button: "Gizlilik Bildirimleri" in Enrollment Page
    When Nisa click Button: "Gizlilik Bildirimleri" in Enrollment Page
    Examples:
      | user   | email                           | password      | customerId |
      | normal | userLoyaltyEnroll10@modanisa.com | Modanisa1234. | 12727422   |

  @EnrollmentPage @CloseGizlilikBildirimleri
  Scenario Outline: Nisa closes on the Privacy Notices on the Enrollment Page with <email> email.
    Given Nisa is not enrolled user with customerId: "<customerId>"
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    When Nisa click Button: "My Modanisa'ya Katıl" in Landing Page
    Then Nisa should see Enrollment Page
    When Nisa click Button: "Gizlilik Bildirimleri" in Enrollment Page
    Then Nisa should see Privacy Policy Title: "Gizlilik ve Üyelik" in Enrollment Page
    When Nisa click Privacy Policy Close Button in Enrollment Page
    Then Nisa should see Enrollment Page
    Examples:
      | user   | email                           | password      | customerId |
      | normal | userLoyaltyEnroll11@modanisa.com | Modanisa1234. | 12727423   |

  @EnrollmentPage @Hatali
    #Anroid'te çalışıyor.
  Scenario Outline: Nisa closes Gizlilik Bildirimleri Phone Back
    Given Nisa is not enrolled user with customerId: "<customerId>"
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    When Nisa click Button: "My Modanisa'ya Katıl" in Landing Page
    Then Nisa should see Enrollment Page
    When Nisa click Button: "Gizlilik Bildirimleri" in Enrollment Page
    Then Nisa should see Privacy Policy Title: "Gizlilik ve Üyelik" in Enrollment Page
    When Nisa click Phone back button
    Then Nisa should see Enrollment Page
    Examples:
      | user   | email                           | password      | customerId |
      | normal | userLoyaltyEnroll12@modanisa.com | Modanisa1234. | 12727424   |
