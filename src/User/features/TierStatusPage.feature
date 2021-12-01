Feature: Tier Status Page

  AS Nisa
  I WANT to look into my tier status and number of points I have
  SO THAT I know how many points needed to upgrade my tier

  | status    | Emails                             | Passwords      | CustomerIDs |
  | normal    | userLoyaltyTierStatus@modanisa.com | Modanisa1234.  | 12727305    |


  Background:
    Given Nisa waits for Welcome page
    Given Nisa changes the Country to "Turkey" from the Shipping Country picker in Welcome page
    Given Nisa changes the Language to "Türkçe" from the Language picker in Welcome page
    Given Nisa taps on the Start Shopping button in Welcome page
    Given Nisa waits for Home page
    Given Nisa taps on the My Account button in bottom menu bar
    Given Nisa sendKey private api "customer-legacy-mdns-api-staging.modanisa.net" and restart app
    Given Nisa taps on the My Account button in bottom menu bar

  @SD11
  Scenario Outline:  Nisa taps to "Üyelik Seviyem" section on dashboard main page
    Given Nisa is not enrolled user with customerId: "<customerID>"
    Given Nisa is enrolled user with customerId: "<customerID>" and e-mail: "<email>"
    Given Nisa add Confirmed Point with customerId: "<customerID>" and confirmedPoint: "<addScore>"
    Given Nisa login with user:"normal" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    Then Nisa should see Dashboard Main Page
    When Nisa click to My Tier Status in Dashboard Main Page
    Then Nisa should see Tier Status Page
    Then Nisa should see Tier:"<tier>" in Tier Status Page
    Then Nisa should see Score:"<score>" in Tier Status Page
    Then Nisa should see Membership Date today in Tier Status Page
    Then Nisa should see Privileges Tier:"<tier>" in Tier Status Page
    Then Nisa should see Privileges Name:"Profilini tamamla" in Tier Status Page
    Examples:
      | tier     | email                       | password  | customerID | addScore | score |
      | Silver   | nisaSilverD-11@yandex.com   | Testhb123 | 11064240   | 50       | 55    |
      | Gold     | nisaGoldD-11@yandex.com     | Testhb123 | 11064241   | 110      | 115   |
      | Platinum | nisaPlatinumD-11@yandex.com | Testhb123 | 11064242   | 210      | 215   |


  @SD11 @BackButton
  Scenario Outline: Nisa taps to back button on "Üyelik Seviyem" page
    Given Nisa is not enrolled user with customerId: "<customerID>"
    Given Nisa is enrolled user with customerId: "<customerID>" and e-mail: "<email>"
    Given Nisa add Confirmed Point with customerId: "<customerID>" and confirmedPoint: "<score>"
    Given Nisa login with user:"normal" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    Then Nisa should see Dashboard Main Page
    When Nisa click to My Tier Status in Dashboard Main Page
    Then Nisa should see Tier Status Page
    When Nisa click to Back Button in Tier Status Page
    Then Nisa should see Dashboard Main Page

    Examples:
      | tier     | email                       | password  | customerID | score |
      | Silver   | nisaSilverD-11@yandex.com   | Testhb123 | 11064240   | 50    |
      | Gold     | nisaGoldD-11@yandex.com     | Testhb123 | 11064241   | 110   |
      | Platinum | nisaPlatinumD-11@yandex.com | Testhb123 | 11064242   | 210   |

  @SD11
  Scenario Outline: Nisa taps to "Tüm Seviyelerdeki Ayrıcalıklar İçin" button on "Üyelik Seviyem" page then nisa should see "Tüm Seviyelerdeki Ayrıcalıklar İçin" modal
    Given Nisa is not enrolled user with customerId: "<customerID>"
    Given Nisa is enrolled user with customerId: "<customerID>" and e-mail: "<email>"
    Given Nisa add Confirmed Point with customerId: "<customerID>" and confirmedPoint: "<score>"
    Given Nisa login with user:"normal" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    Then Nisa should see Dashboard Main Page
    When Nisa click to My Tier Status in Dashboard Main Page
    Then Nisa should see Tier Status Page
    When Nisa click to All Privilages in Tier Status Page
    Then Nisa should see Modal Title:"Tüm Seviyelerdeki Ayrıcalıklar" in Tier Status Page

    Examples:
      | tier     | email                       | password  | customerID | score |
      | Silver   | nisaSilverD-11@yandex.com   | Testhb123 | 11064240   | 50    |
      | Gold     | nisaGoldD-11@yandex.com     | Testhb123 | 11064241   | 110   |
      | Platinum | nisaPlatinumD-11@yandex.com | Testhb123 | 11064242   | 210   |


  @SD11 @CloseButton @Deneme
  Scenario Outline: Nisa taps to close "Tüm Seviyelerdeki Ayrıcalıklar İçin" modal
    Given Nisa is not enrolled user with customerId: "<customerID>"
    Given Nisa is enrolled user with customerId: "<customerID>" and e-mail: "<email>"
    Given Nisa add Confirmed Point with customerId: "<customerID>" and confirmedPoint: "<score>"
    Given Nisa login with user:"normal" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    Then Nisa should see Dashboard Main Page
    When Nisa click to My Tier Status in Dashboard Main Page
    Then Nisa should see Tier Status Page
    When Nisa click to All Privilages in Tier Status Page
    Then Nisa should see Modal Title:"Tüm Seviyelerdeki Ayrıcalıklar" in Tier Status Page
    When Nisa click to Close Modal in Tier Status Page
    Then Nisa should see Tier Status Page

    Examples:
      | tier     | email                       | password  | customerID | score |
      | Silver   | nisaSilverD-11@yandex.com   | Testhb123 | 11064240   | 50    |
      | Gold     | nisaGoldD-11@yandex.com     | Testhb123 | 11064241   | 110   |
      | Platinum | nisaPlatinumD-11@yandex.com | Testhb123 | 11064242   | 210   |

