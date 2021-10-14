const {Given, When, Then} = require('@wdio/cucumber-framework');
const RewardsPage = require('../pages/RewardsPage')

Then(/^Nisa should see Rewards Page$/, async () => {
    await RewardsPage.checkRewardsPage()
});
When(/^Nisa click to Back Button in Rewards Page$/, async () => {
    await RewardsPage.clickBackButton()
});
Then(/^Nisa should see Confirmed Points: "([^"]*)" in Rewards Page$/, async (text) => {
    await RewardsPage.checkConfirmedPoint(text)
});
Then(/^Nisa should see sorted Gifts in Rewards Page$/, async () => {
    await RewardsPage.checkGiftsSorted()
});
Then(/^Nisa should see Button Name: "([^"]*)" under Confirmed Points in Rewards Page$/, async (text) => {
    await RewardsPage.checkHediyeyiAlOrPuanKazan(text)
});
Then(/^Nisa should see Expire Date: "([^"]*)" in Rewards Page$/, async (text) => {
    await RewardsPage.checkExpireDate(text)
});