const {Given, When, Then} = require('@wdio/cucumber-framework');

const Common = require('../pages/Common')
const ElementHelper = require("../../utils/elementHelper");
const Mdns = require("../../utils/mdns");

Given(/^Nisa waits for Welcome page$/, async () => {
    await Common.checkLogo()
});

Given(/^Nisa changes the Country to "([^"]*)" from the Shipping Country picker in Welcome page$/, async (country) => {
    await Common.chooseCountry(country)
    await Common.checkLogo()
});

Given(/^Nisa changes the Language to "([^"]*)" from the Language picker in Welcome page$/, async (language) => {
    await Common.chooseLanguage(language)
    await Common.checkLogo()
});

Given(/^Nisa taps on the Start Shopping button in Welcome page$/, async () => {
    await Common.clickContinueShopping()
});

Given(/^Nisa waits for Home page$/, async () => {
    await Common.checkNavigation()
});

Given(/^Nisa taps on the My Account button in bottom menu bar$/, async () => {
    await Common.clickMyAccount()
    await Common.checkMyAccountPage()
});

Given(/^Nisa login with email: "([^"]*)" and password: "([^"]*)"$/, async (email, password) => {
    await Common.clickLoginButton()
    await Common.checkLoginPage()
    await Common.clickEmailTab()
    await Common.checkEmailTabOpen()
    await Common.setTextEmail(email)
    await Common.setTextPassword(password)
    await Common.clickGirisYapButton()
    await Common.checkUserLogin()
});

Given(/^Nisa taps to MyModanisa section$/, async () => {
    await Common.clickMyModanisa()
});


Then(/^Nisa should see My Account page$/, async () => {
    await Common.checkMyAccountPage()
});

Then(/^Nisa should see Login Page$/, async () => {
    await Common.checkLoginPage()
});


Given(/^Nisa login with facebook email: "([^"]*)" and password: "([^"]*)"$/, async (email, password) => {
    await Common.clickLoginButton()
    await Common.checkLoginPage()
    await Common.clickFacebookLogin()
    await Common.checkFacebookLoginPage()
    await Common.clickFacebookGirisYapDevam()
    /*
        await Common.checkFacebookLoginPage()
        await Common.setFacebookEmail(email)
        await Common.setFacebookPassword(password)
        await Common.clickFacebookGirisYap()
        await Common.clickFacebookGirisYapDevam()

     */

    await Common.checkUserLogin()
});

Then(/^Nisa should go to notification settings page$/, async () => {
    await Common.clickUserInfoLayout()
    await Common.clickNotificationPreferences()
});

Then(/^Nisa should seen "([^"]*)" section as "([^"]*)"$/, async (text, bool) => {
    switch (text) {
        case "SMS ile haberdar Olmak İstiyorum":
            await Common.checkNotificationSmsSwitch(bool)
            break;
        case "E-mail ile haberdar Olmak İstiyorum":
            await Common.checkNotificationEmailSwitch(bool)
            break;
        case "Telefon ile haberdar Olmak İstiyorum":
            await Common.checkNotificationTelefonSwitch(bool)
            break;
        default:
            ElementHelper.writeConsoleFail(tab + " adında bir tab yok")
            expect(true).to.equal(false)
    }
});
Given(/^Nisa is not allow any notification permission with customerId: "([^"]*)"$/, async (customerId) => {
    let token = await Mdns.getAccessToken()
    await Mdns.resetNotificationPreferences(token, customerId)

});
Then(/^Nisa should see Page Title Text "([^"]*)"$/, async (text) => {
    await Common.checkPageTitle(text)
});