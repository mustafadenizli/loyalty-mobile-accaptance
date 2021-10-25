const ElementHelper = require('../common/ElementHelper')

const txt_PointHistoryPageTitle = browser.isAndroid ? `android=new UiSelector().textContains("page-title")` : `-ios predicate string: name CONTAINS 'page-title'`
const btn_BackButton = browser.isAndroid ? `android=new UiSelector().textContains("back-button")` : `-ios predicate string: name CONTAINS 'back-button'`
const txt_ChallengePoint = browser.isAndroid ? `android=new UiSelector().textContains("my-points-history-confirmed-number")` : `-ios predicate string: name CONTAINS 'my-points-history-confirmed-number'`
const txt_ChallengeDate = browser.isAndroid ? `android=new UiSelector().textContains("my-points-history-date")` : `-ios predicate string: name CONTAINS 'my-points-history-date'`
const txt_ChallengeName = browser.isAndroid ? `android=new UiSelector().textContains("my-points-history-confirmed-name")` : `-ios predicate string: name CONTAINS 'my-points-history-confirmed-name'`


class PointHistoryPage {
    async checkPointHistoryPage() {
        await ElementHelper.elementCheck(txt_PointHistoryPageTitle)
    }

    async clickBackButton() {
        await ElementHelper.elementClick(btn_BackButton)
    }

    async checkChallengePoint(text) {
        await ElementHelper.elementCheckTextContains(txt_ChallengePoint, text)
    }

    async checkChallengeName(text) {
        await ElementHelper.elementCheckTextContains(txt_ChallengeName, text)
    }

    async checkChallengeDate(text) {
        await ElementHelper.elementCheckTextContains(txt_ChallengeDate, text)
    }

    async checkChallengeDateToday() {
        let today = new Date();
        let dd = String(today.getDate()).padStart(2, '0');
        let mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
        let yyyy = today.getFullYear();
        today = dd + '.' + mm + '.' + yyyy;
        await console.info(today)
        await ElementHelper.elementCheckTextContains(txt_ChallengeDate, today)
    }


}

module.exports = new PointHistoryPage();
