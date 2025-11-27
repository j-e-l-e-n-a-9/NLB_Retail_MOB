package si.nlb.testautomation.NLBMobileAutomation.Action;

import io.appium.java_client.MobileBy;
import io.appium.java_client.MobileElement;
import io.appium.java_client.TouchAction;
import io.appium.java_client.touch.WaitOptions;
import io.appium.java_client.touch.offset.PointOption;
import org.apache.commons.lang3.RandomStringUtils;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Rectangle;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.interactions.Pause;
import org.openqa.selenium.interactions.PointerInput;
import org.openqa.selenium.interactions.Sequence;
import org.openqa.selenium.remote.RemoteWebElement;
import org.openqa.selenium.support.ui.Wait;
import si.nlb.testautomation.NLBMobileAutomation.Core.Base;
import si.nlb.testautomation.NLBMobileAutomation.Data.DataManager;
import si.nlb.testautomation.NLBMobileAutomation.Helpers.Log;
import si.nlb.testautomation.NLBMobileAutomation.Helpers.Utilities;
import si.nlb.testautomation.NLBMobileAutomation.Selectors.SelectById;
import si.nlb.testautomation.NLBMobileAutomation.Selectors.SelectByText;
import si.nlb.testautomation.NLBMobileAutomation.Selectors.SelectByUIAutomator;
import si.nlb.testautomation.NLBMobileAutomation.Selectors.SelectByXpath;
import si.nlb.testautomation.NLBMobileAutomation.Test.Hooks;
import si.nlb.testautomation.NLBMobileAutomation.Wait.WaitHelpers;

import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import java.awt.*;
import java.awt.datatransfer.DataFlavor;
import java.awt.datatransfer.UnsupportedFlavorException;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.*;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.*;
import java.util.List;
import java.util.concurrent.ThreadLocalRandom;

import static java.time.Duration.ofMillis;
import static si.nlb.testautomation.NLBMobileAutomation.Core.Base.driver;

/**
 * Custom methods for click, swipe, scroll, enter text to element
 */
public class RoutineHelper {
    //region - Parameters -
    ActionApiHelpers hp = new ActionApiHelpers();
    SelectById d = new SelectById();
    SelectByText tx = new SelectByText();
    SelectByXpath x = new SelectByXpath();
    SelectByUIAutomator ui = new SelectByUIAutomator();
    //endregion - Parameters -

    //region - Custom enter text to element -
    /**
     * Enters text to specific element. Element is field with index in parameter @index ancestor of element with text
     * @param value String - text to enter.
     * @param index String - index of element in string format, but integer.
     * @param text String - text to search.
     * @throws Throwable Error
     */
    public void enterTextInputSecureFiledPrecedingText(String value, String index, String text) throws Throwable {
        By inputField = x.secureFieldPrecedingText(index, text);
        hp.enterTextToElement(value, inputField);
    }

    /**
     * Enters text to element by id
     * @param value String - text to enter.
     * @param id String - id to search.
     * @throws Throwable Error.
     */
    public void enterTextToElementById(String value, String id) throws Throwable {
        By inputField = d.createElementByResourceId(id);
        hp.isElementDisplayed(inputField);
        hp.enterTextToElement(value, inputField);
    }
    //endregion - Custom enter text to element -

    //region - Click -
    /**
     * Click on specific element - Navigation view
     * @throws Throwable Error
     */
    public void clickNavigationView() throws Throwable {
        String xPath = "//android.widget.ImageButton[@content-desc=\"Navigation View Closed\"]";
        By NavigationView = x.createByXpath(xPath);
        hp.clickElement(NavigationView, "dugmeNavigacije");
    }

    /**
     * Click on element by id
     * @param id String - id for search
     * @throws Throwable Error
     */
    public void clickOnElementById(String id) throws Throwable {
        By element = d.createElementById(id);
        hp.clickElement(element, id);
    }

    /**
     * Click on element by contain text
     * @param text String - text to contain.
     * @throws Throwable Error
     */
    public void clickOnUniqueTextContains(String text) throws Throwable {
        By element = tx.createElementByTextContains(text);
        hp.clickElement(element, text);
    }

    /**
     * Clicks on element with text equals to text in parameter @text
     * @param text String - text for search.
     * @throws Exception Error
     */
    public void clickOnElementByText(String text) throws Exception {
        By element = tx.createElementByText(text);
        hp.clickElement(element, text);
    }

    /**
     * Clicks on element with native id equals to value of parameter @id
     * @param id String - native id.
     * @throws Exception Error
     */
    public void clickOnNativeElementById(String id) throws Exception {
        By element = d.crateNativeElement(id);
        hp.clickElement(element, id);
    }

    /**
     * Click on specific by index.
     * @param index String - index of element.
     * @throws Exception Error
     */
    public void clickOnButtonByIndex(String index) throws Exception {
        String xPath = "(//XCUIElementTypeButton[@name='i'])[" + index + "]";
        By element = x.createByXpath(xPath);
        hp.clickElement(element, "Info button");
    }

    /**
     * Click on specifiv by name
     * @param elementName String - name of the elemnt
     * @throws Exception
     */
    public void clickOnElementByName(String elementName) throws Exception {
        By element = x.createByName(elementName);
        hp.clickElement(element, elementName);
    }

    /**
     * Click on button by name
     * @param elementName String - name of the elemnt
     * @throws Exception
     */
    public void clickOnButtonByName(String elementName) throws Exception {
        //string tag se nije koristio, element se pravio samo na osnovu imena
        String xPath = "//XCUIElementTypeButton[@name='" + elementName + "']";
        By element = x.createByXpath(xPath);
        hp.clickElement(element, elementName);
    }

    /**
     * Clicks on element by static text.
     * @param text String - static text.
     * @throws Throwable Error
     */
    public void clickOnStaticTextElementByText(String text) throws Throwable {
        By element = tx.createElementByStaticText(text);
        WaitHelpers.waitForElement(element, 30);
        if (hp.isElementDisplayed(element)) {
            hp.clickElement(element, text);
            Log.info("!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Element with text: " + text + " is visible !!!!!!!!!!!!!!!!!!!!!!!!!");
        } else {
            Log.error("!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Element with text: " + text + " is not visible !!!!!!!!!!!!!!!!!!!!!!!!!");
            Assert.assertTrue(hp.isElementDisplayed(element));
        }
    }

    public void clickOnMoreElementInAccount(String account) throws Exception {
        String xpath = "//XCUIElementTypeStaticText[@name=\"" + account +"\"]\n" +
                "//following-sibling::*[@name='more']";
        By element = x.createByXpath(xpath);
        hp.clickElement(element);
    }
    //endregion - Click -

    //region - Custom asserts -

    public void assertElementByName(String elementName) throws Throwable {
        By element = x.createByName(elementName);
        boolean b = hp.isElementDisplayed(element);
        Assert.assertTrue(b);
    }
    /**
     * Asserts element if element with id is equal to value of parameter @id and element is displayed.
     * @param id String - attribute id.
     * @throws Throwable Error
     */
    public void assertElementById(String id) throws Throwable {
        By element = d.createElementByResourceId(id);
        hp.assertElementDisplayed(element);
        if (hp.isElementDisplayed(element)) {
            Log.info("!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Element with id: " + id + " is visible !!!!!!!!!!!!!!!!!!!!!!!!!");
        } else {
            Log.error("!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Element with id: " + id + " is not visible !!!!!!!!!!!!!!!!!!!!!!!!!");
            Assert.assertTrue(hp.isElementDisplayed(element));
        }
    }

    public void assertElementByIdIsEnabled(String id) throws Throwable {
        By element = d.createElementByResourceId(id);
        hp.assertElementEnabled(element);
        if (hp.isElementEnabled(element)) {
            Log.info("!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Element with id: " + id + " is enabled !!!!!!!!!!!!!!!!!!!!!!!!!");
        } else {
            Log.error("!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Element with id: " + id + " is not enabled !!!!!!!!!!!!!!!!!!!!!!!!!");
            Assert.assertTrue(hp.isElementEnabled(element));
        }
    }

    /**
     * Asserts element if element with id is equal to value of parameter @id and element is enabled.
     * @param id String - attribute id.
     * @throws Throwable Error
     */
    public void assertElementEnabled(String id) throws Throwable {
        By xpath = d.createElementById(id);
        if (hp.isElementEnabled(xpath)) {
            Log.info("!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Element with id: " + id + " is visible !!!!!!!!!!!!!!!!!!!!!!!!!");
        } else {
            Log.error("!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Element with id: " + id + " is not visible !!!!!!!!!!!!!!!!!!!!!!!!!");
            Assert.assertTrue(hp.isElementEnabled(xpath));
        }
    }

    /**
     * Asserts if element is displayed. Element is founded by static text.
     * @param text String - static text.
     * @throws Throwable Error.
     */
    public void assertObjectByStaticText(String text) throws Throwable {
        By element = tx.createElementByStaticText(text);
        WaitHelpers.waitForElement(element, 30);
        if (hp.isElementDisplayed(element)) {
            Log.info("!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Element with text: " + text + " is visible !!!!!!!!!!!!!!!!!!!!!!!!!");
        } else {
            Log.error("!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Element with text: " + text + " is not visible !!!!!!!!!!!!!!!!!!!!!!!!!");
            Assert.assertTrue(hp.isElementDisplayed(element));
        }
    }

    /**
     * Asserts if element equals text is displayed.
     * @param text String - text to search
     * @throws Throwable
     */
    public void assertButtonByText(String text) throws Throwable {
        By element = tx.createElementByText(text);
        if (hp.isElementDisplayed(element)) {
            Log.info("!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Element with text: " + text + " is visible !!!!!!!!!!!!!!!!!!!!!!!!!");
        } else {
            Log.error("!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Element with text: " + text + " is not visible !!!!!!!!!!!!!!!!!!!!!!!!!");
            Assert.assertTrue(hp.isElementDisplayed(element));
        }
    }

    /**
     * Asserts if element equals text is clickable.
     * @param text String - text to search
     * @throws Throwable
     */
    public void assertButtonByTextIsEnabled(String text) throws Throwable {
        By element = tx.createElementByText(text);
        if (hp.isElementEnabled(element)) {
            Log.info("!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Element with text: " + text + " is visible !!!!!!!!!!!!!!!!!!!!!!!!!");
        } else {
            Log.error("!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Element with text: " + text + " is not visible !!!!!!!!!!!!!!!!!!!!!!!!!");
            Assert.assertTrue(hp.isElementDisplayed(element));
        }
    }

    /**
     * Asserts if element contains text is displayed.
     * @param text String - text to search
     * @throws Throwable
     */
    public void assertElementByTextContains(String text) throws Throwable {
        By element = tx.createElementByTextContains(text);
        //WaitHelpers.waitForElement(element);
        if (hp.isElementDisplayed(element)) {
            Log.info("!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Element with text: " + text + " is visible !!!!!!!!!!!!!!!!!!!!!!!!!");
        } else {
            Log.error("!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Element with text: " + text + " is not visible !!!!!!!!!!!!!!!!!!!!!!!!!");
            Assert.assertTrue(hp.isElementDisplayed(element));
        }
    }

    /**
     *  Asserts if element contains text and index of element is displayed.
     * @param text String - text to search.
     * @param index String - index of element
     * @throws Throwable
     */
    public void assertElementByTextAndIndex(String text, String index) throws Throwable {
        By element = tx.createElementByTextContains(text, index);
        if (hp.isElementDisplayed(element)) {
            Log.info("!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Element with text: " + text + " is visible !!!!!!!!!!!!!!!!!!!!!!!!!");
        } else {
            Log.error("!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Element with text: " + text + " is not visible !!!!!!!!!!!!!!!!!!!!!!!!!");
            Assert.assertTrue(hp.isElementDisplayed(element));
        }
    }

    /**
     * Assert if specific element is displayed. Widget.
     * @param text String - name of the widget.
     * @throws Throwable Error
     */
    public void assertWidget(String text) throws Throwable {
        By element = x.createByXpath("//XCUIElementTypeStaticText[@name='"+text+"']/../../XCUIElementTypeOther[1]");
        if (hp.isElementDisplayed(element)) {
            Log.info("!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Widget with text: " + text + " is visible !!!!!!!!!!!!!!!!!!!!!!!!!");
        } else {
            Log.error("!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Widget with text: " + text + " is not visible !!!!!!!!!!!!!!!!!!!!!!!!!");
            Assert.assertTrue(hp.isElementDisplayed(element));
        }
    }

