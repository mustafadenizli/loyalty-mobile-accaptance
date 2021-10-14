const ElementHelper = require('../common/ElementHelper')

const txt_RewardsPageTitle = browser.isAndroid ? `android=new UiSelector().text("Hediye Seçimi")` : ``
const btn_BackButton = browser.isAndroid ? `android=new UiSelector().textContains("back-button")` : ``
const txt_ConfirmedPoints = browser.isAndroid ? `android=new UiSelector().textContains("confirmed-points")` : ``
const txt_ExpireDate = browser.isAndroid ? `android=new UiSelector().textContains("point-expiration-date")` : ``
const area_Gifts = browser.isAndroid ? `android=new UiSelector().textContains("reward-group")` : ``


class RewardsPage {
    async checkRewardsPage() {
        await ElementHelper.elementCheck(txt_RewardsPageTitle)
    }

    async clickBackButton() {
        await ElementHelper.elementClick(btn_BackButton)
    }

    async checkConfirmedPoint(text) {
        await ElementHelper.elementsCheckTextContains(txt_ConfirmedPoints, text)
    }

    async checkGiftsSorted() {
        let elems = await $$(area_Gifts)
        let elements = elems.map(async (el) => {
            let txt = await el.getText()
            return txt
        })
        const isSorted = arr => arr.every((v, i, a) => !i || a[i - 1] <= v);
        await expect(true).toEqual(await isSorted(elements))
    }

    async checkHediyeyiAlOrPuanKazan(text, text2) {
        const confirmedPointText = await ElementHelper.getText(txt_ConfirmedPoints)
        let replaceConfirmedText = confirmedPointText.toString().replace("confirmed-points ", "")
        let confirmedPoint = replaceConfirmedText.toString().replace("puan ", "")
        let elems = await $$(area_Gifts)
        let elements = elems.map(async (el) => {
            let rewardItemText = await el.getText()
            let rewardItemPoint = rewardItemText.toString().replace("reward-group-", "")
            if (rewardItemPoint <= confirmedPoint) {
                return true
            } else {
                return false
            }
        })
        let count = 0;
        for (const elemsKey in elements) {
            if (elemsKey == true) {
                let buttonNameElement = elems[count].$('..//android.view.View[text()="' + text + '""]')
                await expect(buttonNameElement.getSize()).toEqual(1)
            } else {
                await expect(buttonNameElement.getSize()).toEqual(0)
            }
        }
    }

    async checkExpireDate(text) {
        await ElementHelper.elementCheckTextContains(txt_ExpireDate, text)
    }


}

module.exports = new RewardsPage();
