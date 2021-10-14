Feature: My Earned Gift List

  As Nisa
  I want to reach the list of gifts that I have earned
  So that I can use them before my gifts are expired

  Background:
    Given Nisa waits for Welcome page
    Given Nisa changes the Country to "Türkiye" from the Shipping Country picker in Welcome page
    Given Nisa changes the Language to "TR" from the Language picker in Welcome page
    Given Nisa taps on the Start Shopping button in Welcome page
    Given Nisa waits for Home page
    Given Nisa taps on the My Account button in bottom menu bar
    Given Nisa is not enrolled user with customerId: "10184003"
    Given Nisa is enrolled user with customerId: "10184003" and e-mail: "isimli.soyisimli@modanisa.com"
    Given Nisa login with email: "isimli.soyisimli@modanisa.com" and password: "Testhb123"
    When Nisa taps to MyModanisa section
    Then Nisa should see Dashboard Main Page
    When Nisa click to My Earned Gifts in Dashboard Main Page
    Then Nisa should see My Earned Gifts Page

  @SD7
  Scenario: Nisa Sees Her Earned Gifts on Kazandığım Hediyeler page
    Then Nisa should see Gift Name: "" in My Earned Gifts Page

  @SD7
  Scenario: Nisa Sees Her Earned Gifts in Red Color Whose Expire Date is 7 days later on Kazandığım Hediyeler page
    Then Nisa should see Gift Name: "" in My Earned Gifts Page
    Then Nisa should see Gift Expiration Date: "" to Gift Name:"" in My Earned Gifts Page

  @SD7
  Scenario: Nisa goes back to previous page from Kazandığım Hediyeler Page
    When Nisa click to Back Button in My Earned Gifts Page
    Then Nisa should see Dashboard Main Page

  @SD7.1
  Scenario: Nisa Sees Her Earned Gifts which as expired on Kazandığım Hediyeler page
    Then Nisa should see Gift Expiration Date: "Son Kullanım Tarihi Doldu" in My Earned Gifts Page

