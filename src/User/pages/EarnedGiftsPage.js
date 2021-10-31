const ElementHelper = require('../common/ElementHelper')

const txt_EarnedGiftsPageTitle = browser.isAndroid ? `android=new UiSelector().descriptionContains("my-earned-gift-list-page-title")` : `-ios predicate string: name CONTAINS 'my-earned-gift-list-page-title'`
const btn_BackButton = browser.isAndroid ? `android=new UiSelector().descriptionContains("back-button")` : `-ios predicate string: name CONTAINS 'back-button'`
const txt_EmptyMessage = browser.isAndroid ? `android=new UiSelector().descriptionContains("empty-earned-gifts-page-title")` : `-ios predicate string: name CONTAINS 'empty-earned-gifts-page-title'`
const txt_EmptyDescription = browser.isAndroid ? `android=new UiSelector().descriptionContains("empty-earned-gifts-page-text")` : `-ios predicate string: name CONTAINS 'empty-earned-gifts-page-text'`
const btn_HediyeleriKesfet = browser.isAndroid ? `android=new UiSelector().className("android.widget.Button")` : `-ios predicate string: name CONTAINS 'discover-gifts-button'`


class EarnedGiftsPage {
    async checkEarnedGiftsPage() {
        await ElementHelper.elementCheck(txt_EarnedGiftsPageTitle)
    }

    async clickBackButton() {
        await ElementHelper.elementClick(btn_BackButton)
    }

    async checkGiftName(text) {
        await ElementHelper.elementsCheckTextContains(btn_BackButton, text)
    }

    async checkGiftExpiritaionDate(text, text2) {
        await ElementHelper.elementsCheckTextContains(btn_BackButton, text)
    }

    async checkExpirationDate(text) {
        await ElementHelper.elementsCheckTextContains(btn_BackButton, text)
    }

    async checkEmptyMessage(text) {
        await ElementHelper.elementCheckTextContains(txt_EmptyMessage, text)
    }

    async checkEmptyDescription(text) {
        await ElementHelper.elementCheckTextContains(txt_EmptyDescription, text)
    }

    async checkHediyeleriKesfetButton(text) {
        await ElementHelper.elementCheckTextContains(btn_HediyeleriKesfet, text)
    }

    async clickHediyeleriKesfetButton() {
        await ElementHelper.elementClick(btn_HediyeleriKesfet)
    }
}

module.exports = new EarnedGiftsPage();
