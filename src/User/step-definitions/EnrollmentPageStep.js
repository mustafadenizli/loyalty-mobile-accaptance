const {Given, When, Then} = require('@wdio/cucumber-framework');

const EnrollmentPage = require('../pages/EnrollmentPage')


Then(/^Nisa should see Enrollment Page Title$/, async () => {
    await EnrollmentPage.checkEnrollmentPageTitle()
});
When(/^Nisa click to Back Button in Enrollment Page$/, async () => {
    await EnrollmentPage.clickBackButton()
});
