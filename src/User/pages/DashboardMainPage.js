const ElementHelper = require('../common/ElementHelper')

const txt_DashboardMainPageTitle = browser.isAndroid ? `android=new UiSelector().descriptionContains("dashboard-main-page-title")` : `-ios predicate string: name CONTAINS 'dashboard-main-page-title'`
const btn_BackButton = browser.isAndroid ? `android=new UiSelector().descriptionContains("dashboard-back-button")` : `-ios predicate string: name CONTAINS 'dashboard-back-button'`
const txt_ConfirmedPointsName = browser.isAndroid ? `android=new UiSelector().descriptionContains("Güncel Puanlarım")` : `-ios predicate string: name CONTAINS 'enrollment-form-page-title'`
const txt_ConfirmedPoints = browser.isAndroid ? `android=new UiSelector().descriptionContains("dashboard-main-page-current-points")` : `-ios predicate string: name CONTAINS 'dashboard-main-page-current-points'`
const txt_Hello = browser.isAndroid ? `android=new UiSelector().descriptionContains("Merhaba")` : `-ios predicate string: name CONTAINS 'Merhaba'`
const txt_HelloAndHerName = browser.isAndroid ? `android=new UiSelector().descriptionContains("dashboard-main-page-hello-and-customer-name")` : `-ios predicate string: name CONTAINS 'Merhaba'`
const txt_Description = browser.isAndroid ? `android=new UiSelector().descriptionContains("My Modanisa’ya Hoş Geldin")` : `-ios predicate string: name CONTAINS 'My Modanisa’ya Hoş Geldin'`
const txt_PendingPointsName = browser.isAndroid ? `android=new UiSelector().descriptionContains("Onay Bekleyen")` : `-ios predicate string: name CONTAINS 'enrollment-form-page-title'`
const txt_PendingPoints = browser.isAndroid ? `android=new UiSelector().descriptionContains("dashboard-main-page-pending-points")` : `-ios predicate string: name CONTAINS 'enrollment-form-page-title'`
const btn_EarningPoints = browser.isAndroid ? `android=new UiSelector().descriptionContains("earning-points-page-button")` : `-ios predicate string: name CONTAINS 'earning-points-page-button'`
const btn_Rewards = browser.isAndroid ? `android=new UiSelector().descriptionContains("rewards-button")` : `-ios predicate string: name CONTAINS 'rewards-button'`
const btn_MyEarnedGifts = browser.isAndroid ? `android=new UiSelector().descriptionContains("my-earned-gift-list-section")` : `-ios predicate string: name CONTAINS 'my-earned-gift-list-section'`
const btn_MyTierStatus = browser.isAndroid ? `android=new UiSelector().descriptionContains("my-membership-level-section")` : `-ios predicate string: name CONTAINS 'my-membership-level-section'`
const btn_Faq = browser.isAndroid ? `android=new UiSelector().descriptionContains("faq-section")` : `-ios predicate string: name CONTAINS 'faq-section'`


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

    async checkPendingPointsName(text) {
        await ElementHelper.elementCheckTextContains(txt_PendingPointsName, text)
    }

    async checkPendingPoints(text) {
        await ElementHelper.elementCheckTextContains(txt_PendingPoints, text)
    }

    async checkNotPendingPoints() {
        await ElementHelper.elementNotCheck(txt_PendingPoints)
    }

    async checkWelcomeText(text) {
        await ElementHelper.elementCheckTextContains(txt_Hello, text)
    }

    async checkDescriptionText(text) {
        await ElementHelper.elementCheckTextContains(txt_Description, text)
    }

    async checkHerName(text) {
        await ElementHelper.elementCheckTextContains(txt_HelloAndHerName, text)
    }

    async checkNotHerName() {
        await ElementHelper.elementNotCheck(txt_HelloAndHerName)
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

    async checkEarningPoints() {
        await ElementHelper.elementCheck(btn_EarningPoints)
    }

    async checkRewards() {
        await ElementHelper.elementCheck(btn_Rewards)
    }

    async checkMyEarnedGifts() {
        await ElementHelper.elementCheck(btn_MyEarnedGifts)
    }

    async checkMyTierStatus() {
        await ElementHelper.elementCheck(btn_MyTierStatus)
    }

    async checkFaq() {
        await ElementHelper.elementCheck(btn_Faq)
    }
}

module.exports = new DashboardMainPage();
