const ElementHelper = require('../common/ElementHelper')
const expect = require("chai").expect;

const txt_RewardsPageTitle = browser.isAndroid ? `android=new UiSelector().descriptionContains("dashboard-rewards-page-title")` : `-ios predicate string: name CONTAINS 'dashboard-rewards-page-title'`
const btn_BackButton = browser.isAndroid ? `android=new UiSelector().descriptionContains("back-button")` : `-ios predicate string: name CONTAINS 'back-button'`
const txt_ConfirmedPoints = browser.isAndroid ? `android=new UiSelector().descriptionContains("confirmed-points")` : `-ios predicate string: name CONTAINS 'confirmed-points'`
const txt_ExpireDate = browser.isAndroid ? `android=new UiSelector().descriptionContains("point-expiration-date")` : `-ios predicate string: name CONTAINS 'point-expiration-date'`
const area_Gifts = browser.isAndroid ? `android=new UiSelector().descriptionContains("reward-group-header")` : `-ios predicate string: name CONTAINS 'reward-group-header'`
const hediyeyiaLPuanKazan = browser.isAndroid ? `//android.view.View[contains(@content-desc, 'Hediyeyi Al')] | //android.view.View[contains(@content-desc, 'Puan Kazan')]` : `-ios predicate string: name == 'Hediyeyi Al' or name == 'Puan Kazan'`


class RewardsPage {
    async checkRewardsPage() {
        await ElementHelper.elementCheck(txt_RewardsPageTitle)
    }

    async clickBackButton() {
        await ElementHelper.elementClick(btn_BackButton)
    }

    async checkConfirmedPoint(text) {
        await ElementHelper.elementCheckTextContains(txt_ConfirmedPoints, text)
    }

    async checkGiftsSorted() {
        let arr1 = [];
        await $(area_Gifts).waitForDisplayed({timeoutMsg: "Element bulunamadı"})
        let elems = await $$(area_Gifts)
        for (const el of elems) {
            let text = await el.getAttribute("content-desc")
            text = text.replace(/\s+/g, '');
            let result = await text.replace("reward-group-header-", "")
            arr1.push(parseInt(result))
        }
        const isSorted = arr => arr.every((v, i, a) => !i || a[i - 1] <= v);
        await expect(true).equal(await isSorted(arr1))
    }

    async checkHediyeyiAl(text) {
        let confirmedPointText = await ElementHelper.getAttribute(txt_ConfirmedPoints, "content-desc")
        confirmedPointText = confirmedPointText.replace(/\s+/g, '');
        let replaceConfirmedText = confirmedPointText.replace("confirmed-points", "")
        let confirmedPoint = replaceConfirmedText.replace("puan", "")
        let arr1 = [];
        await $(area_Gifts).waitForDisplayed({timeoutMsg: "Element bulunamadı"})
        let elems = await $$(area_Gifts)
        for (const el of elems) {
            let text = await el.getAttribute("content-desc")
            text = text.replace(/\s+/g, '');
            let result = await text.replace("reward-group-header-", "")
            arr1.push(parseInt(result))
        }
        await arr1.pop()
        for (const elemsKey in arr1) {
            if (parseInt(arr1[elemsKey]) <= parseInt(confirmedPoint)) {
                let text1 = await $$(hediyeyiaLPuanKazan)[elemsKey].getAttribute("content-desc")
                console.info(text1)
                await expect(text1).equal(text)
            }
        }
    }

    async checkPuanKazan(text) {
        let confirmedPointText = await ElementHelper.getAttribute(txt_ConfirmedPoints, "content-desc")
        confirmedPointText = confirmedPointText.replace(/\s+/g, '');
        let replaceConfirmedText = confirmedPointText.replace("confirmed-points", "")
        let confirmedPoint = replaceConfirmedText.replace("puan", "")
        let arr1 = [];
        await $(area_Gifts).waitForDisplayed({timeoutMsg: "Element bulunamadı"})
        let elems = await $$(area_Gifts)
        for (const el of elems) {
            let text = await el.getAttribute("content-desc")
            text = text.replace(/\s+/g, '');
            let result = await text.replace("reward-group-header-", "")
            arr1.push(parseInt(result))
        }
        await arr1.pop()
        for (const elemsKey in arr1) {
            if (parseInt(arr1[elemsKey]) > parseInt(confirmedPoint)) {
                let text1 = await $$(hediyeyiaLPuanKazan)[elemsKey].getAttribute("content-desc")
                console.info(text1)
                await expect(text1).equal(text)

            }
        }
    }

    async checkExpireDate(text) {
        await ElementHelper.elementCheckTextContains(txt_ExpireDate, text)
    }


}

module.exports = new RewardsPage();
