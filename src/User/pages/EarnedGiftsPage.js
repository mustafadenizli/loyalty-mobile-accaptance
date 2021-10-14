const ElementHelper = require('../common/ElementHelper')

const txt_EarnedGiftsPageTitle = browser.isAndroid ? `android=new UiSelector().text("Hediye Seçimi")` : ``
const btn_BackButton = browser.isAndroid ? `android=new UiSelector().textContains("back-button")` : ``


class EarnedGiftsPage {
    async checkRewardsPage() {
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
}

module.exports = new EarnedGiftsPage();
