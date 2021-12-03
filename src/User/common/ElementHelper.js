const expect = require("chai").expect;

class ElementHelper {

    async getText(element) {
        await this.writeConsoleInfo("getText adımı başladı - " + element)
        let elem = await this.findElement(element)
        await this.writeConsoleTick("getText adımı başarıyla gerçekleşti")
        return elem.getText();
    }

    async getAttribute(element, attr) {
        await this.writeConsoleInfo("getText adımı başladı - " + element)
        let elem = await this.findElement(element)
        await this.writeConsoleTick("getText adımı başarıyla gerçekleşti")
        return elem.getAttribute(attr);
    }

    async elementSendKey(element, text) {
        await this.writeConsoleInfo("elementSendKey adımı başladı - " + element)
        let elem = await this.findElement(element)
        await elem.setValue(text)
        await this.writeConsoleTick("elementSendKey adımı başarıyla gerçekleşti")
    }

    async withOutElementSendKey(text) {
        try {
            await this.writeConsoleInfo("withOutElementSendKey adımı başladı - " + text)
            await browser.pause(3000)
            await browser.keys(text)

        } catch (e) {

        } finally {
            await browser.pause(2000)
            await driver.pressKeyCode(66);
            await browser.pause(2000)
            await this.writeConsoleTick("withOutElementSendKey adımı başarıyla gerçekleşti")
        }
    }

    async elementCheck(element) {
        await this.writeConsoleInfo("elementCheck adımı başladı - " + element)
        await this.findElement(element)
        await this.writeConsoleTick("elementCheck adımı başarıyla gerçekleşti")
    }

    async checkElementExist(element) {
        await this.writeConsoleInfo("checkElementExist adımı başladı - " + element)
        await $(element).waitForExist({timeoutMsg: "Element exist olmadı"})
        await this.writeConsoleTick("checkElementExist adımı başarıyla gerçekleşti")
    }

    async elementNotCheck(element) {
        await this.writeConsoleInfo("elementNotCheck adımı başladı - " + element)
        let wait = await $(element).waitForDisplayed({
            reverse: true,
            timeoutMsg: "Element bulunamadı"
        })
        await expect(wait).equal(true)
        await this.writeConsoleTick("elementNotCheck adımı başarıyla gerçekleşti")
    }

    async elementCheckTextEquals(element, text) {
        await this.writeConsoleInfo("elementCheckTextEquals adımı başladı - " + element)
        let elem = await this.findElement(element)
        const elemText = await elem.getText()
        await expect(elemText).equal(text)
        await this.writeConsoleTick("elementCheckTextEquals adımı başarıyla gerçekleşti")
    }

    async elementCheckTextContains(element, text) {
        await this.writeConsoleInfo("elementCheckTextContains adımı başladı - " + element)
        let elem = await this.findElement(element)
        let elemText = ""
        if (browser.isAndroid) {
            elemText = await elem.getAttribute("content-desc")
        } else {
            elemText = await elem.getText()
        }
        await expect(elemText).contain(text)
        await this.writeConsoleTick("elementCheckTextContains adımı başarıyla gerçekleşti")
    }

    async elementCheckTextContainss(element, text) {
        await this.writeConsoleInfo("elementCheckTextContains adımı başladı - " + element)
        let elem = await this.findElement(element)
        const elemText = await elem.getText()
        await expect(elemText).contain(text)
        await this.writeConsoleTick("elementCheckTextContains adımı başarıyla gerçekleşti")
    }

    async elementCheckNotTextContains(element, text) {
        await this.writeConsoleInfo("elementCheckTextContains adımı başladı - " + element)
        let elem = await this.findElement(element)
        let elemText = ""
        if (browser.isAndroid) {
            elemText = await elem.getAttribute("content-desc")
        } else {
            elemText = await elem.getText()
        }
        if (elemText.includes(text)) {
            await expect(true).equal(false)
        }
        await this.writeConsoleTick("elementCheckTextContains adımı başarıyla gerçekleşti")
    }

