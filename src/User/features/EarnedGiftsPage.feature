Feature: Earned Gifts Page

  As Nisa
  I want to reach the list of gifts that I have earned
  So that I can use them before my gifts are expired

  | status    | Emails                               | Passwords     | CustomerIDs  |
  | normal    | userLoyaltyEarnedGifts@modanisa.com  | Modanisa1234. | 12727304     |
  | normal    | userLoyaltyEarnedGifts1@modanisa.com | Modanisa1234. | 12727425     |
  | normal    | userLoyaltyEarnedGifts2@modanisa.com | Modanisa1234. | 12727426     |
  | normal    | userLoyaltyEarnedGifts3@modanisa.com | Modanisa1234. | 12727427     |
  | normal    | userLoyaltyEarnedGifts4@modanisa.com | Modanisa1234. | 12727428     |
  | normal    | userLoyaltyEarnedGifts5@modanisa.com | Modanisa1234. | 12727429     |
  | normal    | userLoyaltyEarnedGifts6@modanisa.com | Modanisa1234. | 12727430     |

  Background:
    Given Nisa waits for Welcome page
    Given Nisa changes the Country to "Turkey" from the Shipping Country picker in Welcome page
    Given Nisa changes the Language to "Türkçe" from the Language picker in Welcome page
    Given Nisa taps on the Start Shopping button in Welcome page
    Given Nisa waits for Home page
    Given Nisa taps on the My Account button in bottom menu bar
    Given Nisa sendKey private api "customer-legacy-mdns-api-staging.modanisa.net" and restart app
    Given Nisa taps on the My Account button in bottom menu bar


  @EarnedGiftsPage
  Scenario Outline: Nisa goes back to previous page from Kazandığım Hediyeler Page with <email> email
    Given Nisa is not enrolled user with customerId: "<customerID>"
    Given Nisa is enrolled user with customerId: "<customerID>" and e-mail: "<email>"
    Given Nisa add Pending Point with customerId: "<customerID>" and pendingPoint: "10"
    Given Nisa add Confirmed Point with customerId: "<customerID>" and confirmedPoint: "10"
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    Then Nisa should see Dashboard Main Page
    When Nisa click to My Earned Gifts in Dashboard Main Page
    Then Nisa should see My Earned Gifts Page
    When Nisa click to Back Button in My Earned Gifts Page
    Then Nisa should see Dashboard Main Page

    Examples:
     | user   | customerID | email                               | password     |
     | normal | 12727304   | userLoyaltyEarnedGifts@modanisa.com | Modanisa1234.|

  @EarnedGiftsPage @EmptyMessageAndEmptyDescription
  Scenario Outline: Nisa Sees empty message and empty description on Kazandığım Hediyeler Page with <email> email
    Given Nisa is not enrolled user with customerId: "<customerID>"
    Given Nisa is enrolled user with customerId: "<customerID>" and e-mail: "<email>"
    Given Nisa add Pending Point with customerId: "<customerID>" and pendingPoint: "10"
    Given Nisa add Confirmed Point with customerId: "<customerID>" and confirmedPoint: "10"
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    Then Nisa should see Dashboard Main Page
    When Nisa click to My Earned Gifts in Dashboard Main Page
    Then Nisa should see My Earned Gifts Page
    Then Nisa should see Empty Message: "Henüz Hediye Kazanmadın" in My Earned Gifts Page
    Then Nisa should see Empty Description: "My Modanisa’da kazandığın puanlarını" in My Earned Gifts Page

    Examples:
      | user   | customerID | email                                | password     |
      | normal | 12727425   | userLoyaltyEarnedGifts1@modanisa.com | Modanisa1234.|

  @EarnedGiftsPage @ClickDiscoverButton
  Scenario Outline: Nisa, clicks and sees discover button on Kazandığım Hediyeler page with <email> email.
    Given Nisa is not enrolled user with customerId: "<customerID>"
    Given Nisa is enrolled user with customerId: "<customerID>" and e-mail: "<email>"
    Given Nisa add Pending Point with customerId: "<customerID>" and pendingPoint: "10"
    Given Nisa add Confirmed Point with customerId: "<customerID>" and confirmedPoint: "10"
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    Then Nisa should see Dashboard Main Page
    When Nisa click to My Earned Gifts in Dashboard Main Page
    Then Nisa should see My Earned Gifts Page
    Then Nisa should see Button Name: "Hediyeleri Keşfet" in My Earned Gifts Page
    When Nisa click to Discover Gifts Button in My Earned Gifts Page
    Then Nisa should see Rewards Page

    Examples:
      | user   | customerID | email                                | password     |
      | normal | 12727426   | userLoyaltyEarnedGifts2@modanisa.com | Modanisa1234.|

  @EarnedGiftsPage @BackEarnedGifts
  Scenario Outline: Nisa Sees back Rewards Page on Kazandığım Hediyeler page with <email> email
    Given Nisa is not enrolled user with customerId: "<customerID>"
    Given Nisa is enrolled user with customerId: "<customerID>" and e-mail: "<email>"
    Given Nisa add Pending Point with customerId: "<customerID>" and pendingPoint: "10"
    Given Nisa add Confirmed Point with customerId: "<customerID>" and confirmedPoint: "10"
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    Then Nisa should see Dashboard Main Page
    When Nisa click to My Earned Gifts in Dashboard Main Page
    Then Nisa should see My Earned Gifts Page
    Then Nisa should see Button Name: "Hediyeleri Keşfet" in My Earned Gifts Page
    When Nisa click to Discover Gifts Button in My Earned Gifts Page
    Then Nisa should see Rewards Page
    When Nisa click to Back Button in Rewards Page
    Then Nisa should see My Earned Gifts Page

    Examples:
      | user   | customerID | email                                | password     |
      | normal | 12727427   | userLoyaltyEarnedGifts3@modanisa.com | Modanisa1234.|

  @EarnedGiftsPage @Hatali
  Scenario Outline: Nisa Sees Her Earned Gifts on Kazandığım Hediyeler page
    Given Nisa is not enrolled user with customerId: "<customerID>"
    Given Nisa is enrolled user with customerId: "<customerID>" and e-mail: "<email>"
    Given Nisa add Pending Point with customerId: "<customerID>" and pendingPoint: "10"
    Given Nisa add Confirmed Point with customerId: "<customerID>" and confirmedPoint: "10"
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    Then Nisa should see Dashboard Main Page
    When Nisa click to My Earned Gifts in Dashboard Main Page
    Then Nisa should see My Earned Gifts Page
    Then Nisa should see Gift Name: "" in My Earned Gifts Page

    Examples:
      | user   | customerID | email                                | password     |
      | normal | 12727428   | userLoyaltyEarnedGifts4@modanisa.com | Modanisa1234.|

  @EarnedGiftsPage @Hatali
  Scenario Outline: Nisa Sees Her Earned Gifts in Red Color Whose Expire Date is 7 days later on Kazandığım Hediyeler page
    Given Nisa is not enrolled user with customerId: "<customerID>"
    Given Nisa is enrolled user with customerId: "<customerID>" and e-mail: "<email>"
    Given Nisa add Pending Point with customerId: "<customerID>" and pendingPoint: "10"
    Given Nisa add Confirmed Point with customerId: "<customerID>" and confirmedPoint: "10"
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    Then Nisa should see Dashboard Main Page
    When Nisa click to My Earned Gifts in Dashboard Main Page
    Then Nisa should see My Earned Gifts Page
    Then Nisa should see Gift Name: "" in My Earned Gifts Page
    Then Nisa should see Gift Expiration Date: "" to Gift Name:"" in My Earned Gifts Page

    Examples:
      | user   | customerID | email                                | password     |
      | normal | 12727429   | userLoyaltyEarnedGifts5@modanisa.com | Modanisa1234.|

  @EarnedGiftsPage @Hatali
  Scenario Outline: Nisa Sees Her Earned Gifts which as expired on Kazandığım Hediyeler page
    Given Nisa is not enrolled user with customerId: "<customerID>"
    Given Nisa is enrolled user with customerId: "<customerID>" and e-mail: "<email>"
    Given Nisa add Pending Point with customerId: "<customerID>" and pendingPoint: "10"
    Given Nisa add Confirmed Point with customerId: "<customerID>" and confirmedPoint: "10"
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    Then Nisa should see Dashboard Main Page
    When Nisa click to My Earned Gifts in Dashboard Main Page
    Then Nisa should see My Earned Gifts Page
    Then Nisa should see Gift Expiration Date: "Son Kullanım Tarihi Doldu" in My Earned Gifts Page

    Examples:
      | user   | customerID | email                                | password     |
      | normal | 12727430   | userLoyaltyEarnedGifts6@modanisa.com | Modanisa1234.|


