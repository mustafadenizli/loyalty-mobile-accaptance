class ElementHelper {

    async getText(element) {
        await this.writeConsoleInfo("getText adımı başladı - " + element)
        let elem = await this.findElement(element)
        const text = await elem.getText()
        await this.writeConsoleTick("getText adımı başarıyla gerçekleşti")
        return text
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
            await browser.pause(2000)
            await browser.keys(text)
        } catch (e) {
            await browser.pause(1000)
            await browser.hideKeyboard('pressKey', 'Done');
            await this.writeConsoleTick("withOutElementSendKey adımı başarıyla gerçekleşti")
        }
    }

    async elementCheck(element) {
        await this.writeConsoleInfo("elementCheck adımı başladı - " + element)
        await this.findElement(element)
        await this.writeConsoleTick("elementCheck adımı başarıyla gerçekleşti")
    }

    async elementNotCheck(element) {
        await this.writeConsoleInfo("elementCheck adımı başladı - " + element)
        let elem = $(element).isExisting()
        await expect(elem).toEqual(false)
        await this.writeConsoleTick("elementCheck adımı başarıyla gerçekleşti")
    }

    async elementCheckTextEquals(element, text) {
        await this.writeConsoleInfo("elementCheckTextEquals adımı başladı - " + element)
        let elem = await this.findElement(element)
        const elementText = await elem.getText()
        await expect(elementText).toEqual(text)
        await this.writeConsoleTick("elementCheckTextEquals adımı başarıyla gerçekleşti")
    }

    async elementCheckTextContains(element, text) {
        await this.writeConsoleInfo("elementCheckTextContains adımı başladı - " + element)
        let elem = await this.findElement(element)
        const elementText = await elem.getText()
        await expect(elementText).toContain(text)
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
        await this.findElement(element1)
        let elems = await $$(element1)
        let elements = elems.map(async (el) => {
            let txt = await el.getText()
            if (txt.includes(text)) {
                return true
            }
        })
        for (const elemsKey in elements) {
            if (elemsKey == true) {
                result = true
                break
            }
        }
        await expect(true).toEqual(result)
        await this.writeConsoleTick("elementsCheckTextContains adımı başarıyla gerçekleşti")
    }

    async elementsClickTextContains(element1, text) {
        await this.writeConsoleInfo("elementsClickTextContains adımı başladı - " + text)
        let result = false
        await this.findElement(element1)
        let elems = await $$(element1)
        let elements = elems.map(async (el) => {
            let txt = await el.getText()
            if (txt.includes(text)) {
                await el.click()
                return true
            }
        })
        for (const elemsKey in elements) {
            if (elemsKey == true) {
                result = true
                break
            }
        }
        await expect(true).toEqual(result)
        await this.writeConsoleTick("elementsClickTextContains adımı başarıyla gerçekleşti")
    }


    async elementsCheckUnderElementWithText(element1, element2, text) {
        await this.writeConsoleInfo("elementsCheckUnderElementWithText adımı başladı - " + text)
        let result = false
        await this.findElement(element1)
        let elems = await $(element1).$$(element2)
        let elements = await elems.map(async (el) => {
            let txt = await el.getText()
            if (txt.includes(text)) {
                return true
            }
        })
        for (const elemsKey in elements) {
            if (elemsKey == true) {
                result = true
                break
            }
        }
        await expect(true).toEqual(result)
        await this.writeConsoleTick("elementsCheckUnderElementWithText adımı başarıyla gerçekleşti")
    }

    async elementsClickUnderElementWithText(element1, element2, text) {
        await this.writeConsoleInfo("elementsClickUnderElementWithText adımı başladı - " + text)
        let result = false
        await this.findElement(element1)
        let elems = await $(element1).$$(element2)
        let elements = await elems.map(async (el) => {
            let txt = await el.getText()
            if (txt.includes(text)) {
                await el.click()
                return true
            }
        })
        for (const elemsKey in elements) {
            if (elemsKey == true) {
                result = true
                break
            }
        }
        await expect(true).toEqual(result)
        await this.writeConsoleTick("elementsClickUnderElementWithText adımı başarıyla gerçekleşti")
    }

    async findElement(element) {
        await this.writeConsoleChildMethod("FindElement adımı başladı")
        try {
            await $(element).waitForDisplayed({timeout: 20000})
            await expect($(element)).toExist()
            await this.writeConsoleChildMethodTick("FindElement adımı başarıyla gerçekleşti")
            return await $(element)
        } catch (error) {
            await this.writeConsoleChildMethod("Element bulunamadı sayfayı kaydırmayı deniyorum")
            let elem = await element.replace("android=", "")
            let window = await browser.getWindowSize()
            await $(`android=new UiScrollable(new UiSelector().scrollable(true)).flingToBeginning(3).scrollIntoView(` + elem + `)`)
            await browser.touchAction([
                {action: 'press', x: window.width / 2, y: window.height * 3 / 4},
                {action: 'moveTo', x: window.width / 2, y: window.height / 5},
                'release'
            ])
            await browser.pause(2000)
            try {
                await $(element).waitForDisplayed({timeout: 2000})
                await expect($(element)).toExist()
                await this.writeConsoleChildMethodTick("FindElement adımı başarıyla gerçekleşti")
                return await $(element)
            } catch (error) {
                await browser.touchAction([
                    {action: 'press', x: window.width / 2, y: window.height / 4},
                    {action: 'moveTo', x: window.width / 2, y: window.height * 3 / 4},
                    'release'
                ])
                await $(element).waitForDisplayed({timeout: 2000})
                await expect($(element)).toExist()
                await this.writeConsoleChildMethodTick("FindElement adımı başarıyla gerçekleşti")
                return await $(element)
            }
        }
    }

    async pause(ms) {
        await browser.pause(ms)
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
        await console.log('\u001b[' + 31 + 'm' + '                ✖ ' + '\u001b[0m' + text)
    }
}

module.exports = new ElementHelper();
