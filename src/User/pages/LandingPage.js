const ElementHelper = require('../common/ElementHelper')

const txt_LandingPageTitle = browser.isAndroid ? `android=new UiSelector().descriptionContains("page-title")` : `-ios predicate string: name CONTAINS 'page-title'`
const btn_BackButton = browser.isAndroid ? `android=new UiSelector().descriptionContains("back-button")` : `-ios predicate string: name CONTAINS 'back-button'`
const txt_LandingPageDescription = browser.isAndroid ? `android=new UiSelector().descriptionContains("My Modanisa ayrıcalıklar dünyası bu kapının arkasında")` : `-ios predicate string: name CONTAINS 'My Modanisa ayrıcalıklar dünyası bu kapının arkasında'`
const btn_LandingButton = browser.isAndroid ? `android=new UiSelector().className("android.widget.Button")` : `-ios predicate string: name CONTAINS 'enroll-button'`
const area_TabBars = browser.isAndroid ? `android=new UiSelector().descriptionContains("tab-bar")` : `-ios predicate string: name CONTAINS 'tab-bar'`
const btn_TabBar = browser.isAndroid ? `android=new UiSelector().className("android.view.View")` : `-ios predicate string: name CONTAINS 'tab-bar'`
const txt_TabCard = browser.isAndroid ? `android=new UiSelector().descriptionContains("tab-view-card")` : `-ios predicate string: name CONTAINS 'tab-view-card'`
const txt_FaqArea = browser.isAndroid ? `android=new UiSelector().descriptionContains("faq-container")` : `-ios predicate string: name CONTAINS 'faq-container'`
const txt_FaqName = browser.isAndroid ? `android=new UiSelector().descriptionContains("faq-container-element")` : `-ios predicate string: name CONTAINS 'faq-container-element'`
const txt_AllFaq = browser.isAndroid ? `android=new UiSelector().descriptionContains("faq-container-all-questions")` : `-ios predicate string: name CONTAINS 'faq-container-all-questions'`
const txt_PopupMessage = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/content")` : `-ios predicate string: name CONTAINS 'cl_alert_dialog_message'`
const btn_PopupClose = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/close_button")` : `-ios predicate string: name CONTAINS 'cl_alert_dialog_close_button'`


class LandingPage {
    async checkLandingPageTitle() {
        await ElementHelper.elementCheck(txt_LandingPageTitle)
    }

    async clickBackButton() {
        await ElementHelper.elementClick(btn_BackButton)
    }

    async checkLandingPageDescription(text) {
        await ElementHelper.elementCheckTextContains(txt_LandingPageDescription, text)
    }

    async checkButtonName(text) {
        await ElementHelper.elementCheckTextContains(btn_LandingButton, text)
    }

    async clickButton(text) {
        await ElementHelper.elementCheckTextContains(btn_LandingButton, text)
        await ElementHelper.elementClick(btn_LandingButton, text)
    }

    async checkTabName(text) {
        await ElementHelper.elementsCheckUnderElementWithText(area_TabBars, btn_TabBar, text)
    }

    async clickTabName(text) {
        await ElementHelper.elementsClickUnderElementWithText(area_TabBars, btn_TabBar, text)
    }

    async checkTabCardName(text) {
        await driver.pause(5000)
        await ElementHelper.elementCheckTextContains(txt_TabCard, text)
    }

    async checkFaqAreaName(text) {
        await ElementHelper.elementCheckTextContains(txt_FaqArea, text)
    }

    async checkFaqName(text) {
        await ElementHelper.elementsCheckTextContains(txt_FaqName, text)
    }

    async clickFaqName(text) {
        await ElementHelper.elementsClickTextContains(txt_FaqName, text)
    }

    async clickAllFaq() {
        await ElementHelper.elementClick(txt_AllFaq)
    }

    async checkAllFaqName(text) {
        await ElementHelper.elementCheckTextContains(txt_AllFaq, text)
    }

    async checkPopupMessage(text) {
        await ElementHelper.elementCheckTextContainss(txt_PopupMessage, text)
    }

    async clickPopupButton() {
        await ElementHelper.elementClick(btn_PopupClose)
    }
}

module.exports = new LandingPage();
