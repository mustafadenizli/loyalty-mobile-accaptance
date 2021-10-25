const {Given, When, Then} = require('@wdio/cucumber-framework');
const PointHistoryPage = require('../pages/PointHistoryPage')

Then(/^Nisa should see Point History Page$/, async () => {
    await PointHistoryPage.checkPointHistoryPage()
});
When(/^Nisa click to Back Button in Point History Page$/, async () => {
    await PointHistoryPage.clickBackButton()
});
Then(/^Nisa should see Challenge Point: "([^"]*)" in Point History Page$/, async (text) => {
    await PointHistoryPage.checkChallengePoint(text)
});
Then(/^Nisa should see Challenge Name: "([^"]*)" in Point History Page$/, async (text) => {
    await PointHistoryPage.checkChallengeName(text)
});
Then(/^Nisa should see Challenge Date: "([^"]*)" in Point History Page$/, async (text) => {
    await PointHistoryPage.checkChallengeDate(text)
});
Then(/^Nisa should see Challenge Date: Today in Point History Page$/, async () => {
    await PointHistoryPage.checkChallengeDateToday()
});