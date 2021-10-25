const {config} = require("../wdio.conf");

config.capabilities = [
    {
        project: "loyant-mobile-acceptance",
        build: "Loyalty Team Android Tests",
        os_version: '9.0',
        device: 'Google Pixel 3',
        "app_url": process.env.APP_ID,
        acceptInsecureCerts: 'true',
        autoGrantPermissions: 'true',
        maxInstances: 3,
    },
];

config.services = ["browserstack"];
config.user = "tayfun.oztan@modanisa.com";
config.key = "123456qq@@";
exports.config = config;
