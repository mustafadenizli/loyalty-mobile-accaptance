const chai = require("chai");
const path = require("path");
const rimraf = require("rimraf");
const allure = require("allure-commandline");

exports.config = {

    port: 4723,
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
    exclude: [
        // 'path/to/excluded/files'
    ],

    maxInstances: 1,
    logLevel: 'silent',
    bail: 0,
    waitforTimeout: 10000,
    connectionRetryTimeout: 120000,
    connectionRetryCount: 3,
    services: [['appium']],
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
        tagExpression: 'not @Hatali',
        timeout: 120000,
        ignoreUndefinedDefinitions: false
    },

    /**
     * Gets executed once before all workers get launched.
     * @param {Object} config wdio configuration object
     * @param {Array.<Object>} capabilities list of appCapabilities details
     */
    onPrepare: async (config, capabilities) => {
        rimraf("./allure-report", function () {
            console.log("Allure Report Deleted");
        });
        rimraf("./Reports/Allure/allure-results", function () {
            console.log("Allure Json Files deleted");
        });
    },
    /**
     * Gets executed before a worker process is spawned and can be used to initialise specific service
     * for that worker as well as modify runtime environments in an async fashion.
     * @param  {String} cid      capability id (e.g 0-0)
     * @param  {[type]} caps     object containing appCapabilities for session that will be spawn in the worker
     * @param  {[type]} specs    specs to be run in the worker process
     * @param  {[type]} args     object that will be merged with the main configuration once worker is initialised
     * @param  {[type]} execArgv list of string arguments passed to the worker process
     */
    onWorkerStart: async (cid, caps, specs, args, execArgv) => {
    },
    /**
     * Gets executed just before initialising the webdriver session and test framework. It allows you
     * to manipulate configurations depending on the capability or spec.
     * @param {Object} config wdio configuration object
     * @param {Array.<Object>} capabilities list of appCapabilities details
     * @param {Array.<String>} specs List of spec file paths that are to be run
     */
    beforeSession: async (config, capabilities, specs) => {
    },
    /**
     * Gets executed before test execution begins. At this point you can access to all global
     * variables like `browser`. It is the perfect place to define custom commands.
     * @param {Array.<Object>} capabilities list of appCapabilities details
     * @param {Array.<String>} specs        List of spec file paths that are to be run
     * @param {Object}         browser      instance of created browser/device session
     */
    before: async (capabilities, specs) => {
        await require('expect-webdriverio');
        global.wdioExpect = global.expect;
        const chai = await require('chai');
        global.expect = chai.expect;
    },
    /**
     * Runs before a WebdriverIO command gets executed.
     * @param {String} commandName hook command name
     * @param {Array} args arguments that command would receive
     */
    beforeCommand: async (commandName, args) => {
    },
    /**
     * Cucumber Hooks
     *
     * Runs before a Cucumber Feature.
     * @param {String}                   uri      path to feature file
     * @param {GherkinDocument.IFeature} feature  Cucumber feature object
     */
    beforeFeature: async (uri, feature) => {
        await console.log('\u001b[' + 32 + 'm' + 'Feature name : ' + feature.name + '\u001b[0m')
    },
    /**
     *
     * Runs before a Cucumber Scenario.
     * @param {ITestCaseHookParameter} world world object containing information on pickle and test step
     */
    beforeScenario: async (world) => {
        await browser.reset()
        //await driver.launchApp()
        await console.log('\u001b[' + 34 + 'm' + '  Scenario name : ' + world.pickle.name + '\u001b[0m')
    },
    /**
     *
     * Runs before a Cucumber Step.
     * @param {Pickle.IPickleStep} step     step data
     * @param {IPickle}            scenario scenario pickle
     */
    beforeStep: async (step, scenario) => {
        await console.log('\u001b[' + 33 + 'm' + '      Step Start : ' + step.text + '\u001b[0m')
    },
    /**
     *
     * Runs after a Cucumber Step.
     * @param {Pickle.IPickleStep} step     step data
     * @param {IPickle}            scenario scenario pickle
     * @param {Object}             result   results object containing scenario results
     * @param {boolean}            result.passed   true if scenario has passed
     * @param {string}             result.error    error stack if scenario failed
     * @param {number}             result.duration duration of scenario in milliseconds
     */
    afterStep: async (test, scenario, {error, duration, passed}) => {
        if (passed == true) {
            await console.log('\u001b[' + 32 + 'm' + '    ✓ Step Succeed : ' + test.text + '\u001b[0m')
        } else {
            await console.log('\u001b[' + 31 + 'm' + '    ✖ Step Fail : ' + test.text + '\u001b[0m')
            await browser.takeScreenshot();
        }
    },

    /**
     *
     * Runs before a Cucumber Scenario.
     * @param {ITestCaseHookParameter} world  world object containing information on pickle and test step
     * @param {Object}                 result results object containing scenario results
     * @param {boolean}                result.passed   true if scenario has passed
     * @param {string}                 result.error    error stack if scenario failed
     * @param {number}                 result.duration duration of scenario in milliseconds
     */
    afterScenario: async (world, result) => {
    },

    /**
     *
     * Runs after a Cucumber Feature.
     * @param {String}                   uri      path to feature file
     * @param {GherkinDocument.IFeature} feature  Cucumber feature object
     */
    afterFeature: async (uri, feature) => {
    },

    /**
     * Runs after a WebdriverIO command gets executed
     * @param {String} commandName hook command name
     * @param {Array} args arguments that command would receive
     * @param {Number} result 0 - command success, 1 - command error
     * @param {Object} error error object if any
     */
    afterCommand: async (commandName, args, result, error) => {
    },
    /**
     * Gets executed after all tests are done. You still have access to all global variables from
     * the test.
     * @param {Number} result 0 - test pass, 1 - test fail
     * @param {Array.<Object>} capabilities list of appCapabilities details
     * @param {Array.<String>} specs List of spec file paths that ran
     */
    after: async (result, capabilities, specs) => {
    },
    /**
     * Gets executed right after terminating the webdriver session.
     * @param {Object} config wdio configuration object
     * @param {Array.<Object>} capabilities list of appCapabilities details
     * @param {Array.<String>} specs List of spec file paths that ran
     */
    afterSession: async (config, capabilities, specs) => {
    },
    /**
     * Gets executed after all workers got shut down and the process is about to exit. An error
     * thrown in the onComplete hook will result in the test run failing.
     * @param {Object} exitCode 0 - success, 1 - fail
     * @param {Object} config wdio configuration object
     * @param {Array.<Object>} appCapabilities list of appCapabilities details
     * @param {<Object>} results object containing test results
     */

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

    /**
     * Gets executed when a refresh happens.
     * @param {String} oldSessionId session ID of the old session
     * @param {String} newSessionId session ID of the new session
     */
    onReload: async (oldSessionId, newSessionId) => {
    }
}
