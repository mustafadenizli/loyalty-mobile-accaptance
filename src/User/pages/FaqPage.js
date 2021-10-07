const ElementHelper = require('../../utils/elementHelper')

const txt_FaqPageTitle = browser.isAndroid ? `android=new UiSelector().textContains("dashboard-faq-page-title")` : ``
const btn_BackButton = browser.isAndroid ? `android=new UiSelector().textContains("faq-page-back-button")` : ``
const txt_ModalTitle = browser.isAndroid ? `android=new UiSelector().textContains("faq-page-title-of-question-in-modal")` : ``
const txt_ModalDescription = browser.isAndroid ? `android=new UiSelector().textContains("faq-page-description-of-question-in-modal")` : ``
const btn_FaqCloseButton = browser.isAndroid ? `android=new UiSelector().textContains("faq-page-close-button-in-modal")` : ``

class FaqPage {
    async checkFaqPage() {
        await ElementHelper.elementCheck(txt_FaqPageTitle)
    }

    async clickBackButton() {
        await ElementHelper.elementClick(btn_BackButton)
    }

    async checkFaqModalTitle(text) {
        await ElementHelper.elementCheckTextContains(txt_ModalTitle, text)
    }

    async checkFaqModalDescription(text) {
        await ElementHelper.elementCheckTextContains(txt_ModalDescription, text)
    }

    async clickFaqModalCloseButton() {
        await ElementHelper.elementClick(btn_FaqCloseButton)
    }

}

module.exports = new FaqPage();
