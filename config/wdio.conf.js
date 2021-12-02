const chai = require("chai");
const rimraf = require("rimraf");
const allure = require("allure-commandline");
const path = require("path");


exports.config = {
    port: 4723,
    path: "/wd/hub",
    runner: 'local',
    specs: [
        //'./src/User/features/**/LandingPage.feature',
        //'./src/User/features/**/LandingPageNavigate.feature',
        //'./src/User/features/**/EnrollmentPage.feature',
        //'./src/User/features/**/DashboardMainPage.feature',
        //'./src/User/features/**/PointEarningPage.feature',
        './src/User/features/**/PointHistoryPage.feature',
        //'./src/User/features/**/RewardsPage.feature',
        //'./src/User/features/**/EarnedGiftsPage.feature',
        //'./src/User/features/**/TierStatusPage.feature',
        //'./src/User/features/**/FaqPage.feature',
    ],
    exclude: [],
    framework: 'cucumber',
    reporters: ['spec', ['allure', {
        outputDir: './Reports/Allure/allure-results',
        disableWebdriverStepsReporting: true,
        disableWebdriverScreenshotsReporting: true,
        useCucumberStepReporter: true,
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
        tagExpression: '@Deneme',
        timeout: 120000,
        ignoreUndefinedDefinitions: false
    },
    maxInstances: 1,
    logLevel: 'silent',
    bail: 0,
    waitforTimeout: 10000,
    connectionRetryTimeout: 120000,
    connectionRetryCount: 3,
    coloredLogs: true,

    onPrepare: async (config, capabilities) => {
        try{
            rimraf("./allure-report", function () {
                console.log("Allure Report Deleted");
            });
            rimraf("./Reports/Allure/allure-results", function () {
                console.log("Allure Json Files deleted");
            });
        }
        catch (e) {
            await console.info("dosya yok 1")
        }
    },
    onWorkerStart: async (cid, caps, specs, args, execArgv) => {
    },
    beforeSession: async (config, capabilities, specs) => {
    },
    before: async (capabilities, specs) => {
        await require('expect-webdriverio');
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
    beforeCommand: async (commandName, args) => {
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
        const reportError = new Error('Could not generate Allure report')
        const generation = allure(['generate', './Reports/Allure/allure-results', '--clean'])
        return new Promise((resolve, reject) => {
            const generationTimeout = setTimeout(
                () => reject(reportError),
                5000)

            generation.on('exit', function (exitCode) {
                clearTimeout(generationTimeout)

                if (exitCode !== 0) {
                    return reject(reportError)
                }

                console.log('Allure report successfully generated')
                resolve()
            })
        })
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
    },
    afterFeature: async (uri, feature) => {
        //console.info("afterFeature")
    }
}
