const axios = require('axios').default;

class MdnsClient {
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

module.exports = new MdnsClient();
