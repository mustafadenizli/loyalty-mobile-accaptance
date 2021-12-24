const ElementHelper = require('../ElementHelper')
const {Before} = require("@wdio/cucumber-framework");
const expect = require("chai").expect;
const {flag} = require('country-emoji');


const logo_Modanisa = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/logo")` : `-ios predicate string:name == "welcomeLogo"`
const btn_TeslimatUlkesi = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/welcomeCountryConstraint")` : `-ios predicate string:name == 'textField_country'`
const lbl_TeslimatUlkesi = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/selectedCountryText")` : `//XCUIElementTypeStaticText`
const list_Ulkeler = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/select_dialog_listview")` : `-ios predicate string:type == 'XCUIElementTypePickerWheel'`
const iosDone = `-ios predicate string:label == "OK"`
const btn_Diller = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/welcomeLanguageConstraint")` : `-ios predicate string:name == 'textField_language'`
const lbl_Diller = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/selectedLanguageText")` : `//XCUIElementTypeStaticText`
const list_Diller = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/select_dialog_listview")` : `-ios predicate string:type == 'XCUIElementTypePickerWheel'`
const btn_DevamEt = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/startShopping")` : `-ios predicate string:name == 'button_continue'`
const button_Cancel = browser.isAndroid ? `` : `-ios predicate string:name == 'button_cancel'`
const area_SearchBox = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/searchBox")` : `-ios predicate string:name == 'textField_search'`
const btn_MyAccount = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/tab_myaccount")` : `-ios predicate string:name == 'tabbar_account'`
const txt_Hesabim = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/toolBarTitle")` : `-ios predicate string:type == 'XCUIElementTypeNavigationBar'`
const btn_Login = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/loginOrSignup")` : `-ios predicate string:name == 'button_loginSignup'`
const txt_GirisYap = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/toolBarTitle")` : `-ios predicate string:type == 'XCUIElementTypeNavigationBar'`
const btn_Email = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/emailTabLayout")` : `-ios predicate string:name == 'button_2'`
const btn_EmailOpened = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/email")` : `-ios predicate string:name == 'textField_email'`
const txtbox_Email = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/email").childSelector(new UiSelector().resourceId("com.modanisa.debug:id/textInputEditText"))` : `-ios predicate string:name == 'textField_email'`
const txtbox_Password = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/password").childSelector(new UiSelector().resourceId("com.modanisa.debug:id/textInputEditText"))` : `-ios predicate string:name == 'textField_password'`
const btn_GirisYap = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/login")` : `-ios predicate string:name == 'button_loginSignupContinue'`
const txt_HesapAyarlari = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/userInfoLayout")` : `-ios predicate string:name == 'cell_accountInformation'`
const btn_MyModanisa = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/myModanisaLayout")` : `-ios predicate string:name == 'drawer_my_modanisa'`
const btn_FacebookLogin = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/withFacebook")` : `-ios predicate string:name == 'button_fb'`
const logo_Facebook = browser.isAndroid ? `android=new UiSelector().textContains("Facebook")` : `-ios predicate string:name == 'button_continue'`
const iosContinue = `-ios predicate string:name == 'Continue'`
const txtbox_FacebookEmail = browser.isAndroid ? `android=new UiSelector().resourceId("m_login_email")` : `-ios predicate string:name == 'button_continue'`
const txtbox_FacebookPassword = browser.isAndroid ? `android=new UiSelector().resourceId("m_login_password")` : `-ios predicate string:name == 'button_continue'`
const btn_FacebookGirisYap = browser.isAndroid ? `android=new UiSelector().resourceId("login_password_step_element")` : `-ios predicate string:name == 'button_continue'`
const btn_FacebookGirisYapDevam = browser.isAndroid ? `android=new UiSelector().className("android.widget.Button").textContains("Devam")` : `-ios predicate string:name == 'Devam'`
const btn_UserInfo = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/userInfoLayout")` : `-ios predicate string:name == 'cell_accountInformation'`
const btn_NotificationPreferences = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/notificationsPreferenceText")` : `-ios predicate string:name == 'cell_notificationPreferences'`
const switch_NotificationEmail = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/email")` : `-ios predicate string:name == 'emailPermissionSwitch'`
const switch_NotificationTelefon = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/phone")` : `-ios predicate string:name == 'phonePermissionSwitch'`
const switch_NotificationSms = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/sms")` : `-ios predicate string:name == 'smsPermissionSwitch'`
const txt_PrivateApi = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/hMtext")` : `-ios predicate string:name == 'button_hiddenMenu'`
const textBox_Api = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/apiHost")` : `-ios predicate string:name == 'field_url'`
const btn_Done = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/submit")` : `-ios predicate string:name == 'button_submit'`


