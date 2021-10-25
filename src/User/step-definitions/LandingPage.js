const {Given, When, Then} = require('@wdio/cucumber-framework');
const LandingPage = require('../pages/LandingPage')
const Legacy = require("../common/pages/Legacy");

Then(/^Nisa should see Landing Page Title$/, async () => {
    await LandingPage.checkLandingPageTitle()
});
When(/^Nisa click to Back Button in Landing Page$/, async () => {
    await LandingPage.clickBackButton()
});
Then(/^Nisa should see Description: "([^"]*)" in Landing Page$/, async (text) => {
    await LandingPage.checkLandingPageDescription(text)
});
Then(/^Nisa should see Button: "([^"]*)" in Landing Page$/, async (text) => {
    await LandingPage.checkButtonName(text)
});
When(/^Nisa click Button: "([^"]*)" in Landing Page$/, async (text) => {
    await LandingPage.clickButton(text)
});
Then(/^Nisa should see Tab: "([^"]*)" in Landing Page$/, async (text) => {
    await LandingPage.checkTabName(text)
});
When(/^Nisa click to Tab: "([^"]*)" in Landing Page$/, async (text) => {
    await LandingPage.clickTabName(text)
});
Then(/^Nisa should see Tab Card: "([^"]*)" in Landing Page$/, async (text) => {
    await LandingPage.checkTabCardName(text)
});
Then(/^Nisa should see Faq Area Name: "([^"]*)" in Landing Page$/, async (text) => {
    await LandingPage.checkFaqAreaName(text)
});
When(/^Nisa click to Faq Name: "([^"]*)" in Landing Page$/, async (text) => {
    await LandingPage.clickFaqName(text)
});
Then(/^Nisa should see Faq Name: "([^"]*)" in Landing Page$/, async (text) => {
    await LandingPage.checkFaqName(text)
});
When(/^Nisa click to All Faq in Landing Page$/, async () => {
    await LandingPage.clickAllFaq()
});
Then(/^Nisa should see All Faq: "([^"]*)" in Landing Page$/, async (text) => {
    await LandingPage.checkAllFaqName(text)
});
Then(/^Nisa should see Popup Message "([^"]*)" in Landing Page$/, async (text) => {
    await LandingPage.checkPopupMessage(text)
});
When(/^Nisa click Popup Button "([^"]*)" in Landing Page$/, async (text) => {
    await LandingPage.clickPopupButton()
});
When(/^Nisa login with email: "([^"]*)" and password: "([^"]*)" in Landing Page$/, async (email, password) => {
    await Legacy.clickEmailTab()
    await Legacy.checkEmailTabOpen()
    await Legacy.setTextEmail(email)
    await Legacy.setTextPassword(password)
    await Legacy.clickGirisYapButton()
});