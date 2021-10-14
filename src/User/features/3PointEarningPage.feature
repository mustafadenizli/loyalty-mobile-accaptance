Feature: Points Earning Page

  As Nisa
  I want to know how I can earn points with My Modanisa
  So that I can get a gift that interests me by collecting enough points by performing the necessary actions.

  Background:
    Given Nisa waits for Welcome page
    Given Nisa changes the Country to "Türkiye" from the Shipping Country picker in Welcome page
    Given Nisa changes the Language to "TR" from the Language picker in Welcome page
    Given Nisa taps on the Start Shopping button in Welcome page
    Given Nisa waits for Home page
    Given Nisa taps on the My Account button in bottom menu bar
    Given Nisa is not enrolled user with customerId: "10183940"
    Given Nisa is enrolled user with customerId: "10183940" and e-mail: "lnotenrolled@gmail.com"
    Given Nisa login with email: "lnotenrolled@gmail.com" and password: "Modanisa123"
    When Nisa taps to MyModanisa section
    Then Nisa should see Dashboard Main Page


  @SD2 @PointsEarning
  Scenario: Nisa Sees Challenges In A Specific Order
    When Nisa click to Point Earning in Dashboard Main Page
    Then Nisa should see Challenges in Point Earning Page

  @SD2 @PointsEarning
  Scenario: Nisa Sees That She Will Earn Points For Every Fixed-Predetermined Amount of Money She spend From Her Purchases
    When Nisa click to Point Earning in Dashboard Main Page
    Then Nisa should see Point Earning Page
    Then Nisa shoul see Challenge Title: "Doğum Günü Hediyesi" in Point Earning Page
    Then Nisa shoul see Challenge Description: "Doğum gününde ekstra puan kazan" in Point Earning Page
    Then Nisa shoul see Challenge Points: "3 puan" in Point Earning Page

  @SD2 @PointsEarning
  Scenario: Nisa Goes Back To Previous Page From Points Earnings Page
    When Nisa click to Point Earning in Dashboard Main Page
    Then Nisa should see Point Earning Page
    When Nisa click to Back Button in Point Earning Page
    Then Nisa should see Dashboard Main Page

