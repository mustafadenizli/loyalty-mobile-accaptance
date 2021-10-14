const axios = require('axios').default;
const antavoApiBaseUrl = 'https://api.modanisa-test.antavo.com';
const antavoApiKey = 'AN03OWIATAACHWVOC7G';

class Api {
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

    async getAccessToken() {
        let token = "";
        await axios.post('http://api1.modanisa.com/security/oauth/v2/token', {
            'scope': 'internal',
            'grant_type': 'client_credentials'
        }, {
            headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Basic MTlfNXByNjRwa2hnNXNzb3NjMGdrc280MHNna3drNHNrazBjbzhrc2trMDRra29jNGdzd2M6bDV4cmY1ZDNubzA4MDQ0MGdrb2dzbzA4d2drd3c0a2NzOHc0MDgwOHd3NGN3azhrbw=='
            }
        }).then(function (response) {
            token = response.data['access_token']
            return token
        }).catch(function (error) {
            console.log(error);
        });
        return token
    }

    async resetNotificationPreferences(token, customerId) {
        await axios.put(`http://api1.modanisa.com/v2/customers/${customerId}/permissions`, {
            perEmail: 0,
            perSms: 0,
            perTelSale: 0,
            perPermissions: 15,
        }, {
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                'Authorization': `Bearer ${token}`,
                'X-Mdns-Username': 'mobileAppAndroid',
                'X-Mdns-Token': '505e9c2aec75cac4a6575b4d34310ab8',
                'X-Mdns-Version': '1.0.0',
                'X-Mdns-Timestamp': 1531382892

            }
        }).then(function (response) {
            console.log('SMS_PERMISSION: ', response.data.data.perSms, ', EMAIL_PERMISSION: ', response.data.data.perEmail, ', PHONE_CALL_PERMISSION: ', response.data.data.perTelSale)
        }).catch(function (error) {
            console.log(error);
        });
    }
}

module.exports = new Api();
