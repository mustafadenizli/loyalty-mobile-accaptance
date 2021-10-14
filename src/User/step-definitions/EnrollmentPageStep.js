const {Given, When, Then} = require('@wdio/cucumber-framework');
const EnrollmentPage = require('../pages/EnrollmentPage')

Then(/^Nisa should see Enrollment Page$/, async () => {
    await EnrollmentPage.checkEnrollmentPageTitle()
});
When(/^Nisa click to Back Button in Enrollment Page$/, async () => {
    await EnrollmentPage.clickBackButton()
});
Then(/^Nisa should see Popup Message "([^"]*)" in Enrollment Page$/, async (text) => {
    await EnrollmentPage.checkPopupMessage(text)
});
When(/^Nisa click Enroll Button in Enrollment Page$/, async () => {
    await EnrollmentPage.clickEnrollButton()
});
Then(/^Nisa should see Enroll Button: "([^"]*)" in Enrollment Page$/, async (text) => {
    await EnrollmentPage.checkEnrollButton(text)
});
When(/^Nisa click Email Checkbox in Enrollment Page$/, async () => {
    await EnrollmentPage.clickEmailCheckbox()
});
When(/^Nisa click Button: "([^"]*)" in Enrollment Page$/, async (text) => {
    await EnrollmentPage.clickButton(text)
});
Then(/^Nisa should see Button: "([^"]*)" in Enrollment Page$/, async (text) => {
    await EnrollmentPage.checkButton(text)
});
Then(/^Nisa should see Page Terms Title: "([^"]*)" in Enrollment Page$/, async (text) => {
    await EnrollmentPage.checkPageTermsTitle(text)
});
When(/^Nisa click Page Terms Close Button in Enrollment Page$/, async () => {
    await EnrollmentPage.clickPageTermsClose()
});
Then(/^Nisa should see Privacy Policy Title: "([^"]*)" in Enrollment Page$/, async (text) => {
    await EnrollmentPage.checkPrivacyPolicyTitle(text)
});
When(/^Nisa click Privacy Policy Close Button in Enrollment Page$/, async () => {
    await EnrollmentPage.clickPrivacyPolicyClose()
});
When(/^Nisa click Complete Button in Enrollment Page$/, async () => {
    await EnrollmentPage.clickCompleteButton()
});
When(/^Nisa sendKeys Email: "([^"]*)" in Enrollment Page$/, async (text) => {
    await EnrollmentPage.sendKeyEmail(text)
});