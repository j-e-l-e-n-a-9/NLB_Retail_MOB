package si.nlb.testautomation.NLBMobileAutomation.Action;

import io.appium.java_client.AppiumDriver;
import io.appium.java_client.MobileBy;
import io.appium.java_client.MobileElement;
import io.appium.java_client.touch.WaitOptions;
import io.appium.java_client.touch.offset.PointOption;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.interactions.PointerInput;
import org.openqa.selenium.interactions.Sequence;
import org.openqa.selenium.interactions.touch.TouchActions;
import org.openqa.selenium.support.ui.Wait;
import si.nlb.testautomation.NLBMobileAutomation.Data.DataManager;
import si.nlb.testautomation.NLBMobileAutomation.Selectors.SelectById;
import si.nlb.testautomation.NLBMobileAutomation.Core.Base;
import si.nlb.testautomation.NLBMobileAutomation.Helpers.Log;
import si.nlb.testautomation.NLBMobileAutomation.Selectors.SelectByXpath;
import si.nlb.testautomation.NLBMobileAutomation.Test.Hooks;
import si.nlb.testautomation.NLBMobileAutomation.Wait.WaitHelpers;

import io.appium.java_client.TouchAction;
import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.android.nativekey.AndroidKey;
import io.appium.java_client.android.nativekey.KeyEvent;
import io.appium.java_client.android.nativekey.KeyEventMetaModifier;

import org.junit.Assert;
import org.openqa.selenium.*;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;

import static io.appium.java_client.touch.WaitOptions.waitOptions;
import static io.appium.java_client.touch.offset.PointOption.point;
import static java.time.Duration.ofMillis;
import static org.junit.Assert.assertTrue;
import static si.nlb.testautomation.NLBMobileAutomation.Core.Base.driver;

/**
 * Class with common methods for click, swipe, scroll, enter text to element.
 */
public class ActionApiHelpers {
    //region - Parameters -
    SelectById d = new SelectById();
    Base b = new Base();
    private static final Map<Character, AndroidKey> KEY_MAP = new HashMap<>();

    public static String getTodayDateInFormat(String format) {
        String dateInString = new SimpleDateFormat(format).format(new Date());
        return dateInString;
    }

    public static boolean isElementDisplayedCustom(By xPath, int cycle, int sleepTime) throws InterruptedException {
        for (int i = 1; i <= cycle; i = i + 1) {
            try {
                MobileElement element = (MobileElement) driver.findElement(xPath);
                boolean displayed = element.isDisplayed();

                if (displayed) {
                    Log.info("!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Element: " + xPath.toString() + " is visible !!!!!!!!!!!!!!!!!!!!!!!!!");
                    return true;
                }
            } catch (java.util.NoSuchElementException |org.openqa.selenium.NoSuchElementException e) {

            }
            Thread.sleep(sleepTime);
        }
        return false;
    }

    //endregion - Parameters -

    //region - Driver -
    /**
     * Unlock device
     * @throws InterruptedException
     */
    public void unlockIfDeviceIsLocked() throws InterruptedException {
        Thread.sleep(3000);
        if (Base.testPlatform.equals("Android")) {
            if (((AndroidDriver) driver).isDeviceLocked())
                ((AndroidDriver) driver).unlockDevice();
        }
        if (Base.testPlatform.equals("iOS")) {
        }
    }

    /**
     * Open mobile application
     * @throws Throwable
     */
    public void goToApp() throws Throwable {
        unlockIfDeviceIsLocked();
        //Thread.sleep(5000);
    }

