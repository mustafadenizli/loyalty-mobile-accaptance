const {Given, When, Then} = require('@wdio/cucumber-framework');
const PointEarningPage = require('../pages/PointEarningPage')

Then(/^Nisa should see Point Earning Page$/, async () => {
    await PointEarningPage.checkPointEarningPage()
});
When(/^Nisa click to Back Button in Point Earning Page$/, async () => {
    await PointEarningPage.clickBackButton()
});
Then(/^Nisa should see Challenges in Point Earning Page$/, async () => {
    await PointEarningPage.checkChallenges()
});
Then(/^Nisa should see sorted Challenges in Point Earning Page$/, async () => {
    await PointEarningPage.checkChallengesSorted()
});
Then(/^Nisa should see Challenge Title: "([^"]*)" in Point Earning Page$/, async (text) => {
    await PointEarningPage.checkChallengeTitle(text)
});
Then(/^Nisa should see Challenge Description: "([^"]*)" in Point Earning Page$/, async (text) => {
    await PointEarningPage.checkChallengeDescription(text)
});
Then(/^Nisa should see Challenge Points: "([^"]*)" in Point Earning Page$/, async (text) => {
    await PointEarningPage.checkChallengePoint(text)
});
When(/^Nisa click to Point History in Point Earning Page$/, async () => {
    await PointEarningPage.clickPointHistory()
});