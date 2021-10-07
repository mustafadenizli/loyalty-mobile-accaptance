const { config } = require("../wdio.conf");

// Desktop Local CHROME capabilities
config.capabilities = [
    {
        maxInstances: 5,
        browserName: 'chrome',
        "goog:chromeOptions": {
            args: [
                "--start-fullscreen",
                "--disable-setuid-sandbox",
                "--disable-dev-shm-usage",
                "--disable-gpu",
                "--no-first-run",
                "--no-sandbox",
                "--no-zygote",
                //"--headless",
            ],
        },
        acceptInsecureCerts: true
    }];

exports.config = config;