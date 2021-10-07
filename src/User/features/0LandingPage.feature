@Deneme
Feature: Loyalty Landing Page

  AS Nisa
  I WANT to know about the features of the loyalty program
  SO THAT I can decide whether to enroll in the loyalty program

  Background:
    Given Nisa waits for Welcome page
    Given Nisa changes the Country to "Türkiye" from the Shipping Country picker in Welcome page
    Given Nisa changes the Language to "TR" from the Language picker in Welcome page
    Given Nisa taps on the Start Shopping button in Welcome page
    Given Nisa waits for Home page
    Given Nisa taps on the My Account button in bottom menu bar

  Scenario: Nisa has landed "Landing Page"
    Given Nisa login with email: "landing.test.user@modanisa.com" and password: "Modanisa123"
    When Nisa taps to MyModanisa section
    Then Nisa should see Landing Page Title
    Then Nisa should see Description: "My Modanisa ayrıcalıklar dünyası bu kapının arkasında" in Landing Page
    Then Nisa should see Button: "My Modanisa'ya Katıl" in Landing Page

  Scenario: Nisa has landed "Landing Page"
    When Nisa taps to MyModanisa section
    Then Nisa should see Landing Page Title
    Then Nisa should see Description: "My Modanisa ayrıcalıklar dünyası bu kapının arkasında" in Landing Page
    Then Nisa should see Button: "Giriş Yap" in Landing Page

  Scenario: Nisa has landed "Landing Page"
    Given Nisa login with email: "landing.test.user@modanisa.com" and password: "Modanisa123"
    When Nisa taps to MyModanisa section
    Then Nisa should see Tab: "Program Özellikleri" in Landing Page
    Then Nisa should see Tab: "Puan Kazanımı" in Landing Page
    Then Nisa should see Tab: "Hediye Seçimi" in Landing Page
    When Nisa click to Tab: "Program Özellikleri" in Landing Page
    Then Nisa should see Tab Card: "Kargo Bedava Fırsatları" in Landing Page
    When Nisa click to Tab: "Puan Kazanımı" in Landing Page
    Then Nisa should see Tab Card: "Hoş Geldin Puanı" in Landing Page
    When Nisa click to Tab: "Hediye Seçimi" in Landing Page
    Then Nisa should see Tab Card: "Modanisa Hediye Çekleri" in Landing Page

  Scenario: Nisa has landed "Landing Page"
    When Nisa taps to MyModanisa section
    Then Nisa should see Tab: "Program Özellikleri" in Landing Page
    Then Nisa should see Tab: "Puan Kazanımı" in Landing Page
    Then Nisa should see Tab: "Hediye Seçimi" in Landing Page
    When Nisa click to Tab: "Program Özellikleri" in Landing Page
    Then Nisa should see Tab Card: "Kargo Bedava Fırsatları" in Landing Page
    When Nisa click to Tab: "Puan Kazanımı" in Landing Page
    Then Nisa should see Tab Card: "Hoş Geldin Puanı" in Landing Page
    When Nisa click to Tab: "Hediye Seçimi" in Landing Page
    Then Nisa should see Tab Card: "Modanisa Hediye Çekleri" in Landing Page

  Scenario: Nisa has landed "Landing Page"
    Given Nisa login with email: "landing.test.user@modanisa.com" and password: "Modanisa123"
    When Nisa taps to MyModanisa section
    Then Nisa should see Faq Area Name: "POPÜLER SORULAR" in Landing Page
    Then Nisa should see Faq Name: "My Modanisa nedir?" in Landing Page
    Then Nisa should see Faq Name: "My Modanisa'ya nasıl kayıt olurum?" in Landing Page
    Then Nisa should see Faq Name: "My Modanisa ne gibi ayrıcalıklar sağlar?" in Landing Page
    Then Nisa should see All Faq: "Tüm Sorular" in Landing Page

  Scenario: Nisa has landed "Landing Page"
    Given Nisa login with email: "landing.test.user@modanisa.com" and password: "Modanisa123"
    When Nisa taps to MyModanisa section
    When Nisa click to Faq Name: "My Modanisa nedir" in Landing Page
    Then Nisa should see Faq Modal Title "My Modanisa nedir?"
    Then Nisa should see Faq Modal Description "My Modanisa, Modanisa müşterilerinin ayrıcaklı dünyasıdır"
    When Nisa click to Faq Modal Close Button
    Then Nisa should see Landing Page Title
    When Nisa click to Faq Name: "My Modanisa’ya nasıl kayıt olurum?" in Landing Page
    Then Nisa should see Faq Modal Title "My Modanisa’ya nasıl kayıt olurum?"
    When Nisa click to Faq Modal Close Button
    Then Nisa should see Landing Page Title
    When Nisa click to Faq Name: "My Modanisa ne gibi ayrıcalıklar sağlar?" in Landing Page
    Then Nisa should see Faq Modal Title "My Modanisa ne gibi ayrıcalıklar sağlar?"
    Then Nisa should see Faq Modal Description "My Modanisa’ya kayıt olduktan sonra"
    When Nisa click to Faq Modal Close Button
    Then Nisa should see Landing Page Title
    When Nisa click to All Faq in Landing Page
    Then Nisa should see Faq Page Title
    When Nisa click to Back Button in Faq Page
    Then Nisa should see Landing Page Title

  Scenario: Nisa has landed "Landing Page"
    When Nisa taps to MyModanisa section
    Then Nisa should see Faq Area Name: "POPÜLER SORULAR" in Landing Page
    Then Nisa should see Faq Name: "My Modanisa nedir?" in Landing Page
    Then Nisa should see Faq Name: "My Modanisa'ya nasıl kayıt olurum?" in Landing Page
    Then Nisa should see Faq Name: "My Modanisa ne gibi ayrıcalıklar sağlar?" in Landing Page
    Then Nisa should see All Faq: "Tüm Sorular" in Landing Page

  Scenario: Nisa has landed "Landing Page"
    When Nisa taps to MyModanisa section
    When Nisa click to Faq Name: "My Modanisa nedir" in Landing Page
    Then Nisa should see Faq Modal Title "My Modanisa nedir?"
    Then Nisa should see Faq Modal Description "My Modanisa, Modanisa müşterilerinin ayrıcaklı dünyasıdır"
    When Nisa click to Faq Modal Close Button
    Then Nisa should see Landing Page Title
    When Nisa click to Faq Name: "My Modanisa’ya nasıl kayıt olurum?" in Landing Page
    Then Nisa should see Faq Modal Title "My Modanisa’ya nasıl kayıt olurum?"
    When Nisa click to Faq Modal Close Button
    Then Nisa should see Landing Page Title
    When Nisa click to Faq Name: "My Modanisa ne gibi ayrıcalıklar sağlar?" in Landing Page
    Then Nisa should see Faq Modal Title "My Modanisa ne gibi ayrıcalıklar sağlar?"
    Then Nisa should see Faq Modal Description "My Modanisa’ya kayıt olduktan sonra"
    When Nisa click to Faq Modal Close Button
    Then Nisa should see Landing Page Title
    When Nisa click to All Faq in Landing Page
    Then Nisa should see Faq Page Title
    When Nisa click to Back Button in Faq Page

  Scenario: Nisa Has Tapped 'Login Button' on ‘Loyalty Page’ Navigate To Legacy Login Page
    When Nisa taps to MyModanisa section
    When Nisa click Button: "Giriş Yap" in Landing Page
    Then Nisa should see Login Page

  Scenario: Nisa Has Tapped 'Login Button' on ‘Loyalty Page’ Navigate To Legacy Login Page
    Given Nisa login with email: "landing.test.user@modanisa.com" and password: "Modanisa123"
    When Nisa taps to MyModanisa section
    When Nisa click Button: "My Modanisa'ya Katıl" in Landing Page
    Then Nisa should see Enrollment Page Title

  Scenario: Nisa Has Not See Enroll Button And Warning Message When She Is Wholesaler
    Given Nisa login with email: "toptanci.musteri@modanisa.com" and password: "Testhb123"
    When Nisa taps to MyModanisa section
    When Nisa click Button: "My Modanisa'ya Katıl" in Landing Page
    Then Nisa should see Popup Message "My Modanisa kayıt ve kullanım koşulları gereği, kayıt işleminiz yapılamamaktadır. Detaylı bilgi için Modanisa Müşteri Hizmetleri ile görüşebilirsiniz" in Landing Page

  Scenario: Nisa Has Not See Enroll Button And Warning Message When She Is Blacklisted
    Given Nisa login with email: "problemli.musteri@modanisa.com" and password: "Testhb123"
    When Nisa taps to MyModanisa section
    When Nisa click Button: "My Modanisa'ya Katıl" in Landing Page
    Then Nisa should see Popup Message "My Modanisa kayıt ve kullanım koşulları gereği, kayıt işleminiz yapılamamaktadır. Detaylı bilgi için Modanisa Müşteri Hizmetleri ile görüşebilirsiniz" in Landing Page

  Scenario: Nisa Goes Back To My Account Page From Loyalty Page
    Given Nisa login with email: "landing.test.user@modanisa.com" and password: "Modanisa123"
    When Nisa taps to MyModanisa section
    When Nisa click to Back Button in Landing Page
    Then Nisa should see My Account page

  Scenario: Nisa Goes Back To My Account Page From Loyalty Page
    When Nisa taps to MyModanisa section
    When Nisa click to Back Button in Landing Page
    Then Nisa should see My Account page
