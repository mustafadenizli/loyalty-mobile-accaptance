const ElementHelper = require('../common/ElementHelper')

const txt_EnrollmentPageTitle = browser.isAndroid ? `android=new UiSelector().descriptionContains("enrollment-form-page-title")` : `-ios predicate string: name CONTAINS 'enrollment-form-page-title'`
const btn_BackButton = browser.isAndroid ? `android=new UiSelector().descriptionContains("back-button")` : `-ios predicate string: name CONTAINS 'enrollment-form-back-button'`
const txt_PopupMessage = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/content")` : `-ios predicate string: name == 'content'`
const txt_EnrollButton = browser.isAndroid ? `android=new UiSelector().descriptionContains("Kayıt Ol")` : `-ios predicate string: name CONTAINS 'Kayıt Ol'`
const btn_EmailCheckbox = browser.isAndroid ? `android=new UiSelector().className("android.widget.CheckBox")` : `-ios predicate string: name CONTAINS 'enrollment-form-page-email-consention-checkbox'`
const btn_Buttons = browser.isAndroid ? `android=new UiSelector().className("android.widget.Button")` : `-ios predicate string: type == 'XCUIElementTypeLink'`
const txt_PageTermsTitle = browser.isAndroid ? `android=new UiSelector().descriptionContains("enrollment-form-page-terms-of-use-modal-title")` : `-ios predicate string: name CONTAINS 'enrollment-form-page-terms-of-use-modal-title'`
const btn_PageTermsCloseButton = browser.isAndroid ? `android=new UiSelector().descriptionContains("enrollment-form-page-terms-of-use-modal-close-button")` : `-ios predicate string: name CONTAINS 'enrollment-form-page-terms-of-use-modal-close-button'`
const txt_PrivacyPolicyTitle = browser.isAndroid ? `android=new UiSelector().descriptionContains("enrollment-form-page-privacy-policy-modal-title")` : `-ios predicate string: name CONTAINS 'enrollment-form-page-privacy-policy-modal-title'`
const btn_PrivacyPolicyCloseButton = browser.isAndroid ? `android=new UiSelector().descriptionContains("enrollment-form-page-privacy-policy-modal-close-button")` : `-ios predicate string: name CONTAINS 'enrollment-form-page-privacy-policy-modal-close-button'`
const btn_CompleteButton = browser.isAndroid ? `android=new UiSelector().className("android.widget.Button").descriptionContains("Devam Et")` : `-ios predicate string: name CONTAINS 'go-to-loyalty-dashboard-button'`
const txtBox_Email = browser.isAndroid ? `android=new UiSelector().textContains("enrollment-form-page-email-input")` : `-ios predicate string: name CONTAINS 'enrollment-form-page-email-input'`


class FaqPage {
    async checkEnrollmentPageTitle() {
        await ElementHelper.elementCheck(txt_EnrollmentPageTitle)
    }

    async clickBackButton() {
        await ElementHelper.elementClick(btn_BackButton)
    }

    async checkPopupMessage(text) {
        await ElementHelper.elementCheckTextContains(txt_PopupMessage, text)
    }

    async clickEnrollButton() {
        await ElementHelper.elementClick(txt_EnrollButton)
    }

    async checkEnrollButton(text) {
        await ElementHelper.elementCheckTextContains(txt_EnrollButton, text)
    }

    async clickEmailCheckbox() {
        await ElementHelper.elementClick(btn_EmailCheckbox)
    }

    async clickButton(text) {
        await ElementHelper.elementsClickTextContains(btn_Buttons, text)
    }

    async checkButton(text) {
        await ElementHelper.elementsCheckTextContains(btn_Buttons, text)
    }

    async checkPageTermsTitle(text) {
        await ElementHelper.elementCheckTextContains(txt_PageTermsTitle, text)
    }

    async clickPageTermsClose() {
        await ElementHelper.elementClick(btn_PageTermsCloseButton)
    }

    async checkPrivacyPolicyTitle(text) {
        await ElementHelper.elementCheckTextContains(txt_PrivacyPolicyTitle, text)
    }

    async clickPrivacyPolicyClose() {
        await ElementHelper.elementClick(btn_PrivacyPolicyCloseButton)
    }

    async clickCompleteButton() {
        await ElementHelper.elementClick(btn_CompleteButton)
    }

    async sendKeyEmail(text) {
        await ElementHelper.elementClick(txtBox_Email)
        if (browser.isIOS) {
            $(txtBox_Email).setValue(text)
        } else {
            await ElementHelper.withOutElementSendKey(text)
        }
    }
}

module.exports = new FaqPage();
