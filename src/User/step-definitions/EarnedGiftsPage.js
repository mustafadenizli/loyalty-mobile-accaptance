const {Given, When, Then} = require('@wdio/cucumber-framework');
const EarnedGiftsPage = require('../pages/EarnedGiftsPage')

Then(/^Nisa should see My Earned Gifts Page$/, async () => {
    await EarnedGiftsPage.checkRewardsPage()
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