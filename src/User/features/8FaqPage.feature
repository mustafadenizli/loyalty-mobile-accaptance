Feature: FAQ Page

  As Nisa
  I want to see a FAQ page
  So that I know how to benefit best from the loyalty program

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
    When Nisa click to Faq in Dashboard Main Page

  @SD9
  Scenario:Nisa Sees FAQ Page
    Then Nisa should see Faq Page Title

  @SD9
  Scenario:Nisa Sees FAQ Modal
    When Nisa click to Faq Name: "My Modanisa nedir" in Faq Page
    Then Nisa should see Faq Modal Title "My Modanisa nedir"
    Then Nisa should see Faq Modal Description "My Modanisa, Modanisa müşterilerinin ayrıcaklı dünyasıdır."

  @SD9
  Scenario:Nisa Closed FAQ Detail Modal
    When Nisa click to Faq Name: "My Modanisa nedir" in Faq Page
    When Nisa click to Faq Modal Close Button
    Then Nisa should see Faq Page Title

  @SD9
  Scenario:Nisa goes back to Dashboard Main Page from “Popular Questions Section” page
    When Nisa click to Back Button in Faq Page
    Then Nisa should see Dashboard Main Page