    /**
     * Asserts if exists payment in Test digital database and in Luka database for SSN parameter
     * @param SSN Social Security Number
     * @throws SQLException
     */
    public void assertPaymentIntoDBBySavedSSN(String SSN) throws SQLException {
        boolean isCorrect = true;
        String result = "";
        String order = Queries.getSSNPaymentDataDigital(SSN);
        if (order.equals("")) {
            isCorrect = false;
        } else {
            result = Queries.getOrderIdPaymentDataLuca(order);
            if (result.equals(""))
                isCorrect = false;
        }
        Assert.assertTrue(isCorrect);
    }

    /**
     * Asserts if description exists in database. Check if parameter @Description exists in Luka Database
     * @param Description Payment description
     * @throws SQLException
     */
    public void assertPaymentIntoDBBySavedDescription(String Description) throws SQLException {
        boolean isCorrect = true;
        String result = Queries.getDescriptionPaymentDataLuca(Description);
        if (result.equals(""))
            isCorrect = false;
        Assert.assertTrue(isCorrect);
    }

    /**
     * Assert if specific element is displayed. Navigation view.
     * @throws Throwable Error
     */
    public void assertNavigationView() throws Throwable {
        By NavigationView = x.createByXpath("//android.widget.ImageButton[@content-desc=\"Navigation View Closed\"]");
        WaitHelpers.waitForElement(NavigationView, 10);
        if (hp.isElementDisplayed(NavigationView))
            Log.info("!!!!!!!!!!!!!!!! Navigation view are present !!!!!!!!!!!!!!!!!!!");
        else
            Log.error("!!!!!!!!!!!!!!!! Navigation view are not present !!!!!!!!!!!!!!!!!");
        Assert.assertTrue(hp.isElementDisplayed(NavigationView));
    }

    public void assertAmountAndCurrencyInTransactionDetailAreDisplayedInValidFormat(){
        if (Base.testPlatform.equals("iOS")) {
            // There is no better way to find amount on transaction details
            String xpath = "//*[@name='transaction_list_account_name']/..//XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeStaticText[3]";
            By element = x.createByXpath(xpath);
            String value = hp.getAttribute(element, "value").toString();
            Assert.assertTrue(Utilities.regexAmountDotCommaSpaceCurrency(value));
        }
        else{
            //TODO implementationm for Android
        }
    }

    public void assertAmountAndOriginalCurrencyInTransactionDetailAreDisplayedInValidFormat(String currency) {
        String staticText = "Original currency amount";
        if (Base.testPlatform.equals("iOS")) {
            By element = x.createBySomeTextAfterTextInStaticElement(staticText);
            String value = hp.getAttribute(element, "value").toString();
            Assert.assertTrue(Utilities.regexAmountDotCommaSpaceCurrency(value, currency));
        } else {
            //TODO implementationm for Android
        }
    }

    public void assertValueDateInTransactionDetailsAreDisplayedInValidFormat(){
        if (Base.testPlatform.equals("iOS")) {
            // There is no better way to find amount on transaction details
            String xpath = "//*[@name='transaction_list_account_name']/..//XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeStaticText[1]";
            By element = x.createByXpath(xpath);
            String value = hp.getAttribute(element, "value").toString();
            Assert.assertTrue(Utilities.regexDateInFormatDDMMYYY(value));
        }
        else{
            //TODO implementationm for Android
        }
    }
    //endregion - Custom asserts -

    //region - Custom swipe -
    /**
     * Swipe if element is not found. Custom method.
     * @param element By element to find.
     * @param anchorPercentage Double - anchor percentage.
     * @param startPercentage Double - start percentage.
     * @param endPercentage Double - end percentage.
     * @throws InterruptedException
     */
    public void ifNotExistsSwipe(By element, double anchorPercentage, double startPercentage, double endPercentage) throws InterruptedException {
        By el = element;
        for (int i = 0; i < 10; i++) {
            try {
                if (!hp.isElementNotPresent(el)) {
                    if (driver.findElement(element).getAttribute("visible").equals(false)){
                        hp.verticalSwipeByPercentage(anchorPercentage, startPercentage, endPercentage);
                    }
                    break;
                } else {
                    hp.verticalSwipeByPercentage(anchorPercentage, startPercentage, endPercentage);
                    Log.info("!!!!!!!!!!!!!!!!!!!!!! Swipe !!!!!!!!!!!!!!!!!!!!!!");
                }
            } catch (Exception e) {
            }
            Thread.sleep(50);
        }
    }
    //endregion - Custom swipe -

    //region - Custom scroll -
    /**
     * Scroll into view by id. Up or down.
     * @param id String - id of the element.
     * @param direction String - up or down
     * @throws InterruptedException Error
     */
    public void scrollIntoViewById(String id, String direction) throws InterruptedException {
        By element = d.createElementById(id);
        long sleepTime = 500;
        int cycles = 30;
        hp.scrollIntoView(element, direction, sleepTime, cycles);
    }
    public void scrollIntoViewByText(String text,String direction) throws InterruptedException {
        By element = tx.createElementByText(text);
        long sleepTime = 500;
        int cycles = 30;
        hp.scrollIntoView(element, direction, sleepTime, cycles);
    }

    /**
     * Scroll to element. Element is found by text.
     * @param visibleText String - text to search
     * @throws Throwable Error
     */
    public void scrollToElementByText(String visibleText) throws Throwable {
        if (Base.testPlatform.equals("Android")) {
            driver.findElement(ui.createElementByVisibleText(visibleText));
        }
    }

    /**
     * Custom method for finding element by text, then scrolling, then assert
     * @param text String - text to search.
     * @throws Throwable Error
     */
    public void scrollAndAssertButtonByText(String text) throws Throwable {
        By element = tx.createElementByText(text);
        scrollToElementByText(text);
        if (hp.isElementDisplayed(element)) {
            Log.info("!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Element with text: " + text + " is visible !!!!!!!!!!!!!!!!!!!!!!!!!");
        } else {
            Log.error("!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Element with text: " + text + " is not visible !!!!!!!!!!!!!!!!!!!!!!!!!");
            Assert.assertTrue(hp.isElementDisplayed(element));
        }
    }
    //endregion - Custom scroll -

    //region - Press buttons -
    /**
     * Custom method for press Done button.
     * @throws InterruptedException Error
     */
    public void pressDoneButton() throws InterruptedException {
        if(Base.testPlatform.equals("Android")) driver.executeScript("mobile: performEditorAction", Collections.singletonMap("action", "done"));
    }

    /**
     * Custom method for press Go button.
     */
    public void pressGoButton() {
        driver.executeScript("mobile: performEditorAction", Collections.singletonMap("action", "go"));
    }

    public void sendKeys(String keys){
        CharSequence sequence = keys;
        driver.getKeyboard().pressKey(sequence);
    }
    //endregion - Press buttons -

    //region - Utils -

    public void saveElementAttributeValueByAttributeAndIdUnderKey(String attribute, String id, String key) {
        MobileElement element = d.createMobileElementByResourceId(id);
        String elementAttributeValue = element.getAttribute(attribute);
        hp.saveTheValueToMapBasic(elementAttributeValue, key);
    }

    public void saveElementAttributeValueByAttributeAndIdUnderKey(String attribute, MobileElement element, String key) {
        hp.saveTheValueToMapBasic(element.getAttribute(attribute), key);
    }

    public void assertResultOfOperationIsCorrect(String operation) {
        double firstNumber = Double.parseDouble(DataManager.userObject.get("firstNumber").toString());
        double secondNumber = Double.parseDouble(DataManager.userObject.get("secondNumber").toString());
        double expectedResult = Double.parseDouble(DataManager.userObject.get("expectedResult").toString());
        double result = 0;

        switch (operation){
            case "+":
                result = firstNumber + secondNumber;
                break;
            case "-":
                result = firstNumber - secondNumber;
                break;
            case "*":
                result = firstNumber * secondNumber;
                break;
            case "/":
                result = firstNumber / secondNumber;
                break;
        }
        hp.assertEqualDoubleAmounts(result, expectedResult);

    }

    /**
     * Check if exists element with native id equals to parameter @id
     * @param id Native ID of element
     * @throws InterruptedException
     */
    public void ifExistYESButtonOnByNativeId(String id) throws InterruptedException {
        if (Base.testPlatform.equals("Android")) {
            By el = d.crateNativeElement(id);
            for (int i = 0; i <= 3; i++) {
                try {
                    if(!hp.isElementNotPresent(el))
                    {
                        hp.clickElement(el, id);
                        break;
                    }
                } catch (Exception e) { }
                Thread.sleep(500);
            }
        }
        if (Base.testPlatform.equals("iOS")) {
            By el = d.createElementById(id);
            for (int i = 0; i <= 3; i++) {
                try {
                    if(!hp.isElementNotPresent(el))
                    {
                        hp.clickElement(el, id);
                        break;
                    }
                } catch (Exception e) { }
                Thread.sleep(500);
            }
        }
    }

    public void assertMobileElementsDisplayed(List<MobileElement> mobileElementList) {
        for(MobileElement element : mobileElementList){
            Assert.assertEquals("true",element.getAttribute("displayed"));
        }
    }

    public void assertMobileElementsVisible(List<MobileElement> mobileElementList) {
        for(MobileElement element : mobileElementList){
            Assert.assertEquals("true",element.getAttribute("visible"));
        }
    }

    public void assertListOfMobileElementByIdEndsIn(List<MobileElement> mobileElementList, String ends) {
        for(MobileElement element : mobileElementList){
            Assert.assertTrue(element.getAttribute("text").endsWith(ends));
        }
    }

    public void assertListOfMobileElementStartsWithNumber(List<MobileElement> mobileElementList) {
        for(MobileElement element : mobileElementList){
            Assert.assertTrue(element.getAttribute("text").matches("^[0-9].*"));
        }
    }

    public void assertListOfMobileElementStartsWith(List<MobileElement> mobileElementList, String starts) {
        for(MobileElement element : mobileElementList){
            Assert.assertTrue(element.getAttribute("text").replaceAll(" ","").startsWith(starts));
        }
    }
    public void storeAttributeFromIdUnderKeyList(String attribute, String id, String key) {
        List<MobileElement> mobileElementList = d.createElementsById(id);
        List<String> rememberedAttribute = new ArrayList<>();
        for(MobileElement element : mobileElementList){
            rememberedAttribute.add(element.getAttribute(attribute));
        }
        hp.saveTheValueToMapBasic(rememberedAttribute,key);
    }

    public List returnAttributeFromxPathList(String attribute, String xPath) {
        List<MobileElement> mobileElementList = x.createMobileElementsByXpath(xPath);
        List<String> returnedAttribute = new ArrayList<>();
        for(MobileElement element : mobileElementList){
            returnedAttribute.add(element.getAttribute(attribute));
        }
        return returnedAttribute;
    }

    public void enterTextToElementByXpath(String text, String xPath) throws Throwable {
        By inputField = x.createByXpath(xPath);
        hp.isElementDisplayed(inputField);
        hp.enterTextToElement(text, inputField);
    }

    public void assertToCurrencyHasAllCurencies(String xPath) {
        ArrayList<String> expectedCurrencies = new ArrayList<>();
        expectedCurrencies.add("AUD");
        expectedCurrencies.add("CAD");
        expectedCurrencies.add("CHF");
        expectedCurrencies.add("DKK");
        expectedCurrencies.add("GBP");
        expectedCurrencies.add("HUF");
        expectedCurrencies.add("JPY");
        expectedCurrencies.add("NOK");
        expectedCurrencies.add("SEK");
        expectedCurrencies.add("USD");

        List<MobileElement> mobileElementList = x.createMobileElementsByXpath(xPath);
        List<String> actualCurrencies = new ArrayList<>();

        for(MobileElement element : mobileElementList){
            actualCurrencies.add(element.getAttribute("text"));
        }
        Collections.sort(expectedCurrencies);
        Collections.sort(actualCurrencies);

        Assert.assertTrue(expectedCurrencies.equals(actualCurrencies));
    }

