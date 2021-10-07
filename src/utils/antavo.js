const axios = require('axios').default;
const antavoApiBaseUrl = 'https://api.modanisa-test.antavo.com';
const antavoApiKey = 'AN03OWIATAACHWVOC7G';

class AntavoClient {
    async optOutCustomer(customerId) {
        browser.pause(2000)
        await axios.post(antavoApiBaseUrl + '/events?api_key=' + antavoApiKey, {
            customer: customerId,
            action: 'opt_out'
        }).then(function (response) {
            console.log(response);
        }).catch(function (error) {
            console.log(error);
        });
        browser.pause(2000)
    }

    async optInCustomer(customerId, email) {
        browser.pause(2000)
        await axios.post(antavoApiBaseUrl + '/events?api_key=' + antavoApiKey, {
            customer: customerId,
            action: "opt_in",
            data: {email: email}
        }).then(function (response) {
            console.log(response);
        }).catch(function (error) {
            console.log(error);
        });
        browser.pause(2000)
    }

    async operationPendingPoints(customerId, pendingPoints, operation) {
        browser.pause(2000)
        await axios.post(antavoApiBaseUrl + '/events?api_key=' + antavoApiKey, {
            customer: customerId,
            action: "operation_pending_points",
            data: {
                pending_points: pendingPoints,
                operation: operation
            }
        }).then(function (response) {
            console.log(response);
        }).catch(function (error) {
            console.log(error);
        });
        browser.pause(2000)
    }

    async addPoints(point, customerId) {
        browser.pause(2000)
        await axios.post(antavoApiBaseUrl + '/events?api_key=' + antavoApiKey, {
            customer: customerId,
            action: "point_add",
            data: {points: point}
        }).then(function (response) {
            console.log(response);
        }).catch(function (error) {
            console.log(error);
        });
        browser.pause(2000)
    }
}

module.exports = new AntavoClient();
