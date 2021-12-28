Feature: Rewards Page

  As Nisa
  I want to see my current points and list of gifts
  So that I can redeem my gifts

  | status    | Emails                            | Passwords       | CustomerIDs |
  | normal    | userLoyaltyRewards@modanisa.com   | Modanisa1234.   | 12727303    |
  | normal    | userLoyaltyRewards1@modanisa.com  | Modanisa1234.   | 12727399    |
  | normal    | userLoyaltyRewards2@modanisa.com  | Modanisa1234.   | 12727400	  |
  | normal    | userLoyaltyRewards3@modanisa.com  | Modanisa1234.   | 12727401	  |
  | normal    | userLoyaltyRewards4@modanisa.com  | Modanisa1234.   | 12727402	  |


  Background:
    Given Nisa waits for Welcome page
    Given Nisa changes the Country to "Turkey" from the Shipping Country picker in Welcome page
    Given Nisa changes the Language to "Türkçe" from the Language picker in Welcome page
    Given Nisa taps on the Start Shopping button in Welcome page
    Given Nisa waits for Home page
    Given Nisa taps on the My Account button in bottom menu bar
    Given Nisa sendKey private api "customer-legacy-mdns-api-staging.modanisa.net" and restart app
    Given Nisa taps on the My Account button in bottom menu bar


  @Rewards @ConfirmedPoint
  Scenario Outline: Nisa sees <confirmedPoint> on the Gift Selection page with <email>
    Given Nisa is not enrolled user with customerId: "<customerID>"
    Given Nisa is enrolled user with customerId: "<customerID>" and e-mail: "<email>"
    Given Nisa add Confirmed Point with customerId: "<customerID>" and confirmedPoint: "<addConfirmedPoint>"
    Given Nisa login with user:"normal" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    Then Nisa should see Dashboard Main Page
    When Nisa click to Rewards in Dashboard Main Page
    Then Nisa should see Rewards Page
    Then Nisa should see Confirmed Points: "<confirmedPoint>" in Rewards Page

    Examples:
   | customerID  | email                             | password       | addConfirmedPoint |  confirmedPoint  |
   | 12727303    | userLoyaltyRewards@modanisa.com   | Modanisa1234.  | 50                | 55 puan          |

  @Rewards @BackButton
  Scenario Outline: Nisa returns to Dashboard page from Gift List Page with <email>
    Given Nisa is not enrolled user with customerId: "<customerID>"
    Given Nisa is enrolled user with customerId: "<customerID>" and e-mail: "<email>"
    Given Nisa login with user:"normal" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    Then Nisa should see Dashboard Main Page
    When Nisa click to Rewards in Dashboard Main Page
    Then Nisa should see Rewards Page
    When Nisa click to Back Button in Rewards Page
    Then Nisa should see Dashboard Main Page

    Examples:
      | customerID  | email                             | password      |
      | 12727399    | userLoyaltyRewards1@modanisa.com  | Modanisa1234. |

  @Rewards
  Scenario Outline: Nisa sees gifts sorted by points with <email>
    Given Nisa is not enrolled user with customerId: "<customerID>"
    Given Nisa is enrolled user with customerId: "<customerID>" and e-mail: "<email>"
    Given Nisa add Confirmed Point with customerId: "<customerID>" and confirmedPoint: "<addConfirmedPoint>"
    Given Nisa login with user:"normal" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    Then Nisa should see Dashboard Main Page
    When Nisa click to Rewards in Dashboard Main Page
    Then Nisa should see Rewards Page
    Then Nisa should see sorted Gifts in Rewards Page
    Then Nisa should see Button Name: "Hediyeyi Al" under Confirmed Points in Rewards Page
    Then Nisa should see Button Name: "Puan Kazan" above Confirmed Points in Rewards Page

    Examples:
    Examples:
      | customerID  | email                             | password      |
      | 12727400    | userLoyaltyRewards2@modanisa.com  | Modanisa1234. |

  @Rewards @ExpireDate
  Scenario Outline: Nisa Sees the Expiry Date of Active Points <expire Date> with <email>
    Given Nisa is not enrolled user with customerId: "<customerID>"
    Given Nisa is enrolled user with customerId: "<customerID>" and e-mail: "<email>"
    Given Nisa login with user:"normal" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    Then Nisa should see Dashboard Main Page
    When Nisa click to Rewards in Dashboard Main Page
    Then Nisa should see Rewards Page
    Then Nisa should see Expire Date: "<expire Date>" in Rewards Page

    Examples:
      | customerID  | email                             | password      | expire Date |
      | 12727401    | userLoyaltyRewards3@modanisa.com  | Modanisa1234. | 28.02.2022  |