    public void assertToCurrencyHasAllCurenciesUSD(String xPath) {
        ArrayList<String> expectedCurrencies = new ArrayList<>();
        expectedCurrencies.add("AUD");
        expectedCurrencies.add("CAD");
        expectedCurrencies.add("CHF");
        expectedCurrencies.add("DKK");
        expectedCurrencies.add("EUR");
        expectedCurrencies.add("GBP");
        expectedCurrencies.add("HUF");
        expectedCurrencies.add("JPY");
        expectedCurrencies.add("NOK");
        expectedCurrencies.add("SEK");

        List<MobileElement> mobileElementList = x.createMobileElementsByXpath(xPath);
        List<String> actualCurrencies = new ArrayList<>();

        for(MobileElement element : mobileElementList){
            actualCurrencies.add(element.getAttribute("text"));
        }
        Collections.sort(expectedCurrencies);
        Collections.sort(actualCurrencies);

        Assert.assertTrue(expectedCurrencies.equals(actualCurrencies));
    }

    public List scrollDownAndPutEveryElementWithIdIntoList(String id) throws Exception {
        List<MobileElement> mobileElementList = new ArrayList<>();
        List<String> mobileElementListText = new ArrayList<>();
        int n = 0;
        while (n<10){
            try{
                n++;
                mobileElementList = d.createMobileElementsByResourceId(id);
                if(mobileElementList.size()==0){
                    //hp.swipeByCordinates(700,2000,700,700);
                }
                break;
            } catch(Exception e){
                if(Base.getDataFromFileConf(Hooks.rowinConfExcel,"DEVICE_NAME").contains("HUAWEI")){
                    hp.swipeByCordinates(500,1300,500,600);
                } else{
                    hp.swipeByCordinates(700,1500,700,700);
                }
            }
        }
        for (MobileElement element : mobileElementList){
            mobileElementListText.add(element.getAttribute("text"));
        }
        n = 0;
        boolean go = true;
         while (go && n<10){
             go = false;
             n++;
             WaitHelpers.waitForSeconds(3);
             if(Base.getDataFromFileConf(Hooks.rowinConfExcel,"DEVICE_NAME").contains("HUAWEI")){
                 hp.swipeByCordinates(500,1300,500,600);
             } else{
                 hp.swipeByCordinates(700,1500,700,700);
             }
             try{
                 List<MobileElement> drugaLista = d.createMobileElementsByResourceId(id);
                 for(MobileElement element : drugaLista){
                     if(mobileElementListText.contains(element.getAttribute("text"))){
                         //Nesto uraditi
                     } else{
                         mobileElementListText.add(element.getAttribute("text"));
                         go = true;
                     }
                 }
             } catch(Exception e){
                 //hp.swipeByCordinates(700,2000,700,700);
             }

         }
         if(n>=20) {
             throw new Exception("Nije pronasao kontakte!");
         }
         return mobileElementListText;
    }

    public List scrollDownAndPutEveryElementWithNativeIdIntoList(String id) throws Exception {
        List<MobileElement> mobileElementList = new ArrayList<>();
        List<String> mobileElementListText = new ArrayList<>();
        int n = 0;
        while (n<200){
            try{
                n++;
                mobileElementList = d.createMobileElementsByNativeId(id);
                if(mobileElementList.size()==0){
                    //hp.swipeByCordinates(700,2000,700,700);
                }
                break;
            } catch(Exception e){
                if(Base.getDataFromFileConf(Hooks.rowinConfExcel,"DEVICE_NAME").contains("HUAWEI")){
                    hp.swipeByCordinates(500,1300,500,600);
                } else{
                    hp.swipeByCordinates(500,1700,500,1200);
                }
            }
        }
        for (MobileElement element : mobileElementList){
            mobileElementListText.add(element.getAttribute("text"));
        }
        n = 0;
        boolean go = true;
        while (go && n<200){
            go = false;
            n++;
            //WaitHelpers.waitForSeconds(3);
            if(Base.getDataFromFileConf(Hooks.rowinConfExcel,"DEVICE_NAME").contains("HUAWEI")){
                hp.swipeByCordinates(500,1300,500,600);
            } else{
                hp.swipeByCordinates(500,1700,500,1200);
            }
            try{
                List<MobileElement> drugaLista = d.createMobileElementsByNativeId(id);
                for(MobileElement element : drugaLista){
                    if(mobileElementListText.contains(element.getAttribute("text"))){
                        //Nesto uraditi
                    } else{
                        mobileElementListText.add(element.getAttribute("text"));
                        go = true;
                    }
                }
            } catch(Exception e){
                //hp.swipeByCordinates(700,2000,700,700);
            }

        }
        if(n>=200) {
            throw new Exception("Nije pronasao kontakte!");
        }
        return mobileElementListText;
    }

    public List scrollDownAndPutEveryElementWithNativeIdIntoListCurrency(String id) throws Exception {
        List<MobileElement> mobileElementList = new ArrayList<>();
        List<String> mobileElementListText = new ArrayList<>();
        int n = 0;
        while (n<10){
            try{
                n++;
                mobileElementList = d.createMobileElementsByNativeId(id);
                if(mobileElementList.size()==0){
                    //hp.swipeByCordinates(700,2000,700,700);
                }
                break;
            } catch(Exception e){
                if(Base.getDataFromFileConf(Hooks.rowinConfExcel,"DEVICE_NAME").contains("HUAWEI")){
                    hp.swipeByCordinates(500,1300,500,600);
                } else{
                    hp.swipeByCordinates(400,1600,500,700);
                }
            }
        }
        for (MobileElement element : mobileElementList){
            mobileElementListText.add(element.getAttribute("text"));
        }
        n = 0;
        boolean go = true;
        while (go && n<10){
            go = false;
            n++;
            WaitHelpers.waitForSeconds(3);
            if(Base.getDataFromFileConf(Hooks.rowinConfExcel,"DEVICE_NAME").contains("HUAWEI")){
                hp.swipeByCordinates(500,1300,500,600);
            } else{
                hp.swipeByCordinates(400,1600,500,700);
            }
            try{
                List<MobileElement> drugaLista = d.createMobileElementsByNativeId(id);
                for(MobileElement element : drugaLista){
                    if(mobileElementListText.contains(element.getAttribute("text"))){
                        //Nesto uraditi
                    } else{
                        mobileElementListText.add(element.getAttribute("text"));
                        go = true;
                    }
                }
            } catch(Exception e){
                //hp.swipeByCordinates(700,2000,700,700);
            }

        }
        if(n>=20) {
            throw new Exception("Nije pronasao kontakte!");
        }
        return mobileElementListText;
    }
    public String generateRandomStringOfCertainLenght(int i) {
        String generatedString = RandomStringUtils.randomAlphabetic(i);
        return generatedString.toUpperCase();
    }

    public void clickOnDateInCalendarDaysInTheFuture(String days) throws Throwable {
        //Friday, October 7, 2022
        //07 October 2022
        int day = Integer.parseInt(days);
        LocalDate date = LocalDate.now().plusDays(day);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd MMMM yyyy");
        String text = date.format(formatter);

        LocalDate dateMonth = LocalDate.now();
        DateTimeFormatter formatterForMonth = DateTimeFormatter.ofPattern("MMMM");
        String currentMonth = dateMonth.format(formatterForMonth);

        String month = text.replaceAll("[0-9]{2} ","");
        String month2 = month.replaceAll(" [0-9]{4}", "");

        if(!currentMonth.equals(month2)){
            String xPath2 = "//android.widget.ImageButton[@content-desc='Next month']";
            By elementNext = x.createByXpath(xPath2);
            hp.clickElement(elementNext);
        }

        //String xPath = "//div[@aria-label='" + text + "']";
        String xPath = "//android.view.View[@content-desc='" + text + "']";
        By element = x.createByXpath(xPath);
        hp.clickElement(element);

    }

    public String getDateDaysFromNowInFormat(String days, String format) {
        int day = Integer.parseInt(days);
        LocalDate date = LocalDate.now().plusDays(day);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern(format);
        String text = date.format(formatter);
        return text;
    }

    public void tryToAssertThatPaymentIsAndSendCommandToOTPMethod(String text) throws Throwable {

        if(Base.testPlatform.equals("iOS")){
            String xPath = "//XCUIElementTypeStaticText[@name='" + text + "']";
            By el = By.xpath(xPath);
            boolean doesElementExist = hp.isElementDisplayed(el,10,300);

            if(doesElementExist == true){
                System.out.println("Payment is successful");
                DataManager.userObject.put("StatusOfPayment","OK");
            } else {
                System.out.println("Notification did not show");
                DataManager.userObject.put("StatusOfPayment","NOK");
            }
        }
        else{
            String xPath = "//*[@text = \"" + text + "\"]";
            By el = By.xpath(xPath);
            boolean doesElementExist = hp.isElementDisplayed(el,10,300);

            if(doesElementExist == true){
                System.out.println("Payment is successful");
                DataManager.userObject.put("StatusOfPayment","OK");
            } else {
                System.out.println("Notification did not show");
                DataManager.userObject.put("StatusOfPayment","NOK");
            }
        }

    }

    public void checkIfPINIsNeededAndCompletePaymentFor(String text) throws Throwable {
        String status = (String) DataManager.userObject.get("StatusOfPayment");

        if(Base.testPlatform.equals("iOS")) {
            if (status.equals("NOK")) {
                String xPath = "//XCUIElementTypeStaticText[contains(@value, 'Please enter your PIN.')]";
                By el = By.xpath(xPath);
                boolean pinExists = hp.isElementDisplayed(el, 15, 1000);

                if (pinExists == true) {
                    String pin = "1379";
                    sendKeys(pin);
                    //String xPath1 = "(//XCUIElementTypeButton[@name='Confirm'])[2]";
                    //String xPath1 = "//XCUIElementTypeStaticText[@name='Confirm']/ancestor::XCUIElementTypeButton[@name='Confirm']";
                    String xPath1 = "//XCUIElementTypeImage[@name='confirmPayment']//following-sibling::XCUIElementTypeButton[@name='Confirm']";
                    By element = x.createByXpath(xPath1);
                    hp.clickElement(element);
                    String xPath2 = "//XCUIElementTypeStaticText[@name='" + text + "']";
                    By elementStatusMessage = x.createByXpath(xPath2);
                    Assert.assertTrue(hp.isElementDisplayed(elementStatusMessage, 15, 1000));
                } else {
                    Assert.assertFalse(true);
                }
            } else {
                System.out.println("This method was not needed.");
            }
        } else{
            if (status.equals("NOK")){
                String xPath = "//*[@text = \"Enter PIN\"]";
                By el2 = x.createByXpath(xPath);
                WaitHelpers.waitForElement(el2, 100);
                By el = By.xpath(xPath);
                boolean pinExists = hp.isElementDisplayed(el,15,1000);

                if( pinExists == true){
                    String PIN = "1379";
                    Character[] character = Utilities.toCharacterArray(PIN);
                    hp.pressKey(character);
                    //By element = d.createElementById("nlb-button-primary");
                    By element = tx.createElementByText("Confirm");
                    WaitHelpers.waitForElement(element, 10);
                    hp.clickElement(element);
                    System.out.println("Izasao je OTP");
                    //By elTextAssert = tx.createElementByTextContains(text);
                    //Assert.assertTrue(hp.isElementDisplayed(elTextAssert));
                    //assertElementByTextContains(text);
                } else{
                    Assert.assertFalse(true);
                }
            } else{
                System.out.println("This method was not needed.");
            }
        }
    }

    public void sendKeyToElementNumberOfTimes(String num, String character, MobileElement element) throws Throwable {
        int repeatNumber = Integer.parseInt(num);
        hp.ClickOnElement(element);
        String loopedString = new String(new char[repeatNumber]).replace("\0", character);
        Character[] charObjectArray = Utilities.toCharacterArray(loopedString);
        hp.pressKey(charObjectArray);
    }

