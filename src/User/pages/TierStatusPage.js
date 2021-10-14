const ElementHelper = require('../common/ElementHelper')

const txt_TierStatusPageTitle = browser.isAndroid ? `android=new UiSelector().text("Puan Kazanımı")` : ``
const btn_BackButton = browser.isAndroid ? `android=new UiSelector().textContains("dashboard-back-button")` : ``


class TierStatusPage {
    async checkTierStatusPage() {
        await ElementHelper.elementCheck(txt_TierStatusPageTitle)
    }

    async clickBackButton() {
        await ElementHelper.elementClick(btn_BackButton)
    }

    async checkTierName(text) {
        await ElementHelper.elementsCheckTextContains(btn_BackButton, text)
    }

    async checkScore(text) {
        await ElementHelper.elementsCheckTextContains(btn_BackButton, text)
    }

    async checkMembershipDate(text) {
        await ElementHelper.elementsCheckTextContains(btn_BackButton, text)
    }

    async checkPrivilegesTier(text) {
        await ElementHelper.elementsCheckTextContains(btn_BackButton, text)
    }

    async checkPrivilegesName(text) {
        await ElementHelper.elementsCheckTextContains(btn_BackButton, text)
    }

    async checkPrivilegesNameIsChecked(text) {
        await ElementHelper.elementsCheckTextContains(btn_BackButton, text)
    }

    async clickAllPrivileges() {
        await ElementHelper.elementClick(btn_BackButton)
    }

    async checkModalTitle(text) {
        await ElementHelper.elementsCheckTextContains(btn_BackButton, text)
    }

    async clickModalClose() {
        await ElementHelper.elementClick(btn_BackButton)
    }


}

module.exports = new TierStatusPage();
