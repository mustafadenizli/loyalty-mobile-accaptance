Feature: Rewards

  As Nisa
  I want to see my current points and list of gifts
  So that I can redeem my gifts

  Background:
    Given Nisa waits for Welcome page
    Given Nisa changes the Country to "Türkiye" from the Shipping Country picker in Welcome page
    Given Nisa changes the Language to "TR" from the Language picker in Welcome page
    Given Nisa taps on the Start Shopping button in Welcome page
    Given Nisa waits for Home page
    Given Nisa taps on the My Account button in bottom menu bar
    Given Nisa is not enrolled user with customerId: "10184003"
    Given Nisa is enrolled user with customerId: "10184003" and e-mail: "spendable.point.owner.loyant@modanisa.com"
    Given Nisa login with email: "spendable.point.owner.loyant@modanisa.com" and password: "Testhb123"
    When Nisa taps to MyModanisa section
    Then Nisa should see Dashboard Main Page
    When Nisa click to Rewards in Dashboard Main Page
    Then Nisa should see Rewards Page

  @SD4 @rewards
  Scenario: Nisa Sees Her Confirmed Points on Gift List Page
    Then Nisa should see Confirmed Points: "5 puan" in Rewards Page

  @SD4 @back @rewards
  Scenario: Nisa goes back to Dashboard page from Gift List Page
    When Nisa click to Back Button in Rewards Page
    Then Nisa should see Dashboard Main Page

  @SD4 @rewards
  Scenario Outline: Nisa sees gifts sorted by point
    Then Nisa should see sorted Gifts in Rewards Page
    Then Nisa should see Button Name: "Hediyeyi Al" under Confirmed Points in Rewards Page
    Examples:
      | actionName  | point |
      | Hediyeyi Al | 270   |
      | Puan Kazan  | 270   |

  @rewards @pointExpiration @expirationDate
  Scenario: Nisa Sees Expiration Date of her Active Points
    Then Nisa should see Expire Date: "30.11.2021" in Rewards Page


