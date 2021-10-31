const {config} = require("../wdio.conf");

config.capabilities = [
    // Android Real Device for installed app
    {
        platformName: "Android",
        platformVersion: "11",
        deviceName: "Galaxy A51",
        udid: "R58R312DAYM",
        appPackage: "com.modanisa.debug",
        appActivity: "com.modanisa.activity.SplashActivity",
    }


    /*
    
        // -- Android Real Device for not installed app
        {
            platformName: "Android",
            platformVersion: "11",
            deviceName: "Redmi Note 9 Pro",
            udid: "5a7b5e20",
            app: "/Users/enes.erdogan/Desktop/Automation/User-WebDriverIOArchitecture/files/e03b0f87-0ff9-4336-a72c-5cd0c2832229.apk"
        },

        // -- Android Real Device for installed app
        {
            platformName: "Android",
            platformVersion: "11",
            deviceName: "Redmi Note 9 Pro",
            udid: "5a7b5e20",
            appPackage: "com.modanisa",
            appActivity: "com.modanisa.activity.SplashActivity",
        },

        // -- Android Real Device for mobile-web 
        {
            platformName: 'Android',
            platformVersion: '11',
            deviceName: 'Redmi Note 9 Pro',
            udid: "5a7b5e20",
            browserName: 'Chrome'
        },

        // -- Android Emulator for not installed app
        {
            platformName: "Android",
            platformVersion: "9",
            deviceName: "emulator-5554",
            app: "",
        },

        // -- Android Emulator for installed app
        {
            platformName: "Android",
            platformVersion: "9",
            deviceName: "emulator-5554",
            appPackage: "com.modanisa.debug",
            appActivity: "com.modanisa.activity.SplashActivity",
        },

        // -- Android Emulator for mobile-web 
        {
            platformName: 'Android',
            platformVersion: '9',
            deviceName: 'emulator-5554',
            browserName: 'Chrome'
        }
        
    */

];


exports.config = config;