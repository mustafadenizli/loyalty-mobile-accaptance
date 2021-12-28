Feature: Points History Page

  As Nisa
  I want to see how many points I got from what challenges, on what date
  So that I can keep track number of points I have earned from each challenge

  | status    | Emails                                | Passwords      | CustomerIDs |
  | normal    | userLoyaltyPointHistory@modanisa.com  | Modanisa1234.  | 12727302    |
  | normal    | userLoyaltyPointHistory1@modanisa.com  | Modanisa1234. | 12727403	 |
  | normal    | userLoyaltyPointHistory2@modanisa.com  | Modanisa1234. | 12727404	 |
  | normal    | userLoyaltyPointHistory3@modanisa.com  | Modanisa1234. | 12727405	 |


  Background:
    Given Nisa waits for Welcome page
    Given Nisa changes the Country to "Turkey" from the Shipping Country picker in Welcome page
    Given Nisa changes the Language to "Türkçe" from the Language picker in Welcome page
    Given Nisa taps on the Start Shopping button in Welcome page
    Given Nisa waits for Home page
    Given Nisa taps on the My Account button in bottom menu bar
    Given Nisa sendKey private api "customer-legacy-mdns-api-staging.modanisa.net" and restart app
    Given Nisa taps on the My Account button in bottom menu bar


  @PointHistory @ConfirmedPoints
  Scenario Outline: Nisa sees <challenge Name> and <challenge Point> information on the My Point History page with <email>.
    Given Nisa is not enrolled user with customerId: "<customerID>"
    Given Nisa is enrolled user with customerId: "<customerID>" and e-mail: "<email>"
    Given Nisa add Pending Point with customerId: "<customerID>" and pendingPoint: "<pending Point>"
    Given Nisa add Confirmed Point with customerId: "<customerID>" and confirmedPoint: "<confirmed Point>"
    Given Nisa login with user:"normal" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    Then Nisa should see Dashboard Main Page
    When Nisa click to Point Earning in Dashboard Main Page
    When Nisa click to Point History in Point Earning Page
    Then Nisa should see Point History Page
    Then Nisa should see Challenge Name: "<challenge Name>" in Point History Page
    Then Nisa should see Challenge Date: Today in Point History Page
    Then Nisa should see Challenge Point: "<challenge Point>" in Point History Page

    Examples:
    | customerID | email                                  | password      | pending Point | confirmed Point | challenge Name   | challenge Point   |
    | 12727302   | userLoyaltyPointHistory@modanisa.com   | Modanisa1234. | 10            | 10              | Hediye Puan      | 10 puan onaylandı |




  @PointHistory @BackButton
  Scenario Outline: Using the back button, Nisa returns to the previous page from my score history page with <email>
    Given Nisa is not enrolled user with customerId: "<customerID>"
    Given Nisa is enrolled user with customerId: "<customerID>" and e-mail: "<email>"
    Given Nisa login with user:"normal" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    Then Nisa should see Dashboard Main Page
    When Nisa click to Point Earning in Dashboard Main Page
    When Nisa click to Point History in Point Earning Page
    Then Nisa should see Point History Page
    When Nisa click to Back Button in Point History Page
    Then Nisa should see Dashboard Main Page

    Examples:
      | customerID | email                                  | password       |
      | 12727403   | userLoyaltyPointHistory1@modanisa.com  | Modanisa1234.  |

   @PointHistory @PhoneBackButton
     #android çalışıyor.
   Scenario Outline: Using the phone back button, Nisa returns to the previous page from my score history page with <email>
     Given Nisa is not enrolled user with customerId: "<customerID>"
     Given Nisa is enrolled user with customerId: "<customerID>" and e-mail: "<email>"
     Given Nisa login with user:"normal" email: "<email>" and password: "<password>"
     When Nisa taps to My Modanisa section
     Then Nisa should see Dashboard Main Page
     When Nisa click to Point Earning in Dashboard Main Page
     When Nisa click to Point History in Point Earning Page
     Then Nisa should see Point History Page
     When Nisa click Phone back button
     Then Nisa should see Dashboard Main Page

     Examples:
       | customerID | email                                  | password       |
       | 12727404   | userLoyaltyPointHistory2@modanisa.com  | Modanisa1234.  |