    public List<String> getAllBudgetCategories() {
        List<String> expectedCategories = new ArrayList<>();
        expectedCategories.add("Bars & Restaurants");
        expectedCategories.add("Car & Transport");
        expectedCategories.add("Cash");
        expectedCategories.add("Education");
        expectedCategories.add("Finances & Insurance");
        expectedCategories.add("Groceries");
        expectedCategories.add("Health & Personal care");
        expectedCategories.add("Kids");
        expectedCategories.add("Other");
        expectedCategories.add("Other income");
        expectedCategories.add("Personal income");
        expectedCategories.add("Savings & Investments");
        expectedCategories.add("Shopping");
        expectedCategories.add("Sport & Leisure");
        expectedCategories.add("Transfers");
        expectedCategories.add("Home");

        return expectedCategories;
    }

    public String getNextSunday(){
        Calendar c = Calendar.getInstance();
        c.set(Calendar.DAY_OF_WEEK,Calendar.SUNDAY);
        c.set(Calendar.HOUR_OF_DAY,0);
        c.set(Calendar.MINUTE,0);
        c.set(Calendar.SECOND,0);
        DateFormat df = new SimpleDateFormat("dd.MM.yyyy");
        c.add(Calendar.DATE,7);
        String date = df.format(c.getTime());
        return date;
    }
    //endregion - Utils -

    public void checkIfElementsFromListExistInPickWheeler(List<String> elementsFromList, String pickWheelerXPath) throws InterruptedException {
        By element = x.createByXpath(pickWheelerXPath);
        for (String currency : elementsFromList) {
            String expected = currency.replace(" ", "");
            hp.enterTextToMobileElement(currency, element);
            String actual = hp.getAttribute(element, "value").toString().replace(" ", "");
            Assert.assertEquals(expected, actual);
        }
    }

    public void assertToCurrencyHasAllCurenciesAUD(String xPath) {
        ArrayList<String> expectedCurrencies = new ArrayList<>();
        expectedCurrencies.add("CAD");
        expectedCurrencies.add("CHF");
        expectedCurrencies.add("DKK");
        expectedCurrencies.add("EUR");
        expectedCurrencies.add("GBP");
        expectedCurrencies.add("HUF");
        expectedCurrencies.add("JPY");
        expectedCurrencies.add("NOK");
        expectedCurrencies.add("SEK");
        expectedCurrencies.add("USD");

        List<MobileElement> mobileElementList = x.createMobileElementsByXpath(xPath);
        List<String> actualCurrencies = new ArrayList<>();

        for(MobileElement element : mobileElementList){
            actualCurrencies.add(element.getAttribute("text"));
        }
        Collections.sort(expectedCurrencies);
        Collections.sort(actualCurrencies);

        Assert.assertTrue(expectedCurrencies.equals(actualCurrencies));
    }

    public List scrollWithCordinatesAndPutEveryElementWithIdIntoList(int x, int y, int x2, int y2, String id) throws Exception {
        List<MobileElement> mobileElementList = new ArrayList<>();
        List<String> mobileElementListText = new ArrayList<>();
        int n = 0;
        while (n<10){
            try{
                n++;
                mobileElementList = d.createMobileElementsByResourceId(id);
                if(mobileElementList.size()==0){
                    //hp.swipeByCordinates(700,2000,700,700);
                }
                break;
            } catch(Exception e){
                hp.swipeByCordinates(x,y,x2,y2);
            }
        }
        for (MobileElement element : mobileElementList){
            mobileElementListText.add(element.getAttribute("text"));
        }
        n = 0;
        boolean go = true;
        while (go && n<10){
            go = false;
            n++;
            WaitHelpers.waitForSeconds(3);
            hp.swipeByCordinates(x,y,x2,y2);
            try{
                List<MobileElement> drugaLista = d.createMobileElementsByResourceId(id);
                for(MobileElement element : drugaLista){
                    if(mobileElementListText.contains(element.getAttribute("text"))){
                        //Nesto uraditi
                    } else{
                        mobileElementListText.add(element.getAttribute("text"));
                        go = true;
                    }
                }
            } catch(Exception e){
                //hp.swipeByCordinates(700,2000,700,700);
            }

        }
        if(n>=20) {
            throw new Exception("Nije pronasao");
        }
        return mobileElementListText;
    }

