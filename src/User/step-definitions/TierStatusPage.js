const {Given, When, Then} = require('@wdio/cucumber-framework');
const TierStatusPage = require('../pages/TierStatusPage')

Then(/^Nisa should see Tier Status Page$/, async () => {
    await TierStatusPage.checkTierStatusPage()
});
When(/^Nisa click to Back Button in Tier Status Page$/, async () => {
    await TierStatusPage.clickBackButton()
});
Then(/^Nisa should see Tier:"([^"]*)" in Tier Status Page$/, async (text) => {
    await TierStatusPage.checkTierName(text)
});
Then(/^Nisa should see Score:"([^"]*)" in Tier Status Page$/, async (text) => {
    await TierStatusPage.checkScore(text)
});
Then(/^Nisa should see Membership Date today in Tier Status Page$/, async () => {
    await TierStatusPage.checkMembershipDate()
});
Then(/^Nisa should see Privileges Tier:"([^"]*)" in Tier Status Page$/, async (text) => {
    await TierStatusPage.checkPrivilegesTier(text)
});
Then(/^Nisa should see Privileges Name:"([^"]*)" in Tier Status Page$/, async (text) => {
    await TierStatusPage.checkPrivilegesName(text)
});
When(/^Nisa click to All Privilages in Tier Status Page$/, async () => {

    await TierStatusPage.clickAllPrivileges()
});
Then(/^Nisa should see Modal Title:"([^"]*)" in Tier Status Page$/, async (text) => {
    await TierStatusPage.checkModalTitle(text)
});
When(/^Nisa click to Close Modal in Tier Status Page$/, async () => {
    await TierStatusPage.clickModalClose()
});