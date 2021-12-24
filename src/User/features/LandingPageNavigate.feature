Feature: Landing Page Navigate

  3 dk

  As Nisa
  I want to be able to access Loyalty Page
  So that I can learn more about the Loyalty Program

  | Emails                             | Passwords      | CustomerIDs |
  | userLoyaltyLanding1@modanisa.com   | Modanisa1234.  | 12727410    |
  | userLoyaltyLanding2@modanisa.com   | Modanisa1234.  | 12727308   |

  @S2002
  Scenario Outline: Nisa Has See My Modanisa Section As Not Logged In User At Turkey <TC>
    Given Nisa waits for Welcome page
    Given Nisa changes the Country to "Turkey" from the Shipping Country picker in Welcome page
    Given Nisa changes the Language to "Türkçe" from the Language picker in Welcome page
    Given Nisa taps on the Start Shopping button in Welcome page
    Given Nisa waits for Home page
    Given Nisa taps on the My Account button in bottom menu bar
    Given Nisa sendKey private api "customer-legacy-mdns-api-staging.modanisa.net" and restart app
    Given Nisa taps on the My Account button in bottom menu bar
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    Then Nisa should see visible Section My Modanisa in My Account Page
    Examples:
      | TC | user   | email                            | password      |
      | 1  | normal | userLoyaltyLanding1@modanisa.com | Modanisa1234. |
      | 2  |        |                                  |               |

  @S2002
  Scenario Outline: Nisa Has Not See My Modanisa Section At Another Country Than Turkey <TC>
    Given Nisa waits for Welcome page
    Given Nisa changes the Country to "United Kingdom" from the Shipping Country picker in Welcome page
    Given Nisa changes the Language to "English" from the Language picker in Welcome page
    Given Nisa taps on the Start Shopping button in Welcome page
    Given Nisa waits for Home page
    Given Nisa taps on the My Account button in bottom menu bar
    Given Nisa sendKey private api "customer-legacy-mdns-api-staging.modanisa.net" and restart app
    Given Nisa taps on the My Account button in bottom menu bar
    Given Nisa login with user:"<user>" email: "<email>" and password: "<password>"
    Then Nisa should see invisible Section My Modanisa in My Account Page
    Examples:
      | TC | user   | email                            | password      |
      | 1  | normal | userLoyaltyLanding2@modanisa.com | Modanisa1234. |
      | 2  |        |                                  |               |
