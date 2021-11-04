const chai = require("chai");
let count = 0

exports.config = {
    host: 'hub.browserstack.com',
    port: 443,
    path: "/wd/hub",
    runner: 'local',
    specs: [
        './src/User/features/**/LandingPage.feature',
        './src/User/features/**/LandingPageNavigate.feature',
        './src/User/features/**/EnrollmentPage.feature',
        './src/User/features/**/DashboardMainPage.feature',
        './src/User/features/**/PointEarningPage.feature',
        './src/User/features/**/PointHistoryPage.feature',
        './src/User/features/**/RewardsPage.feature',
        './src/User/features/**/EarnedGiftsPage.feature',
        './src/User/features/**/TierStatusPage.feature',
        './src/User/features/**/FaqPage.feature',

    ],
    exclude: [],
    logLevel: 'silent',
    bail: 0,
    waitforTimeout: 20000,
    connectionRetryTimeout: 120000,
    connectionRetryCount: 3,
    services: [
        ['appium',
            {args: {}, command: 'appium'}
        ],
        ['browserstack']
    ],
    framework: 'cucumber',
    reporters: ['spec', ['allure', {
        outputDir: './Reports/Allure/allure-results',
        disableWebdriverStepsReporting: true,
        disableWebdriverScreenshotsReporting: true,
        useCucumberStepReporter: true
    }]],
    cucumberOpts: {
        require: ['./src/**/step-definitions/*.js'],
        backtrace: false,
        requireModule: [],
        dryRun: false,
        failFast: false,
        format: ['pretty'],
        snippets: true,
        source: true,
        profile: [],
        strict: false,
        tagExpression: 'not @Hatali',
        timeout: 60000,
        ignoreUndefinedDefinitions: false
    },


    onPrepare: async (config, capabilities) => {
        //console.info("onPrepare")
    },
    onWorkerStart: function (cid, caps, specs, args, execArgv) {
        //console.info("onWorkerStart")

    },
    beforeSession: async (config, capabilities, specs) => {
        //console.info("beforeSession")
        let featureName = await specs && specs[0].split('/').pop() || undefined;
        featureName = await featureName.replace(".feature", "")
        capabilities.name = featureName
    },
    before: async (capabilities, specs, browser) => {
        //console.info("before")
        require('expect-webdriverio');
        global.wdioExpect = global.expect;
        global.expect = chai.expect;
    },
    beforeSuite: function (suite) {
        //console.info("beforeSuite")
    },
    beforeHook: function (test, context) {
        //console.info("beforeHook")
    },
    afterHook: function (test, context, {error, result, duration, passed, retries}) {
        //console.info("afterHook")
    },
    beforeTest: function (test, context) {
        //console.info("beforeTest")
    },
    beforeCommand: function (commandName, args) {
        //console.info("beforeCommand")
    },
    afterCommand: function (commandName, args, result, error) {
        //console.info("afterCommand")
    },
    afterTest: function (test, context, {error, result, duration, passed, retries}) {
        //console.info("afterTest")
    },
    afterSuite: function (suite) {
        //console.info("afterSuite")
    },
    after: function (result, capabilities, specs) {
        //console.info("after")
    },
    afterSession: function (config, capabilities, specs) {
        //console.info("afterSession")
    },
    onComplete: function (exitCode, config, capabilities, results) {
        //console.info("onComplete")
    },
    onReload: function (oldSessionId, newSessionId) {
        //console.info("onReload")
    },
    beforeFeature: async (uri, feature) => {
        //console.info("beforeFeature")
        await console.log('\u001b[' + 32 + 'm' + 'Feature name : ' + feature.name + '\u001b[0m')
    },
    beforeScenario: async (world) => {
        //console.info("beforeScenario")
        try {
            await browser.reset()
            await console.log('\u001b[' + 34 + 'm' + '  Scenario name : ' + world.pickle.name + '\u001b[0m')
        } catch (e) {
        }
    },
    beforeStep: async (step, scenario) => {
        //console.info("beforeStep")
        await console.log('\u001b[' + 33 + 'm' + '      Step Start : ' + step.text + '\u001b[0m')
    },
    afterStep: async (step, scenario, result) => {
        //console.info("afterStep")
        if (await result.passed == true) {
            await console.log('\u001b[' + 32 + 'm' + '    ✓ Step Succeed : ' + step.text + '\u001b[0m')
        } else {
            await console.log('\u001b[' + 31 + 'm' + '    ✖ Step Fail : ' + step.text + '\u001b[0m')
            browser.takeScreenshot();
        }
    },
    afterScenario: async (world, result) => {
        //console.info("afterScenario")
        try {
            if (await result.passed) {
            } else {
                count = 1
            }
        } catch (e) {
        }

    },
    afterFeature: async (uri, feature) => {
        //console.info("afterFeature")
        if (count == 0) {
            await browser.execute(`browserstack_executor: {"action": "setSessionStatus", "arguments": {"status":"passed","reason": "Succeed"}}`);
        } else {
            await browser.execute(`browserstack_executor: {"action": "setSessionStatus", "arguments": {"status":"failed","reason": "Failed"}}`);
        }
    }
}
