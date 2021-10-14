Feature: My Tier Status Page

  AS Nisa
  I WANT to look into my tier status and number of points I have
  SO THAT I know how many points needed to upgrade my tier

  Background:
    Given Nisa waits for Welcome page
    Given Nisa changes the Country to "Türkiye" from the Shipping Country picker in Welcome page
    Given Nisa changes the Language to "TR" from the Language picker in Welcome page
    Given Nisa taps on the Start Shopping button in Welcome page
    Given Nisa waits for Home page
    Given Nisa taps on the My Account button in bottom menu bar

  @SD11
  Scenario Outline:  Nisa taps to "Üyelik Seviyem" section on dashboard main page
    Given Nisa is not enrolled user with customerId: "<customerID>"
    Given Nisa is enrolled user with customerId: "<customerID>" and e-mail: "<email>"
    Given Nisa login with email: "<email>" and password: "<password>"
    When Nisa taps to MyModanisa section
    Then Nisa should see Dashboard Main Page
    When Nisa click to My Tier Status in Dashboard Main Page
    Then Nisa should see Tier Status Page
    Then Nisa should see Tier:"<tier>" in Tier Status Page
    Then Nisa should see Score:"<score>" in Tier Status Page
    Then Nisa should see Membership Date:"" in Tier Status Page
    Then Nisa should see Privileges Tier:"" in Tier Status Page
    Then Nisa should see Privileges Name:"" in Tier Status Page
    Then Nisa should see Privileges Name:"" is checked in Tier Status Page

    Examples:
      | tier       | email                          | password    | customerID  | score |
      | Silver     | nisaSilverD-11@yandex.com      | Testhb123   | 11064240    | 50    |
      | Gold       | nisaGoldD-11@yandex.com        | Testhb123   | 11064241    | 110   |
      | Platinum   | nisaPlatinumD-11@yandex.com    | Testhb123   | 11064242    | 210   |


  @SD11 @BackButton
  Scenario Outline: Nisa taps to back button on "Üyelik Seviyem" page
    Given Nisa is not enrolled user with customerId: "<customerID>"
    Given Nisa is enrolled user with customerId: "<customerID>" and e-mail: "<email>"
    Given Nisa login with email: "<email>" and password: "<password>"
    When Nisa taps to MyModanisa section
    Then Nisa should see Dashboard Main Page
    When Nisa click to My Tier Status in Dashboard Main Page
    Then Nisa should see Tier Status Page
    When Nisa click to Back Button in Tier Status Page
    Then Nisa should see Dashboard Main Page

    Examples:
      | email                          | password    | customerID  |
      | nisaSilverD-11@yandex.com      | Testhb123   | 11064240    |
      | nisaGoldD-11@yandex.com        | Testhb123   | 11064241    |
      | nisaPlatinumD-11@yandex.com    | Testhb123   | 11064242    |

  @SD11
  Scenario Outline: Nisa taps to "Tüm Seviyelerdeki Ayrıcalıklar İçin" button on "Üyelik Seviyem" page then nisa should see "Tüm Seviyelerdeki Ayrıcalıklar İçin" modal
    Given Nisa is not enrolled user with customerId: "<customerID>"
    Given Nisa is enrolled user with customerId: "<customerID>" and e-mail: "<email>"
    Given Nisa login with email: "<email>" and password: "<password>"
    When Nisa taps to MyModanisa section
    Then Nisa should see Dashboard Main Page
    When Nisa click to My Tier Status in Dashboard Main Page
    Then Nisa should see Tier Status Page
    When Nisa click to All Privilages in Tier Status Page
    Then Nisa should see Modal Title:"Tüm Seviyelerdeki Ayrıcalıklar" in Tier Status Page

    Examples:
      | email                          | password    | customerID  |
      | nisaSilverD-11@yandex.com      | Testhb123   | 11064240    |
      | nisaGoldD-11@yandex.com        | Testhb123   | 11064241    |
      | nisaPlatinumD-11@yandex.com    | Testhb123   | 11064242    |


  @SD11 @CloseButton
  Scenario Outline: Nisa taps to close "Tüm Seviyelerdeki Ayrıcalıklar İçin" modal
    Given Nisa is not enrolled user with customerId: "<customerID>"
    Given Nisa is enrolled user with customerId: "<customerID>" and e-mail: "<email>"
    Given Nisa login with email: "<email>" and password: "<password>"
    When Nisa taps to MyModanisa section
    Then Nisa should see Dashboard Main Page
    When Nisa click to My Tier Status in Dashboard Main Page
    Then Nisa should see Tier Status Page
    When Nisa click to All Privilages in Tier Status Page
    Then Nisa should see Modal Title:"Tüm Seviyelerdeki Ayrıcalıklar" in Tier Status Page
    When Nisa click to Close Modal in Tier Status Page
    Then Nisa should see Tier Status Page

    Examples:
      | email                          | password    | customerID  |
      | nisaSilverD-11@yandex.com      | Testhb123   | 11064240    |
      | nisaGoldD-11@yandex.com        | Testhb123   | 11064241    |
      | nisaPlatinumD-11@yandex.com    | Testhb123   | 11064242    |

