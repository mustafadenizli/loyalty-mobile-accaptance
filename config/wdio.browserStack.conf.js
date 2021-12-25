const chai = require("chai");
const rimraf = require("rimraf");
const allure = require("allure-commandline");
const wdioParallel = require('wdio-cucumber-parallel-execution');
const browserstack = require('browserstack-local');

let count = true;
const sourceSpecDirectory = `./src/User/features`;
let tmpSpecDirectory = `${sourceSpecDirectory}/tmp`;
let featureFilePath = `${tmpSpecDirectory}/*.feature`;

exports.config = {
    //outputDir: path.join(__dirname, "../log"),
    user: 'eneserdoan_5ocBua',
    key: 'CXTs5aPDQsX9NMCVaj99',
    host: 'hub.browserstack.com',
    specs: [
        featureFilePath
    ],
    exclude: [],
    framework: 'cucumber',
    reporters:
        ['spec',
            ['allure', {
                outputDir: './Reports/Allure/allure-results',
                disableWebdriverStepsReporting: true,
                disableWebdriverScreenshotsReporting: true,
                useCucumberStepReporter: true,
            }],

        ],
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
        timeout: 120000,
        ignoreUndefinedDefinitions: false
    },
    maxInstances: 4,
    logLevel: 'silent',
    bail: 0,
    waitforTimeout: 45000,
    connectionRetryTimeout: 200000,
    connectionRetryCount: 5,
    coloredLogs: true,
    specFileRetries: 2,
    specFileRetriesDelay: 0,
    specFileRetriesDeferred: false,
    onPrepare: async (config, capabilities) => {
        try {
            rimraf("./allure-report", function () {
                console.log("Allure Report Deleted");
            });
            rimraf("./Reports/Allure/allure-results", function () {
                console.log("Allure Json Files deleted");
            });
            await wdioParallel.performSetup({
                sourceSpecDirectory: sourceSpecDirectory,
                tmpSpecDirectory: tmpSpecDirectory,
                cleanTmpSpecDirectory: true
            });
            featureFilePath = `${tmpSpecDirectory}/*.feature`;
            console.log("Connecting local");
            return new Promise(function (resolve, reject) {
                exports.bs_local = new browserstack.Local();
                exports.bs_local.start({'key': exports.config.key}, function (error) {
                    if (error) return reject(error);
                    console.log('Connected. Now testing...');
                    resolve();
                });
            });

        } catch (e) {
            await console.info("Silinecek dosya yok")
        }
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
        exports.bs_local.stop(function () {
        });
    },
    onReload: function (oldSessionId, newSessionId) {
        //console.info("onReload")
    },
    beforeFeature: async (uri, feature) => {
        //console.info("beforeFeature")
        await console.log('\u001b[' + 32 + 'm' + 'Feature name : ' + feature.name + '\u001b[0m')
        count = true;
    },
    beforeScenario: async (world) => {
        //console.info("beforeScenario")
        try {
            let res = JSON.stringify(world.pickle.name)
            res = res.replace(/"/g, '');
            res = res.replace(/\\/g, "")
            await browser.reset()
            await browser.execute(`browserstack_executor: {"action": "setSessionName", "arguments": {"name":"` + world.gherkinDocument.feature.name
                + "-" + res + `"}}`);
            await console.log('\u001b[' + 34 + 'm' + '  Scenario name : ' + res + '\u001b[0m')
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
        }
    },
    afterScenario: async (world, result) => {
        //console.info("afterScenario")
        if (result.passed) {
            await browser.execute(`browserstack_executor: {"action": "setSessionStatus", "arguments": {"status":"passed","reason": "Succeed"}}`);
        } else {
            let res = JSON.stringify(result.error)
            res = res.replace(/\\n/g, ' ');
            res = res.replace(/"/g, '');
            await browser.execute(`browserstack_executor: {"action": "setSessionStatus", "arguments": {"status":"failed","reason": "` + res + `"}}`);
        }
    },
    afterFeature: async (uri, feature) => {
        //console.info("afterFeature")
    }
}