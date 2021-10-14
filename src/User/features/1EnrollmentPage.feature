Feature: Navigate To Customer Loyalty Page

  As Nisa
  I want to be able to access Loyalty Page with an Enrollment button
  So that I will be attracted to the Loyalty Program and start my enrollment process.

  Background:
    Given Nisa waits for Welcome page
    Given Nisa changes the Country to "Türkiye" from the Shipping Country picker in Welcome page
    Given Nisa changes the Language to "TR" from the Language picker in Welcome page
    Given Nisa taps on the Start Shopping button in Welcome page
    Given Nisa waits for Home page
    Given Nisa taps on the My Account button in bottom menu bar

  @S57
  Scenario: Nisa Open Loyalty Page as Logged In and Not Enrolled User
    Given Nisa login with email: "testAndroid1@modanisa.com" and password: "asdfgh"
    When Nisa taps to MyModanisa section
    Then Nisa should see Button: "My Modanisa'ya Katıl" in Landing Page

  @S57
  Scenario: Nisa Open Loyalty Page as Logged In and Enrolled User
    Given Nisa is enrolled user with customerId: "9027919" and e-mail: "isimli.soyisimli@modanisa.com"
    Given Nisa login with email: "isimli.soyisimli@modanisa.com" and password: "Testhb123"
    When Nisa taps to MyModanisa section
    Then Nisa should see Dashboard Main Page

  @S80 @enrollment
  Scenario: Nisa Enrolls Successfully With Default User Data
    Given Nisa is not enrolled user with customerId: "10183940"
    Given Nisa login with email: "lnotenrolled@gmail.com" and password: "Modanisa123"
    When Nisa taps to MyModanisa section
    When Nisa click Button: "My Modanisa'ya Katıl" in Landing Page
    Then Nisa should see Enroll Button: "Kayıt Ol" in Enrollment Page
    When Nisa click Enroll Button in Enrollment Page
    When Nisa click Complete Button in Enrollment Page
    Then Nisa should see Dashboard Main Page

  @S80 @enrollment
  Scenario: Nisa Enrolls Successfully With Custom Email
    Given Nisa is not enrolled user with customerId: "11064273"
    Given Nisa login with facebook email: "automated.email.adress@gmail.com" and password: "Mdns1234."
    When Nisa taps to MyModanisa section
    When Nisa click Button: "My Modanisa'ya Katıl" in Landing Page
    When Nisa sendKeys Email: "asli.testhb@gmail.com" in Enrollment Page
    When Nisa click Enroll Button in Enrollment Page
    When Nisa click Complete Button in Enrollment Page
    Then Nisa should see Dashboard Main Page

  @S80 @enrollment
  Scenario: Nisa Go Back to Loyalty Page From Enrollment Form Page
    Given Nisa is not enrolled user with customerId: "10183940"
    Given Nisa login with email: "lnotenrolled@gmail.com" and password: "Modanisa123"
    When Nisa taps to MyModanisa section
    When Nisa click Button: "My Modanisa'ya Katıl" in Landing Page
    When Nisa click to Back Button in Enrollment Page
    Then Nisa should see Button: "My Modanisa'ya Katıl" in Landing Page


  @S80 @enrollment
  Scenario: Nisa Try To Enroll With Invalid Email
    Given Nisa is not enrolled user with customerId: "11064273"
    Given Nisa login with facebook email: "automated.email.adress@gmail.com" and password: "Mdns1234."
    When Nisa taps to MyModanisa section
    When Nisa click Button: "My Modanisa'ya Katıl" in Landing Page
    When Nisa sendKeys Email: "yasin.alkan@mdoanisa.com" in Enrollment Page
    When Nisa click Enroll Button in Enrollment Page
    Then Nisa should see Popup Message "Bu e-posta adresine kayıtlı başka bir kullanıcı bulunmaktadır. Lütfen e-posta bilgisini kontrol ediniz." in Enrollment Page

  @S80
  Scenario: Nisa Check Email Consention Checkbox
    Given Nisa is not allow any notification permission with customerId: "11064273"
    Given Nisa is not enrolled user with customerId: "11064273"
    Given Nisa login with facebook email: "automated.email.adress@gmail.com" and password: "Mdns1234."
    When Nisa taps to MyModanisa section
    When Nisa click Button: "My Modanisa'ya Katıl" in Landing Page
    When Nisa sendKeys Email: "automated.email.adress@gmail.com" in Enrollment Page
    When Nisa click Email Checkbox in Enrollment Page
    When Nisa click Enroll Button in Enrollment Page
    Given Nisa taps on the My Account button in bottom menu bar
    Then Nisa should go to notification settings page
    Then Nisa should seen "E-mail ile haberdar Olmak İstiyorum" section as "true"


  @S80_3
  Scenario: Nisa taps Kullanım Koşulları
    Given Nisa is not enrolled user with customerId: "10184008"
    Given Nisa login with email: "not.enrolled.loyant@modanisa.com" and password: "Testhb123"
    When Nisa taps to MyModanisa section
    When Nisa click Button: "My Modanisa'ya Katıl" in Landing Page
    Then Nisa should see Enrollment Page
    Then Nisa should see Button: "Kullanım Koşulları" in Enrollment Page
    When Nisa click Button: "Kullanım Koşulları" in Enrollment Page

  @S80_3
  Scenario: Nisa closes Kullanım Koşulları
    Given Nisa is not enrolled user with customerId: "10184008"
    Given Nisa login with email: "not.enrolled.loyant@modanisa.com" and password: "Testhb123"
    When Nisa taps to MyModanisa section
    When Nisa click Button: "My Modanisa'ya Katıl" in Landing Page
    Then Nisa should see Enrollment Page
    When Nisa click Button: "Kullanım Koşulları" in Enrollment Page
    Then Nisa should see Page Terms Title: "Kullanım Koşulları" in Enrollment Page
    When Nisa click Page Terms Close Button in Enrollment Page
    Then Nisa should see Enrollment Page

  @S80_3
  Scenario: Nisa taps Gizlilik Bildirimleri
    Given Nisa is not enrolled user with customerId: "10184008"
    Given Nisa login with email: "not.enrolled.loyant@modanisa.com" and password: "Testhb123"
    When Nisa taps to MyModanisa section
    When Nisa click Button: "My Modanisa'ya Katıl" in Landing Page
    Then Nisa should see Enrollment Page
    Then Nisa should see Button: "Gizlilik Bildirimleri" in Enrollment Page
    When Nisa click Button: "Gizlilik Bildirimleri" in Enrollment Page

  @S80_3
  Scenario: Nisa closes Gizlilik Bildirimleri
    Given Nisa is not enrolled user with customerId: "10184008"
    Given Nisa login with email: "not.enrolled.loyant@modanisa.com" and password: "Testhb123"
    When Nisa taps to MyModanisa section
    When Nisa click Button: "My Modanisa'ya Katıl" in Landing Page
    Then Nisa should see Enrollment Page
    When Nisa click Button: "Gizlilik Bildirimleri" in Enrollment Page
    Then Nisa should see Privacy Policy Title: "Gizlilik ve Üyelik" in Enrollment Page
    When Nisa click Privacy Policy Close Button in Enrollment Page
    Then Nisa should see Enrollment Page
