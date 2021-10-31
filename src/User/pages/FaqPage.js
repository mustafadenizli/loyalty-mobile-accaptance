const ElementHelper = require('../common/ElementHelper')

const txt_FaqPageTitle = browser.isAndroid ? `android=new UiSelector().descriptionContains("dashboard-faq-page-title")` : `-ios predicate string: name CONTAINS 'dashboard-faq-page-title'`
const btn_BackButton = browser.isAndroid ? `android=new UiSelector().descriptionContains("faq-page-back-button")` : `-ios predicate string: name CONTAINS 'faq-page-back-button'`
const txt_ModalTitle = browser.isAndroid ? `android=new UiSelector().descriptionContains("faq-page-title-of-question-in-modal")` : `-ios predicate string: name CONTAINS '-page-title-of-question-in-modal'`
const txt_ModalDescription = browser.isAndroid ? `android=new UiSelector().descriptionContains("faq-page-description-of-question-in-modal")` : `-ios predicate string: name CONTAINS 'faq-page-description-of-question-in-modal'`
const btn_FaqCloseButton = browser.isAndroid ? `android=new UiSelector().descriptionContains("faq-page-close-button-in-modal")` : `-ios predicate string: name CONTAINS 'faq-page-close-button-in-modal'`
const txt_FaqName = browser.isAndroid ? `android=new UiSelector().descriptionContains("faq-page-question-element")` : `-ios predicate string: name CONTAINS 'faq-page-question-element'`

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

    async clickFaqName(text) {
        await ElementHelper.elementsClickTextContains(txt_FaqName, text)
    }
}

module.exports = new FaqPage();
