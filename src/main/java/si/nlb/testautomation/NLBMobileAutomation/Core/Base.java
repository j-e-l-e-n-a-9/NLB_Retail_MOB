package si.nlb.testautomation.NLBMobileAutomation.Core;

import io.appium.java_client.AppiumDriver;
import io.appium.java_client.android.Activity;
import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.android.StartsActivity;
import io.appium.java_client.ios.IOSDriver;
import io.appium.java_client.ios.IOSElement;
import io.appium.java_client.remote.MobileCapabilityType;
import io.appium.java_client.service.local.AppiumDriverLocalService;
import io.appium.java_client.service.local.AppiumServiceBuilder;
import io.appium.java_client.service.local.flags.GeneralServerFlag;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.support.ui.WebDriverWait;

import si.nlb.testautomation.NLBMobileAutomation.Data.ExcelFactory;
import si.nlb.testautomation.NLBMobileAutomation.Test.Hooks;

import java.io.File;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.URL;
import java.time.Duration;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * Class for work with drivers
 */
public class Base {

    //region - Parameters -
    public static URL url;
    public static int passed = 0;
    public static String testPlatform = "";
    public static String testVer = "";
    public static ArrayList<HashMap<String,String>> confdata;
    public static ArrayList<HashMap<String,String>> conf_env_data;
    public static AppiumDriver driver = null;
    public static WebDriverWait waitVar = null;
    public static String getErrorMessage = "";
    public static int DEFAULT_IMPLICIT_WAIT =30;
    public static String env;
    //endregion - Parameters -

    //region - Getting configuration data -
    /**
     * Gets data from configuration platform
     * @param ndx Order number of row
     * @param columnName Name of the parameter
     * @return String value of parameter
     */
    public static String getDataFromFileConf(String ndx, String columnName) {
        confdata = ExcelFactory.getDataFromExcel("testdata/config_platforme.xlsx", "Sheet1");
        int index = Integer.parseInt(ndx) - 1;
        return confdata.get(index).get(columnName);
    }

    /**
     * Gets data from configuration environment
     * @param ndx Order number of row
     * @param columnName Name of the parameter
     * @return String value of parameter
     */
    public static String getDataFromConfEnvironment(String ndx, String columnName){
        conf_env_data = ExcelFactory.getDataFromExcel("testdata/configuration_environment.xlsx", "Sheet1");
        int index = Integer.parseInt(ndx) - 1;
        return conf_env_data.get(index).get(columnName);
    }
    //endregion - Getting configuration data -