    public List<String> getAllPurposeCodes() {
        List<String> purposeCodes = new ArrayList<>();
        purposeCodes.add("ACCT - Account Management");
        purposeCodes.add("ADCS - Advisory Donation Coopyright Services");
        purposeCodes.add("ADMG - Administrative Management");
        purposeCodes.add("ADVA - Advance Payment");
        purposeCodes.add("AEMP - Active Employment Policy");
        purposeCodes.add("AGRT - Agricultural Transfer");
        purposeCodes.add("AIRB - Aerotransport");
        purposeCodes.add("ALLW - Allowance ");
        purposeCodes.add("ALMY - Alimony Payment");
        purposeCodes.add("ANNI - Annuity");
        purposeCodes.add("ANTS - Anesthesia Services");
        purposeCodes.add("AREN - Accounts Receivables Entry");
        purposeCodes.add("B112 - Trailer Fee Payment");
        purposeCodes.add("B700 - Remittance of a secondary bank");
        purposeCodes.add("BBSC - Baby Bonus Scheme ");
        purposeCodes.add("BCDM - Bearer Cheque Domestic");
        purposeCodes.add("BCFG - Bearer Cheque Foreign");
        purposeCodes.add("BECH - Child Benefit");
        purposeCodes.add("BENE - Unemployment Disability Benefit");
        purposeCodes.add("BEXP - Business Expenses");
        purposeCodes.add("BFWD - Bond Forward");
        purposeCodes.add("BKDF - Bank Loan Delayed Draw Funding");
        purposeCodes.add("BKFE - Bank Loan Fees");
        purposeCodes.add("BKFM - Bank Loan Funding Memo");
        purposeCodes.add("BKIP - Bank Loan Accrued Interest Payment");
        purposeCodes.add("BKPP - Bank Loan Principal Paydown");
        purposeCodes.add("BLDM - Building Maintenance");
        purposeCodes.add("BNET - Bond Forward Netting");
        purposeCodes.add("BOCE - Back Office Conversion Entry");
        purposeCodes.add("BONU - Bonus Payment");
        purposeCodes.add("BR12 - Trailer Fee Rebate");
        purposeCodes.add("BUSB - Bus");
        purposeCodes.add("CAFI - Custodian Management fee In-house");
        purposeCodes.add("CASH - CashManagement Transfer");
        purposeCodes.add("CBFF - Capital Building");
        purposeCodes.add("CBFR - Capital Building Retirement ");
        purposeCodes.add("CBLK - Card Bulk Clearing");
        purposeCodes.add("CBTV - Cable TV Bill");
        purposeCodes.add("CCHD - Cash compensation, Helplessness, Disability");
        purposeCodes.add("CCIR - Cross Currency IRS");
        purposeCodes.add("CCPC - CCP Cleared Initial Margin");
        purposeCodes.add("CCPM - CCP Cleared Variation Margin");
        purposeCodes.add("CCRD - Credit Card Payment ");
        purposeCodes.add("CCSM - CCP Cleared Initial Margin Segregated Cash");
        purposeCodes.add("CDBL - Credit Card Bill");
        purposeCodes.add("CDCB - Card Payment with Cashback");
        purposeCodes.add("CDCD - Card disbursement");
        purposeCodes.add("CDCS - Cash Disbursement with Surcharging");
        purposeCodes.add("CDDP - Card Deferred Payment");
        purposeCodes.add("CDEP - Credit default event payment");
        purposeCodes.add("CDOC - Original Credit ");
        purposeCodes.add("CDQC - Quasi Cash:  ");
        purposeCodes.add("CFDI - Capital falling due In-house");
        purposeCodes.add("CFEE - Cancellation Fee");
        purposeCodes.add("CGDD - CardGenerated Direct Debit");
        purposeCodes.add("CHAR - Charity Payment");
        purposeCodes.add("CLPR - CarLoan Principal Repayment");
        purposeCodes.add("CMDT - Commodity Transfer");
        purposeCodes.add("COLL - Collection Payment");
        purposeCodes.add("COMC - Commercial Payment");
        purposeCodes.add("COMM - Commission");
        purposeCodes.add("COMP - Compensation Payment");
        purposeCodes.add("COMT - Consumer Third Party Consolidated Payment");
        purposeCodes.add("CORT - Trade Settlement Payment");
        purposeCodes.add("COST - Costs");
        purposeCodes.add("CPKC - Carpark Charges ");
        purposeCodes.add("CPYR - Copyright");
        purposeCodes.add("CRDS - Credit DefaultSwap");
        purposeCodes.add("CRPR - Cross Product");
        purposeCodes.add("CRSP - Credit Support");
        purposeCodes.add("CRTL - Credit Line");
        purposeCodes.add("CSDB - Cash Disbursement");
        purposeCodes.add("CSLP - Company Social Loan Payment To Bank");
        purposeCodes.add("CVCF - Convalescent Care Facility");
        purposeCodes.add("DBTC - Debit Collection Payment");
        purposeCodes.add("DCRD - Debit Card Payment");
        purposeCodes.add("DEPT - Deposit");
        purposeCodes.add("DERI - Derivatives");
        purposeCodes.add("DIVD - Dividend");
        purposeCodes.add("DMEQ - Durable Medicale Equipment");
        purposeCodes.add("DNTS - Dental Services");
        purposeCodes.add("DSMT - Printed Order Disbursement");
        purposeCodes.add("DVPM - Deliver Against Payment");
        purposeCodes.add("ECPG - Guaranteed EPayment");
        purposeCodes.add("ECPR - EPayment Return");
        purposeCodes.add("ECPU - NonGuaranteed EPayment");
        purposeCodes.add("EDUC - Education");
        purposeCodes.add("ELEC - Electricity Bill");
        purposeCodes.add("ENRG - Energies");
        purposeCodes.add("EPAY - Epayment");
        purposeCodes.add("EQPT - Equity Option");
        purposeCodes.add("EQUS - Equity Swap");
        purposeCodes.add("ESTX - EstateTax");
        purposeCodes.add("ETUP - E-Purse  Top up");
        purposeCodes.add("EXPT - Exotic Option");
        purposeCodes.add("EXTD - Exchange Traded Derivatives");
        purposeCodes.add("FACT - Factor Update related payment");
        purposeCodes.add("FAND - Financial Aid In Case Of Natural Disaster");
        purposeCodes.add("FCOL - Fee Collection");
        purposeCodes.add("FCPM - Late Payment of Fees & Charges ");
        purposeCodes.add("FEES - Payment of Fees");
        purposeCodes.add("FERB - Ferry");
        purposeCodes.add("FIXI - Fixed Income");
        purposeCodes.add("FNET - Futures Netting Payment");
        purposeCodes.add("FORW - Forward Foreign Exchange");
        purposeCodes.add("FREX - Foreign Exchange");
        purposeCodes.add("FUTR - Futures");
        purposeCodes.add("FWBC - Forward Broker Owned Cash Collateral");
        purposeCodes.add("FWCC - Forward Client Owned Cash Collateral");
        purposeCodes.add("FWLV - Foreign Worker Levy ");
        purposeCodes.add("FWSB - Forward Broker Owned Cash Collateral Segregated");
        purposeCodes.add("FWSC - Forward Client Owned Segregated Cash Collateral");
        purposeCodes.add("FXNT - Foreign Exchange Related Netting");
        purposeCodes.add("GASB - Gas Bill");
        purposeCodes.add("GDDS - Purchase Sale Of Goods");
        purposeCodes.add("GDSV - Purchase Sale Of Goods And Services");
        purposeCodes.add("GFRP - Guarantee Fund Rights Payment");
        purposeCodes.add("GOVI - Government Insurance");
        purposeCodes.add("GOVT - Government Payment");
        purposeCodes.add("GSCB - Purchase Sale Of Goods And Services With CashBack");
        purposeCodes.add("GSTX - Goods & Services Tax ");
        purposeCodes.add("GVEA - Austrian Government Employees Category A");
        purposeCodes.add("GVEB - Austrian Government Employees Category B");
        purposeCodes.add("GVEC - Austrian Government Employees Category C");
        purposeCodes.add("GVED - Austrian Government Employees Category D");
        purposeCodes.add("GWLT - Goverment War Legislation Transfer");
        purposeCodes.add("HEDG - Hedging");
        purposeCodes.add("HLRP - Housing Loan Repayment");
        purposeCodes.add("HLST - Home Loan Settlement ");
        purposeCodes.add("HLTC - Home Health Care");
        purposeCodes.add("HLTI - Health Insurance");
        purposeCodes.add("HREC - Housing Related Contribution");
        purposeCodes.add("HSPC - Hospital Care");
        purposeCodes.add("HSTX - Housing Tax");
        purposeCodes.add("ICCP - Irrevocable Credit Card Payment");
        purposeCodes.add("ICRF - Intermediate Care Facility");
        purposeCodes.add("IDCP - Irrevocable Debit Card Payment");
        purposeCodes.add("IHRP - Instalment Hire Purchase Agreement");
        purposeCodes.add("INPC - Insurance Premium Car");
        purposeCodes.add("INPR - Insurance Premium Refund");
        purposeCodes.add("INSC - Payment of Insurance Claim");
        purposeCodes.add("INSM - Installment");
        purposeCodes.add("INSU - Insurance Premium");
        purposeCodes.add("INTC - Intra Company Payment");
        purposeCodes.add("INTE - Interest");
        purposeCodes.add("INTX - Income Tax");
        purposeCodes.add("INVS - Investment & Securities ");
        purposeCodes.add("IPAY - Instant Payments ");
        purposeCodes.add("IPCA - Instant Payments cancellation");
        purposeCodes.add("IPDO - Instant Payments for donations ");
        purposeCodes.add("IPEA - Instant Payments in E-Commerce without address data");
        purposeCodes.add("IPEC - Instant Payments in E-Commerce with address data");
        purposeCodes.add("IPEW - Instant Payments in E-Commerce ");
        purposeCodes.add("IPPS - Instant Payments at POS");
        purposeCodes.add("IPRT - Instant Payments return");
        purposeCodes.add("IPU2 - Instant Payments unattended vending machine with 2FA");
        purposeCodes.add("IPUW - Instant Payments unattended vending machine without 2FA");
        purposeCodes.add("IVPT - Invoice Payment ");
        purposeCodes.add("LBIN - Lending Buy-In Netting");
        purposeCodes.add("LBRI - LaborInsurance");
        purposeCodes.add("LCOL - Lending Cash Collateral Free Movement");
        purposeCodes.add("LFEE - Lending Fees");
        purposeCodes.add("LICF - License Fee");
        purposeCodes.add("LIFI - Life Insurance");
        purposeCodes.add("LIMA - Liquidity Management");
        purposeCodes.add("LMEQ - Lending Equity marked-to-market  cash collateral");
        purposeCodes.add("LMFI - Lending Fixed Income marked-to-market cash collateral");
        purposeCodes.add("LMRK - Lending unspecified type of marked-to-market cash collateral");
        purposeCodes.add("LOAN - Loan");
        purposeCodes.add("LOAR - Loan Repayment");
        purposeCodes.add("LREB - Lending rebate payments");
        purposeCodes.add("LREV - Lending Revenue Payments");
        purposeCodes.add("LSFL - Lending Claim Payment");
        purposeCodes.add("LTCF - Long Term Care Facility");
        purposeCodes.add("MAFC - Medical Aid Fund Contribution");
        purposeCodes.add("MARF - Medical Aid Refund");
        purposeCodes.add("MARG - Daily margin on listed derivatives ");
        purposeCodes.add("MBSB - MBS Broker Owned Cash Collateral                                                                                                            ");
        purposeCodes.add("MBSC - MBS Client Owned Cash Collateral ");
        purposeCodes.add("MCDM - MultiCurreny Cheque Domestic");
        purposeCodes.add("MCFG - MultiCurreny Cheque Foreign");
        purposeCodes.add("MDCS - Medical Services");
        purposeCodes.add("MGCC - Futures Initial Margin  ");
        purposeCodes.add("MGSC - Futures Initial Margin Client Owned Segregated Cash Collateral ");
        purposeCodes.add("MP2B - Mobile P2B Payment");
        purposeCodes.add("MP2P - Mobile P2P Payment");
        purposeCodes.add("MP2P - Mobile P2P Payment");
        purposeCodes.add("MSVC - MultipleServiceTypes");
        purposeCodes.add("MTUP - Mobile Top Up");
        purposeCodes.add("NETT - Netting");
        purposeCodes.add("NITX - Net Income Tax");
        purposeCodes.add("NOWS - Not Otherwise Specified");
        purposeCodes.add("NWCH - Network Charge");
        purposeCodes.add("NWCM - Network Communication");
        purposeCodes.add("OCCC - Client owned OCC pledged collateral");
        purposeCodes.add("OCDM - Order Cheque Domestic");
        purposeCodes.add("OCFG - Order Cheque Foreign");
        purposeCodes.add("OFEE - Opening Fee");
        purposeCodes.add("OPBC - OTC Option Broker owned Cash collateral ");
        purposeCodes.add("OPCC - OTC Option Client owned Cash collateral ");
        purposeCodes.add("OPSB - OTC Option Broker Owned Segregated Cash Collateral ");
        purposeCodes.add("OPSC - OTC Option Client Owned Cash Segregated Cash Collateral ");
        purposeCodes.add("OPTN - FX Option");
        purposeCodes.add("OTCD - OTC Derivatives");
        purposeCodes.add("OTHR - Other");
        purposeCodes.add("OTLC - Other Telecom Related Bill");
        purposeCodes.add("PADD - Preauthorized debit");
        purposeCodes.add("PAYR - Payroll");
        purposeCodes.add("PEFC - Pension Fund Contribution");
        purposeCodes.add("PENO - Payment Based On Enforcement Order");
        purposeCodes.add("PENS - Pension Payment");
        purposeCodes.add("PHON - Telephone Bill");
        purposeCodes.add("POPE - Point of Purchase Entry");
        purposeCodes.add("PPTI - Property Insurance");
        purposeCodes.add("PRCP - Price Payment");
        purposeCodes.add("PRME - Precious Metal");
        purposeCodes.add("PTSP - Payment Terms");
        purposeCodes.add("PTXP - Property Tax ");
        purposeCodes.add("RCKE - Re-presented Check Entry");
        purposeCodes.add("RCPT - Receipt Payment");
        purposeCodes.add("RDTX - Road Tax ");
        purposeCodes.add("REBT - Rebate ");
        purposeCodes.add("REFU - Refund");
        purposeCodes.add("RELG - Rental Lease General");
        purposeCodes.add("RENT - Rent");
        purposeCodes.add("REOD - Account Overdraft Repayment");
        purposeCodes.add("REPO - Repurchase Agreement");
        purposeCodes.add("RHBS - Rehabilitation Support");
        purposeCodes.add("RIMB - Reimbursement of a previous erroneous transaction");
        purposeCodes.add("RINP - Recurring Installment Payment");
        purposeCodes.add("RLWY - Railway");
        purposeCodes.add("ROYA - Royalties");
        purposeCodes.add("RPBC - Bi-lateral repo broker owned collateral ");
        purposeCodes.add("RPCC - Repo client owned collateral ");
        purposeCodes.add("RPNT - Bi-lateral repo internet netting");
        purposeCodes.add("RPSB - Bi-lateral repo broker owned segregated cash collateral ");
        purposeCodes.add("RPSC - Bi-lateral Repo client owned segregated cash collateral");
        purposeCodes.add("RRBN - Round Robin");
        purposeCodes.add("RRCT - Reimbursement Received Credit Transfer");
        purposeCodes.add("RVPM - Receive Against Payment");
        purposeCodes.add("RVPO - Reverse Repurchase Agreement");
        purposeCodes.add("SALA - Salary Payment");
        purposeCodes.add("SAVG - Savings");
        purposeCodes.add("SBSC - Securities Buy Sell Sell Buy Back");
        purposeCodes.add("SCIE - Single Currency IRS Exotic");
        purposeCodes.add("SCIR - Single Currency IRS");
        purposeCodes.add("SCRP - Securities Cross Products");
        purposeCodes.add("SCVE - Purchase Sale Of Services");
        purposeCodes.add("SECU - Securities");
        purposeCodes.add("SEPI - Securities Purchase In-house");
        purposeCodes.add("SERV - Service Charges");
        purposeCodes.add("SHBC - Broker owned collateral Short Sale");
        purposeCodes.add("SHCC - Client owned collateral Short Sale");
        purposeCodes.add("SHSL - Short Sell");
        purposeCodes.add("SLEB - Securities Lending And Borrowing");
        purposeCodes.add("SLOA - Secured Loan");
        purposeCodes.add("SLPI - Payment Slip Instruction");
        purposeCodes.add("SPLT - Split payments");
        purposeCodes.add("SPSP - Salary Pension Sum Payment");
        purposeCodes.add("SSBE - Social Security Benefit");
        purposeCodes.add("STDY - Study");
        purposeCodes.add("SUBS - Subscription");
        purposeCodes.add("SUPP - Supplier Payment");
        purposeCodes.add("SWBC - Swap Broker owned cash collateral ");
        purposeCodes.add("SWCC - Swap Client owned cash collateral ");
        purposeCodes.add("SWFP - Swap contract final payment");
        purposeCodes.add("SWPP - Swap contract partial payment");
        purposeCodes.add("SWPT - Swaption");
        purposeCodes.add("SWRS - Swap contract reset payment");
        purposeCodes.add("SWSB - Swaps Broker Owned Segregated Cash Collateral ");
        purposeCodes.add("SWSC - Swaps Client Owned Segregated Cash Collateral ");
        purposeCodes.add("SWUF - Swap contract upfront payment");
        purposeCodes.add("TAXR - Tax Refund");
        purposeCodes.add("TAXS - Tax Payment");
        purposeCodes.add("TBAN - TBA pair-off netting");
        purposeCodes.add("TBAS - To Be Announced");
        purposeCodes.add("TBBC - TBA Broker owned cash collateral");
        purposeCodes.add("TBCC - TBA Client owned cash collateral");
        purposeCodes.add("TBIL - Telecommunications Bill ");
        purposeCodes.add("TCSC - Town Council Service Charges ");
        purposeCodes.add("TELI - Telephone-Initiated Transaction");
        purposeCodes.add("TLRF - Non-US mutual fund trailer fee payment");
        purposeCodes.add("TLRR - Non-US mutual fund trailer fee rebate payment");
        purposeCodes.add("TMPG - TMPG claim payment");
        purposeCodes.add("TPRI - Tri Party Repo Interest");
        purposeCodes.add("TPRP - Tri-party Repo netting");
        purposeCodes.add("TRAD - TradeServices");
        purposeCodes.add("TRCP - Treasury Cross Product");
        purposeCodes.add("TREA - TreasuryPayment");
        purposeCodes.add("TRFD - TrustFund");
        purposeCodes.add("TRNC - Truncated Payment Slip");
        purposeCodes.add("TRPT - Road Pricing");
        purposeCodes.add("TRVC - Traveller Cheque");
        purposeCodes.add("UBIL - Utilities ");
        purposeCodes.add("UNIT - UnitTrust Purchase");
        purposeCodes.add("VATX - ValueAdded Tax Payment");
        purposeCodes.add("VIEW - Vision Care");
        purposeCodes.add("WEBI - Internet-Initiated Transaction");
        purposeCodes.add("WHLD - With Holding");
        purposeCodes.add("WTER - Water Bill");


        return purposeCodes;
    }

    public void manualScrollUsingIdUntilElementWithTextIsInView(String searchedItem, String id) {
        By el = d.createElementById(id);
        WaitHelpers.waitForElement(el, 10);
        List<MobileElement> mobileElementList = new ArrayList<>();
        mobileElementList = d.createElementsById(id);
        List<String> mobileElementListContent = new ArrayList<>();
        for (MobileElement element : mobileElementList){
            mobileElementListContent.add(element.getText());
        }
        if (mobileElementList.contains(searchedItem)){
            System.out.println("Element je pronadjen");
        }else {
            for (int i = 0; i<20; i++){

            }
        }
    }