    /**
     * Press key for android
     * @param array Char array of string should be pressed or type
     */
    public void pressKey(Character[] array) throws InterruptedException {
        //Thread.sleep(3000);
        for (char c : array) {
            //Thread.sleep(3000);
            switch (c) {
                case 'A':
                case 'a': {
                    ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.A));
                    break;
                }
                case 'B':
                case 'b': {
                    ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.B));
                    break;
                }
                case 'C':
                case 'c': {
                    ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.C));
                    break;
                }
                case 'D':
                case 'd': {
                    ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.D));
                    break;
                }
                case 'E':
                case 'e': {
                    ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.E));
                    break;
                }
                case 'F':
                case 'f': {
                    ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.F));
                    break;
                }
                case 'G':
                case 'g': {
                    ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.G));
                    break;
                }
                case 'H':
                case 'h': {
                    ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.H));
                    break;
                }
                case 'I':
                case 'i': {
                    ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.I));
                    break;
                }
                case 'J':
                case 'j': {
                    ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.J));
                    break;
                }
                case 'K':
                case 'k': {
                    ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.K));
                    break;
                }
                case 'L':
                case 'l': {
                    ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.L));
                    break;
                }
                case 'M':
                case 'm': {
                    ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.M));
                    break;
                }
                case 'N':
                case 'n': {
                    ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.N));
                    break;
                }
                case 'O':
                case 'o': {
                    ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.O));
                    break;
                }
                case 'P':
                case 'p': {
                    ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.P));
                    break;
                }
                case 'Q':
                case 'q': {
                    ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.Q));
                    break;
                }
                case 'R':
                case 'r': {
                    ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.R));
                    break;
                }
                case 'S':
                case 's': {
                    ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.S));
                    break;
                }
                case 'T':
                case 't': {
                    ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.T));
                    break;
                }
                case 'U':
                case 'u': {
                    ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.U));
                    break;
                }
                case 'V':
                case 'v': {
                    ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.V));
                    break;
                }
                case 'W':
                case 'w': {
                    ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.W));
                    break;
                }
                case 'X':
                case 'x': {
                    ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.X));
                    break;
                }
                case 'Y':
                case 'y': {
                    ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.Y));
                    break;
                }
                case 'Z':
                case 'z': {
                    ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.Z));
                    break;
                }
                case '0': {
                    ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.DIGIT_0));
                    break;
                }
                case '1': {
                    ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.DIGIT_1));
                    break;
                }
                case '2': {
                    ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.DIGIT_2));
                    break;
                }
                case '3': {
                    ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.DIGIT_3));
                    break;
                }
                case '4': {
                    ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.DIGIT_4));
                    break;
                }
                case '5': {
                    ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.DIGIT_5));
                    break;
                }
                case '6': {
                    ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.DIGIT_6));
                    break;
                }
                case '7': {
                    ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.DIGIT_7));
                    break;
                }
                case '8': {
                    ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.DIGIT_8));
                    break;
                }
                case '9': {
                    ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.DIGIT_9));
                    break;
                }
                case '.': {
                    ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.PERIOD));
                    break;
                }
                case ',': {
                    ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.COMMA));
                    break;
                }
                case ' ': {
                    ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.SPACE));
                    break;
                }
            }
        }
    }
    //endregion - Driver -

    //region - Click element -
    /**
     * Click on by Element with text to log, timeout wait and sleep time
     * @param xpath By element to click on
     * @param text Text for log
     * @param timeOut Timeout in seconds
     * @param sleepTime Sleep time wait for object
     * @throws Exception or StaleElementReferenceException
     */
    public void clickElement(By xpath, String text, int timeOut, long sleepTime) throws Exception {
        Base.waitVar = new WebDriverWait(driver, timeOut);
        boolean elementPresent = Base.waitVar.until(ExpectedConditions.elementToBeClickable(xpath)).isEnabled();
        try {
            if (elementPresent) {
                Thread.sleep(sleepTime);
                driver.findElement(xpath).click();
                Log.info("!!!!!!!!!!!!!!!!!!!!!!!!! Tap on " + text + " !!!!!!!!!!!!!!!!!!!!!!!!!");
            }
        } catch (StaleElementReferenceException elementUpdated) {
            driver.findElement(xpath);
            driver.findElement(xpath).click();
        } catch (Exception e) {
            System.out.println("Exception! - could not click on link: " + e.toString());
            throw (e);
        }
        Thread.sleep(sleepTime);
    }

    /**
     * Click on By Element with text to log
     * @param xpath By element to click
     * @param text Text for log
     * @throws Exception
     */
    public void clickElement(By xpath, String text) throws Exception {
        WaitHelpers.waitForElement(xpath);
        //int timeOut = 30;
        //long sleepTime = 3000;
        int timeOut = 0;
        long sleepTime = 0;
        clickElement(xpath, text,timeOut,sleepTime);
    }

    /**
     * Click on By element
     * @param xpath By element for click on
     * @throws Exception
     */
    public void clickElement(By xpath) throws Exception {
        WaitHelpers.waitForElement(xpath);
        //int timeOut = 30;
        //long sleepTime = 1000;
        int timeOut = 0;
        long sleepTime = 0;
        clickElement(xpath, xpath.toString(),timeOut,sleepTime);
    }

    /**
     * Click on By element fast
     * @param xpath By element for click on
     * @throws Exception
     */
    public void clickElementFast(By xpath) throws Exception {
        int timeOut = 30;
        long sleepTime = 500;
        clickElement(xpath, xpath.toString(),timeOut,sleepTime);
    }

    public static void ClickOnElement(MobileElement element) throws Throwable {
        WaitHelpers.WaitForElement(element,"element");
        try{
            if (isClickable(element)) {
                //Thread.sleep(1800);
                element.click();
                Log.info("!!!!!!!!!!!!!!!!!!!!!! Clicked on the WebElement: " + element.toString() + " successfully.!!!!!!!!!!!!!!!!!!!!!!!!");
            }
        }
        catch (StaleElementReferenceException elementUpdated) {
            //Thread.sleep(3600);
            element.click();
        } catch (Exception e) {
            Log.error("Exception! - could not click on element: " + e.toString());
            throw (e);
        }
        //Thread.sleep(5000);

    }

    private static boolean isClickable(MobileElement element) throws InterruptedException {
        return isClickable(element, 5, 10, 500);
    }

    public static boolean isClickable(WebElement element, int cycle, long timeOut, long sleepTime) throws InterruptedException {
        for (int i = 1; i <= cycle; i = i + 1) {
            try {
                Base.waitVar = new WebDriverWait(Base.driver, timeOut);
                Base.waitVar.until(ExpectedConditions.elementToBeClickable(element)).isEnabled();
                return true;

            } catch (Exception e) { }
            Thread.sleep(sleepTime);
        }
        return false;
    }
    //endregion - Click element -

    //region - Element is present -
    /**
     * Check if element is displayed
     * @param xpath By element for checking
     * @param cycle Number of cycles for check
     * @param sleepTime Time wait for element in milliseconds
     * @return Boolean true - element is displayed, false - element is not displayed
     * @throws Throwable
     */
    public boolean isElementDisplayed(By xpath, int cycle, long sleepTime) throws Throwable {
        for (int i = 1; i <= cycle; i = i + 1) {
            try {
                WebElement element = driver.findElement(xpath);
                boolean displayed = element.isDisplayed();
                if (displayed) {
                    return true;
                }
            } catch (NoSuchElementException e) {

            }
            Thread.sleep(sleepTime);
        }
        return false;
    }

    /**
     * Check if element is displayed. Overloaded method with default values for waiting
     * @param xpath By element for checking
     * @return Boolean true - element is displayed, false - element is not displayed
     * @throws Throwable
     */
    public boolean isElementDisplayed(By xpath) throws Throwable {
        int cycle = 15;
        long sleepTime = 1000;
        return isElementDisplayed(xpath, cycle, sleepTime);
    }

    /**
     * Check if element is displayed. Overloaded method with default values for waiting
     * Time for wait is short
     * @param xpath By element for checking
     * @return Boolean true - element is displayed, false - element is not displayed
     * @throws Throwable
     */
    public boolean isElementDisplayedShortly(By xpath) throws Throwable {
        int cycle = 5;
        long sleepTime = 50;
        return isElementDisplayed(xpath, cycle, sleepTime);
    }

    /**
     * Check if element is enabled
     * @param xpath By element for checking
     * @param cycle Number of cycles for check
     * @param sleepTime Time wait for element in milliseconds
     * @return Boolean true - element is enabled, false - element is not enabled
     * @throws Throwable
     */
    public boolean isElementEnabled(By xpath, int cycle, long sleepTime) throws Throwable {
        for (int i = 1; i <= cycle; i = i + 1) {
            try {
                WebElement element = driver.findElement(xpath);
                boolean displayed = element.isEnabled();
                if (displayed) {
                    return true;
                }
            } catch (NoSuchElementException e) {

            }
            Thread.sleep(sleepTime);
        }
        return false;
    }

    /**
     * Check if element is enabled. Overloaded method with default values for waiting
     * @param xpath By element for checking
     * @return Boolean true - element is displayed, false - element is not displayed
     * @throws Throwable
     */
    public boolean isElementEnabled(By xpath) throws Throwable {
        int cycle = 15;
        long sleepTime = 1000;
        return isElementEnabled(xpath, cycle, sleepTime);
    }

    /**
     * Check if element doesn't exists
     * @param element By element for check
     * @return true - element is not present, false - element is present
     */
    public boolean isElementNotPresent(By element) {
        try {
            driver.findElement(element);
            return false;
        } catch (java.util.NoSuchElementException | org.openqa.selenium.NoSuchElementException e) {
            return true;
        }
    }
    //endregion - Element is present -

    //region - Swipe -
    /**
     * Base method for horizontal swipe, from start percentage of screen to end percentage of the screen.
     * @param startPercentage Starting percentage of screen.
     * @param endPercentage Ending percentage of the screen.
     * @param anchorPercentage Anchor percentage.
     */
    public void horizontalSwipeByPercentage(double startPercentage, double endPercentage, double anchorPercentage) {
        Dimension size = driver.manage().window().getSize();
        int anchor = (int) (size.height * anchorPercentage);
        int startPoint = (int) (size.width * startPercentage);
        int endPoint = (int) (size.width * endPercentage);
        new TouchAction(driver)
                .press(point(startPoint, anchor))
                .waitAction(waitOptions(ofMillis(3000)))
                .moveTo(point(endPoint, anchor))
                .release().perform();
    }

    public void swipeByCordinates(int startX, int startY, int endX, int endY){
        if(Base.getDataFromFileConf(Hooks.rowinConfExcel,"DEVICE_NAME").contains("HUAWEI")){
            PointerInput finger = new PointerInput(PointerInput.Kind.TOUCH, "finger");
            Sequence swipe = new Sequence(finger, 1);

            swipe.addAction(finger.createPointerMove(Duration.ZERO, PointerInput.Origin.viewport(), startX, startY));
            swipe.addAction(finger.createPointerDown(PointerInput.MouseButton.LEFT.asArg()));
            swipe.addAction(finger.createPointerMove(Duration.ofMillis(700), PointerInput.Origin.viewport(), endX, endY));
            swipe.addAction(finger.createPointerUp(PointerInput.MouseButton.LEFT.asArg()));

            driver.perform(Arrays.asList(swipe));
        } else {
            //new TouchAction(driver).press(point(startX,startY)).waitAction(waitOptions(ofMillis(1000))).moveTo(point(endX,endY)).release().perform();
            /*Integer speedPxPerSec = 2500;
            Map<String, Object> args = new HashMap<>();
            args.put("startX", startX);
            args.put("startY", startY);
            args.put("endX", endX);
            args.put("endY", endY);
            if (speedPxPerSec != null) { // opciono
                args.put("speed", speedPxPerSec); // px/s
            }
            ((JavascriptExecutor) driver).executeScript("mobile: dragGesture", args);*/
            long preMovePx = 30;
            long preMoveMs = 30;
            long moveMs = 2500;
            PointerInput finger = new PointerInput(PointerInput.Kind.TOUCH, "finger1");
            Sequence seq = new Sequence(finger, 1);

            // Down
            seq.addAction(finger.createPointerMove(Duration.ZERO, PointerInput.Origin.viewport(), startX, startY));
            seq.addAction(finger.createPointerDown(PointerInput.MouseButton.LEFT.asArg()));

            // Anti-tap: odmah mali pomak (npr. 30px) u smeru skrola
            int dx = (endX - startX);
            int dy = (endY - startY);
            double len = Math.hypot(dx, dy);
            int preX = startX + (int) Math.round(dx * (preMovePx / Math.max(1.0, len)));
            int preY = startY + (int) Math.round(dy * (preMovePx / Math.max(1.0, len)));

            seq.addAction(finger.createPointerMove(Duration.ofMillis(preMoveMs), PointerInput.Origin.viewport(), preX, preY));

            // Glavni potez
            seq.addAction(finger.createPointerMove(Duration.ofMillis(moveMs), PointerInput.Origin.viewport(), endX, endY));
            seq.addAction(finger.createPointerUp(PointerInput.MouseButton.LEFT.asArg()));

            driver.perform(Collections.singletonList(seq));
        }
    }

    /**
     * Method for horizontal swipe, from start percentage of screen to end percentage of the screen, with waiting and
     * logging
     * @param startPercentage Starting percentage of screen.
     * @param endPercentage Ending percentage of the screen.
     * @param anchorPercentage Anchor percentage.
     * @throws Throwable forwarded error from horizontalSwipeByPercentage
     */
    public void swipeHorizontal(double startPercentage, double endPercentage, double anchorPercentage) throws Throwable {
        Thread.sleep(2000);
        horizontalSwipeByPercentage(startPercentage, endPercentage, anchorPercentage);
        Log.info("!!!!!!!!!!!!!!!!!!!!!!!!! Swipe !!!!!!!!!!!!!!!!!!!!!!!!!");
    }

    /**
     * Default method for horizontal swipe, with default parameters for weipe
     * @throws Throwable forwarded error from horizontalSwipeByPercentage
     */
    public void swipeHorizontal() throws Throwable {
        double startPercentage = 0.80;
        double endPercentage = 0.1;
        double anchorPercentage = 0.2;
        Thread.sleep(2000);
        horizontalSwipeByPercentage(startPercentage, endPercentage, anchorPercentage);
        Log.info("!!!!!!!!!!!!!!!!!!!!!!!!! Swipe !!!!!!!!!!!!!!!!!!!!!!!!!");
    }

    /**
     * Base method for vertical swipe, from start percentage of screen to end percentage of the screen.
     * @param startPercentage Starting percentage of screen.
     * @param endPercentage Ending percentage of the screen.
     * @param anchorPercentage Anchor percentage.
     */
    public void verticalSwipeByPercentage(double anchorPercentage, double startPercentage, double endPercentage) throws InterruptedException {
        Thread.sleep(2000);
        Dimension size = driver.manage().window().getSize();
        int anchor = (int) (size.width/100 * anchorPercentage);
        int startPoint = (int) (size.height/100 * startPercentage);
        int endPoint = (int) (size.height/100 * endPercentage);
        new TouchAction(driver)
                .press(point(anchor, startPoint))
                .waitAction(waitOptions(ofMillis(3000)))
                .moveTo(point(anchor, endPoint))
                .release().perform();
    }

    public void verticalSwipeByPercentageAndAssert(double anchorPercentage, double startPercentage, double endPercentage) throws Throwable {
        Thread.sleep(2000);
        Dimension size = driver.manage().window().getSize();
        int anchor = (int) (size.width/100 * anchorPercentage);
        int startPoint = (int) (size.height/100 * startPercentage);
        int endPoint = (int) (size.height/100 * endPercentage);
        new TouchAction(driver)
                .press(point(anchor, startPoint))
                .waitAction(waitOptions(ofMillis(3000)))
                .moveTo(point(anchor, endPoint))
                .release().perform();
        By element = d.createElementById("progressBar");
        assertElementDisplayed(element);
    }

    /**
     * Method for vertical swipe, from start percentage of screen to end percentage of the screen, with waiting and
     * logging
     * @param startPercentage Starting percentage of screen.
     * @param endPercentage Ending percentage of the screen.
     * @param anchorPercentage Anchor percentage.
     * @throws Throwable forwarded error from verticalSwipeByPercentage
     */
    public void swipeVertical(double startPercentage, double endPercentage, double anchorPercentage) throws Throwable {
        Thread.sleep(2000);
        verticalSwipeByPercentage(startPercentage, endPercentage, anchorPercentage);
        Log.info("!!!!!!!!!!!!!!!!!!!!!!!!! Swipe !!!!!!!!!!!!!!!!!!!!!!!!!");
    }

    /**
     * Default method for vertical swipe, with default parameters for weipe
     * @throws Throwable forwarded error from verticalSwipeByPercentage
     */
    public void swipeVertical() throws Throwable {
        double startPercentage = 0.80;
        double endPercentage = 0.1;
        double anchorPercentage = 0.2;
        Thread.sleep(2000);
        horizontalSwipeByPercentage(startPercentage, endPercentage, anchorPercentage);
        Log.info("!!!!!!!!!!!!!!!!!!!!!!!!! Swipe !!!!!!!!!!!!!!!!!!!!!!!!!");
    }

    /**
     * This method swipes until MobileElement with defined text is visible and returns the MobileElement.
     * @param text Element text
     * @return MobileElement
     */
    public MobileElement swipeMobileElementIntoViewByTextAndReturnElement(String text){
        MobileElement element = (MobileElement) driver.findElement(MobileBy.AndroidUIAutomator("new UiScrollable(new UiSelector().scrollable(true))" + ".scrollIntoView(new UiSelector().textContains(\"" + text +"\"))"));
        return element;
    }

    /**
     * This method swipes until MobileElement with defined text is visible.
     * @param text Element text
     */
    public void swipeMobileElementIntoViewByText(String text){
        MobileElement element = (MobileElement) driver.findElement(MobileBy.AndroidUIAutomator("new UiScrollable(new UiSelector().scrollable(true))" + ".scrollIntoView(new UiSelector().textContains(\"" + text +"\"))"));
    }
    //endregion - Swipe -

    //region - Scroll -
    /**
     * Base method for scrolling to element. Element is sent as parameter @element, direction is string "down" or "up"
     * sleep time is idle time, cycles is how many times tries to find element.
     * @param element Element for searching.
     * @param direction Direction to searching, up or down.
     * @param sleepTime Idle time wor waiting.
     * @param cycles Number of times to try searching.
     * @throws InterruptedException
     */
    public void scrollIntoView(By element, String direction, long sleepTime, int cycles) throws InterruptedException {
        Thread.sleep(sleepTime);
        if (Base.testPlatform.equals("iOS")) {
            for (int i = 1; i <= cycles; i = i + 1) {
                if (driver.findElement(element).isDisplayed()) {
                    break;
                } else {
                    JavascriptExecutor js = driver;
                    HashMap scrollObject = new HashMap();
                    scrollObject.put("direction", direction);
                    js.executeScript("mobile: scroll", scrollObject);
                }
            }
        }
    }


    public void scrollIntoViewDownVertical(By element, long sleepTime, int cycles) throws InterruptedException {
        Thread.sleep(sleepTime);
        if (Base.testPlatform.equals("iOS")) {
            try {
                for (int i = 1; i <= cycles; i = i + 1) {
                  //  String pageSource = driver.getPageSource();
                    if (driver.findElement(element).getAttribute("visible").equals("true")) {
                        break;
                    }
                    else{
                        verticalSwipeByPercentage(50, 80, 40);
                    }
                }
            }
            catch(Exception e){
                Log.error("!!!!!Element does not exist so scroll into view failed!!!!!!!");
            }
        }
    }

    public void scrollIntoViewUpVertical(By element, long sleepTime, int cycles) throws InterruptedException {
        Thread.sleep(sleepTime);
        if (Base.testPlatform.equals("iOS")) {
            try {
                for (int i = 1; i <= cycles; i = i + 1) {
                    //  String pageSource = driver.getPageSource();
                    if (driver.findElement(element).getAttribute("visible").equals("true")) {
                        break;
                    }
                    else{
                        verticalSwipeByPercentage(50, 40, 80);
                    }
                }
            }
            catch(Exception e){
                Log.error("!!!!!Element does not exist so scroll into view failed!!!!!!!");
            }
        }
    }

    public void scrollIntoViewDownVertical(By element) throws InterruptedException {
        long sleepTime = 1000;
        int cycles = 30;
        scrollIntoViewDownVertical(element, sleepTime, cycles);
    }

    public void scrollIntoViewUpVertical(By element) throws InterruptedException {
        long sleepTime = 1000;
        int cycles = 30;
        scrollIntoViewUpVertical(element, sleepTime, cycles);
    }



    /**
     * Method for scrolling to element. Element is sent as parameter @element, direction is string "down" or "up".
     * @param element Element for searching.
     * @param direction Direction to searching, up or down.
     * @throws InterruptedException forwarded from scrollIntoView
     */
    public void scrollIntoView(By element, String direction) throws InterruptedException {
        long sleepTime = 500;
        int cycles = 30;
        scrollIntoView(element, direction, sleepTime, cycles);
    }

    /**
     * Simple method for scrolling down to element. Element is sent as parameter @element.
     * @param element Element for search.
     * @throws InterruptedException forwarded from scrollIntoView
     */
    public void scrollIntoViewDown(By element) throws InterruptedException {
        long sleepTime = 500;
        int cycles = 30;
        String direction = "down";
        scrollIntoView(element, direction, sleepTime, cycles);
    }

    /**
     * Simple method for scrolling up to element. Element is sent as parameter @element.
     * @param element Element for search.
     * @throws InterruptedException forwarded from scrollIntoView
     */
    public void scrollIntoViewUp(By element) throws InterruptedException {
        long sleepTime = 500;
        int cycles = 30;
        String direction = "up";
        scrollIntoView(element, direction, sleepTime, cycles);
    }
    //endregion - Scroll -

    //region - Text to element -
    /**
     * Clears text content in element
     * @param element WebElement for clearing content.
     * @throws InterruptedException
     */
    public static void clearInputField(WebElement element) throws InterruptedException {
        Thread.sleep(600);
        element.clear();
    }

    /**
     * Enter text content from parameter @text to element which will be found with By object in parameter @element.
     * @param text Text content to enter.
     * @param element By object for creating WebElement
     * @throws InterruptedException
     */
    public void enterTextToElement(String text, By element) throws InterruptedException {
        WebElement el = driver.findElement(element);
        clearInputField(el);
        el.sendKeys(text);
        Log.info("!!!!!!!!! Enter text: " + text + " !!!!!!!!!!");
        Thread.sleep(1000);
    }

    /**
     * Add text content from parameter @text to element which will be found with By object in parameter @element.
     * @param text Text content to add.
     * @param element By object for creating WebElement
     * @throws InterruptedException
     */
    public void addTextToElement(String text, By element) throws InterruptedException {
        WebElement el = driver.findElement(element);
        clearInputField(el);
        el.sendKeys(text);
        Log.info("!!!!!!!!! Enter text: " + text + " !!!!!!!!!!");
        Thread.sleep(1000);
    }

    /**
     * Enter text content from parameter @text to element which will be found with By object in parameter @element.
     * Before entering text clicks on element.
     * @param text Text content to enter.
     * @param element By object for creating WebElement
     * @throws InterruptedException
     */
    public void enterTextToElementWithClick(String text, By element) throws Throwable {
        WaitHelpers.waitForElement(element, 30);
        Assert.assertTrue(isElementDisplayed(element));
        clickElement(element);
        WebElement el = driver.findElement(element);
        clearInputField(el);
        el.sendKeys(text);
        Log.info("!!!!!!!!! Enter text: " + text + " !!!!!!!!!!");
        Thread.sleep(1000);
        driver.hideKeyboard();
    }

    public void enterTextToMobileElement(String text, By element){
        WaitHelpers.waitForElement(element, 30);
        MobileElement el = (MobileElement) driver.findElement(element);
        CharSequence sequence = text;
        el.sendKeys(sequence);
    }

    public void enterTextToMobileElementWithClear(String text, By element) throws InterruptedException {
        WaitHelpers.waitForElement(element, 30);
        MobileElement el = (MobileElement) driver.findElement(element);
        el.sendKeys(Keys.chord(Keys.CONTROL,"a"));
        el.sendKeys(Keys.chord(Keys.DELETE));
        CharSequence sequence = text;
        el.sendKeys(sequence);
    }
    //endregion - Text to element -

    //region - Get Attribute -
    public Object getAttribute(By by, String attribute){
        return driver.findElement(by).getAttribute(attribute);
    }
    //endregion - Get Attribute -

    //region - Element utils -
    /**
     * Hiding keyboard
     * @throws Throwable
     */
    public void hideKeyboard() throws Throwable {
        if (Base.testPlatform.equals("iOS")) {
            //if(Base.testVer.equals("14.2")) {
            //IOSDriver< WebElement> AD= (IOSDriver) Base.driver;
            //AD.getKeyboard().sendKeys(Keys.RETURN); //THIS WORK FINE
            //Base.driver.hideKeyboard(HideKeyboardStrategy.PRESS_KEY,"Done");
            //Base.driver.executeScript("mobile: performEditorAction", ImmutableMap.of("action","Done"));
            //Base.driver.executeScript("mobile: pressButton", ImmutableMap.of("name","Done"));
            //Base.driver.hideKeyboard();
            try {
                By element = d.createElementById("Done");
                driver.findElement(element).click();
            } catch (Exception e) {
                clickByPercentage(0.94, 0.64);
                Log.info("Button Done not visible");
            }
            // }
            //else click_on_element_by_id("Toolbar Done Button");
        }
        if (Base.testPlatform.equals("Android")) {
            Base.back();
        }
    }

    /**
     * Click and move by percentage
     * @param startPercentage Starting percentage
     * @param anchorPercentage Anchor percentage
     * @throws InterruptedException
     */
    public void clickByPercentage(double startPercentage, double anchorPercentage) throws InterruptedException {
        Dimension size = driver.manage().window().getSize();
        Thread.sleep(500);
        int anchor = (int) (size.height * anchorPercentage/100);
        int startPoint = (int) (size.width * startPercentage/100);
        new TouchAction(driver)
                .press(point(startPoint, anchor))
                .release().perform();
    }

    /**
     * Returns Point object with coordinates
     * @param by By object of element for searching.
     * @return Point object
     */
    public Point getCoordinates(By by) {
        WebElement element = driver.findElement(by);
        Point classname = element.getLocation();
        int x_coordinate = classname.getX();
        System.out.println("Element's Position from left side: " + x_coordinate + " pixels.");
        int y_coordinate = classname.getY();
        System.out.println("Element's Position from top: " + y_coordinate + " pixels.");
        return classname;
    }

    /**
     * Click on element with offset
     * @param element By element for searching.
     * @param offsetX Offset x coordinate.
     * @param offsetY Offset y coordinate.
     */
    public void clickOnElementWithOffset(By element, double offsetX, double offsetY) {
        Point location = getCoordinates(element);
        Dimension size = driver.manage().window().getSize();
        int x = location.getX();
        int y = location.getY();
        int width = size.getWidth();
        double width1 = width / 100;
        int height = size.getHeight();
        double height1 = height / 100;
        int new_x = (int) ((width1 * offsetX) + x);
        int new_y = (int) ((height1 * offsetY) + y);
        Log.info("Click on point x: " + new_x + " ,y: " + new_y);
        TouchAction touchAction = new TouchAction(driver);
        touchAction.tap(point(new_x, new_y)).perform();
    }

    public void clickOnElementByCoordinates(int offsetX, int offsetY) {
        PointerInput finger = new PointerInput(PointerInput.Kind.TOUCH, "finger");
        Sequence clickPosition = new Sequence(finger, 1);
        clickPosition.addAction(finger.createPointerMove(Duration.ZERO, PointerInput.Origin.viewport(), offsetX, offsetY)).addAction(finger.createPointerDown(PointerInput.MouseButton.LEFT.asArg())).addAction(finger.createPointerUp(PointerInput.MouseButton.LEFT.asArg()));
        driver.perform(Arrays.asList(clickPosition));
    }


    /**
     * Returns text from element
     * @param element By element for searching
     * @return String - text from element
     */
    public String GetTextFromElement(By element) {
        String value = null;
        WaitHelpers.waitForElement(element, 20);
        if (Base.testPlatform.equals("Android")) {
            value = driver.findElement(element).getAttribute("text");
        }
        if (Base.testPlatform.equals("iOS")) {
            value = driver.findElement(element).getAttribute("name");
        }
        return value.trim();
    }

    /**
     * Checks if text content of element is empty.
     * @param element By element for searching.
     */
    public void elementIsEmpty(By element) {
        String value  = GetTextFromElement(element);
        if(value.isEmpty()){
            Log.info("!!!!!!! Field: "+element.toString()+" is empty !!!!!!!!");
        }
        else
            Log.error("!!!!!!! Field: "+element.toString()+" is NOT empty !!!!!!!!");
        assertTrue(GetTextFromElement(element).isEmpty());
    }
    //endregion - Element utils -

    //region - Assert -
    /**
     * Asserts if element is displayed-
     * @param element By element to search.
     * @throws Throwable
     */
    public void assertElementDisplayed(By element) throws Throwable {
        if (isElementDisplayed(element)) {
            Log.info("!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Widget with text: " + element.toString() + " is visible !!!!!!!!!!!!!!!!!!!!!!!!!");
        } else {
            Log.error("!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Widget with text: " + element.toString() + " is not visible !!!!!!!!!!!!!!!!!!!!!!!!!");
            Assert.assertTrue(isElementDisplayed(element));
        }
    }

    /**
     * Asserts if element is displayed-
     * @param element By element to search.
     * @throws Throwable
     */
    public void assertElementEnabled(By element) throws Throwable {
        if (isElementEnabled(element)) {
            Log.info("!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Widget with text: " + element.toString() + " is visible !!!!!!!!!!!!!!!!!!!!!!!!!");
        } else {
            Log.error("!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Widget with text: " + element.toString() + " is not visible !!!!!!!!!!!!!!!!!!!!!!!!!");
            Assert.assertTrue(isElementDisplayed(element));
        }
    }

    /**
     * Asserts if attribute checked is true.
     * @param element By element for search.
     * @return Boolean true - checked is true, false - checked is false.
     * @throws Throwable
     */
    public boolean assertIsChecked(By element) throws Throwable {
        boolean result = false;
        Assert.assertTrue(isElementDisplayed(element));
        if (driver.findElement(element).getAttribute("checked").equals("true")) {
            result = true;
        }
        return result;
    }

    /**
     * Asserts if parameter amount1 is equal to parameter amount2. parameters are double. Delta is 0.1
     * @param amount1 Double first parameter
     * @param amount2 Double second parameter
     */
    public void assertEqualDoubleAmounts(double amount1, double amount2) {
        if (amount1 == amount2)
            Log.info("!!!!!!!!!!!Amount is the same: " + amount1 + "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        else
            Log.info("!!!!!!!!!!!Amount is not the same: " + amount1 + ", " +amount2+" !!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        Assert.assertEquals(amount1, amount2, 0.1);
    }

    /**
     * Asserts if parameter amount1 is equal to parameter amount2. parameters are int.
     * @param amount1 long first parameter
     * @param amount2 long second parameter
     */
    public void assertEqualInteger(long amount1, long amount2) {
        if (amount1 == amount2)
            Log.info("!!!!!!!!!!!Amount is the same: " + amount1 + "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        else
            Log.info("!!!!!!!!!!!Amount is not the same: " + amount1 + ", " +amount2+" !!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        Assert.assertEquals(amount1, amount2);
    }
    //endregion - Assert -

    public void saveTheValueToMapBasic(String savedValue, String key){
        DataManager.userObject.put(key,savedValue);
    }

    public void saveTheValueToMapBasic(Object savedValue, String key){
        DataManager.userObject.put(key,savedValue);
    }

    public static String getTodayDatePlusXDays(int x){
        Date dt = new Date();
        Calendar c = Calendar.getInstance();
        c.setTime(dt);
        c.add(Calendar.DATE, x);
        dt = c.getTime();
        String pattern = "dd.MM.YYYY";
        String dateInString = new SimpleDateFormat(pattern).format(dt);
        return dateInString;
    }

    public static String getTodayDatePlusXDaysInFormat(int x, String format){
        Date dt = new Date();
        Calendar c = Calendar.getInstance();
        c.setTime(dt);
        c.add(Calendar.DATE, x);
        dt = c.getTime();
        String dateInString = new SimpleDateFormat(format).format(dt);
        return dateInString;
    }

    public static String getTodayDateMinusXYears(int x, String format){
        Date dt = new Date();
        Calendar c = Calendar.getInstance();
        c.setTime(dt);
        c.add(Calendar.YEAR, -x);
        dt = c.getTime();
        String dateInString = new SimpleDateFormat(format).format(dt);
        return dateInString;
    }

    public static String getTodayDatePlusXDaysYMonthsZYears(int x, int y, int z){
        Date dt = new Date();
        Calendar c = Calendar.getInstance();
        c.setTime(dt);
        c.add(Calendar.DATE, x);
        c.add(Calendar.MONDAY, y);
        c.add(Calendar.YEAR, z);
        dt = c.getTime();
        String pattern = "dd.MM.YYYY";
        String dateInString = new SimpleDateFormat(pattern).format(dt);
        return dateInString;
    }

    public static String getTodayDatePlusXDaysYMonthsZYearsInFormat(int x, int y, int z, String pattern){
        Date dt = new Date();
        Calendar c = Calendar.getInstance();
        c.setTime(dt);
        c.add(Calendar.DATE, x);
        c.add(Calendar.MONDAY, y);
        c.add(Calendar.YEAR, z);
        dt = c.getTime();
        String dateInString = new SimpleDateFormat(pattern).format(dt);
        return dateInString;
    }

    public static String getTodayDate(){
        String pattern = "dd.MM.YYYY";
        String dateInString = new SimpleDateFormat(pattern).format(new Date());
        return dateInString;
    }
    /*
    public static String getTodayDatePlusXDays(int x) {
        Date dt = new Date();
        Calendar c = Calendar.getInstance();
        c.setTime(dt);
        c.add(Calendar.DATE, 1);
        dt = c.getTime();
        String pattern = "dd.MM.YYYY";
        String dateInString = new SimpleDateFormat(pattern).format(dt);
        return dateInString;
    }
    */
    public void clickElementByCordinates(int startX, int startY) {
        //new TouchAction(driver).press(point(startX,startY));
        new TouchAction(driver).tap(point(startX,startY)).perform();
    }

    public List<String> getListOfAllCurrencies() {
        List<String> currencies = new ArrayList<>();
        currencies.add("AUD");
        currencies.add("BAM");
        currencies.add("BGN");
        currencies.add("CAD");
        currencies.add("CHF");
        currencies.add("CZK");
        currencies.add("DKK");
        currencies.add("EUR");
        currencies.add("GBP");
        currencies.add("HUF");
        currencies.add("JPY");
        currencies.add("MKD");
        currencies.add("NOK");
        currencies.add("PLN");
        currencies.add("RSD");
        currencies.add("RUB");
        currencies.add("SEK");
        currencies.add("USD");
        return currencies;
    }

    public void scrollDown(AppiumDriver driver) {
        /*Dimension size = driver.manage().window().getSize();
        int startX = size.width / 2;
        int startY = (int) (size.height * 0.40);
        int endY   = (int) (size.height * 0.10);

        Map<String, Object> args = new HashMap<>();
        args.put("startX", startX);
        args.put("startY", startY);
        args.put("endX", startX);
        args.put("endY", endY);
        args.put("speed", 2500); // px/s (opciono)

        ((JavascriptExecutor) driver).executeScript("mobile: dragGesture", args);*/


        Dimension size = driver.manage().window().getSize();
        int startX = size.width / 2;
        int startY = (int) (size.height * 0.40);
        int endY   = (int) (size.height * 0.10);

        // Anti-tap mikro-pomeraj (npr. 30 px) – odmah nakon down, da ne registruje tap na EditText
        int antiTapPx   = 30;   // po potrebi 20–40
        int antiTapY    = Math.max(endY, startY - antiTapPx); // pomeramo nadole (scroll down)

        Map<String, Object> nudge = new HashMap<>();
        nudge.put("startX", startX);
        nudge.put("startY", startY);
        nudge.put("endX",   startX);
        nudge.put("endY",   antiTapY);
        nudge.put("speed",  800); // sporiji mikro-pomeraj (~anti tap)
        ((JavascriptExecutor) driver).executeScript("mobile: dragGesture", nudge);

        // Glavni potez: od antiTapY do krajnje tačke
        Map<String, Object> main = new HashMap<>();
        main.put("startX", startX);
        main.put("startY", antiTapY);
        main.put("endX",   startX);
        main.put("endY",   endY);
        main.put("speed",  1100); // 600–1200 za “sporiji”, 1500+ za brži
        ((JavascriptExecutor) driver).executeScript("mobile: dragGesture", main);
    }

    public void scrollUp(AppiumDriver driver) {
        Dimension size = driver.manage().window().getSize();
        int startX = size.width / 2;
        int startY = (int) (size.height * 0.20);
        int endY   = (int) (size.height * 0.50);

        Map<String, Object> args = new HashMap<>();
        args.put("startX", startX);
        args.put("startY", startY);
        args.put("endX", startX);
        args.put("endY", endY);
        args.put("speed", 2500); // px/s (opciono)

        ((JavascriptExecutor) driver).executeScript("mobile: dragGesture", args);
    }

    public void scrollByCoordinates(AppiumDriver driver, int x, int startY, int endY) {
        Map<String, Object> args = new HashMap<>();
        args.put("startX", x);
        args.put("startY", startY);
        args.put("endX", x);
        args.put("endY", endY);
        args.put("speed", 2500); // px/s (opciono)

        ((JavascriptExecutor) driver).executeScript("mobile: dragGesture", args);
    }

    public void scrollByCoordinatesHorizontal(AppiumDriver driver, int y, int startX, int endX) {
        Map<String, Object> args = new HashMap<>();
        args.put("startX", startX);
        args.put("startY", y);
        args.put("endX", endX);
        args.put("endY", y);
        args.put("speed", 2500); // px/s (opciono)

        ((JavascriptExecutor) driver).executeScript("mobile: dragGesture", args);
    }

    public String returnDateInAppFormat(String inputDate) {
        DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("dd.MM.yyyy");
        LocalDate date = LocalDate.parse(inputDate, inputFormatter);
        DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("EEEE, MMMM d, yyyy");
        String outputDate = date.format(outputFormatter);
        return outputDate;
    }

    public boolean checkDateIsCurrent(String inputDateStr) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("EEEE, MMMM d, yyyy");

        try{
            Date inputDate = dateFormat.parse(inputDateStr);

            //Get the month of parsed date
            Calendar inputCalendar = Calendar.getInstance();
            inputCalendar.setTime(inputDate);
            int inputMonth = inputCalendar.get(Calendar.MONTH);

            //Get the current month
            Calendar currentCalendar = Calendar.getInstance();
            int currentMonth = currentCalendar.get(Calendar.MONTH);

            //Compare months, if months different return false, if months same return true
            if (inputMonth != currentMonth){
                return false;
            } else {
                return true;
            }
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
    }

    static {
        // Slova
        for (char c = 'a'; c <= 'z'; c++) KEY_MAP.put(c, AndroidKey.valueOf((""+c).toUpperCase()));
        // Brojevi
        KEY_MAP.put('0', AndroidKey.DIGIT_0);
        KEY_MAP.put('1', AndroidKey.DIGIT_1);
        KEY_MAP.put('2', AndroidKey.DIGIT_2);
        KEY_MAP.put('3', AndroidKey.DIGIT_3);
        KEY_MAP.put('4', AndroidKey.DIGIT_4);
        KEY_MAP.put('5', AndroidKey.DIGIT_5);
        KEY_MAP.put('6', AndroidKey.DIGIT_6);
        KEY_MAP.put('7', AndroidKey.DIGIT_7);
        KEY_MAP.put('8', AndroidKey.DIGIT_8);
        KEY_MAP.put('9', AndroidKey.DIGIT_9);

        // Najčešći znakovi
        KEY_MAP.put(' ', AndroidKey.SPACE);
        KEY_MAP.put('.', AndroidKey.PERIOD);
        KEY_MAP.put(',', AndroidKey.COMMA);
        KEY_MAP.put('-', AndroidKey.MINUS);
        KEY_MAP.put('_', AndroidKey.MINUS);          // sa SHIFT
        KEY_MAP.put('@', AndroidKey.AT);
        KEY_MAP.put('/', AndroidKey.SLASH);
        KEY_MAP.put('\\', AndroidKey.BACKSLASH);
        KEY_MAP.put(':', AndroidKey.SEMICOLON);      // sa SHIFT na mnogim rasporedima
        KEY_MAP.put(';', AndroidKey.SEMICOLON);  // često SHIFT+1 -> ali NUMBER_SIGN radi kao '!' na većini IME-ova
        KEY_MAP.put('?', AndroidKey.SLASH);          // sa SHIFT
        KEY_MAP.put('+', AndroidKey.PLUS);
        KEY_MAP.put('=', AndroidKey.EQUALS);
        KEY_MAP.put('"', AndroidKey.APOSTROPHE);     // sa SHIFT
        KEY_MAP.put('\'', AndroidKey.APOSTROPHE);
        KEY_MAP.put('#', AndroidKey.POUND);
        KEY_MAP.put('*', AndroidKey.STAR);
    }

    /** Kuca tekst znak-po-znak koristeći KeyEvent (trigeruje onKey/onTextChanged u appu). */
    public static void typeWithKeyEvents(AndroidDriver<?> driver, WebElement field, String text, long delayMs) {
        // 1) Fokus na polje (otvara IME tastaturu)
        field.click();

        // 2) Opciono: očisti polje “fizički” (Backspace) ako želiš
        // clearFieldWithBackspace(driver, field); // odkomentariši po potrebi

        // 3) Kucaj znak po znak
        for (char ch : text.toCharArray()) {
            boolean upper = Character.isUpperCase(ch);
            char low = Character.toLowerCase(ch);

            AndroidKey key = KEY_MAP.get(low);
            if (key == null) {
                // Ako nema u mapi, probaj direktan sendKeys za taj znak kao fallback
                field.sendKeys(String.valueOf(ch));
            } else {
                KeyEvent evt = new KeyEvent(key);
                if (upper || requiresShift(ch)) {
                    evt = evt.withMetaModifier(KeyEventMetaModifier.SHIFT_ON);
                }
                driver.pressKey(evt);
            }

            // mali delay da app stigne da okine validacije/API pozive
            if (delayMs > 0) {
                try { Thread.sleep(delayMs); } catch (InterruptedException ignored) {}
            }
        }
    }

    /** Detekcija da li simbol tipično zahteva SHIFT (za neke mape iznad). */
    private static boolean requiresShift(char ch) {
        return ch == '_' || ch == ':' || ch == '?' || ch == '"' ;
    }

    /** Primer “fizičkog” čišćenja polja preko BACKSPACE-a (ne koristi setValue/clear). */
    public static void clearFieldWithBackspace(AndroidDriver<?> driver, MobileElement field) {
        // Selektuj sav tekst ako aplikacija podržava; u suprotnom šalji više BACKSPACE pritisaka
        // Ovde samo pošaljemo 50x Backspace kao primer
        for (int i = 0; i < 50; i++) {
            driver.pressKey(new KeyEvent(AndroidKey.DEL));
        }
    }
}