    //region - Managing driver -
    /**
     * Creates driver depending on platform name. iOS or Android platform.
     * @throws IOException
     * @throws InterruptedException
     */
    public void createDriver() throws IOException, InterruptedException {
        if(getDataFromFileConf(Hooks.rowinConfExcel, "PLATFORM_NAME").equals("iOS")){
            System.out.println("iOS driver");
            testPlatform = "iOS";
            testVer =getDataFromFileConf(Hooks.rowinConfExcel, "PLATFORM_VERSION");
            final String URL_STRING = "http://127.0.0.1:4723/wd/hub";
            url = new URL(URL_STRING);
            final DesiredCapabilities capabilities = new DesiredCapabilities();
            capabilities.setCapability(MobileCapabilityType.DEVICE_NAME, getDataFromFileConf(Hooks.rowinConfExcel, "DEVICE_NAME"));
            capabilities.setCapability(MobileCapabilityType.PLATFORM_NAME, getDataFromFileConf(Hooks.rowinConfExcel, "PLATFORM_NAME"));
            capabilities.setCapability(MobileCapabilityType.PLATFORM_VERSION, testVer);
            capabilities.setCapability(MobileCapabilityType.UDID, getDataFromFileConf(Hooks.rowinConfExcel, "UDID"));
            capabilities.setCapability(MobileCapabilityType.APP, getDataFromFileConf(Hooks.rowinConfExcel, "APP"));
            capabilities.setCapability(MobileCapabilityType.NO_RESET, true);
            capabilities.setCapability("bundleId", getDataFromFileConf(Hooks.rowinConfExcel, "BUNDLE_ID"));
            capabilities.setCapability(MobileCapabilityType.AUTOMATION_NAME, getDataFromFileConf(Hooks.rowinConfExcel, "AUTOMATION_NAME"));
            capabilities.setCapability("useNewWDA", true);
            capabilities.setCapability("locationServicesEnabled", true);
            capabilities.setCapability("locationServicesAuthorized", true);

            driver = new IOSDriver<IOSElement>(url, capabilities);
            driver.manage().timeouts().implicitlyWait(2, TimeUnit.SECONDS);
            waitVar = new WebDriverWait(driver, 60);
        }
        if (getDataFromFileConf(Hooks.rowinConfExcel, "PLATFORM_NAME").equals("Android")) {
            //This is old way of starting app used while appium 1.x was installed
            /*System.out.println("Android driver");
            testPlatform = "Android";
            final DesiredCapabilities capabilities = new DesiredCapabilities();
            capabilities.setCapability("udid", getDataFromFileConf(Hooks.rowinConfExcel, "UDID")); //Give Device ID of your mobile phone
            capabilities.setCapability("platformName", getDataFromFileConf(Hooks.rowinConfExcel, "PLATFORM_NAME"));
            capabilities.setCapability("deviceName", getDataFromFileConf(Hooks.rowinConfExcel, "DEVICE_NAME"));
            capabilities.setCapability("platformVersion", getDataFromFileConf(Hooks.rowinConfExcel, "PLATFORM_VERSION"));
            capabilities.setCapability("avd", getDataFromFileConf(Hooks.rowinConfExcel, "AVD"));
            capabilities.setCapability("appPackage", getDataFromFileConf(Hooks.rowinConfExcel, "appPackage"));
            capabilities.setCapability("appActivity", getDataFromFileConf(Hooks.rowinConfExcel, "appActivity"));
            capabilities.setCapability("noReset", "true");
            capabilities.setCapability("newCommandTimeout", 100000);
            capabilities.setCapability(MobileCapabilityType.AUTOMATION_NAME, getDataFromFileConf(Hooks.rowinConfExcel, "AUTOMATION_NAME"));
            //capabilities.setCapability("maxTypingFrequency",3);
            //capabilities.setCapability("sendKeyStrategy","grouped");
            //capabilities.setCapability("app", getDataFromFileConf(Hooks.rowinConfExcel, "APP"));
            //capabilities.setCapability("adbExecTimeout", 180000);
            //checkIsPhoneLock();
            driver = new AndroidDriver(new URL("http://127.0.0.1:4723/wd/hub"), capabilities);
            waitVar = new WebDriverWait(driver, 60);*/

            //This is new way of starting app used while appium 3.x is installed

            System.out.println("Android driver");
            testPlatform = "Android";

            String pkg = getDataFromFileConf(Hooks.rowinConfExcel, "appPackage");
            String act = getDataFromFileConf(Hooks.rowinConfExcel, "appActivity");

            DesiredCapabilities capabilities = new DesiredCapabilities();
            // W3C / Appium 3: prefiks "appium:" za vendor-capabilities
            capabilities.setCapability("platformName", getDataFromFileConf(Hooks.rowinConfExcel, "PLATFORM_NAME"));
            capabilities.setCapability("appium:deviceName", getDataFromFileConf(Hooks.rowinConfExcel, "DEVICE_NAME"));
            capabilities.setCapability("appium:udid", getDataFromFileConf(Hooks.rowinConfExcel, "UDID"));
            capabilities.setCapability("appium:platformVersion", getDataFromFileConf(Hooks.rowinConfExcel, "PLATFORM_VERSION"));
            capabilities.setCapability("appium:avd", getDataFromFileConf(Hooks.rowinConfExcel, "AVD"));
            capabilities.setCapability("appium:automationName", getDataFromFileConf(Hooks.rowinConfExcel, "AUTOMATION_NAME"));

            // ne dozvoli da Appium auto-startuje app; mi kontrolisemo start/stop
            capabilities.setCapability("appium:autoLaunch", false);

            // ne brisemo podatke (ako zelis “clean slate” vidi donju varijantu)
            capabilities.setCapability("appium:noReset", true);

            // produzava W3C timeout za “idle” komande
            capabilities.setCapability("appium:newCommandTimeout", 100_000);

            // (opciono) gasi AUT pri quit()
            capabilities.setCapability("appium:shouldTerminateApp", true);

            URL server = new URL("http://127.0.0.1:4723/wd/hub"); // ili "http://127.0.0.1:4723/wd/hub" ako si tako podigao server
            driver = new AndroidDriver(server, capabilities);
            //waitVar = new WebDriverWait(driver, Duration.ofSeconds(60));

            // -- Forsiraj hladan start bez brisanja podataka --
            Map<String, Object> term = new HashMap<>();
            term.put("appId", pkg);
            driver.executeScript("mobile: terminateApp", term);

            // Opcija A: vrati app u foreground (ako je već instaliran)
            /*Map<String, Object> actv = new HashMap<>();
            actv.put("appId", pkg);
            driver.executeScript("mobile: activateApp", actv);*/

            // Opcija B: (često “čistije” na Androidu) direktno startuj glavnu Activity
            ((StartsActivity) driver).startActivity(new Activity(pkg, act));
        }
    }

