const ElementHelper = require('../../utils/elementHelper')

const txt_EnrollmentPageTitle = browser.isAndroid ? `android=new UiSelector().textContains("enrollment-form-page-title")` : ``
const btn_BackButton = browser.isAndroid ? `android=new UiSelector().textContains("faq-page-back-button")` : ``


class FaqPage {
    async checkEnrollmentPageTitle() {
        await ElementHelper.elementCheck(txt_EnrollmentPageTitle)
    }

    async clickBackButton() {
        await ElementHelper.elementClick(btn_BackButton)
    }

}

module.exports = new FaqPage();
