Feature: Dashboard Main Page

  As Nisa
  I want to know my loyalty point metrcis
  So that I can see my confirmed or pending points

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

  @Deneme
  Scenario:Nisa Sees Her Confirmed Points on Dashboard Main Page
    Then Nisa should see Confirmed Points Name: "Güncel Puanlarım" in Dashboard Main Page
    Then Nisa should see Confirmed Points: "5" in Dashboard Main Page


  @SD1
  Scenario:Nisa Sees Her Pending Points on Dashboard Main Page
    Given Nisa add Pending Point with customerId: "9027919" and pendingPoint: "10"
    Then Nisa should see Pending Points: "5" in Dashboard Main Page

  @SD1
  Scenario:Nisa Sees Her Name on Dashboard Main Page
    Then Nisa should see Welcome Text: "Merhaba" in Dashboard Main Page

  @SD1
  Scenario:Nisa Does not See Her Name on Dashboard Main Page
    Then Nisa should see Her Name: "Rukiye" in Dashboard Main Page

  @SD1
  Scenario:Nisa Goes Back to Previous Page From Dashboard Main Page
    When Nisa click to Back Button in Dashboard Main Page
    Then Nisa should see My Account page