    public void assertThereAreMoreThanTransactionsInTransactionListOFMyProducts(String id,int i) throws Exception {
        List<MobileElement> mobileElementList = new ArrayList<>();
        List<String> mobileElementListText = new ArrayList<>();
        int n = 0;
        while (n<30){
            try{
                n++;
                //mobileElementList = d.createMobileElementsByNativeId(id);
                mobileElementList = d.createElementsById(id);
                if(mobileElementList.size()==0){
                    //hp.swipeByCordinates(700,2000,700,700);
                }
                break;
            } catch(Exception e){
                if(Base.getDataFromFileConf(Hooks.rowinConfExcel,"DEVICE_NAME").contains("HUAWEI")) {
                    hp.swipeByCordinates(500, 1300, 500, 600);
                }
                    else{
                    hp.swipeByCordinates(500,1700,500,1000);
                    }
            }
        }
        for (MobileElement element : mobileElementList){
            mobileElementListText.add(element.getAttribute("text"));
        }
        n = 0;
        boolean go = true;
        while (go && n<30){
            go = false;
            n++;
            //WaitHelpers.waitForSeconds(3);
            if(Base.getDataFromFileConf(Hooks.rowinConfExcel,"DEVICE_NAME").contains("HUAWEI")) {
                hp.swipeByCordinates(500, 1300, 500, 600);
            }
            else{
                hp.swipeByCordinates(500,1700,500,1000);
            }
            try{
                List<MobileElement> drugaLista = d.createElementsById(id);
                for(MobileElement element : drugaLista){
                    if(mobileElementListText.contains(element.getAttribute("text"))){
                        go = true;
                    } else{
                        mobileElementListText.add(element.getAttribute("text"));
                        go = true;
                    }
                }
            } catch(Exception e){
                //hp.swipeByCordinates(700,2000,700,700);
            }

        }
        if(n>=200) {
            throw new Exception("Nije pronasao kontakte!");
        }
        Set<String> uniqueSet = new HashSet<>(mobileElementListText);
        List<String> resultList = new ArrayList<>(uniqueSet);
        Assert.assertTrue(resultList.size()>i);
    }

    public String shiftDigitsToRIght(String input) {
        /*String digitsOnly = input.replaceAll("[^0-9]", "");
        char separator = input.replaceAll("[^,]", "").charAt(0);
        if (digitsOnly.length() <= 1){
            return input;
        }
         //Shift digits to the right
        String shiftedNumber = digitsOnly.charAt(digitsOnly.length() - 1) + digitsOnly.substring(0, digitsOnly.length() - 1);

        // Insert separators (e.g., commas) at the appropriate positions
        StringBuilder result = new StringBuilder(input);
        int separatorIndex = input.indexOf(shiftedNumber.charAt(1));
        result.replace(separatorIndex, separatorIndex + 1, shiftedNumber.charAt(0) + ",");

        if (separatorIndex != -1) {
            result.setCharAt(separatorIndex + 1, separator);
        }

        return result.toString();*/
        String replacedInput = input.replace(",",".");
        Double d = Double.parseDouble(replacedInput);
        Double result = d / 10.00;
        DecimalFormat df = new DecimalFormat("#.00");
        String decimalFormatedResult = df.format(result);
        String formattedResult = decimalFormatedResult.toString().replace(".",",");
        return formattedResult;
    }

    public void assertOTPContainerIsCorrect() throws Throwable {
        MobileElement elementForWholePinContainer = d.createMobileElementByResourceId("nlb-card-container");
        Assert.assertTrue(elementForWholePinContainer.isDisplayed());

        //Za pin container
        String xPathForPinContainer = "//*[@resource-id='nlb-card-container']//android.widget.TextView[1]";
        MobileElement elementForPinContainter = x.createMobileElementByXpath(xPathForPinContainer);
        String pin = elementForPinContainter.getText();
        Assert.assertTrue(pin.matches("[0-9]{4} [0-9]{4}"));

        //Za copy button
        String xPathForCopyButton = "//*[@resource-id='nlb-card-container']//android.widget.Button";
        MobileElement elementForCopyButton = x.createMobileElementByXpath(xPathForCopyButton);
        hp.ClickOnElement(elementForCopyButton);
        String cliboard = (String) Toolkit.getDefaultToolkit().getSystemClipboard().getData(DataFlavor.stringFlavor);
        Assert.assertTrue(cliboard.matches("[0-9]{8}"));

        //Za success poruku
        String xPathForSuccessMainMessage = "//*[@text='Copied']";
        MobileElement elementForMainSuccessMessage = x.createMobileElementByXpath(xPathForSuccessMainMessage);
        Assert.assertTrue(elementForMainSuccessMessage.isDisplayed());
        String xPathForSuccessSubMessage = "//*[@text='One-time password copied to clipboard']";
        MobileElement elementForSubSuccessMessage = x.createMobileElementByXpath(xPathForSuccessSubMessage);
        Assert.assertTrue(elementForSubSuccessMessage.isDisplayed());

        //Za otp validity
        String xPathForOtpValidity = "//*[@text='One-time password validity']";
        String xPathForZeroSeconds = "//*[@text='0 s']";
        String xPathForThirtySeconds = "//*[@text='30 s']";

        MobileElement elementForOTPValidity = x.createMobileElementByXpath(xPathForOtpValidity);
        MobileElement elementForZeroSeconds = x.createMobileElementByXpath(xPathForZeroSeconds);
        MobileElement elementForThirtySeconds = x.createMobileElementByXpath(xPathForThirtySeconds);

        Assert.assertTrue(elementForOTPValidity.isDisplayed());
        Assert.assertTrue(elementForZeroSeconds.isDisplayed());
        Assert.assertTrue(elementForZeroSeconds.isDisplayed());

        WaitHelpers.waitForSeconds(35);
        hp.ClickOnElement(elementForCopyButton);
        String cliboard2 = (String) Toolkit.getDefaultToolkit().getSystemClipboard().getData(DataFlavor.stringFlavor);
        Assert.assertTrue(cliboard.matches("[0-9]{8}"));
        MobileElement elementForPinContainter2 = x.createMobileElementByXpath(xPathForPinContainer);
        String pin2 = elementForPinContainter2.getText();

        Assert.assertFalse(cliboard2.equals(cliboard));
        Assert.assertFalse(pin2.equals(pin));
    }

    public void tryWrongOtpFromClipboardOnWebPage(String url, String env) throws IOException, UnsupportedFlavorException {
        System.setProperty("webdriver.chrome.driver", "C:\\Users\\Jovan Jacov\\Documents\\Android GR UAT stabilizacija Adam\\NLBMobileGeneral\\resources\\chromedriver.exe");
        ChromeOptions options = new ChromeOptions();
        options.addArguments("--ignore-ssl-errors=yes");
        options.addArguments("--ignore-certificate-errors");
        WebDriver driver = new ChromeDriver(options);
        driver.get(url);
        WaitHelpers.waitForSeconds(15);


        if (env.equals("tst")){
            WebElement element = driver.findElement(By.xpath("//input[@name='iOSToggle']//following-sibling::div"));
            element.click();
            WaitHelpers.waitForSeconds(5);
        }



        String stringUsername = DataManager.getDataFromHashDatamap("4","web_username");
        WebElement username = driver.findElement(By.xpath("//label[contains(text(),'Uporabniško ime')]//following-sibling::*//input"));
        CharSequence charSequence = stringUsername;
        username.sendKeys(charSequence);

        WebElement password = driver.findElement(By.xpath("//label[contains(text(),'Login_OTP')]//following-sibling::*//input"));
        String clipboard = (String) Toolkit.getDefaultToolkit().getSystemClipboard().getData(DataFlavor.stringFlavor);
        password.sendKeys(clipboard);

        WebElement buttonLogin = driver.findElement(By.xpath("//*[text()='Prijava v NLB Klik']"));
        buttonLogin.click();
        WaitHelpers.waitForSeconds(5);

        WebElement assertElement = driver.findElement(By.xpath("//*[contains(text(),'Vnesli ste napačne podatke (uporabniško ime/enkratno geslo/PIN). Število preostalih poskusov: 4')]"));
        Assert.assertTrue(assertElement.isDisplayed());

        driver.quit();
    }

    public void findTheAppropriateTransactionForCancelingManualCategorization() throws Throwable {
        for (int i = 1; i < 5; i++){
            String xPath = "//*[@resource-id='nlb-item-row']["+i+"]";
            MobileElement element = x.createMobileElementByXpath(xPath);
            hp.ClickOnElement(element);

            By elWait = x.createByXpath("//*[@text='Settlement date']");
            WaitHelpers.waitForElement(elWait);

            By elForSplit = x.createByXpath("//*[@text='Split transaction']");
            if(hp.isElementDisplayed(elForSplit)){
                Base.back();
            } else {
                break;
            }
        }
    }

    public void findTheAppropriateTransactionAddingTags() throws Throwable {
        for (int i = 1; i < 5; i++){
            String xPath = "//*[@resource-id='nlb-item-row']["+i+"]";
            MobileElement element = x.createMobileElementByXpath(xPath);
            hp.ClickOnElement(element);

            By elWait = x.createByXpath("//*[@text='Settlement date']");
            WaitHelpers.waitForElement(elWait);

            hp.swipeByCordinates(500, 1800, 500, 600);
            By elForSplit = x.createByXpath("//*[@text='Tags']");
            if(hp.isElementDisplayed(elForSplit)){
                Base.back();
            } else {
                break;
            }
        }
    }

    public void EnterTextToElementByIdWithClear(String text, By el) throws Throwable {
        hp.enterTextToMobileElementWithClear(text,el);
    }

    public void scrollDownUntilCurrencyInSelectorIsFoundAndClick(String currency) throws Throwable {
        By el = tx.createElementByTextContains(currency);
        boolean isElementDisplayed = hp.isElementDisplayed(el, 5, 100);
        if (isElementDisplayed){
            MobileElement currencyElement = x.createMobileElementByText(currency);
            hp.ClickOnElement(currencyElement);
        }else {
            for (int i = 0; i <5; i++){
                MobileElement element = x.createMobileElementByXpath("//android.widget.ScrollView");

                Rectangle r = element.getRect(); // stabilnije od getLocation/getSize
                int startX = r.x + r.width / 2;
                int startY = r.y + (int)(r.height * 0.75);
                int endY   = r.y + (int)(r.height * 0.25);

                PointerInput finger = new PointerInput(PointerInput.Kind.TOUCH, "finger1");
                Sequence swipe = new Sequence(finger, 1);

                swipe.addAction(finger.createPointerMove(Duration.ZERO, PointerInput.Origin.viewport(), startX, startY));
                swipe.addAction(finger.createPointerDown(PointerInput.MouseButton.LEFT.asArg()));
                swipe.addAction(new Pause(finger, Duration.ofMillis(1000)));               // ekvivalent waitAction(1000ms)
                swipe.addAction(finger.createPointerMove(Duration.ofMillis(600), PointerInput.Origin.viewport(), startX, endY));
                swipe.addAction(finger.createPointerUp(PointerInput.MouseButton.LEFT.asArg()));

                driver.perform(Collections.singletonList(swipe));
                By elFor = tx.createElementByTextContains(currency);
                boolean isElementDisplayedFor = hp.isElementDisplayed(el, 5, 100);
                if (isElementDisplayedFor){
                    MobileElement currencyElementFor = x.createMobileElementByText(currency);
                    hp.ClickOnElement(currencyElementFor);
                    break;
                }
            }
        }
    }
    public static List<String> getDatesThisMonthUntilToday(String dateFormat) {
        // Get today's date
        LocalDate today = LocalDate.now();

        // Get the first day of the current month
        LocalDate firstDayOfMonth = today.withDayOfMonth(1);

        // Create a formatter with the specified format
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern(dateFormat);

        // Create a list to store the formatted dates
        List<String> dates = new ArrayList<>();

        // Loop through each day from the 1st of the month until today
        for (LocalDate date = firstDayOfMonth; !date.isAfter(today); date = date.plusDays(1)) {
            dates.add(date.format(formatter));
        }

        return dates;
    }

