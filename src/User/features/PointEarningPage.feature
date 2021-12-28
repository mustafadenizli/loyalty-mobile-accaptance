Feature: Points Earning Page

  As Nisa
  I want to know how I can earn points with My Modanisa
  So that I can get a gift that interests me by collecting enough points by performing the necessary actions.

  | status    | Emails                                 | Passwords      | CustomerIDs |
  | normal    | userLoyaltyPointEarning@modanisa.com   | Modanisa1234.  | 12727301    |
  | normal    | userLoyaltyPointEarning1@modanisa.com  | Modanisa1234.  | 12727406	  |
  | normal    | userLoyaltyPointEarning2@modanisa.com  | Modanisa1234.  | 12727407	  |
  | normal    | userLoyaltyPointEarning3@modanisa.com  | Modanisa1234.  | 12727408    |
  | normal    | userLoyaltyPointEarning4@modanisa.com  | Modanisa1234.  | 12727409    |
  | normal    | userLoyaltyPointEarning5@modanisa.com  | Modanisa1234.  | 12727455    |
  | normal    | userLoyaltyPointEarning6@modanisa.com  | Modanisa1234.  | 12727456	  |
  | normal    | userLoyaltyPointEarning7@modanisa.com  | Modanisa1234.  | 12727457    |


  Background:
    Given Nisa waits for Welcome page
    Given Nisa changes the Country to "Turkey" from the Shipping Country picker in Welcome page
    Given Nisa changes the Language to "Türkçe" from the Language picker in Welcome page
    Given Nisa taps on the Start Shopping button in Welcome page
    Given Nisa waits for Home page
    Given Nisa taps on the My Account button in bottom menu bar
    Given Nisa sendKey private api "customer-legacy-mdns-api-staging.modanisa.net" and restart app
    Given Nisa taps on the My Account button in bottom menu bar



  @PointsEarning @Challenges
  Scenario Outline: Nisa Sees The Challenges On The Earning Points Page In Order With <email>
    Given Nisa is not enrolled user with customerId: "<customerID>"
    Given Nisa is enrolled user with customerId: "<customerID>" and e-mail: "<email>"
    Given Nisa login with user:"normal" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    Then Nisa should see Dashboard Main Page
    When Nisa click to Point Earning in Dashboard Main Page
    Then Nisa should see Challenges in Point Earning Page
    Then Nisa should see sorted Challenges in Point Earning Page

    Examples:
    | customerID | email                                 | password      |
    | 12727301   | userLoyaltyPointEarning@modanisa.com  | Modanisa1234. |



  @PointsEarning
  Scenario Outline: Nisa Sees <title>, <description> and <point> on Earning Points Page with <email>
    Given Nisa is not enrolled user with customerId: "<customerID>"
    Given Nisa is enrolled user with customerId: "<customerID>" and e-mail: "<email>"
    Given Nisa login with user:"normal" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    Then Nisa should see Dashboard Main Page
    When Nisa click to Point Earning in Dashboard Main Page
    Then Nisa should see Point Earning Page
    Then Nisa should see Challenge Title: "<title>" in Point Earning Page
    Then Nisa should see Challenge Description: "<description>" in Point Earning Page
    Then Nisa should see Challenge Points: "<point>" in Point Earning Page
    Examples:
      | customerID | email                                 | password      | title                            | description                                                 | point   |
      | 12727406   | userLoyaltyPointEarning1@modanisa.com | Modanisa1234. | Alışverişlerinden Puan Kazan     | Her 100 TL                                                  | 10 puan |
      | 12727407   | userLoyaltyPointEarning2@modanisa.com | Modanisa1234. | Doğum Günü Hediyesi              | Doğum gününde ekstra puan kazan                             | 3 puan  |
      | 12727408   | userLoyaltyPointEarning3@modanisa.com | Modanisa1234. | Profilini Tamamla - Doğum Günü   | Doğum gününde sürpriz puan kazanma                          | 2 puan  |
      | 12727409   | userLoyaltyPointEarning4@modanisa.com | Modanisa1234. | Satın Aldığın Ürünlere Yorum Yap | Satın aldığın ürünlere yorum yaparak                        | 2 puan  |
      #| 12727455   | userLoyaltyPointEarning5@modanisa.com | Modanisa1234. | SMS İle İletişime İzin Ver       | Güncel kampanya ve indirimlerden haberdar olmak için SMS    | 1 puan  |
      #| 12727456   | userLoyaltyPointEarning6@modanisa.com | Modanisa1234. | E-mail İle İletişime İzin Ver    | Güncel kampanya ve indirimlerden haberdar olmak için e-mail | 1 puan  |
      #| 12727457   | userLoyaltyPointEarning7@modanisa.com | Modanisa1234. | Telefon İle İletişime İzin Ver   | Güncel kampanya ve indirimlerden haberdar olmak için arama  | 1 puan  |

  @PointsEarning @BackButton
  Scenario Outline: Nisa Goes Back To Previous Page From Points Earnings Page with <email>
    Given Nisa is not enrolled user with customerId: "<customerID>"
    Given Nisa is enrolled user with customerId: "<customerID>" and e-mail: "<email>"
    Given Nisa login with user:"normal" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    Then Nisa should see Dashboard Main Page
    When Nisa click to Point Earning in Dashboard Main Page
    Then Nisa should see Point Earning Page
    When Nisa click to Back Button in Point Earning Page
    Then Nisa should see Dashboard Main Page
    Examples:
      | customerID | email                                  | password      |
      | 12727455   | userLoyaltyPointEarning5@modanisa.com  | Modanisa1234. |