    /**
     * Closes driver
     */
    public static void teardown() {
        //close the app
        driver.quit();
    }

    /**
     * Closes application
     */
    public static void closeApp() {
        driver.closeApp();
    }

    /**
     * Start application
     */
    public static void launchApp() {
        driver.launchApp();
    }

    /**
     * Reset application
     */
    public static void resetApp() {
        driver.resetApp();
    }

    /**
     * Navigation button back
     */
    public static void back() {
        driver.navigate().back();
    }
    //endregion - Managing driver -

    //region - AppiumServerJava class -
    /**
     * Class for communication with Appium server
     */
    public static class AppiumServerJava {

        private AppiumDriverLocalService service;
        private AppiumServiceBuilder builder;
        private DesiredCapabilities cap;

        /**
         * Starts Appium server
         */
        public void startServer() {
            //Set Capabilities
            cap = new DesiredCapabilities();
            cap.setCapability("noReset", "false");
            //Build the Appium service
            builder = new AppiumServiceBuilder();
            builder.withIPAddress("127.0.0.1");
            builder.usingPort(4723);
            builder.withCapabilities(cap);
            builder.withArgument(GeneralServerFlag.SESSION_OVERRIDE);
            builder.withArgument(GeneralServerFlag.LOG_LEVEL, "info");
            String appium_info = getDataFromFileConf("1", "APPIUM_INFO");
            if (appium_info.equals("ON")) {
                builder.withLogFile(new File("./logs/appium.log"));
            }
            //full path to the main.js
            builder.withAppiumJS(new File(getDataFromConfEnvironment("1", "MAIN_JS")));
            //Start the server with the builder
            service = AppiumDriverLocalService.buildService(builder);
            service.start();

        }

        /**
         * Stop Appium server
         */
        public void stopServer() {
            service.stop();
        }

        /**
         * Check status Appium server
         * @param port Port of Appium server
         * @return true - Running, false - not running
         */
        public boolean checkIfServerIsRunnning(int port) {

            boolean isServerRunning = false;
            ServerSocket serverSocket;
            try {
                serverSocket = new ServerSocket(port);
                serverSocket.close();
            } catch (IOException e) {
                //If control comes here, then it means that the port is in use
                isServerRunning = true;
            } finally {
                serverSocket = null;
            }
            return isServerRunning;
        }
    }
    //endregion - AppiumServerJava class -

}