    async elementClick(element) {
        await this.writeConsoleInfo("elementClick adımı başladı - " + element)
        let elem = await this.findElement(element)
        await elem.click()
        await this.writeConsoleTick("elementClick adımı başarıyla gerçekleşti")
    }


    async withOutElementClickTextContains(text) {
        await this.writeConsoleInfo("withOutElementClickTextContains adımı başladı - " + text)
        const fullText = `android=new UiSelector().textContains("` + text + `")`
        let elem = await this.findElement(fullText)
        await elem.click()
        await this.writeConsoleTick("withOutElementClickTextContains adımı başarıyla gerçekleşti")
    }

    async withOutElementClickTextEquals(text) {
        await this.writeConsoleInfo("withOutElementClickTextEquals adımı başladı - " + text)
        const fullText = `android=new UiSelector().text("` + text + `")`
        let elem = await this.findElement(fullText)
        await elem.click()
        await this.writeConsoleTick("withOutElementClickTextEquals adımı başarıyla gerçekleşti")
    }

    async elementsCheckTextContains(element1, text) {
        await this.writeConsoleInfo("elementsCheckTextContains adımı başladı - " + text)
        let result = false
        let txt
        await this.findElement(element1)
        let elements = await $$(element1)
        for (const el of elements) {
            if (browser.isIOS) {
                txt = await el.getText()
            } else {
                txt = await el.getAttribute("content-desc")
            }
            if (txt.includes(text)) {
                result = true
                break
            }
        }
        await expect(true).equal(result)
        await this.writeConsoleTick("elementsCheckTextContains adımı başarıyla gerçekleşti")
    }

    async elementsClickTextContains(element1, text) {
        await this.writeConsoleInfo("elementsClickTextContains adımı başladı - " + text)
        let result = false
        let txt
        await this.findElement(element1)
        let elements = await $$(element1)
        for (const el of elements) {
            if (browser.isIOS) {
                txt = await el.getText()
            } else {
                txt = await el.getAttribute("content-desc")
            }
            if (txt.includes(text)) {
                await el.click()
                result = true
                break
            }
        }
        await browser.pause(2000)
        await expect(true).equal(result)
        await this.writeConsoleTick("elementsClickTextContains adımı başarıyla gerçekleşti")
    }


    async elementsCheckUnderElementWithText(element1, element2, text) {
        await this.writeConsoleInfo("elementsCheckUnderElementWithText adımı başladı - " + text)
        let result = false
        let txt
        await this.findElement(element1)
        let elements = await $(element1).$$(element2)
        for (const el of elements) {
            if (browser.isIOS) {
                txt = await el.getText()
            } else {
                txt = await el.getAttribute("content-desc")
            }
            if (txt.includes(text)) {
                result = true
                break
            }
        }
        await browser.pause(2000)
        await expect(true).equal(result)
        await this.writeConsoleTick("elementsCheckUnderElementWithText adımı başarıyla gerçekleşti")
    }

    async elementsClickUnderElementWithText(element1, element2, text) {
        await this.writeConsoleInfo("elementsClickUnderElementWithText adımı başladı - " + text)
        let result = false
        let txt
        await this.findElement(element1)
        let elements = $(element1).$$(element2)
        for (const el of elements) {
            if (browser.isIOS) {
                txt = await el.getText()
            } else {
                txt = await el.getAttribute("content-desc")
            }
            if (txt.includes(text)) {
                await el.click()
                result = true
                break
            }
        }
        await browser.pause(2000)
        await expect(true).equal(result)
        await this.writeConsoleTick("elementsClickUnderElementWithText adımı başarıyla gerçekleşti")
    }

