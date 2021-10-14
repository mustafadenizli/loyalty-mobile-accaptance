const ElementHelper = require('../ElementHelper')

const logo_Modanisa = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/logo")` : `-ios predicate string: name == 'welcomeLogo'`
const btn_TeslimatUlkesi = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/welcomeCountryConstraint")` : `-ios predicate string: name == 'textField_country'`
const list_Ulkeler = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/select_dialog_listview")` : `-ios predicate string: label == 'Shipping Country'`
const btn_Diller = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/welcomeLanguageConstraint")` : `-ios predicate string: name == 'textField_language'`
const list_Diller = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/select_dialog_listview")` : `-ios predicate string: name == 'picker_language'`
const btn_DevamEt = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/startShopping")` : `-ios predicate string: name == 'button_continue'`
const bottomNavigation = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/bottom_navigation")` : `-ios predicate string: name == 'button_continue'`
const btn_MyAccount = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/tab_myaccount")` : `-ios predicate string: name == 'button_continue'`
const txt_Hesabim = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/toolBarTitle")` : `-ios predicate string: name == 'button_continue'`
const btn_Login = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/loginOrSignup")` : `-ios predicate string: name == 'button_continue'`
const txt_GirisYap = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/toolBarTitle")` : `-ios predicate string: name == 'button_continue'`
const btn_Email = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/emailTabLayout")` : `-ios predicate string: name == 'button_continue'`
const btn_EmailOpened = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/email")` : `-ios predicate string: name == 'button_continue'`
const txtbox_Email = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/email").childSelector(new UiSelector().resourceId("com.modanisa.debug:id/textInputEditText"))` : `-ios predicate string: name == 'button_continue'`
const txtbox_Password = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/password").childSelector(new UiSelector().resourceId("com.modanisa.debug:id/textInputEditText"))` : `-ios predicate string: name == 'button_continue'`
const btn_GirisYap = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/login")` : `-ios predicate string: name == 'button_continue'`
const txt_HesapAyarlari = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/userInfoLayout")` : `-ios predicate string: name == 'button_continue'`
const btn_MyModanisa = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/myModanisaLayout")` : `-ios predicate string: name == 'button_continue'`
const btn_FacebookLogin = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/withFacebook")` : `-ios predicate string: name == 'button_continue'`
const logo_Facebook = browser.isAndroid ? `android=new UiSelector().textContains("Facebook")` : `-ios predicate string: name == 'button_continue'`
const txtbox_FacebookEmail = browser.isAndroid ? `android=new UiSelector().resourceId("m_login_email")` : `-ios predicate string: name == 'button_continue'`
const txtbox_FacebookPassword = browser.isAndroid ? `android=new UiSelector().resourceId("m_login_password")` : `-ios predicate string: name == 'button_continue'`
const btn_FacebookGirisYap = browser.isAndroid ? `android=new UiSelector().resourceId("login_password_step_element")` : `-ios predicate string: name == 'button_continue'`
const btn_FacebookGirisYapDevam = browser.isAndroid ? `android=new UiSelector().className("android.widget.Button").textContains("Devam")` : `-ios predicate string: name == 'button_continue'`
const btn_UserInfo = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/userInfoLayout")` : `-ios predicate string: name == 'button_continue'`
const btn_NotificationPreferences = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/notificationsPreferenceText")` : `-ios predicate string: name == 'button_continue'`
const switch_NotificationEmail = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/email")` : `-ios predicate string: name == 'button_continue'`
const switch_NotificationTelefon = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/phone")` : `-ios predicate string: name == 'button_continue'`
const switch_NotificationSms = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/sms")` : `-ios predicate string: name == 'button_continue'`
const txt_PrivateApi = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/hMtext")` : `-ios predicate string: name == 'button_continue'`
const textBox_Api = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/apiHost")` : `-ios predicate string: name == 'button_continue'`
const btn_Done = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/submit")` : `-ios predicate string: name == 'button_continue'`


class Common {

    async checkLogo() {
        await ElementHelper.elementCheck(logo_Modanisa)
    }

    async chooseCountry(country) {
        await ElementHelper.elementClick(btn_TeslimatUlkesi)
        await ElementHelper.elementCheck(list_Ulkeler)
        await ElementHelper.withOutElementClickTextEquals(country)
    }

    async chooseLanguage(language) {
        await ElementHelper.elementClick(btn_Diller)
        await ElementHelper.elementCheck(list_Diller)
        await ElementHelper.withOutElementClickTextContains(language)
    }

    async clickContinueShopping() {
        await ElementHelper.elementClick(btn_DevamEt)
    }

    async checkNavigation() {
        await ElementHelper.elementCheck(bottomNavigation)
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
            await $(txtbox_FacebookEmail).waitForDisplayed({timeout: 2000})
            if (await $(txtbox_FacebookEmail).isExisting() == true) {
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
        console.info(text)
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
            expect(true).to.equal(false)
        }
    }

    async checkNotificationSmsSwitch(text) {
        if (text === true) {
            await ElementHelper.elementCheckTextEquals(switch_NotificationSms, "AÇ")
        } else if (text === false) {
            await ElementHelper.elementCheckTextEquals(switch_NotificationSms, "KAPAT")
        } else {
            await ElementHelper.writeConsoleFail("checkNotificationSmsSwitch adımı başarısız")
            expect(true).to.equal(false)
        }
    }

    async checkVisibleMyModanisa() {
        await ElementHelper.elementCheck(btn_MyModanisa)
    }

    async checkInVisibleMyModanisa() {
        await ElementHelper.elementNotCheck(btn_MyModanisa)
    }

    async clickPhoneBackButton() {
        await driver.back()
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

}

module.exports = new Common();