class Common {
    async checkLogo() {
        await ElementHelper.checkElementExist(logo_Modanisa)
    }

    async chooseCountry(country) {
        await ElementHelper.elementClick(btn_TeslimatUlkesi)
        await ElementHelper.elementCheck(list_Ulkeler)
        if (browser.isAndroid) {
            await ElementHelper.withOutElementClickTextContains(country)
        } else {
            let pickerOptionListElement = $(list_Ulkeler)
            const countryWithFlag = flag(country) + " " + country
            await pickerOptionListElement.addValue(countryWithFlag);
            await pickerOptionListElement.click();
            await ElementHelper.elementClick(iosDone)
        }
    }

    async checkCountry(country) {
        if (browser.isAndroid) {
            await ElementHelper.findElement(lbl_TeslimatUlkesi)
            let text = await $(lbl_TeslimatUlkesi).getText()
            await expect(text).contain(country)
        } else {
            await ElementHelper.elementsCheckTextContains(lbl_TeslimatUlkesi, country)
        }
    }

    async chooseLanguage(language) {
        await ElementHelper.elementClick(btn_Diller)
        await ElementHelper.elementCheck(list_Diller)
        if (browser.isAndroid) {
            await ElementHelper.withOutElementClickTextContains(language)
        } else {
            let pickerOptionListElement = $(list_Ulkeler)
            await pickerOptionListElement.addValue(language);
            await pickerOptionListElement.click();
            await ElementHelper.elementClick(iosDone)
        }
    }

    async checkLanguage(language) {
        if (browser.isAndroid) {
            await ElementHelper.findElement(lbl_Diller)
            let text = await $(lbl_Diller).getText()
            await expect(text).contain(language)
        } else {
            await ElementHelper.elementsCheckTextContains(lbl_Diller, language)
        }
    }

    async clickContinueShopping() {
        await ElementHelper.elementClick(btn_DevamEt)
    }

    async checkHomePage() {
        try {
            await $(button_Cancel).waitForDisplayed({timeout: 10000})
            await $(button_Cancel).click()
        } catch (e) {

        } finally {
            await ElementHelper.elementCheck(area_SearchBox)
        }
    }

    async clickMyAccount() {
        await ElementHelper.elementClick(btn_MyAccount)
    }

    async checkMyAccountPage() {
        await ElementHelper.elementCheck(txt_Hesabim)
    }

    async clickLoginButton() {
        await ElementHelper.elementClick(btn_Login)
    }

    async checkLoginPage() {
        await ElementHelper.elementCheck(txt_GirisYap)
    }

    async clickEmailTab() {
        await ElementHelper.elementClick(btn_Email)
    }

    async checkEmailTabOpen() {
        await ElementHelper.elementCheck(btn_EmailOpened)
    }

    async setTextEmail(email) {
        await ElementHelper.elementSendKey(txtbox_Email, email)
    }

    async setTextPassword(password) {
        await ElementHelper.elementSendKey(txtbox_Password, password)
    }

    async clickGirisYapButton() {
        await ElementHelper.elementClick(btn_GirisYap)
    }

    async checkUserLogin() {
        try {
            await $(button_Cancel).waitForDisplayed({timeout: 10000})
            await $(button_Cancel).click()
        } catch (e) {

        }
        await ElementHelper.elementCheck(txt_HesapAyarlari)
    }

    async clickMyModanisa() {
        await ElementHelper.elementClick(btn_MyModanisa)
    }

    async clickFacebookLogin() {
        await ElementHelper.elementClick(btn_FacebookLogin)
    }

    async checkFacebookLoginPage() {
        await ElementHelper.elementCheck(logo_Facebook)
    }

    async setFacebookEmail(text) {
        await ElementHelper.elementSendKey(txtbox_FacebookEmail, text)
    }

