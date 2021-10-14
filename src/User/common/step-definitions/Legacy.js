const {Given, When, Then} = require('@wdio/cucumber-framework');
const Legacy = require('../pages/Legacy')
const ElementHelper = require('../ElementHelper')

Given(/^Nisa waits for Welcome page$/, async () => {
    await Legacy.checkLogo()
});
Given(/^Nisa changes the Country to "([^"]*)" from the Shipping Country picker in Welcome page$/, async (country) => {
    await Legacy.chooseCountry(country)
    await Legacy.checkLogo()
});
Given(/^Nisa changes the Language to "([^"]*)" from the Language picker in Welcome page$/, async (language) => {
    await Legacy.chooseLanguage(language)
    await Legacy.checkLogo()
});
Given(/^Nisa taps on the Start Shopping button in Welcome page$/, async () => {
    await Legacy.clickContinueShopping()
});
Given(/^Nisa waits for Home page$/, async () => {
    await Legacy.checkNavigation()
});
Given(/^Nisa taps on the My Account button in bottom menu bar$/, async () => {
    await Legacy.clickMyAccount()
    await Legacy.checkMyAccountPage()
});
Given(/^Nisa login with email: "([^"]*)" and password: "([^"]*)"$/, async (email, password) => {
    if (email != null) {
        await Legacy.clickLoginButton()
        await Legacy.checkLoginPage()
        await Legacy.clickEmailTab()
        await Legacy.checkEmailTabOpen()
        await Legacy.setTextEmail(email)
        await Legacy.setTextPassword(password)
        await Legacy.clickGirisYapButton()
        await Legacy.checkUserLogin()
    }
});
Given(/^Nisa taps to My Modanisa section$/, async () => {
    await Legacy.clickMyModanisa()
});
Then(/^Nisa should see My Account page$/, async () => {
    await Legacy.checkMyAccountPage()
});
Then(/^Nisa should see Login Page$/, async () => {
    await Legacy.checkLoginPage()
});
Given(/^Nisa login with facebook email: "([^"]*)" and password: "([^"]*)"$/, async (email, password) => {
    await Legacy.clickLoginButton()
    await Legacy.checkLoginPage()
    await Legacy.clickFacebookLogin()
    await Legacy.checkFacebookLoginPage()
    let durum = await Legacy.checkFacebookTextbox()
    if (durum == true) {
        await Legacy.setFacebookEmail(email)
        await Legacy.setFacebookPassword(password)
        await Legacy.clickFacebookGirisYap()
    }
    await Legacy.clickFacebookGirisYapDevam()
    await Legacy.checkUserLogin()
});
Then(/^Nisa should go to notification settings page$/, async () => {
    await Legacy.clickUserInfoLayout()
    await Legacy.clickNotificationPreferences()
});
Then(/^Nisa should seen "([^"]*)" section as "([^"]*)"$/, async (text, bool) => {
    switch (text) {
        case "SMS ile haberdar Olmak İstiyorum":
            await Legacy.checkNotificationSmsSwitch(bool)
            break;
        case "E-mail ile haberdar Olmak İstiyorum":
            await Legacy.checkNotificationEmailSwitch(bool)
            break;
        case "Telefon ile haberdar Olmak İstiyorum":
            await Legacy.checkNotificationTelefonSwitch(bool)
            break;
        default:
            await ElementHelper.writeConsoleFail(text + " adında bir tab yok")
            expect(true).to.equal(false)
    }
});
Then(/^Nisa should see visible Section My Modanisa in My Account Page$/, async () => {
    await Legacy.checkVisibleMyModanisa()
});
Then(/^Nisa should see invisible Section My Modanisa in My Account Page$/, async () => {
    await Legacy.checkInVisibleMyModanisa()
});
When(/^Nisa click Phone back button$/, async () => {
    await Legacy.clickPhoneBackButton()
});
Given(/^Nisa sendKey private api "([^"]*)" and restart app$/, async (text) => {
    let privateApiText = await Legacy.checkPrivateApiText()
    if (privateApiText.includes("customer-legacy")) {
        console.info("Api Ayarlı")
    } else {
        await Legacy.clickPrivateApiButton(text)
        await Legacy.sendKeyPrivateApi(text)
        await Legacy.clickDoneButton()
        await Legacy.checkMyAccountPage()
        let appId = await driver.getCurrentPackage()
        await driver.terminateApp(appId)
        await driver.activateApp(appId)
        await driver.pause("3000")
    }
});