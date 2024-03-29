const {Given, When, Then} = require('@wdio/cucumber-framework');
const EarnedGiftsPage = require('../pages/EarnedGiftsPage')

Then(/^Nisa should see My Earned Gifts Page$/, async () => {
    await EarnedGiftsPage.checkEarnedGiftsPage()
});
When(/^Nisa click to Back Button in My Earned Gifts Page$/, async () => {
    await EarnedGiftsPage.clickBackButton()
});
Then(/^Nisa should see Gift Name: "([^"]*)" in My Earned Gifts Page$/, async (text) => {
    await EarnedGiftsPage.checkGiftName(text)
});
Then(/^Nisa should see Gift Expiration Date: "([^"]*)" to Gift Name:"([^"]*)" in My Earned Gifts Page$/, async (expirationDate, giftName) => {
    await EarnedGiftsPage.checkGiftExpiritaionDate(giftName, expirationDate)
});
Then(/^Nisa should see Gift Expiration Date: "([^"]*)" in My Earned Gifts Page$/, async (text) => {
    await EarnedGiftsPage.checkExpirationDate(text)
});
Then(/^Nisa should see Empty Message: "([^"]*)" in My Earned Gifts Page$/, async (text) => {
    await EarnedGiftsPage.checkEmptyMessage(text)
});
Then(/^Nisa should see Empty Description: "([^"]*)" in My Earned Gifts Page$/, async (text) => {
    await EarnedGiftsPage.checkEmptyDescription(text)
});
Then(/^Nisa should see Button Name: "([^"]*)" in My Earned Gifts Page$/, async (text) => {
    await EarnedGiftsPage.checkHediyeleriKesfetButton(text)
});
When(/^Nisa click to Discover Gifts Button in My Earned Gifts Page$/, async () => {
    await EarnedGiftsPage.clickHediyeleriKesfetButton()
});