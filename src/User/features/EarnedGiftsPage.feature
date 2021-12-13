Feature: Earned Gifts Page

  As Nisa
  I want to reach the list of gifts that I have earned
  So that I can use them before my gifts are expired

  | status    | Emails                              | Passwords      | CustomerIDs |
  | normal    | userLoyaltyEarnedGifts@modanisa.com | Modanisa1234.  | 12727304    |


  Background:
    Given Nisa waits for Welcome page
    Given Nisa changes the Country to "Turkey" from the Shipping Country picker in Welcome page
    Given Nisa changes the Language to "Türkçe" from the Language picker in Welcome page
    Given Nisa taps on the Start Shopping button in Welcome page
    Given Nisa waits for Home page
    Given Nisa taps on the My Account button in bottom menu bar
    Given Nisa sendKey private api "customer-legacy-mdns-api-staging.modanisa.net" and restart app
    Given Nisa taps on the My Account button in bottom menu bar
    Given Nisa is not enrolled user with customerId: "12727304"
    Given Nisa is enrolled user with customerId: "12727304" and e-mail: "userLoyaltyEarnedGifts@modanisa.com"
    Given Nisa add Pending Point with customerId: "12727304" and pendingPoint: "10"
    Given Nisa add Confirmed Point with customerId: "12727304" and confirmedPoint: "10"
    Given Nisa login with user:"normal" email: "userLoyaltyEarnedGifts@modanisa.com" and password: "Modanisa1234."
    When Nisa taps to My Modanisa section
    Then Nisa should see Dashboard Main Page
    When Nisa click to My Earned Gifts in Dashboard Main Page
    Then Nisa should see My Earned Gifts Page


  @SD7
  Scenario: Nisa goes back to previous page from Kazandığım Hediyeler Page
    When Nisa click to Back Button in My Earned Gifts Page
    Then Nisa should see Dashboard Main Page

  @SD7
  Scenario: Nisa Sees empty message Kazandığım Hediyeler page
    Then Nisa should see Empty Message: "Henüz Hediye Kazanmadın" in My Earned Gifts Page
    Then Nisa should see Empty Description: "My Modanisa’da kazandığın puanlarını" in My Earned Gifts Page

  @SD7
  Scenario: Nisa Sees click discover button Kazandığım Hediyeler page
    Then Nisa should see Button Name: "Hediyeleri Keşfet" in My Earned Gifts Page
    When Nisa click to Discover Gifts Button in My Earned Gifts Page
    Then Nisa should see Rewards Page

  @SD7 @Deneme
  Scenario: Nisa Sees back Rewards Page on Kazandığım Hediyeler page
    Then Nisa should see Button Name: "Hediyeleri Keşfet" in My Earned Gifts Page
    When Nisa click to Discover Gifts Button in My Earned Gifts Page
    Then Nisa should see Rewards Page
    When Nisa click to Back Button in Rewards Page
    Then Nisa should see My Earned Gifts Page

  @SD7 @Hatali
  Scenario: Nisa Sees Her Earned Gifts on Kazandığım Hediyeler page
    Then Nisa should see Gift Name: "" in My Earned Gifts Page

  @SD7 @Hatali
  Scenario: Nisa Sees Her Earned Gifts in Red Color Whose Expire Date is 7 days later on Kazandığım Hediyeler page
    Then Nisa should see Gift Name: "" in My Earned Gifts Page
    Then Nisa should see Gift Expiration Date: "" to Gift Name:"" in My Earned Gifts Page

  @SD7.1 @Hatali
  Scenario: Nisa Sees Her Earned Gifts which as expired on Kazandığım Hediyeler page
    Then Nisa should see Gift Expiration Date: "Son Kullanım Tarihi Doldu" in My Earned Gifts Page

