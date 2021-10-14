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
Then(/^Nisa should see Pending Points: "([^"]*)" in Dashboard Main Page$/, async (text) => {
    await DashboardMainPage.checkPendingPoints(text)
});
Then(/^Nisa should see Welcome Text: "([^"]*)" in Dashboard Main Page$/, async (text) => {
    await DashboardMainPage.checkWelcomeText(text)
});
Then(/^Nisa should see Her Name: "([^"]*)" in Dashboard Main Page$/, async (text) => {
    await DashboardMainPage.checkHerName(text)
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