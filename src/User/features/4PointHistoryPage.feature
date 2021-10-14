Feature: My Points History Page

  As Nisa
  I want to see how many points I got from what challenges, on what date
  So that I can keep track number of points I have earned from each challenge

  Background:
    Given Nisa waits for Welcome page
    Given Nisa changes the Country to "Türkiye" from the Shipping Country picker in Welcome page
    Given Nisa changes the Language to "TR" from the Language picker in Welcome page
    Given Nisa taps on the Start Shopping button in Welcome page
    Given Nisa waits for Home page
    Given Nisa taps on the My Account button in bottom menu bar
    Given Nisa is not enrolled user with customerId: "9027919"
    Given Nisa is enrolled user with customerId: "9027919" and e-mail: "isimli.soyisimli@modanisa.com"
    Given Nisa login with email: "isimli.soyisimli@modanisa.com" and password: "Testhb123"
    When Nisa taps to MyModanisa section
    Then Nisa should see Dashboard Main Page
    When Nisa click to Point Earning in Dashboard Main Page
    When Nisa click to Point History in Point Earning Page
    Then Nisa should see Point History Page

  @SD3
  Scenario: Nisa Sees Her Confirmed Points on My Points History
    Then Nisa should see Challenge Name: "Hoşgeldin Puanı" in Point History Page
    Then Nisa should see Challenge Date: "29.09.2021" in Point History Page
    Then Nisa should see Challenge Point: "5 puan onaylandı" in Point History Page

  @SD3
  Scenario: Nisa goes back to previous page from Puan Geçmişim section
    When Nisa click to Back Button in Point History Page
    Then Nisa should see Dashboard Main Page

