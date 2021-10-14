const ElementHelper = require('../common/ElementHelper')

const txt_DashboardMainPageTitle = browser.isAndroid ? `android=new UiSelector().textContains("dashboard-main-page-title")` : ``
const btn_BackButton = browser.isAndroid ? `android=new UiSelector().textContains("dashboard-back-button")` : ``
const txt_ConfirmedPointsName = browser.isAndroid ? `android=new UiSelector().textContains("Güncel Puanlarım")` : ``
const txt_ConfirmedPoints = browser.isAndroid ? `android=new UiSelector().textContains("dashboard-main-page-current-points")` : ``
const txt_HelloAndHerName = browser.isAndroid ? `android=new UiSelector().textContains("dashboard-main-page-hello-and-customer-name")` : ``
const txt_PendingPoints = browser.isAndroid ? `android=new UiSelector().textContains("dashboard-main-page-pending-points")` : ``
const btn_EarningPoints = browser.isAndroid ? `android=new UiSelector().textContains("earning-points-page-button")` : ``
const btn_Rewards = browser.isAndroid ? `android=new UiSelector().textContains("rewards-button")` : ``
const btn_MyEarnedGifts = browser.isAndroid ? `android=new UiSelector().textContains("my-earned-gift-list-section")` : ``
const btn_MyTierStatus = browser.isAndroid ? `android=new UiSelector().textContains("earning-points-page-button")` : ``
const btn_Faq = browser.isAndroid ? `android=new UiSelector().textContains("faq-section")` : ``


class DashboardMainPage {
    async checkDashboardMainPage() {
        await ElementHelper.elementCheck(txt_DashboardMainPageTitle)
    }

    async clickBackButton() {
        await ElementHelper.elementClick(btn_BackButton)
    }

    async checkConfirmedPointsName(text) {
        await ElementHelper.elementCheckTextContains(txt_ConfirmedPointsName, text)
    }

    async checkConfirmedPoints(text) {
        await ElementHelper.elementCheckTextContains(txt_ConfirmedPoints, text)
    }

    async checkPendingPoints(text) {
        await ElementHelper.elementCheckTextContains(txt_PendingPoints, text)
    }

    async checkWelcomeText(text) {
        await ElementHelper.elementCheckTextContains(txt_HelloAndHerName, text)
    }

    async checkHerName(text) {
        await ElementHelper.elementCheckTextContains(txt_HelloAndHerName, text)
    }

    async clickEarningPoints() {
        await ElementHelper.elementClick(btn_EarningPoints)
    }

    async clickRewards() {
        await ElementHelper.elementClick(btn_Rewards)
    }

    async clickMyEarnedGifts() {
        await ElementHelper.elementClick(btn_MyEarnedGifts)
    }

    async clickMyTierStatus() {
        await ElementHelper.elementClick(btn_MyTierStatus)
    }

    async clickFaq() {
        await ElementHelper.elementClick(btn_Faq)
    }
}

module.exports = new DashboardMainPage();
