const ElementHelper = require('../common/ElementHelper')

const txt_PointEarningPageTitle = browser.isAndroid ? `android=new UiSelector().text("Puan Kazanımı")` : ``
const btn_BackButton = browser.isAndroid ? `android=new UiSelector().textContains("dashboard-back-button")` : ``
const area_Challenges = browser.isAndroid ? `android=new UiSelector().text("challenge-item")` : ``
const txt_ChallengeTitle = browser.isAndroid ? `android=new UiSelector().textContains("challenge-item-title")` : ``
const txt_ChallengeDescription = browser.isAndroid ? `android=new UiSelector().textContains("challenge-item-description")` : ``
const txt_ChallengePoint = browser.isAndroid ? `android=new UiSelector().textContains("challenge-item-points")` : ``
const btn_PointHistory = browser.isAndroid ? `android=new UiSelector().textContains("my-points-history-section")` : ``


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

    async checkChallengeTitle(text) {
        await ElementHelper.elementCheckTextContains(txt_ChallengeTitle, text)
    }

    async checkChallengeDescription(text) {
        await ElementHelper.elementCheckTextContains(txt_ChallengeDescription, text)
    }

    async checkChallengePoint(text) {
        await ElementHelper.elementCheckTextContains(txt_ChallengePoint, text)
    }

    async clickPointHistory() {
        await ElementHelper.elementClick(btn_PointHistory)
    }
}

module.exports = new PointEarningPage();
