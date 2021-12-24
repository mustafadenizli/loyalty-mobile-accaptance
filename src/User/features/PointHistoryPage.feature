Feature: Points History Page

  As Nisa
  I want to see how many points I got from what challenges, on what date
  So that I can keep track number of points I have earned from each challenge

  | status    | Emails                                | Passwords      | CustomerIDs |
  | normal    | userLoyaltyPointHistory@modanisa.com  | Modanisa1234.  | 12727302    |
  | normal    | userLoyaltyPointHistory1@modanisa.com  | Modanisa1234. | 12727403	 |
  | normal    | userLoyaltyPointHistory2@modanisa.com  | Modanisa1234. | 12727404	 |
  | normal    | userLoyaltyPointHistory3@modanisa.com  | Modanisa1234. | 12727405	 |


  Background:
    Given Nisa waits for Welcome page
    Given Nisa changes the Country to "Turkey" from the Shipping Country picker in Welcome page
    Given Nisa changes the Language to "Türkçe" from the Language picker in Welcome page
    Given Nisa taps on the Start Shopping button in Welcome page
    Given Nisa waits for Home page
    Given Nisa taps on the My Account button in bottom menu bar
    Given Nisa sendKey private api "customer-legacy-mdns-api-staging.modanisa.net" and restart app
    Given Nisa taps on the My Account button in bottom menu bar
    Given Nisa is not enrolled user with customerId: "12727302"
    Given Nisa is enrolled user with customerId: "12727302" and e-mail: "userLoyaltyPointHistory@modanisa.com"
    Given Nisa add Pending Point with customerId: "12727302" and pendingPoint: "10"
    Given Nisa add Confirmed Point with customerId: "12727302" and confirmedPoint: "10"
    Given Nisa login with user:"normal" email: "userLoyaltyPointHistory@modanisa.com" and password: "Modanisa1234."
    When Nisa taps to My Modanisa section
    Then Nisa should see Dashboard Main Page
    When Nisa click to Point Earning in Dashboard Main Page
    When Nisa click to Point History in Point Earning Page
    Then Nisa should see Point History Page

  @SD3 @Deneme
  Scenario: Nisa Sees Her Confirmed Points on My Points History
    Then Nisa should see Challenge Name: "Hediye Puan" in Point History Page
    Then Nisa should see Challenge Date: Today in Point History Page
    Then Nisa should see Challenge Point: "10 puan onaylandı" in Point History Page


  @SD3 @Deneme
  Scenario: Nisa goes back to previous page from Puan Geçmişim section
    When Nisa click to Back Button in Point History Page
    Then Nisa should see Dashboard Main Page
