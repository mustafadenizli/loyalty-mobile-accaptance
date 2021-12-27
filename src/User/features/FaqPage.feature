Feature: FAQ Page

  As Nisa
  I want to see a FAQ page
  So that I know how to benefit best from the loyalty program

  | status    | Emails                       | Passwords      | CustomerIDs  |
  | normal    | userLoyaltyFaq@modanisa.com  | Modanisa1234.  | 12727306     |
  | normal    | userLoyaltyFaq1@modanisa.com | Modanisa1234.  | 12727411     |
  | normal    | userLoyaltyFaq2@modanisa.com | Modanisa1234.  | 12727412	 |
  | normal    | userLoyaltyFaq3@modanisa.com | Modanisa1234.  | 12727413	 |
  | normal    | userLoyaltyFaq4@modanisa.com | Modanisa1234.  | 12727414     |
  | normal    | userLoyaltyFaq5@modanisa.com | Modanisa1234.  | 12727415     |
  | normal    | userLoyaltyFaq6@modanisa.com | Modanisa1234.  | 12727416	 |
  | normal    | userLoyaltyFaq7@modanisa.com | Modanisa1234.  | 12727452     |
  | normal    | userLoyaltyFaq8@modanisa.com | Modanisa1234.  | 12727453     |


  Background:
    Given Nisa waits for Welcome page
    Given Nisa changes the Country to "Turkey" from the Shipping Country picker in Welcome page
    Given Nisa changes the Language to "Türkçe" from the Language picker in Welcome page
    Given Nisa taps on the Start Shopping button in Welcome page
    Given Nisa waits for Home page
    Given Nisa taps on the My Account button in bottom menu bar
    Given Nisa sendKey private api "customer-legacy-mdns-api-staging.modanisa.net" and restart app
    Given Nisa taps on the My Account button in bottom menu bar



  @FaqPage
  Scenario Outline:Nisa Sees FAQ Page <case number>
    Given Nisa is not enrolled user with customerId: "<customerID>"
    Given Nisa is enrolled user with customerId: "<customerID>" and e-mail: "<email>"
    Given Nisa login with user:"normal" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    Then Nisa should see Dashboard Main Page
    When Nisa click to Faq in Dashboard Main Page
    Then Nisa should see Faq Page Title

    Examples:
    | case number| customerID | email                        | password      |
    | 1          | 12727306   | userLoyaltyFaq@modanisa.com  | Modanisa1234. |



  @FaqPage @FaqDetailModal
  Scenario Outline:Nisa Sees FAQ Detail Modal <case number>
    Given Nisa is not enrolled user with customerId: "<customerID>"
    Given Nisa is enrolled user with customerId: "<customerID>" and e-mail: "<email>"
    Given Nisa login with user:"normal" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    Then Nisa should see Dashboard Main Page
    When Nisa click to Faq in Dashboard Main Page
    When Nisa click to Faq Name: "<faqName>" in Faq Page
    Then Nisa should see Faq Modal Title "<faqModalTitle>"
    Then Nisa should see Faq Modal Description "<faqModalDescription>"

    Examples:
      | case number | customerID | email                         | password       | faqName                                   | faqModalTitle                             | faqModalDescription                                        |
      | 1           | 12727411   | userLoyaltyFaq1@modanisa.com  | Modanisa1234.  | My Modanisa nedir                         | My Modanisa nedir                         | My Modanisa, Modanisa müşterilerinin ayrıcaklı dünyasıdır. |
     # | 2          | 12727412   | userLoyaltyFaq2@modanisa.com  | Modanisa1234.  | nasıl kayıt olurum                        | nasıl kayıt olurum                        | kayıt olmak                                                |
      | 3           | 12727412   | userLoyaltyFaq2@modanisa.com  | Modanisa1234.  | My Modanisa ne gibi ayrıcalıklar sağlar   | My Modanisa ne gibi ayrıcalıklar sağlar   | kayıt olduktan sonra                                       |
      | 4           | 12727413   | userLoyaltyFaq3@modanisa.com  | Modanisa1234.  | My Modanisa'da nasıl puan kazanabilirim   | My Modanisa'da nasıl puan kazanabilirim   | puan kazanmak çok kolay                                    |
      | 5           | 12727414   | userLoyaltyFaq4@modanisa.com  | Modanisa1234.  | kazandığım puanları nasıl harcayabilirim  | kazandığım puanları nasıl harcayabilirim  | ayrıcalıklar dünyası 3 aylık dönemlerden                   |
      | 6           | 12727415   | userLoyaltyFaq5@modanisa.com  | Modanisa1234.  | kazandığım puanlarımı nereden görebilirim | kazandığım puanlarımı nereden görebilirim | Modanisa hesabınızın görüntülendiği                        |
      | 7           | 12727416   | userLoyaltyFaq6@modanisa.com  | Modanisa1234.  | nasıl seviye atlayabilirim                | nasıl seviye atlayabilirim                | 3 farklı seviye bulunur                                    |
      | 8           | 12727452   | userLoyaltyFaq7@modanisa.com  | Modanisa1234.  | kayıt olmadan önce yaptığım alışverişler  | kayıt olmadan önce yaptığım alışverişler  | Sadece My Modanisa                                         |

  @FaqPage @CloseModal
  Scenario Outline:Nisa Closed FAQ Detail Modal <case number>
      Given Nisa is not enrolled user with customerId: "<customerID>"
      Given Nisa is enrolled user with customerId: "<customerID>" and e-mail: "<email>"
      Given Nisa login with user:"normal" email: "<email>" and password: "<password>"
      When Nisa taps to My Modanisa section
      Then Nisa should see Dashboard Main Page
      When Nisa click to Faq in Dashboard Main Page
      When Nisa click to Faq Name: "<faqName>" in Faq Page
      When Nisa click to Faq Modal Close Button
      Then Nisa should see Faq Page Title

      Examples:
        | case number | customerID | email                        | password        | faqName                                   |
        | 1           | 12727411   | userLoyaltyFaq1@modanisa.com  | Modanisa1234.  | My Modanisa nedir                         |
        #| 2          | 12727412   | userLoyaltyFaq2@modanisa.com  | Modanisa1234.  | nasıl kayıt olurum                        |
        | 3           | 12727412   | userLoyaltyFaq2@modanisa.com  | Modanisa1234.  | My Modanisa ne gibi ayrıcalıklar sağlar   |
        | 4           | 12727413   | userLoyaltyFaq3@modanisa.com  | Modanisa1234.  | My Modanisa'da nasıl puan kazanabilirim   |
        | 5           | 12727414   | userLoyaltyFaq4@modanisa.com  | Modanisa1234.  | kazandığım puanları nasıl harcayabilirim  |
        | 6           | 12727415   | userLoyaltyFaq5@modanisa.com  | Modanisa1234.  | kazandığım puanlarımı nereden görebilirim |
        | 7           | 12727416   | userLoyaltyFaq6@modanisa.com  | Modanisa1234.  | nasıl seviye atlayabilirim                |
        | 8           | 12727452   | userLoyaltyFaq7@modanisa.com  | Modanisa1234.  | kayıt olmadan önce yaptığım alışverişler  |




  @FaqPage @FagBackButton
  Scenario Outline:Nisa goes back to Dashboard Main Page from “Popular Questions Section” page <case number>
    Given Nisa is not enrolled user with customerId: "<customerID>"
    Given Nisa is enrolled user with customerId: "<customerID>" and e-mail: "<email>"
    Given Nisa login with user:"normal" email: "<email>" and password: "<password>"
    When Nisa taps to My Modanisa section
    Then Nisa should see Dashboard Main Page
    When Nisa click to Faq in Dashboard Main Page
    When Nisa click to Back Button in Faq Page
    Then Nisa should see Dashboard Main Page

    Examples:
      | case number | customerID   | email                         | password      |
      | 1           | 12727453	   | userLoyaltyFaq8@modanisa.com  | Modanisa1234. |