    public String getDateXDaysInPastFromTodayInFormat(int x, String format){
        LocalDate today = LocalDate.now();
        LocalDate pastDate = today.minusDays(x);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern(format);
        return pastDate.format(formatter);
    }

    public String getTodayDateInFormat(String format){
        LocalDate today = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern(format);
        return today.format(formatter);
    }

    public List<String> getAllElementsUntilTextFound(String id, String text) throws Exception {
        List<String> mobileElementListText = new ArrayList<>();
        int n = 0;
        boolean found = false;

        while (n < 10 && !found) { // Maximum of 10 scrolls
            try {
                n++;
                // Get elements by resource ID
                List<MobileElement> newElementList = d.createMobileElementsByResourceId(id);

                if (newElementList.size() == 0) {
                    // If no elements are found, perform swipe
                    hp.swipeByCordinates(700,1900,700,700);
                } else {
                    for (MobileElement element : newElementList) {
                        String elementText = element.getAttribute("text");

                        // Add only new elements' text (to avoid duplicates)
                        if (!mobileElementListText.contains(elementText)) {
                            mobileElementListText.add(elementText);
                        }
                    }

                    // After processing, check for the target element by XPath
                    MobileElement targetElement = x.createMobileElementByText(text);
                    if (targetElement != null && targetElement.getAttribute("text").contains(text)) {
                        found = true; // Stop further scrolling once the target element is found
                    }

                    // If not found, swipe to the next page
                    if (!found) {
                        hp.swipeByCordinates(700,1900,700,700);
                    }
                }

            } catch (Exception e) {
                // Handle any exception and attempt another swipe
                hp.swipeByCordinates(700,1900,700,700);
            }
        }

        if (mobileElementListText.isEmpty()) {
            throw new Exception("List is empty.");
        }

        return mobileElementListText; // Return the list of all unique elements' texts
    }

    public static List<String> getLast7DaysDatesInFormat(String format) {
        List<String> dates = new ArrayList<>();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern(format);
        LocalDate today = LocalDate.now();

        for (int i = 0; i < 7; i++) {
            LocalDate date = today.minusDays(i);
            dates.add(date.format(formatter));
        }

        return dates;
    }

    public static List<String> getDatesLastMonth(String dateFormat) {
        // Get today's date
        LocalDate today = LocalDate.now();

        // Get the first day of last month
        LocalDate firstDayOfLastMonth = today.minusMonths(1).withDayOfMonth(1);

        // Get the last day of last month
        LocalDate lastDayOfLastMonth = today.withDayOfMonth(1).minusDays(1);

        // Create a formatter with the specified format
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern(dateFormat);

        // Create a list to store the formatted dates
        List<String> dates = new ArrayList<>();

        // Loop through each day from the 1st to the last day of the last month
        for (LocalDate date = firstDayOfLastMonth; !date.isAfter(lastDayOfLastMonth); date = date.plusDays(1)) {
            dates.add(date.format(formatter));
        }

        return dates;
    }

    public int getHowManyMonthsAreBetweenTodayAndSelectedDate(int year, int month, int day){
        LocalDate pastDate = LocalDate.of(year, month, day).withDayOfMonth(1);

        // Get today's date
        LocalDate today = LocalDate.now().withDayOfMonth(1);

        // Calculate the difference between the two dates
        Period period = Period.between(pastDate, today);

        // Calculate the total number of months
        return period.getYears() * 12 + period.getMonths();
    }

    public String getDateInFormat(int year, int month, int day, String format){
        LocalDate pastDate = LocalDate.of(year, month, day);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern(format);
        return pastDate.format(formatter);
    }

    public static String getFormattedDate(int year, int month, int day, String format) {
        YearMonth yearMonth = YearMonth.of(year, month);
        int lastDayOfMonth = yearMonth.lengthOfMonth();
        int validDay = Math.min(day, lastDayOfMonth);

        LocalDate pastDate = LocalDate.of(year, month, validDay);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern(format);
        return pastDate.format(formatter);
    }

    public static List<String> getDatesBetween(int year1, int month1, int day1, int year2, int month2, int day2, String dateFormat) {
        // Create LocalDate objects for the start and end dates
        LocalDate startDate = LocalDate.of(year1, month1, day1);
        LocalDate endDate = LocalDate.of(year2, month2, day2);

        // Create a formatter with the specified format
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern(dateFormat);

        // Create a list to store the formatted dates
        List<String> dates = new ArrayList<>();

        // Loop through each day from the start to the end date
        for (LocalDate date = startDate; !date.isAfter(endDate); date = date.plusDays(1)) {
            dates.add(date.format(formatter));
        }

        return dates;
    }

    public static String getDateLastMonthDayX(int dayOfMonth, String format) {
        // Get today's date
        LocalDate today = LocalDate.now().withDayOfMonth(1);

        // Subtract one month from today's date and set the day to the specified dayOfMonth
        LocalDate dateLastMonth = today.minusMonths(1).withDayOfMonth(dayOfMonth);

        // Create a formatter with the specified format
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern(format);

        // Return the formatted date
        return dateLastMonth.format(formatter);
    }

    public void scrollElementByXpath(String xPath){
        By el = By.xpath(xPath);

        for(int i = 0; i<20; i++){
            if(hp.isElementNotPresent(el)){
                hp.scrollDown(driver);
            }
        }
    }

    public static List<String> getXYearsInPast(int amount) {
        List<String> years = new ArrayList<>();
        int currentYear = Year.now().getValue();

        for (int i = 0; i < amount; i++) {
            years.add(String.valueOf(currentYear - i));
        }

        return years;
    }

    public boolean isDateValid(String date, String format) {
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        sdf.setLenient(false);
        try {
            sdf.parse(date);
            return true;
        } catch (ParseException e) {
            return false;
        }
    }

    public void findTheAppropriateTransactionForManualCategorization() throws Throwable {
        for (int i = 1; i < 5; i++){
            String xPath = "//*[@resource-id='nlb-item-row']["+i+"]";
            MobileElement element = x.createMobileElementByXpath(xPath);
            hp.ClickOnElement(element);

            By elWait = x.createByXpath("//*[@text='Settlement date']");
            WaitHelpers.waitForElement(elWait);

            By elForSplit = x.createByXpath("//*[@text='Split transaction']");
            if(hp.isElementDisplayed(elForSplit)){
                Base.back();
            } else {
                break;
            }
        }
    }

    public void changeCategoryTo(String category) throws Throwable {
        String xPathToEnterSelectionString = "//*[@text='Select category']/following-sibling::*[1]";
        By elEnterSelectionString = x.createByXpath(xPathToEnterSelectionString);
        WaitHelpers.waitForElement(elEnterSelectionString);

        MobileElement elementToEnterSelectionString = x.createMobileElementByXpath(xPathToEnterSelectionString);
        hp.ClickOnElement(elementToEnterSelectionString);

        String xPathForWait = "//*[@text='Change category']";
        By elWait = x.createByXpath(xPathForWait);
        WaitHelpers.waitForElement(elWait);

        String xPathForScrollSelectedCategory = "//*[@text='"+category+"']";
        By el = By.xpath(xPathForScrollSelectedCategory);
        for(int i = 0; i<35; i++){
            if(hp.isElementNotPresent(el)){
                hp.scrollDown(driver);
            }
        }

        MobileElement elementForSelectedCategory = x.createMobileElementByXpath(xPathForScrollSelectedCategory);
        hp.ClickOnElement(elementForSelectedCategory);

        String xPathForWait2 = "//*[@text='Apply']";
        By elWait2 = x.createByXpath(xPathForWait2);
        WaitHelpers.waitForElement(elWait2);

        MobileElement elementForApply = x.createMobileElementByXpath(xPathForWait2);
        hp.ClickOnElement(elementForApply);

        WaitHelpers.waitForSeconds(3);

        String xPathForWait3 = "//*[@text='Send message']";
        By elWait3 = x.createByXpath(xPathForWait3);
        WaitHelpers.waitForElement(elWait3);

        String xPathForWait4 = "//*[@text='"+category+"']";
        By elWait4 = x.createByXpath(xPathForWait4);
        WaitHelpers.waitForElement(elWait4);

    }

    public String returnRandomAmount() {
        Random random = new Random();
        // Generate random number between 10 and 300
        double randomNumber = 10 + (300 - 10) * random.nextDouble();

        // Format the number to two decimal places
        DecimalFormat df = new DecimalFormat("###.00");
        String formattedNumber = df.format(randomNumber);

        // Output the result
        System.out.println("Random number: " + formattedNumber);
        return formattedNumber;
    }

    public void checkIfPINIsNeededAndCompletePaymentForWithAssert(String text) throws Throwable {
        String status = (String) DataManager.userObject.get("StatusOfPayment");

        if(Base.testPlatform.equals("iOS")) {
            if (status.equals("NOK")) {
                String xPath = "//XCUIElementTypeStaticText[contains(@value, 'Please enter your PIN.')]";
                By el = By.xpath(xPath);
                boolean pinExists = hp.isElementDisplayed(el, 15, 1000);

                if (pinExists == true) {
                    String pin = "1379";
                    sendKeys(pin);
                    //String xPath1 = "(//XCUIElementTypeButton[@name='Confirm'])[2]";
                    //String xPath1 = "//XCUIElementTypeStaticText[@name='Confirm']/ancestor::XCUIElementTypeButton[@name='Confirm']";
                    String xPath1 = "//XCUIElementTypeImage[@name='confirmPayment']//following-sibling::XCUIElementTypeButton[@name='Confirm']";
                    By element = x.createByXpath(xPath1);
                    hp.clickElement(element);
                    String xPath2 = "//XCUIElementTypeStaticText[@name='" + text + "']";
                    By elementStatusMessage = x.createByXpath(xPath2);
                    Assert.assertTrue(hp.isElementDisplayed(elementStatusMessage, 15, 1000));
                } else {
                    Assert.assertFalse(true);
                }
            } else {
                System.out.println("This method was not needed.");
            }
        } else{
            if (status.equals("NOK")){
                String xPath = "//*[@text = \"Enter PIN\"]";
                By el2 = x.createByXpath(xPath);
                WaitHelpers.waitForElement(el2, 100);
                By el = By.xpath(xPath);
                boolean pinExists = hp.isElementDisplayed(el,15,1000);

                if( pinExists == true){
                    String PIN = "1379";
                    Character[] character = Utilities.toCharacterArray(PIN);
                    hp.pressKey(character);
                    //By element = d.createElementById("nlb-button-primary");
                    By element = tx.createElementByText("Confirm");
                    WaitHelpers.waitForElement(element, 10);
                    hp.clickElement(element);
                    System.out.println("Izasao je OTP");
                    //By elTextAssert = tx.createElementByTextContains(text);
                    //Assert.assertTrue(hp.isElementDisplayed(elTextAssert));
                    assertElementByTextContains(text);
                } else{
                    Assert.assertFalse(true);
                }
            } else{
                System.out.println("This method was not needed.");
            }
        }
    }

    public String returnDateInFormatMMMMyyyyIfGivenddMMyyyy(String inputDate) {
        DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("dd.MM.yyyy");
        LocalDate date = LocalDate.parse(inputDate, inputFormatter);

        DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("MMMM yyyy", Locale.ENGLISH);
        String formattedDate = date.format(outputFormatter);
        return formattedDate;
    }

    public int returnMaximalValidStartYearForStandingOrder() {
        LocalDate today = LocalDate.now();
        int currentYear = today.getYear();

        return currentYear + 1;
    }

    public int returnMaximalValidStartMonthForStandingOrder() {
        LocalDate today = LocalDate.now();
        int currentMonth = today.getMonthValue();

        return currentMonth;
    }

    public int returnMaximalValidStartDayForStandingOrder() {
        LocalDate today = LocalDate.now();
        int currentDay = today.getDayOfMonth();

        if (currentDay < 29) {
            return currentDay + 1;
        } else if (currentDay == 29 || currentDay == 30) {
            return 31;
        } else {
            return currentDay; // For days 31 and above, return the current day
        }
    }

    public int returnCurrentYear() {
        LocalDate today = LocalDate.now();
        return today.getYear();
    }

