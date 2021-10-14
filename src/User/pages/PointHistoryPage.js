const ElementHelper = require('../common/ElementHelper')

const txt_PointHistoryPageTitle = browser.isAndroid ? `android=new UiSelector().text("Puan Kazanımı")` : ``
const btn_BackButton = browser.isAndroid ? `android=new UiSelector().textContains("dashboard-back-button")` : ``
const txt_ChallengePoint = browser.isAndroid ? `android=new UiSelector().textContains("my-points-history-confirmed-number")` : ``
const txt_ChallengeDate = browser.isAndroid ? `android=new UiSelector().textContains("my-points-history-date")` : ``
const txt_ChallengeName = browser.isAndroid ? `android=new UiSelector().textContains("my-points-history-confirmed-name")` : ``


class PointHistoryPage {
    async checkPointHistoryPage() {
        await ElementHelper.elementCheck(txt_PointHistoryPageTitle)
    }

    async clickBackButton() {
        await ElementHelper.elementClick(btn_BackButton)
    }

    async checkChallengePoint(text) {
        await ElementHelper.elementCheckTextContains(txt_ChallengePoint,text)
    }

    async checkChallengeName(text) {
        await ElementHelper.elementCheckTextContains(txt_ChallengeName,text)
    }

    async checkChallengeDate(text) {
        await ElementHelper.elementCheckTextContains(txt_ChallengeDate,text)
    }


}

module.exports = new PointHistoryPage();
