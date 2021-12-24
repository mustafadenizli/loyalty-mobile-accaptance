Feature: Tier Status Page

  AS Nisa
  I WANT to look into my tier status and number of points I have
  SO THAT I know how many points needed to upgrade my tier

  | status    | Emails                               | Passwords      | CustomerIDs     |
  | normal    | nisaSilverD-11@yandex.com            | Testhb123      | 11064240        |
  | normal    | nisaGoldD-11@yandex.com              | Testhb123      | 11064241        |
  | normal    | nisaPlatinumD-11@yandex.com          | Testhb123      | 11064242	    |
  | normal    | userLoyaltyTierStatus@modanisa.com   | Modanisa1234.  | 12727305        |
  | normal    | userLoyaltyTierStatus1@modanisa.com  | Modanisa1234.  | 12727387        |
  | normal    | userLoyaltyTierStatus2@modanisa.com  | Modanisa1234.  | 12727388	    |
  | normal    | userLoyaltyTierStatus3@modanisa.com  | Modanisa1234.  | 12727389	    |
  | normal    | userLoyaltyTierStatus4@modanisa.com  | Modanisa1234.  | 12727390	    |
  | normal    | userLoyaltyTierStatus5@modanisa.com  | Modanisa1234.  | 12727391	    |
  | normal    | userLoyaltyTierStatus6@modanisa.com  | Modanisa1234.  | 12727392	    |
  | normal    | userLoyaltyTierStatus7@modanisa.com  | Modanisa1234.  | 12727393	    |
  | normal    | userLoyaltyTierStatus8@modanisa.com  | Modanisa1234.  | 12727394	    |
  | normal    | userLoyaltyTierStatus9@modanisa.com  | Modanisa1234.  | 12727395	    |
  | normal    | userLoyaltyTierStatus10@modanisa.com | Modanisa1234.  | 12727396	    |
  | normal    | userLoyaltyTierStatus11@modanisa.com | Modanisa1234.  |	12727397        |
  | normal    | userLoyaltyTierStatus12@modanisa.com | Modanisa1234.  | 12727398	    |
  | normal    | userLoyaltyTierStatus13@modanisa.com | Modanisa1234.  | 12727441		|
  | normal    | userLoyaltyTierStatus14@modanisa.com | Modanisa1234.  | 12727442		|
  | normal    | userLoyaltyTierStatus15@modanisa.com | Modanisa1234.  | 12727443		|
  | normal    | userLoyaltyTierStatus16@modanisa.com | Modanisa1234.  | 12727444		|
  | normal    | userLoyaltyTierStatus17@modanisa.com | Modanisa1234.  | 12727445	    |


  Background:
    Given Nisa waits for Welcome page
    Given Nisa changes the Country to "Turkey" from the Shipping Country picker in Welcome page
    Given Nisa changes the Language to "Türkçe" from the Language picker in Welcome page
    Given Nisa taps on the Start Shopping button in Welcome page
    Given Nisa waits for Home page
    Given Nisa taps on the My Account button in bottom menu bar
    Given Nisa sendKey private api "customer-legacy-mdns-api-staging.modanisa.net" and restart app
    Given Nisa taps on the My Account button in bottom menu bar

  @SD11 @deneme
  Scenario Outline:  Nisa taps to "Üyelik Seviyem" section on dashboard main page <TC>
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
    Then Nisa should see Privileges Name:"<Privileges Name>" in Tier Status Page
    Examples:
      | TC | tier     | email                                | password      | customerID | addScore | score | Privileges Name                    |
      | 1  | Silver   | nisaSilverD-11@yandex.com            | Testhb123     | 11064240   | 50       | 55    | Profilini tamamla                  |
      | 2  | Gold     | nisaGoldD-11@yandex.com              | Testhb123     | 11064241   | 110      | 115   | İletişime izin ver                 |
      | 3  | Platinum | nisaPlatinumD-11@yandex.com          | Testhb123     | 11064242   | 210      | 215   | Kargo bedava                       |
      | 4  | Silver   | userLoyaltyTierStatus@modanisa.com   | Modanisa1234. | 12727305   | 50       | 55    | Özel kampanyalardan haberdar ol    |
      | 5  | Gold     | userLoyaltyTierStatus1@modanisa.com  | Modanisa1234. | 12727387   | 110      | 115   | İndirimlerde öncelik               |
      | 6  | Platinum | userLoyaltyTierStatus2@modanisa.com  | Modanisa1234. | 12727388   | 210      | 215   | Özel etkinlik ve davetlere katılım |



  @SD11 @BackButton
  Scenario Outline: Nisa taps to back button on "Üyelik Seviyem" page <TC>
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
      | TC | tier     | email                                | password      | customerID | score |
      | 1  | Silver   | userLoyaltyTierStatus3@modanisa.com  | Modanisa1234. | 12727389   | 50    |
      | 2  | Gold     | userLoyaltyTierStatus4@modanisa.com  | Modanisa1234. | 12727390   | 110   |
      | 3  | Platinum | userLoyaltyTierStatus5@modanisa.com  | Modanisa1234. | 12727391	  | 210   |

  @SD11 @deneme
  Scenario Outline: nisa should see "Tüm Seviyelerdeki Ayrıcalıklar İçin" in "Üyelik Seviyem" page
    Given Nisa is not enrolled user with customerId: "<customerID>"
    Given Nisa is enrolled user with customerId: "<customerID>" and e-mail: "<email>"
    Given Nisa add Confirmed Point with customerId: "<customerID>" and confirmedPoint: "<score>"
    Given Nisa login with user:"normal" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    Then Nisa should see Dashboard Main Page
    When Nisa click to My Tier Status in Dashboard Main Page
    Then Nisa should see Tier Status Page
    Then Nisa should see All Privileges:"Tüm Seviyelerdeki Ayrıcalıklar İçin" in Tier Status Page
    Examples:
         | email                                 | password      | customerID |
         | userLoyaltyTierStatus6@modanisa.com   | Modanisa1234. | 12727392   |

  #@SD11
    @deneme1
  Scenario Outline: Nisa taps to "Tüm Seviyelerdeki Ayrıcalıklar İçin" button on "Üyelik Seviyem" page then nisa should see "Tüm Seviyelerdeki Ayrıcalıklar İçin" modal <TC>
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
    Then Nisa should see Privileges Title:"Ayrıcalıklar" in Tier Status Page
    Then Nisa should see Privileges Name:"<Privileges Name>" in Tier Status Page

    Examples:
      | TC | tier     | email                                 | password      | customerID | score | Privileges Name                     |
      | 1  | Silver   | userLoyaltyTierStatus7@modanisa.com   | Modanisa1234. | 12727393   | 50    | Puan Aralıkları                     |
      | 2  | Gold     | userLoyaltyTierStatus8@modanisa.com   | Modanisa1234. | 12727394   | 110   | Hoş Geldin Puanı                    |
      | 3  | Platinum | userLoyaltyTierStatus9@modanisa.com   | Modanisa1234. | 12727395   | 210   | Profil Doldurma Puanı               |
      | 4  | Silver   | userLoyaltyTierStatus10@modanisa.com  | Modanisa1234. | 12727396   | 50    | SMS ile İletişim İzni               |
      | 5  | Gold     | userLoyaltyTierStatus11@modanisa.com  | Modanisa1234. | 12727397   | 110   | E-mail ile İletişim İzni            |
      | 6  | Platinum | userLoyaltyTierStatus12@modanisa.com  | Modanisa1234. | 12727398   | 210   | Arama ile İletişim İzni             |
      | 7  | Silver   | userLoyaltyTierStatus13@modanisa.com  | Modanisa1234. | 12727441   | 50    | Ürün Yorumu Yapınca Kazanılan Puan  |
      #| 8  | Gold     | userLoyaltyTierStatus14@modanisa.com  | Modanisa1234. | 12727442   | 110   | Doğum Günü Puanı                    |




  @SD11 @CloseButton
  Scenario Outline: Nisa taps to close "Tüm Seviyelerdeki Ayrıcalıklar İçin" modal <TC>
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
      | TC | tier     | email                                  | password       | customerID | score |
      | 1  | Silver   | userLoyaltyTierStatus15@modanisa.com   | Modanisa1234. | 12727443   | 50    |
      | 2  | Gold     | userLoyaltyTierStatus16@modanisa.com   | Modanisa1234. | 12727444   | 110   |
      | 3  | Platinum | userLoyaltyTierStatus17@modanisa.com   | Modanisa1234. | 12727445   | 210   |

