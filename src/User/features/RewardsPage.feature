Feature: Rewards

  As Nisa
  I want to see my current points and list of gifts
  So that I can redeem my gifts

  | status    | Emails                           | Passwords      | CustomerIDs |
  | normal    | userLoyaltyRewards@modanisa.com  | Modanisa1234.  | 12727303    |


  Background:
    Given Nisa waits for Welcome page
    Given Nisa changes the Country to "Turkey" from the Shipping Country picker in Welcome page
    Given Nisa changes the Language to "Türkçe" from the Language picker in Welcome page
    Given Nisa taps on the Start Shopping button in Welcome page
    Given Nisa waits for Home page
    Given Nisa taps on the My Account button in bottom menu bar
    Given Nisa sendKey private api "customer-legacy-mdns-api-staging.modanisa.net" and restart app
    Given Nisa taps on the My Account button in bottom menu bar
    Given Nisa is not enrolled user with customerId: "12727303"
    Given Nisa is enrolled user with customerId: "12727303" and e-mail: "userLoyaltyRewards@modanisa.com"
    Given Nisa add Confirmed Point with customerId: "12727303" and confirmedPoint: "50"
    Given Nisa login with user:"normal" email: "userLoyaltyRewards@modanisa.com" and password: "Modanisa1234."
    When Nisa taps to My Modanisa section
    Then Nisa should see Dashboard Main Page
    When Nisa click to Rewards in Dashboard Main Page
    Then Nisa should see Rewards Page

  @SD4 @rewards
  Scenario: Nisa Sees Her Confirmed Points on Gift List Page
    Then Nisa should see Confirmed Points: "55 puan" in Rewards Page

  @SD4 @back @rewards
  Scenario: Nisa goes back to Dashboard page from Gift List Page
    When Nisa click to Back Button in Rewards Page
    Then Nisa should see Dashboard Main Page

  @SD4 @rewards
  Scenario: Nisa sees gifts sorted by point
    Then Nisa should see sorted Gifts in Rewards Page
    Then Nisa should see Button Name: "Hediyeyi Al" under Confirmed Points in Rewards Page
    Then Nisa should see Button Name: "Puan Kazan" above Confirmed Points in Rewards Page

  @rewards @pointExpiration @expirationDate
  Scenario: Nisa Sees Expiration Date of her Active Points
    Then Nisa should see Expire Date: "28.02.2022" in Rewards Page


