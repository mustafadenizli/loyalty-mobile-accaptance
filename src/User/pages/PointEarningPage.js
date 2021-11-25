const ElementHelper = require('../common/ElementHelper')
const expect = require("chai").expect;

const txt_PointEarningPageTitle = browser.isAndroid ? `android=new UiSelector().descriptionContains("page-title")` : `-ios predicate string: name CONTAINS 'page-title'`
const btn_BackButton = browser.isAndroid ? `android=new UiSelector().descriptionContains("back-button")` : `-ios predicate string: name CONTAINS 'back-button'`
const area_Challenges = browser.isAndroid ? `android=new UiSelector().descriptionContains("challenge-item")` : `-ios predicate string: name CONTAINS 'challenge-item'`
const txt_BottomChallengesPoint = browser.isAndroid ? `android=new UiSelector().descriptionContains("challenge-item-points")` : `-ios predicate string: name CONTAINS 'challenge-item-points'`
const txt_ChallengeTitle = browser.isAndroid ? `android=new UiSelector().descriptionContains("challenge-item-title")` : `-ios predicate string: name CONTAINS 'challenge-item-title'`
const txt_ChallengeDescription = browser.isAndroid ? `android=new UiSelector().descriptionContains("challenge-item-description")` : `-ios predicate string: name CONTAINS 'challenge-item-description'`
const txt_ChallengePoint = browser.isAndroid ? `android=new UiSelector().descriptionContains("challenge-item-points")` : `-ios predicate string: name CONTAINS 'challenge-item-points'`
const btn_PointHistory = browser.isAndroid ? `android=new UiSelector().descriptionContains("my-points-history-section")` : `-ios predicate string: name CONTAINS 'my-points-history-section'`


class PointEarningPage {
    async checkPointEarningPage() {
        await ElementHelper.elementCheck(txt_PointEarningPageTitle)
    }

    async clickBackButton() {
        await ElementHelper.elementClick(btn_BackButton)
    }

    async checkChallenges() {
        await ElementHelper.elementCheck(area_Challenges)
    }


    async checkChallengesSorted() {
        let arr1 = [];
        await $(txt_BottomChallengesPoint).waitForDisplayed({timeoutMsg: "Element bulunamadı"})
        let elems = await $$(txt_BottomChallengesPoint)
        let text;
        for (const el of elems) {
            if (browser.isAndroid) {
                text = await el.getAttribute("content-desc")
            } else {
                text = await el.getText()
            }
            let confirmedsiz = await text.replace("challenge-item-points", "")
            let artısız = await confirmedsiz.replace("+", "")
            let result = await artısız.replace("puan", "")
            result = result.replace(/\s+/g, '');
            arr1.push(parseInt(result))
        }
        const isSorted = arr => arr.every((v, i, a) => !i || a[i - 1] >= v);
        await expect(true).equal(await isSorted(arr1))
    }

    async checkChallengeTitle(text) {
        await ElementHelper.elementsCheckTextContains(txt_ChallengeTitle, text)
    }

    async checkChallengeDescription(text) {
        await ElementHelper.elementsCheckTextContains(txt_ChallengeDescription, text)
    }

    async checkChallengePoint(text) {
        await ElementHelper.elementsCheckTextContains(txt_ChallengePoint, text)
    }

    async clickPointHistory() {
        await ElementHelper.elementClick(btn_PointHistory)
    }
}

module.exports = new PointEarningPage();
