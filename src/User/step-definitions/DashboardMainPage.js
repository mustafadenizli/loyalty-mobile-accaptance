const {Given, When, Then} = require('@wdio/cucumber-framework');
const DashboardMainPage = require("../pages/DashboardMainPage");

Then(/^Nisa should see Dashboard Main Page$/, async () => {
    await DashboardMainPage.checkDashboardMainPage()
});
When(/^Nisa click to Back Button in Dashboard Main Page$/, async () => {
    await DashboardMainPage.clickBackButton()
});
Then(/^Nisa should see Confirmed Points Name: "([^"]*)" in Dashboard Main Page$/, async (text) => {
    await DashboardMainPage.checkConfirmedPointsName(text)
});
Then(/^Nisa should see Confirmed Points: "([^"]*)" in Dashboard Main Page$/, async (text) => {
    await DashboardMainPage.checkConfirmedPoints(text)
});
Then(/^Nisa should see Pending Points Name: "([^"]*)" in Dashboard Main Page$/, async (text) => {
    await DashboardMainPage.checkPendingPointsName(text)
});
Then(/^Nisa should see Pending Points: "([^"]*)" in Dashboard Main Page$/, async (text) => {
    await DashboardMainPage.checkPendingPoints(text)
});
Then(/^Nisa should not see Pending Points in Dashboard Main Page$/, async () => {
    await DashboardMainPage.checkNotPendingPoints()
});
Then(/^Nisa should see Welcome Text: "([^"]*)" in Dashboard Main Page$/, async (text) => {
    await DashboardMainPage.checkWelcomeText(text)
});
Then(/^Nisa should see Description Text: "([^"]*)" in Dashboard Main Page$/, async (text) => {
    await DashboardMainPage.checkDescriptionText(text)
});
Then(/^Nisa should see Her Name: "([^"]*)" in Dashboard Main Page$/, async (text) => {
    await DashboardMainPage.checkHerName(text)
});
Then(/^Nisa should not see Her Name in Dashboard Main Page$/, async () => {
    await DashboardMainPage.checkNotHerName()
});
When(/^Nisa click to Point Earning in Dashboard Main Page$/, async () => {
    await DashboardMainPage.clickEarningPoints()
});
When(/^Nisa click to Rewards in Dashboard Main Page$/, async () => {
    await DashboardMainPage.clickRewards()
});
When(/^Nisa click to My Earned Gifts in Dashboard Main Page$/, async () => {
    await DashboardMainPage.clickMyEarnedGifts()
});
When(/^Nisa click to My Tier Status in Dashboard Main Page$/, async () => {
    await DashboardMainPage.clickMyTierStatus()
});
When(/^Nisa click to Faq in Dashboard Main Page$/, async () => {
    await DashboardMainPage.clickFaq()
});

Then(/^Nisa should see Point Earning in Dashboard Main Page$/, async () => {
    await DashboardMainPage.checkEarningPoints()
});
Then(/^Nisa should see Rewards in Dashboard Main Page$/, async () => {
    await DashboardMainPage.checkRewards()
});
Then(/^Nisa should see My Earned Gifts in Dashboard Main Page$/, async () => {
    await DashboardMainPage.checkMyEarnedGifts()
});
Then(/^Nisa should see My Tier Status in Dashboard Main Page$/, async () => {
    await DashboardMainPage.checkMyTierStatus()
});
Then(/^Nisa should see Faq in Dashboard Main Page$/, async () => {
    await DashboardMainPage.checkFaq()
});