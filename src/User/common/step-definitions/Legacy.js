const {Given, When, Then, Before} = require('@wdio/cucumber-framework');
const Legacy = require('../pages/Legacy')
const ElementHelper = require('../ElementHelper')
const expect = require("chai").expect;

Given(/^Nisa waits for Welcome page$/, async () => {
    await Legacy.checkLogo()
});
Given(/^Nisa changes the Country to "([^"]*)" from the Shipping Country picker in Welcome page$/, async (country) => {
    if (browser.isAndroid) {
        switch (country) {
            case "Turkey":
                await Legacy.chooseCountry("Turkey")
                await Legacy.checkCountry("Turkey")
                break;
            case "United Kingdom":
                await Legacy.chooseCountry("United Kingdom")
                await Legacy.checkCountry("United Kingdom")
                break;
            default:
                await Legacy.chooseCountry(country)
                await Legacy.checkCountry(country)
                break;
        }
    } else {
        await Legacy.chooseCountry(country)
        await Legacy.checkCountry(country)
    }

});
Given(/^Nisa changes the Language to "([^"]*)" from the Language picker in Welcome page$/, async (language) => {
    await Legacy.chooseLanguage(language)
    await Legacy.checkLanguage(language)
});
Given(/^Nisa taps on the Start Shopping button in Welcome page$/, async () => {
    await Legacy.clickContinueShopping()
});
Given(/^Nisa waits for Home page$/, async () => {
    await Legacy.checkHomePage()
});
Given(/^Nisa taps on the My Account button in bottom menu bar$/, async () => {
    await Legacy.clickMyAccount()
    await Legacy.checkMyAccountPage()
});
Given(/^Nisa login with user:"([^"]*)" email: "([^"]*)" and password: "([^"]*)"$/, async (user, email, password) => {
    switch (user) {
        case "normal":
            await Legacy.clickLoginButton()
            await Legacy.checkLoginPage()
            await Legacy.clickEmailTab()
            await Legacy.checkEmailTabOpen()
            await Legacy.setTextEmail(email)
            await Legacy.setTextPassword(password)
            await Legacy.clickGirisYapButton()
            await Legacy.checkUserLogin()
            break;
        case "facebook":
            await Legacy.clickLoginButton()
            await Legacy.checkLoginPage()
            await Legacy.clickFacebookLogin()
            if (browser.isIOS) {
                await Legacy.clickContinueIOS()
            }
            let durum = await Legacy.checkFacebookTextbox()
            if (durum == true) {
                await Legacy.webVieweGecis()
                await Legacy.setFacebookEmail(email)
                await Legacy.setFacebookPassword(password)
                await Legacy.clickFacebookGirisYap()
                await Legacy.webVieweCikis()

            }
            let durum2 = await Legacy.checkDevamTextbox()
            if (durum2 == true) {
                await Legacy.clickFacebookGirisYapDevam()
            }
            await Legacy.checkUserLogin()
            break;
        case "apple":
            console.log("apple şuan yok")
            break;
        default:
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
            expect(true).equal(false)
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
    if (browser.isAndroid) {
        let privateApiText = await Legacy.checkPrivateApiText()
        if (privateApiText.includes("customer-legacy")) {
        } else {
            let appId = await driver.waitUntil(
                function () {
                    return driver.getCurrentPackage()
                }
            )
            await Legacy.clickPrivateApiButton(text)
            await Legacy.sendKeyPrivateApi(text)
            await Legacy.clickDoneButton()
            await Legacy.checkMyAccountPage()
            await driver.terminateApp(appId)
            await driver.activateApp(appId)
            await driver.pause(3000)
        }
    } else {
        await Legacy.clickPrivateApiButton(text)
        await Legacy.sendKeyPrivateApi("https://" + text)
        await Legacy.clickDoneButton()
        await Legacy.checkMyAccountPage()
        await driver.pause(3000)
    }
});


Given(/^Deneme Given$/, async () => {
    await browser.pause(2000)
});
When(/^Deneme When$/, async () => {
    await browser.pause(2000)
});
Then(/^Deneme Then$/, async () => {
    await browser.pause(2000)
});
When(/^Deneme When Basarısız$/, async () => {
    await browser.pause(1000)
    await expect(true).equals(false)
});