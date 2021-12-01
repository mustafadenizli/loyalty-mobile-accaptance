Feature: FAQ Page

  As Nisa
  I want to see a FAQ page
  So that I know how to benefit best from the loyalty program

  | status    | Emails                      | Passwords      | CustomerIDs |
  | normal    | userLoyaltyFaq@modanisa.com | Modanisa1234.  | 12727306    |

  Background:
    Given Nisa waits for Welcome page
    Given Nisa changes the Country to "Turkey" from the Shipping Country picker in Welcome page
    Given Nisa changes the Language to "Türkçe" from the Language picker in Welcome page
    Given Nisa taps on the Start Shopping button in Welcome page
    Given Nisa waits for Home page
    Given Nisa taps on the My Account button in bottom menu bar
    Given Nisa sendKey private api "customer-legacy-mdns-api-staging.modanisa.net" and restart app
    Given Nisa taps on the My Account button in bottom menu bar
    Given Nisa is not enrolled user with customerId: "12727306"
    Given Nisa is enrolled user with customerId: "12727306" and e-mail: "userLoyaltyFaq@modanisa.com"
    Given Nisa add Pending Point with customerId: "12727306" and pendingPoint: "10"
    Given Nisa add Confirmed Point with customerId: "12727306" and confirmedPoint: "10"
    Given Nisa login with user:"normal" email: "userLoyaltyDashboard@modanisa.com" and password: "Modanisa1234."
    When Nisa taps to My Modanisa section
    Then Nisa should see Dashboard Main Page
    When Nisa click to Faq in Dashboard Main Page

  @SD9 @Deneme
  Scenario:Nisa Sees FAQ Page
    Then Nisa should see Faq Page Title

  @SD9 @Hatali
  Scenario:Nisa Sees FAQ Modal
    When Nisa click to Faq Name: "My Modanisa nedir" in Faq Page
    Then Nisa should see Faq Modal Title "My Modanisa nedir"
    Then Nisa should see Faq Modal Description "My Modanisa, Modanisa müşterilerinin ayrıcaklı dünyasıdır."

  @SD9
  Scenario:Nisa Closed FAQ Detail Modal
    When Nisa click to Faq Name: "My Modanisa nedir" in Faq Page
    When Nisa click to Faq Modal Close Button
    Then Nisa should see Faq Page Title

  @SD9
  Scenario:Nisa goes back to Dashboard Main Page from “Popular Questions Section” page
    When Nisa click to Back Button in Faq Page
    Then Nisa should see Dashboard Main Page


