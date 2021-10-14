Feature: Customer Loyalty Page

  As Nisa
  I want to be able to access Loyalty Page
  So that I can learn more about the Loyalty Program

  | Emails                            | Passwords      | CustomerIDs |
  | userLoyaltyLanding@modanisa.com   | Modanisa1234.  | 12727253    |

  @S2002
  Scenario Outline: Nisa Has See My Modanisa Section As Not Logged In User At Turkey
    Given Nisa waits for Welcome page
    Given Nisa changes the Country to "Türkiye" from the Shipping Country picker in Welcome page
    Given Nisa changes the Language to "TR" from the Language picker in Welcome page
    Given Nisa taps on the Start Shopping button in Welcome page
    Given Nisa waits for Home page
    Given Nisa taps on the My Account button in bottom menu bar
    Given Nisa login with email: "<email>" and password: "<password>"
    Then Nisa should see visible Section My Modanisa in My Account Page
    Examples:
      | email                           | password      |
      | userLoyaltyLanding@modanisa.com | Modanisa1234. |
      |                                 |               |

  @S2002
  Scenario Outline: Nisa Has Not See My Modanisa Section At Another Country Than Turkey
    Given Nisa waits for Welcome page
    Given Nisa changes the Country to "United Kingdom" from the Shipping Country picker in Welcome page
    Given Nisa changes the Language to "EN" from the Language picker in Welcome page
    Given Nisa taps on the Start Shopping button in Welcome page
    Given Nisa waits for Home page
    Given Nisa taps on the My Account button in bottom menu bar
    Given Nisa login with email: "<email>" and password: "<password>"
    Then Nisa should see invisible Section My Modanisa in My Account Page
    Examples:
      | email                           | password      |
      | userLoyaltyLanding@modanisa.com | Modanisa1234. |
      |                                 |               |
