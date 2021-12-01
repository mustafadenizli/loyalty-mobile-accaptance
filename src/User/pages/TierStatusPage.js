const ElementHelper = require('../common/ElementHelper')

const txt_TierStatusPageTitle = browser.isAndroid ? `android=new UiSelector().descriptionContains("my-tier-status-page-title")` : `-ios predicate string: name CONTAINS 'my-tier-status-page-title'`
const btn_BackButton = browser.isAndroid ? `android=new UiSelector().descriptionContains("back-button")` : `-ios predicate string: name CONTAINS 'back-button'`
const txt_TierName = browser.isAndroid ? `//android.widget.ScrollView/android.view.View[1]` : `//XCUIElementTypeOther[contains(@name,' Üye')]`
const txt_TierScore = browser.isAndroid ? `//android.widget.ScrollView/android.view.View[2]` : `//XCUIElementTypeOther[contains(@name,'puan')]`
const txt_MembershipDate = browser.isAndroid ? `android=new UiSelector().descriptionContains("membership-start-date")` : `-ios predicate string: name CONTAINS 'membership-start-date'`
const txt_PrivilagesTier = browser.isAndroid ? `//android.widget.ScrollView/android.view.View[14]` : `//XCUIElementTypeOther[15]`
const txt_PrivilagesName = browser.isAndroid ? `android=new UiSelector().descriptionContains("privilege-name")` : `-ios predicate string: name CONTAINS 'privilege-name'`
const btn_AllPrivilages = browser.isAndroid ? `android=new UiSelector().descriptionContains("all-privileges-in-modal")` : `-ios predicate string: name CONTAINS 'all-privileges-in-modal'`
const txt_ModalTitle = browser.isAndroid ? `//android.view.View[contains(@content-desc,'...')]` : `//XCUIElementTypeOther[contains(@name,'...')]`
const btn_CloseAllPrivilages = browser.isAndroid ? `android=new UiSelector().descriptionContains("close-button")` : `-ios predicate string: name CONTAINS 'close-button'`


class TierStatusPage {
    async checkTierStatusPage() {
        await ElementHelper.elementCheck(txt_TierStatusPageTitle)
    }

    async clickBackButton() {
        await ElementHelper.elementClick(btn_BackButton)
    }

    async checkTierName(text) {
        await ElementHelper.elementCheckTextContains(txt_TierName, text)
    }

    async checkScore(text) {
        await ElementHelper.elementCheckTextContains(txt_TierScore, text)
    }

    async checkMembershipDate() {
        let today = new Date();
        let dd = String(today.getDate()).padStart(2, '0');
        let mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
        let yyyy = today.getFullYear();
        today = dd + '.' + mm + '.' + yyyy;
        if(dd.startsWith("0")){
            dd = dd.substring(0,1)
        }
        await ElementHelper.elementCheckTextContains(txt_MembershipDate, dd)
        await ElementHelper.elementCheckTextContains(txt_MembershipDate, yyyy)
    }

    async checkPrivilegesTier(text) {
        await ElementHelper.elementCheckTextContains(txt_PrivilagesTier, text)
    }

    async checkPrivilegesName(text) {
        await ElementHelper.elementsCheckTextContains(txt_PrivilagesName, text)
    }

    async clickAllPrivileges() {
        if (browser.isIOS) {
            await ElementHelper.scrollDown()
        }
        else {
            await browser.touchAction([
                {action: 'press', x: window.width / 2, y: window.height * 3 / 4},
                {action: 'moveTo', x: window.width / 2, y: window.height / 5},
                'release'
            ])

        }
        await ElementHelper.elementClick(btn_AllPrivilages)
    }

    async checkModalTitle(text) {
        await ElementHelper.elementCheckTextContains(txt_ModalTitle, text)
    }

    async clickModalClose() {
        await ElementHelper.elementClick(btn_CloseAllPrivilages)
    }


}

module.exports = new TierStatusPage();
