const ElementHelper = require('../../utils/elementHelper')

const txt_LandingPageTitle = browser.isAndroid ? `android=new UiSelector().textContains("page-title")` : ``
const btn_BackButton = browser.isAndroid ? `android=new UiSelector().textContains("back-button")` : ``
const txt_LandingPageDescription = browser.isAndroid ? `android=new UiSelector().textContains("My Modanisa ayrıcalıklar dünyası bu kapının arkasında")` : ``
const btn_LandingButton = browser.isAndroid ? `android=new UiSelector().className("android.widget.Button")` : ``
const area_TabBars = browser.isAndroid ? `android=new UiSelector().text("tab-bar")` : ``
const btn_TabBar = browser.isAndroid ? `android=new UiSelector().className("android.view.View")` : ``
const txt_TabCard = browser.isAndroid ? `android=new UiSelector().textContains("tab-view-card")` : ``
const txt_FaqArea = browser.isAndroid ? `android=new UiSelector().textContains("faq-container")` : ``
const txt_FaqName = browser.isAndroid ? `android=new UiSelector().textContains("faq-container-element")` : ``
const txt_AllFaq = browser.isAndroid ? `android=new UiSelector().textContains("faq-container-all-questions")` : ``
const txt_PopupMessage = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/content")` : ``
const btn_PopupClose = browser.isAndroid ? `android=new UiSelector().resourceId("com.modanisa.debug:id/close_button")` : ``



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
        await ElementHelper.elementCheckTextContains(btn_LandingButton,text)
        await ElementHelper.elementClick(btn_LandingButton, text)
    }

    async checkTabName(text) {
        await ElementHelper.elementsCheckUnderElementWithText(area_TabBars, btn_TabBar, text)
    }

    async clickTabName(text) {
        await ElementHelper.elementsClickUnderElementWithText(area_TabBars, btn_TabBar, text)
    }

    async checkTabCardName(text) {
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
        await ElementHelper.elementCheckTextContains(txt_PopupMessage,text)
    }

    async clickPopupButton() {
        await ElementHelper.elementClick(btn_PopupClose)
    }
}

module.exports = new LandingPage();
