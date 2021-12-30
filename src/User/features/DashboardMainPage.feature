Feature: Dashboard Main Page

  As Nisa
  I want to know my loyalty point metrcis
  So that I can see my confirmed or pending points

  | status    | Emails                             | Passwords      | CustomerIDs |
  | normal    | userLoyaltyDashboard1@modanisa.com | Modanisa1234.  | 12727300    |
  | normal    | userLoyaltyDashboard2@modanisa.com | Modanisa1234.  | 12727273    |
  | normal    | userLoyaltyDashboard3@modanisa.com | Modanisa1234.  | 12727381	  |
  | normal    | userLoyaltyDashboard4@modanisa.com | Modanisa1234.  | 12727382	  |
  | normal    | userLoyaltyDashboard5@modanisa.com | Modanisa1234.  | 12727383	  |
  | normal    | userLoyaltyDashboard6@modanisa.com | Modanisa1234.  | 12727384    |
  | normal    | userLoyaltyDashboard7@modanisa.com | Modanisa1234.  | 12727385    |
  | normal    | userLoyaltyDashboard8@modanisa.com | Modanisa1234.  | 12727386	  |
  | normal    | userLoyaltyDashboard9@modanisa.com | Modanisa1234.  | 12727477    |

  Background:
    Given Nisa waits for Welcome page
    Given Nisa changes the Country to "Turkey" from the Shipping Country picker in Welcome page
    Given Nisa changes the Language to "Türkçe" from the Language picker in Welcome page
    Given Nisa taps on the Start Shopping button in Welcome page
    Given Nisa waits for Home page
    Given Nisa taps on the My Account button in bottom menu bar
    Given Nisa sendKey private api "customer-legacy-mdns-api-staging.modanisa.net" and restart app
    Given Nisa taps on the My Account button in bottom menu bar

  @DashboardMainPage @Sections
  Scenario Outline:Nisa Sees Sections on Dashboard Main Page with <email> email
    Given Nisa login with user:"<status>" email: "<email>" and password: "<password>"
    Given Nisa is not enrolled user with customerId: "<customerId>"
    Given Nisa is enrolled user with customerId: "<customerId>" and e-mail: "<email>"
    When Nisa taps to My Modanisa section
    Then Nisa should see Dashboard Main Page
    Then Nisa should see Point Earning in Dashboard Main Page
    Then Nisa should see Rewards in Dashboard Main Page
    Then Nisa should see My Earned Gifts in Dashboard Main Page
    Then Nisa should see My Tier Status in Dashboard Main Page
    Then Nisa should see Faq in Dashboard Main Page
    Examples:
      | status | email                              | password      | customerId |
      | normal | userLoyaltyDashboard1@modanisa.com | Modanisa1234. | 12727300   |

  @DashboardMainPage @Components
  Scenario Outline:Nisa Sees Components on Dashboard Main Page with <email> email
    Given Nisa login with user:"<status>" email: "<email>" and password: "<password>"
    Given Nisa is not enrolled user with customerId: "<customerId>"
    Given Nisa is enrolled user with customerId: "<customerId>" and e-mail: "<email>"
    Given Nisa add Pending Point with customerId: "<customerId>" and pendingPoint: "<addPendingPoint>"
    When Nisa taps to My Modanisa section
    Then Nisa should see Dashboard Main Page
    Then Nisa should see Welcome Text: "Merhaba" in Dashboard Main Page
    Then Nisa should see Description Text: "My Modanisa’ya Hoş Geldin" in Dashboard Main Page
    Then Nisa should see Confirmed Points Name: "Güncel Puanlarım" in Dashboard Main Page
    Then Nisa should see Pending Points Name: "Onay Bekleyen Puan" in Dashboard Main Page
    Examples:
      | status | email                              | password      | customerId | addPendingPoint |
      | normal | userLoyaltyDashboard2@modanisa.com | Modanisa1234. | 12727273   | 10              |

  @DashboardMainPage @HerName
  Scenario Outline:Nisa Sees Her Name on Dashboard Main Page with <email> email
    Given Nisa login with user:"<status>" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    Then Nisa should see Dashboard Main Page
    Then Nisa should see Her Name: "<herName>" in Dashboard Main Page
    Examples:
      | status | email                              | password      | herName   |
      | normal | userLoyaltyDashboard3@modanisa.com | Modanisa1234. | Dashboard |

  @DashboardMainPage @NotHerName
  Scenario Outline:Nisa Does not See Her Name on Dashboard Main Page
    Given Nisa login with user:"<status>" email: "<email>" and password: "<password>"
    Given Nisa is not enrolled user with customerId: "<customerId>"
    Given Nisa is enrolled user with customerId: "<customerId>" and e-mail: "<email>"
    When Nisa taps to My Modanisa section
    Then Nisa should see Dashboard Main Page
    Then Nisa should not see Her Name in Dashboard Main Page
    Examples:
      | status | email                              | password      | customerId |
      | normal | userLoyaltyDashboard4@modanisa.com | Modanisa1234. | 12727382   |

  @DashboardMainPage @ConfirmedPoint
  Scenario Outline:Nisa Sees Her Confirmed Points and added Confirmed Points on Dashboard Main Page with <email> email
    Given Nisa login with user:"<status>" email: "<email>" and password: "<password>"
    Given Nisa is not enrolled user with customerId: "<customerId>"
    Given Nisa is enrolled user with customerId: "<customerId>" and e-mail: "<email>"
    When Nisa taps to My Modanisa section
    Then Nisa should see Dashboard Main Page
    Then Nisa should see Confirmed Points: "<firstConfirmedPoint>" in Dashboard Main Page
    Given Nisa add Confirmed Point with customerId: "<customerId>" and confirmedPoint: "<addConfirmedPoint>"
    When Nisa click to Back Button in Dashboard Main Page
    When Nisa taps to My Modanisa section
    Then Nisa should see Confirmed Points: "<secondConfirmedPoint>" in Dashboard Main Page
    Examples:
      | status | email                              | password      | customerId | firstConfirmedPoint | addConfirmedPoint | secondConfirmedPoint |
      | normal | userLoyaltyDashboard5@modanisa.com | Modanisa1234. | 12727383   | 5                   | 10                | 15                   |

  @DashboardMainPage @NotPendingPoints
  Scenario Outline:Nisa should not see Pending Points in Dashboard Main Page with <email> email
    Given Nisa login with user:"<status>" email: "<email>" and password: "<password>"
    Given Nisa is not enrolled user with customerId: "<customerId>"
    Given Nisa is enrolled user with customerId: "<customerId>" and e-mail: "<email>"
    When Nisa taps to My Modanisa section
    Then Nisa should see Dashboard Main Page
    Then Nisa should not see Pending Points in Dashboard Main Page
    Examples:
      | status | email                              | password      | customerId |
      | normal | userLoyaltyDashboard6@modanisa.com | Modanisa1234. | 12727384   |

  @DashboardMainPage @PendingPoints
  Scenario Outline:Nisa Sees Her Pending Points and added <10> Pending Points on Dashboard Main Page with <email> email.
    Given Nisa login with user:"<status>" email: "<email>" and password: "<password>"
    Given Nisa is not enrolled user with customerId: "<customerId>"
    Given Nisa is enrolled user with customerId: "<customerId>" and e-mail: "<email>"
    When Nisa taps to My Modanisa section
    Then Nisa should see Dashboard Main Page
    Then Nisa should not see Pending Points in Dashboard Main Page
    Given Nisa add Pending Point with customerId: "<customerId>" and pendingPoint: "<addConfirmedPoint>"
    When Nisa click to Back Button in Dashboard Main Page
    When Nisa taps to My Modanisa section
    Then Nisa should see Pending Points: "<confirmedPoint>" in Dashboard Main Page
    Examples:
      | status | email                              | password      | customerId | addConfirmedPoint | confirmedPoint |
      | normal | userLoyaltyDashboard7@modanisa.com | Modanisa1234. | 12727385   | 10                | 10             |

  @DashboardMainPage @BackButton
  Scenario Outline:Nisa Goes Back to Previous Page From Dashboard Main Page with <email> email
    Given Nisa login with user:"<status>" email: "<email>" and password: "<password>"
    Given Nisa is not enrolled user with customerId: "<customerId>"
    Given Nisa is enrolled user with customerId: "<customerId>" and e-mail: "<email>"
    When Nisa taps to My Modanisa section
    Then Nisa should see Dashboard Main Page
    When Nisa click to Back Button in Dashboard Main Page
    Then Nisa should see My Account page
    Examples:
      | status | email                              | password      | customerId |
      | normal | userLoyaltyDashboard8@modanisa.com | Modanisa1234. | 12727386   |
