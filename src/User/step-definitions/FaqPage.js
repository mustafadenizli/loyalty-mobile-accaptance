const {Given, When, Then} = require('@wdio/cucumber-framework');

const FaqPage = require('../pages/FaqPage')

Then(/^Nisa should see Faq Page Title$/, async () => {
    await FaqPage.checkFaqPage()
});
When(/^Nisa click to Back Button in Faq Page$/, async () => {
    await FaqPage.clickBackButton()
});
Then(/^Nisa should see Faq Modal Title "([^"]*)"$/, async (text) => {
    await FaqPage.checkFaqModalTitle(text)
});
Then(/^Nisa should see Faq Modal Description "([^"]*)"$/, async (text) => {
    await FaqPage.checkFaqModalDescription(text)
});
When(/^Nisa click to Faq Modal Close Button$/, async () => {
    await FaqPage.clickFaqModalCloseButton()
});