    async findElement(element) {
        await this.writeConsoleChildMethod("FindElement adımı başladı")
        try {
            await $(element).waitForDisplayed({timeoutMsg: "Element bulunamadı"})
            await this.writeConsoleChildMethodTick("FindElement adımı başarıyla gerçekleşti")
            return await $(element)
        } catch (error) {
            let isExist = false
            if (browser.isAndroid) {
                let elem = await element.replace("android=", "")
                await $(`android=new UiScrollable(new UiSelector().scrollable(true)).flingToBeginning(3).scrollIntoView(` + elem + `)`)
                let window = await browser.getWindowSize()
                await browser.touchAction([
                    {action: 'press', x: window.width / 2, y: window.height * 3 / 4},
                    {action: 'moveTo', x: window.width / 2, y: window.height / 5},
                    'release'
                ])
                await browser.pause(2000)
                try {
                    await $(element).waitForDisplayed({timeoutMsg: "Element bulunamadı"})
                    await this.writeConsoleChildMethodTick("FindElement adımı başarıyla gerçekleşti")
                    return await $(element)
                } catch (error) {
                    await browser.touchAction([
                        {action: 'press', x: window.width / 2, y: window.height / 4},
                        {action: 'moveTo', x: window.width / 2, y: window.height * 3 / 4},
                        'release'
                    ])
                    await $(element).waitForDisplayed({timeoutMsg: "Element bulunamadı"})
                    await this.writeConsoleChildMethodTick("FindElement adımı başarıyla gerçekleşti")
                    return await $(element)
                }
            } else {
                for (let i = 0; i < 10; i++) {
                    await this.scrollDown()
                    await browser.pause(1000)
                    isExist = await $(element).isExisting()
                    if (isExist == true) {
                        await this.findElementLittleScrollWithDisplay(element)
                        break
                    }
                }

            }
            isExist = await $(element).isExisting()
            if (isExist == false) {
                await this.writeConsoleChildMethodFail("FindElement adımı başarısız")
            } else {
                await this.writeConsoleChildMethodTick("FindElement adımı başarıyla gerçekleşti")
                return await $(element)
            }

        }
    }

    async scrollDown() {
        await driver.execute('mobile: swipe', {direction: 'up'});
    }

    async scrollUp() {
        await driver.execute('mobile: swipe', {direction: 'down'});
    }

    async findElementLittleScrollWithDisplay(element) {
        let isDisplayed
        await this.scrollDown()
        await browser.pause(1000)
        isDisplayed = await $(element).isDisplayed()
        if (isDisplayed == false) {
            await this.scrollDown()
            await browser.pause(1000)
            isDisplayed = await $(element).isDisplayed()
            if (isDisplayed == false) {
                await this.scrollUp()
                await this.scrollUp()
                await browser.pause(1000)
                isDisplayed = await $(element).isDisplayed()
                if (isDisplayed == false) {
                    await this.writeConsoleChildMethodFail("FindElement adımı başarısız")
                } else {
                    return $(element)
                }
            } else {
                return $(element)
            }
        } else {
            return $(element)
        }
    }

    async writeConsoleTick(text) {
        await console.log('\u001b[' + 32 + 'm' + '            ✓ ' + '\u001b[0m' + text)
    }

    async writeConsoleFail(text) {
        await console.log('\u001b[' + 31 + 'm' + '            ✖ ' + '\u001b[0m' + text)
    }

    async writeConsoleInfo(text) {
        await console.log('\u001b[' + 33 + 'm' + '            - ' + '\u001b[0m' + text)
    }

    async writeConsoleChildMethod(text) {
        await console.log('\u001b[' + 33 + 'm' + '                - ' + '\u001b[0m' + text)
    }

    async writeConsoleChildMethodTick(text) {
        await console.log('\u001b[' + 32 + 'm' + '                ✓ ' + '\u001b[0m' + text)
    }

    async writeConsoleChildMethodFail(text) {
        await console.log('\u001b[' + 31 + 'm' + '                ✖ ' + text + '\u001b[0m')
    }

}

module.exports = new ElementHelper();