    public int returnCurrentMonth() {
        LocalDate today = LocalDate.now();
        return today.getMonthValue();
    }

    public int returnMinimalValidStartDayForStandingOrder() {
        LocalDate today = LocalDate.now();
        int currentDay = today.getDayOfMonth();
        YearMonth yearMonth = YearMonth.of(today.getYear(), today.getMonth());
        int lastDayOfMonth = yearMonth.lengthOfMonth();

        if (currentDay < 29) {
            return currentDay + 1;
        } else if (currentDay == 29 || currentDay == 30) {
            return lastDayOfMonth;
        } else {
            return currentDay; // For days 31 and above, return the current day
        }
    }

    public int returnNextMonth() {
        LocalDate today = LocalDate.now();
        int currentMonth = today.getMonthValue();
        int nextMonth = currentMonth + 1;

        return nextMonth > 12 ? 1 : nextMonth;
    }

    public int returnNextDay() {
        LocalDate today = LocalDate.now();
        int currentDay = today.getDayOfMonth();
        YearMonth yearMonth = YearMonth.of(today.getYear(), today.getMonth());
        int lastDayOfMonth = yearMonth.lengthOfMonth();
        int nextDay = currentDay + 1;

        return nextDay > lastDayOfMonth ? 1 : nextDay;
    }

    public int returnCurrentDay() {
        LocalDate today = LocalDate.now();
        return today.getDayOfMonth();
    }

    public int returnYearInFuture(int currentYear, int i) {
        return currentYear + i;
    }

    public int returnMaximalValidEndDayForStandingOrder() {
        LocalDate today = LocalDate.now();
        int currentDay = today.getDayOfMonth();
        YearMonth yearMonth = YearMonth.of(today.getYear(), today.getMonth());
        int lastDayOfMonth = yearMonth.lengthOfMonth();

        if (currentDay < 29) {
            return currentDay + 2;
        } else if (currentDay == 29 || currentDay == 30) {
            return lastDayOfMonth;
        } else {
            return currentDay; // For days 31 and above, return the current day
        }
    }

    public int extractMonthFromDateInFormat(String dateStr, String s) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern(s);
        try {
            LocalDate date = LocalDate.parse(dateStr, formatter);
            return date.getMonthValue();
        } catch (DateTimeParseException e) {
            System.err.println("Invalid date format: " + dateStr);
            return -1; // or throw an exception
        }
    }

    public String getMonthName(int month) {
        switch (month) {
            case 1:
                return "January";
            case 2:
                return "February";
            case 3:
                return "March";
            case 4:
                return "April";
            case 5:
                return "May";
            case 6:
                return "June";
            case 7:
                return "July";
            case 8:
                return "August";
            case 9:
                return "September";
            case 10:
                return "October";
            case 11:
                return "November";
            case 12:
                return "December";
            default:
                throw new IllegalArgumentException("Invalid month: " + month);
        }
    }

    public BigDecimal sumAllTransactionAmountsById(String s) throws Throwable {
        Set<String> seenElementIds = new HashSet<>();
        BigDecimal totalSum = BigDecimal.ZERO;

        int maxScrolls = 150;
        int scrolls = 0;
        boolean newDataFound = true;

        while (newDataFound && scrolls < maxScrolls) {
            newDataFound = false;
            List<MobileElement> paymentElements = d.createMobileElementsByResourceId(s);

            for (MobileElement element : paymentElements) {
                String elementId = ((RemoteWebElement) element).getId();

                if (!seenElementIds.contains(elementId)) {
                    seenElementIds.add(elementId);
                    String rawText = element.getText().trim(); // e.g., €10.00
                    BigDecimal value = parseCurrency(rawText);
                    totalSum = totalSum.add(value);
                    newDataFound = true;
                }
            }

            scrollDown();
            scrolls++;
        }

        System.out.println("Total Sum: " + totalSum);
        return totalSum;
    }

    private BigDecimal parseCurrency(String rawText) {
        // Check for minus sign (Unicode − or ASCII -)
        boolean isNegative = rawText.contains("−") || rawText.contains("-");

        // Remove currency symbols and spaces, keep digits, dot, comma
        String cleaned = rawText.replaceAll("[^\\d.,]", "");

        // Handle European format: dots = thousand separator, comma = decimal
        cleaned = cleaned.replace(".", "");       // Remove thousand separator
        cleaned = cleaned.replace(",", ".");      // Convert decimal comma to dot

        BigDecimal value = new BigDecimal(cleaned);
        return isNegative ? value.negate() : value;
    }

    private void scrollDown() {
        Dimension size = driver.manage().window().getSize();
        int width  = size.width;
        int height = size.height;

        int startX = width / 2;
        int startY = (int) (height * 0.75);
        int endY   = (int) (height * 0.50);

        Map<String, Object> args = new HashMap<>();
        args.put("startX", startX);
        args.put("startY", startY);
        args.put("endX", startX);
        args.put("endY", endY);
        args.put("speed", 2500); // opcionalno

        ((JavascriptExecutor) driver).executeScript("mobile: dragGesture", args);
    }

    private void scrollDownMore() {
        int height = driver.manage().window().getSize().height;
        int width = driver.manage().window().getSize().width;

        int startX = width / 2;
        int startY = (int) (height * 0.75);
        int endY = (int) (height * 0.25);

        new TouchAction<>(driver)
                .press(PointOption.point(startX, startY))
                .waitAction(WaitOptions.waitOptions(Duration.ofMillis(500)))
                .moveTo(PointOption.point(startX, endY))
                .release()
                .perform();
    }

    public String getPreviousMonthInFormat(String numberForPreviousMonth, String format) {
        int months = Integer.parseInt(numberForPreviousMonth);
        LocalDate date = LocalDate.now().minusMonths(months);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern(format);
        return date.format(formatter);
    }

    public String returnAllTextByIdSeparatedByComma(String s) {
        Set<String> seenElementIds = new HashSet<>();
        String result = "";

        int maxScrolls = 20;
        int scrolls = 0;
        boolean newDataFound = true;

        while (newDataFound && scrolls < maxScrolls) {
            newDataFound = false;
            List<MobileElement> paymentElements = d.createMobileElementsByResourceId(s);

            for (MobileElement element : paymentElements) {
                String elementId = ((RemoteWebElement) element).getId();

                if (!seenElementIds.contains(elementId)) {
                    seenElementIds.add(elementId);
                    String rawText = element.getText().trim();
                    result = result + rawText + ",";
                    newDataFound = true;
                }
            }
            scrollDown();
            scrolls++;
        }
        System.out.println(result);
        return result;
    }

    public String removeRandomLetter(String s) {
        if (s == null || s.isEmpty()) return s;

        int len = s.length();
        int i = 0;
        int[] starts = new int[s.codePointCount(0, len)];
        int n = 0;

        while (i < len) {
            int cp = s.codePointAt(i);
            if (Character.isLetter(cp)) {
                starts[n++] = i;
            }
            i += Character.charCount(cp);
        }
        if (n == 0) return s; // nema slova za brisanje

        int pick  = ThreadLocalRandom.current().nextInt(n);
        int start = starts[pick];
        int end   = s.offsetByCodePoints(start, 1);
        return s.substring(0, start) + s.substring(end);
    }

    public String swapTwoRandomLettersInSameWord(String s) {
        if (s == null || s.length() < 2) return s;

        List<int[]> pairs = new ArrayList<>();

        // Prolazimo kroz string po code point-ovima (bez lomljenja Unicode znakova)
        for (int i = 0; i < s.length(); ) {
            int cp1 = s.codePointAt(i);
            int next = i + Character.charCount(cp1);
            if (next >= s.length()) break;

            int cp2 = s.codePointAt(next);

            // Uzimamo samo parove slova koja su jedno do drugog (dakle u istoj reči)
            if (Character.isLetter(cp1) && Character.isLetter(cp2)) {
                pairs.add(new int[]{i, next});
            }
            i = next;
        }

        if (pairs.isEmpty()) return s; // nema šta da se zameni

        // Izaberi nasumičan par susednih slova
        int[] pick = pairs.get(ThreadLocalRandom.current().nextInt(pairs.size()));
        int i1 = pick[0];
        int i2 = pick[1];

        int end2 = i2 + Character.charCount(s.codePointAt(i2));

        String first  = new String(Character.toChars(s.codePointAt(i1)));
        String second = new String(Character.toChars(s.codePointAt(i2)));

        // Sastavi rezultat: ... + drugo slovo + prvo slovo + ...
        return s.substring(0, i1) + second + first + s.substring(end2);
    }

    public String replaceRandomNonAWithA(String s) {
        if (s == null || s.isEmpty()) return s;

        List<Integer> starts = new ArrayList<>();
        int i = 0, n = s.length();

        // Nađi sve pozicije slova koja NISU A/а (latin ili ćirilica)
        while (i < n) {
            int cp = s.codePointAt(i);
            if (Character.isLetter(cp) && !isA(cp)) {
                starts.add(i);
            }
            i += Character.charCount(cp);
        }

        if (starts.isEmpty()) {
            // Nema slova za zamenu (ili su sva već A)
            return s;
        }

        // Izaberi nasumičnu poziciju i zameni tim "A" koje odgovara pismu i veličini
        int start = starts.get(ThreadLocalRandom.current().nextInt(starts.size()));
        int end   = s.offsetByCodePoints(start, 1);
        int oldCp = s.codePointAt(start);

        int replCp = replacementAFor(oldCp); // zadrži pismo i case
        String repl = new String(Character.toChars(replCp));

        return s.substring(0, start) + repl + s.substring(end);
    }

    // Da li je slovo A (latin 'A'/'a' ili ćirilično 'А'/'а')
    private static boolean isA(int cp) {
        return cp == 'A' || cp == 'a'        // latin
                || cp == 0x0410 || cp == 0x0430; // ćirilično А/а
    }

    // Vrati "A" koje odgovara pismu (latin/ćirilica) i veličini slova
    private static int replacementAFor(int originalCp) {
        boolean upper = Character.isUpperCase(originalCp);
        Character.UnicodeBlock blk = Character.UnicodeBlock.of(originalCp);

        boolean cyr = blk == Character.UnicodeBlock.CYRILLIC
                || blk == Character.UnicodeBlock.CYRILLIC_SUPPLEMENTARY
                || blk == Character.UnicodeBlock.CYRILLIC_EXTENDED_A
                || blk == Character.UnicodeBlock.CYRILLIC_EXTENDED_B;

        if (cyr) {
            return upper ? 0x0410 : 0x0430; // Ćirilično А/а
        } else {
            return upper ? 'A' : 'a';       // Latin A/a
        }
    }

    public String replaceLastLetterAorS(String s) {
        if (s == null || s.isEmpty()) return s;

        int i = s.length();
        while (i > 0) {
            int cp = s.codePointBefore(i);
            int start = i - Character.charCount(cp);

            if (Character.isLetter(cp)) {
                int end = i; // kraj tog slova (komb. akcenti, ako postoje, ostaju posle)
                final boolean isA = isA(cp);

                int repl = isA ? toScriptCaseS(cp) : toScriptCaseA(cp);
                String r = new String(Character.toChars(repl));
                return s.substring(0, start) + r + s.substring(end);
            }
            i = start; // idi na prethodni code point
        }
        // Nema nijednog slova
        return s;
    }

    private static int toScriptCaseA(int originalCp) {
        boolean upper = Character.isUpperCase(originalCp);
        Character.UnicodeScript script = Character.UnicodeScript.of(originalCp);

        if (script == Character.UnicodeScript.CYRILLIC) {
            return upper ? 0x0410 : 0x0430; // А/а
        } else {
            return upper ? 'A' : 'a';       // A/a
        }
    }

    // Vrati S/s u istom pismu i istog "case"-a kao originalno slovo
    private static int toScriptCaseS(int originalCp) {
        boolean upper = Character.isUpperCase(originalCp);
        Character.UnicodeScript script = Character.UnicodeScript.of(originalCp);

        if (script == Character.UnicodeScript.CYRILLIC) {
            return upper ? 0x0421 : 0x0441; // С/с (ćirilica)
        } else {
            return upper ? 'S' : 's';       // S/s (latinica)
        }
    }

}
