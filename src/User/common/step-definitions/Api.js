const {Given, When, Then} = require('@wdio/cucumber-framework');
const Api = require("../pages/Api");


Given(/^Nisa is not allow any notification permission with customerId: "([^"]*)"$/, async (customerId) => {
    let token = await Api.getAccessToken()
    await Api.resetNotificationPreferences(token, customerId)

});
Given(/^Nisa is enrolled user with customerId: "([^"]*)" and e\-mail: "([^"]*)"$/, async (customerId, email) => {
    await Api.optInCustomer(customerId, email)
});
Given(/^Nisa is not enrolled user with customerId: "([^"]*)"$/, async (customerId) => {
    await Api.optOutCustomer(customerId)
});
Given(/^Nisa add Pending Point with customerId: "([^"]*)" and pendingPoint: "([^"]*)"$/, async (customerId, point) => {
    await Api.operationPendingPoints(customerId, point, "add")
});