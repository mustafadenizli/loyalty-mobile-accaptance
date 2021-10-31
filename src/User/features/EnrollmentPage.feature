Feature: Navigate To Customer Loyalty Page

  As Nisa
  I want to be able to access Loyalty Page with an Enrollment button
  So that I will be attracted to the Loyalty Program and start my enrollment process.

  | status    | Emails                            | Passwords      | CustomerIDs |
  | facebook  | userloyaltyEnroll@yandex.com      | Modanisa1234.  | 12727273    |
  | normal    | userloyaltyEnroll1@modanisa.com   | Modanisa1234.  | 12727275    |
  | normal    | userloyaltyEnroll2@modanisa.com   | Modanisa1234.  | 12727275    |
  | normal    | userloyaltyEnroll3@modanisa.com   | Modanisa1234.  | 12727310    |
  | normal    | userloyaltyEnroll4@modanisa.com   | Modanisa1234.  | 12727311    |


  Background:
    Given Nisa waits for Welcome page
    Given Nisa changes the Country to "Türkiye" from the Shipping Country picker in Welcome page
    Given Nisa changes the Language to "TR" from the Language picker in Welcome page
    Given Nisa taps on the Start Shopping button in Welcome page
    Given Nisa waits for Home page
    Given Nisa taps on the My Account button in bottom menu bar
    Given Nisa sendKey private api "customer-legacy-mdns-api-staging.modanisa.net" and restart app
    Given Nisa taps on the My Account button in bottom menu bar

  @S57
  Scenario Outline: Nisa Open Loyalty Page as Logged In and Not Enrolled User
    Given Nisa is not enrolled user with customerId: "<customerId>"
    Given Nisa login with user:"<status>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    When Nisa click Button: "My Modanisa'ya Katıl" in Landing Page
    Then Nisa should see Enrollment Page
    Examples:
      | status | email                           | password      | customerId |
      | normal | userloyaltyEnroll1@modanisa.com | Modanisa1234. | 12727275   |

  @S57
  Scenario Outline: Nisa Open Loyalty Page as Logged In and Enrolled User
    Given Nisa is not enrolled user with customerId: "<customerId>"
    Given Nisa is enrolled user with customerId: "<customerId>" and e-mail: "<email>"
    Given Nisa login with user:"<status>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    Then Nisa should see Dashboard Main Page
    Examples:
      | status | email                           | password      | customerId |
      | normal | userloyaltyEnroll1@modanisa.com | Modanisa1234. | 12727275   |

  @S80 @enrollment
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
      | normal | userloyaltyEnroll3@modanisa.com | Modanisa1234. | 12727310   |

  @S80 @enrollment
  Scenario Outline: Nisa Enrolls Successfully With Custom Email
    Given Nisa is not enrolled user with customerId: "<customerId>"
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    When Nisa click Button: "My Modanisa'ya Katıl" in Landing Page
    When Nisa sendKeys Email: "asli.testhb@gmail.com" in Enrollment Page
    When Nisa click Enroll Button in Enrollment Page
    When Nisa click Complete Button in Enrollment Page
    Then Nisa should see Dashboard Main Page
    Examples:
      | user     | email                            | password      | customerId |
      | facebook | automated.email.adress@gmail.com | Modanisa1234. | 11064273   |

  @S80 @enrollment
  Scenario Outline: Nisa Go Back to Loyalty Page From Enrollment Form Page
    Given Nisa is not enrolled user with customerId: "<customerId>"
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    When Nisa click Button: "My Modanisa'ya Katıl" in Landing Page
    When Nisa click to Back Button in Enrollment Page
    Then Nisa should see Button: "My Modanisa'ya Katıl" in Landing Page
    Examples:
      | user   | email                           | password      | customerId |
      | normal | userloyaltyEnroll1@modanisa.com | Modanisa1234. | 12727275   |

  @S80 @enrollment
  Scenario Outline: Nisa Go Back to Loyalty Page From Enrollment Form Page Custom Email
    Given Nisa is not enrolled user with customerId: "<customerId>"
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    When Nisa click Button: "My Modanisa'ya Katıl" in Landing Page
    When Nisa click Phone back button
    Then Nisa should see Button: "My Modanisa'ya Katıl" in Landing Page
    Examples:
      | user     | email                            | password      | customerId |
      | facebook | automated.email.adress@gmail.com | Modanisa1234. | 11064273   |

  @S80 @enrollment
  Scenario Outline: Nisa Try To Enroll With Invalid Email
    Given Nisa is not enrolled user with customerId: "<customerId>"
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    When Nisa click Button: "My Modanisa'ya Katıl" in Landing Page
    When Nisa sendKeys Email: "yasin.alkan@modanisa.com" in Enrollment Page
    When Nisa click Enroll Button in Enrollment Page
#    Then Nisa should see Popup Message "Bu e-posta adresine kayıtlı başka bir kullanıcı bulunmaktadır. Lütfen e-posta bilgisini kontrol ediniz." in Enrollment Page
    Examples:
      | user     | email                            | password      | customerId |
      | facebook | automated.email.adress@gmail.com | Modanisa1234. | 11064273   |

  @S80 @enrollment
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
      | user     | email                            | password      | customerId | sendKeyEmail          |
      | facebook | automated.email.adress@gmail.com | Modanisa1234. | 11064273   | asli.testhb@gmail.com |

  @S80 @Hatali
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
      | user     | email                            | password      | customerId | sendKeyEmail                     |
      | facebook | automated.email.adress@gmail.com | Modanisa1234. | 11064273   | automated.email.adress@gmail.com |

  @S80 @Hatali
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
      | normal | userLoyaltyEnroll4@modanisa.com | Modanisa1234. | 12727311   |


  @S80_3
  Scenario Outline: Nisa taps Kullanım Koşulları
    Given Nisa is not enrolled user with customerId: "<customerId>"
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    When Nisa click Button: "My Modanisa'ya Katıl" in Landing Page
    Then Nisa should see Enrollment Page
    Then Nisa should see Button: "Kullanım Koşulları" in Enrollment Page
    When Nisa click Button: "Kullanım Koşulları" in Enrollment Page
    Examples:
      | user   | email                           | password      | customerId |
      | normal | userloyaltyEnroll1@modanisa.com | Modanisa1234. | 12727275   |


  @S80_3
  Scenario Outline: Nisa closes Kullanım Koşulları
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
      | normal | userloyaltyEnroll1@modanisa.com | Modanisa1234. | 12727275   |

  @S80_3
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
      | normal | userloyaltyEnroll1@modanisa.com | Modanisa1234. | 12727275   |

  @S80_3
  Scenario Outline: Nisa taps Gizlilik Bildirimleri
    Given Nisa is not enrolled user with customerId: "<customerId>"
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    When Nisa click Button: "My Modanisa'ya Katıl" in Landing Page
    Then Nisa should see Enrollment Page
    Then Nisa should see Button: "Gizlilik Bildirimleri" in Enrollment Page
    When Nisa click Button: "Gizlilik Bildirimleri" in Enrollment Page
    Examples:
      | user   | email                           | password      | customerId |
      | normal | userloyaltyEnroll1@modanisa.com | Modanisa1234. | 12727275   |

  @S80_3
  Scenario Outline: Nisa closes Gizlilik Bildirimleri
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
      | normal | userloyaltyEnroll1@modanisa.com | Modanisa1234. | 12727275   |

  @S80_3
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
      | normal | userloyaltyEnroll1@modanisa.com | Modanisa1234. | 12727275   |