    async checkFacebookTextbox() {
        try {
            await $(txtbox_FacebookEmail).waitForDisplayed({timeout: 10000})
            if (await $(txtbox_FacebookEmail).isExisting() == true) {
                return true
            } else {
                return false
            }
        } catch (error) {
            return false
        }
    }

    async clickContinueIOS() {
        try {
            await $(iosContinue).waitForDisplayed({timeout: 5000})
            await $(iosContinue).click()
        } catch (error) {
            return false
        }
    }

    async checkDevamTextbox() {
        try {
            await $(btn_FacebookGirisYapDevam).waitForDisplayed({timeout: 10000})
            if (await $(btn_FacebookGirisYapDevam).isExisting() == true) {
                return true
            } else {
                return false
            }
        } catch (error) {
            return false
        }
    }

    async setFacebookPassword(text) {
        await ElementHelper.elementSendKey(txtbox_FacebookPassword, text)
    }

    async clickFacebookGirisYap() {
        await ElementHelper.elementClick(btn_FacebookGirisYap)
    }

    async clickFacebookGirisYapDevam() {
        await ElementHelper.elementClick(btn_FacebookGirisYapDevam)
    }

    async clickUserInfoLayout() {
        await ElementHelper.elementClick(btn_UserInfo)
    }

    async clickNotificationPreferences() {
        await ElementHelper.elementClick(btn_NotificationPreferences)
    }

    async checkNotificationEmailSwitch(text) {
        if (text === true) {
            await ElementHelper.elementCheckTextEquals(switch_NotificationEmail, "AÇ")
        } else if (text === false) {
            await ElementHelper.elementCheckTextEquals(switch_NotificationEmail, "KAPAT")
        } else {
            await ElementHelper.writeConsoleFail("checkNotificationEmailSwitch adımı başarısız")
        }
    }

    async checkNotificationTelefonSwitch(text) {
        if (text === true) {
            await ElementHelper.elementCheckTextEquals(switch_NotificationTelefon, "AÇ")
        } else if (text === false) {
            await ElementHelper.elementCheckTextEquals(switch_NotificationTelefon, "KAPAT")
        } else {
            await ElementHelper.writeConsoleFail("checkNotificationTelefonSwitch adımı başarısız")
            expect(true).equal(false)
        }
    }

    async checkNotificationSmsSwitch(text) {
        if (text === true) {
            await ElementHelper.elementCheckTextEquals(switch_NotificationSms, "AÇ")
        } else if (text === false) {
            await ElementHelper.elementCheckTextEquals(switch_NotificationSms, "KAPAT")
        } else {
            await ElementHelper.writeConsoleFail("checkNotificationSmsSwitch adımı başarısız")
            expect(true).equal(false)
        }
    }

    async checkVisibleMyModanisa() {
        await ElementHelper.elementCheck(btn_MyModanisa)
    }

    async checkInVisibleMyModanisa() {
        await ElementHelper.elementNotCheck(btn_MyModanisa)
    }

    async clickPhoneBackButton() {
        if (browser.isAndroid) {
            await driver.back()
        } else {
            let screen = await browser.getWindowSize()
            let height = await screen.height
            let width = await screen.width
            await browser.pause(2000)
            await browser.touchAction([
                {action: 'longPress', x: 50, y: 400},
                {action: 'wait', options: {ms: 500}},
                {action: 'moveTo', x: 350, y: 400},
                'release'
            ])
        }
        await browser.pause(5000)
    }

    async checkPrivateApiText() {
        return await ElementHelper.getText(txt_PrivateApi)
    }

    async clickPrivateApiButton() {
        return await ElementHelper.elementClick(txt_PrivateApi)
    }

    async sendKeyPrivateApi(text) {
        await ElementHelper.elementSendKey(textBox_Api, text)
    }

    async clickDoneButton() {
        await ElementHelper.elementClick(btn_Done)
    }

    async webVieweGecis() {
        let cont = browser.getContexts()
        for (const s in cont) {
            if (await s.contains("WEBVIEW")) {
                await browser.switchContext(s)
            }
        }
    }

    async webVieweCikis() {
        let cont = browser.getContexts()
        for (const s in cont) {
            if (await s.contains("NATIVE")) {
                await browser.switchContext(s)
            }
        }
    }


}

module.exports = new Common();
