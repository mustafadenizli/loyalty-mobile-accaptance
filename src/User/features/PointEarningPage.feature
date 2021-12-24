Feature: Points Earning Page

  As Nisa
  I want to know how I can earn points with My Modanisa
  So that I can get a gift that interests me by collecting enough points by performing the necessary actions.

  | status    | Emails                                | Passwords      | CustomerIDs |
  | normal    | userLoyaltyPointEarning@modanisa.com  | Modanisa1234.  | 12727301    |
  | normal    | userLoyaltyPointEarning1@modanisa.com  | Modanisa1234. | 12727406	 |
  | normal    | userLoyaltyPointEarning2@modanisa.com  | Modanisa1234. | 12727407	 |
  | normal    | userLoyaltyPointEarning3@modanisa.com  | Modanisa1234. | 12727408    |
  | normal    | userLoyaltyPointEarning4@modanisa.com  | Modanisa1234. | 12727409    |


  Background:
    Given Nisa waits for Welcome page
    Given Nisa changes the Country to "Turkey" from the Shipping Country picker in Welcome page
    Given Nisa changes the Language to "Türkçe" from the Language picker in Welcome page
    Given Nisa taps on the Start Shopping button in Welcome page
    Given Nisa waits for Home page
    Given Nisa taps on the My Account button in bottom menu bar
    Given Nisa sendKey private api "customer-legacy-mdns-api-staging.modanisa.net" and restart app
    Given Nisa taps on the My Account button in bottom menu bar
    Given Nisa is not enrolled user with customerId: "12727301"
    Given Nisa is enrolled user with customerId: "12727301" and e-mail: "userLoyaltyPointEarning@modanisa.com"
    Given Nisa login with user:"normal" email: "userLoyaltyPointEarning@modanisa.com" and password: "Modanisa1234."
    When Nisa taps to My Modanisa section
    Then Nisa should see Dashboard Main Page


  @SD2 @PointsEarning
  Scenario: Nisa Sees Challenges In Point Earning Page
    When Nisa click to Point Earning in Dashboard Main Page
    Then Nisa should see Challenges in Point Earning Page
    Then Nisa should see sorted Challenges in Point Earning Page


  @SD2 @PointsEarning
  Scenario Outline: Nisa Sees That She Will Earn Points For Every Fixed-Predetermined Amount of Money She spend From Her Purchases
    When Nisa click to Point Earning in Dashboard Main Page
    Then Nisa should see Point Earning Page
    Then Nisa should see Challenge Title: "<title>" in Point Earning Page
    Then Nisa should see Challenge Description: "<description>" in Point Earning Page
    Then Nisa should see Challenge Points: "<point>" in Point Earning Page
    Examples:
      | title               | description                     | point  |
      | Doğum Günü Hediyesi | Doğum gününde ekstra puan kazan | 3 puan |

  @SD2 @PointsEarning
  Scenario: Nisa Goes Back To Previous Page From Points Earnings Page
    When Nisa click to Point Earning in Dashboard Main Page
    Then Nisa should see Point Earning Page
    When Nisa click to Back Button in Point Earning Page
    Then Nisa should see Dashboard Main Page

