package si.nlb.testautomation.NLBMobileAutomation.Test;

import com.fasterxml.jackson.core.JsonProcessingException;
import io.appium.java_client.MobileElement;
import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.android.nativekey.AndroidKey;
import javafx.util.Pair;
import org.openqa.selenium.*;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Wait;
import io.appium.java_client.android.nativekey.KeyEvent;
import net.sf.cglib.core.Local;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.xmlbeans.impl.tool.StreamInstanceValidator;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.springframework.security.core.parameters.P;
import si.nlb.testautomation.NLBMobileAutomation.Action.HTTPAction;
import si.nlb.testautomation.NLBMobileAutomation.Action.PSD2Api;
import si.nlb.testautomation.NLBMobileAutomation.Action.RoutineHelper;
import si.nlb.testautomation.NLBMobileAutomation.Helpers.Log;
import si.nlb.testautomation.NLBMobileAutomation.Helpers.Utilities;
import si.nlb.testautomation.NLBMobileAutomation.Selectors.*;
import si.nlb.testautomation.NLBMobileAutomation.Wait.WaitHelpers;
import si.nlb.testautomation.NLBMobileAutomation.Action.ActionApiHelpers;
import si.nlb.testautomation.NLBMobileAutomation.Core.Base;
import si.nlb.testautomation.NLBMobileAutomation.Data.DataManager;

import io.appium.java_client.MobileBy;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;

import io.cucumber.java.en.When;
import org.junit.Assert;

import java.awt.datatransfer.DataFlavor;
import java.awt.datatransfer.UnsupportedFlavorException;
import java.io.IOException;
import java.awt.*;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.*;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import org.openqa.selenium.interactions.Actions;


import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static si.nlb.testautomation.NLBMobileAutomation.Core.Base.driver;

public class Steps {
    ActionApiHelpers hp = new ActionApiHelpers();
    RoutineHelper rh = new RoutineHelper();
    SelectById d = new SelectById();
    HTTPAction ha = new HTTPAction();
    SelectByUIAutomator ui = new SelectByUIAutomator();
    SelectByText tx = new SelectByText();
    SelectByXpath x = new SelectByXpath();
    SelectByClass cn = new SelectByClass();
    private Pair<String, String> pairs;

    //region - App command -
    @Given("Go to APP")
    public void goToBond() throws Throwable {
        hp.goToApp();
    }

    @Given("Open Application")
    public void openApplication() throws Throwable {
        hp.goToApp();
    }

    @And("Breakpoint")
    public void breakpoint() {
        WaitHelpers.waitForSeconds(1);
    }

    @And("Hide keyboard")
    public void hideKeyboard() throws Throwable {
        hp.hideKeyboard();
    }

    @And("Wait")
    public void waitSleep() throws InterruptedException {
        Thread.sleep(5000);
    }

    @And("Press done button")
    public void pressDoneButton() throws InterruptedException {
        rh.pressDoneButton();
    }
    //endregion - App command -

    //region - Click -
    @Then("Click on button by id {string}")
    public void clickOnButtonById(String id) throws Throwable {
        rh.clickOnElementById(id);
    }

    @Then("Click on static text element by text {string}")
    public void clickOnStaticTextElementByText(String arg0) throws Throwable {
        rh.clickOnStaticTextElementByText(arg0);
    }

    @When("Click on element by text {string}")
    public void clickOnElementByText(String text) throws Exception {
        rh.clickOnElementByText(text);
    }

    @And("Click on first element by text {string}")
    public void clickOnFirstElementByText(String text) throws Exception {
        By element = tx.createElementByTextContains(text);
        hp.clickElement(element, text);
    }

    @And("Click on field {string}")
    public void clickOnField(String text) throws Exception {
        By inputField = null;
        if (Base.testPlatform.equals("Android")) {
            inputField = MobileBy.xpath("//android.widget.LinearLayout//*[@text = '" + text + "']/preceding::android.widget.EditText[1]");
        }
        hp.clickElement(inputField, text);
    }

    @Then("Click unique button by text {string}")
    public void clickUniqueButtonByText(String text) throws Throwable {
        rh.clickOnUniqueTextContains(text);
    }

    @Then("Click on menu by xpath")
    public void clickOnMenuByXpath() throws Throwable {
        rh.clickNavigationView();
    }

    @And("Click on native button by id {string}")
    public void clickOnNativeButtonById(String id) throws Exception {
        rh.clickOnNativeElementById(id);
    }

    @And("Click on {string} button index {string}")
    public void clickOnButtonIdex(String text, String index) throws Throwable {
        By element = x.createButtonNameIndex(text, index);
        hp.clickElement(element, text);
    }

    @And("Click on info button {string}")
    public void clickOnInfoButton(String index) throws Exception {
        rh.clickOnButtonByIndex(index);
    }

    @And("Click on field preceding text {string}")
    public void clickOnFieldPrecedingText(String text) throws Exception {
        By element = x.createLayoutPrecedingText(text);
        hp.clickElement(element, text);
    }

    @And("Click on button by id {string} index {string}")
    public void clickOnButtonByIdIndex(String id, String index) throws Throwable {
        hp.clickElement(ui.assertElementByIdIndex(id, index), id);
    }
    //endregion - Click -

    //region - Enter text to element -
    @And("Enter text {string} from {string} column in element by id {string}")
    public void enterTextFromColumnInElementById(String index, String columnName, String id) throws Throwable {
        String value = DataManager.getDataFromHashDatamap(index, columnName);
        rh.enterTextToElementById(value, id);
    }

    @And("Enter text {string} plus random number in field by id {string}")
    public void enterTextPlusRandomNumberInFieldById(String text, String id) throws Throwable {
        String value = text + Utilities.randomNumber(7);
        rh.enterTextToElementById(value, id);
    }

    @And("Enter PIN from Excel {string} columnName {string} on text field {string}")
    public void enterPINFromExcelColumnName(String rowIndex, String columnName, String index) throws InterruptedException {
        String PIN = DataManager.getDataFromHashDatamap(rowIndex, columnName);
        if (Base.testPlatform.equals("Android")) {
            Character[] character = Utilities.toCharacterArray(PIN);
            hp.pressKey(character);
        }
        if (Base.testPlatform.equals("iOS")) {
            Character[] characters = Utilities.toCharacterArray(PIN);
            int i = 1;
            for (char c : characters) {
                By el = MobileBy.xpath("//XCUIElementTypeOther[" + index + "]/XCUIElementTypeSecureTextField[" + i + "]");
                driver.findElement(el).sendKeys(String.valueOf(c));
                i++;
            }
        }
    }

    @And("Enter OTP code from DB from Excel {string} columnName {string}")
    public void enterOTPCodeFromDBFromExcelColumnNameInFieldDataBind(String rowIndex, String columnName) throws InterruptedException {
        String mobile = DataManager.getDataFromHashDatamap(rowIndex, columnName);
        String otp = HTTPAction.OTPCode(mobile);
        if (Base.testPlatform.equals("Android")) {
            Character[] character = Utilities.toCharacterArray(otp);
            hp.pressKey(character);
        }
        if (Base.testPlatform.equals("iOS")) {
            Character[] characters = Utilities.toCharacterArray(otp);
            int i = 1;
            for (char c : characters) {
                By el = MobileBy.xpath("//XCUIElementTypeTextField[" + i + "]");
                driver.findElement(el).sendKeys(String.valueOf(c));
                Log.info("Secure text field is visible");
                i++;
            }
        }
        Log.info("!!!!!! Send OTP: " + otp);
    }

    @And("Enter text {string} in secure field {string} preceding text {string}")
    public void enterTextInSecureFieldPrecedingText(String value, String index, String text) throws Throwable {
        rh.enterTextInputSecureFiledPrecedingText(value, index, text);
    }

    @And("Enter text {string} from {string} column in element {string} {string}")
    public void enterTextFromColumnInElement(String rowindex, String columnName, String text, String index) throws InterruptedException {
        String value = DataManager.getDataFromHashDatamap(rowindex, columnName);
        By element = x.createTypeTextField(text, index);
        hp.enterTextToElement(value, element);
    }

    @And("Enter text {string} from {string} column in secure field {string} preceding text: {string}")
    public void ienterTextInSecureFieldPrecedingText(String arg0, String columnName, String index, String text) throws Throwable {
        String value = DataManager.getDataFromHashDatamap(arg0, columnName);
        rh.enterTextInputSecureFiledPrecedingText(value, index, text);
    }
    //endregion - Enter text to element -

    //region - Assert -
    @Then("Assert element {string} by id")
    public void AssertElementById(String id) throws Throwable {
        rh.assertElementById(id);
    }

    @Then("Assert element static text by text {string}")
    public void assertObjectByStaticText(String text) throws Throwable {
        rh.assertObjectByStaticText(text);
    }

    @Then("Assert and scroll button by text {string}")
    public void scrollAndAssertButtonByText(String text) throws Throwable {
        rh.scrollAndAssertButtonByText(text);
    }

    @Then("Assert button by text {string}")
    public void assertButtonByText(String text) throws Throwable {
        rh.assertButtonByText(text);
    }

    @Then("Assert element by text {string}")
    public void assertElementByText(String text) throws Throwable {
        rh.assertElementByTextContains(text);
    }

    @Then("Assert element by text {string} index {string}")
    public void assertElementByTextAndIndex(String text, String index) throws Throwable {
        rh.assertElementByTextAndIndex(text, index);
    }

    @And("Assert menu by xpath")
    public void assertMenuByXpath() throws Throwable {
        rh.assertNavigationView();
    }

    @And("Assert {string} widget")
    public void assertWidget(String text) throws Throwable {
        rh.assertWidget(text);
    }

    @Then("Assert element {string} exist")
    public void assertElementExist(String text) throws Throwable {
        rh.assertElementEnabled(text);
    }

    @And("Assert save value {string} in element {string}")
    public void assertSaveValueInElement(String paramName, String text1) throws Throwable {
        String text2 = DataManager.userObject.get(paramName).toString();
        if (Base.testPlatform.equals("Android")) {
            By el = tx.createElementByTextPrecedingText(text1, text2);
            hp.assertElementDisplayed(el);
        }
        if (Base.testPlatform.equals("iOS")) {
            By el = MobileBy.xpath("//XCUIElementTypeButton[@name='" + text2 + "']");
            hp.assertElementDisplayed(el);
        }
    }

    @And("Assert element by class {string} is checked")
    public void assertElementByClassIsChecked(String className) throws Throwable {
        By el = cn.createElementByClassName(className);
        Assert.assertTrue(hp.assertIsChecked(el));
    }

    @And("Assert field {string} is empty using xpath")
    public void assertFieldIsEmptyUsingXpath(String text) {
        By inputField = MobileBy.xpath("//XCUIElementTypeTextView");
        WebElement element = driver.findElement(inputField);
        String a = element.getText();
        if (a.isEmpty())
            Log.info("!!!!!!! Field: " + text + " is empty !!!!!!!!");
        else
            Log.error("!!!!!!! Field: " + text + " is NOT empty !!!!!!!!");
        assertTrue(a.isEmpty());
    }

    @And("Assert button is {string}")
    public void assertButtonIs(String text) throws Throwable {
        By el = MobileBy.xpath("//XCUIElementTypeButton[@name='" + text + "']");
        hp.assertElementDisplayed(el);
    }

    @And("Assert the difference between {string} and {string} is {string}")
    public void assertTheDifferenceBetweenAndIs(String paramName1, String paramName2, String paramName3) {
        double balanceBefore = Double.parseDouble(DataManager.userObject.get(paramName1).toString().replace(",", ""));
        double balanceAfter = Double.parseDouble(DataManager.userObject.get(paramName2).toString().replace(",", ""));
        String[] s = DataManager.userObject.get(paramName3).toString().split(" ");
        double amount = Double.parseDouble(s[0]);
        double result = balanceBefore - amount;
        hp.assertEqualDoubleAmounts(balanceAfter, result);
    }

    @And("Assert the difference between {string} and {string} is {string} from {string}")
    public void assertTheDifferenceBetweenAndIsFrom(String paramName1, String paramName2, String index, String columnName) {
        double balanceBefore = Double.parseDouble(DataManager.userObject.get(paramName1).toString().replace(",", ""));
        double balanceAfter = Double.parseDouble(DataManager.userObject.get(paramName2).toString().replace(",", ""));
        double amount = Double.parseDouble(DataManager.getDataFromHashDatamap(index, columnName));
        double result = balanceBefore - amount;
        hp.assertEqualDoubleAmounts(balanceAfter, result);
    }

    @Then("Assert element by text {string} in {string}")
    public void assertElementByTextIn(String text2, String text1) throws Throwable {
        By el = MobileBy.xpath("(//*[contains(@text,'" + text1 + "')])[1]/..//*[contains(@text,'" + text2 + "')][1]");
        hp.assertElementDisplayed(el);
    }

    @And("Assert payment into DB by saved SSN")
    public void assertPaymentIntoDBBySavedSSN() throws SQLException {
        WaitHelpers.waitForSeconds(2);
        String SSN = DataManager.userObject.get("{SSN}").toString();
        rh.assertPaymentIntoDBBySavedSSN(SSN);
    }

    @And("Assert text {string} in element {string}")
    public void assertTextInElement(String text2, String text1) throws Throwable {
        if (Base.testPlatform.equals("Android")) {
            By el = tx.createElementByTextPrecedingText(text1, text2);
            hp.assertElementDisplayed(el);
        }
        if (Base.testPlatform.equals("iOS")) {
            By el = MobileBy.xpath("//XCUIElementTypeButton[@name='" + text2 + "']");
            hp.assertElementDisplayed(el);
        }
    }

    @And("Assert payment into DB by saved Description")
    public void assertPaymentIntoDBBySavedDescription() throws SQLException {
        WaitHelpers.waitForSeconds(2);
        String desc = DataManager.userObject.get("PaymentDescription").toString();
        rh.assertPaymentIntoDBBySavedDescription(desc);
    }
    //endregion - Assert -

    //region - Save -
    @And("Save text used element {string} index {string} in {string}")
    public void saveCurrencyUsedElementIn(String text, String index, String paramName) {
        By el = MobileBy.xpath("(//*[contains(@name,'" + text + "')])[1]//following::XCUIElementTypeStaticText[" + index + "]");
        DataManager.userObject.put(paramName, hp.GetTextFromElement(el));
        Log.info("Text from element: " + hp.GetTextFromElement(el) + " is saved in: " + paramName + " !!!!!!!!!");
    }

    @And("Save amount after text {string} in {string}")
    public void saveAmountAfterTextIn(String text, String paramName) throws Throwable {
        if (Base.testPlatform.equals("iOS")) {
            By el = MobileBy.xpath("(//XCUIElementTypeStaticText[@name='" + text + "']/following-sibling::XCUIElementTypeStaticText)[1]");
            hp.isElementDisplayed(el);
            DataManager.userObject.put(paramName, hp.GetTextFromElement(el));
            Log.info("Save value: " + hp.GetTextFromElement(el) + " in: " + paramName);
        }
        if (Base.testPlatform.equals("Android")) {
            By el = MobileBy.xpath("(//*[contains(@text,'" + text + "')]/following-sibling::android.widget.TextView)[1]");
            hp.isElementDisplayed(el);
            DataManager.userObject.put(paramName, hp.GetTextFromElement(el));
            Log.info("Save value: " + hp.GetTextFromElement(el) + " in: " + paramName);
        }
    }

    @And("Save text from element id: {string} in {string}")
    public void saveTextFromElementIdIn(String id, String paramName) {
        By el = d.createElementById(id);
        DataManager.userObject.put(paramName, hp.GetTextFromElement(el));
        Log.info("Text from element: " + hp.GetTextFromElement(el) + " is saved in: " + paramName + " !!!!!!!!!");
    }


    @And("Save balance payment using element {string} {string} in {string}")
    public void saveBalanceFromElementIn(String text, String index, String paramName) throws Throwable {
        if (Base.testPlatform.equals("Android")) {
            By el = MobileBy.xpath("(//*[contains(@text,'" + text + "')])[" + index + "]//following::android.widget.TextView[1]");
            hp.isElementDisplayed(el);
            DataManager.userObject.put(paramName, hp.GetTextFromElement(el));
            Log.info("Save value: " + hp.GetTextFromElement(el) + " in: " + paramName);
        }
        if (Base.testPlatform.equals("iOS")) {
            By el = MobileBy.xpath("(//*[contains(@name,'" + text + "')])[" + index + "]//following::XCUIElementTypeStaticText[1]");
            hp.isElementDisplayed(el);
            DataManager.userObject.put(paramName, hp.GetTextFromElement(el));
            Log.info("Save value: " + hp.GetTextFromElement(el) + " in: " + paramName);
        }
    }

    @And("Save from Excel {string} columnName {string}")
    public void saveFromExcelColumnName(String rowIndex, String columnName) {
        String text = DataManager.getDataFromHashDatamap(rowIndex, columnName);
        DataManager.userObject.put(columnName, text);
        Log.info("Save value: " + text);
    }
    //endregion - Save -

    //region - Send -
    @And("Send incorrect OTP code {string}")
    public void sendOTPCode(String otp) throws InterruptedException {
        if (Base.testPlatform.equals("Android")) {
            Character[] character = Utilities.toCharacterArray(otp);
            hp.pressKey(character);
        }
    }

    @And("Send incorrect OTP code use random function")
    public void sendIncorrectOTPCodeUseRandomFunction() throws InterruptedException {
        if (Base.testPlatform.equals("Android")) {
            String otp = Utilities.randomNumber(6);
            Character[] character = Utilities.toCharacterArray(otp);
            hp.pressKey(character);
        }
        if (Base.testPlatform.equals("iOS")) {
            String otp = Utilities.randomNumber(6);
            Character[] characters = Utilities.toCharacterArray(otp);
            int i = 1;
            for (char c : characters) {
                By el = MobileBy.xpath("//XCUIElementTypeTextField[" + i + "]");
                driver.findElement(el).sendKeys(String.valueOf(c));
                Log.info("Secure text field is visible");
                i++;
            }

        }
    }

    @And("Send correct PIN {string} from {string} column")
    public void sendCorrectPINFromColumn(String rowindex, String columnName) throws InterruptedException {
        String pin = DataManager.getDataFromHashDatamap(rowindex, columnName);
        if (Base.testPlatform.equals("Android")) {
            WaitHelpers.waitForSeconds(5);
            By el = d.createElementById("pinContainer");
            WaitHelpers.waitForElement(el);
            Character[] character = Utilities.toCharacterArray(pin);
            hp.pressKey(character);
        }
        if (Base.testPlatform.equals("iOS")) {
            Character[] characters = Utilities.toCharacterArray(pin);
            int i = 1;
            for (char c : characters) {
                By el = MobileBy.xpath("//*[@name='Enter PIN']/../XCUIElementTypeOther[2]/XCUIElementTypeOther" + i + "]");
                driver.findElement(el).sendKeys(String.valueOf(c));
                i++;
            }
        }
    }
    //endregion - Send -

    //region - Scroll and swipe -
    @Then("Scroll {string} until element with id {string} is on screen")
    public void scrollUtilElementWithId(String direction, String text) throws InterruptedException {
        rh.scrollIntoViewById(text, direction);
    }

    @And("Scroll {string} until element with text {string} from excel {string} is in view")
    public void scrollUntilElementWithTextFromExcelIsInView(String direction, String rowindex, String columnName) throws InterruptedException {
        String text = DataManager.getDataFromHashDatamap(rowindex, columnName);
        rh.scrollIntoViewByText(text, direction);
    }

    @Then("Swipe down anchor {double} start {double} end {double}")
    public void swipeDownStartEndAnchor(double anchorPercentage, double startPercentage, double endPercentage) throws InterruptedException {
        hp.verticalSwipeByPercentage(anchorPercentage, startPercentage, endPercentage);
    }
    //endregion - Scroll and swipe -

    //region - Wait -
    @And("Wait element {string} by id")
    public void waitElementById(String id) throws Throwable {
        By xpath = d.createElementById(id);
        for (int i = 1; i <= 30; i = i + 1) {
            try {
                if (!hp.isElementNotPresent(xpath)) {
                    break;
                } else
                    Log.info("Wait.....");
            } catch (NoSuchElementException e) {
            }
            Thread.sleep(1000);
        }
    }

    @And("Wait element {string} by text")
    public void waitElementByXpath(String text) throws Throwable {
        By el = tx.createElementByText(text);
        for (int i = 1; i <= 30; i = i + 1) {
            try {
                if (!hp.isElementNotPresent(el)) {
                    break;
                } else
                    Log.info("Wait.....");
            } catch (NoSuchElementException e) {
            }
            Thread.sleep(1000);
        }
    }

    @And("Remember element value {string} by id {string} under key {string}")
    public void rememberElementValueByIdUnderKey(String attribute, String id, String key) {
        rh.saveElementAttributeValueByAttributeAndIdUnderKey(attribute, id, key);
    }

    @Then("Assert Result of {string} operation is correct")
    public void assertResultOfOperationIsCorrect(String operation) {
        rh.assertResultOfOperationIsCorrect(operation);
    }

    @And("Click on element by id {string}")
    public void clickOnElementById(String id) throws Exception {
        By element = d.createElementByResourceId(id);
        hp.clickElement(element);
    }

    @And("Send PIN from Excel {string} columnName {string}")
    public void sendPINFromExcelColumnName(String rowindex, String columnName) throws InterruptedException {
        String pin = DataManager.getDataFromHashDatamap(rowindex, columnName);
        Character[] charObjectArray = Utilities.toCharacterArray(pin);
        hp.pressKey(charObjectArray);
    }

    @When("Swipe horizontal")
    public void swipeHorizontal() throws Throwable {
        if(Base.getDataFromFileConf(Hooks.rowinConfExcel,"DEVICE_NAME").contains("HUAWEI")){
            int startX = 500;
            int startY = 1300;
            int endX = 500;
            int endY = 600;
            hp.swipeByCordinates(startX, startY, endX, endY);
        } else{
            int startX = 500;
            int startY = 1800;
            int endX = 500;
            int endY = 600;
            hp.swipeByCordinates(startX, startY, endX, endY);
        }
    }

    @And("Click on {string} that has text {string}")
    public void clickOnThatHasText(String tag, String text) throws Exception {
        By element = tx.createElementByTagAndText(tag, text);
        hp.clickElement(element);
    }

    //endregion - Wait -

    @And("Wait {string} seconds")
    public void waitSeconds(String seconds) {
        int number = Integer.parseInt(seconds);
        WaitHelpers.waitForSeconds(number);
    }

    @And("Click on {string} that has text from {string} columnName {string}")
    public void clickOnThatHasTextFromColumnName(String tag, String rowindex, String columnName) throws Exception {
        String text = DataManager.getDataFromHashDatamap(rowindex, columnName);
        By element = tx.createElementByTagAndText(tag, text);
        hp.clickElement(element);
    }

    @And("Click on first upcoming payment")
    public void clickOnFirstUpcomingPayment() throws Throwable {
        List<MobileElement> byList = d.createElementsById("parentPaymentItemView");
        hp.ClickOnElement(byList.get(0));
    }

    @And("Assert there are more than 30 transactions")
    public void assertThereAreMoreThan30Transactions() throws Exception {
        rh.assertThereAreMoreThanTransactionsInTransactionListOFMyProducts("title",30);
    }

    @And("Assert element {string} by id is enabled")
    public void assertElementByIdIsEnabled(String id) throws Throwable {
        rh.assertElementByIdIsEnabled(id);
    }

    @And("Assert element {string} is empty by id")
    public void assertElementIsEmptyById(String id) {
        By element = d.createElementById(id);
        Assert.assertTrue(Base.driver.findElement(element).getAttribute("text").equals(""));
    }

    @And("Assert {string} from menu")
    public void assertFromMenu(String menuItem) {
        By element = x.createByXpath("//android.widget.FrameLayout[@content-desc='" + menuItem + "']");
        WaitHelpers.waitForElement(element, 15);
        Assert.assertTrue(Base.driver.findElement(element).isDisplayed());
    }

    @And("Click on Downloads from File menu")
    public void clickOnDownloadsFromFileMenu() throws Exception {
        By element = x.createByXpath("//*[@resource-id='android:id/title' and @text='Downloads']");
        hp.clickElement(element);
    }

    @And("Select file {string}")
    public void selectFile(String fileName) throws Exception {
        By element = x.createByXpath("//android.widget.TextView[@text='" + fileName + "']");
        hp.clickElement(element);
    }

    @And("Swipe down anchor {int} start {int} end {int} and assert")
    public void swipeDownAnchorStartEndAndAssert(int arg0, int arg1, int arg2) throws Throwable {
        hp.verticalSwipeByPercentageAndAssert(arg0, arg1, arg2);
    }

    @And("Assert list of element by id {string} is displayed")
    public void assertListOfElementByIdIsDisplayed(String id) {
        By elWait = d.createElementByResourceId(id);
        WaitHelpers.waitForElement(elWait);
        List<MobileElement> mobileElementList = d.createMobileElementsByResourceId(id);
        Assert.assertTrue(mobileElementList.size() != 0);
        rh.assertMobileElementsDisplayed(mobileElementList);
    }


    @And("Click {string} content description")
    public void clickContentDescription(String text) throws Exception {
        String xPath = "//android.widget.FrameLayout[@content-desc=\"" + text + "\"]";
        By element = x.createByXpath(xPath);
        hp.clickElement(element);
    }

    @And("Click on first element by id {string}")
    public void clickOnFirstElementById(String id) throws Throwable {
        /*List<MobileElement> mobileElementList = d.createElementsById(id);
        hp.ClickOnElement(mobileElementList.get(0));*/
        MobileElement element = d.createMobileElementByResourceId(id);
        hp.ClickOnElement(element);
    }

    @Then("Assert {string} content description is selected")
    public void assertContentDescriptionIsSelected(String text) {
        String xPath = "//android.widget.FrameLayout[@content-desc=\"" + text + "\"]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertEquals("true", element.getAttribute("selected"));
    }

    @And("Wait for element by id {string} to appear")
    public void waitForElementByIdToAppear(String id) {
        By element = d.createElementByResourceId(id);
        WaitHelpers.waitForElement(element, 100);
    }

    @And("Wait for element by text {string} to appear for {string} seconds")
    public void waitForElementByTextToAppear(String text, String time) {
        By element = tx.createElementByText(text);
        int timeInt = Integer.parseInt(time);
        WaitHelpers.waitForElement(element, timeInt);
    }

    @And("Click {string} content description from tag {string}")
    public void clickContentDescriptionFromTag(String text, String tag) throws Exception {
        String xPath = "//android.widget." + tag + "[@content-desc=\"" + text + "\"]";
        By element = x.createByXpath(xPath);
        hp.clickElement(element);
    }

    @Then("Assert {string} content description from tag {string} is selected")
    public void assertContentDescriptionFromTagIsSelected(String text, String tag) {
        String xPath = "//android.widget." + tag + "[@content-desc=\"" + text + "\"]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertEquals("true", element.getAttribute("selected"));
    }

    @And("Assert element {string} by id has current date in format {string}")
    public void assertElementByIdHasCurrentDateInFormat(String id, String dateFormat) {
        By el = d.createElementByResourceId(id);
        WaitHelpers.waitForElement(el);
        MobileElement element = d.createMobileElementByResourceId(id);
        String currentDate = Utilities.getTodayDateInFormat(dateFormat);
        String actualDate = element.getAttribute("text").replaceAll("\u00A0", "");
        Assert.assertEquals(currentDate, actualDate);
    }
    @And("Assert element {string} by id has current date in format {string} uppercase")
    public void assertElementByIdHasCurrentDateInFormatUpperCase(String id, String dateFormat) {
        MobileElement element = d.createMobileElementByResourceId(id);
        String currentDate = Utilities.getTodayDateInFormat(dateFormat);
        Assert.assertEquals(currentDate.toUpperCase(), element.getAttribute("text"));
    }

    @And("Assert text {string} in element id {string}")
    public void assertTextInElementId(String expected, String id) {
        By el = d.createElementByResourceId(id);
        WaitHelpers.waitForElement(el);
        MobileElement element = d.createMobileElementByResourceId(id);
        Assert.assertEquals(expected,element.getAttribute("text"));
    }

    @And("Assert text {string} in element id {string} with trim")
    public void assertTextInElementIdWithTrim(String expected, String id) {
        MobileElement element = d.createMobileElementByResourceId(id);
        Assert.assertEquals(expected,element.getAttribute("text").trim());
    }


    @And("Enter text {string} in element id {string}")
    public void enterTextInElementId(String text, String id) throws Throwable {
        rh.enterTextToElementById(text, id);
    }

    @And("Enter text {string} in element id {string} array")
    public void enterTextInElementIdArray(String text, String id) throws Throwable {
        if (Base.testPlatform.equals("iOS")) {
            String xpath = "//XCUIElementTypeStaticText[@name=\"I wish to exchange\"]//../XCUIElementTypeTextField[@name='receivingTxt']";
            By element = x.createByXpath(xpath);
            hp.enterTextToElement(text, element);
        }
        else {
            if(Base.getDataFromFileConf(Hooks.rowinConfExcel,"DEVICE_NAME").contains("HUAWEI")){
                String textForInput = rh.shiftDigitsToRIght(text);
                By element = d.createElementById(id);
                MobileElement typeElement = d.createMobileElementByResourceId(id);
                typeElement.clear();
                typeElement.setValue(textForInput);
            } else {
                By element = d.createElementById(id);
                hp.clickElement(element);
                ActionApiHelpers.clearInputField(driver.findElement(element));
                Character[] charObjectArray = Utilities.toCharacterArray(text);
                hp.pressKey(charObjectArray);
            }

        }
    }
    @And("Enter text from key {string} in element id {string} array")
    public void enterTextFromKeyInElementIdArray(String key, String id) throws Exception {
        String text = (String) DataManager.userObject.get(key);
        By element = d.createElementById(id);
        hp.clickElement(element);
        ActionApiHelpers.clearInputField(driver.findElement(element));
        Character[] charObjectArray = Utilities.toCharacterArray(text);
        hp.pressKey(charObjectArray);
    }

    @And("Assert To currency has all currencies")
    public void assertToCurrencyHasAllCurrencies() {
        String xPath = "//*[@resource-id='android:id/text1']";
        By element = x.createByXpath(xPath);
        WaitHelpers.waitForElement(element);
        rh.assertToCurrencyHasAllCurencies(xPath);
    }

    @And("Assert To currency has all currencies usd")
    public void assertToCurrencyHasAllCurrenciesUSD() {
        String xPath = "//*[@resource-id='android:id/text1']";
        By element = x.createByXpath(xPath);
        WaitHelpers.waitForElement(element);
        rh.assertToCurrencyHasAllCurenciesUSD(xPath);
    }

    @And("Assert To currency has all currencies aud")
    public void assertToCurrencyHasAllCurrenciesAUD() {
        String xPath = "//*[@resource-id='android:id/text1']";
        By element = x.createByXpath(xPath);
        WaitHelpers.waitForElement(element);
        rh.assertToCurrencyHasAllCurenciesAUD(xPath);
    }

    @And("Remove keyboard")
    public void removeKeyboard() {
        driver.hideKeyboard();
    }

    @And("Assert text under key {string} in element id {string}")
    public void assertTextUnderKeyInElementId(String key, String id) {
        MobileElement element = d.createMobileElementByResourceId(id);
        String expected = (String) DataManager.userObject.get(key);
        Assert.assertEquals(expected,element.getAttribute("text"));
    }

    @And("Assert text under key {string} is contained in element id {string}")
    public void assertTextUnderKeyIsContainedInElementId(String key, String id) {
        MobileElement element = d.createMobileElementByResourceId(id);
        String expected = (String) DataManager.userObject.get(key);
        Assert.assertTrue(element.getAttribute("text").contains(expected));
    }

    @And("Assert text in excel {string} columnName {string} in element id {string}")
    public void assertTextInExcelColumnNameInElementId(String rowindex, String columnName, String id) {
        String expected = DataManager.getDataFromHashDatamap(rowindex,columnName);
        MobileElement element = d.createMobileElementByResourceId(id);
        Assert.assertEquals(expected,element.getAttribute("text"));
    }

    @And("Assert list of element by id {string} ends in {string}")
    public void assertListOfElementByIdEndsIn(String id, String end) {
        List<MobileElement> mobileElementList = d.createElementsById(id);
        Assert.assertTrue(mobileElementList.size() != 0);
        rh.assertListOfMobileElementByIdEndsIn(mobileElementList,end);
    }
    @And("Assert list of element by resource id {string} ends in {string}")
    public void assertListOfElementByResourceIdEndsIn(String id, String end) {
        List<MobileElement> mobileElementList = d.createMobileElementsByResourceId(id);
        Assert.assertTrue(mobileElementList.size() != 0);
        rh.assertListOfMobileElementByIdEndsIn(mobileElementList,end);
    }


    @And("Assert that contacts are in alphabetical order {string}")
    public void assertThatContactsAreInAlphabeticalOrder(String id) throws Exception {
        List<String> list = rh.scrollDownAndPutEveryElementWithIdIntoList(id);
        List<String> orderedList = list;
        Collections.sort(orderedList);
        Assert.assertEquals(orderedList,list);
    }

    @And("Click on element by text from excel {string} columnName {string}")
    public void clickOnElementByTextFromExcelColumnName(String rowindex, String columnName) throws Exception {
        String text = DataManager.getDataFromHashDatamap(rowindex,columnName);
        By element = tx.createElementByText(text);
        hp.clickElement(element);
    }

    @And("Assert account from excel {string} column name {string} is displayed with swipe")
    public void assertAccountFromExcelColumnNameIsDisplayedWithSwipe(String rowindex, String columnName) throws Throwable {
        String accountNumber = DataManager.getDataFromHashDatamap(rowindex, columnName);
        MobileElement element = hp.swipeMobileElementIntoViewByTextAndReturnElement(accountNumber);
        Assert.assertTrue(element.isDisplayed());
    }

    @Then("Assert transactions are on monthly level")
    public void assertTransactionsAreOnMonthlyLevel() throws Throwable {
        By element = d.createElementById("textDate");
        hp.assertElementDisplayed(element);
    }

    @And("Select file with path from excel {string} column name {string}")
    public void selectFileWithPathFromExcelColumnName(String rowindex, String columnName) throws Exception {
        String fileName = DataManager.getDataFromHashDatamap(rowindex, columnName);
        By element = x.createByXpath("//android.widget.TextView[@text='" + fileName + "']");
        hp.clickElement(element);
    }

    @And("Enter random purpose into field by id {string} and remember it under key {string}")
    public void enterRandomPurposeIntoFieldByIdAndRememberItUnderKey(String id, String key) throws Throwable {
        String randomPurpose = rh.generateRandomStringOfCertainLenght(10);
        By element = d.createElementById(id);
        hp.enterTextToElement(randomPurpose,element);
        hp.saveTheValueToMapBasic(randomPurpose,key);
    }

    @And("Scroll until element with text under key {string} is in view and click")
    public void scrollUntilElementWithTextUnderKeyIsInViewAndClick(String key) throws Throwable {
        String text = (String) DataManager.userObject.get(key);
        //MobileElement element = (MobileElement) driver.findElement(MobileBy.AndroidUIAutomator("new UiScrollable(new UiSelector().scrollable(true))" + ".scrollIntoView(new UiSelector().textContains(\"" + text +"\"))"));
        String xPath = "//*[@text = '" + text + "']";
        By el = By.xpath(xPath);

        for(int i = 0; i<10; i++){
            if(hp.isElementNotPresent(el)){
                hp.scrollDown(driver);
            }
        }
        hp.clickElement(el);
    }

    @And("Scroll until element with text {string} is in view and click")
    public void scrollUntilElementWithTextIsInViewAndClick(String text) throws Throwable {
        MobileElement element = (MobileElement) driver.findElement(MobileBy.AndroidUIAutomator("new UiScrollable(new UiSelector().scrollable(true))" + ".scrollIntoView(new UiSelector().textContains(\"" + text +"\"))"));
        hp.ClickOnElement(element);
    }

    @And("Scroll until element with text {string} is in view")
    public void scrollUntilElementWithTextIsInView(String text) throws Throwable {
        MobileElement element = (MobileElement) driver.findElement(MobileBy.AndroidUIAutomator("new UiScrollable(new UiSelector().scrollable(true))" + ".scrollIntoView(new UiSelector().textContains(\"" + text +"\"))"));
    }

    @And("Scroll until element with text from excel {string} columnName {string} is in view")
    public void scrollUntilElementWithTextFromExcelColumnNameIsInView(String rowindex, String columnName) {
        String text = DataManager.getDataFromHashDatamap(rowindex,columnName);
        System.out.println("Trazi se: " + text);
        WaitHelpers.waitForSeconds(3);
        //MobileElement element = (MobileElement) driver.findElement(MobileBy.AndroidUIAutomator("new UiScrollable(new UiSelector().scrollable(true))" + ".scrollIntoView(new UiSelector().textContains(\"" + text +"\"))"));
        String xPath = "//*[@text = '" + text + "']";
        By el = By.xpath(xPath);

        for(int i = 0; i<50; i++){
            if(hp.isElementNotPresent(el)){
                hp.scrollDown(driver);
            }
        }
    }


    @And("Click on date {string} days in the future in calendar")
    public void clickOnDateDaysInTheFutureInCalendar(String days) throws Throwable {
        //rh.clickOnDateInCalendarDaysInTheFuture(days);
        MobileElement elementForDate = d.createMobileElementByResourceId("nlb-input-payment-date-click-area");
        hp.ClickOnElement(elementForDate);
        String dateInFuture = ActionApiHelpers.getTodayDatePlusXDaysInFormat(Integer.valueOf(days),"dd.MM.YYYY");
        String date = hp.returnDateInAppFormat(dateInFuture);
        if (!hp.checkDateIsCurrent(date)){
            String xPathForChangeOfMonth = "//android.view.View[@content-desc=\"Change to next month\"]";
            MobileElement elementForChangeOfMonth = x.createMobileElementByXpath(xPathForChangeOfMonth);
            hp.ClickOnElement(elementForChangeOfMonth);
        } else {
            System.out.println("No need to change month");
        }
        String xPathForDateToClick = "//*[@text='"+date+"']";
        MobileElement elementForDateToClick = x.createMobileElementByXpath(xPathForDateToClick);
        hp.ClickOnElement(elementForDateToClick);
        String xPathForConfirmButton = "//*[@text='Apply']";
        MobileElement elementForConfirmButton = x.createMobileElementByXpath(xPathForConfirmButton);
        hp.ClickOnElement(elementForConfirmButton);
    }

    @And("Assert element {string} by id has date {string} days from now in format {string}")
    public void assertElementByIdHasDateDaysFromNowInFormat(String id, String days, String format) {
        String expectedDate = rh.getDateDaysFromNowInFormat(days, format);
        By el = x.createByXpath("//*[@resource-id='co.infinum.nlb.uat:id/"+id+"']");
        WaitHelpers.waitForElement(el);
        MobileElement element = d.createMobileElementByResourceId(id);
        Assert.assertEquals(expectedDate,element.getAttribute("text"));
    }

    @And("Swipe until element with text {string} is displayed")
    public void swipeUntilElementWithTextIsDisplayed(String text) {
        hp.swipeMobileElementIntoViewByText(text);
    }


    @And("Swipe until element with account from Excel {string} columnName {string} is displayed")
    public void swipeUntilElementWithAccountFromExcelColumnNameIsDisplayed(String rowindex, String columnName) {
        String accNumber = DataManager.getDataFromHashDatamap(rowindex, columnName);
        hp.swipeMobileElementIntoViewByText(accNumber);
    }

    @And("Click on transaction by remembered purpose {string}")
    public void clickOnTransactionByRememberedPurpose(String key) throws Exception {
        String purpose = (String) DataManager.userObject.get(key);
        By element = x.createByXpath("//android.widget.TextView[@resource-id='"+Hooks.resourceId+"title' and @text='" + purpose + "']");
        hp.clickElement(element);
    }

    @And("Assert {string} is from excel {string} columnName {string} in account details")
    public void assertIsFromExcelColumnNameInAccountDetails(String text, String rowindex, String columnName) {
        if (Base.testPlatform.equals("iOS")) {
            String xPath = "//XCUIElementTypeStaticText[@name='" + text + "']//preceding-sibling::XCUIElementTypeStaticText";
            MobileElement element = x.createMobileElementByXpath(xPath);
            String actual = element.getAttribute("value");
            String expected = DataManager.getDataFromHashDatamap(rowindex, columnName);
            Assert.assertEquals(expected, actual);
        } else {
            String xPath = "//*[@text='" + text + "']//following-sibling::*";
            MobileElement element = x.createMobileElementByXpath(xPath);
            String actual = element.getAttribute("text");
            String expected = DataManager.getDataFromHashDatamap(rowindex, columnName);
            Assert.assertEquals(expected, actual);
        }
    }

    @And("Enter random purpose into field by id {string} and remember it under key {string} in txt file")
    public void enterRandomPurposeIntoFieldByIdAndRememberItUnderKeyInTxtFile(String id, String key) throws InterruptedException {
        String rawFlag = DataManager.userObject == null ? null : (String) DataManager.userObject.get("flag");
        String flag = rawFlag == null ? "" : String.valueOf(rawFlag);
        if (flag.equals("corp")){
            String randomPurpose = rh.generateRandomStringOfCertainLenght(10);
            randomPurpose = "IPX" + randomPurpose;
            By element = d.createElementByResourceId(id);
            hp.enterTextToElement(randomPurpose,element);
            Utilities.saveTheValueToFile(randomPurpose,key);
        } else {
            String randomPurpose = rh.generateRandomStringOfCertainLenght(10);
            By element = d.createElementByResourceId(id);
            hp.enterTextToElement(randomPurpose,element);
            Utilities.saveTheValueToFile(randomPurpose,key);
        }
    }

    @And("Assert text under key {string} from txt file in element id {string}")
    public void assertTextUnderKeyFromTxtFileInElementId(String key, String id) {
        String purpose = Utilities.getDataFromTxtFileUnderKey(key);
        MobileElement element = d.createMobileElementByResourceId(id);
        Assert.assertEquals(purpose,element.getAttribute("text"));
    }

    @And("Scroll until element with text from txt file under key {string} is in view and click")
    public void scrollUntilElementWithTextFromTxtFileUnderKeyIsInViewAndClick(String key) throws Throwable {
        String purpose = Utilities.getDataFromTxtFileUnderKey(key);
        //MobileElement element = (MobileElement) driver.findElement(MobileBy.AndroidUIAutomator("new UiScrollable(new UiSelector().scrollable(true))" + ".scrollIntoView(new UiSelector().textContains(\"" + purpose +"\"))"));
        //hp.ClickOnElement(element);
        WaitHelpers.waitForSeconds(5);
        String xPath = "//*[@text = '" + purpose + "']";
        By el = By.xpath(xPath);

        for(int i = 0; i<10; i++){
            if(hp.isElementNotPresent(el)){
                hp.scrollDown(driver);
            }
        }
        hp.clickElement(el);
    }

    @And("Click on element by name {string}")
    public void clickOnElementByName(String elementName) throws Exception {
        rh.clickOnElementByName(elementName);
    }

    @And("Click on button by name {string}")
    public void clickOnButtonByName(String elementName) throws Exception {
        rh.clickOnButtonByName(elementName);
    }

    @And("Enter PIN")
    public void enterPIN() {
        driver.getKeyboard().pressKey("1379");

    }

    @And("Enter PIN {string} from {string} column")
    public void enterPINFromColumn(String rowindex, String columnName) {
        String pin = DataManager.getDataFromHashDatamap(rowindex, columnName);
        rh.sendKeys(pin);
    }

    @And("Assert element by name {string}")
    public void assertElementByName(String elementName) throws Throwable {
        rh.assertElementByName(elementName);
    }

    @And("Assert static text before static text by name {string} is displayed")
    public void assertStaticTextBeforeStaticTextByNameIsDisplayed(String staticText) throws Throwable {
        By element = x.createBySomeTextAfterTextInStaticElement(staticText);
        hp.isElementDisplayed(element);
    }

    @And("Assert Amount and Currency in transaction detail are displayed in valid format")
    public void assertAmountAndCurrencyInTransactionDetailAreDisplayedInValidFormat() {
        rh.assertAmountAndCurrencyInTransactionDetailAreDisplayedInValidFormat();
    }

    @And("Assert Value date in transaction details are displayed in valid format")
    public void assertValueDateInTransactionDetailsAreDisplayedInValidFormat() {
        rh.assertValueDateInTransactionDetailsAreDisplayedInValidFormat();
    }

    @And("Click on more menu from excel {string} column name {string}")
    public void clickOnMoreMenuFromExcelColumnName(String rowindex, String columnName) throws Exception {
        String accountNumber = DataManager.getDataFromHashDatamap(rowindex, columnName);
        if (Base.testPlatform.equals("iOS")) {
            rh.clickOnMoreElementInAccount(accountNumber);
        } else {
            //TODO Implementation for Android
        }
    }

    @And("Assert Amount and Original Currency {string} in transaction detail are displayed in valid format")
    public void assertAmountAndOriginalCurrencyInTransactionDetailAreDisplayedInValidFormat(String currency) {
        rh.assertAmountAndOriginalCurrencyInTransactionDetailAreDisplayedInValidFormat(currency);
    }

    @And("Assert button by text {string} is enabled")
    public void assertButtonByTextIsEnabled(String text) throws Throwable {
        rh.assertButtonByTextIsEnabled(text);
    }

    @And("Remember all available currencies in account from details under key {string}")
    public void rememberAllAvailableCurrenciesInAccountFromDetailsUnderKey(String key) {
        String xPath = "//XCUIElementTypeCell//XCUIElementTypeStaticText";
        List<MobileElement> elements = x.createElementsByXpath(xPath);
        List<String> currencyList = new ArrayList<>();
        currencyList.add("EUR");
        for (MobileElement element : elements) {
            if (element.getAttribute("name").matches("[A-Z]{3}")) {
                currencyList.add(element.getAttribute("name"));
            }
        }
        hp.saveTheValueToMapBasic(currencyList, key);
    }

    @And("Check if available currencies in account in pick wheeler are those under key {string}")
    public void checkIfAvailableCurrenciesInAccountInPickWheelerAreThoseUnderKey(String key) throws InterruptedException {
        List<String> expectedCurrencyList = (List<String>) DataManager.userObject.get(key);
        rh.checkIfElementsFromListExistInPickWheeler(expectedCurrencyList, "//XCUIElementTypePickerWheel");
    }

    @And("Check if all currencies except EUR are available to pick in picker wheel")
    public void checkIfAllCurrenciesExceptEURAreAvailableToPickInPickerWheel() throws InterruptedException {
        List<String> expectedCurrencyList = new ArrayList<>();
        expectedCurrencyList.add("AUD");
        expectedCurrencyList.add("CAD");
        expectedCurrencyList.add("CHF");
        expectedCurrencyList.add("DKK");
        expectedCurrencyList.add("GBP");
        //expectedCurrencyList.add("HRK");
        expectedCurrencyList.add("HUF");
        expectedCurrencyList.add("JPY");
        expectedCurrencyList.add("NOK");
        expectedCurrencyList.add("SEK");
        expectedCurrencyList.add("USD");
        expectedCurrencyList.add("JPY");

        rh.checkIfElementsFromListExistInPickWheeler(expectedCurrencyList, "//XCUIElementTypePickerWheel");

    }

    @And("Select {string} currency from picker wheel")
    public void selectCurrencyFromPickerWheel(String currency) throws Exception {
        String xPath = "//XCUIElementTypePickerWheel";
        By element = x.createByXpath(xPath);
        hp.enterTextToElement(currency, element);
        By elementDone = x.createByName("Done");
        hp.clickElement(elementDone);
    }

    @And("Assert {string} in navigation bar")
    public void assertInNavigationBar(String text) throws Throwable {
        String xPath = "//XCUIElementTypeNavigationBar [@name='" + text + "']";
        By element = x.createByXpath(xPath);
        hp.assertElementDisplayed(element);
    }

    @And("Assert button by name {string}")
    public void assertButtonByName(String name) throws Throwable {
        String xPath = "//XCUIElementTypeButton[@name='" + name + "']";
        By element = x.createByXpath(xPath);
        hp.assertElementDisplayed(element);
    }

    @And("Assert button by name {string} is enabled")
    public void assertButtonByNameIsEnabled(String name) throws Throwable {
        String tag = "XCUIElementTypeButton";
        By element = x.createByTagAndName(tag, name);
        hp.assertElementEnabled(element);
    }

    @And("Select {string} option from picker wheel")
    public void selectOptionFromPickerWheel(String option) throws Exception {
        String xPath = "//XCUIElementTypePickerWheel";
        By element = x.createByXpath(xPath);
        hp.enterTextToElement(option, element);
        By elementDone = x.createByName("composeMessage.topicPicker.doneButton");
        hp.clickElement(elementDone);
    }

    @And("Enter random text to Subject field and remember it under key {string}")
    public void enterRandomTextToSubjectFieldAndRememberItUnderKey(String key) throws Exception {
        String randomSubject = rh.generateRandomStringOfCertainLenght(10);
        By element = x.createByName("composeMessage.subjectTextInput.textInput.textField");
        hp.enterTextToElement(randomSubject, element);
        hp.saveTheValueToMapBasic(randomSubject, key);
        By doneElement = x.createByName("Done");
        hp.clickElement(doneElement);
    }

    @And("Assert element by name {string} is selected")
    public void assertElementByNameIsSelected(String name) {
        By element = x.createByName(name);
        Assert.assertEquals("1", hp.getAttribute(element, "value"));
    }

    @And("Assert {string} popup notification with text {string}")
    public void assertPopupNotificationWithText(String status, String message) throws Throwable {
        String xPath = "//XCUIElementTypeStaticText[@name='" + status + "']//following-sibling::XCUIElementTypeStaticText[@name='" + message + "']";
        By element = x.createByXpath(xPath);
        hp.assertElementDisplayed(element);
    }

    @And("Assert button by name {string} is selected")
    public void assertButtonByNameIsSelected(String name) {
        String xPath = "//XCUIElementTypeButton[@name='" + name + "']";
        By element = x.createByXpath(xPath);
        Assert.assertEquals("1", hp.getAttribute(element, "value"));
    }

    @And("Assert form by name {string}")
    public void assertFormByName(String name) throws Throwable {
        // dodat XCUIElementTypeNavigationBar
        String xPath = "//XCUIElementTypeNavigationBar//XCUIElementTypeStaticText[@name='" + name + "']";
        By element = x.createByXpath(xPath);
        hp.assertElementDisplayed(element);
    }

    @And("Enter text {string} to element by name {string}")
    public void enterTextToElementByName(String text, String name) throws InterruptedException {
        By element = x.createByName(name);
        hp.enterTextToElement(text, element);
    }

    @And("Click {string} button on keyboard")
    public void clickButtonOnKeyboard(String buttonName) throws Exception {
        String xPath = "//XCUIElementTypeToolbar[@name='Toolbar']//XCUIElementTypeButton[@name='" + buttonName + "']";
        By element = x.createByXpath(xPath);
        hp.clickElement(element);
    }

    @And("Click on {string} button {int}")
    public void clickOnButton(String name, int index) throws Exception {
        //String pageSource = driver.getPageSource();

        String xPath = "//XCUIElementTypeButton[@name='arrowDown']//ancestor::XCUIElementTypeOther[1]";
        By element = x.createByXpath(xPath);
        hp.clickElement(element);
    }

    @And("Assert text field by name {string}")
    public void assertTextFieldByName(String name) throws Throwable {
        String xPath = "//XCUIElementTypeStaticText[@name='" + name + "']";
        By element = x.createByXpath(xPath);
        hp.assertElementDisplayed(element);
    }

    @And("Swipe to element by name {string}")
    public void swipeToElementByName(String name) throws InterruptedException {
        String xPath = "(//XCUIElementTypeStaticText[@name='" + name + "'])[1]";
        By element = x.createByXpath(xPath);
        hp.scrollIntoViewDownVertical(element);
    }

    @And("Swipe to element by name {string} up")
    public void swipeToElementByNameUp(String name) throws InterruptedException {
        String pageSource = driver.getPageSource();

        String xPath = "(//*[@name='" + name + "'])[1]";
        By element = x.createByXpath(xPath);
        hp.scrollIntoViewUpVertical(element);
    }

    @And("Click on button by name {string} with index {int}")
    public void clickOnButtonByNameWithIndex(String name, int i) throws Exception {
        String xPath = "(//XCUIElementTypeButton[@name='" + name + "'])[" + i + "]";
        By element = x.createByXpath(xPath);
        hp.clickElement(element);
    }

    @And("Swipe until first element with name {string} is displayed and click on it")
    public void swipeUntilFirstElementWithNameIsDisplayedAndClickOnIt(String name) throws Exception {
        String xPath = "(//XCUIElementTypeStaticText[@name='" + name + "'])[1]";
        By element = x.createByXpath(xPath);
        hp.scrollIntoViewDownVertical(element);
    }

    @And("Wait for transactions to load")
    public void waitForTransactionsToLoad() {
        String xPath = "//XCUIElementTypeTable[@name='transaction_list']";
        By element = x.createByXpath(xPath);
        WaitHelpers.waitForElement(element, 30);

    }

    @And("Click on button {string} by name {string}")
    public void clickOnButtonByName(String index, String buttonName) throws Exception {
        String xPath = "(//XCUIElementTypeButton[@name='" + buttonName + "'])[" + index + "]";
        By element = x.createByXpath(xPath);
        hp.clickElement(element);
    }

    @And("Click on element by name from excel {string} columnName {string}")
    public void clickOnElementByNameFromExcelColumnName(String rowindex, String columnName) throws Exception {
        String name = DataManager.getDataFromHashDatamap(rowindex, columnName);
        By element = x.createByName(name);
        hp.clickElement(element);
    }

    @And("Assert that contacts are in alphabetical order")
    public void assertThatContactsAreInAlphabeticalOrder() {
        String xPath = "//XCUIElementTypeTable//XCUIElementTypeCell//XCUIElementTypeStaticText[2]";
        List<MobileElement> elements = x.createElementsByXpath(xPath);
        List<String> actualOrder = new ArrayList<>();
        for (MobileElement element : elements) {
            actualOrder.add(element.getAttribute("name"));
        }
        List<String> expectedOrder = actualOrder;
        Collections.sort(expectedOrder);
        Assert.assertEquals(expectedOrder, actualOrder);
    }

    @And("Wait element {string} by name")
    public void waitElementByName(String name) throws InterruptedException {
        By el = x.createByName(name);
        for (int i = 1; i <= 30; i = i + 1) {
            try {
                if (!hp.isElementNotPresent(el)) {
                    break;
                } else
                    Log.info("Wait.....");
            } catch (NoSuchElementException e) {
            }
            Thread.sleep(1000);
        }
    }

    @And("Scroll until element with IBAN from Excel {string} columnName {string} is in the view")
    public void scrollUntilElementWithIBANFromExcelColumnNameIsInTheView(String rowindex, String columnName) throws InterruptedException {
        String iban = DataManager.getDataFromHashDatamap(rowindex, columnName);
        By element = x.createByName(iban);
        hp.scrollIntoViewDownVertical(element);
    }

    @And("Click on {string} element by name {string}")
    public void clickOnElementByName(String i, String name) throws Exception {
        String xPath = "(//*[@name='" + name + "'])[" + i + "]";
        By element = x.createByXpath(xPath);
        hp.clickElement(element);
    }

    @And("Click on Bar chart x {int} y {int}")
    public void clickOnBarChartXY(int xLocation, int yLocation) throws InterruptedException {
        hp.clickOnElementByCoordinates(xLocation, yLocation);
    }

    @And("Assert Card page indicator")
    public void assertCardPageIndicator() throws Throwable {
        String xPath = "//XCUIElementTypePageIndicator";
        By element = x.createByXpath(xPath);
        hp.assertElementDisplayed(element);
    }

    @And("Click on Card page indicator")
    public void clickOnCardPageIndicator() throws Exception {
        String xPath = "//XCUIElementTypePageIndicator";
        By element = x.createByXpath(xPath);
        hp.clickElement(element);
    }

    @And("Compare list under key {string} to list of Purpose for second card and assert false")
    public void compareListUnderKeyToListOfPurposeForSecondCardAndAssertFalse(String key) {
        List<String> before = (List<String>) DataManager.userObject.get(key);
        String xPath = "//XCUIElementTypeTable[@name='Generic']//XCUIElementTypeCell//XCUIElementTypeStaticText[2]";
        List<MobileElement> elements = x.createElementsByXpath(xPath);
        List<String> newPurpose = new ArrayList<>();
        Assert.assertTrue(elements.size() >= 1);
        for (MobileElement element : elements) {
            newPurpose.add(element.getAttribute("name"));
        }
        Assert.assertNotEquals(newPurpose, before);
    }

    @And("Assert text field by name {string} is enabled")
    public void assertTextFieldByNameIsEnabled(String name) throws Throwable {
        String xPath = "//XCUIElementTypeStaticText[@name='" + name + "']";
        By element = x.createByXpath(xPath);
        hp.assertElementEnabled(element);
    }

    @And("Swipe Right in Quick links")
    public void swipeRightInQuickLinks() {
        if (Base.testPlatform.equals("iOS")) {
            int startX = 300;
            int endX = 50;
            int Y = 550;
            hp.swipeByCordinates(startX, Y, endX, Y);
        }
        else {
            int startX = 900;
            int startY = 1050;
            int endX = 200;
            int endY = 1050;
            hp.swipeByCordinates(startX, startY, endX, endY);
        }
    }

    @And("Assert Payment dates are in the future")
    public void assertPaymentDatesAreInTheFuture() throws ParseException {
        String xPath = "//XCUIElementTypeTable[@name='Generic']//XCUIElementTypeCell//XCUIElementTypeStaticText[1]";
        List<MobileElement> elements = x.createElementsByXpath(xPath);
        String date = Utilities.todayDDMMYYYY();
        Assert.assertTrue(elements.size() != 0);
        for (MobileElement element : elements) {
            if (element.getAttribute("value").matches("[0-9]{2}[.]{1}[0-9]{2}[.]{1}[1-9]{1}[0-9]{3}")) {
                DateTimeFormatter f = DateTimeFormatter.ofPattern("dd.MM.yyyy");
                LocalDate start = LocalDate.parse(date, f);
                LocalDate end = LocalDate.parse(element.getAttribute("name"), f);
                boolean isBefore = start.isBefore(end);
                Assert.assertEquals(true, isBefore);
            }
        }
    }

    @And("Assert text field by value {string}")
    public void assertTextFieldByValue(String value) throws Throwable {
        String xPath = "//XCUIElementTypeStaticText[@name='" + value + "']";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.getAttribute("value").equals(value));
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Swipe until element with name from Excel {string} columnName {string} is in the view")
    public void swipeUntilElementWithNameFromExcelColumnNameIsInTheView(String rowindex, String columnName) throws InterruptedException {
        String name = DataManager.getDataFromHashDatamap(rowindex, columnName);
        By element = x.createByName(name);
        hp.scrollIntoViewDownVertical(element);
    }

    @And("Click on first transaction with name {string}")
    public void clickOnFirstTransactionWithName(String name) throws Exception {
        String xPath = "(//XCUIElementTypeStaticText[@name='" + name + "']//ancestor::XCUIElementTypeCell)[1]";
        By element = x.createByXpath(xPath);
        hp.clickElement(element);
    }

    @And("Wait for transaction with name {string}")
    public void waitForTransactionWithName(String name) {
        String pageSource = driver.getPageSource();

        String xPath = "(//XCUIElementTypeStaticText[@name='" + name + "']//ancestor::XCUIElementTypeCell)[1]";
        By element = x.createByXpath(xPath);
        WaitHelpers.waitForElement(element, 30);
    }

    @And("Wait for transaction with name from txt file under key {string}")
    public void waitForTransactionWithNameFromTxtFileUnderKey(String key) {
        String name = Utilities.getDataFromTxtFileUnderKey(key);
        String xPath = "(//XCUIElementTypeStaticText[@name='" + name + "']//ancestor::XCUIElementTypeCell)[1]";
        By element = x.createByXpath(xPath);
        WaitHelpers.waitForElement(element, 30);
    }

    @And("Swipe to element by name from txt file under key {string}")
    public void swipeToElementByNameFromTxtFileUnderKey(String key) throws InterruptedException {
        String name = Utilities.getDataFromTxtFileUnderKey(key);
        String xPath = "(//XCUIElementTypeStaticText[@name='" + name + "'])[1]";
        By element = x.createByXpath(xPath);
        hp.scrollIntoViewDownVertical(element);
    }

    @And("Click on first transaction with name under key {string}")
    public void clickOnFirstTransactionWithNameUnderKey(String key) throws Exception {
        String name = Utilities.getDataFromTxtFileUnderKey(key);
        String xPath = "(//XCUIElementTypeStaticText[@name='" + name + "']//ancestor::XCUIElementTypeCell)[1]";
        By element = x.createByXpath(xPath);
        hp.clickElement(element);
    }

    @Then("Assert Transaction amount is {string}")
    public void assertTransactionAmountIs(String expected) {
        String xPath = "(//XCUIElementTypeTable//XCUIElementTypeCell//XCUIElementTypeStaticText)[2]";
        By element = x.createByXpath(xPath);
        Assert.assertEquals(expected, hp.getAttribute(element, "name"));
    }

    @And("Assert {string} element by name {string}")
    public void assertElementByName(String i, String name) throws Throwable {
        String xPath = "(//*[@name='" + name + "'])[" + i + "]";
        By element = x.createByXpath(xPath);
        hp.assertElementDisplayed(element);
    }

    @And("Assert last five payments are correct")
    public void assertLastFivePaymentsAreCorrect() throws Exception {
        if (Base.testPlatform.equals("iOS")) {
            String xPath = "//XCUIElementTypeTable//XCUIElementTypeCell//XCUIElementTypeStaticText[2]";
            List<String> expectedListOfLastPayments = new ArrayList<>();
            List<String> actualListOfLastPayments = new ArrayList<>();
            expectedListOfLastPayments.add("paymentFive");
            expectedListOfLastPayments.add("paymentFour");
            expectedListOfLastPayments.add("paymentThree");
            expectedListOfLastPayments.add("paymentTwo");
            expectedListOfLastPayments.add("paymentOne");
            List<MobileElement> elements = x.createElementsByXpath(xPath);
            for (MobileElement element : elements) {
                actualListOfLastPayments.add(element.getAttribute("name"));
            }
            Assert.assertEquals(expectedListOfLastPayments, actualListOfLastPayments);
        } else {
            String id = "title";
            List<String> listOfLastPayments = rh.scrollDownAndPutEveryElementWithIdIntoList(id);
            List<String> expectedListOfLastPayments = new ArrayList<>();
            expectedListOfLastPayments.add("paymentFive");
            expectedListOfLastPayments.add("paymentFour");
            expectedListOfLastPayments.add("paymentThree");
            expectedListOfLastPayments.add("paymentTwo");
            expectedListOfLastPayments.add("paymentOne");
            Assert.assertEquals(expectedListOfLastPayments, listOfLastPayments);
        }
    }

    @And("Wait for element with tag {string} and name {string}")
    public void waitForElementWithTagAndName(String tag, String name) {
        String xPath = "//" + tag + "[@name='" + name + "']";
        By element = x.createByXpath(xPath);
        WaitHelpers.waitForElement(element, 30);
    }

    @And("Assert standing order start date is correct")
    public void assertStandingOrderStartDateIsCorrect() {
        if (Base.testPlatform.equals("iOS")) {
            String xPath = "(//XCUIElementTypeButton[@name='calendar']//preceding-sibling::XCUIElementTypeTextField)[1]";
            By element = x.createByXpath(xPath);
            String expected = ActionApiHelpers.getTodayDatePlusXDays(1);
            Assert.assertEquals(expected, hp.getAttribute(element, "value").toString());
        } else {
            MobileElement element = d.createMobileElementByResourceId("schedulerPaymentStartInputDate");
            String expected = ActionApiHelpers.getTodayDatePlusXDays(1);
            Assert.assertEquals(expected,element.getAttribute("text"));
        }
    }

    @And("Enter text to element by name {string} from Excel {string} columnName {string}")
    public void enterTextToElementByNameFromExcelColumnName(String name, String rowindex, String columnName) throws InterruptedException {
        String text = DataManager.getDataFromHashDatamap(rowindex, columnName);
        By element = x.createByName(name);
        hp.enterTextToElement(text, element);
    }

    @And("Assert Payment date in payment preview is {int} days in future")
    public void assertPaymentDateInPaymentPreviewIsDaysInFuture(int daysInFuture) throws Throwable {
        String date = ActionApiHelpers.getTodayDatePlusXDaysInFormat(daysInFuture, "dd.MM.YYYY");
        if(Base.testPlatform.equals("iOS")) {
            String xPath = "//XCUIElementTypeStaticText[@name='Payment date']//following-sibling::XCUIElementTypeStaticText[@name='" + date + "']";
            By element = x.createByXpath(xPath);
            hp.assertElementDisplayed(element);
        }else{
            MobileElement element = d.createMobileElementByResourceId("tvPaymentDateValue");
            Assert.assertEquals(date,element.getAttribute("text"));
        }
    }

    @And("Click on button Copy in OTP screen")
    public void clickOnButtonCopyInOTPScreen() throws Exception {
        hp.clickByPercentage(90, 7);
    }

    @And("Swipe to element by xPath {string}")
    public void swipeToElementByXPath(String xPath) throws InterruptedException {
        By element = x.createByXpath(xPath);
        hp.scrollIntoViewDownVertical(element);
    }

    @And("Click on element with tag {string} by name {string}")
    public void clickOnElementWithTagByName(String tag, String name) throws Exception {
        String xPath = "//" + tag + "[@name='" + name + "']";
        By element = x.createByXpath(xPath);
        hp.clickElement(element);
    }

    @And("Enter text from Excel {string} columnName {string} to element by name {string}")
    public void enterTextFromExcelColumnNameToElementByName(String rowindex, String columnName, String name) throws InterruptedException {
        String text = DataManager.getDataFromHashDatamap(rowindex, columnName);
        By element = x.createByName(name);
        hp.enterTextToElement(text, element);
    }

    @And("Wait for element with tag {string} containing name {string}")
    public void waitForElementWithTagContainingName(String tag, String name) {
        String xPath = "//" + tag + "[contains(@name, '" + name + "')]";
        By element = x.createByXpath(xPath);
        WaitHelpers.waitForElement(element, 30);
    }

    @And("Assert element with tag {string} containing name {string} has value {string}")
    public void assertElementWithTagContainingNameHasValue(String tag, String name, String value) {
        String xPath = "//" + tag + "[contains(@name, '" + name + "')]";
        By element = x.createByXpath(xPath);
        Assert.assertTrue(hp.getAttribute(element, "value").toString().contains(value));
    }

    @And("Try to assert that payment is {string} and send command to OTP method")
    public void tryToAssertThatPaymentIsAndSendCommandToOTPMethod(String text) throws Throwable {
        rh.tryToAssertThatPaymentIsAndSendCommandToOTPMethod(text);
    }

    @And("Check if PIN is needed and complete payment for {string}")
    public void checkIfPINIsNeededAndCompletePaymentFor(String text) throws Throwable {
        rh.checkIfPINIsNeededAndCompletePaymentFor(text);
    }

    @And("Assert account from excel {string} columnName {string} is not in list of accounts with id {string}")
    public void assertAccountFromExcelColumnNameIsNotInListOfAccountsWithId(String rowindex, String columnName, String id) {
        String iban = DataManager.getDataFromHashDatamap(rowindex, columnName);
        List<MobileElement> mobileElementList = d.createElementsById(id);
        List<String> listOfPresentIban = new ArrayList<>();
        for (MobileElement element : mobileElementList) {
            listOfPresentIban.add(element.getAttribute("text"));
        }
        Assert.assertFalse(listOfPresentIban.contains(iban));
    }


    @And("Click on {string} element by id {string}")
    public void clickOnElementById(String appearanceNumber, String id) throws Throwable {
        int number = Integer.parseInt(appearanceNumber);
        By elWait = d.createElementById(id);
        WaitHelpers.waitForElement(elWait);
        List<MobileElement> mobileElementList = d.createElementsById(id);
        hp.ClickOnElement(mobileElementList.get(number - 1));
    }

    @And("Assert that dates by id {string} are correctly sorted")
    public void assertThatDatesByIdAreCorrectlySorted(String id) throws Exception {
        List<String> list = rh.scrollDownAndPutEveryElementWithIdIntoList(id);
        Assert.assertTrue(list.size()>0);
        List<String> orderedList = list;
        Collections.sort(orderedList, new Comparator<String>() {
            DateFormat f = new SimpleDateFormat("dd. M. yyyy");
            @Override
            public int compare(String o1, String o2) {
                try {
                    return f.parse(o1).compareTo(f.parse(o2));
                } catch (ParseException e) {
                    throw new IllegalArgumentException(e);
                }
            }
        });
        Collections.reverse(orderedList);
        Assert.assertEquals(orderedList,list);
    }

    @And("Assert element by id {string} has date {string} day in the future")
    public void assertElementByIdHasDateDayInTheFuture(String id, String day) {
        MobileElement element  = d.createMobileElementByResourceId(id);
        int i = Integer.parseInt(day);
        String expected = ActionApiHelpers.getTodayDatePlusXDays(i);
        Assert.assertEquals(element.getAttribute("text"),expected);
    }

    @Then("Assert Standing order by amount {string} and value under key {string} from text file")
    public void assertStandingOrderByAmountAndValueUnderKeyFromTextFile(String amount, String key) throws Throwable {
        String date = ActionApiHelpers.getTodayDatePlusXDays(1);
        String purpose = Utilities.getDataFromTxtFileUnderKey(key);
        //String xPath = "//*[@resource-id='" + Hooks.resourceId + "paymentDate' and @text='" + date + "']//following-sibling::*[@resource-id='" + Hooks.resourceId + "textAmount' and contains(@text,'"+amount+"')]";
        //By el = x.createByXpath(xPath);
        //hp.clickElement(el);
        MobileElement element = (MobileElement) driver.findElement(MobileBy.AndroidUIAutomator("new UiScrollable(new UiSelector().scrollable(true))" + ".scrollIntoView(new UiSelector().textContains(\"" + amount + "\"))"));
        hp.ClickOnElement(element);
        String xPath = "//*[@text='Purpose']//following-sibling::*";
        By el = x.createByXpath(xPath);
        WaitHelpers.waitForElement(el);
        MobileElement purposeElement = x.createMobileElementByXpath(xPath);
        Assert.assertEquals(purposeElement.getAttribute("text"), purpose);
    }

    @And("Assert {string} content description from tag {string} is displayed")
    public void assertContentDescriptionFromTagIsDisplayed(String text, String tag) {
        String xPath = "//android.widget." + tag + "[@content-desc=\"" + text + "\"]";
        By el = x.createByXpath(xPath);
        WaitHelpers.waitForElement(el);
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertEquals("true", element.getAttribute("displayed"));
    }

    @And("Assert {string} of element by id {string} is displayed")
    public void assertOfElementByIdIsDisplayed(String number, String id) {
        String xPath = "(//*[@resource-id='"+Hooks.resourceId+id+"'])[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertEquals("true",element.getAttribute("displayed"));
    }

    @And("Assert text {string} in native element id {string}")
    public void assertTextInNativeElementId(String text, String id) {
        By elWait = x.createByXpath("//*[@resource-id='" + Hooks.nativeElement + id + "']");
        WaitHelpers.waitForElement(elWait);
        MobileElement element = d.createMobileElementByNativeId(id);
        Assert.assertEquals(text,element.getAttribute("text"));
    }

    @And("Assert text {string} in {string} element id {string}")
    public void assertTextInElementId(String text, String number, String id) {
        String xPath = "(//*[@resource-id='" + Hooks.resourceId + id + "'])[" + number + "]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertEquals(text,element.getAttribute("text"));
    }

    @And("Remember list of element value {string} by id {string} under key {string}")
    public void rememberListOfElementValueByIdUnderKey(String attribute, String id, String key) {
        rh.storeAttributeFromIdUnderKeyList(attribute, id, key);
    }

    @And("Compare list under key {string} to list of value {string} id {string} false")
    public void compareListUnderKeyToListOfValueIdFalse(String key, String attribute, String id) {
        List<MobileElement> mobileElementList = d.createElementsById(id);
        List<String> rememberedAttribute = new ArrayList<>();
        for(MobileElement element : mobileElementList){
            rememberedAttribute.add(element.getAttribute(attribute));
        }
        List<String> expectedList = (List<String>) DataManager.userObject.get(key);
        Assert.assertTrue(!rememberedAttribute.equals(expectedList));
    }

    @And("Compare list under key {string} to list of value {string} id {string} true")
    public void compareListUnderKeyToListOfValueIdTrue(String key, String attribute, String id) {
        List<MobileElement> mobileElementList = d.createElementsById(id);
        List<String> rememberedAttribute = new ArrayList<>();
        for(MobileElement element : mobileElementList){
            rememberedAttribute.add(element.getAttribute(attribute));
        }
        List<String> expectedList = (List<String>) DataManager.userObject.get(key);
        Assert.assertTrue(rememberedAttribute.equals(expectedList));
    }

    @And("Assert that payment dates are in the future")
    public void assertThatPaymentDatesAreInTheFuture() throws ParseException {
        String id = "paymentDate";
        List<MobileElement> mobileElementList = d.createElementsById(id);
        String date = Utilities.todayDDMMYYYY();
        for (MobileElement element : mobileElementList){
            DateTimeFormatter f = DateTimeFormatter.ofPattern("dd.MM.yyyy");
            LocalDate start = LocalDate.parse( date , f );
            LocalDate end = LocalDate.parse( element.getAttribute("text") , f );
            boolean isBefore = start.isBefore( end ) ;
        }
    }

    @And("Assert page {string} in chrome")
    public void assertPageInChrome(String url) {
        String resourceId="com.android.chrome:id/url_bar";
        MobileElement element = d.createCustomMobileElementByResourceId(resourceId);
        Assert.assertEquals(url,element.getAttribute("text"));
    }

    @And("Go Back")
    public void goBack(){
        Base.back();
    }

    /*@And("Remember current balance of account in product details under key {string}")
    public void rememberCurrentBalanceOfAccountInProductDetailsUnderKey(String key) {
        String id = "tvProductAmount";
        By elWait = d.createElementById(id);
        WaitHelpers.waitForElement(elWait);
        MobileElement element = d.createMobileElementByResourceId(id);
        String amount = element.getAttribute("text").replaceAll(" EUR","");
        DataManager.userObject.put(key,amount);
    }

    @And("Compare if current amount balance in product details screen for account is correct under key {string}")
    public void compareIfCurrentAmountBalanceInProductDetailsScreenForAccountIsCorrectUnderKey(String key) {
        String amountInKey = (String) DataManager.userObject.get(key);
        String formattedAmount = amountInKey.replace(".","").replaceAll(",",".");
        Double previousAmount = Double.parseDouble(formattedAmount);
        Double expectedAmountAfterTransaction = previousAmount-10.00;
        String id = "tvProductAmount";
        By elWait = d.createElementById(id);
        WaitHelpers.waitForElement(elWait);
        DecimalFormat df = new DecimalFormat("0.00");
        MobileElement element = d.createMobileElementByResourceId(id);
        String actualAmountAfterTransaction = element.getAttribute("text").replaceAll(" EUR","").replace(".","").replace(",",".");
        Assert.assertEquals(df.format(expectedAmountAfterTransaction),actualAmountAfterTransaction);
    }*/

    @And("Assert success notification")
    public void assertSuccessNotification() throws Throwable {
        String xPath = "//*[@text = \"Success\"]";
        By el = By.xpath(xPath);
        boolean doesElementExist = hp.isElementDisplayed(el, 10, 300);
        Assert.assertTrue(doesElementExist);
    }

    @And("Count the number of standing orders and put result under key {string}")
    public void countTheNumberOfStandingOrdersAndPutResultUnderKey(String key) throws Exception {
        List<String> standingOrders = rh.scrollDownAndPutEveryElementWithIdIntoList("paymentDate");
        int count = standingOrders.size();
        DataManager.userObject.put(key,count);
    }


    @Then("Count the number of standing orders and check if {string} is deleted from key {string}")
    public void countTheNumberOfStandingOrdersAndCheckIfIsDeletedFromKey(String deletedNumber, String key) throws Exception {
        List<String> standingOrders = rh.scrollDownAndPutEveryElementWithIdIntoList("paymentDate");
        int count = standingOrders.size();
        int deleted = Integer.parseInt(deletedNumber);
        int previousCount = (int) DataManager.userObject.get(key);
        Assert.assertEquals(previousCount-deleted,count);
    }

    @And("Assert element {string} by id is disabled")
    public void assertElementByIdIsDisabled(String id) {
        MobileElement element = d.createMobileElementByResourceId(id);
        Assert.assertEquals("false", element.getAttribute("enabled"));
    }

    @And("Assert there are {string} characters in element id {string}")
    public void assertThereAreCharactersInElementId(String num, String id) {
        MobileElement element = d.createMobileElementByResourceId(id);
        String content = element.getAttribute("text");
        int expected = Integer.parseInt(num);
        Assert.assertEquals(expected, content.length());
    }

    @And("Enter {string} character {string} time in element id {string}")
    public void enterCharacterTimeInElementId(String character, String num, String id) throws Throwable {
        MobileElement element = d.createMobileElementByResourceId(id);
        rh.sendKeyToElementNumberOfTimes(num,character,element);
    }

    @And("Remember {string} element attribute {string} by id {string} under key {string}")
    public void rememberElementAttributeByIdUnderKey(String occurenceNumber, String attribute, String id, String key) {
        List<MobileElement> mobileElementList = d.createElementsById(id);
        int num = Integer.parseInt(occurenceNumber) - 1;
        MobileElement element = mobileElementList.get(num);
        rh.saveElementAttributeValueByAttributeAndIdUnderKey(attribute, element, key);
    }

    @And("Click on coordinates {string} {string}")
    public void clickOnCoordinates(String x, String y) {
        int startX = Integer.parseInt(x);
        int startY = Integer.parseInt(y);
        hp.clickElementByCordinates(startX, startY);
    }

    @And("Assert text {string} is contained in element id {string}")
    public void assertTextIsContainedInElementId(String text, String id) {
        MobileElement element = d.createMobileElementByResourceId(id);
        Assert.assertTrue(element.getAttribute("text").contains(text));
    }

    @And("Check if there is only {string} searched result with id {string}")
    public void checkIfThereIsOnlySearchedResultWithId(String num, String id) {
        List<MobileElement> mobileElementList = d.createElementsById(id);
        int expected = Integer.parseInt(num);
        Assert.assertEquals(expected,mobileElementList.size());
    }

    @And("Check if available currencies are correct for new payment")
    public void checkIfAvailableCurrenciesAreCorrectForNewPayment() throws Exception {
        List<String> listOfActualCurrencies = rh.scrollDownAndPutEveryElementWithNativeIdIntoListCurrency("text1");
        List<String> listOfExpectedCurrencies = hp.getListOfAllCurrencies();
        Assert.assertEquals(listOfExpectedCurrencies,listOfActualCurrencies);
    }

    @And("Enter text from excel {string} columnName {string} in element id {string} array")
    public void enterTextFromExcelColumnNameInElementIdArray(String rowindex, String columnName, String id) throws Exception {
        String text = DataManager.getDataFromHashDatamap(rowindex, columnName);
        if (Base.testPlatform.equals("iOS")) {
            String xpath = "//XCUIElementTypeStaticText[@name=\"I wish to exchange\"]//../XCUIElementTypeTextField[@name='receivingTxt']";
            By element = x.createByXpath(xpath);
            hp.enterTextToElement(text, element);
        } else {
            By element = d.createElementById(id);
            hp.clickElement(element);
            if(Base.getDataFromFileConf(Hooks.rowinConfExcel,"DEVICE_NAME").contains("HUAWEI")){
                MobileElement elementType = d.createMobileElementByResourceId(id);
                elementType.setValue(text);
            } else {
                Character[] charObjectArray = Utilities.toCharacterArray(text);
                hp.pressKey(charObjectArray);
            }
        }
    }

    @And("Check if to amount is correct using key {string} and from {string}")
    public void checkIfToAmountIsCorrectUsingKeyAndFrom(String key, String from) {
        String xPath = "//*[@resource-id='"+Hooks.resourceId+"inputValueTo']//android.widget.EditText";
        MobileElement element = x.createMobileElementByXpath(xPath);
        String askString = (String) DataManager.userObject.get(key);
        Double ask = Double.parseDouble(askString.replace(",","."));
        Double fromDouble = Double.parseDouble(from);
        Double expected =  ask*fromDouble;
        DecimalFormat df = new DecimalFormat("0.00");
        Assert.assertEquals(df.format(expected),element.getAttribute("text").replace(",","."));
    }

    @And("Check if to amount is correct using key {string} and from {string} reversed")
    public void checkIfToAmountIsCorrectUsingKeyAndFromReversed(String key, String from) {
        String xPath = "//*[@resource-id='"+Hooks.resourceId+"inputValueTo']//android.widget.EditText";
        MobileElement element = x.createMobileElementByXpath(xPath);
        String bidString = (String) DataManager.userObject.get(key);
        Double bid = Double.parseDouble(bidString.replace(",","."));
        Double fromDouble = Double.parseDouble(from);
        Double expected = fromDouble/bid;
        DecimalFormat df = new DecimalFormat("0.00");
        Assert.assertEquals(df.format(expected),element.getAttribute("text").replace(",","."));
    }

    @And("Assert that credit is correctly calculated and correct message is shown in foreign payment using key {string} amount {string} id {string}")
    public void assertThatCreditIsCorrectlyCalculatedAndCorrectMessageIsShownInForeignPaymentUsingKeyAmountId(String key, String amountString, String id) {
        MobileElement element = d.createMobileElementByResourceId(id);
        String askString = (String) DataManager.userObject.get(key);
        Double ask = Double.parseDouble(askString.replace(",","."));
        Double amount = Double.parseDouble(amountString);
        Double expectedAmount = amount/ask;
        DecimalFormat df = new DecimalFormat("0.00");
        String expectedAmountString = df.format(expectedAmount);
        String expected = "Amount in EUR: "+expectedAmountString+" EUR ("+askString+" USD for 1 EUR)";
    }

    @And("Assert saved contact is displayed by account number from excel {string} columnName {string}")
    public void assertSavedContactIsDisplayedByAccountNumberFromExcelColumnName(String rowindex, String columnName) {
        String accountNumber = DataManager.getDataFromHashDatamap(rowindex, columnName);
        MobileElement element = hp.swipeMobileElementIntoViewByTextAndReturnElement(accountNumber);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert saved contact has contact name from excel {string} columnName {string}")
    public void assertSavedContactHasContactNameFromExcelColumnName(String rowindex, String columnName) throws Throwable {
        String contactName = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String contactNameCapital = contactName.toUpperCase();
        By element = x.createByXpath("//*[@text='" + contactNameCapital + "']");
        hp.assertElementDisplayed(element);
    }

    @Then("Assert value from clipboard is the same as key {string}")
    public void assertValueFromClipboardIsTheSameAsKey(String key) throws IOException, UnsupportedFlavorException {
        if (Base.testPlatform.equals("iOS")) {
        String expected = DataManager.userObject.get(key).toString().replace(" ", "");
        String xPath = "//XCUIElementTypeTextField[@name='URL']";
        By element = x.createByXpath(xPath);

        String actual = hp.getAttribute(element, "value").toString().replace(" ", "");
        Assert.assertEquals(expected, actual);}
        else{
            String cliboard = (String) Toolkit.getDefaultToolkit().getSystemClipboard().getData(DataFlavor.stringFlavor);
            String expected = (String) DataManager.userObject.get(key);
            Assert.assertFalse(cliboard.contains(" "));
            Assert.assertEquals(expected.replaceAll(" ",""),cliboard.replaceAll(" ",""));
        }
    }

    @And("Scroll until element with text from txt file under key {string} is in view")
    public void scrollUntilElementWithTextFromTxtFileUnderKeyIsInView(String key) {
        String purpose = Utilities.getDataFromTxtFileUnderKey(key);
        MobileElement element = (MobileElement) driver.findElement(MobileBy.AndroidUIAutomator("new UiScrollable(new UiSelector().scrollable(true))" + ".scrollIntoView(new UiSelector().textContains(\"" + purpose + "\"))"));
    }

    @And("Assert all categories for budget are shown")
    public void assertAllCategoriesForBudgetAreShown() throws Exception {
        if (Base.testPlatform.equals("iOS")) {
            String xPath = "//XCUIElementTypeTable[@name='Generic']//XCUIElementTypeCell//XCUIElementTypeStaticText";
            List<MobileElement> elements = x.createElementsByXpath(xPath);
            List<String> categories = new ArrayList<>();
            for (MobileElement element : elements) {
                categories.add(element.getAttribute("value"));
            }
            List<String> expectedCategories = rh.getAllBudgetCategories();
            Assert.assertEquals(expectedCategories, categories);
        } else {
            By elWait = d.createElementById("categoryName");
            WaitHelpers.waitForElement(elWait);
            List<String> actualCategories = rh.scrollDownAndPutEveryElementWithIdIntoList("categoryName");
            List<String> expectedCategories = rh.getAllBudgetCategories();

            Assert.assertEquals(expectedCategories, actualCategories);
        }
    }

    @And("Assert Error message for wrong pin is correct")
    public void assertErrorMessageForWrongPinIsCorrect() {
        String xPath = "//*[contains(@name, 'Attempts remaining')]";
        By element = x.createByXpath(xPath);
        String value = hp.getAttribute(element, "value").toString();
        Assert.assertTrue(value.matches("Attempts remaining: [1-5]{1}"));
    }

    @And("Assert element {string} by id has tomorrow date in format {string}")
    public void assertElementByIdHasTomorrowDateInFormat(String id, String dateFormat) {
        MobileElement element = d.createMobileElementByResourceId(id);
        String currentDate = Utilities.tomorrowDateDDMMYYYY();
        Assert.assertEquals(currentDate, element.getAttribute("text"));
    }

    @And("Assert element by id {string} ends in {string}")
    public void assertElementByIdEndsIn(String id, String text) {
        MobileElement element = d.createMobileElementByResourceId(id);
        Assert.assertTrue(element.getAttribute("text").endsWith(text));
    }

    @And("Assert element with tag {string} by name from Excel {string} columnName {string}")
    public void assertElementWithTagByNameFromExcelColumnName(String tag, String rowindex, String columnName) throws Throwable {
        String name = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPath = "//" + tag + "[@name='" + name + "']";
        By element = x.createByXpath(xPath);
        hp.assertElementDisplayed(element);
    }

    @And("Assert element by value {string}")
    public void assertElementByValue(String value) throws Throwable {
        String xPath = "//*[@value='" + value + "']";
        By element = x.createByXpath(xPath);
        hp.assertElementDisplayed(element);
    }

    @And("Assert element with tag {string} with value {string} is visible")
    public void assertElementWithTagWithValueIsVisible(String tag, String value) {
        String xPath = "//" + tag + "[@value='" + value + "']";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertEquals("true", element.getAttribute("visible"));
    }

    @And("Assert element with tag {string} that has value {string} with index {string}")
    public void assertElementWithTagThatHasValueWithIndex(String tag, String value, String index) {
        String xPath = "(//" + tag + "[@value='" + value + "'])[" + index + "]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert element with name {string} has value {string}")
    public void assertElementWithNameHasValue(String name, String value) {
        String xPath = "//*[@name='" + name + "']";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertEquals(value, element.getAttribute("value"));
    }

    @And("Swipe to element by name {string} down")
    public void swipeToElementByNameDown(String name) throws InterruptedException {
        String xPath = "(//*[@name='" + name + "'])[1]";
        By element = x.createByXpath(xPath);
        hp.scrollIntoViewDown(element);
    }

    @And("Assert element with tag {string} and name {string} is displayed")
    public void assertElementWithTagAndNameIsDisplayed(String tag, String name) throws Throwable {
        String xPath = "//" + tag + "[@name='" + name + "']";
        By element = x.createByXpath(xPath);
        hp.assertElementDisplayed(element);
    }

    @And("Assert element with tag {string} and name {string} has value {string}")
    public void assertElementWithTagAndNameHasValue(String tag, String name, String value) {
        String xPath = "//" + tag + "[@name='" + name + "']";
        By element = x.createByXpath(xPath);
        Assert.assertEquals(value, hp.getAttribute(element, "value").toString());
    }

    @And("Send random text to field with id {string} and remember it under key {string}")
    public void sendRandomTextToFieldWithIdAndRememberItUnderKey(String id, String key) throws Throwable {
        String randomText = rh.generateRandomStringOfCertainLenght(10);
        rh.enterTextToElementById(randomText, id);
        hp.saveTheValueToMapBasic(randomText, key);
    }

    @And("Click on tab {string}")
    public void clickOnTab(String tabName) throws Throwable {
        String xPath = "//android.widget.LinearLayout[@content-desc='" + tabName + "']";
        MobileElement element = x.createMobileElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Assert Attachment is displayed in Sent message by excel {string} and columnName {string}")
    public void assertAttachmentIsDisplayedInSentMessageByExcelAndColumnName(String rowindex, String columnName) {
        String fileName = DataManager.getDataFromHashDatamap(rowindex, columnName);
        By elWait = d.createElementById("attachment_text_view");
        WaitHelpers.waitForElement(elWait);
        MobileElement element = d.createMobileElementByResourceId("attachment_text_view");
        Assert.assertEquals(fileName, element.getAttribute("text"));
    }

    @Then("Assert transactions are ordered by months")
    public void assertTransactionsAreOrderedByMonths() throws Throwable {
        if(Base.getDataFromFileConf(Hooks.rowinConfExcel,"DEVICE_NAME").contains("HUAWEI")){
            String currentMonth = Utilities.getTodayDateInFormat("MM");
            By elWait = d.createElementById("transactionDate");
            WaitHelpers.waitForElement(elWait);
            List<MobileElement> mobileElementList = d.createElementsById("transactionDate");
            List<String> stringList = new ArrayList<>();
            for(MobileElement element : mobileElementList){
                stringList.add(element.getAttribute("text"));
            }
            for (String s : stringList){
                String str[] = s.split("\\.");
                String month = str[1];
                Assert.assertEquals(currentMonth,month);
            }
            String currentMonthLarge = Utilities.getTodayDateInFormat("MMMM");
            MobileElement dateHeaderElement = d.createMobileElementByResourceId("textDate");
            Assert.assertEquals(currentMonthLarge.toUpperCase(),dateHeaderElement.getAttribute("text").toUpperCase());
            String previousMonthLarge = Utilities.getPreviousMonthInFormat("MMMM",1).toUpperCase();
            for (int i = 0; i<600; i++){
                hp.swipeByCordinates(500, 1200, 500, 600);
                By elementEight = By.xpath("(//*[@text='"+previousMonthLarge+"'])[1]");
                boolean isMonthDisplayed = hp.isElementDisplayed(elementEight,5,100);
                if (isMonthDisplayed){
                    break;
                }
            }
            hp.swipeByCordinates(500, 1200, 500, 600);
            hp.swipeByCordinates(500, 1200, 500, 600);
            String previousMonth = Utilities.getPreviousMonthInFormat("MM",1);
            List<MobileElement> mobileElementList2 = d.createElementsById("transactionDate");
            Assert.assertTrue(mobileElementList2.size()>0);
            List<String> stringList2 = new ArrayList<>();
            for(MobileElement element2 : mobileElementList2){
                stringList2.add(element2.getAttribute("text"));
            }
            for (String s1 : stringList2){
                String str[] = s1.split("\\.");
                String month = str[1];
                Assert.assertEquals(previousMonth,month);
            }
        } else{
            String currentMonth = Utilities.getTodayDateInFormat("MM");
            By elWait = d.createElementById("transactionDate");
            WaitHelpers.waitForElement(elWait);
            List<MobileElement> mobileElementList = d.createElementsById("transactionDate");
            List<String> stringList = new ArrayList<>();
            for(MobileElement element : mobileElementList){
                stringList.add(element.getAttribute("text"));
            }
            for (String s : stringList){
                String str[] = s.split("\\.");
                String month = str[1];
                Assert.assertEquals(currentMonth,month);
            }
            String currentMonthLarge = Utilities.getTodayDateInFormat("MMMM");
            MobileElement dateHeaderElement = d.createMobileElementByResourceId("textDate");
            Assert.assertEquals(currentMonthLarge.toUpperCase(),dateHeaderElement.getAttribute("text").toUpperCase());
            String previousMonthLarge = Utilities.getPreviousMonthInFormat("MMMM",1).toUpperCase();
            for (int i = 0; i<600; i++){
                hp.swipeByCordinates(500, 1800, 500, 600);
                By elementEight = By.xpath("(//*[@text='"+previousMonthLarge+"'])[1]");
                boolean isMonthDisplayed = hp.isElementDisplayed(elementEight,5,100);
                if (isMonthDisplayed){
                    break;
                }
            }
            hp.swipeByCordinates(500, 1800, 500, 600);
            hp.swipeByCordinates(500, 1800, 500, 600);
            String previousMonth = Utilities.getPreviousMonthInFormat("MM",1);
            List<MobileElement> mobileElementList2 = d.createElementsById("transactionDate");
            Assert.assertTrue(mobileElementList2.size()>0);
            List<String> stringList2 = new ArrayList<>();
            for(MobileElement element2 : mobileElementList2){
                stringList2.add(element2.getAttribute("text"));
            }
            for (String s1 : stringList2){
                String str[] = s1.split("\\.");
                String month = str[1];
                Assert.assertEquals(previousMonth,month);
            }
        }
    }

    @And("Remember available balance for specific currency under key {string} and add {string}")
    public void rememberAvailableBalanceForSpecificCurrencyUnderKeyAndAdd(String key, String add) {
        MobileElement element = d.createMobileElementByResourceId("tvProductAmount");
        String balance = element.getAttribute("text").replaceAll("[A-Z]", "").replaceAll("\\.","").replaceAll(",",".").trim();
        Double doubledBalance = Double.valueOf(balance);
        Double addSum = Double.valueOf(add);
        Double balanceForStore = doubledBalance+addSum;
        DataManager.userObject.put(key,balanceForStore.toString().replace(".",","));
    }

    @And("Scroll until element with text from excel {string} columnName {string} is in view and click")
    public void scrollUntilElementWithTextFromExcelColumnNameIsInViewAndClick(String rowindex, String columnName) throws Throwable {
        String text = DataManager.getDataFromHashDatamap(rowindex,columnName);
        //MobileElement element = (MobileElement) driver.findElement(MobileBy.AndroidUIAutomator("new UiScrollable(new UiSelector().scrollable(true))" + ".scrollIntoView(new UiSelector().textContains(\""+text+"\"))"));
        String xPath = "//*[@text = '" + text + "']";
        By el = By.xpath(xPath);

        for(int i = 0; i<10; i++){
            if(hp.isElementNotPresent(el)){
                hp.scrollDown(driver);
            }
        }
        hp.clickElement(el);
    }

    @And("Remember {string} of payment in transaction details under key {string}")
    public void rememberPurposeOfPaymentInTransactionDetailsUnderKey(String text,String key) {
        String xPath = "//*[@text='"+text+"']//following-sibling::*";
        MobileElement element = x.createMobileElementByXpath(xPath);
        String purposeContent = element.getAttribute("text");
        DataManager.userObject.put(key,purposeContent);
    }
    @And("Remember only currency of payment in past payment details under key {string}")
    public void rememberOnlyCurrencyOfPaymentInPastPaymentDetailsUnderKey(String key) {
        MobileElement element = d.createMobileElementByResourceId("toAmountTextView");
        String amount[] = element.getAttribute("text").split(" ");
        String currency = amount[1];
        DataManager.userObject.put(key,currency);
    }

    @Then("Assert if text {string} is found in pdf file")
    public void assertIfTextIsFoundInPdfFile(String text) throws IOException {
        //String path = Utilities.getDownloadsDirPath();
        String path = "/storage/emulated/0/Downloads";
        String filePath = Utilities.getLatestFilePath(path);
        Assert.assertTrue(Utilities.findTextInPdf(filePath,text));
    }

    @Then("Assert account from excel {string} columnName {string} is not displayed")
    public void assertAccountFromExcelColumnNameIsNotDisplayed(String rowindex, String columnName) throws Throwable {
        if(Base.testPlatform.equals("iOS")){
            String accountIban = DataManager.getDataFromHashDatamap(rowindex,columnName);
            String xPath = "//*[@name = \"" + accountIban + "\"]";
            By el = By.xpath(xPath);
            boolean doesElementExist = hp.isElementDisplayed(el,10,300);
            Assert.assertFalse(doesElementExist);
        }
        else{
            String accountIban = DataManager.getDataFromHashDatamap(rowindex,columnName);
            String xPath = "//*[@text = \"" + accountIban + "\"]";
            By el = By.xpath(xPath);
            boolean doesElementExist = hp.isElementDisplayed(el,10,300);
            Assert.assertFalse(doesElementExist);
        }
    }

    @And("Check if foreign to foreign currency exchage is correct using keys {string} {string} and from {string}")
    public void checkIfForeignToForeignCurrencyExchageIsCorrectUsingKeysAndFrom(String key, String key2, String from) {
        if(Base.testPlatform.equals("iOS")){
            String xPath = "(//*[@name='receivingTxt'])[2]";
            MobileElement element = x.createMobileElementByXpath(xPath);
            String bidString = (String) DataManager.userObject.get(key);
            String askString = (String) DataManager.userObject.get(key2);
            Double ask = Double.parseDouble(askString.replace(",","."));
            Double bid = Double.parseDouble(bidString.replace(",","."));
            Double fromDouble = Double.parseDouble(from);
            Double expected =  (fromDouble/bid)*ask;
            DecimalFormat df = new DecimalFormat("0.00");
            Assert.assertEquals(df.format(expected),element.getAttribute("value").replace(",","."));
        }
        else{
            String xPath = "//*[@resource-id='"+Hooks.resourceId+"inputValueTo']//android.widget.EditText";
            MobileElement element = x.createMobileElementByXpath(xPath);
            String bidString = (String) DataManager.userObject.get(key);
            String askString = (String) DataManager.userObject.get(key2);
            Double ask = Double.parseDouble(askString.replace(",","."));
            Double bid = Double.parseDouble(bidString.replace(",","."));
            Double fromDouble = Double.parseDouble(from);
            Double expected =  (fromDouble/bid)*ask;
            DecimalFormat df = new DecimalFormat("0.00");
            Assert.assertEquals(df.format(expected),element.getAttribute("text").replace(",","."));
        }
    }

    @And("Assert element by text from excel {string} columnName {string}")
    public void assertElementByTextFromExcelColumnName(String rowindex, String columnName) {
        String text = DataManager.getDataFromHashDatamap(rowindex,columnName);
        String xPath = "//*[@text='"+text+"']";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert element by text from excel {string} columnName {string} has following sibling {string}")
    public void assertElementByTextFromExcelRowindexColumnNameHasFollowingSibling(String rowindex, String columnName,String id) {
        String text = DataManager.getDataFromHashDatamap(rowindex,columnName);
        String xPath = "//*[@text='"+text+"']//following-sibling::*[@resource-id='"+Hooks.resourceId+""+id+"']";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert element by text from excel {string} columnName {string} appearance number {string}")
    public void assertElementByTextFromExcelColumnNameAppearanceNumber(String rowindex, String columnName, String app) {
        String text = DataManager.getDataFromHashDatamap(rowindex,columnName);
        String xPath = "(//*[@text='"+text+"'])["+app+"]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert element by text from excel {string} columnName {string} has following sibling {string} appearance number {string}")
    public void assertElementByTextFromExcelColumnNameHasFollowingSiblingAppearanceNumber(String rowindex, String columnName, String id, String app) {
        String text = DataManager.getDataFromHashDatamap(rowindex,columnName);
        String xPath = "(//*[@text='"+text+"']//following-sibling::*[@resource-id='"+Hooks.resourceId+""+id+"'])["+app+"]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert element by id {string} is checked {string}")
    public void assertElementByIdIsChecked(String id, String status) {
        MobileElement element = d.createMobileElementByResourceId(id);
        Assert.assertEquals(status,element.getAttribute("checked"));
    }


    @And("Exit pdf reader")
    public void exitPdfReader() throws Throwable {
        //MobileElement element = d.createCustomMobileElementByResourceId("pdf.reader.pdfviewer.pdfeditor:id/pdf_toolbar_withmore_back");
        MobileElement element = x.createMobileElementByXpath("//android.widget.ImageButton[@content-desc=\"Navigate up\"]");
        hp.ClickOnElement(element);
    }

    @And("Click Done in element with adb")
    public void clickDoneInElementWithAdb() throws IOException, InterruptedException {
        ProcessBuilder pb = new ProcessBuilder("adb","shell","input","tap","985","2190");
        Process pc = pb.start();
        pc.waitFor();
    }

    @And("Remember element value {string} by id {string} under key {string} in txt file")
    public void rememberElementValueByIdUnderKeyInTxtFile(String attribute, String id, String key) {
        By element = d.createElementById(id);
        String elementAttributeValue = driver.findElement(element).getAttribute(attribute);
        Utilities.saveTheValueToFile(elementAttributeValue,key);
    }

    @And("Assert second element by text {string}")
    public void assertSecondElementByText(String text) {
        String xPath = "(//*[@text='"+text+"'])[2]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @Then("Wait for element by text {string} to appear for {string} seconds and fail if not")
    public void waitForElementByTextToAppearForSecondsAndFailIfNot(String text, String time) throws Throwable {
        String xPath = "//*[@text = \"" + text + "\"]";
        int timeInt = Integer.parseInt(time);
        By el = By.xpath(xPath);
        boolean doesElementExist = hp.isElementDisplayed(el,timeInt,1000);
        Assert.assertTrue(doesElementExist);
    }

    @And("Swipe by coordinates {string} {string} {string} {string}")
    public void swipeByCoordinates(String x, String y, String x2, String y2) {
        int startX = Integer.parseInt(x);
        int startY = Integer.parseInt(y);
        int endX = Integer.parseInt(x2);
        int endY = Integer.parseInt(y2);
        hp.swipeByCordinates(startX,startY,endX,endY);
    }

    @And("Enter text from excel {string} columnName {string} in element id {string}")
    public void enterTextFromExcelColumnNameInElementId(String rowindex, String columnName, String id) {
        By element = d.createElementByResourceId(id);
        String text = DataManager.getDataFromHashDatamap(rowindex,columnName);
        hp.enterTextToMobileElement(text,element);
    }

    @And("Assert element with tag {string} containing value {string}")
    public void assertElementWithTagContainingValue(String tag, String value) {
        String xPath = "//" + tag + "[contains(@value, '" + value + "')]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Enter amount from key {string} to element by name {string}")
    public void enterAmountFromKeyToElementByName(String key, String name) throws InterruptedException {
        String amount = DataManager.userObject.get(key).toString();
        By element = x.createByName(name);
        hp.enterTextToElement(amount, element);
    }

    @And("Assert element with tag {string} containing name {string} has full value of name {string}")
    public void assertElementWithTagContainingNameHasFullValueOfName(String tag, String containsName, String name) {
        String xPath = "//" + tag + "[contains(@name, '" + name + "')]";
        By element = x.createByXpath(xPath);
        String nm = hp.getAttribute(element, "name").toString();
        Assert.assertTrue(hp.getAttribute(element, "name").toString().contains(name));
    }

    @And("Enter text {string} to element with tag {string}")
    public void enterTextToElementWithTag(String text, String tag) throws InterruptedException {
        By element = x.createByXpath(tag);
        hp.enterTextToElement(text, element);
    }

    @And("Assert element with tag {string} containing name {string} contains value {string}")
    public void assertElementWithTagContainingNameContainsValue(String tag, String name, String value) {
        String xPath = "//" + tag + "[contains(@name , '" + name + "')]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.getAttribute("value").contains(value));
    }

    @Then("Wait element by containing name {string}")
    public void waitElementByContainingName(String name) throws InterruptedException {
        String xPath = "//*[contains(@name, '" + name + "')]";
        By el = x.createByXpath(name);
        for (int i = 1; i <= 30; i = i + 1) {
            try {
                if (!hp.isElementNotPresent(el)) {
                    break;
                } else
                    Log.info("Wait.....");
            } catch (NoSuchElementException e) {
            }
            Thread.sleep(1000);
        }
    }

    @And("Assert element with name {string} and index {string} has value {string}")
    public void assertElementWithNameAndIndexHasValue(String name, String index, String value) {
        String xPath = "(//*[@name='" + name + "'])[" + index + "]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertEquals(value, element.getAttribute("value"));
    }

    @And("Enter text {string} to element by name {string} and index {string}")
    public void enterTextToElementByNameAndIndex(String text, String name, String index) throws InterruptedException {
        String xPath = "(//*[@name='" + name + "'])[" + index + "]";
        By element = x.createByXpath(xPath);
        hp.enterTextToElement(text, element);
    }

    @And("Assert element with name {string} and index {string}")
    public void assertElementWithNameAndIndex(String name, String index) {
        String xPath = "(//*[@name='" + name + "'])[" + index + "]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Click on element by value {string}")
    public void clickOnElementByValue(String value) throws Throwable {
        String xPath = "//*[@value='" + value + "']";
        MobileElement element = x.createMobileElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Assert element by value from excel {string} columnName {string}")
    public void assertElementByValueFromExcelColumnName(String rowindex, String columnName) {
        String text = DataManager.getDataFromHashDatamap(rowindex,columnName);
        String xPath = "//*[@value='"+text+"']";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Click on element containing name {string}")
    public void clickOnElementContainingName(String name) throws Throwable {
        String xPath = "//*[contains(@name, '" + "')]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Assert text {string} is contained in list of elements by id {string}")
    public void assertTextIsContainedInListOfElementsById(String expected, String id) {
        List<MobileElement> elementList = d.createElementsById(id);
        Assert.assertTrue(elementList.size()>0);
        for(MobileElement element : elementList){
            Assert.assertTrue(element.getAttribute("text").toLowerCase().contains(expected.toLowerCase()));
        }
    }

    @And("Assert text from excel {string} columnName {string} is contained in list of elements by id {string}")
    public void assertTextFromExcelColumnNameIsContainedInListOfElementsById(String rowindex, String columnName, String id) {
        String expected = DataManager.getDataFromHashDatamap(rowindex,columnName);
        List<MobileElement> elementList = d.createElementsById(id);
        Assert.assertTrue(elementList.size()>0);
        for(MobileElement element : elementList){
            Assert.assertTrue(element.getAttribute("text").toLowerCase().contains(expected.toLowerCase()));
        }
    }

    @And("Assert list of element by id {string} starts with numbers")
    public void assertListOfElementByIdStartsWithNumbers(String id) {
        List<MobileElement> mobileElementList = d.createElementsById(id);
        Assert.assertTrue(mobileElementList.size() != 0);
        rh.assertListOfMobileElementStartsWithNumber(mobileElementList);
    }

    @And("Assert list of element by id {string} starts with {string}")
    public void assertListOfElementByIdStartsWith(String id, String starts) {
        List<MobileElement> mobileElementList = d.createElementsById(id);
        Assert.assertTrue(mobileElementList.size() != 0);
        rh.assertListOfMobileElementStartsWith(mobileElementList, starts);
    }

    @And("Scroll refresh")
    public void scrollRefresh() {
        hp.swipeByCordinates(500, 600, 500, 1800);
    }

    @And("Assert payment dates are filtered by previous month")
    public void assertPaymentDatesAreFilteredByPreviousMonth() {
        String previousMonth = Utilities.getPreviousMonthInFormat("MMMM",1);
        String previousMonthForRegex = Utilities.getPreviousMonthInFormat("MM",1);
        By elWait2 = tx.createElementByText(previousMonth.toUpperCase());
        WaitHelpers.waitForElement(elWait2);
        MobileElement element = x.createMobileElementByText(previousMonth.toUpperCase());
        Assert.assertTrue(element.isDisplayed());
        By elWait = d.createElementById("transactionDate");
        WaitHelpers.waitForElement(elWait);
        List<MobileElement> mobileElementList = d.createElementsById("transactionDate");
        Assert.assertTrue(mobileElementList.size()>0);
        for (MobileElement el : mobileElementList){
            Assert.assertTrue(el.getAttribute("text").matches("^[0-9]{2}\\."+previousMonthForRegex+"\\.[0-9]{4}$"));
        }
    }

    @And("Scroll refresh {string} times")
    public void scrollRefreshTimes(String times) {
        int n = Integer.parseInt(times);
        for (int i = 0; i < n; i++){
            hp.swipeByCordinates(500, 600, 500, 1800);
        }
    }

    @And("Assert payment dates are filtered by current month")
    public void assertPaymentDatesAreFilteredByCurrentMonth() {
        String currentMonth = Utilities.getTodayDateInFormat("MMMM");
        String MonthForRegex = Utilities.getTodayDateInFormat("MM");
        By elWait2 = tx.createElementByText(currentMonth.toUpperCase());
        WaitHelpers.waitForElement(elWait2);
        MobileElement element = x.createMobileElementByText(currentMonth.toUpperCase());
        Assert.assertTrue(element.isDisplayed());
        By elWait = d.createElementById("transactionDate");
        WaitHelpers.waitForElement(elWait);
        List<MobileElement> mobileElementList = d.createElementsById("transactionDate");
        Assert.assertTrue(mobileElementList.size()>0);
        for (MobileElement el : mobileElementList){
            Assert.assertTrue(el.getAttribute("text").matches("^[0-9]{2}\\."+MonthForRegex+"\\.[0-9]{4}$"));
        }
    }

    @And("Assert payment dates are filtered for yesterday")
    public void assertPaymentDatesAreFilteredForYesterday() {
        String dayForRegex = Utilities.getPreviousDateInFormat("dd",1);
        By elWait = d.createElementById("transactionDate");
        WaitHelpers.waitForElement(elWait);
        List<MobileElement> mobileElementList = d.createElementsById("transactionDate");
        Assert.assertTrue(mobileElementList.size()>0);
        for (MobileElement el : mobileElementList){
            Assert.assertTrue(el.getAttribute("text").matches("^"+dayForRegex+"\\.[0-1]{1}[0-9]{1}\\.[0-9]{4}$"));
        }
    }

    @Then("Assert transactions are ordered by months for upcoming payments")
    public void assertTransactionsAreOrderedByMonthsForUpcomingPayments() throws Throwable {
        String currentMonth = Utilities.getTodayDateInFormat("MM");
        By elWait = d.createElementById("paymentDate");
        WaitHelpers.waitForElement(elWait);
        List<MobileElement> mobileElementList = d.createElementsById("paymentDate");
        List<String> stringList = new ArrayList<>();
        String futureMonth = Utilities.getFutureMonthInFormat("MM",1);
        for(MobileElement element : mobileElementList){
            stringList.add(element.getAttribute("text"));
        }
        for (String s : stringList){
            String str[] = s.split("\\.");
            String month = str[1];
            Assert.assertTrue(currentMonth.equals(month) || futureMonth.equals(month));
        }
        String currentMonthLarge = Utilities.getTodayDateInFormat("MMMM");
        MobileElement dateHeaderElement = d.createMobileElementByResourceId("textDate");
        Assert.assertEquals(currentMonthLarge.toUpperCase(),dateHeaderElement.getAttribute("text").toUpperCase());
        String futureMonthLarge = Utilities.getFutureMonthInFormat("MMMM",1).toUpperCase();
        for (int i = 0; i<600; i++){
            hp.swipeByCordinates(500, 1800, 500, 600);
            By elementEight = By.xpath("(//*[@text='"+futureMonthLarge+"'])[1]");
            boolean isMonthDisplayed = hp.isElementDisplayed(elementEight,5,100);
            if (isMonthDisplayed){
                break;
            }
        }
        hp.swipeByCordinates(500, 1800, 500, 600);
        List<MobileElement> mobileElementList2 = d.createElementsById("paymentDate");
        Assert.assertTrue(mobileElementList2.size()>0);
        List<String> stringList2 = new ArrayList<>();
        for(MobileElement element2 : mobileElementList2){
            stringList2.add(element2.getAttribute("text"));
        }
        int i = 0;
        for (String s1 : stringList2){
            String str[] = s1.split("\\.");
            String month = str[1];
            if (month.equals(futureMonth)){
                i++;
            }
        }
        Assert.assertTrue(i>0);
    }

    @Then("Assert transactions are ordered by months for past payments")
    public void assertTransactionsAreOrderedByMonthsForPastPayments() throws Throwable {
        String currentMonth = Utilities.getTodayDateInFormat("MM");
        List<MobileElement> mobileElementList = d.createElementsById("paymentDate");
        List<String> stringList = new ArrayList<>();
        for(MobileElement element : mobileElementList){
            stringList.add(element.getAttribute("text"));
        }
        for (String s : stringList){
            String str[] = s.split("\\.");
            String month = str[1];
            Assert.assertEquals(currentMonth,month);
        }
        String currentMonthLarge = Utilities.getTodayDateInFormat("MMMM");
        MobileElement dateHeaderElement = d.createMobileElementByResourceId("textDate");
        Assert.assertEquals(currentMonthLarge.toUpperCase(),dateHeaderElement.getAttribute("text").toUpperCase());
        String previousMonthLarge = Utilities.getPreviousMonthInFormat("MMMM",1).toUpperCase();
        for (int i = 0; i<600; i++){
            hp.swipeByCordinates(500, 1800, 500, 600);
            By elementEight = By.xpath("(//*[@text='"+previousMonthLarge+"'])[1]");
            boolean isMonthDisplayed = hp.isElementDisplayed(elementEight,5,100);
            if (isMonthDisplayed){
                break;
            }
        }
        hp.swipeByCordinates(500, 1800, 500, 600);
        hp.swipeByCordinates(500, 1800, 500, 600);
        String previousMonth = Utilities.getPreviousMonthInFormat("MM",1);
        List<MobileElement> mobileElementList2 = d.createElementsById("paymentDate");
        Assert.assertTrue(mobileElementList2.size()>0);
        List<String> stringList2 = new ArrayList<>();
        for(MobileElement element2 : mobileElementList2){
            stringList2.add(element2.getAttribute("text"));
        }
        for (String s1 : stringList2){
            String str[] = s1.split("\\.");
            String month = str[1];
            Assert.assertEquals(previousMonth,month);
        }
    }

    @Then("Assert there are more than {string} payments")
    public void assertThereAreMoreThanPayments(String expected) throws Exception {
        int n = Integer.parseInt(expected);
        List<String> payments = rh.scrollDownAndPutEveryElementWithIdIntoList("title");
        Assert.assertTrue(payments.size()>n);
    }

    @And("Assert payment under key {string} is not displayed in upcoming payments")
    public void assertPaymentUnderKeyIsNotDisplayedInUpcomingPayments(String key) {
        String text = (String) DataManager.userObject.get(key);
        try {
            MobileElement element = (MobileElement) driver.findElement(MobileBy.AndroidUIAutomator("new UiScrollable(new UiSelector().scrollable(true))" + ".scrollIntoView(new UiSelector().textContains(\"" + text +"\"))"));
            Assert.assertTrue(false);
        } catch (Exception e){
            Assert.assertTrue(true);
        }
    }

    @And("Remember element attribute {string} by id {string} in txt under key {string}")
    public void rememberElementAttributeByIdInTxtUnderKey(String attribute, String id, String key) {
        MobileElement element = d.createMobileElementByResourceId(id);
        String value = element.getAttribute(attribute);
        value = value.replace(":","");
        Utilities.saveTheValueToFile(value,key);
    }

    @Then("Assert there are more than {string} payments using id {string}")
    public void assertThereAreMoreThanPaymentsUsingId(String expected, String id) throws Exception {
        int n = Integer.parseInt(expected);
        List<String> payments = rh.scrollDownAndPutEveryElementWithIdIntoList(id);
        Assert.assertTrue(payments.size()>n);
    }

    @And("Assert element by text from excel {string} columnName {string} does not exist with scroll")
    public void assertElementByTextFromExcelColumnNameDoesNotExistWithScroll(String rowindex, String columnName) {
        String text = DataManager.getDataFromHashDatamap(rowindex, columnName);
        try {
            MobileElement element = (MobileElement) driver.findElement(MobileBy.AndroidUIAutomator("new UiScrollable(new UiSelector().scrollable(true))" + ".scrollIntoView(new UiSelector().textContains(\"" + text +"\"))"));
            Assert.assertFalse(true);
        } catch (Exception ex){
            System.out.print("Contact not found");
        }
    }

    @And("Click on element by text from key {string}")
    public void clickOnElementByTextFromKey(String key) throws Exception {
        String text = (String) DataManager.userObject.get(key);
        By element = tx.createElementByTextContains(text);
        hp.clickElement(element);
    }

    @And("Assert element by text from key {string} is not displayed")
    public void assertElementByTextFromKeyIsNotDisplayed(String key) throws Throwable {
        String text = (String) DataManager.userObject.get(key);
        By element = tx.createElementByTextContains(text);
        boolean isDisplayed = hp.isElementDisplayed(element);
        Assert.assertFalse(isDisplayed);
    }

    @Then("Assert {string} content description from tag {string} is not displayed")
    public void assertContentDescriptionFromTagIsNotDisplayed(String text, String tag) throws Throwable {
        String xPath = "//android.widget." + tag + "[@content-desc=\"" + text + "\"]";
        By element = x.createByXpath(xPath);
        boolean isDisplayed = hp.isElementDisplayed(element);
        Assert.assertFalse(isDisplayed);
    }

    @And("Assert element by contains text {string}")
    public void assertElementByContainsText(String expected) throws Throwable {
        rh.assertElementByTextContains(expected);
    }

    @And("Assert element by text from excel {string} columnName {string} in element by id {string}")
    public void assertElementByTextFromExcelColumnNameInElementById(String rowindex, String columnName, String id) {
        String expected = DataManager.getDataFromHashDatamap(rowindex,columnName);
        MobileElement element = d.createMobileElementByResourceId(id);
        String actual = element.getAttribute("text");
        Assert.assertEquals(expected,actual);
    }

    @And("Assert list of element by id {string} is equal to list under key {string}")
    public void assertListOfElementByIdIsEqualToListUnderKey(String id, String key) throws Exception {
        List<String> expected = (List<String>) DataManager.userObject.get(key);
        List<String> actual = rh.scrollDownAndPutEveryElementWithIdIntoList(id);
        Collections.sort(expected);
        Collections.sort(actual);
        Assert.assertEquals(expected,actual);
    }

    @And("Click {string} content description from view tag {string}")
    public void clickContentDescriptionFromViewTag(String text, String tag) throws Exception {
        String xPath = "//android.view." + tag + "[@content-desc=\"" + text + "\"]";
        By element = x.createByXpath(xPath);
        WaitHelpers.waitForElement(element);
        hp.clickElement(element);

    }

    @And("Wait for account options in my products page to load")
    public void waitForAccountOptionsInMyProductsPageToLoad() {
        String xPathAccountOptions = "(//android.view.View[@content-desc='Account Options'])[1]";
        By accountOptionsElement = x.createByXpath(xPathAccountOptions);
        WaitHelpers.waitForElement(accountOptionsElement);
    }

    @And("Swipe vertical")
    public void swipeVertical() {
        if(Base.getDataFromFileConf(Hooks.rowinConfExcel,"DEVICE_NAME").contains("HUAWEI")){
            int startX = 500;
            int startY = 1200;
            int endX = 500;
            int endY = 500;
            hp.swipeByCordinates(startX, startY, endX, endY);
        } else {
            int startX = 500;
            int startY = 1800;
            int endX = 500;
            int endY = 600;
            hp.swipeByCordinates(startX, startY, endX, endY);
        }
    }

    @And("Swipe vertical short")
    public void swipeVerticalShort() {
        if(Base.getDataFromFileConf(Hooks.rowinConfExcel,"DEVICE_NAME").contains("HUAWEI")){
            int startX = 500;
            int startY = 1300;
            int endX = 500;
            int endY = 1150;
            hp.swipeByCordinates(startX, startY, endX, endY);
        } else{
            int startX = 500;
            int startY = 1700;
            int endX = 500;
            int endY = 1500;
            hp.swipeByCordinates(startX, startY, endX, endY);
        }
    }

    @And("Assert element by complete id {string}")
    public void assertElementByCompleteId(String id) {
        String xPath = "//*[@resource-id='"+id+"']";
        By elWait = x.createByXpath(xPath);
        WaitHelpers.waitForElement(elWait);
        MobileElement element = d.createCustomMobileElementByResourceId(id);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Manual scroll using id {string} until element with text from excel {string} columnName {string} is in view")
    public void manualScrollUsingIdUntilElementWithTextFromExcelColumnNameIsInView(String id, String rowindex, String columnName) {
        String searchedItem = DataManager.getDataFromHashDatamap(rowindex,columnName);
        rh.manualScrollUsingIdUntilElementWithTextIsInView(searchedItem,"textProductNumber");
    }

    @And("Wait for text {string} to dissapear")
    public void waitForTextToDissapear(String text) {
        String xPath = "//*[@text = \"" + text + "\"]";
        By el = By.xpath(xPath);
        WaitHelpers.waitForElementToDisappear(el,30);
    }

    @And("Remove Error message if exists")
    public void removeErrorMessageIfExists() throws Exception {
        /*By element = x.createByXpath("//*[contains(@text,'Something went wrong. Please, try again.')]");
        boolean exists = ActionApiHelpers.isElementDisplayedCustom(element,20,300);
        if(exists == true){
            rh.clickOnNativeElementById("button1");
        }*/
    }

    @And("Remove Error message if exists in SLO")
    public void removeErrorMessageIfExistsInSLO() throws Exception {
        By element = x.createByXpath("//*[contains(@text,'Prišlo je do napake. Prosimo, poskusite ponovno.')]");
        boolean exists = ActionApiHelpers.isElementDisplayedCustom(element,20,300);
        if(exists == true){
            rh.clickOnNativeElementById("button1");
        }
    }

    @And("Remove Internal Server Error if exists")
    public void removeInternalServerErrorIfExists() throws Exception {
        By element = x.createByXpath("//*[contains(@text,'Internal Server Error')]");
        boolean exists = ActionApiHelpers.isElementDisplayedCustom(element,20,300);
        if(exists == true){
            rh.clickOnNativeElementById("button1");
        }
    }

    @And("Assert element by text {string} is not displayed")
    public void assertElementByTextIsNotDisplayed(String text) throws Throwable {
        By element = tx.createElementByTextContains(text);
        boolean isElementDisplayed = hp.isElementDisplayed(element, 5, 100);
        Assert.assertFalse(isElementDisplayed);
    }

    @And("Assert text {string} in second element by id {string}")
    public void assertTextInSecondElementById(String text, String id) {
        String xPath = "(//*[@resource-id='" + Hooks.resourceId + ""+ id +"'])[2]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertEquals(text, element.getAttribute("text"));
    }

    @And("Select User from Excel {string} columnName {string} and login")
    public void selectUserFromExcelColumnNameAndLogin(String rowindex, String columnName) throws Throwable {
        String mock = DataManager.getDataFromHashDatamap(rowindex,"isMock");
        String env = DataManager.getDataFromHashDatamap(rowindex,"currentEnv");
        if (!mock.equals("no")){
            if (env.equals("tst")){
                MobileElement elementForContinueToApp = x.createMobileElementByText("Continue to the app");
                hp.ClickOnElement(elementForContinueToApp);
            }
            By elWaitForLoginToNLBKlik = tx.createElementByText("Login");
            WaitHelpers.waitForElement(elWaitForLoginToNLBKlik);
            MobileElement elementForLoginToNLBKlik = x.createMobileElementByText("Login");
            hp.ClickOnElement(elementForLoginToNLBKlik);
            By elWaitForForgotYourPin = tx.createElementByText("Enter PIN");
            WaitHelpers.waitForElement(elWaitForForgotYourPin);
            Character[] charObjectArray = Utilities.toCharacterArray("1379");
            hp.pressKey(charObjectArray);
        }else{
            String username = DataManager.getDataFromHashDatamap(rowindex,columnName);
            String xPathForDropDownMenu = "//*[@resource-id='select-user-dropdown-textfield']";
            //android.widget.Spinner[@resource-id="select-user-dropdown-textfield"]
            By elDropDownMenu = x.createByXpath(xPathForDropDownMenu);
            WaitHelpers.waitForElement(elDropDownMenu);
            MobileElement elementForDropDownMenu = x.createMobileElementByXpath(xPathForDropDownMenu);
            hp.ClickOnElement(elementForDropDownMenu);
            By elDropDownView = x.createByXpath("/hierarchy/android.view.ViewGroup/android.view.View/android.view.View/android.view.View/android.widget.ScrollView");
            WaitHelpers.waitForElement(elDropDownView);
            String xPath = "//*[@text = '" + username + "']";
            By el = By.xpath(xPath);
            for(int i = 0; i<2; i++){
                if(hp.isElementNotPresent(el)){
                    hp.scrollByCoordinates(driver, 500, 950, 400);
                }
            }
            hp.clickElement(el);
            MobileElement elementForLoginButton = x.createMobileElementByText("Login");
            hp.ClickOnElement(elementForLoginButton);
        }
    }

    @And("Hide account from Excel {string} columnName {string} if needed")
    public void hideAccountFromExcelColumnNameIfNeeded(String rowindex, String columnName) throws Throwable {
        String accountIban = DataManager.getDataFromHashDatamap(rowindex,columnName);
        if (accountIban.equals(".")){
            System.out.println("This was not needed");
        } else {
            By elForEdit = x.createByXpath("//*[@resource-id='nlb-button-edit-products']");
            WaitHelpers.waitForElement(elForEdit);
            MobileElement elementForEdit = d.createMobileElementByResourceId("nlb-button-edit-products");
            hp.ClickOnElement(elementForEdit);
            By elForEye = x.createByXpath("//android.view.View[@content-desc=\"Switch visibility\"]");
            WaitHelpers.waitForElement(elForEye);
            String xPathForHideAccount = "//*[@text='"+accountIban+"']//following-sibling::*[2]//android.view.View[@content-desc=\"Switch visibility\"]";
            By elForHideAccount = x.createByXpath(xPathForHideAccount);
            for(int i = 0; i<10; i++){
                if(hp.isElementNotPresent(elForHideAccount)){
                    hp.scrollDown(driver);
                }
            }
            MobileElement elementToHide = x.createMobileElementByXpath(xPathForHideAccount);
            hp.ClickOnElement(elementToHide);
            String xPath = "//android.view.View[@content-desc=\"Back\"]";
            By element = x.createByXpath(xPath);
            hp.clickElement(element);
            By elForLoad = x.createByXpath("//*[@resource-id='nlb-value-product-primary-balance']");
            WaitHelpers.waitForElement(elForLoad);
        }
    }

    @And("Wait for element by resource id {string} to appear")
    public void waitForElementByResourceIdToAppear(String id) {
        By element = x.createByXpath("//*[@resource-id='"+id+"']");
        WaitHelpers.waitForElement(element, 100);
    }

    @Then("Assert that product card of name {string} and iban {string} from Excel {string} for personal account are shown correctly")
    public void assertThatProductCardOfNameAndIbanFromExcelForPersonalAccountAreShownCorrectly(String columnName1, String columnName2, String rowindex) {
        String productName = DataManager.getDataFromHashDatamap(rowindex,columnName1);
        String productIban = DataManager.getDataFromHashDatamap(rowindex,columnName2);
        String xPathForProductCard1 = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Current account\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']//following-sibling::*[@text='Current balance']";
        String xPathForProductCard2 = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Current account\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']//following-sibling::*[@text='Available balance']";
        String xPathForCurrentBalance = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Current account\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']//following-sibling::*[@resource-id='nlb-value-product-primary-balance']";
        String xPathForAvailableBalance = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Current account\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']//following-sibling::*[@resource-id='nlb-value-product-secondary-balance']";

        MobileElement elementForProductCard1 = x.createMobileElementByXpath(xPathForProductCard1);
        Assert.assertTrue(elementForProductCard1.isDisplayed());
        MobileElement elementForProductCard2 = x.createMobileElementByXpath(xPathForProductCard2);
        Assert.assertTrue(elementForProductCard2.isDisplayed());
        MobileElement elementForCurrentBalance = x.createMobileElementByXpath(xPathForCurrentBalance);
        String stringForCurrentBalance = elementForCurrentBalance.getAttribute("text");
        Assert.assertTrue(stringForCurrentBalance.matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{2}(.{1})EUR"));
        MobileElement elementForAvailableBalance = x.createMobileElementByXpath(xPathForAvailableBalance);
        String stringForAvailableBalance = elementForAvailableBalance.getAttribute("text");
        Assert.assertTrue(stringForAvailableBalance.matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{2}(.{1})EUR"));
    }

    @And("Assert that whole product card of current account with name {string} and iban {string} from Excel {string} acts as a clickable button")
    public void assertThatWholeProductCardOfCurrentAccountWithNameAndIbanFromExcelActsAsAClickableButton(String columnName1, String columnName2, String rowindex) throws Throwable {
        String productName = DataManager.getDataFromHashDatamap(rowindex,columnName1);
        String productIban = DataManager.getDataFromHashDatamap(rowindex,columnName2);
        String xPathForProductName = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Current account\"]//following-sibling::*[@text='"+productName+"']";
        String xPathForProductIban = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Current account\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']";
        String xPathForProductCard1 = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Current account\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']//following-sibling::*[@text='Current balance']";
        String xPathForProductCard2 = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Current account\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']//following-sibling::*[@text='Available balance']";
        String xPathForCurrentBalance = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Current account\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']//following-sibling::*[@resource-id='nlb-value-product-primary-balance']";
        String xPathForAvailableBalance = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Current account\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']//following-sibling::*[@resource-id='nlb-value-product-secondary-balance']";
        String xPathForAssert = "//*[@resource-id='nlb-cta-button']";
        String xPathForLoad = "//*[@resource-id='nlb-value-product-primary-balance']";

        MobileElement elementForProductName = x.createMobileElementByXpath(xPathForProductName);
        hp.ClickOnElement(elementForProductName);
        By elWait1 = x.createByXpath(xPathForAssert);
        WaitHelpers.waitForElement(elWait1);
        MobileElement elementForAssert1 = x.createMobileElementByXpath(xPathForAssert);
        Assert.assertTrue(elementForAssert1.isDisplayed());
        driver.navigate().back();
        By elForLoad1 = x.createByXpath(xPathForLoad);
        WaitHelpers.waitForElement(elForLoad1);

        MobileElement elementForProductIban = x.createMobileElementByXpath(xPathForProductIban);
        hp.ClickOnElement(elementForProductIban);
        By elWait2 = x.createByXpath(xPathForAssert);
        WaitHelpers.waitForElement(elWait2);
        MobileElement elementForAssert2 = x.createMobileElementByXpath(xPathForAssert);
        Assert.assertTrue(elementForAssert2.isDisplayed());
        driver.navigate().back();
        By elForLoad2 = x.createByXpath(xPathForLoad);
        WaitHelpers.waitForElement(elForLoad2);

        MobileElement elementForProductCard1 = x.createMobileElementByXpath(xPathForProductCard1);
        hp.ClickOnElement(elementForProductCard1);
        By elWait3 = x.createByXpath(xPathForAssert);
        WaitHelpers.waitForElement(elWait3);
        MobileElement elementForAssert3 = x.createMobileElementByXpath(xPathForAssert);
        Assert.assertTrue(elementForAssert3.isDisplayed());
        driver.navigate().back();
        By elForLoad3 = x.createByXpath(xPathForLoad);
        WaitHelpers.waitForElement(elForLoad3);

        MobileElement elementForProductCard2 = x.createMobileElementByXpath(xPathForProductCard2);
        hp.ClickOnElement(elementForProductCard2);
        By elWait4 = x.createByXpath(xPathForAssert);
        WaitHelpers.waitForElement(elWait4);
        MobileElement elementForAssert4 = x.createMobileElementByXpath(xPathForAssert);
        Assert.assertTrue(elementForAssert4.isDisplayed());
        driver.navigate().back();
        By elForLoad4 = x.createByXpath(xPathForLoad);
        WaitHelpers.waitForElement(elForLoad4);

        MobileElement elementForCurrentBalance = x.createMobileElementByXpath(xPathForCurrentBalance);
        hp.ClickOnElement(elementForCurrentBalance);
        By elWait5 = x.createByXpath(xPathForAssert);
        WaitHelpers.waitForElement(elWait5);
        MobileElement elementForAssert5 = x.createMobileElementByXpath(xPathForAssert);
        Assert.assertTrue(elementForAssert5.isDisplayed());
        driver.navigate().back();
        By elForLoad5 = x.createByXpath(xPathForLoad);
        WaitHelpers.waitForElement(elForLoad5);

        MobileElement elementForAvailableBalance = x.createMobileElementByXpath(xPathForAvailableBalance);
        hp.ClickOnElement(elementForAvailableBalance);
        By elWait6 = x.createByXpath(xPathForAssert);
        WaitHelpers.waitForElement(elWait6);
        MobileElement elementForAssert6 = x.createMobileElementByXpath(xPathForAssert);
        Assert.assertTrue(elementForAssert6.isDisplayed());
        driver.navigate().back();
        By elForLoad6 = x.createByXpath(xPathForLoad);
        WaitHelpers.waitForElement(elForLoad6);
    }

    @And("Unhide account from Excel {string} columnName {string} if needed")
    public void unhideAccountFromExcelColumnNameIfNeeded(String rowindex, String columnName) throws Throwable {
        String accountIban = DataManager.getDataFromHashDatamap(rowindex,columnName);
        if (accountIban.equals(".")){
            System.out.println("This was not needed");
        } else {
            By elForEdit = x.createByXpath("//*[@resource-id='nlb-button-edit-products']");
            for(int i = 0; i<10; i++){
                if(hp.isElementNotPresent(elForEdit)){
                    hp.scrollUp(driver);
                }
            }
            WaitHelpers.waitForElement(elForEdit);
            MobileElement elementForEdit = d.createMobileElementByResourceId("nlb-button-edit-products");
            hp.ClickOnElement(elementForEdit);
            By elForEye = x.createByXpath("//android.view.View[@content-desc='Alt=\"Show Account\"']");
            WaitHelpers.waitForElement(elForEye);
            String xPathForHideAccount = "//android.view.View[@content-desc='Alt=\"Show Account\"']";
            By elForHideAccount = x.createByXpath(xPathForHideAccount);
            for(int i = 0; i<10; i++){
                if(hp.isElementNotPresent(elForHideAccount)){
                    hp.scrollDown(driver);
                }
            }
            MobileElement elementToHide = x.createMobileElementByXpath(xPathForHideAccount);
            hp.ClickOnElement(elementToHide);
            String xPath = "//android.view.View[@content-desc=\"Back\"]";
            By element = x.createByXpath(xPath);
            hp.clickElement(element);
            By elForLoad = x.createByXpath("//*[@resource-id='nlb-value-product-primary-balance']");
            WaitHelpers.waitForElement(elForLoad);
        }
    }

    @Then("Assert that product card of name {string} and iban {string} from Excel {string} for savings account are shown correctly")
    public void assertThatProductCardOfNameAndIbanFromExcelForSavingsAccountAreShownCorrectly(String columnName1, String columnName2, String rowindex) {
        String productName = DataManager.getDataFromHashDatamap(rowindex,columnName1);
        String productIban = DataManager.getDataFromHashDatamap(rowindex,columnName2);
        String xPathForProductCard1 = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Savings Account\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']//following-sibling::*[@text='Current balance']";
        String xPathForProductCard2 = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Savings Account\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']//following-sibling::*[@text='Booked balance']";
        String xPathForCurrentBalance = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Savings Account\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']//following-sibling::*[@resource-id='nlb-value-product-primary-balance']";
        String xPathForAvailableBalance = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Savings Account\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']//following-sibling::*[@resource-id='nlb-value-product-secondary-balance']";

        MobileElement elementForProductCard1 = x.createMobileElementByXpath(xPathForProductCard1);
        Assert.assertTrue(elementForProductCard1.isDisplayed());
        MobileElement elementForProductCard2 = x.createMobileElementByXpath(xPathForProductCard2);
        Assert.assertTrue(elementForProductCard2.isDisplayed());
        MobileElement elementForCurrentBalance = x.createMobileElementByXpath(xPathForCurrentBalance);
        String stringForCurrentBalance = elementForCurrentBalance.getAttribute("text");
        Assert.assertTrue(stringForCurrentBalance.matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{2}(.{1})EUR"));
        MobileElement elementForAvailableBalance = x.createMobileElementByXpath(xPathForAvailableBalance);
        String stringForAvailableBalance = elementForAvailableBalance.getAttribute("text");
        Assert.assertTrue(stringForAvailableBalance.matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{2}(.{1})EUR"));
    }

    @And("Assert that whole product card of savings account with name {string} and iban {string} from Excel {string} acts as a clickable button")
    public void assertThatWholeProductCardOfSavingsAccountWithNameAndIbanFromExcelActsAsAClickableButton(String columnName1, String columnName2, String rowindex) throws Throwable {
        String productName = DataManager.getDataFromHashDatamap(rowindex,columnName1);
        String productIban = DataManager.getDataFromHashDatamap(rowindex,columnName2);
        String xPathForProductName = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Savings Account\"]//following-sibling::*[@text='"+productName+"']";
        String xPathForProductIban = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Savings Account\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']";
        String xPathForProductCard1 = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Savings Account\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']//following-sibling::*[@text='Current balance']";
        String xPathForProductCard2 = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Savings Account\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']//following-sibling::*[@text='Booked balance']";
        String xPathForCurrentBalance = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Savings Account\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']//following-sibling::*[@resource-id='nlb-value-product-primary-balance']";
        String xPathForAvailableBalance = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Savings Account\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']//following-sibling::*[@resource-id='nlb-value-product-secondary-balance']";
        String xPathForAssert = "//*[@resource-id='nlb-header-card']";
        String xPathForLoad = "//*[@resource-id='nlb-value-product-primary-balance']";

        MobileElement elementForProductName = x.createMobileElementByXpath(xPathForProductName);
        hp.ClickOnElement(elementForProductName);
        By elWait1 = x.createByXpath(xPathForAssert);
        WaitHelpers.waitForElement(elWait1);
        MobileElement elementForAssert1 = x.createMobileElementByXpath(xPathForAssert);
        Assert.assertTrue(elementForAssert1.isDisplayed());
        driver.navigate().back();
        By elForLoad1 = x.createByXpath(xPathForLoad);
        WaitHelpers.waitForElement(elForLoad1);

        MobileElement elementForProductIban = x.createMobileElementByXpath(xPathForProductIban);
        hp.ClickOnElement(elementForProductIban);
        By elWait2 = x.createByXpath(xPathForAssert);
        WaitHelpers.waitForElement(elWait2);
        MobileElement elementForAssert2 = x.createMobileElementByXpath(xPathForAssert);
        Assert.assertTrue(elementForAssert2.isDisplayed());
        driver.navigate().back();
        By elForLoad2 = x.createByXpath(xPathForLoad);
        WaitHelpers.waitForElement(elForLoad2);

        MobileElement elementForProductCard1 = x.createMobileElementByXpath(xPathForProductCard1);
        hp.ClickOnElement(elementForProductCard1);
        By elWait3 = x.createByXpath(xPathForAssert);
        WaitHelpers.waitForElement(elWait3);
        MobileElement elementForAssert3 = x.createMobileElementByXpath(xPathForAssert);
        Assert.assertTrue(elementForAssert3.isDisplayed());
        driver.navigate().back();
        By elForLoad3 = x.createByXpath(xPathForLoad);
        WaitHelpers.waitForElement(elForLoad3);

        MobileElement elementForProductCard2 = x.createMobileElementByXpath(xPathForProductCard2);
        hp.ClickOnElement(elementForProductCard2);
        By elWait4 = x.createByXpath(xPathForAssert);
        WaitHelpers.waitForElement(elWait4);
        MobileElement elementForAssert4 = x.createMobileElementByXpath(xPathForAssert);
        Assert.assertTrue(elementForAssert4.isDisplayed());
        driver.navigate().back();
        By elForLoad4 = x.createByXpath(xPathForLoad);
        WaitHelpers.waitForElement(elForLoad4);

        MobileElement elementForCurrentBalance = x.createMobileElementByXpath(xPathForCurrentBalance);
        hp.ClickOnElement(elementForCurrentBalance);
        By elWait5 = x.createByXpath(xPathForAssert);
        WaitHelpers.waitForElement(elWait5);
        MobileElement elementForAssert5 = x.createMobileElementByXpath(xPathForAssert);
        Assert.assertTrue(elementForAssert5.isDisplayed());
        driver.navigate().back();
        By elForLoad5 = x.createByXpath(xPathForLoad);
        WaitHelpers.waitForElement(elForLoad5);

        MobileElement elementForAvailableBalance = x.createMobileElementByXpath(xPathForAvailableBalance);
        hp.ClickOnElement(elementForAvailableBalance);
        By elWait6 = x.createByXpath(xPathForAssert);
        WaitHelpers.waitForElement(elWait6);
        MobileElement elementForAssert6 = x.createMobileElementByXpath(xPathForAssert);
        Assert.assertTrue(elementForAssert6.isDisplayed());
        driver.navigate().back();
        By elForLoad6 = x.createByXpath(xPathForLoad);
        WaitHelpers.waitForElement(elForLoad6);
    }

    @Then("Assert that product card of name {string} and iban {string} from Excel {string} for financial instruments are shown correctly")
    public void assertThatProductCardOfNameAndIbanFromExcelForFinancialInstrumentsAreShownCorrectly(String columnName1, String columnName2, String rowindex) {
        String productName = DataManager.getDataFromHashDatamap(rowindex,columnName1);
        String productIban = DataManager.getDataFromHashDatamap(rowindex,columnName2);
        String xPathForProductCard1 = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Securities Account\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']//following-sibling::*[@text='Sum balance']";
        String xPathForProductCard2 = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Securities Account\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']//following-sibling::*[@text='Cash']";
        String xPathForCurrentBalance = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Securities Account\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']//following-sibling::*[@resource-id='nlb-value-product-primary-balance']";
        String xPathForAvailableBalance = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Securities Account\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']//following-sibling::*[@resource-id='nlb-value-product-secondary-balance']";

        MobileElement elementForProductCard1 = x.createMobileElementByXpath(xPathForProductCard1);
        Assert.assertTrue(elementForProductCard1.isDisplayed());
        MobileElement elementForProductCard2 = x.createMobileElementByXpath(xPathForProductCard2);
        Assert.assertTrue(elementForProductCard2.isDisplayed());
        MobileElement elementForCurrentBalance = x.createMobileElementByXpath(xPathForCurrentBalance);
        String stringForCurrentBalance = elementForCurrentBalance.getAttribute("text");
        Assert.assertTrue(stringForCurrentBalance.matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{2}(.{1})EUR"));
        MobileElement elementForAvailableBalance = x.createMobileElementByXpath(xPathForAvailableBalance);
        String stringForAvailableBalance = elementForAvailableBalance.getAttribute("text");
        Assert.assertTrue(stringForAvailableBalance.matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{2}(.{1})EUR"));
    }

    @And("Assert that whole product card of financial instruments with name {string} and iban {string} from Excel {string} acts as clickable button")
    public void assertThatWholeProductCardOfFinancialInstrumentsWithNameAndIbanFromExcelActsAsClickableButton(String columnName1, String columnName2, String rowindex) throws Throwable {
        String productName = DataManager.getDataFromHashDatamap(rowindex,columnName1);
        String productIban = DataManager.getDataFromHashDatamap(rowindex,columnName2);
        String xPathForProductName = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Securities Account\"]//following-sibling::*[@text='"+productName+"']";
        String xPathForProductIban = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Securities Account\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']";
        String xPathForProductCard1 = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Securities Account\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']//following-sibling::*[@text='Sum balance']";
        String xPathForProductCard2 = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Securities Account\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']//following-sibling::*[@text='Cash']";
        String xPathForCurrentBalance = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Securities Account\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']//following-sibling::*[@resource-id='nlb-value-product-primary-balance']";
        String xPathForAvailableBalance = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Securities Account\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']//following-sibling::*[@resource-id='nlb-value-product-secondary-balance']";
        String xPathForAssert = "//*[@resource-id='nlb-product-details-card']";
        String xPathForLoad = "//*[@resource-id='nlb-value-product-primary-balance']";

        MobileElement elementForProductName = x.createMobileElementByXpath(xPathForProductName);
        hp.ClickOnElement(elementForProductName);
        By elWait1 = x.createByXpath(xPathForAssert);
        WaitHelpers.waitForElement(elWait1);
        MobileElement elementForAssert1 = x.createMobileElementByXpath(xPathForAssert);
        Assert.assertTrue(elementForAssert1.isDisplayed());
        driver.navigate().back();
        By elForLoad1 = x.createByXpath(xPathForLoad);
        WaitHelpers.waitForElement(elForLoad1);

        MobileElement elementForProductIban = x.createMobileElementByXpath(xPathForProductIban);
        hp.ClickOnElement(elementForProductIban);
        By elWait2 = x.createByXpath(xPathForAssert);
        WaitHelpers.waitForElement(elWait2);
        MobileElement elementForAssert2 = x.createMobileElementByXpath(xPathForAssert);
        Assert.assertTrue(elementForAssert2.isDisplayed());
        driver.navigate().back();
        By elForLoad2 = x.createByXpath(xPathForLoad);
        WaitHelpers.waitForElement(elForLoad2);

        MobileElement elementForProductCard1 = x.createMobileElementByXpath(xPathForProductCard1);
        hp.ClickOnElement(elementForProductCard1);
        By elWait3 = x.createByXpath(xPathForAssert);
        WaitHelpers.waitForElement(elWait3);
        MobileElement elementForAssert3 = x.createMobileElementByXpath(xPathForAssert);
        Assert.assertTrue(elementForAssert3.isDisplayed());
        driver.navigate().back();
        By elForLoad3 = x.createByXpath(xPathForLoad);
        WaitHelpers.waitForElement(elForLoad3);

        MobileElement elementForProductCard2 = x.createMobileElementByXpath(xPathForProductCard2);
        hp.ClickOnElement(elementForProductCard2);
        By elWait4 = x.createByXpath(xPathForAssert);
        WaitHelpers.waitForElement(elWait4);
        MobileElement elementForAssert4 = x.createMobileElementByXpath(xPathForAssert);
        Assert.assertTrue(elementForAssert4.isDisplayed());
        driver.navigate().back();
        By elForLoad4 = x.createByXpath(xPathForLoad);
        WaitHelpers.waitForElement(elForLoad4);

        MobileElement elementForCurrentBalance = x.createMobileElementByXpath(xPathForCurrentBalance);
        hp.ClickOnElement(elementForCurrentBalance);
        By elWait5 = x.createByXpath(xPathForAssert);
        WaitHelpers.waitForElement(elWait5);
        MobileElement elementForAssert5 = x.createMobileElementByXpath(xPathForAssert);
        Assert.assertTrue(elementForAssert5.isDisplayed());
        driver.navigate().back();
        By elForLoad5 = x.createByXpath(xPathForLoad);
        WaitHelpers.waitForElement(elForLoad5);

        MobileElement elementForAvailableBalance = x.createMobileElementByXpath(xPathForAvailableBalance);
        hp.ClickOnElement(elementForAvailableBalance);
        By elWait6 = x.createByXpath(xPathForAssert);
        WaitHelpers.waitForElement(elWait6);
        MobileElement elementForAssert6 = x.createMobileElementByXpath(xPathForAssert);
        Assert.assertTrue(elementForAssert6.isDisplayed());
        driver.navigate().back();
        By elForLoad6 = x.createByXpath(xPathForLoad);
        WaitHelpers.waitForElement(elForLoad6);
    }

    @Then("Assert that product card of name {string} and iban {string} from Excel {string} for gradual savings account are shown correctly")
    public void assertThatProductCardOfNameAndIbanFromExcelForGradualSavingsAccountAreShownCorrectly(String columnName1, String columnName2, String rowindex) {
        String productName = DataManager.getDataFromHashDatamap(rowindex,columnName1);
        String productIban = DataManager.getDataFromHashDatamap(rowindex,columnName2);
        String xPathForProductCard1 = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Savings\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']//following-sibling::*[@text='Current balance']";
        String xPathForCurrentBalance = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Savings\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']//following-sibling::*[@resource-id='nlb-value-product-primary-balance']";

        MobileElement elementForProductCard1 = x.createMobileElementByXpath(xPathForProductCard1);
        Assert.assertTrue(elementForProductCard1.isDisplayed());
        MobileElement elementForCurrentBalance = x.createMobileElementByXpath(xPathForCurrentBalance);
        String stringForCurrentBalance = elementForCurrentBalance.getAttribute("text");
        Assert.assertTrue(stringForCurrentBalance.matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{2}(.{1})EUR"));
    }

    @And("Assert that whole product card of gradual savings account with name {string} and iban {string} from Excel {string} acts as a clickable button")
    public void assertThatWholeProductCardOfGradualSavingsAccountWithNameAndIbanFromExcelActsAsAClickableButton(String columnName1, String columnName2, String rowindex) throws Throwable {
        String productName = DataManager.getDataFromHashDatamap(rowindex,columnName1);
        String productIban = DataManager.getDataFromHashDatamap(rowindex,columnName2);
        String xPathForProductName = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Savings\"]//following-sibling::*[@text='"+productName+"']";
        String xPathForProductIban = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Savings\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']";
        String xPathForProductCard1 = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Savings\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']//following-sibling::*[@text='Current balance']";
        String xPathForCurrentBalance = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Savings\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']//following-sibling::*[@resource-id='nlb-value-product-primary-balance']";
        String xPathForAssert = "//*[@resource-id='nlb-header-card']";
        String xPathForLoad = "//*[@resource-id='nlb-value-product-primary-balance']";

        MobileElement elementForProductName = x.createMobileElementByXpath(xPathForProductName);
        hp.ClickOnElement(elementForProductName);
        By elWait1 = x.createByXpath(xPathForAssert);
        WaitHelpers.waitForElement(elWait1);
        MobileElement elementForAssert1 = x.createMobileElementByXpath(xPathForAssert);
        Assert.assertTrue(elementForAssert1.isDisplayed());
        driver.navigate().back();
        By elForLoad1 = x.createByXpath(xPathForLoad);
        WaitHelpers.waitForElement(elForLoad1);

        MobileElement elementForProductIban = x.createMobileElementByXpath(xPathForProductIban);
        hp.ClickOnElement(elementForProductIban);
        By elWait2 = x.createByXpath(xPathForAssert);
        WaitHelpers.waitForElement(elWait2);
        MobileElement elementForAssert2 = x.createMobileElementByXpath(xPathForAssert);
        Assert.assertTrue(elementForAssert2.isDisplayed());
        driver.navigate().back();
        By elForLoad2 = x.createByXpath(xPathForLoad);
        WaitHelpers.waitForElement(elForLoad2);

        MobileElement elementForProductCard1 = x.createMobileElementByXpath(xPathForProductCard1);
        hp.ClickOnElement(elementForProductCard1);
        By elWait3 = x.createByXpath(xPathForAssert);
        WaitHelpers.waitForElement(elWait3);
        MobileElement elementForAssert3 = x.createMobileElementByXpath(xPathForAssert);
        Assert.assertTrue(elementForAssert3.isDisplayed());
        driver.navigate().back();
        By elForLoad3 = x.createByXpath(xPathForLoad);
        WaitHelpers.waitForElement(elForLoad3);

        MobileElement elementForCurrentBalance = x.createMobileElementByXpath(xPathForCurrentBalance);
        hp.ClickOnElement(elementForCurrentBalance);
        By elWait5 = x.createByXpath(xPathForAssert);
        WaitHelpers.waitForElement(elWait5);
        MobileElement elementForAssert5 = x.createMobileElementByXpath(xPathForAssert);
        Assert.assertTrue(elementForAssert5.isDisplayed());
        driver.navigate().back();
        By elForLoad5 = x.createByXpath(xPathForLoad);
        WaitHelpers.waitForElement(elForLoad5);
    }

    @Then("Assert that product card of name {string} and bban {string} from Excel {string} for loan account are shown correctly")
    public void assertThatProductCardOfNameAndIbanFromExcelForLoanAccountAreShownCorrectly(String columnName1, String columnName2, String rowindex) {
        String productName = DataManager.getDataFromHashDatamap(rowindex,columnName1);
        String productIban = DataManager.getDataFromHashDatamap(rowindex,columnName2);
        //String xPathForProductCard1 = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Loan\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']//following-sibling::*[@text='Remaining debt']";
        String xPathForProductCard = "//android.widget.TextView[@resource-id=\"nlb-value-product-account-name\" and @text=\"" + productName + "\"]";
        //String xPathForCurrentBalance = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Loan\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']//following-sibling::*[@resource-id='nlb-value-product-primary-balance']";
        //String xPathForIban = "//android.widget.TextView[@resource-id=\"nlb-value-product-account-id\"]";
        String xPathForIban = "//android.widget.TextView[@resource-id=\"nlb-value-product-account-name\" and @text=\"" + productName + "\"]//following-sibling::*[@resource-id=\"nlb-value-product-account-id\"]";

        MobileElement elementForProductCard = x.createMobileElementByXpath(xPathForProductCard);
        MobileElement elementForIban = x.createMobileElementByXpath(xPathForIban);

        Assert.assertTrue(elementForProductCard.isDisplayed());
        Assert.assertEquals(elementForIban.getText(),productIban);

        String xPathForCurrentBalance = xPathForIban + "//following-sibling::*[@text='Remaining debt']//following-sibling::*[@resource-id='nlb-value-product-primary-balance']";
        MobileElement elementForCurrentBalance = x.createMobileElementByXpath(xPathForCurrentBalance);
        String stringForCurrentBalance = elementForCurrentBalance.getAttribute("text");
        Assert.assertTrue(stringForCurrentBalance.matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{2}(.{1})EUR"));
    }

    @And("Assert that whole product card of loan account with name {string} and bban {string} from Excel {string} acts as a clickable button")
    public void assertThatWholeProductCardOfLoanAccountWithNameAndIbanFromExcelActsAsAClickableButton(String columnName1, String columnName2, String rowindex) throws Throwable {
        String productName = DataManager.getDataFromHashDatamap(rowindex,columnName1);
        String productIban = DataManager.getDataFromHashDatamap(rowindex,columnName2);
        String xPathForProductName = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Loan\"]//following-sibling::*[@text='"+productName+"']";
        String xPathForProductIban = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Loan\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']";
        String xPathForProductCard1 = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Loan\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']//following-sibling::*[@text='Remaining debt']";
        String xPathForCurrentBalance = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Loan\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']//following-sibling::*[@resource-id='nlb-value-product-primary-balance']";
        String xPathForAssert = "//*[@resource-id='nlb-header-card']";
        String xPathForLoad = "//*[@resource-id='nlb-value-product-primary-balance']";

        MobileElement elementForProductName = x.createMobileElementByXpath(xPathForProductName);
        hp.ClickOnElement(elementForProductName);
        By elWait1 = x.createByXpath(xPathForAssert);
        WaitHelpers.waitForElement(elWait1);
        MobileElement elementForAssert1 = x.createMobileElementByXpath(xPathForAssert);
        Assert.assertTrue(elementForAssert1.isDisplayed());
        driver.navigate().back();
        By elForLoad1 = x.createByXpath(xPathForLoad);
        WaitHelpers.waitForElement(elForLoad1);

        MobileElement elementForProductIban = x.createMobileElementByXpath(xPathForProductIban);
        hp.ClickOnElement(elementForProductIban);
        By elWait2 = x.createByXpath(xPathForAssert);
        WaitHelpers.waitForElement(elWait2);
        MobileElement elementForAssert2 = x.createMobileElementByXpath(xPathForAssert);
        Assert.assertTrue(elementForAssert2.isDisplayed());
        driver.navigate().back();
        By elForLoad2 = x.createByXpath(xPathForLoad);
        WaitHelpers.waitForElement(elForLoad2);

        MobileElement elementForProductCard1 = x.createMobileElementByXpath(xPathForProductCard1);
        hp.ClickOnElement(elementForProductCard1);
        By elWait3 = x.createByXpath(xPathForAssert);
        WaitHelpers.waitForElement(elWait3);
        MobileElement elementForAssert3 = x.createMobileElementByXpath(xPathForAssert);
        Assert.assertTrue(elementForAssert3.isDisplayed());
        driver.navigate().back();
        By elForLoad3 = x.createByXpath(xPathForLoad);
        WaitHelpers.waitForElement(elForLoad3);

        MobileElement elementForCurrentBalance = x.createMobileElementByXpath(xPathForCurrentBalance);
        hp.ClickOnElement(elementForCurrentBalance);
        By elWait5 = x.createByXpath(xPathForAssert);
        WaitHelpers.waitForElement(elWait5);
        MobileElement elementForAssert5 = x.createMobileElementByXpath(xPathForAssert);
        Assert.assertTrue(elementForAssert5.isDisplayed());
        driver.navigate().back();
        By elForLoad5 = x.createByXpath(xPathForLoad);
        WaitHelpers.waitForElement(elForLoad5);
    }

    @And("Change name of product from Excel {string} columnName {string} into {string}")
    public void changeNameOfProductFromExcelColumnNameInto(String rowindex, String columnName, String newName) throws Throwable {
        String accountIban = DataManager.getDataFromHashDatamap(rowindex,columnName);
        By elForEdit = x.createByXpath("//*[@resource-id='nlb-button-edit-products']");
        WaitHelpers.waitForElement(elForEdit);
        MobileElement elementForEdit = d.createMobileElementByResourceId("nlb-button-edit-products");
        hp.ClickOnElement(elementForEdit);
        By elForEye = x.createByXpath("//android.view.View[@content-desc=\"Edit name\"]");
        WaitHelpers.waitForElement(elForEye);
        String xPathForEditAccount = "//*[@text='"+accountIban+"']//following-sibling::*[1]//android.view.View[@content-desc=\"Edit product card\"]";
        By elForEditAccount = x.createByXpath(xPathForEditAccount);
        for(int i = 0; i<10; i++){
            if(hp.isElementNotPresent(elForEditAccount)){
                hp.scrollDown(driver);
            }
        }
        
        MobileElement elementToEdit = x.createMobileElementByXpath(xPathForEditAccount);
        hp.ClickOnElement(elementToEdit);
        By elForEditText = x.createByXpath("//android.widget.EditText");
        WaitHelpers.waitForElement(elForEditText);
        hp.enterTextToMobileElement(newName,elForEditText);
        MobileElement elementForApply = x.createMobileElementByXpath("//*[@text='Apply']");
        hp.ClickOnElement(elementForApply);


        String xPath = "//android.view.View[@content-desc=\"Back\"]";
        By element = x.createByXpath(xPath);
        hp.clickElement(element);
        By elForLoad = x.createByXpath("//*[@resource-id='nlb-value-product-primary-balance']");
        WaitHelpers.waitForElement(elForLoad);
    }

    @And("Assert product from Excel {string} with bban {string} has name {string}")
    public void assertProductFromExcelWithIbanHasName(String rowindex, String column1, String expectedName) {
        String accountIban = DataManager.getDataFromHashDatamap(rowindex,column1);
        //String expectedName = DataManager.getDataFromHashDatamap(rowindex,column2);

        //String xPathForName = "//*[@text='"+accountIban+"']//preceding-sibling::*[@text='"+expectedName+"']";
        String xp = "//android.widget.TextView[@resource-id=\"nlb-value-product-account-name\" and @text=\'" + expectedName + "']";
        String xPathForName = "//android.view.View[.//android.widget.TextView[@text='" + accountIban + "'] and .//android.widget.TextView[@text='" + expectedName + "']]";
        //System.out.println("account iban: " + accountIban + " - account name: " + expectedName);
        MobileElement elementForName = x.createMobileElementByXpath(xp);
        Assert.assertTrue(elementForName.isDisplayed());
    }

    @And("Scroll up until element with text {string} is in view")
    public void scrollUpUntilElementWithTextIsInView(String text) {
        WaitHelpers.waitForSeconds(3);
        //MobileElement element = (MobileElement) driver.findElement(MobileBy.AndroidUIAutomator("new UiScrollable(new UiSelector().scrollable(true))" + ".scrollIntoView(new UiSelector().textContains(\"" + text +"\"))"));
        String xPath = "//*[@text = '" + text + "']";
        By el = By.xpath(xPath);

        for(int i = 0; i<35; i++){
            if(hp.isElementNotPresent(el)){
                hp.scrollUp(driver);
            }
        }
    }

    @And("Change name of product from Excel {string} columnName {string} into invalid {string}")
    public void changeNameOfProductFromExcelColumnNameIntoInvalid(String rowindex, String columnName, String newName) throws Throwable {
        String accountIban = DataManager.getDataFromHashDatamap(rowindex,columnName);
        By elForEdit = x.createByXpath("//*[@resource-id='nlb-button-edit-products']");
        WaitHelpers.waitForElement(elForEdit);
        MobileElement elementForEdit = d.createMobileElementByResourceId("nlb-button-edit-products");
        hp.ClickOnElement(elementForEdit);
        By elForEye = x.createByXpath("//android.view.View[@content-desc=\"Edit name\"]");
        WaitHelpers.waitForElement(elForEye);
        String xPathForEditAccount = "//*[@text='"+accountIban+"']//following-sibling::*[1]//android.view.View[@content-desc=\"Edit name\"]";
        By elForEditAccount = x.createByXpath(xPathForEditAccount);
        for(int i = 0; i<10; i++){
            if(hp.isElementNotPresent(elForEditAccount)){
                hp.scrollDown(driver);
            }
        }

        MobileElement elementToEdit = x.createMobileElementByXpath(xPathForEditAccount);
        hp.ClickOnElement(elementToEdit);
        //MobileElement elForEditText = x.createMobileElementByXpath("//android.widget.EditText");
        By elForDeleteName = x.createByXpath("//android.view.View[@content-desc=\"Delete name\"]");
        hp.clickElement(elForDeleteName);
        By elForEditText = x.createByXpath("//android.widget.EditText");
        hp.clickElement(elForEditText);
        ActionApiHelpers.clearInputField(driver.findElement(elForEditText));
        Character[] charObjectArray = Utilities.toCharacterArray(newName);
        hp.pressKey(charObjectArray);
        //hp.enterTextToMobileElement(newName,elForEditText);
        String xPathForWarningMessage = "//*[@text='Dosegli ste maximalno število znakov 50/50.']";
        MobileElement elementForWarningMessage = x.createMobileElementByXpath(xPathForWarningMessage);
        Assert.assertTrue(elementForWarningMessage.isDisplayed());
        MobileElement elementForEditText = x.createMobileElementByXpath("//android.widget.EditText");
        String contentOfEditText = elementForEditText.getText();
        Assert.assertEquals(50,contentOfEditText.length());

    }

    @And("Change name of product from Excel {string} columnName {string} into default")
    public void changeNameOfProductFromExcelColumnNameIntoDefault(String rowindex, String columnName) throws Throwable {
        String accountIban = DataManager.getDataFromHashDatamap(rowindex,columnName);
        By elForEdit = x.createByXpath("//*[@resource-id='nlb-button-edit-products']");
        WaitHelpers.waitForElement(elForEdit);
        MobileElement elementForEdit = d.createMobileElementByResourceId("nlb-button-edit-products");
        hp.ClickOnElement(elementForEdit);
        By elForEye = x.createByXpath("//android.view.View[@content-desc=\"Edit name\"]");
        WaitHelpers.waitForElement(elForEye);
        String xPathForEditAccount = "//*[@text='"+accountIban+"']//following-sibling::*[1]//android.view.View[@content-desc=\"Edit name\"]";
        By elForEditAccount = x.createByXpath(xPathForEditAccount);
        for(int i = 0; i<10; i++){
            if(hp.isElementNotPresent(elForEditAccount)){
                hp.scrollDown(driver);
            }
        }

        MobileElement elementToEdit = x.createMobileElementByXpath(xPathForEditAccount);
        hp.ClickOnElement(elementToEdit);
        By elForDeleteName = x.createByXpath("//android.view.View[@content-desc=\"Delete name\"]");
        hp.clickElement(elForDeleteName);

    }

    @And("Change name of product {string} into default")
    public void changeNameOfProductIntoDefault(String accountIban) throws Throwable {
        By elForEye = x.createByXpath("//android.view.View[@content-desc=\"Edit name\"]");
        WaitHelpers.waitForElement(elForEye);
        String xPathForEditAccount = "//*[@text='"+accountIban+"']//following-sibling::*[2]//android.view.View[@content-desc=\"Edit name\"]";
        By elForEditAccount = x.createByXpath(xPathForEditAccount);
        for(int i = 0; i<10; i++){
            if(hp.isElementNotPresent(elForEditAccount)){
                hp.scrollDown(driver);
            }
        }

        MobileElement elementToEdit = x.createMobileElementByXpath(xPathForEditAccount);
        hp.ClickOnElement(elementToEdit);
        By elForDeleteName = x.createByXpath("//android.view.View[@content-desc=\"Delete name\"]");
        hp.clickElement(elForDeleteName);
    }

    @And("Scroll down until element with text {string} is in view")
    public void scrollDownUntilElementWithTextIsInView(String text) {
        WaitHelpers.waitForSeconds(3);
        //MobileElement element = (MobileElement) driver.findElement(MobileBy.AndroidUIAutomator("new UiScrollable(new UiSelector().scrollable(true))" + ".scrollIntoView(new UiSelector().textContains(\"" + text +"\"))"));
        String xPath = "//*[@text = '" + text + "']";
        By el = By.xpath(xPath);

        for(int i = 0; i<35; i++){
            if(hp.isElementNotPresent(el)){
                hp.scrollDown(driver);
            }
        }
    }

    @And("Hide account from Excel {string} columnName {string}")
    public void hideAccountFromExcelColumnName(String rowindex, String columnName) throws Throwable {
        String accountIban = DataManager.getDataFromHashDatamap(rowindex,columnName);
        By elForEdit = x.createByXpath("//*[@resource-id='nlb-button-edit-products']");
        WaitHelpers.waitForElement(elForEdit);
        MobileElement elementForEdit = d.createMobileElementByResourceId("nlb-button-edit-products");
        hp.ClickOnElement(elementForEdit);
        By elForEye = x.createByXpath("//android.view.View[@content-desc=\"Hide Account\"]");
        WaitHelpers.waitForElement(elForEye);
        String xPathForHideAccount = "//*[@text='"+accountIban+"']//following-sibling::android.view.View[2]";
        By elForHideAccount = x.createByXpath(xPathForHideAccount);
        for(int i = 0; i<10; i++){
            if(hp.isElementNotPresent(elForHideAccount)){
                hp.scrollDown(driver);
            }
        }
        MobileElement elementToHide = x.createMobileElementByXpath(xPathForHideAccount);
        hp.ClickOnElement(elementToHide);
        String xPath = "//android.view.View[@content-desc=\"Back\"]";
        By element = x.createByXpath(xPath);
        hp.clickElement(element);
        By elForLoad = x.createByXpath("//*[@resource-id='nlb-value-product-primary-balance']");
        WaitHelpers.waitForElement(elForLoad);
    }

    @Then("Assert that product card of name {string} and bban {string} from Excel {string} is not displayed")
    public void assertThatProductCardOfNameAndIbanFromExcelIsNotDisplayed(String columnName1, String columnName2, String rowindex) {
        String accountName = DataManager.getDataFromHashDatamap(rowindex,columnName1);
        String accountIban = DataManager.getDataFromHashDatamap(rowindex,columnName2);

        String xPathForAccountName = "//*[@text='"+accountName+"']";
        String xPathForAccountIban= "//*[@text='"+accountIban+"']";

        By elForAccountName = x.createByXpath(xPathForAccountName);
        By elForAccountIban = x.createByXpath(xPathForAccountIban);

        for(int i = 0; i<15; i++){
            if (hp.isElementNotPresent(elForAccountIban)){
                hp.scrollDown(driver);
            } else {
                Assert.fail();
            }
        }
    }

    @And("Assert element by id {string} that has descendant text {string}")
    public void assertElementByIdThatHasDescendantText(String id, String descendantText) {
        String xPath = "//*[@resource-id='"+id+"']//*[@text='"+descendantText+"']";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert text {string} in element id {string} with descendant tag {string}")
    public void assertTextInElementIdWithDescendantTag(String expectedText, String id, String descendantTag) {
        String xPath = "//*[@resource-id='"+id+"']//android.widget."+descendantTag+"";
        By el = x.createByXpath(xPath);
        WaitHelpers.waitForElement(el);
        MobileElement element = d.createMobileElementByResourceId(id);
        Assert.assertEquals(expectedText,element.getAttribute("text"));
    }

    @And("Wait for element with {string} content description from view tag {string}")
    public void waitForElementWithContentDescriptionFromViewTag(String contentDesc, String tag) {
        String xPath = "(//android.view."+tag+"[@content-desc=\""+contentDesc+"\"])[1]";
        By el = x.createByXpath(xPath);
        WaitHelpers.waitForElement(el);
    }

    @And("Assert Debtor in Own Account Transfer has content description {string} and from Excel {string} account name {string} and iban {string}")
    public void assertDebtorInOwnAccountTransferHasContentDescriptionAndFromExcelAccountNameAndIban(String contentDesc, String rowindex, String columnName1, String columnName2) {
        String accountName = DataManager.getDataFromHashDatamap(rowindex,columnName1);
        String accountIban = DataManager.getDataFromHashDatamap(rowindex,columnName2);
        String xPath = "//*[@text='Debtor']//following-sibling::*[@resource-id='nlb-card-container']//*[@content-desc='"+contentDesc+"']//following-sibling::*[@text='"+accountName+"']//following-sibling::*[@text='"+accountIban+"']";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert Recipient in Own Account Transfer has content description {string} and from Excel {string} account name {string} and iban {string}")
    public void assertRecipientInOwnAccountTransferHasContentDescriptionAndFromExcelAccountNameAndIban(String contentDesc, String rowindex, String columnName1, String columnName2) {
        String accountName = DataManager.getDataFromHashDatamap(rowindex,columnName1);
        String accountIban = DataManager.getDataFromHashDatamap(rowindex,columnName2);
        String xPath = "//*[@text='Recipient ']//following-sibling::*[@resource-id='nlb-card-container']//*[@content-desc='"+contentDesc+"']//following-sibling::*[@text='"+accountName+"']//following-sibling::*[@text='"+accountIban+"']";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert element by contains text with special characters {string}")
    public void assertElementByContainsTextWithSpecialCharacters(String text) {
        String xPath = "//*[contains(@text,\""+text+"\")]";
        By elWait = x.createByXpath(xPath);
        WaitHelpers.waitForElement(elWait);

        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert element by id {string} is not displayed")
    public void assertElementByIdIsNotDisplayed(String id) throws Throwable {
        By element = d.createElementByResourceId(id);
        boolean isElementDisplayed = hp.isElementDisplayed(element, 5, 100);
        Assert.assertFalse(isElementDisplayed);
    }

    @And("Assert SEPA Recipient has icon {string} and from Excel {string} account name {string} and iban {string}")
    public void assertSEPARecipientHasIconAndFromExcelAccountNameAndIban(String iconText, String rowindex, String columnName1, String columnName2) {
        String accountName = DataManager.getDataFromHashDatamap(rowindex,columnName1);
        String accountIban = DataManager.getDataFromHashDatamap(rowindex,columnName2);
        String xPath = "//*[@text='Recipient ']//following-sibling::*[@resource-id='nlb-card-container']//*[@text='"+iconText+"']//following-sibling::*[@text='"+accountName+"']//following-sibling::*[@text='"+accountIban+"']";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert that text {string} has first following sibling with text {string}")
    public void assertThatTextHasFirstFollowingSiblingWithText(String textFirst, String textSecond) {
        String xPath = "//*[@text='"+textFirst+"']//following-sibling::*[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertEquals(textSecond,element.getText());
    }

    @And("Assert that text {string} has first following sibling with text from Excel {string} columnName {string}")
    public void assertThatTextHasFirstFollowingSiblingWithTextFromExcelColumnName(String textFirst, String rowindex, String columnName) {
        String textSecond = DataManager.getDataFromHashDatamap(rowindex,columnName);
        String xPath = "//*[@text='"+textFirst+"']//following-sibling::*[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertEquals(textSecond,element.getText());
    }

    @And("Assert that second text {string} has first following sibling with text from Excel {string} columnName {string}")
    public void assertThatSecondTextHasFirstFollowingSiblingWithTextFromExcelColumnName(String textFirst, String rowindex, String columnName) {
        String textSecond = DataManager.getDataFromHashDatamap(rowindex,columnName);
        String xPath = "//*[@text='"+textFirst+"'][2]//following-sibling::*[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertEquals(textSecond,element.getText());
    }

    @And("Assert that text {string} has first following sibling with current date in format {string}")
    public void assertThatTextHasFirstFollowingSiblingWithCurrentDateInFormat(String textFirst, String dateFormat) {
        String xPath = "//*[@text='"+textFirst+"']//following-sibling::*[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        String currentDate = Utilities.getTodayDateInFormat(dateFormat);
        String actualDate = element.getAttribute("text").replaceAll("\u00A0", "");
        Assert.assertEquals(currentDate, actualDate);
    }

    @And("Assert text {string} in element by id {string} with descendant TextView widget")
    public void assertTextInElementByIdWithDescendantTextViewWidget(String expectedText, String id) {
        String xPath = "//*[@resource-id='"+id+"']//android.widget.TextView";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertEquals(expectedText,element.getText());
    }

    @And("Assert text {string} in element by id {string} with descendant View")
    public void assertTextInElementByIdWithDescendantView(String expectedText, String id) {
        String xPath = "//*[@resource-id='"+id+"']//android.view.View";
        By el = x.createByXpath(xPath);
        WaitHelpers.waitForElement(el);
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertEquals(expectedText,element.getText());
    }

    @And("Assert recipient in first step of payment is {string} from Excel {string} account name {string} and iban {string}")
    public void assertRecipientInFirstStepOfPaymentIsFromExcelAccountNameAndIban(String contentDesc, String rowindex, String columnName1, String columnName2) {
        String accountName = DataManager.getDataFromHashDatamap(rowindex,columnName1);
        String accountIban = DataManager.getDataFromHashDatamap(rowindex,columnName2);
        String xPath = "//*[@resource-id='nlb-card-container']//*[@content-desc='"+contentDesc+"']//following-sibling::*[@text='"+accountName+"']//following-sibling::*[@text='"+accountIban+"']";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert text from excel {string} columnName {string} in element by id {string}")
    public void assertTextFromExcelColumnNameInElementById(String rowindex, String columnName, String id) {
        String expected = DataManager.getDataFromHashDatamap(rowindex,columnName);
        MobileElement element = d.createMobileElementByResourceId(id);
        Assert.assertEquals(expected,element.getText());
    }

    @And("Enter text {string} into search field for country selection")
    public void enterTextIntoSearchFieldForCountrySelection(String text) {
        String xPath = "//android.widget.ImageView[@content-desc=\"Info Icon\"]//following-sibling::android.widget.EditText";
        By el = x.createByXpath(xPath);
        hp.enterTextToMobileElement(text,el);
    }

    @And("Click second element with text {string}")
    public void clickSecondElementWithText(String text) throws Throwable {
        String xPath = "(//*[@text='"+text+"'])[2]";
        MobileElement el = x.createMobileElementByXpath(xPath);
        hp.ClickOnElement(el);
    }

    @And("Click on {string} android widget button")
    public void clickOnAndroidWidgetButton(String occ) throws Throwable {
        String xPath = "(//android.widget.Button)["+occ+"]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Assert {string} content description from view tag {string} has descendant with text {string}")
    public void assertContentDescriptionFromViewTagHasDescendantWithText(String contentDesc, String tag, String text) {
        String xPath = "//android.view."+tag+"[@content-desc=\""+contentDesc+"\"]/android.widget.TextView";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertEquals(text,element.getText());
    }

    @And("Assert {string} content description from view tag {string} is displayed")
    public void assertContentDescriptionFromViewTagIsDisplayed(String text, String tag) {
        String xPath = "//android.view." + tag + "[@content-desc=\"" + text + "\"]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Wait for element by text {string}")
    public void waitForElementByText(String text) {
        By element = tx.createElementByText(text);
        WaitHelpers.waitForElement(element, 60);
    }

    @And("Assert OTP container is correct")
    public void assertOTPContainerIsCorrect() throws Throwable {
        rh.assertOTPContainerIsCorrect();
    }

    @And("Try wrong otp on web page from excel {string} columnName {string}")
    public void tryWrongOtpOnWebPageFromExcelColumnName(String rowindex, String columnName) throws IOException, UnsupportedFlavorException {
        String url = DataManager.getDataFromHashDatamap(rowindex,columnName);
        String env = DataManager.getDataFromHashDatamap(rowindex,"currentEnv");
        rh.tryWrongOtpFromClipboardOnWebPage(url,env);
    }

    @And("Find the appropriate transaction for canceling manual categorization")
    public void findTheAppropriateTransactionForCancelingManualCategorization() throws Throwable {
        rh.findTheAppropriateTransactionForCancelingManualCategorization();
    }

    @And("Remember current category of transaction")
    public void rememberCurrentCategoryOfTransaction() {
        String xPath = "//*[@resource-id='nlb-card-container']//android.view.View[3]//preceding-sibling::android.widget.TextView";
        MobileElement element = x.createMobileElementByXpath(xPath);
        DataManager.userObject.put("current_category",element.getText());
    }

    @And("Click on edit button to change category")
    public void clickOnEditButtonToChangeCategory() throws Throwable {
        String xPath = "//*[@resource-id='nlb-card-container']//android.view.View[3]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Click on category from key {string} to get to category selection window")
    public void clickOnCategoryFromKeyToGetToCategorySelectionWindow(String key) throws Throwable {
        String category = (String) DataManager.userObject.get(key);
        String xPath = "//android.view.View[@content-desc=\""+category+"\"]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Assert category from key {string} is shown")
    public void assertCategoryFromKeyIsShown(String key) {
        String category = (String) DataManager.userObject.get(key);
        MobileElement element = x.createMobileElementByText(category);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert that product card of name {string} and iban {string} from Excel {string} for vita insurance account are shown correctly")
    public void assertThatProductCardOfNameAndIbanFromExcelForVitaInsuranceAccountAreShownCorrectly(String columnName1, String columnName2, String rowindex) {
        String productName = DataManager.getDataFromHashDatamap(rowindex,columnName1);
        String productIban = DataManager.getDataFromHashDatamap(rowindex,columnName2);
        String xPathForProductCard1 = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']//following-sibling::*[@text='Policy value']";
        String xPathForCurrentBalance = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']//following-sibling::*[@resource-id='nlb-value-product-primary-balance']";

        MobileElement elementForProductCard1 = x.createMobileElementByXpath(xPathForProductCard1);
        Assert.assertTrue(elementForProductCard1.isDisplayed());
        MobileElement elementForCurrentBalance = x.createMobileElementByXpath(xPathForCurrentBalance);
        String stringForCurrentBalance = elementForCurrentBalance.getAttribute("text");
        Assert.assertTrue(stringForCurrentBalance.matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{2}(.{1})EUR"));
    }

    @And("Assert that whole product card of vita insurance account with name {string} and iban {string} from Excel {string} acts as a clickable button")
    public void assertThatWholeProductCardOfVitaInsuranceAccountWithNameAndIbanFromExcelActsAsAClickableButton(String columnName1, String columnName2, String rowindex) throws Throwable {
        String productName = DataManager.getDataFromHashDatamap(rowindex,columnName1);
        String productIban = DataManager.getDataFromHashDatamap(rowindex,columnName2);
        String xPathForProductName = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"\"]//following-sibling::*[@text='"+productName+"']";
        String xPathForProductIban = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']";
        String xPathForProductCard1 = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']//following-sibling::*[@text='Policy value']";
        String xPathForCurrentBalance = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']//following-sibling::*[@resource-id='nlb-value-product-primary-balance']";
        String xPathForAssert = "//*[@resource-id='nlb-header-card']";
        String xPathForLoad = "//*[@resource-id='nlb-value-product-primary-balance']";

        MobileElement elementForProductName = x.createMobileElementByXpath(xPathForProductName);
        hp.ClickOnElement(elementForProductName);
        By elWait1 = x.createByXpath(xPathForAssert);
        WaitHelpers.waitForElement(elWait1);
        MobileElement elementForAssert1 = x.createMobileElementByXpath(xPathForAssert);
        Assert.assertTrue(elementForAssert1.isDisplayed());
        driver.navigate().back();
        By elForLoad1 = x.createByXpath(xPathForLoad);
        WaitHelpers.waitForElement(elForLoad1);

        MobileElement elementForProductIban = x.createMobileElementByXpath(xPathForProductIban);
        hp.ClickOnElement(elementForProductIban);
        By elWait2 = x.createByXpath(xPathForAssert);
        WaitHelpers.waitForElement(elWait2);
        MobileElement elementForAssert2 = x.createMobileElementByXpath(xPathForAssert);
        Assert.assertTrue(elementForAssert2.isDisplayed());
        driver.navigate().back();
        By elForLoad2 = x.createByXpath(xPathForLoad);
        WaitHelpers.waitForElement(elForLoad2);

        MobileElement elementForProductCard1 = x.createMobileElementByXpath(xPathForProductCard1);
        hp.ClickOnElement(elementForProductCard1);
        By elWait3 = x.createByXpath(xPathForAssert);
        WaitHelpers.waitForElement(elWait3);
        MobileElement elementForAssert3 = x.createMobileElementByXpath(xPathForAssert);
        Assert.assertTrue(elementForAssert3.isDisplayed());
        driver.navigate().back();
        By elForLoad3 = x.createByXpath(xPathForLoad);
        WaitHelpers.waitForElement(elForLoad3);

        MobileElement elementForCurrentBalance = x.createMobileElementByXpath(xPathForCurrentBalance);
        hp.ClickOnElement(elementForCurrentBalance);
        By elWait5 = x.createByXpath(xPathForAssert);
        WaitHelpers.waitForElement(elWait5);
        MobileElement elementForAssert5 = x.createMobileElementByXpath(xPathForAssert);
        Assert.assertTrue(elementForAssert5.isDisplayed());
        driver.navigate().back();
        By elForLoad5 = x.createByXpath(xPathForLoad);
        WaitHelpers.waitForElement(elForLoad5);
    }

    @Then("Assert that product card of name {string} and iban {string} from Excel {string} for term deposit account are shown correctly")
    public void assertThatProductCardOfNameAndIbanFromExcelForTermDepositAccountAreShownCorrectly(String columnName1, String columnName2, String rowindex) {
        String productName = DataManager.getDataFromHashDatamap(rowindex,columnName1);
        String productIban = DataManager.getDataFromHashDatamap(rowindex,columnName2);
        String xPathForProductCard1 = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Deposit\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']//following-sibling::*[@text='Term deposit amount']";
        String xPathForCurrentBalance = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Deposit\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']//following-sibling::*[@resource-id='nlb-value-product-primary-balance']";

        MobileElement elementForProductCard1 = x.createMobileElementByXpath(xPathForProductCard1);
        Assert.assertTrue(elementForProductCard1.isDisplayed());
        MobileElement elementForCurrentBalance = x.createMobileElementByXpath(xPathForCurrentBalance);
        String stringForCurrentBalance = elementForCurrentBalance.getAttribute("text");
        Assert.assertTrue(stringForCurrentBalance.matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{2}(.{1})EUR"));
    }

    @And("Assert that whole product card of term deposit account with name {string} and iban {string} from Excel {string} acts as a clickable button")
    public void assertThatWholeProductCardOfTermDepositAccountWithNameAndIbanFromExcelActsAsAClickableButton(String columnName1, String columnName2, String rowindex) throws Throwable {
        String productName = DataManager.getDataFromHashDatamap(rowindex,columnName1);
        String productIban = DataManager.getDataFromHashDatamap(rowindex,columnName2);
        String xPathForProductName = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Deposit\"]//following-sibling::*[@text='"+productName+"']";
        String xPathForProductIban = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Deposit\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']";
        String xPathForProductCard1 = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Deposit\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']//following-sibling::*[@text='Term deposit amount']";
        String xPathForCurrentBalance = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Deposit\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']//following-sibling::*[@resource-id='nlb-value-product-primary-balance']";
        String xPathForAssert = "//*[@resource-id='nlb-header-card']";
        String xPathForLoad = "//*[@resource-id='nlb-value-product-primary-balance']";

        MobileElement elementForProductName = x.createMobileElementByXpath(xPathForProductName);
        hp.ClickOnElement(elementForProductName);
        By elWait1 = x.createByXpath(xPathForAssert);
        WaitHelpers.waitForElement(elWait1);
        MobileElement elementForAssert1 = x.createMobileElementByXpath(xPathForAssert);
        Assert.assertTrue(elementForAssert1.isDisplayed());
        driver.navigate().back();
        By elForLoad1 = x.createByXpath(xPathForLoad);
        WaitHelpers.waitForElement(elForLoad1);

        MobileElement elementForProductIban = x.createMobileElementByXpath(xPathForProductIban);
        hp.ClickOnElement(elementForProductIban);
        By elWait2 = x.createByXpath(xPathForAssert);
        WaitHelpers.waitForElement(elWait2);
        MobileElement elementForAssert2 = x.createMobileElementByXpath(xPathForAssert);
        Assert.assertTrue(elementForAssert2.isDisplayed());
        driver.navigate().back();
        By elForLoad2 = x.createByXpath(xPathForLoad);
        WaitHelpers.waitForElement(elForLoad2);

        MobileElement elementForProductCard1 = x.createMobileElementByXpath(xPathForProductCard1);
        hp.ClickOnElement(elementForProductCard1);
        By elWait3 = x.createByXpath(xPathForAssert);
        WaitHelpers.waitForElement(elWait3);
        MobileElement elementForAssert3 = x.createMobileElementByXpath(xPathForAssert);
        Assert.assertTrue(elementForAssert3.isDisplayed());
        driver.navigate().back();
        By elForLoad3 = x.createByXpath(xPathForLoad);
        WaitHelpers.waitForElement(elForLoad3);

        MobileElement elementForCurrentBalance = x.createMobileElementByXpath(xPathForCurrentBalance);
        hp.ClickOnElement(elementForCurrentBalance);
        By elWait5 = x.createByXpath(xPathForAssert);
        WaitHelpers.waitForElement(elWait5);
        MobileElement elementForAssert5 = x.createMobileElementByXpath(xPathForAssert);
        Assert.assertTrue(elementForAssert5.isDisplayed());
        driver.navigate().back();
        By elForLoad5 = x.createByXpath(xPathForLoad);
        WaitHelpers.waitForElement(elForLoad5);
    }

    @Then("Assert that product card of name {string} and detailed name {string} from Excel {string} for nlb funds account are shown correctly")
    public void assertThatProductCardOfNameAndDetailedNameFromExcelForNlbFundsAccountAreShownCorrectly(String columnName1, String columnName2, String rowindex) {
        String productName = DataManager.getDataFromHashDatamap(rowindex,columnName1);
        String productIban = DataManager.getDataFromHashDatamap(rowindex,columnName2);
        String xPathForProductCard1 = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']//following-sibling::*[@text='Current balance']";
        String xPathForProductCard2 = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']//following-sibling::*[@text='Number of asset units']";
        String xPathForCurrentBalance = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']//following-sibling::*[@resource-id='nlb-value-product-primary-balance']";
        String xPathForAvailableBalance = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']//following-sibling::*[@resource-id='nlb-value-product-secondary-balance']";

        MobileElement elementForProductCard1 = x.createMobileElementByXpath(xPathForProductCard1);
        Assert.assertTrue(elementForProductCard1.isDisplayed());
        MobileElement elementForProductCard2 = x.createMobileElementByXpath(xPathForProductCard2);
        Assert.assertTrue(elementForProductCard2.isDisplayed());
        MobileElement elementForCurrentBalance = x.createMobileElementByXpath(xPathForCurrentBalance);
        String stringForCurrentBalance = elementForCurrentBalance.getAttribute("text");
        Assert.assertTrue(stringForCurrentBalance.matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{2}(.{1})EUR"));
        MobileElement elementForAvailableBalance = x.createMobileElementByXpath(xPathForAvailableBalance);
        String stringForAvailableBalance = elementForAvailableBalance.getAttribute("text");
        Assert.assertTrue(stringForAvailableBalance.matches("[0-9,]*"));
    }

    @And("Assert that whole product card of nlb funds account with name {string} and iban {string} from Excel {string} acts as a clickable button")
    public void assertThatWholeProductCardOfNlbFundsAccountWithNameAndIbanFromExcelActsAsAClickableButton(String columnName1, String columnName2, String rowindex) throws Throwable {
        String productName = DataManager.getDataFromHashDatamap(rowindex,columnName1);
        String productIban = DataManager.getDataFromHashDatamap(rowindex,columnName2);
        String xPathForProductName = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"\"]//following-sibling::*[@text='"+productName+"']";
        String xPathForProductIban = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']";
        String xPathForProductCard1 = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']//following-sibling::*[@text='Current balance']";
        String xPathForProductCard2 = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']//following-sibling::*[@text='Number of asset units']";
        String xPathForCurrentBalance = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']//following-sibling::*[@resource-id='nlb-value-product-primary-balance']";
        String xPathForAvailableBalance = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']//following-sibling::*[@resource-id='nlb-value-product-secondary-balance']";
        String xPathForAssert = "//*[@resource-id='nlb-header-card']";
        String xPathForLoad = "//*[@resource-id='nlb-value-product-primary-balance']";

        MobileElement elementForProductName = x.createMobileElementByXpath(xPathForProductName);
        hp.ClickOnElement(elementForProductName);
        By elWait1 = x.createByXpath(xPathForAssert);
        WaitHelpers.waitForElement(elWait1);
        MobileElement elementForAssert1 = x.createMobileElementByXpath(xPathForAssert);
        Assert.assertTrue(elementForAssert1.isDisplayed());
        driver.navigate().back();
        By elForLoad1 = x.createByXpath(xPathForLoad);
        WaitHelpers.waitForElement(elForLoad1);

        MobileElement elementForProductIban = x.createMobileElementByXpath(xPathForProductIban);
        hp.ClickOnElement(elementForProductIban);
        By elWait2 = x.createByXpath(xPathForAssert);
        WaitHelpers.waitForElement(elWait2);
        MobileElement elementForAssert2 = x.createMobileElementByXpath(xPathForAssert);
        Assert.assertTrue(elementForAssert2.isDisplayed());
        driver.navigate().back();
        By elForLoad2 = x.createByXpath(xPathForLoad);
        WaitHelpers.waitForElement(elForLoad2);

        MobileElement elementForProductCard1 = x.createMobileElementByXpath(xPathForProductCard1);
        hp.ClickOnElement(elementForProductCard1);
        By elWait3 = x.createByXpath(xPathForAssert);
        WaitHelpers.waitForElement(elWait3);
        MobileElement elementForAssert3 = x.createMobileElementByXpath(xPathForAssert);
        Assert.assertTrue(elementForAssert3.isDisplayed());
        driver.navigate().back();
        By elForLoad3 = x.createByXpath(xPathForLoad);
        WaitHelpers.waitForElement(elForLoad3);

        MobileElement elementForProductCard2 = x.createMobileElementByXpath(xPathForProductCard2);
        hp.ClickOnElement(elementForProductCard2);
        By elWait4 = x.createByXpath(xPathForAssert);
        WaitHelpers.waitForElement(elWait4);
        MobileElement elementForAssert4 = x.createMobileElementByXpath(xPathForAssert);
        Assert.assertTrue(elementForAssert4.isDisplayed());
        driver.navigate().back();
        By elForLoad4 = x.createByXpath(xPathForLoad);
        WaitHelpers.waitForElement(elForLoad4);

        MobileElement elementForCurrentBalance = x.createMobileElementByXpath(xPathForCurrentBalance);
        hp.ClickOnElement(elementForCurrentBalance);
        By elWait5 = x.createByXpath(xPathForAssert);
        WaitHelpers.waitForElement(elWait5);
        MobileElement elementForAssert5 = x.createMobileElementByXpath(xPathForAssert);
        Assert.assertTrue(elementForAssert5.isDisplayed());
        driver.navigate().back();
        By elForLoad5 = x.createByXpath(xPathForLoad);
        WaitHelpers.waitForElement(elForLoad5);

        MobileElement elementForAvailableBalance = x.createMobileElementByXpath(xPathForAvailableBalance);
        hp.ClickOnElement(elementForAvailableBalance);
        By elWait6 = x.createByXpath(xPathForAssert);
        WaitHelpers.waitForElement(elWait6);
        MobileElement elementForAssert6 = x.createMobileElementByXpath(xPathForAssert);
        Assert.assertTrue(elementForAssert6.isDisplayed());
        driver.navigate().back();
        By elForLoad6 = x.createByXpath(xPathForLoad);
        WaitHelpers.waitForElement(elForLoad6);
    }

    @Then("Find the appropriate transaction adding tags")
    public void findTheAppropriateTransactionAddingTags() throws Throwable {
        rh.findTheAppropriateTransactionAddingTags();
    }

    @And("Enter text {string} in element id {string} with clear")
    public void enterTextInElementIdWithClear(String text, String id) throws Throwable {
        By inputField = d.createElementByResourceId(id);
        rh.EnterTextToElementByIdWithClear(text,inputField);
    }

    @And("Click on following sibling of text {string}")
    public void clickOnFollowingSiblingOfText(String text) throws Throwable {
        String xPath = "(//*[@text='"+text+"']//following-sibling::*)[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Assert value from clipboard is the same as from Excel {string} columnName {string}")
    public void assertValueFromClipboardIsTheSameAsFromExcelColumnName(String rowindex, String columnName) throws IOException, UnsupportedFlavorException {
        if(Base.getDataFromFileConf(Hooks.rowinConfExcel,"DEVICE_NAME").contains("HUAWEI")){
        } else {
            String details = DataManager.getDataFromHashDatamap(rowindex,columnName);
            String cliboard = (String) Toolkit.getDefaultToolkit().getSystemClipboard().getData(DataFlavor.stringFlavor);
            Assert.assertEquals(details,cliboard);
        }
    }

    @And("Assert text from excel {string} columnName {string} in second element by id {string}")
    public void assertTextFromExcelColumnNameInSecondElementById(String rowindex, String columnName, String id) {
        String expectedText = DataManager.getDataFromHashDatamap(rowindex,columnName);
        String xPath = "(//*[@resource-id='"+id+"'])[2]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertEquals(expectedText,element.getText());
    }

    @And("Remember secondary balance of product from Excel {string} columnName {string} under key {string}")
    public void rememberSecondaryBalanceOfProductFromExcelColumnNameUnderKey(String rowindex, String columnName, String key) {
        String accountName = DataManager.getDataFromHashDatamap(rowindex,columnName);
        String xPath = "//*[@text='"+accountName+"']//following-sibling::*[@resource-id='nlb-value-product-secondary-balance']";
        MobileElement element = x.createMobileElementByXpath(xPath);
        DataManager.userObject.put(key,element.getText());
    }

    @And("Assert text from key {string} in element by id {string}")
    public void assertTextFromKeyInElementById(String key, String id) {
        String expectedValue = (String) DataManager.userObject.get(key);
        MobileElement element = d.createMobileElementByResourceId(id);
        Assert.assertEquals(expectedValue,element.getText());
    }

    @And("Assert element by widget {string}")
    public void assertElementByWidget(String widgetName) {
        String xPath = "//android.widget."+widgetName+"";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Force USD currency in first step of payment process")
    public void forceUSDCurrencyInFirstStepOfPaymentProcess() {
        String xPath = "//*[@resource-id='nlb-dropdown-menu']//android.widget.TextView";
        By element = x.createByXpath(xPath);
        hp.enterTextToMobileElement("USD",element);
    }

    @And("Scroll down until currency {string} in selector is found and click")
    public void scrollDownUntilCurrencyInSelectorIsFoundAndClick(String currency) throws Throwable {
        rh.scrollDownUntilCurrencyInSelectorIsFoundAndClick(currency);
    }

    @And("Wait for My NLB screen to load")
    public void waitForMyNLBScreenToLoad() {
        String xPath = "(//*[@resource-id='nlb-card-container'])[1]";
        By elFirstTransaction = x.createByXpath(xPath);
        WaitHelpers.waitForElement(elFirstTransaction);
    }

    @And("Click on Bottom navigation button {string}")
    public void clickOnBottomNavigationButton(String buttonName) throws Throwable {
        String xPath = "//android.widget.TextView[@text='" + buttonName + "']/ancestor::android.view.View[@resource-id='nlb-bottom-nav-button']";
        MobileElement element = x.createMobileElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Click on Product from Excel {string} columnName {string} in My Products")
    public void clickOnProductFromExcelColumnNameInMyProducts(String rowindex, String columnName) throws Exception {
        String text = DataManager.getDataFromHashDatamap(rowindex, columnName);

        WaitHelpers.waitForSeconds(3);
        String xPath = "//android.widget.TextView[@resource-id='nlb-value-product-account-id' and @text = '" + text + "']";
        By el = By.xpath(xPath);

        for(int i = 0; i<20; i++){
            if(hp.isElementNotPresent(el)){
                hp.scrollDown(driver);
            }
        }
        hp.clickElement(el);
    }

    @And("Wait for first transaction to load")
    public void waitForFirstTransactionToLoad() {
        String xPath1 = "(//android.widget.TextView[@resource-id='nlb-transaction-header-sum'])[1]";
        By el1 = x.createByXpath(xPath1);
        WaitHelpers.waitForElement(el1);

        String xPath = "(//*[@resource-id='nlb-card-container'])[1]";
        By el = x.createByXpath(xPath);
        WaitHelpers.waitForElement(el);

    }

    @And("Assert Product page for product with name from Excel {string} columnName {string}")
    public void assertProductPageForProductWithNameFromExcelColumnName(String rowindex, String columnName) {
        String productName = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPath = "//android.widget.TextView[@text='" + productName + "']";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert element with class {string} and has text {string} is displayed")
    public void assertElementWithClassAndHasTextIsDisplayed(String className, String text) {
        String xPath = "//" + className + "[@text='" + text + "']";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert Transaction filter button in Product")
    public void assertTransactionFilterButtonInProduct() {
        String xPath = "//android.widget.TextView[@text='Transactions']/following-sibling::android.view.View[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert transaction list is not sorted and has both Incoming and Outgoing transactions")
    public void assertTransactionListIsNotSortedAndHasBothIncomingAndOutgoingTransactions() throws Exception {
        int incoming = 0;
        int outgoing = 0;
        while(incoming<=0 && outgoing<=0){
            List<String> list = rh.scrollDownAndPutEveryElementWithIdIntoList("nlb-amount");

            for(String item : list){
                if(item.matches("^−(?:(?:0|[1-9]\\d{0,2})(?:\\.\\d{3})*),\\d{2}$")){
                    outgoing++;
                }
                else if(item.matches("^(?:(?:0|[1-9]\\d{0,2})(?:\\.\\d{3})*),\\d{2}$")){
                    incoming++;
                }
                else Assert.fail("Incorrect amount format");
            }
        }
    }

    @And("Click Transaction filter button in Product")
    public void clickTransactionFilterButtonInProduct() throws Exception {
        String xPath = "//android.widget.TextView[@text='Transactions']/following-sibling::android.view.View[1]";
        By el = x.createByXpath(xPath);
        hp.clickElement(el);
    }

    @And("Wait first Transaction filter")
    public void waitFirstTransactionFilter() {
        String xPath = "(//*[@resource-id='nlb-settings-menu'])[1]";
        By el = x.createByXpath(xPath);
        WaitHelpers.waitForElement(el);
    }

    @And("Assert screen header is {string}")
    public void assertScreenHeaderIs(String header) {
        String xPath = "//android.widget.TextView[@text='" + header + "']";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert back button in screen {string}")
    public void assertBackButtonInScreen(String screenName) {
        String xPath = "//android.widget.TextView[@text='" + screenName + "']/preceding-sibling::android.view.View/android.view.View[@content-desc='Back']/following-sibling::android.widget.Button";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert Date transaction filter is displayed correctly")
    public void assertDateTransactionFilterIsDisplayedCorrectly() {
        //filter name
        String xPath1 = "//android.view.View[@resource-id='nlb-settings-menu'][1]/android.widget.TextView[1]";
        MobileElement element1 = x.createMobileElementByXpath(xPath1);
        Assert.assertTrue(element1.isDisplayed());
        Assert.assertEquals("Date", element1.getAttribute("text"));
        //filter subtitle
        String xPath2 = "//android.view.View[@resource-id='nlb-settings-menu'][1]/android.widget.TextView[2]";
        MobileElement element2 = x.createMobileElementByXpath(xPath2);
        Assert.assertTrue(element2.isDisplayed());
        Assert.assertEquals("Select time frame", element2.getAttribute("text"));
        //arrow icon
        //String xPath3 = "(//android.view.View[@content-desc='Navigate forward'])[1]";
        //MobileElement element3 = x.createMobileElementByXpath(xPath3);
        //Assert.assertTrue(element3.isDisplayed());
    }

    @And("Assert Categories transaction filter is displayed correctly")
    public void assertCategoriesTransactionFilterIsDisplayedCorrectly() {
        //filter name
        String xPath1 = "//android.view.View[@resource-id='nlb-settings-menu'][3]/android.widget.TextView[1]";
        MobileElement element1 = x.createMobileElementByXpath(xPath1);
        Assert.assertTrue(element1.isDisplayed());
        Assert.assertEquals("Categories", element1.getAttribute("text"));
        //filter subtitle
        String xPath2 = "//android.view.View[@resource-id='nlb-settings-menu'][3]/android.widget.TextView[2]";
        MobileElement element2 = x.createMobileElementByXpath(xPath2);
        Assert.assertTrue(element2.isDisplayed());
        Assert.assertEquals("Select category", element2.getAttribute("text"));
        //arrow icon
        //String xPath3 = "(//android.view.View[@content-desc='Navigate forward'])[2]";
        //MobileElement element3 = x.createMobileElementByXpath(xPath3);
        //Assert.assertTrue(element3.isDisplayed());
    }

    @And("Assert Type transaction filter is displayed correctly")
    public void assertTypeTransactionFilterIsDisplayedCorrectly() {
        //filter name
        String xPath1 = "//android.view.View[@resource-id='nlb-settings-menu'][2]/android.widget.TextView[1]";
        MobileElement element1 = x.createMobileElementByXpath(xPath1);
        Assert.assertTrue(element1.isDisplayed());
        Assert.assertEquals("Type", element1.getAttribute("text"));
        //filter subtitle
        String xPath2 = "//android.view.View[@resource-id='nlb-settings-menu'][2]/android.widget.TextView[2]";
        MobileElement element2 = x.createMobileElementByXpath(xPath2);
        Assert.assertTrue(element2.isDisplayed());
        Assert.assertEquals("All", element2.getAttribute("text"));
        //arrow icon
        //String xPath3 = "(//android.view.View[@content-desc='Navigate forward'])[3]";
        //MobileElement element3 = x.createMobileElementByXpath(xPath3);
        //Assert.assertTrue(element3.isDisplayed());
    }

    @And("Assert Amount transaction filter is displayed correctly")
    public void assertAmountTransactionFilterIsDisplayedCorrectly() {
        //filter name
        String xPath1 = "//android.view.View[@resource-id='nlb-settings-menu'][4]/android.widget.TextView[1]";
        MobileElement element1 = x.createMobileElementByXpath(xPath1);
        Assert.assertTrue(element1.isDisplayed());
        Assert.assertEquals("Amount", element1.getAttribute("text"));
        //filter subtitle
        String xPath2 = "//android.view.View[@resource-id='nlb-settings-menu'][4]/android.widget.TextView[2]";
        MobileElement element2 = x.createMobileElementByXpath(xPath2);
        Assert.assertTrue(element2.isDisplayed());
        Assert.assertEquals("Set amount", element2.getAttribute("text"));
        //arrow icon
        //String xPath3 = "(//android.view.View[@content-desc='Navigate forward'])[4]";
        //MobileElement element3 = x.createMobileElementByXpath(xPath3);
        //Assert.assertTrue(element3.isDisplayed());
    }

    @And("Assert Tags transaction filter is displayed correctly")
    public void assertTagsTransactionFilterIsDisplayedCorrectly() {
        //filter name
        String xPath1 = "//android.view.View[@resource-id='nlb-settings-menu'][5]/android.widget.TextView[1]";
        MobileElement element1 = x.createMobileElementByXpath(xPath1);
        Assert.assertTrue(element1.isDisplayed());
        Assert.assertEquals("Tags", element1.getAttribute("text"));
        //filter subtitle
        String xPath2 = "//android.view.View[@resource-id='nlb-settings-menu'][5]/android.widget.TextView[2]";
        MobileElement element2 = x.createMobileElementByXpath(xPath2);
        Assert.assertTrue(element2.isDisplayed());
        Assert.assertEquals("Select tag", element2.getAttribute("text"));
        //arrow icon
        //String xPath3 = "(//android.view.View[@content-desc='Navigate forward'])[5]";
        //MobileElement element3 = x.createMobileElementByXpath(xPath3);
        //Assert.assertTrue(element3.isDisplayed());
    }

    @And("Assert {string} button is not enabled")
    public void assertButtonIsNotEnabled(String buttonName) {
        String xPath = "//android.widget.TextView[@text='" + buttonName + "']/ancestor::android.view.View[@resource-id='nlb-button-primary']";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
        Assert.assertFalse(element.isEnabled());
    }

    @And("Assert Type transaction filter options are correct")
    public void assertTypeTransactionFilterOptionsAreCorrect() {
        //All transactions option
        String xPath1 = "//*[@resource-id='nlb-radio-button-ALL']/android.widget.TextView[@text='All']";
        MobileElement element1 = x.createMobileElementByXpath(xPath1);
        Assert.assertTrue(element1.isDisplayed());
        //Incoming transactions option
        String xPath2 = "//*[@resource-id='nlb-radio-button-INCOMING']/android.widget.TextView[@text='Incoming transactions']";
        MobileElement element2 = x.createMobileElementByXpath(xPath2);
        Assert.assertTrue(element2.isDisplayed());
        //Incoming transactions option
        String xPath3 = "//*[@resource-id='nlb-radio-button-OUTGOING']/android.widget.TextView[@text='Outgoing transactions']";
        MobileElement element3 = x.createMobileElementByXpath(xPath3);
        Assert.assertTrue(element3.isDisplayed());
    }

    @And("Assert Type transaction filter that is currently selected is one with id {string}")
    public void assertTypeTransactionFilterThatIsCurrentlySelectedIsOneWithId(String id) {
        MobileElement element = d.createMobileElementByResourceId(id);
        Assert.assertEquals("true", element.getAttribute("checked"));
    }

    @And("Assert subtitle of Transaction filter {string} is {string}")
    public void assertSubtitleOfTransactionFilterIs(String filterName, String subtitleValue) {
        String xPath = "//android.widget.TextView[@text='" + filterName + "']/following-sibling::android.widget.TextView[@text='" + subtitleValue + "']";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert {string} button primary is enabled")
    public void assertButtonPrimaryIsEnabled(String buttonName) {
        String xPath = "//android.widget.TextView[@text='" + buttonName + "']/ancestor::android.view.View[@resource-id='nlb-button-primary']";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
        Assert.assertTrue(element.isEnabled());
    }

    @And("Assert {string} button alternate is enabled")
    public void assertButtonAlternateIsEnabled(String buttonName) {
        String xPath = "//android.widget.TextView[@text='" + buttonName + "']/ancestor::android.view.View[@resource-id='nlb-button-alternate']";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
        Assert.assertTrue(element.isEnabled());
    }

    @And("Assert transaction list is sorted to only show Incoming transactions")
    public void assertTransactionListIsSortedToOnlyShowIncomingTransactions() throws Exception {
        List<String> list = rh.scrollDownAndPutEveryElementWithIdIntoList("nlb-amount");
        for(String item : list){
            Assert.assertTrue(item.matches("^(?:(?:0|[1-9]\\d{0,2})(?:\\.\\d{3})*),\\d{2}$"));
        }
    }

    @And("Scroll element up into view by xPath {string}")
    public void scrollElementUpIntoViewByXPath(String xPath) throws Exception {
        WaitHelpers.waitForSeconds(3);
        By el = By.xpath(xPath);

        for(int i = 0; i<10; i++){
            if(hp.isElementNotPresent(el)){
                hp.scrollUp(driver);
            }
        }
    }

    @And("Assert transaction list is sorted to only show Outgoing transactions")
    public void assertTransactionListIsSortedToOnlyShowOutgoingTransactions() throws Exception {
        List<String> list = rh.scrollDownAndPutEveryElementWithIdIntoList("nlb-amount");
        for(String item : list){
            Assert.assertTrue(item.matches("^−(?:(?:0|[1-9]\\d{0,2})(?:\\.\\d{3})*),\\d{2}$"));
        }
    }

    @And("Assert From label in Date transactions filter")
    public void assertFromLabelInDateTransactionsFilter() {
        String xPath = "//android.view.View[@resource-id=\"nlb-card-container\"]/android.view.View[5]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
//        Assert.assertEquals("From", element.getAttribute("text"));
    }

    @And("Assert To label in Date transactions filter")
    public void assertToLabelInDateTransactionsFilter() {
        String xPath = "//android.view.View[@resource-id=\"nlb-card-container\"]/android.view.View[6]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
//        Assert.assertEquals("To", element.getAttribute("text"));
    }

    @And("Assert From field is correctly displayed in Date transactions filter")
    public void assertFromFieldIsCorrectlyDisplayedInDateTransactionsFilter() {
        //input field
        MobileElement element1 = d.createMobileElementByResourceId("nlb-input-date-from");
        Assert.assertTrue(element1.isDisplayed());
        //calendar icon
        String xPath = "//*[@resource-id='nlb-input-date-from']/following-sibling::android.view.View[@content-desc='Select date']";
        MobileElement element2 = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element2.isDisplayed());
    }

    @And("Assert To field is correctly displayed in Date transactions filter")
    public void assertToFieldIsCorrectlyDisplayedInDateTransactionsFilter() {
        //input field
        MobileElement element1 = d.createMobileElementByResourceId("nlb-input-date-to");
        Assert.assertTrue(element1.isDisplayed());
        //calendar icon
        String xPath = "//*[@resource-id='nlb-input-date-to']/following-sibling::android.view.View[@content-desc='Select date']";
        MobileElement element2 = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element2.isDisplayed());
    }

    @And("Assert subtitle of Transaction filter Date is correct for Last seven days")
    public void assertSubtitleOfTransactionFilterDateIsCorrectForLastSevenDays() {
        String pastDate = rh.getDateXDaysInPastFromTodayInFormat(7, "d.M.yyyy").replace(".", ".\u00A0");
        String todayDate = rh.getTodayDateInFormat("d.M.yyyy").replace(".", ".\u00A0");
        String expected = pastDate + " - " + todayDate;
        String xPath = "//android.widget.TextView[@text='Date']/following-sibling::android.widget.TextView";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
        Assert.assertEquals(expected, element.getAttribute("text"));
    }

    @And("Assert transactions dates are from last seven days")
    public void assertTransactionsDatesAreFromLastSevenDays() throws Exception {
        List<String> list = rh.getAllElementsUntilTextFound("nlb-date", "You have reached the end of the list.");
        Assert.assertFalse(list.isEmpty());
        List<String> last7Days = rh.getLast7DaysDatesInFormat("d.M.yyyy");

        for(String item : list){
            item = item.replace(".\u00A0", ".");
            Assert.assertTrue(last7Days.contains(item));
        }
    }

    @And("Assert subtitle of Transaction filter Date is correct for This month")
    public void assertSubtitleOfTransactionFilterDateIsCorrectForThisMonth() {
        List<String> dates = rh.getDatesThisMonthUntilToday("d.M.yyyy");
        String start = dates.get(0).replace(".", ".\u00A0");
        String end = dates.get(dates.size()-1).replace(".", ".\u00A0");
        String expected = start + " - " + end;
        String xPath = "//android.widget.TextView[@text='Date']/following-sibling::android.widget.TextView";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
        Assert.assertEquals(expected, element.getAttribute("text"));
    }

    @And("Assert transactions dates are from This month")
    public void assertTransactionsDatesAreFromThisMonth() throws Exception {
        List<String> list = rh.getAllElementsUntilTextFound("nlb-date", "You have reached the end of the list.");
        Assert.assertFalse(list.isEmpty());
        List<String> last7Days = rh.getDatesThisMonthUntilToday("d.M.yyyy");

        for(String item : list){
            item = item.replace(".\u00A0", ".");
            Assert.assertTrue(last7Days.contains(item));
        }
    }

    @And("Assert subtitle of Transaction filter date is correct for Last month")
    public void assertSubtitleOfTransactionFilterDateIsCorrectForLastMonth() {
        List<String> dates = rh.getDatesLastMonth("d.M.yyyy");
        String start = dates.get(0).replace(".", ".\u00A0");
        String end = dates.get(dates.size()-1).replace(".", ".\u00A0");
        String expected = start + " - " + end;
        String xPath = "//android.widget.TextView[@text='Date']/following-sibling::android.widget.TextView";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
        Assert.assertEquals(expected, element.getAttribute("text"));
    }

    @And("Assert transactions dates are from Last month")
    public void assertTransactionsDatesAreFromLastMonth() throws Exception {
        List<String> list = rh.getAllElementsUntilTextFound("nlb-date", "You have reached the end of the list.");
        Assert.assertFalse(list.isEmpty());
        List<String> last7Days = rh.getDatesLastMonth("d.M.yyyy");

        for(String item : list){
            item = item.replace(".\u00A0", ".");
            Assert.assertTrue(last7Days.contains(item));
        }
    }

    @And("Assert From field in Date transactions filter has value {string}")
    public void assertFromFieldInDateTransactionsFilterHasValue(String expected) {
        MobileElement element = d.createMobileElementByResourceId("nlb-input-date-from");
        expected = expected.replace("." , ".\u00A0");
        Assert.assertEquals(expected, element.getAttribute("text"));
    }

    @And("Assert From field in Date transactions filter has today date")
    public void assertFromFieldInDateTransactionsFilterHasTodayDate() {
        String expected = rh.getTodayDateInFormat("d.M.yyyy").replace("." , ".\u00A0");
        MobileElement element = d.createMobileElementByResourceId("nlb-input-date-from");
        Assert.assertEquals(expected, element.getAttribute("text"));


    }

    @And("Assert To field in Date transactions filter has today date")
    public void assertToFieldInDateTransactionsFilterHasTodayDate() {
        String expected = rh.getTodayDateInFormat("d.M.yyyy").replace("." , ".\u00A0");
        MobileElement element = d.createMobileElementByResourceId("nlb-input-date-to");
        Assert.assertEquals(expected, element.getAttribute("text"));
    }

    @And("Click on today date in Calendar and assert that it is shown correctly")
    public void clickOnTodayDateInCalendarAndAssertThatItIsShownCorrectly() throws Exception {
        //click on date
        String date = rh.getTodayDateInFormat("EEEE, MMMM d, yyyy");
        String xPath = "//*[contains(@text, '" + date + "')]";
        By element = x.createByXpath(xPath);
        hp.clickElement(element);
        //assertion that title of caledar is correct for selected date
        String date1 = rh.getTodayDateInFormat("MMM d, yyyy");
        String xPath1 = "//*[contains(@content-desc, 'Current selection:')]";
        MobileElement element1 = x.createMobileElementByXpath(xPath1);
        Assert.assertTrue(element1.getAttribute("content-desc").contains(date));
        Assert.assertEquals(date1, element1.getAttribute("text"));

    }

    @And("Assert button Cancel in Calendar is enabled")
    public void assertButtonCancelInCalendarIsEnabled() {
        String xPath = "//android.widget.TextView[@text='Cancel']/following-sibling::android.widget.Button";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
        Assert.assertTrue(element.isEnabled());
    }

    @And("Assert button Confirm in Calendar is enabled")
    public void assertButtonConfirmInCalendarIsEnabled() {
        String xPath = "//android.widget.TextView[@text='Confirm']/following-sibling::android.widget.Button";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
        Assert.assertTrue(element.isEnabled());
    }

    @And("Click on button Confirm in Calendar")
    public void clickOnButtonConfirmInCalendar() throws Exception {
        String xPath = "//android.widget.TextView[@text='Confirm']/following-sibling::android.widget.Button";
        By element = x.createByXpath(xPath);
        hp.clickElement(element);
    }

    @And("Click on yesterday date in Calendar and assert that it is shown correctly")
    public void clickOnYesterdayDateInCalendarAndAssertThatItIsShownCorrectly() throws Exception {
        //click on date
        String date = rh.getDateXDaysInPastFromTodayInFormat(1, "EEEE, MMMM d, yyyy");
        String xPath = "//*[contains(@text, '" + date + "')]";
        By element = x.createByXpath(xPath);
        hp.clickElement(element);
        //assertion that title of caledar is correct for selected date
        String date1 = rh.getDateXDaysInPastFromTodayInFormat(1, "MMM d, yyyy");
        String xPath1 = "//*[contains(@content-desc, 'Current selection:')]";
        MobileElement element1 = x.createMobileElementByXpath(xPath1);
        Assert.assertTrue(element1.getAttribute("content-desc").contains(date));
        Assert.assertEquals(date1, element1.getAttribute("text"));
    }

    @And("Assert To field in Date transactions filter has yesterday date")
    public void assertToFieldInDateTransactionsFilterHasYesterdayDate() {
        String expected = rh.getDateXDaysInPastFromTodayInFormat(1,"d.M.yyyy").replace("." , ".\u00A0");
        MobileElement element = d.createMobileElementByResourceId("nlb-input-date-to");
        Assert.assertEquals(expected, element.getAttribute("text"));
    }

    @And("Click on day before yesterday date in Calendar and assert that it is shown correctly")
    public void clickOnDayBeforeYesterdayDateInCalendarAndAssertThatItIsShownCorrectly() throws Exception {
        //click on date
        String date = rh.getDateXDaysInPastFromTodayInFormat(2, "EEEE, MMMM d, yyyy");
        String xPath = "//*[contains(@text, '" + date + "')]";
        By element = x.createByXpath(xPath);
        hp.clickElement(element);
        //assertion that title of caledar is correct for selected date
        String date1 = rh.getDateXDaysInPastFromTodayInFormat(2, "MMM d, yyyy");
        String xPath1 = "//*[contains(@content-desc, 'Current selection:')]";
        MobileElement element1 = x.createMobileElementByXpath(xPath1);
        Assert.assertTrue(element1.getAttribute("content-desc").contains(date));
        Assert.assertEquals(date1, element1.getAttribute("text"));
    }

    @And("Assert From field in Date transactions filter has day before yesterday date")
    public void assertFromFieldInDateTransactionsFilterHasDayBeforeYesterdayDate() {
        String expected = rh.getDateXDaysInPastFromTodayInFormat(2,"d.M.yyyy").replace("." , ".\u00A0");
        MobileElement element = d.createMobileElementByResourceId("nlb-input-date-from");
        Assert.assertEquals(expected, element.getAttribute("text"));
    }

    @And("Assert subtitle of Transaction filter Date is correct for day before yesterday to yesterday")
    public void assertSubtitleOfTransactionFilterDateIsCorrectForDayBeforeYesterdayToYesterday() {
        String from = rh.getDateXDaysInPastFromTodayInFormat(2, "d.M.yyyy").replace(".", ".\u00A0");
        String to = rh.getDateXDaysInPastFromTodayInFormat(1, "d.M.yyyy").replace(".", ".\u00A0");
        String expected = from + " - " + to;
        String xPath = "//android.widget.TextView[@text='Date']/following-sibling::android.widget.TextView";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
        Assert.assertEquals(expected, element.getAttribute("text"));




    }

    @And("Assert transactions dates are from day before yesterday to yesterday")
    public void assertTransactionsDatesAreFromDayBeforeYesterdayToYesterday() throws Exception {
        List<String> list = rh.scrollDownAndPutEveryElementWithIdIntoList("nlb-date");
        List<String> pastDays = new ArrayList<>();
        pastDays.add(rh.getDateXDaysInPastFromTodayInFormat(1, "d.M.yyyy"));
        pastDays.add(rh.getDateXDaysInPastFromTodayInFormat(2, "d.M.yyyy"));


        for(String item : list){
            item = item.replace(".\u00A0", ".");
            Assert.assertTrue(pastDays.contains(item));
        }
    }

    @And("Click on date in Calendar with year {int} month {int} day {int} and assert that it is shown correctly")
    public void clickOnDateInCalendarWithYearMonthDayAndAssertThatItIsShownCorrectly(int year, int month, int day) throws Exception {
        //get back to past dates in calendar if needed
        int amountOfMonths = rh.getHowManyMonthsAreBetweenTodayAndSelectedDate(year, month, day);
        if(amountOfMonths>0){
            for(int i=0; i<amountOfMonths; i++){
                By el = x.createByXpath("//*[@content-desc='Change to previous month']/following-sibling::android.widget.Button");
                hp.clickElement(el);
            }
        }
        else if (amountOfMonths<0){
            for(int i=0; i<Math.abs(amountOfMonths); i++){
                By el = x.createByXpath("//*[@content-desc='Change to next month']/following-sibling::android.widget.Button");
                hp.clickElement(el);
            }
        }

        //click on date
        String date = rh.getDateInFormat(year, month, day, "EEEE, MMMM d, yyyy");
        String xPath = "//*[contains(@text, '" + date + "')]";
        By element = x.createByXpath(xPath);
        hp.clickElement(element);
        //assertion that title of caledar is correct for selected date
        String date1 = rh.getDateInFormat(year, month, day, "MMM d, yyyy");
        String xPath1 = "//*[contains(@content-desc, 'Current selection:')]";
        MobileElement element1 = x.createMobileElementByXpath(xPath1);
        Assert.assertTrue(element1.getAttribute("content-desc").contains(date));
        Assert.assertEquals(date1, element1.getAttribute("text"));
    }

    @And("Assert From field in Date transactions filter has date year {int} month {int} day {int}")
    public void assertFromFieldInDateTransactionsFilterHasDateYearMonthDay(int year, int month, int day) {
        String expected = rh.getDateInFormat(year, month, day, "d.M.yyyy").replace("." , ".\u00A0");
        MobileElement element = d.createMobileElementByResourceId("nlb-input-date-from");
        Assert.assertEquals(expected, element.getAttribute("text"));
    }

    @And("Assert To field in Date transactions filter has date year {int} month {int} day {int}")
    public void assertToFieldInDateTransactionsFilterHasDateYearMonthDay(int year, int month, int day) {
        String expected = rh.getDateInFormat(year, month, day, "d.M.yyyy").replace("." , ".\u00A0");
        MobileElement element = d.createMobileElementByResourceId("nlb-input-date-to");
        Assert.assertEquals(expected, element.getAttribute("text"));
    }

    @And("Assert subtitle of Transaction filter Date is correct for dates year {int} month {int} day {int} and year {int} month {int} day {int}")
    public void assertSubtitleOfTransactionFilterDateIsCorrectForDatesYearMonthDayAndYearMonthDay(int year1, int month1, int day1, int year2, int month2, int day2) {
        String from = rh.getDateInFormat(year1, month1, day1, "d.M.yyyy").replace("." , ".\u00A0");
        String to = rh.getDateInFormat(year2, month2, day2, "d.M.yyyy").replace("." , ".\u00A0");
        String expected = from + " - " + to;
        String xPath = "//android.widget.TextView[@text='Date']/following-sibling::android.widget.TextView";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
        Assert.assertEquals(expected, element.getAttribute("text"));
    }

    @Then("Assert transactions dates are between dates year {int} month {int} day {int} and year {int} month {int} day {int}")
    public void assertTransactionsDatesAreBetweenDatesYearMonthDayAndYearMonthDay(int year1, int month1, int day1, int year2, int month2, int day2) throws Exception {
        List<String> list = rh.getAllElementsUntilTextFound("nlb-date", "You have reached the end of the list.");
        Assert.assertFalse(list.isEmpty());
        List<String> pastDays = rh.getDatesBetween(year1, month1, day1, year2, month2, day2, "d.M.yyyy");

        for(String item : list){
            item = item.replace(".\u00A0", ".");
            Assert.assertTrue(pastDays.contains(item));
        }
    }

    @And("Click on date last month fifth and assert that it is shown correctly")
    public void clickOnDateLastMonthFifthAndAssertThatItIsShownCorrectly() throws Exception {
        //go to last month
        By el = x.createByXpath("//*[@content-desc='Change to previous month']/following-sibling::android.widget.Button");
        hp.clickElement(el);
        //click on date
        String date = rh.getDateLastMonthDayX(5, "EEEE, MMMM d, yyyy");
        String xPath = "//*[contains(@text, '" + date + "')]";
        By element = x.createByXpath(xPath);
        hp.clickElement(element);
        //assertion that title of caledar is correct for selected date
        String date1 = rh.getDateLastMonthDayX(5, "MMM d, yyyy");
        String xPath1 = "//*[contains(@content-desc, 'Current selection:')]";
        MobileElement element1 = x.createMobileElementByXpath(xPath1);
        Assert.assertTrue(element1.getAttribute("content-desc").contains(date));
        Assert.assertEquals(date1, element1.getAttribute("text"));
    }

    @And("Assert To field in Date transactions filter has date last month fifth")
    public void assertToFieldInDateTransactionsFilterHasDateLastMonthFifth() {
        String expected = rh.getDateLastMonthDayX(5,"d.M.yyyy").replace("." , ".\u00A0");
        MobileElement element = d.createMobileElementByResourceId("nlb-input-date-to");
        Assert.assertEquals(expected, element.getAttribute("text"));
    }

    @And("Assert {string} button primary is disabled")
    public void assertButtonPrimaryIsDisabled(String buttonName) {
        String xPath = "//android.widget.TextView[@text='" + buttonName + "']/ancestor::android.view.View[@resource-id='nlb-button-primary']";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
        Assert.assertFalse(element.isEnabled());
    }

    @And("Click on date last month tenth and assert that it is not shown correctly")
    public void clickOnDateLastMonthTenthAndAssertThatItIsNotShownCorrectly() throws Exception {
        //go to last month
        By el = x.createByXpath("//*[@content-desc='Change to previous month']/following-sibling::android.widget.Button");
        hp.clickElement(el);
        //click on date
        String date = rh.getDateLastMonthDayX(10, "EEEE, MMMM d, yyyy");
        String xPath = "//*[contains(@text, '" + date + "')]";
        By element = x.createByXpath(xPath);
        Assert.assertFalse(driver.findElement(element).isEnabled());

        String xPath2 = "//*[contains(@text, '" + date + "')]//android.widget.Button";
        By element2 = x.createByXpath(xPath2);
        hp.clickElement(element2);

        //assertion that title of caledar is today date
        String date1 = rh.getTodayDateInFormat("MMM d, yyyy");
        String date2 = rh.getTodayDateInFormat("EEEE, MMMM d, yyyy");
        String xPath1 = "//*[contains(@content-desc, 'Current selection:')]";
        MobileElement element1 = x.createMobileElementByXpath(xPath1);
        Assert.assertTrue(element1.getAttribute("content-desc").contains(date2));
        Assert.assertEquals(date1, element1.getAttribute("text"));
    }

    @And("Assert Tag filter list search field")
    public void assertTagFilterListSearchField() {
        String xPath = "//android.widget.TextView[@text='Create tag']/ancestor::android.widget.EditText";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
        Assert.assertTrue(element.isEnabled());
    }

    @And("Assert List of Tag filters")
    public void assertListOfTagFilters() {
        String xPath = "//android.view.View[@resource-id='nlb-checkbox']";
        List<MobileElement> elements = x.createElementsByXpath(xPath);
        for(MobileElement element : elements){
            Assert.assertTrue(element.isDisplayed());
            Assert.assertTrue(element.isEnabled());
        }
    }

    @And("Enter text from Excel {string} columnName {string} to Tag filter search field and assert search result is correct")
    public void enterTextFromExcelColumnNameToTagFilterSearchFieldAndAssertSearchResultIsCorrect(String rowindex, String columnName) throws InterruptedException {
        String tagName = DataManager.getDataFromHashDatamap(rowindex, columnName);
        //entering text to tag search bar
        String xPath1 = "//*[@resource-id='nlb-card-container']/android.widget.EditText";
        By element1 = x.createByXpath(xPath1);
        hp.enterTextToElement(tagName, element1);
        //assert correct results are shown
        String xPath2 = "//android.view.View[@resource-id='nlb-checkbox']/android.widget.TextView";
        List<MobileElement> elements2 = x.createElementsByXpath(xPath2);
        for(MobileElement element : elements2){
            Assert.assertTrue(element.getText().contains(tagName));
            Assert.assertTrue(element.getText().startsWith("#"));
        }
    }

    @And("Assert none of the tag filters are currently selected")
    public void assertNoneOfTheTagFiltersAreCurrentlySelected() {
        String xPath = "//android.view.View[@resource-id='nlb-checkbox']";
        List<MobileElement> elements = x.createElementsByXpath(xPath);
        for(MobileElement element : elements){
            Assert.assertEquals("false", element.getAttribute("checked"));
        }
    }

    @And("Click on Tag filter from Excel {string} columnName {string} and assert that it is selected")
    public void clickOnTagFilterFromExcelColumnNameAndAssertThatItIsSelected(String rowindex, String columnName) throws Exception {
        String tagName = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPath = "//android.widget.TextView[@text='#" + tagName + "']/ancestor::android.view.View[@resource-id='nlb-checkbox']";
        By element = x.createByXpath(xPath);
        hp.clickElement(element);
        MobileElement element1 = x.createMobileElementByXpath(xPath);
        Assert.assertEquals("true", element1.getAttribute("checked"));
    }

    @And("Assert subtitle of Transaction filter Tag is from Excel {string} columnName {string}")
    public void assertSubtitleOfTransactionFilterTagIsFromExcelColumnName(String rowindex, String columnName) {
        String tagName = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPath = "//android.widget.TextView[@text='Tags']/following-sibling::android.widget.TextView[@text='" + tagName + "']";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert first few transactions have tag from Excel {string} columnName {string}")
    public void assertFirstFewTransactionsHaveTagFromExcelColumnName(String rowindex, String columnName) throws Throwable {
        String tagName = DataManager.getDataFromHashDatamap(rowindex, columnName);
        hp.swipeVertical(50, 80, 50);

        for(int i=1; i<=3; i++){
            //click on transaction to show details
            String xPath1 = "(//*[@resource-id='nlb-card-container'])[" + i + "]";
            By el1 = x.createByXpath(xPath1);
            hp.clickElement(el1);
            //swipe to add tags button
            String xPath2 = "//android.widget.TextView[@text='Add tag']";
            rh.scrollElementByXpath(xPath2);
            //Assert expected tag is present
            String xPath3 = "//android.widget.TextView[@text='Tags']/following-sibling::android.widget.TextView[@text='#" + tagName + "']";
            MobileElement element3 = x.createMobileElementByXpath(xPath3);
            Assert.assertTrue(element3.isDisplayed());
            //go back to transaction list
            String xPath4 = "//android.view.View[@content-desc='Back']/following-sibling::android.widget.Button";
            By el4 = x.createByXpath(xPath4);
            hp.clickElement(el4);
            //wait for transactions to load
            String xPath5 = "(//*[@resource-id='nlb-card-container'])[1]";
            By el5 = x.createByXpath(xPath5);
            WaitHelpers.waitForElement(el5);
        }
    }

    @And("Assert subtitle of Transaction filter Tag is from Excel {string} columnName {string} and columnName {string}")
    public void assertSubtitleOfTransactionFilterTagIsFromExcelColumnNameAndColumnName(String rowindex, String columnName1, String columnName2) {
        String tagName1 = DataManager.getDataFromHashDatamap(rowindex, columnName1);
        String tagName2 = DataManager.getDataFromHashDatamap(rowindex, columnName2);
        String xPath = "//android.widget.TextView[@text='Tags']/following-sibling::android.widget.TextView[@text='" + tagName1 + ", " + tagName2 + "']";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert first few transactions have tags from Excel {string} columnName {string} or columnName {string}")
    public void assertFirstFewTransactionsHaveTagsFromExcelColumnNameOrColumnName(String rowindex, String columnName1, String columnName2) throws Throwable {
        String tagName1 = DataManager.getDataFromHashDatamap(rowindex, columnName1);
        String tagName2 = DataManager.getDataFromHashDatamap(rowindex, columnName2);
        boolean tag1Present = false;
        boolean tag2Present = false;
        hp.swipeVertical(50, 80, 50);
        for(int i=1; i<=3; i++){
            //click on transaction to show details
            String xPath1 = "(//*[@resource-id='nlb-card-container'])[" + i + "]";
            By el1 = x.createByXpath(xPath1);
            hp.clickElement(el1);
            //swipe to add tags button
            String xPath2 = "//android.widget.TextView[@text='Add tag']";
            rh.scrollElementByXpath(xPath2);
            //Assert expected tags are present
            String xPath3 = "//android.widget.TextView[@text='Tags']/following-sibling::android.widget.TextView";
            MobileElement element3 = x.createMobileElementByXpath(xPath3);
            Assert.assertTrue(element3.isDisplayed());
            if(element3.getText().equals("#" + tagName1) && element3.getText().equals("#" + tagName2)){
                tag1Present = true;
                tag2Present = true;
            } else if (element3.getText().equals("#" + tagName1)) {
                tag1Present = true;
            } else if (element3.getText().equals("#" + tagName2)) {
                tag2Present = true;
            }
            else Assert.fail("there is no expected tag found!!!");
            //go back to transaction list
            String xPath4 = "//android.view.View[@content-desc='Back']/following-sibling::android.widget.Button";
            By el4 = x.createByXpath(xPath4);
            hp.clickElement(el4);
            //wait for transactions to load
            String xPath5 = "(//*[@resource-id='nlb-card-container'])[1]";
            By el5 = x.createByXpath(xPath5);
            WaitHelpers.waitForElement(el5);
        }
        Assert.assertTrue(tag1Present && tag2Present);
    }

    @And("Assert currency card with currency {string} in product")
    public void assertCurrencyCardWithCurrencyInProduct(String currency) {
        //Current balance
        String xPath1 = "//android.view.View[@resource-id='nlb-header-card']/android.widget.TextView[@text='Current balance']/following-sibling::android.widget.TextView[@resource-id='nlb-product-details-primary-balance' and contains(@text, '" + currency + "')]";
        MobileElement element1 = x.createMobileElementByXpath(xPath1);
        Assert.assertTrue(element1.isDisplayed());
        Assert.assertTrue(element1.getText().replaceAll(" [A-Z]{3}", "").matches("^−?(?:(?:0|[1-9]\\d{0,2})(?:\\.\\d{3})*),\\d{2}$"));

    }

    @And("Assert currency card with currency {string} in product has correct {string} and {string}")
    public void assertCurrencyCardWithCurrencyInProductHasCorrectAnd(String currency, String value1, String value2) {
        //Current balance (value1)
        String xPath1 = "//android.view.View[@resource-id='nlb-header-card']/android.widget.TextView[@text='" + value1 + "']/following-sibling::android.widget.TextView[@resource-id='nlb-product-details-primary-balance' and contains(@text, '" + currency + "')]";
        MobileElement element1 = x.createMobileElementByXpath(xPath1);
        Assert.assertTrue(element1.isDisplayed());
        Assert.assertTrue(element1.getText().replaceAll("\\u00A0[A-Z]{3}", "").matches("^−?(?:(?:0|[1-9]\\d{0,2})(?:\\.\\d{3})*),\\d{2}$"));
        //value2
        String xPath2 = "//android.widget.TextView[@resource-id='nlb-product-details-primary-balance' and contains(@text, '" + currency + "')]/following-sibling::android.widget.TextView[@text='" + value2 + "']/following-sibling::android.widget.TextView[@resource-id='nlb-product-details-secondary-balance' and contains(@text, 'EUR')]";
        MobileElement element2 = x.createMobileElementByXpath(xPath2);
        Assert.assertTrue(element2.isDisplayed());
        Assert.assertTrue(element2.getText().replaceAll("\\u00A0[A-Z]{3}", "").matches("^−?(?:(?:0|[1-9]\\d{0,2})(?:\\.\\d{3})*),\\d{2}$"));
    }

    @And("Assert transactions in Product details are in currency {string}")
    public void assertTransactionsInProductDetailsAreInCurrency(String expectedCurrency) {
        String xPathWait = "(//android.view.View[@resource-id='nlb-card-container']/android.widget.TextView[@resource-id='nlb-currency'])[1]";
        By el = x.createByXpath(xPathWait);
        WaitHelpers.waitForElement(el);

        String xPath = "//android.view.View[@resource-id='nlb-card-container']/android.widget.TextView[@resource-id='nlb-currency']";
        List<MobileElement> elements = x.createElementsByXpath(xPath);
        for(MobileElement element : elements){
            Assert.assertEquals(expectedCurrency, element.getText());
        }
    }

    @And("Click on currency filter {string}")
    public void clickOnCurrencyFilter(String currency) throws Exception {
        String xPath = "//android.widget.TextView[@resource-id='nlb-product-details-primary-balance' and contains(@text, '" + currency + "')]/ancestor::android.view.View[@resource-id='nlb-header-card']";
        By el = By.xpath(xPath);

        for(int i = 0; i<20; i++){
            if(hp.isElementNotPresent(el)){
                hp.scrollByCoordinatesHorizontal(driver, 650, 700, 200);
            }
        }
        hp.clickElement(el);
        WaitHelpers.waitForSeconds(1);
    }

    @And("Click on first transaction")
    public void clickOnFirstTransaction() throws Exception {
        String xPath = "(//*[@resource-id='nlb-card-container'])[1]";
        By el = x.createByXpath(xPath);
        hp.clickElement(el);
    }

    @And("Scroll to element by text {string}")
    public void scrollToElementByText(String text) {
        String xPath = "//*[@text='" + text + "']";
        rh.scrollElementByXpath(xPath);
    }

    @And("Assert transaction tags label is correct")
    public void assertTransactionTagsLabelIsCorrect() {
        String xPath = "//android.widget.TextView[@text='Transaction tags']/following-sibling::android.widget.TextView[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
        Assert.assertTrue(element.getText().matches("^[0-6]/6$"));
    }

    @And("Assert My tags label is correct")
    public void assertMyTagsLabelIsCorrect() {
        String xPath = "//android.widget.TextView[@text='My tags']";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert list of tags is displayed in add tag page")
    public void assertListOfTagsIsDisplayedInAddTagPage() {
        String xPath = "//android.view.View[@resource-id= 'nlb-card-container']/android.view.View";
        List<MobileElement> elements = x.createElementsByXpath(xPath);
        for(MobileElement element : elements){
            Assert.assertTrue(element.isDisplayed());
        }
    }

    @And("Assert tag in list is displayed correctly")
    public void assertTagInListIsDisplayedCorrectly() {
        //tag name
        String xPath1 = "//android.view.View[@resource-id= 'nlb-card-container']/android.widget.TextView[@text='My tags']/following-sibling::android.view.View[1]/android.widget.TextView[1]";
        MobileElement element1 = x.createMobileElementByXpath(xPath1);
        Assert.assertTrue(element1.isDisplayed());
        Assert.assertTrue(element1.getText().startsWith("#"));
        //uses
        String xPath2 = "//android.view.View[@resource-id= 'nlb-card-container']/android.widget.TextView[@text='My tags']/following-sibling::android.view.View[1]/android.widget.TextView[2]";
        MobileElement element2 = x.createMobileElementByXpath(xPath2);
        Assert.assertTrue(element2.isDisplayed());
        Assert.assertTrue(element2.getText().matches("^\\d*\\suse[s]?$"));
    }

    @And("Enter new tag from Excel {string} columnName {string}")
    public void enterNewTagFromExcelColumnName(String rowindex, String columnName) throws Throwable {
        String newTag = DataManager.getDataFromHashDatamap(rowindex, columnName);
        //entering text to tag search bar
        String xPath1 = "//*[@resource-id='nlb-card-container']/android.widget.EditText";
        By element1 = x.createByXpath(xPath1);
        hp.enterTextToElement(newTag, element1);

        //assert there is no tag like this
        MobileElement elementtxt = x.createMobileElementByText("There is no data");
        Assert.assertTrue(elementtxt.isDisplayed());

        MobileElement element2 = x.createMobileElementByXpath(xPath1);
        hp.ClickOnElement(element2);
        WaitHelpers.waitForSeconds(3);

        // Coordinates for the checkmark key on the keyboard
        //String[] command = {"adb", "shell", "input", "tap", "1000", "2030"};
        String[] command = {"adb", "shell", "input", "tap", "1000", "2060"};

        // Execute the ADB command
        ProcessBuilder pb = new ProcessBuilder(command);
        Process pc = pb.start();
        pc.waitFor(); // Wait for the command to finish
    }

    @And("Assert new tag from Excel {string} columnName {string} is shown in add tag screen")
    public void assertNewTagFromExcelColumnNameIsShownInAddTagScreen(String rowindex, String columnName) {
        String tagName = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPath = "//android.widget.TextView[@text='Transaction tags']/following-sibling::android.widget.TextView[@text='#" + tagName + "']";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Click on back button in screen {string}")
    public void clickOnBackButtonInScreen(String screenName) throws Throwable {
        String xPath = "//android.widget.TextView[@text='" + screenName + "']/preceding-sibling::android.view.View/android.view.View[@content-desc='Back']/following-sibling::android.widget.Button";
        MobileElement element = x.createMobileElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Wait for tags label in transaction details")
    public void waitForTagsLabelInTransactionDetails() {
        String xPath = "//android.widget.TextView[@text='Tag']";
        By element = x.createByXpath(xPath);
        WaitHelpers.waitForElement(element);
    }

    @And("Assert tag from Excel {string} columnName {string} is shown in transaction details")
    public void assertTagFromExcelColumnNameIsShownInTransactionDetails(String rowindex, String columnName) {
        String tagName = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPath = "//android.widget.TextView[@text='Tag']/following-sibling::android.widget.TextView[@text='#" + tagName + "']";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Select first recommended tag from the list and remember it under key {string}")
    public void selectFirstRecommendedTagFromTheListAndRememberItUnderKey(String key) throws Throwable {
        String xPath = "//android.widget.TextView[@text='My tags']/following-sibling::android.view.View[1]/android.widget.TextView[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.getText().startsWith("#"));
        DataManager.userObject.put(key, element.getText());
        hp.ClickOnElement(element);
    }

    @And("Wait Transaction tags label in Add tag screen")
    public void waitTransactionTagsLabelInAddTagScreen() {
        String xpath = "//android.widget.TextView[@text='Transaction tags']";
        By el = x.createByXpath(xpath);
        WaitHelpers.waitForElement(el);
    }

    @And("Assert selected tag under key {string} is shown in add tag screen")
    public void assertSelectedTagUnderKeyIsShownInAddTagScreen(String key) {
        String tagName = DataManager.userObject.get(key).toString();
        String xPath = "//android.widget.TextView[@text='Transaction tags']/following-sibling::android.widget.TextView[@text='" + tagName + "']";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert selected tag under key {string} is shown in transaction details")
    public void assertSelectedTagUnderKeyIsShownInTransactionDetails(String key) {
        String tagName = DataManager.userObject.get(key).toString();
        String xPath = "//android.widget.TextView[@text='Tag']/following-sibling::android.widget.TextView[@text='" + tagName + "']";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Remove tag from Excel {string} columnName {string} in Add tag screen")
    public void removeTagFromExcelColumnNameInAddTagScreen(String rowindex, String columnName) throws Throwable {
        String tagName = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPath = "//android.widget.TextView[@text='#" + tagName + "']/following-sibling::android.view.View[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        hp.ClickOnElement(element);
        //assert element is no longer visible
        String xPath2 = "//android.widget.TextView[@text='My tags']/preceding-sibling::android.widget.TextView[@text='#" + tagName + "']";
        By element2 = x.createByXpath(xPath2);
        boolean isDisplayed = hp.isElementDisplayed(element2, 5, 300);
        Assert.assertFalse(isDisplayed);
    }

    @And("Remove tag under key {string} in Add tag screen")
    public void removeTagUnderKeyInAddTagScreen(String key) throws Throwable {
        String tagName = DataManager.userObject.get(key).toString();
        String xPath = "//android.widget.TextView[@text='" + tagName + "']/following-sibling::android.view.View[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        hp.ClickOnElement(element);
        //assert element is no longer visible
        String xPath2 = "//android.widget.TextView[@text='My tags']/preceding-sibling::android.widget.TextView[@text='" + tagName + "']";
        By element2 = x.createByXpath(xPath2);
        boolean isDisplayed = hp.isElementDisplayed(element2, 5, 300);
        Assert.assertFalse(isDisplayed);
    }

    @And("Assert tag from Excel {string} columnName {string} is not displayed in transaction details")
    public void assertTagFromExcelColumnNameIsNotDisplayedInTransactionDetails(String rowindex, String columnName) throws Throwable {
        String tagName = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPath = "//android.widget.TextView[@text='Tags']/following-sibling::android.widget.TextView[@text='#" + tagName + "']";
        By element = x.createByXpath(xPath);
        boolean isDisplayed = hp.isElementDisplayed(element, 5, 300);
        Assert.assertFalse(isDisplayed);
    }

    @And("Assert tag under key {string} is not displayed in transaction details")
    public void assertTagUnderKeyIsNotDisplayedInTransactionDetails(String key) throws Throwable {
        String tagName = DataManager.userObject.get(key).toString();
        String xPath = "//android.widget.TextView[@text='Tags']/following-sibling::android.widget.TextView[@text='" + tagName + "']";
        By element = x.createByXpath(xPath);
        boolean isDisplayed = hp.isElementDisplayed(element, 5, 300);
        Assert.assertFalse(isDisplayed);
    }

    @And("Wait for Add tag label in transaction details")
    public void waitForAddTagLabelInTransactionDetails() {
        String xPath = "//*[@text='Add tag']";
        By el = x.createByXpath(xPath);
        WaitHelpers.waitForElement(el);
    }

    @And("Assert buttons Get receipt and Send complaint are displayed in Transaction details")
    public void assertButtonsGetReceiptAndSendComplaintAreDisplayedInTransactionDetails() {
        //get receipt
        String xPath1 = "//*[@resource-id='nlb-button-text']/android.widget.TextView[@text='Confirmation']/following-sibling::android.widget.Button";
        MobileElement element1 = x.createMobileElementByXpath(xPath1);
        Assert.assertTrue(element1.isDisplayed());
        Assert.assertTrue(element1.isEnabled());
        //send complaint
        String xPath2 = "//*[@resource-id='nlb-button-text']/android.widget.TextView[@text='Send message']/following-sibling::android.widget.Button";
        MobileElement element2 = x.createMobileElementByXpath(xPath2);
        Assert.assertTrue(element2.isDisplayed());
        Assert.assertTrue(element2.isEnabled());
    }

    @And("Click on button {string} in transaction details")
    public void clickOnButtonInTransactionDetails(String buttonName) throws Throwable {
        String xPath = "//*[@resource-id='nlb-button-text']/android.widget.TextView[@text='" + buttonName + "']/following-sibling::android.widget.Button";
        MobileElement element = x.createMobileElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Assert Statement button in Product details")
    public void assertStatementButtonInProductDetails() {
        //text
        String xPath1 = "//android.view.View[@resource-id='nlb-cta-button'][3]//android.widget.TextView";
        MobileElement element1 = x.createMobileElementByXpath(xPath1);
        Assert.assertTrue(element1.isDisplayed());
        Assert.assertEquals("Statements" , element1.getText());
        //image
        String xPath2 = "//android.view.View[@resource-id='nlb-cta-button'][3]//android.view.View[@content-desc='Statements']";
        MobileElement element2 = x.createMobileElementByXpath(xPath2);
        Assert.assertTrue(element2.isDisplayed());
        //button
        String xPath3 = "//android.view.View[@resource-id='nlb-cta-button'][3]//android.widget.Button";
        MobileElement element3 = x.createMobileElementByXpath(xPath3);
        Assert.assertTrue(element3.isDisplayed());
        Assert.assertTrue(element3.isEnabled());
    }

    @And("Click on button in Product details {string}")
    public void clickOnButtonInProductDetails(String buttonName) throws Throwable {
        String xPath = "//android.view.View[@resource-id='nlb-cta-button']//android.widget.TextView[@text='" + buttonName + "']";
        MobileElement element = x.createMobileElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Wait for Statements screen to load")
    public void waitForStatementsScreenToLoad() {
        String xPath = "//android.widget.TextView[@text='Statements']";
        By element = x.createByXpath(xPath);
        WaitHelpers.waitForElement(element);
    }

    @And("Assert Year filter for statements")
    public void assertYearFilterForStatements() {
        //label
        String xPath1 = "//android.view.View[@resource-id='nlb-dropdown-menu']/android.widget.TextView[@text='Year']";
        MobileElement element1 = x.createMobileElementByXpath(xPath1);
        Assert.assertTrue(element1.isDisplayed());
        //default year current
        String xPath2 = "//android.view.View[@resource-id='nlb-dropdown-menu']/android.view.View/android.widget.TextView";
        MobileElement element2 = x.createMobileElementByXpath(xPath2);
        Assert.assertTrue(element2.isDisplayed());
        Assert.assertEquals("2024", element2.getText());
        //dropdown arrow in menu
        String xPath3 = "//android.view.View[@resource-id='nlb-dropdown-menu']/android.view.View/android.widget.ImageView[@content-desc='Expand dropdown menu']";
        MobileElement element3 = x.createMobileElementByXpath(xPath3);
        Assert.assertTrue(element3.isDisplayed());
    }

    @And("Assert Year filter for statements has expected options")
    public void assertYearFilterForStatementsHasExpectedOptions() throws Throwable {
        //dropdown arrow in menu
        String xPath1 = "//android.view.View/android.widget.ImageView[@content-desc='Expand dropdown menu']";
        MobileElement element1 = x.createMobileElementByXpath(xPath1);
        hp.ClickOnElement(element1);
        //dropdown menu
        String xPath2 = "//android.widget.ScrollView//android.widget.TextView";
        List<MobileElement> elements = x.createElementsByXpath(xPath2);
        List<String> expectedYears = rh.getXYearsInPast(11);
        for(int i=0; i< elements.size(); i++){
            Assert.assertEquals(expectedYears.get(i), elements.get(i).getText());
        }
    }

    @And("Select Year {string} in statements filter")
    public void selectYearInStatementsFilter(String year) throws Throwable {
        String xPath = "//android.widget.ScrollView//android.widget.TextView[@text='" + year + "']";
        MobileElement element = x.createMobileElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Wait for first statement to appear")
    public void waitForFirstStatementToAppear() {
        String xPath = "//android.view.View[@resource-id='nlb-icon-row']/android.view.View[1]";
        By el = x.createByXpath(xPath);
        WaitHelpers.waitForElement(el);
    }

    @And("Assert first statement in list is from year {string}")
    public void assertFirstStatementInListIsFromYear(String year) {
        String xPath = "//android.view.View[@resource-id='nlb-icon-row']/android.view.View[1]/android.widget.TextView[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.getText().endsWith(year));
    }

    @And("Assert statements in list are displayed correctly")
    public void assertStatementsInListAreDisplayedCorrectly() {
        //date format
        String xPath1 = "//android.view.View[@resource-id='nlb-icon-row']/android.view.View/android.widget.TextView[1]";
        List<MobileElement> elements1 = x.createMobileElementsByXpath(xPath1);
        for(MobileElement element : elements1){
            Assert.assertTrue(element.getText().matches("^((0?[1-9]|[12]\\d|3[01])\\.\\u00A0(0?[13578]|1[02])\\.\\u00A0((19|20)\\d\\d)|(0?[1-9]|[12]\\d|30)\\.\\u00A0(0?[13456789]|1[012])\\.\\u00A0((19|20)\\d\\d)|(0?[1-9]|1\\d|2[0-8])\\.\\u00A0(0?2)\\.\\u00A0((19|20)\\d\\d)|29\\.\\u00A0(0?2)\\.\\u00A0((19|20)(0[48]|[2468][048]|[13579][26])))$"));
        }
        //descriptions
        String xPath2 = "//android.view.View[@resource-id='nlb-icon-row']/android.view.View/android.widget.TextView[2]";
        List<MobileElement> elements2 = x.createMobileElementsByXpath(xPath2);
        for(MobileElement element : elements2){
            Assert.assertTrue(element.isDisplayed());
        }
        //download icon
        String xPath3 = "//android.view.View[@resource-id='nlb-icon-row']/android.view.View/android.view.View";
        List<MobileElement> elements3 = x.createMobileElementsByXpath(xPath3);
        for(MobileElement element : elements3){
            Assert.assertTrue(element.isDisplayed());
            Assert.assertTrue(element.isEnabled());
        }
    }

    @And("Assert Statement button in Product details index {string}")
    public void assertStatementButtonInProductDetailsIndex(String index) {
        //text
        String xPath1 = "//android.view.View[@resource-id='nlb-cta-button'][" + index + "]//android.widget.TextView";
        MobileElement element1 = x.createMobileElementByXpath(xPath1);
        Assert.assertTrue(element1.isDisplayed());
        Assert.assertEquals("Statements" , element1.getText());
        //image
        String xPath2 = "//android.view.View[@resource-id='nlb-cta-button'][" + index + "]//android.view.View[@content-desc='Statements']";
        MobileElement element2 = x.createMobileElementByXpath(xPath2);
        Assert.assertTrue(element2.isDisplayed());
        //button
        String xPath3 = "//android.view.View[@resource-id='nlb-cta-button'][" + index + "]//android.widget.Button";
        MobileElement element3 = x.createMobileElementByXpath(xPath3);
        Assert.assertTrue(element3.isDisplayed());
        Assert.assertTrue(element3.isEnabled());
    }

    @And("Assert list of transactions is displayed correctly in Product")
    public void assertListOfTransactionsIsDisplayedCorrectlyInProduct() {
        try{
            List<MobileElement> mobileElementList = d.createMobileElementsByResourceId("nlb-item-row");
            if(!mobileElementList.isEmpty()){
                rh.assertMobileElementsDisplayed(mobileElementList);
            }
            return;
        } catch (NoSuchElementException e){}

        try{
            String xPath2 = "//android.widget.TextView[@text='No results found. Adjust your values and try again.']";
            MobileElement element2 = x.createMobileElementByXpath(xPath2);
            Assert.assertTrue(element2.isDisplayed());
            return;
        }
        catch (NoSuchElementException e){
            Assert.fail("Transaction list not displayed correctly.");
        }
    }

    @And("Assert list of transactions is displayed correctly in Insurance")
    public void assertListOfTransactionsIsDisplayedCorrectlyInInsurance() {
        try{
            List<MobileElement> mobileElementList = d.createMobileElementsByResourceId("nlb-item-row");
            if(!mobileElementList.isEmpty()){
                rh.assertMobileElementsDisplayed(mobileElementList);
            }
            return;
        } catch (NoSuchElementException e){}

        try{
            String xPath2 = "//android.widget.TextView[@text='Only additional premiums are displayed.']";
            MobileElement element2 = x.createMobileElementByXpath(xPath2);
            Assert.assertTrue(element2.isDisplayed());
            return;
        }
        catch (NoSuchElementException e){
            Assert.fail("Premiums list not displayed correctly.");
        }
    }

    @And("Assert NLB feature button with text {string}")
    public void assertNLBFeatureButtonWithText(String text) {
        String xPath = "//android.widget.TextView[@text='" + text + "']/ancestor::android.view.View[@resource-id='nlb-feature-button']";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
        Assert.assertTrue(element.isEnabled());
    }

    @And("Click on Download for first statement in statement list")
    public void clickOnDownloadForFirstStatementInStatementList() throws Throwable {
        String xPath = "(//android.view.View[@resource-id='nlb-icon-row']/android.view.View/android.view.View)[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Wait for Past payments button in Pay screen")
    public void waitForPastPaymentsButtonInPayScreen() {
        String xPath = "//android.view.View[@resource-id='nlb-settings-menu']/android.widget.TextView[@text='Past payments']";
        By el = x.createByXpath(xPath);
        WaitHelpers.waitForElement(el);
    }

    @And("Click on Review and edit button {string} in Pay screen")
    public void clickOnReviewAndEditButtonInPayScreen(String buttonName) throws Throwable {
        String xPath = "//android.view.View[@resource-id='nlb-settings-menu']/android.widget.TextView[@text='" + buttonName + "']";
        MobileElement element = x.createMobileElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Wait for first Past payment")
    public void waitForFirstPastPayment() {
        String xPath = "(//android.widget.TextView[@resource-id='nlb-date']/ancestor::android.view.View[@resource-id='nlb-card-container'])[1]";
        By el = x.createByXpath(xPath);
        WaitHelpers.waitForElement(el);
    }

    @And("Click on payment filter")
    public void clickOnPaymentFilter() throws Throwable {
        String xPath = "//android.widget.TextView[@text='Payments']/ancestor::android.view.View[2]/following-sibling::android.view.View[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Assert tab {string} is selected in Past payments between Payments and SEPA DD")
    public void assertTabIsSelectedInPastPaymentsBetweenPaymentsAndSEPADD(String tabName) {
        String xPath = "//android.widget.TextView[@text='" + tabName + "']/ancestor::android.view.View[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isSelected());
    }

    @And("Assert Past payment filter options are displayed correctly")
    public void assertPastPaymentFilterOptionsAreDisplayedCorrectly() {
        //Date filter title
        String xPath1 = "//android.view.View[@resource-id='nlb-settings-menu'][1]/android.widget.TextView[1]";
        MobileElement element1 = x.createMobileElementByXpath(xPath1);
        Assert.assertTrue(element1.isDisplayed());
        Assert.assertEquals("Date", element1.getText());
        //Date filter subtitle
        String xPath2 = "//android.view.View[@resource-id='nlb-settings-menu'][1]/android.widget.TextView[2]";
        MobileElement element2 = x.createMobileElementByXpath(xPath2);
        Assert.assertTrue(element2.isDisplayed());
        Assert.assertEquals("Select time frame", element2.getText());
        //Date arrow icon
        String xPath3 = "//android.view.View[@resource-id='nlb-settings-menu'][1]/android.view.View[@content-desc='Navigate forward']";
        MobileElement element3 = x.createMobileElementByXpath(xPath3);
        Assert.assertTrue(element3.isDisplayed());
        //Status filter title
        String xPath4 = "//android.view.View[@resource-id='nlb-settings-menu'][2]/android.widget.TextView[1]";
        MobileElement element4 = x.createMobileElementByXpath(xPath4);
        Assert.assertTrue(element4.isDisplayed());
        Assert.assertEquals("Status", element4.getText());
        //Status filter subtitle
        String xPath5 = "//android.view.View[@resource-id='nlb-settings-menu'][2]/android.widget.TextView[2]";
        MobileElement element5 = x.createMobileElementByXpath(xPath5);
        Assert.assertTrue(element5.isDisplayed());
        Assert.assertEquals("Executed, Rejected, Canceled", element5.getText());
        //Status arrow icon
        String xPath6 = "//android.view.View[@resource-id='nlb-settings-menu'][2]/android.view.View[@content-desc='Navigate forward']";
        MobileElement element6 = x.createMobileElementByXpath(xPath6);
        Assert.assertTrue(element6.isDisplayed());
        //Amount filter title
        String xPath7 = "//android.view.View[@resource-id='nlb-settings-menu'][3]/android.widget.TextView[1]";
        MobileElement element7 = x.createMobileElementByXpath(xPath7);
        Assert.assertTrue(element7.isDisplayed());
        Assert.assertEquals("Payment amount", element7.getText());
        //Amount filter subtitle
        String xPath8 = "//android.view.View[@resource-id='nlb-settings-menu'][3]/android.widget.TextView[2]";
        MobileElement element8 = x.createMobileElementByXpath(xPath8);
        Assert.assertTrue(element8.isDisplayed());
        Assert.assertEquals("Set amount", element8.getText());
        //Amount arrow icon
        String xPath9 = "//android.view.View[@resource-id='nlb-settings-menu'][3]/android.view.View[@content-desc='Navigate forward']";
        MobileElement element9 = x.createMobileElementByXpath(xPath9);
        Assert.assertTrue(element9.isDisplayed());
    }

    @And("Click on {string} button alternate")
    public void clickOnButtonAlternate(String buttonName) throws Throwable {
        String xPath = "//android.widget.TextView[@text='" + buttonName + "']/ancestor::android.view.View[@resource-id='nlb-button-alternate']";
        MobileElement element = x.createMobileElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Assert Insurance policy amount for Vita")
    public void assertInsurancePolicyAmountForVita() {
        //title
        String xPath1 = "//android.view.View[@resource-id='nlb-header-card']/android.widget.TextView[1]";
        MobileElement element1 = x.createMobileElementByXpath(xPath1);
        Assert.assertTrue(element1.isDisplayed());
        Assert.assertEquals("Insurance policy amount", element1.getText());
        //amount
        String xPath2 = "//android.view.View[@resource-id='nlb-header-card']/android.widget.TextView[@resource-id='nlb-product-details-primary-balance']";
        MobileElement element2 = x.createMobileElementByXpath(xPath2);
        Assert.assertTrue(element2.isDisplayed());
        Assert.assertTrue(element2.getText().endsWith("EUR"));
        Assert.assertTrue(element2.getText().replaceAll("\\u00A0[A-Z]{3}", "").matches("^−?(?:(?:0|[1-9]\\d{0,2})(?:\\.\\d{3})*),\\d{2}$"));
    }

    @And("Assert Details button in Product details index {string}")
    public void assertDetailsButtonInProductDetailsIndex(String index) {
        //text
        String xPath1 = "//android.view.View[@resource-id='nlb-cta-button'][" + index + "]//android.widget.TextView";
        MobileElement element1 = x.createMobileElementByXpath(xPath1);
        Assert.assertTrue(element1.isDisplayed());
        Assert.assertEquals("Details" , element1.getText());
        //image
        String xPath2 = "//android.view.View[@resource-id='nlb-cta-button'][" + index + "]//android.view.View[@content-desc='Details']";
        MobileElement element2 = x.createMobileElementByXpath(xPath2);
        Assert.assertTrue(element2.isDisplayed());
        //button
        String xPath3 = "//android.view.View[@resource-id='nlb-cta-button'][" + index + "]//android.widget.Button";
        MobileElement element3 = x.createMobileElementByXpath(xPath3);
        Assert.assertTrue(element3.isDisplayed());
        Assert.assertTrue(element3.isEnabled());
    }

    @And("Assert Funds button in Product details index {string}")
    public void assertFundsButtonInProductDetailsIndex(String index) {
        //text
        String xPath1 = "//android.view.View[@resource-id='nlb-cta-button'][" + index + "]//android.widget.TextView";
        MobileElement element1 = x.createMobileElementByXpath(xPath1);
        Assert.assertTrue(element1.isDisplayed());
        Assert.assertEquals("Funds" , element1.getText());
        //image
        String xPath2 = "//android.view.View[@resource-id='nlb-cta-button'][" + index + "]//android.view.View[@content-desc='Funds']";
        MobileElement element2 = x.createMobileElementByXpath(xPath2);
        Assert.assertTrue(element2.isDisplayed());
        //button
        String xPath3 = "//android.view.View[@resource-id='nlb-cta-button'][" + index + "]//android.widget.Button";
        MobileElement element3 = x.createMobileElementByXpath(xPath3);
        Assert.assertTrue(element3.isDisplayed());
        Assert.assertTrue(element3.isEnabled());
    }

    @And("Wait for Details screen to load")
    public void waitForDetailsScreenToLoad() {
        String xPath = "//android.widget.TextView[@text='Details']";
        By element = x.createByXpath(xPath);
        WaitHelpers.waitForElement(element);
    }

    @And("Assert that Financial details in Details screen is index {int}")
    public void assertThatFinancialDetailsInDetailsScreenIsIndex(int index) {
        String xPath = "(//android.view.View[@resource-id='nlb-product-details-card']/android.widget.TextView[1])[" + index + "]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
        Assert.assertEquals("Financial details", element.getText());
    }

    @And("Assert that Insurance details in Details screen is index {int}")
    public void assertThatInsuranceDetailsInDetailsScreenIsIndex(int index) {
        String xPath = "(//android.view.View[@resource-id='nlb-product-details-card']/android.widget.TextView[1])[" + index + "]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
        Assert.assertEquals("Insurance details", element.getText());
    }

    @And("Assert there are is no Unpaid Premiums category in Vita details")
    public void assertThereAreIsNoUnpaidPremiumsCategoryInVitaDetails() throws InterruptedException {
        String xPath = "//android.view.View[@resource-id='nlb-product-details-card']/android.widget.TextView[@text='Unpaid premius']";
        By el = By.xpath(xPath);
        boolean messageExists = ActionApiHelpers.isElementDisplayedCustom(el,2,500);
        Assert.assertFalse(messageExists);
    }

    @And("Wait for Details screen to load for Vita")
    public void waitForDetailsScreenToLoadForVita() {
        String xPath = "//android.view.View[@resource-id='nlb-header-card']/android.widget.TextView[@text='Insurance policy amount']";
        By element = x.createByXpath(xPath);
        WaitHelpers.waitForElement(element);
    }

    @And("Wait for first transaction with {string} currency")
    public void waitForFirstTransactionWithCurrency(String currency) {
        String xPath1 = "(//android.widget.TextView[@resource-id='nlb-transaction-header-sum'])[1]";
        By el1 = x.createByXpath(xPath1);
        WaitHelpers.waitForElement(el1);

        String xPath = "(//*[@resource-id='nlb-card-container'])[1]";
        By el = x.createByXpath(xPath);
        WaitHelpers.waitForElement(el);

        String xPath2 = "(//android.widget.TextView[@resource-id='nlb-currency' and @text='" + currency + "'])[1]";
        By el2 = x.createByXpath(xPath);
        WaitHelpers.waitForElement(el2);
    }

    @And("Wait for first transaction to load after filter")
    public void waitForFirstTransactionToLoadAfterFilter() {
        String xPath = "(//*[@resource-id='nlb-date'])[1]";
        By el = x.createByXpath(xPath);
        WaitHelpers.waitForElement(el);
    }

    @And("Swipe to element by text from Excel {string} columnName {string} and click on it")
    public void swipeToElementByTextFromExcelColumnNameAndClickOnIt(String rowindex, String columnName) throws Exception {
        String text = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPath = "//*[@text='" + text + "']";
        By el = By.xpath(xPath);

        for(int i = 0; i<10; i++){
            if(hp.isElementNotPresent(el)){
                hp.scrollDown(driver);
            }
        }
        hp.clickElement(el);
    }

    @And("Assert that text {string} has first following sibling with text from txt file under key {string}")
    public void assertThatTextHasFirstFollowingSiblingWithTextFromTxtFileUnderKey(String textFirst, String key) {
        String textSecond = Utilities.getDataFromTxtFileUnderKey(key);
        String xPath = "//*[@text='"+textFirst+"']//following-sibling::*[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertEquals(textSecond,element.getText());
    }

    @And("Assert currency in second payment screen is {string}")
    public void assertCurrencyInSecondPaymentScreenIs(String expected) {
        String xPath = "//*[@resource-id='nlb-amount-with-currency-field']/following-sibling::android.widget.TextView[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertEquals(expected, element.getText());
    }

    /*@And("Click on Account selector in Payment list")
    public void clickOnAccountSelectorInPaymentList() throws Throwable {
        String xPath = "(//*[@resource-id='nlb-card-container'])[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        hp.ClickOnElement(element);
    }*/

    @And("Click on Account selector in Payment list")
    public void clickOnAccountSelectorInPaymentList() throws Throwable {
        String xPath = "(//*[@resource-id='nlb-card-container'])[1]";
        By el = By.xpath(xPath);
        int attempts = 0;
        WaitHelpers.waitForSeconds(5);
        while (attempts < 3) {
            try {
                MobileElement element = (MobileElement) driver.findElement(el);
                element.click();
                break;
            } catch (StaleElementReferenceException e) {
                attempts++;
                Thread.sleep(1000); // Wait for 1 second before retrying
            }
        }
        if (attempts == 3) {
            throw new Exception("Failed to click on Account selector in Payment list after 3 attempts");
        }
    }

    @And("Click on Debtor selector for payment")
    public void clickOnDebtorSelectorForPayment() throws Throwable {
        String xPath = "//*[@text='Debtor']//following-sibling::*[@resource-id='nlb-card-container'][1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Assert that second text {string} has first following sibling that contains text {string}")
    public void assertThatSecondTextStringHasFirstFollowingSiblingThatContainsText(String textFirst,String expectedText) {
        String xPath = "//*[@text='"+textFirst+"'][2]//following-sibling::*[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.getText().contains(expectedText));
    }

    @And("Assert that text {string} has first following sibling that contains text {string}")
    public void assertThatTextHasFirstFollowingSiblingThatContainsText(String textFirst, String textSecond) {
        String xPath = "//*[@text='"+textFirst+"']//following-sibling::*[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.getText().contains(textSecond));
    }

    @And("Assert that text {string} has first following sibling with future date {string} in format {string}")
    public void assertThatTextHasFirstFollowingSiblingWithFutureDateInFormat(String textFirst, String daysInFuture, String dateFormat) {
        String xPath = "//*[@text='"+textFirst+"']//following-sibling::*[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        String futureDate = ActionApiHelpers.getTodayDatePlusXDaysInFormat(Integer.parseInt(daysInFuture),dateFormat);
        String actualDate = element.getAttribute("text").replaceAll("\u00A0", "");
        Assert.assertEquals(futureDate, actualDate);
    }

    @And("Assert element by id {string} has date {string} day in the future in format {string}")
    public void assertElementByIdHasDateDayInTheFutureInFormat(String id, String daysInFuture, String dateFormat) {
        By el = d.createElementByResourceId(id);
        WaitHelpers.waitForElement(el);
        MobileElement element = d.createMobileElementByResourceId(id);
        String futureDate = ActionApiHelpers.getTodayDatePlusXDaysInFormat(Integer.parseInt(daysInFuture),dateFormat);
        String actualDate = element.getAttribute("text").replaceAll("\u00A0", "");
        Assert.assertEquals(futureDate, actualDate);
    }

    @And("Assert that info message for currency conversion in second step of payment is of correct format")
    public void assertThatInfoMessageForCurrencyConversionInSecondStepOfPaymentIsOfCorrectFormat() {
        MobileElement elementForCurrencyExchangeInfo = d.createMobileElementByResourceId("nlb-info-link-exchange-rate");
        String actualText = elementForCurrencyExchangeInfo.getText();
        Assert.assertTrue(actualText.matches("^Amount\\s+in\\s+EUR\\s+\\d{1,3},\\d{2} EUR\\s+\\(\\d{1,3},\\d{4}\\s+[A-Z]{3}\\s+for\\s+1\\s+EUR\\)$"));
    }

    @And("Store exchange {string} for country {string} under key {string} in txt file")
    public void storeExchangeForCountryUnderKeyInTxtFile(String id, String country, String key) {
        String xPathForCurrencyExchangeRate = "//*[@text='"+country+"']//following-sibling::*[@resource-id='nlb-exchange-"+id+"'][1]";
        MobileElement elementForCurrencyExchangeRate = x.createMobileElementByXpath(xPathForCurrencyExchangeRate);
        String rateToStore = elementForCurrencyExchangeRate.getText();
        Utilities.saveTheValueToFile(rateToStore,key);
    }

    @And("Assert that info message for currency conversion in second step of payment is correct using amount {string} currency {string} and exchange rate {string}")
    public void assertThatInfoMessageForCurrencyConversionInSecondStepOfPaymentIsCorrectUsingAmountCurrencyAndExchangeRate(String amountString, String currency, String exchangeRateKey) {
        String exchangeRateString = Utilities.getDataFromTxtFileUnderKey(exchangeRateKey);

        Double exchangeRate = Double.parseDouble(exchangeRateString.replace(",", "."));
        Double amount = Double.parseDouble(amountString);
        Double convertedAmount = amount / exchangeRate;
        Double convertedAmountTwo = Utilities.round(convertedAmount, 2);
        Utilities.saveTheValueToFile("debitedAmount",convertedAmountTwo.toString());

        MobileElement elementForCurrencyExchangeInfo = d.createMobileElementByResourceId("nlb-info-link-exchange-rate");
        String actualText = elementForCurrencyExchangeInfo.getText();
        Assert.assertTrue(actualText.matches("^Amount\\s+in\\s+EUR\\s+"+convertedAmountTwo+" EUR\\s+\\("+exchangeRateString+"\\s+"+currency+"\\s+for\\s+1\\s+EUR\\)$"));
    }

    @And("Assert that text {string} has first following sibling with text from key {string} from txt file")
    public void assertThatTextHasFirstFollowingSiblingWithTextFromKeyFromTxtFile(String textFirst, String textSecond) {
        String expectedValue = Utilities.getDataFromTxtFileUnderKey(textSecond);
        String xPath = "//*[@text='"+textFirst+"']//following-sibling::*[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertEquals(expectedValue,element.getText());
    }

    @And("Click on element by contains text {string}")
    public void clickOnElementByContainsText(String text) throws Throwable {
        String xPath = "//*[contains(@text,'"+text+"')]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Assert element by contains text from excel {string} columnName {string}")
    public void assertElementByContainsTextFromExcelColumnName(String rowindex, String columnName) {
        String text = DataManager.getDataFromHashDatamap(rowindex,columnName);
        MobileElement element = x.createMobileElementByContainsText(text);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert element by text {string} has first following sibling from excel {string} columnName {string}")
    public void assertElementByTextHasFirstFollowingSiblingFromExcelColumnName(String text, String rowindex, String columnName) {
        String xPath = "(//*[@text='"+text+"']//following-sibling::*)[1]";
        String expected = DataManager.getDataFromHashDatamap(rowindex,columnName);
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertEquals(expected,element.getAttribute("text"));
    }

    @And("Assert element by text {string} has first following sibling {string}")
    public void assertElementByTextHasFirstFollowingSibling(String text, String expected) {
        String xPath = "(//*[@text='"+text+"']//following-sibling::*)[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertEquals(expected,element.getAttribute("text"));
    }

    @And("Assert saved contact has short {string} and name from Excel {string} columnName {string} and iban from Excel {string} columnName {string}")
    public void assertSavedContactHasShortAndNameFromExcelColumnNameAndIbanFromExcelColumnName(String shortName, String rowindex1, String columnName1, String rowindex2, String columnName2) {
        String accountName = DataManager.getDataFromHashDatamap(rowindex1,columnName1);
        String accountIban = DataManager.getDataFromHashDatamap(rowindex2,columnName2);
        String xPath = "//*[@text='"+shortName+"']//following-sibling::*[@text='"+accountName+"']//following-sibling::*[@text='"+accountIban+"']";
        MobileElement element = x.createMobileElementByXpath(xPath);
    }

    @And("Assert that text {string} has first following sibling that contains from Excel {string} columnName {string}")
    public void assertThatTextHasFirstFollowingSiblingThatContainsFromExcelColumnName(String textFirst, String rowindex, String columnName) {
        String textSecond = DataManager.getDataFromHashDatamap(rowindex,columnName);
        String xPath = "//*[@text='"+textFirst+"']//following-sibling::*[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        System.out.println(textSecond);
        System.out.println(element.getText());
        Assert.assertTrue(element.getText().contains(textSecond));
    }

    @And("Remember transaction header sum under key {string}")
    public void rememberTransactionHeaderSumUnderKey(String key) {
        MobileElement element = d.createMobileElementByResourceId("nlb-transaction-header-sum");
        String input = element.getText();
        String sanitizedInput = input.replace("−","");
        sanitizedInput = sanitizedInput.replace(".","");
        sanitizedInput = sanitizedInput.replace(",",".");
        sanitizedInput = sanitizedInput.replace(" ","");
        sanitizedInput = sanitizedInput.replace("EUR","");
        double number = Double.parseDouble(sanitizedInput);
        DataManager.userObject.put(key,number);
    }

    @And("Click on Filter button in my product")
    public void clickOnFilterButtonInMyProduct() throws Throwable {
        String xPath = "(//*[@text='Transactions']//following-sibling::android.view.View)[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Add all incoming transaction amounts for this month")
    public void addAllIncomingTransactionAmountsForThisMonth() throws Exception {
        List<String> mobileElementList = rh.scrollDownAndPutEveryElementWithIdIntoList("nlb-amount");

        Double sumOfAmount = null;
        for (String s : mobileElementList){
            String sanitizedAmount = s.replace(".","");
            sanitizedAmount = sanitizedAmount.replace(",",".");
            Double amount = Double.parseDouble(sanitizedAmount);
            sumOfAmount =+ amount;
        }
        DataManager.userObject.put("incomingSum", sumOfAmount);
    }

    @And("Add all outgoing transaction amounts for this month")
    public void addAllOutgoingTransactionAmountsForThisMonth() throws Exception {
        String pageSource = driver.getPageSource();
        System.out.println("pageSource");
        List<String> mobileElementList = rh.scrollDownAndPutEveryElementWithIdIntoList("nlb-amount");


        Double sumOfAmount = null;
        for (String s : mobileElementList){
            String sanitizedAmount = s.replace(".","");
            sanitizedAmount = sanitizedAmount.replace(",",".");
            Double amount = Double.parseDouble(sanitizedAmount);
            sumOfAmount =+ amount;
        }
        DataManager.userObject.put("outgoingSum", sumOfAmount);
    }

    @And("Check if transaction header sum is correct")
    public void checkIfTransactionHeaderSumIsCorrect() {
        Double actualSum = (Double) DataManager.userObject.get("sum");
        Double incomingSum = (Double) DataManager.userObject.get("incomingSum");
        Double outgoingSum = (Double) DataManager.userObject.get("outgoingSum");

        Double expectedSum = Math.abs(incomingSum - outgoingSum);
        Assert.assertEquals(expectedSum,actualSum);
    }

    @And("Assert current month on page")
    public void assertCurrentMonthOnPage() {
        String month = rh.getTodayDateInFormat("MMMM");
        String xPath = "//*[@text='"+month+"']";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Remember transaction header sum for upcoming payments under key {string}")
    public void rememberTransactionHeaderSumForUpcomingPaymentsUnderKey(String key) {
        String month = rh.getTodayDateInFormat("MMMM");
        String xPath = "(//*[@text='"+month+"']//following-sibling::*)[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        DataManager.userObject.put(key,element.getText());
    }

    @And("Wait for element by text from excel {string} columnName {string}")
    public void waitForElementByTextFromExcelColumnName(String rowindex, String columnName) {
        String text = DataManager.getDataFromHashDatamap(rowindex,columnName);
        By element = tx.createElementByText(text);
        WaitHelpers.waitForElement(element, 60);
    }

    @And("Assert transaction header sum for upcoming payments is different from one under key {string}")
    public void assertTransactionHeaderSumForUpcomingPaymentsIsDifferentFromOneUnderKey(String key) {
        String month = rh.getTodayDateInFormat("MMMM");
        String xPath = "(//*[@text='"+month+"']//following-sibling::*)[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        String amount = element.getText();
        String otherAmount = (String) DataManager.userObject.get(key);
        Assert.assertNotEquals(amount,otherAmount);
    }

    @And("Assert element by id {string} has two decimal places and ends in {string}")
    public void assertElementByIdHasTwoDecimalPlacesAndEndsIn(String id, String end) {
        MobileElement element = d.createMobileElementByResourceId(id);
        String value = element.getText();
        //Assert.assertTrue(value.matches("^\\d+,\\d{2} EUR$"));
        Assert.assertTrue(value.matches("^\\d{1,3}(\\.\\d{3})*,\\d{2} EUR$"));
    }

    @And("Swipe currencies to the right until you find currency {string}")
    public void swipeCurrenciesToTheRightUntilYouFindCurrency(String currency) {
        String xPath = "//*[contains(@text,'"+currency+"')]";
        By el = By.xpath(xPath);

        for(int i = 0; i<35; i++){
            if(hp.isElementNotPresent(el)){
                hp.swipeByCordinates(900,700,400,700);
            }
        }
    }

    @And("Click on element by id {string} and contains text {string}")
    public void clickOnElementByIdAndContainsText(String id, String text) throws Throwable {
        MobileElement element = x.createMobileElementByIdAndContainsText(id,text);
        hp.ClickOnElement(element);
    }

    @And("Wait for transactions of {string} currencies to load in my products")
    public void waitForTransactionsOfCurrenciesToLoadInMyProducts(String currency) {
        String xPath = "//*[contains(@text,'"+currency+"') and not(@resource-id='nlb-product-details-primary-balance')]";
        By element = x.createByXpath(xPath);
        WaitHelpers.waitForElement(element, 100);
    }

    @And("Assert element by id {string} is date of format {string}")
    public void assertElementByIdIsDateOfFormat(String id, String format) {
        MobileElement element = d.createMobileElementByResourceId(id);
        String date = element.getText();
        boolean isValidDate = rh.isDateValid(date, format);
        Assert.assertTrue(isValidDate);
    }

    @Then("Find the appropriate transaction for manual categorization")
    public void findTheAppropriateTransactionForManualCategorization() throws Throwable {
        rh.findTheAppropriateTransactionForManualCategorization();
    }

    @And("Change category to {string}")
    public void changeCategoryTo(String category) throws Throwable {
        rh.changeCategoryTo(category);
    }

    @And("Split first category into {string}")
    public void splitFirstCategoryInto(String categoryName) throws Throwable {
        String xPath = "//*[@text='Split transaction'][2]/following-sibling::*[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        hp.ClickOnElement(element);
        String xPathForCategory = "//*[@text='"+categoryName+"']";
        By elWait = x.createByXpath(xPathForCategory);
        WaitHelpers.waitForElement(elWait);
        MobileElement elementForCategory = x.createMobileElementByXpath(xPathForCategory);
        hp.ClickOnElement(elementForCategory);
    }

    @And("Remember remaning amount of transaction for splitting under key {string}")
    public void rememberRemaningAmountOfTransactionForSplittingUnderKey(String key) {
        String xPath = "//*[@text='Remaining amount']//following-sibling::*[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        String amount = element.getText();
        amount = amount.replace("EUR","");
        amount = amount.replace(" ","");
        amount = amount.replace(".","");
        amount = amount.replace(",",".");
        DataManager.userObject.put(key,amount);
    }

    @And("Enter amount from key {string} into {string} split divided by {string}")
    public void enterAmountFromKeyIntoSplitDividedBy(String key, String index, String dividerString) {
        String xPath = "//*[@resource-id='nlb-amount-with-currency-field']["+index+"]";
        String amountString = (String) DataManager.userObject.get(key);
        Double amount = Double.parseDouble(amountString);
        Double divider = Double.parseDouble(dividerString);
        Double result = amount / divider;
        String textToEnter = result.toString();
        By element = x.createByXpath(xPath);
        hp.enterTextToMobileElement(textToEnter,element);
    }

    @And("Split second category into {string}")
    public void splitSecondCategoryInto(String categoryName) throws Throwable {
        String xPath = "(//*[@text='Select category'])[2]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        hp.ClickOnElement(element);
        String xPathForCategory = "//*[@text='"+categoryName+"']";
        By elWait = x.createByXpath(xPathForCategory);
        WaitHelpers.waitForElement(elWait);
        MobileElement elementForCategory = x.createMobileElementByXpath(xPathForCategory);
        hp.ClickOnElement(elementForCategory);
    }

    @And("Assert remaining amount is {string}")
    public void assertRemainingAmountIs(String expected) {
        String xPath = "//*[@text='Remaining amount']/following-sibling::*[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertEquals(expected,element.getText());
    }

    @And("Assert list of element by id {string} does not contain {string}")
    public void assertListOfElementByIdDoesNotContain(String id, String value) {
        List<MobileElement> mobileElementList = d.createMobileElementsByResourceId(id);
        for (MobileElement element : mobileElementList){
            Assert.assertFalse(element.getText().contains(value));
        }
    }

    @Then("Assert Card SMS Alarm is {string}")
    public void assertCardSMSAlarmIs(String expected) {
        String xPath = "//*[@text='Enable SMS Alarm']/following-sibling::*[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertEquals(expected,element.getText());
    }

    @And("Enter amount from key {string} into {string} split minus {string}")
    public void enterAmountFromKeyIntoSplitMinus(String key, String index, String minusString) {
        String xPath = "(//*[@resource-id='nlb-amount-with-currency-field'])["+index+"]";
        String amountString = (String) DataManager.userObject.get(key);
        Double amount = Double.parseDouble(amountString);
        Double minus = Double.parseDouble(minusString);
        Double result = amount - minus;
        String textToEnter = result.toString();
        By element = x.createByXpath(xPath);
        hp.enterTextToMobileElement(textToEnter,element);
    }

    @And("Enter amount {string} into {string} split")
    public void enterAmountIntoSplit(String amountString, String index) {
        String xPath = "//*[@resource-id='nlb-amount-with-currency-field']["+index+"]";
        By element = x.createByXpath(xPath);
        hp.enterTextToMobileElement(amountString,element);
    }

    @Then("Assert that product card of name {string} and detailed name {string} from Excel {string} for nlb credit card account are shown correctly")
    public void assertThatProductCardOfNameAndDetailedNameFromExcelForNlbCreditCardAccountAreShownCorrectly(String columnName1, String columnName2, String rowindex) {
        String productName = DataManager.getDataFromHashDatamap(rowindex,columnName1);
        String productIban = DataManager.getDataFromHashDatamap(rowindex,columnName2);
        String xPathForProductCard1 = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Credit Card\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']//following-sibling::*[@text='Available balance']";
        String xPathForCurrentBalance = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Credit Card\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']//following-sibling::*[@resource-id='nlb-value-product-primary-balance']";

        MobileElement elementForProductCard1 = x.createMobileElementByXpath(xPathForProductCard1);
        Assert.assertTrue(elementForProductCard1.isDisplayed());
        MobileElement elementForCurrentBalance = x.createMobileElementByXpath(xPathForCurrentBalance);
        String stringForCurrentBalance = elementForCurrentBalance.getAttribute("text");
        Assert.assertTrue(stringForCurrentBalance.matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{2}(.{1})EUR"));
    }

    @And("Assert that whole product card of credit card account with name {string} and iban {string} from Excel {string} acts as a clickable button")
    public void assertThatWholeProductCardOfCreditCardAccountWithNameAndIbanFromExcelActsAsAClickableButton(String columnName1, String columnName2, String rowindex) throws Throwable {
        String productName = DataManager.getDataFromHashDatamap(rowindex,columnName1);
        String productIban = DataManager.getDataFromHashDatamap(rowindex,columnName2);
        String xPathForProductName = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Credit Card\"]//following-sibling::*[@text='"+productName+"']";
        String xPathForProductIban = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Credit Card\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']";
        String xPathForProductCard1 = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Credit Card\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']//following-sibling::*[@text='Available balance']";
        String xPathForCurrentBalance = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Credit Card\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']//following-sibling::*[@resource-id='nlb-value-product-primary-balance']";
        String xPathForAssert = "//*[@resource-id='nlb-header-card']";
        String xPathForLoad = "//*[@resource-id='nlb-value-product-primary-balance']";

        MobileElement elementForProductName = x.createMobileElementByXpath(xPathForProductName);
        hp.ClickOnElement(elementForProductName);
        By elWait1 = x.createByXpath(xPathForAssert);
        WaitHelpers.waitForElement(elWait1);
        MobileElement elementForAssert1 = x.createMobileElementByXpath(xPathForAssert);
        Assert.assertTrue(elementForAssert1.isDisplayed());
        driver.navigate().back();
        By elForLoad1 = x.createByXpath(xPathForLoad);
        WaitHelpers.waitForElement(elForLoad1);

        MobileElement elementForProductIban = x.createMobileElementByXpath(xPathForProductIban);
        hp.ClickOnElement(elementForProductIban);
        By elWait2 = x.createByXpath(xPathForAssert);
        WaitHelpers.waitForElement(elWait2);
        MobileElement elementForAssert2 = x.createMobileElementByXpath(xPathForAssert);
        Assert.assertTrue(elementForAssert2.isDisplayed());
        driver.navigate().back();
        By elForLoad2 = x.createByXpath(xPathForLoad);
        WaitHelpers.waitForElement(elForLoad2);

        MobileElement elementForProductCard1 = x.createMobileElementByXpath(xPathForProductCard1);
        hp.ClickOnElement(elementForProductCard1);
        By elWait3 = x.createByXpath(xPathForAssert);
        WaitHelpers.waitForElement(elWait3);
        MobileElement elementForAssert3 = x.createMobileElementByXpath(xPathForAssert);
        Assert.assertTrue(elementForAssert3.isDisplayed());
        driver.navigate().back();
        By elForLoad3 = x.createByXpath(xPathForLoad);
        WaitHelpers.waitForElement(elForLoad3);

        MobileElement elementForCurrentBalance = x.createMobileElementByXpath(xPathForCurrentBalance);
        hp.ClickOnElement(elementForCurrentBalance);
        By elWait5 = x.createByXpath(xPathForAssert);
        WaitHelpers.waitForElement(elWait5);
        MobileElement elementForAssert5 = x.createMobileElementByXpath(xPathForAssert);
        Assert.assertTrue(elementForAssert5.isDisplayed());
        driver.navigate().back();
        By elForLoad5 = x.createByXpath(xPathForLoad);
        WaitHelpers.waitForElement(elForLoad5);
    }

    @And("Remember {string} currency rate for country {string} under key {string}")
    public void rememberCurrencyRateForCountryUnderKey(String rateType, String country, String key) {
        if (rateType.equals("sell")){
            String xPath = "//android.view.View[@content-desc='"+country+"']";
            By el = By.xpath(xPath);
            for(int i = 0; i<35; i++){
                if(hp.isElementNotPresent(el)){
                    hp.scrollDown(driver);
                }
            }

            String xPathForSellRate = "(//android.view.View[@content-desc='"+country+"']/following-sibling::*[@resource-id='nlb-exchange-sell'])[1]";
            MobileElement elementForSellRate = x.createMobileElementByXpath(xPathForSellRate);
            String value = elementForSellRate.getText();
            DataManager.userObject.put(key,value);
        }

        if (rateType.equals("buy")){
            String xPath = "//android.view.View[@content-desc='"+country+"']";
            By el = By.xpath(xPath);
            for(int i = 0; i<35; i++){
                if(hp.isElementNotPresent(el)){
                    hp.scrollDown(driver);
                }
            }

            String xPathForSellRate = "(//android.view.View[@content-desc='"+country+"']/following-sibling::*[@resource-id='nlb-exchange-buy'])[1]";
            MobileElement elementForSellRate = x.createMobileElementByXpath(xPathForSellRate);
            String value = elementForSellRate.getText();
            DataManager.userObject.put(key,value);
        }
    }

    @And("For currency exchange rate {string} and source amount {string} calculate destination amount")
    public void forCurrencyExchangeRateAndSourceAmountCalculateDestinationAmount(String sellKey, String sourceAmountString) {
        String sellExchangeRateString = (String) DataManager.userObject.get(sellKey);
        sellExchangeRateString = sellExchangeRateString.replace(",",".");
        Double sourceAmount = Double.parseDouble(sourceAmountString);
        Double sellExchangeRate = Double.parseDouble(sellExchangeRateString);
        Double destinationAmount = sourceAmount * sellExchangeRate;

        Double roundedValue = Math.round(destinationAmount * 100.0) / 100.0;
        DecimalFormat decimalFormat = new DecimalFormat("#.00");
        String expectedValue = decimalFormat.format(roundedValue);
        expectedValue = expectedValue.replace(".",",");
        DataManager.userObject.put("destination_amount",expectedValue);

        String xPath = "(//*[@resource-id='nlb-amount-with-currency-flag-field'])[2]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        String actualValue = element.getText();

        System.out.println(expectedValue);
        System.out.println(actualValue);

        //assertTrue(actualValue.contains(expectedValue.substring(0,4)));
        assertEquals(expectedValue,actualValue);
    }

    @And("Enter text {string} in {string} element by id {string}")
    public void enterTextInElementById(String text,String occ, String id) {
        String xPath = "(//*[@resource-id='"+id+"'])["+occ+"]";
        By element = x.createByXpath(xPath);
        hp.enterTextToMobileElement(text,element);
    }

    @And("Assert To currency in currency exchange review has value from key {string} and currency {string}")
    public void assertToCurrencyInCurrencyExchangeReviewHasValueFromKeyAndCurrency(String key, String currency) {
        String expectedValue = (String) DataManager.userObject.get(key);

        expectedValue = expectedValue.replace(",",".");
        Double expectedValueDouble = Double.parseDouble(expectedValue);
        String expectedValueSecond = String.format("%.2f", expectedValueDouble);
        expectedValueSecond = expectedValueSecond.replace(".",",");

        expectedValue = expectedValueSecond + " " + currency;
        MobileElement element = d.createMobileElementByResourceId("currency-exchange-review-exchange-to");
        String actualValue = element.getText();
        assertTrue(actualValue.startsWith(expectedValue.substring(0,4)));
        assertTrue(actualValue.endsWith(currency));
    }

    @And("Assert element by text from excel {string} columnName {string} is contained in element by id {string}")
    public void assertElementByTextFromExcelColumnNameIsContainedInElementById(String rowindex, String columnName, String id) {
        MobileElement element = d.createMobileElementByResourceId(id);
        String actualValue = element.getText();
        String expectedValue = DataManager.getDataFromHashDatamap(rowindex,columnName);
        Assert.assertTrue(actualValue.contains(expectedValue));
    }

    @And("Assert that amount for opened transaction in product screen is from key {string} and currency {string}")
    public void assertThatAmountForOpenedTransactionInProductScreenIsFromKeyAndCurrency(String key, String currency) {
        String destinationAmount = (String) DataManager.userObject.get(key);

        destinationAmount = destinationAmount.replace(",",".");
        Double expectedValueDouble = Double.parseDouble(destinationAmount);
        String expectedValueSecond = String.format("%.2f", expectedValueDouble);
        expectedValueSecond = expectedValueSecond.replace(".",",");

        String xPath = "(//*[@text='Amount']/following-sibling::*)[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        String actual = element.getText();
        System.out.println(actual);
        System.out.println(expectedValueSecond);

        Assert.assertTrue(actual.startsWith(expectedValueSecond.substring(0,4)));
        Assert.assertTrue(actual.endsWith(currency));
    }

    @And("Assert that foreign exchange rate for opened transaction in product screen is formed from {string} {string} key {string} {string}")
    public void assertThatForeignExchangeRateForOpenedTransactionInProductScreenIsFormedFromKey(String compOne, String compTwo, String key, String compFour) {
        String compThree = (String) DataManager.userObject.get(key);
        //compThree = compThree.replace(",",".");
        String expected = compOne+" "+compTwo+" = "+compThree+" "+compFour;

        String xPath = "(//*[@text='Foreign Exchange rate']/following-sibling::*)[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        String actual = element.getText();

        Assert.assertEquals(expected,actual);
    }

    @And("For currency exchange rate {string} and destination amount {string} calculate source amount")
    public void forCurrencyExchangeRateAndDestinationAmountCalculateSourceAmount(String sellKey, String destinationAmountString) {
        String sellExchangeRateString = (String) DataManager.userObject.get(sellKey);
        sellExchangeRateString = sellExchangeRateString.replace(",",".");
        Double destinationAmount = Double.parseDouble(destinationAmountString);
        Double sellExchangeRate = Double.parseDouble(sellExchangeRateString);
        Double sourceAmount = destinationAmount / sellExchangeRate;

        Double roundedValue = Math.round(sourceAmount * 100.0) / 100.0;

        DecimalFormat decimalFormat = new DecimalFormat("#.00");
        String expectedValue = decimalFormat.format(roundedValue);

        expectedValue = expectedValue.replace(".",",");
        DataManager.userObject.put("source_amount",expectedValue);

        String xPath = "(//*[@resource-id='nlb-amount-with-currency-flag-field'])[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        String actualValue = element.getText();
        System.out.println(expectedValue);
        System.out.println(actualValue);
        assertTrue(actualValue.contains(expectedValue.substring(0,4)));
    }

    @And("Assert I Wish to Exchange in currency exchange review has value from key {string} and currency {string}")
    public void assertIWishToExchangeInCurrencyExchangeReviewHasValueFromKeyAndCurrency(String key, String currency) {
        String expectedValue = (String) DataManager.userObject.get(key);

        expectedValue = expectedValue.replace(",",".");
        Double expectedValueDouble = Double.parseDouble(expectedValue);
        String expectedValueSecond = String.format("%.2f", expectedValueDouble);
        expectedValueSecond = expectedValueSecond.replace(".",",");

        MobileElement element = d.createMobileElementByResourceId("currency-exchange-review-exchange-from");
        String actualValue = element.getText();
        assertTrue(actualValue.contains(expectedValueSecond.substring(0,4)));
        assertTrue(actualValue.endsWith(currency));
    }

    @And("Assert text from key {string} for currency exchange amount in id {string}")
    public void assertTextFromKeyForCurrencyExchangeAmountInId(String key, String id) {
        String amount = (String) DataManager.userObject.get(key);
        amount = "−"+amount;
        MobileElement element = d.createMobileElementByResourceId(id);
        String actual = element.getText();
        Assert.assertEquals(actual,amount);
    }

    @And("Assert that amount for opened transaction in product screen is {string}")
    public void assertThatAmountForOpenedTransactionInProductScreenIs(String expected) {
        String xPath = "(//*[@text='Amount']/following-sibling::*)[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        String actual = element.getText();

        Assert.assertEquals(expected,actual);
    }

    @And("Wait for currency exchange to finish")
    public void waitForCurrencyExchangeToFinish() {
        WaitHelpers.waitForSeconds(15);
    }

    @And("Select currency {string} in currency selection for To currency in exchange screen")
    public void selectCurrencyInCurrencySelectionForToCurrencyInExchangeScreen(String currency) throws Throwable {
        String xPath = "(//*[@resource-id='nlb-amount-with-currency-flag-field-currency-alpha3'])[2]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        hp.ClickOnElement(element);

        String xPathForCurrency = "//*[contains(@text,'"+currency+"')]";
        By el = By.xpath(xPathForCurrency);
        for(int i = 0; i<35; i++){
            if(hp.isElementNotPresent(el)){
                hp.scrollDown(driver);
            }
        }
        MobileElement elementForCurrency = x.createMobileElementByXpath(xPathForCurrency);
        hp.ClickOnElement(elementForCurrency);
    }

    @And("Assert text {string} and currency {string} in element id {string}")
    public void assertTextAndCurrencyInElementId(String expectedOne, String expectedTwo, String id) {
        MobileElement element = d.createMobileElementByResourceId(id);
        String actual = element.getText();
        Assert.assertTrue(actual.startsWith(expectedOne));
        Assert.assertTrue(actual.endsWith(expectedTwo));
    }

    @And("Assert that amount for opened transaction in product screen has amount {string} and currency {string}")
    public void assertThatAmountForOpenedTransactionInProductScreenHasAmountAndCurrency(String amount, String currency) {
        String xPath = "(//*[@text='Amount']/following-sibling::*)[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        String actual = element.getText();
        Assert.assertTrue(actual.startsWith(amount));
        Assert.assertTrue(actual.endsWith(currency));
    }

    @And("Select account from Excel {string} columnName {string} as debtor in payment screen")
    public void selectAccountFromExcelColumnNameAsDebtorInPaymentScreen(String rowindex, String columnName) throws Throwable {
        String xPathForToEnterDebtorSelectionScreen = "//*[@text='Debtor']/following-sibling::*[@resource-id='nlb-card-container'][1]";
        MobileElement elementToEnterDebtorSelectionScreen = x.createMobileElementByXpath(xPathForToEnterDebtorSelectionScreen);
        hp.ClickOnElement(elementToEnterDebtorSelectionScreen);

        String text = DataManager.getDataFromHashDatamap(rowindex,columnName);
        WaitHelpers.waitForSeconds(3);
        String xPath = "//*[@text = '" + text + "']";
        By el = By.xpath(xPath);

        for(int i = 0; i<35; i++){
            if(hp.isElementNotPresent(el)){
                hp.scrollDown(driver);
            }
        }

        MobileElement element = x.createMobileElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Assert GOLOVEC invoice is shown after search")
    public void assertGOLOVECInvoiceIsShownAfterSearch() {
        String xPath = "//*[@text='ŠPORTNO DRUŠTVO GOLOVEC']//following-sibling::*[@text='54827493']//following-sibling::*[@text='RUSJANOV TRG 2, 1000 LJUBLJANA, SLOVENIA']";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert e invoice debtor is from Excel {string} columnName {string} {string}")
    public void assertEInvoiceDebtorIsFromExcelColumnName(String rowindex, String columnName1, String columnName2) {
        String accountName = DataManager.getDataFromHashDatamap(rowindex,columnName1);
        String accountIban = DataManager.getDataFromHashDatamap(rowindex,columnName2);
        String xPath = "//*[@resource-id='nlb-e-invoice-debtor-card']//*[@text='"+accountName+"']/following-sibling::*[@text='"+accountIban+"']";
        WebElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert element by text {string} has first following sibling contains text {string}")
    public void assertElementByTextHasFirstFollowingSiblingContainsText(String text, String expected) {
        String xPath = "(//*[@text='"+text+"']//following-sibling::*)[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.getText().contains(expected));
    }

    @Then("Assert shown accounts for invoice debit accounts are correct")
    public void assertShownAccountsForInvoiceDebitAccountsAreCorrect() {
        String accountIban = DataManager.getDataFromHashDatamap("1","personal_account_iban");
        String accountIban2 = DataManager.getDataFromHashDatamap("1","second_personal_account_iban");
        String xPath = "//*[@text='"+accountIban+"']";
        String xPath2 = "//*[@text='"+accountIban2+"']";
        MobileElement element = x.createMobileElementByXpath(xPath);
        MobileElement element2 = x.createMobileElementByXpath(xPath2);
        Assert.assertTrue(element.isDisplayed());
        Assert.assertTrue(element2.isDisplayed());

        List<MobileElement> mobileElementList = x.createMobileElementsByXpath("//*[@resource-id='nlb-card-container']");
        Assert.assertEquals(2,mobileElementList.size());
    }

    @And("Assert there are five edit icons on my profile screen")
    public void assertThereAreFiveEditIconsOnMyProfileScreen() {
        String xPath = "//android.view.View[@content-desc=\"edit\"]";
        List<MobileElement> mobileElementList = x.createMobileElementsByXpath(xPath);
        Assert.assertEquals(5,mobileElementList.size());
    }

    @Then("Click on edit button for {string} in user profile")
    public void clickOnEditButtonForInUserProfile(String text) throws Throwable {
        String xPath = "//*[@text='"+text+"']//following-sibling::android.view.View[@content-desc=\"edit\"]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Enter text {string} into EditText element")
    public void enterTextIntoEditTextElement(String text) {
        String xPath = "//android.widget.EditText";
        By element = x.createByXpath(xPath);
        hp.enterTextToMobileElement(text,element);
    }

    @And("Click on country {string} after search")
    public void clickOnCountryAfterSearch(String text) throws Throwable {
        String xPath = "(//*[@text='"+text+"'])[2]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Click on first standing order")
    public void clickOnFirstStandingOrder() throws Throwable {
        String xPath = "(//*[@resource-id='nlb-title'])[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Enter random amount in element by id {string} and remember it under key {string} in txt file")
    public void enterRandomAmountInElementByIdAndRememberItUnderKeyInTxtFile(String id, String key) {
        String amount = rh.returnRandomAmount();
        By el = d.createElementByResourceId(id);
        Utilities.saveTheValueToFile(amount,key);
        hp.enterTextToMobileElement(amount,el);
    }

    @And("Assert amount from txt file under key {string} in id {string}")
    public void assertAmountFromTxtFileUnderKeyInId(String key, String id) {
        String amount = Utilities.getDataFromTxtFileUnderKey(key);
        amount = amount.replace(".",",");
        MobileElement element = d.createMobileElementByResourceId(id);
        Assert.assertEquals(amount,element.getText());
    }

    @And("Assert element by id {string} has following sibling with text {string}")
    public void assertElementByIdHasFollowingSiblingWithText(String id, String expected) {
        String xPath = "//*[@resource-id='"+id+"']/following-sibling::*[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertEquals(expected,element.getText());
    }

    @And("Assert standing order text in second step of payment is correct for date {string} day in the future")
    public void assertStandingOrderTextInSecondStepOfPaymentIsCorrectForDateDayInTheFuture(String day) {
        int i = Integer.parseInt(day);
        String date = ActionApiHelpers.getTodayDatePlusXDaysInFormat(i,"dd. M. yyyy");
        date = date.replace(" "," ");
        String xPath = "//*[@text='Your standing order will be processed monthly, starting with "+date+" and until you cancel it in line with Payments execution schedule .']";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert element by id {string} has date {string} day in the future using format {string}")
    public void assertElementByIdHasDateDayInTheFutureUsingFormat(String id, String day, String format) {
        MobileElement element  = d.createMobileElementByResourceId(id);
        int i = Integer.parseInt(day);
        String expected = ActionApiHelpers.getTodayDatePlusXDaysInFormat(i,format);
        Assert.assertEquals(expected,element.getAttribute("text").replace(" ",""));
    }

    @And("Assert that text {string} has first following sibling with text from txt file under key {string} and currency {string}")
    public void assertThatTextHasFirstFollowingSiblingWithTextFromTxtFileUnderKeyAndCurrency(String textFirst, String key, String currency) {
        String xPath = "//*[@text='"+textFirst+"']//following-sibling::*[1]";
        String amount = Utilities.getDataFromTxtFileUnderKey(key);
        amount = amount.replace(".",",");
        String expected = amount + " " + currency;
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertEquals(expected,element.getText());
    }

    @And("Assert that second text {string} has first following sibling that contains text from Excel {string} columnName {string}")
    public void assertThatSecondTextHasFirstFollowingSiblingThatContainsTextFromExcelColumnName(String textFirst, String rowindex, String columnName) {
        String textSecond = DataManager.getDataFromHashDatamap(rowindex,columnName);
        String xPath = "//*[@text='"+textFirst+"'][2]//following-sibling::*[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        System.out.println(textSecond);
        System.out.println(element.getText());
        Assert.assertTrue(element.getText().contains(textSecond));
    }

    @And("Assert that text {string} has first following sibling that contains from Excel {string} columnName {string} with no space")
    public void assertThatTextHasFirstFollowingSiblingThatContainsFromExcelColumnNameWithNoSpace(String textFirst, String rowindex, String columnName) {
        String textSecond = DataManager.getDataFromHashDatamap(rowindex,columnName);
        textSecond = textSecond.replace(" ","");
        String xPath = "//*[@text='"+textFirst+"']//following-sibling::*[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        System.out.println(textSecond);
        System.out.println(element.getText());
        Assert.assertTrue(element.getText().contains(textSecond));
    }

    @And("Assert that amount for opened standing order is from txt file under key {string}")
    public void assertThatAmountForOpenedStandingOrderIsFromTxtFileUnderKey(String key) {
        String amount = Utilities.getDataFromTxtFileUnderKey(key);
        amount = amount.replace(".",",");
        MobileElement element = d.createMobileElementByResourceId("nlb-amount");
        Assert.assertEquals(amount,element.getText());
    }

    @And("Assert that payment date for standing order is {string} day in future with correct format")
    public void assertThatPaymentDateForStandingOrderIsDayInFutureWithCorrectFormat(String day) {
        int i = Integer.parseInt(day);
        String date = ActionApiHelpers.getTodayDatePlusXDaysInFormat(i,"dd");
        String xPath = "//*[@text='Payment day']//following-sibling::*[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.getText().contains(date));
        Assert.assertTrue(element.getText().contains("of month"));
    }

    @And("Assert that text {string} has first following sibling with text from txt file under key {string} and currency {string} with nothing else")
    public void assertThatTextHasFirstFollowingSiblingWithTextFromTxtFileUnderKeyAndCurrencyWithNothingElse(String textFirst, String key, String currency) {
        String xPath = "//*[@text='"+textFirst+"']//following-sibling::*[1]";
        String amount = Utilities.getDataFromTxtFileUnderKey(key);
        String expected = amount + " " + currency;
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertEquals(expected,element.getText());
    }

    @Then("Scroll until standing order with text from txt file under key {string} is in view and click")
    public void scrollUntilStandingOrderWithTextFromTxtFileUnderKeyIsInViewAndClick(String key) throws Exception {
        String purpose = Utilities.getDataFromTxtFileUnderKey(key);
        purpose = purpose.replace(".",",");
        //MobileElement element = (MobileElement) driver.findElement(MobileBy.AndroidUIAutomator("new UiScrollable(new UiSelector().scrollable(true))" + ".scrollIntoView(new UiSelector().textContains(\"" + purpose +"\"))"));
        //hp.ClickOnElement(element);
        WaitHelpers.waitForSeconds(5);
        String xPath = "//*[@text = '" + purpose + "']";
        By el = By.xpath(xPath);

        for(int i = 0; i<20; i++){
            if(hp.isElementNotPresent(el)){
                hp.scrollDown(driver);
            }
        }
        hp.clickElement(el);

    }

    @And("Assert default end date for standing order is correct")
    public void assertDefaultEndDateForStandingOrderIsCorrect() {
        MobileElement element = d.createMobileElementByResourceId("nlb-input-standing-order-end-date");
        String date = ActionApiHelpers.getTodayDatePlusXDaysYMonthsZYearsInFormat(1,0,1,"dd.M.yyyy");
        Assert.assertEquals(date,element.getAttribute("text").replace(" ",""));
    }

    @And("Assert standing order text in second step of payment is correct for date {string} day in the future with default end date")
    public void assertStandingOrderTextInSecondStepOfPaymentIsCorrectForDateDayInTheFutureWithDefaultEndDate(String day) {
        int i = Integer.parseInt(day);
        String date = ActionApiHelpers.getTodayDatePlusXDaysInFormat(i,"dd. M. yyyy");
        date = date.replace(" "," ");
        String dateIn = ActionApiHelpers.getTodayDatePlusXDaysYMonthsZYearsInFormat(1,0,1,"dd. M. yyyy");
        dateIn = dateIn.replace(" "," ");
        String xPath = "//*[@text='Your standing order will be processed monthly, starting with "+date+" and until "+dateIn+" in line with Payments execution schedule.']";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert that text {string} has first following sibling with future date {string} and {string} year in format {string}")
    public void assertThatTextHasFirstFollowingSiblingWithFutureDateAndYearInFormat(String textFirst, String daysInFuture,String yearInFuture, String dateFormat) {
        String xPath = "//*[@text='"+textFirst+"']//following-sibling::*[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        String futureDate = ActionApiHelpers.getTodayDatePlusXDaysYMonthsZYearsInFormat(Integer.parseInt(daysInFuture),0,Integer.parseInt(yearInFuture),dateFormat);
        String actualDate = element.getAttribute("text").replaceAll("\u00A0", "");
        Assert.assertEquals(futureDate, actualDate);
    }

    @And("Assert standing order with text from txt file under key {string} is not displayed")
    public void assertStandingOrderWithTextFromTxtFileUnderKeyIsNotDisplayed(String key) throws Throwable {
        String purpose = Utilities.getDataFromTxtFileUnderKey(key);
        purpose = purpose.replace(".",",");
        By element = tx.createElementByTextContains(purpose);
        boolean isElementDisplayed = hp.isElementDisplayed(element, 5, 100);
        Assert.assertFalse(isElementDisplayed);
    }

    @And("Assert saved contacts are displayed in correct order")
    public void assertSavedContactsAreDisplayedInCorrectOrder() {
        String xPath = "//*[@resource-id='nlb-icon-row']//android.view.View/android.widget.TextView[2]";
        List<MobileElement> elements = x.createElementsByXpath(xPath);
        List<String> actualOrder = new ArrayList<>();
        for (MobileElement element : elements) {
            actualOrder.add(element.getAttribute("name"));
        }
        List<String> expectedOrder = actualOrder;
        Collections.sort(expectedOrder);
        Assert.assertEquals(expectedOrder, actualOrder);
    }

    @And("Assert there are five payments in last five payments")
    public void assertThereAreFivePaymentsInLastFivePayments() {
        List<MobileElement> mobileElementList = d.createMobileElementsByResourceId("nlb-purpose");
        Assert.assertEquals(5,mobileElementList.size());

        List<String> actualTexts = new ArrayList<>();
        for (MobileElement el : mobileElementList) {
            actualTexts.add(el.getText().trim());
        }

        // (opciono) ispiši radi debug-a
        System.out.println("Actual: " + actualTexts);

        // 3A) Jednostavna egzaktna provera na TEST5..TEST1
        List<String> expectedTexts = Arrays.asList("TEST5", "TEST4", "TEST3", "TEST2", "TEST1");
        Assert.assertEquals(expectedTexts, actualTexts);
    }

    @Then("Assert category filter is working correctly for category {string}")
    public void assertCategoryFilterIsWorkingCorrectlyForCategory(String category) throws Throwable {
        for (int i = 1; i <= 3; i++){
            String xPath = "(//*[@resource-id='nlb-title'])["+i+"]";
            MobileElement element = x.createMobileElementByXpath(xPath);
            hp.ClickOnElement(element);
            String xPathForCategory1 = "//*[@text='Dom']";
            MobileElement elementForCategory = x.createMobileElementByXpath(xPathForCategory1);
            Assert.assertTrue(elementForCategory.isDisplayed());
            String xPathForBack = "//android.view.View[@content-desc=\"Back\"]";
            MobileElement elementForBack = x.createMobileElementByXpath(xPathForBack);
            hp.ClickOnElement(elementForBack);
            WaitHelpers.waitForSeconds(3);
        }
    }

    @And("Assert element by id {string} with regex {string}")
    public void assertElementByIdWithRegex(String id, String regex) {
        MobileElement element = d.createMobileElementByResourceId(id);
        Assert.assertTrue(element.getText().matches(regex));
    }

    @And("Check if PIN is needed and complete payment for {string} with assert")
    public void checkIfPINIsNeededAndCompletePaymentForWithAssert(String text) throws Throwable {
        rh.checkIfPINIsNeededAndCompletePaymentForWithAssert(text);
    }

    @And("Assert Debtor in Own Account Transfer has content description {string} and from Excel {string} account name {string} and iban {string} with currency {string}")
    public void assertDebtorInOwnAccountTransferHasContentDescriptionAndFromExcelAccountNameAndIbanWithCurrency(String contentDesc, String rowindex, String columnName1, String columnName2, String currency) {
        String accountName = DataManager.getDataFromHashDatamap(rowindex,columnName1);
        String accountIban = DataManager.getDataFromHashDatamap(rowindex,columnName2);
        String xPath = "//*[@text='Debtor']//following-sibling::*[@resource-id='nlb-card-container']//*[@content-desc='"+contentDesc+"']//following-sibling::*[@text='"+accountName+"']//following-sibling::*[@text='"+accountIban+"']";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
        String xPathForCurrency = "//*[@text='Debtor']//following-sibling::*[@resource-id='nlb-card-container']//*[@content-desc='Current account']//following-sibling::*[@text='"+accountName+"']//following-sibling::*[@text='"+accountIban+"']//following-sibling::*";
        MobileElement elementForCurrency = x.createMobileElementByXpath(xPathForCurrency);
        String actualCurrency = elementForCurrency.getText();
        Assert.assertTrue(actualCurrency.endsWith(currency));
    }

    @And("Wait for SEPA DD to filter")
    public void waitForSEPADDToFilter() {
        WaitHelpers.waitForSeconds(5);
    }

    @And("Assert SEPA DD is grouped by months")
    public void assertSEPADDIsGroupedByMonths() {
        String xPathForDateOfFirstPayment = "(//*[@resource-id='nlb-date'])[1]";
        MobileElement elementForDateOfFirstPayment = x.createMobileElementByXpath(xPathForDateOfFirstPayment);
        String date = elementForDateOfFirstPayment.getText();
        date = date.replace(" ","");
        String dateNew = rh.returnDateInFormatMMMMyyyyIfGivenddMMyyyy(date);
        String xPathgroupByMonths = "//*[@text='"+dateNew+"']";
        MobileElement elementGroupByMonths = x.createMobileElementByXpath(xPathgroupByMonths);
        Assert.assertTrue(elementGroupByMonths.isDisplayed());
    }

    @Then("Assert that text {string} has first following sibling that is filled")
    public void assertThatTextHasFirstFollowingSiblingThatIsFilled(String textFirst) {
        String xPath = "//*[@text='"+textFirst+"']//following-sibling::*[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.getText().length()>=3);
    }

    @And("Assert element by exact text {string} is not displayed")
    public void assertElementByExactTextIsNotDisplayed(String text) throws Throwable {
        By element = tx.createElementByText(text);
        boolean isElementDisplayed = hp.isElementDisplayed(element, 5, 100);
        Assert.assertFalse(isElementDisplayed);
    }

    @And("Assert there are {string} elements by id {string}")
    public void assertThereAreElementsById(String expectedNumberString, String id) {
        List<MobileElement> mobileElementList = d.createMobileElementsByResourceId(id);
        int expectedNumber = Integer.parseInt(expectedNumberString);
        Assert.assertEquals(expectedNumber,mobileElementList.size());
    }

    @And("Remember available balance in currency {string} under key {string}")
    public void rememberAvailableBalanceInCurrencyUnderKey(String currency, String key) throws Exception {
        if(Base.getDataFromFileConf(Hooks.rowinConfExcel,"DEVICE_NAME").contains("HUAWEI")){
            List<String> listOfBalance = rh.scrollWithCordinatesAndPutEveryElementWithIdIntoList(650,485,100,485,"nlb-product-details-primary-balance");

            String result = null;
            for (String amount : listOfBalance) {
                if (amount.endsWith(" " + currency)) {
                    result = amount;
                    break; // Stop searching after the first match
                }
            }

            result = result.replace(" "+currency+"","");
            result = result.replace(".","").replace(",",".");
            System.out.println(result);
            DataManager.userObject.put(key,result);
        } else {
            List<String> listOfBalance = rh.scrollWithCordinatesAndPutEveryElementWithIdIntoList(900,650,100,650,"nlb-product-details-primary-balance");

            String result = null;
            for (String amount : listOfBalance) {
                if (amount.endsWith(" " + currency)) {
                    result = amount;
                    break; // Stop searching after the first match
                }
            }

            result = result.replace(" "+currency+"","");
            result = result.replace(".","").replace(",",".");
            System.out.println(result);
            DataManager.userObject.put(key,result);
        }
    }

    @And("Check if current balance is lowered by {string} using balance from key {string} for currency {string}")
    public void checkIfCurrentBalanceIsLoweredByUsingBalanceFromKeyForCurrency(String amountString, String key, String currency) throws Exception {
        if(Base.getDataFromFileConf(Hooks.rowinConfExcel,"DEVICE_NAME").contains("HUAWEI")){
            String previousAmountString = (String) DataManager.userObject.get(key);
            Double previousAmount = Double.parseDouble(previousAmountString);
            Double amount = Double.parseDouble(amountString);
            Double expectedAmount = previousAmount - amount;

            List<String> listOfBalance = rh.scrollWithCordinatesAndPutEveryElementWithIdIntoList(650,485,100,485,"nlb-product-details-primary-balance");

            String result = null;
            for (String amountS : listOfBalance) {
                if (amountS.endsWith(" " + currency)) {
                    result = amountS;
                    break; // Stop searching after the first match
                }
            }
            System.out.println(result);
            result = result.replace(" "+currency,"");
            result = result.replace(".","").replace(",",".");

            Double actualAmount = Double.parseDouble(result);
            System.out.printf("%.2f%n",expectedAmount);
            System.out.printf("%.2f%n",actualAmount);

            Assert.assertEquals(expectedAmount,actualAmount);
        } else {
            String previousAmountString = (String) DataManager.userObject.get(key);
            Double previousAmount = Double.parseDouble(previousAmountString);
            Double amount = Double.parseDouble(amountString);
            Double expectedAmount = previousAmount - amount;

            List<String> listOfBalance = rh.scrollWithCordinatesAndPutEveryElementWithIdIntoList(900,650,100,650,"nlb-product-details-primary-balance");

            String result = null;
            for (String amountS : listOfBalance) {
                if (amountS.endsWith(" " + currency)) {
                    result = amountS;
                    break; // Stop searching after the first match
                }
            }
            System.out.println(result);
            result = result.replace(" "+currency,"");
            result = result.replace(".","").replace(",",".");

            Double actualAmount = Double.parseDouble(result);
            System.out.printf("%.2f%n",expectedAmount);
            System.out.printf("%.2f%n",actualAmount);

            Assert.assertEquals(expectedAmount,actualAmount);
        }


    }

    @And("Check if current balance is increased by {string} using balance from key {string} for currency {string}")
    public void checkIfCurrentBalanceIsIncreasedByUsingBalanceFromKeyForCurrency(String amountString, String key, String currency) throws Exception {
        String previousAmountString = (String) DataManager.userObject.get(key);
        Double previousAmount = Double.parseDouble(previousAmountString);
        Double amount = Double.parseDouble(amountString);
        Double expectedAmount = previousAmount + amount;

        List<String> listOfBalance = rh.scrollWithCordinatesAndPutEveryElementWithIdIntoList(900,400,100,400,"nlb-product-details-primary-balance");

        String result = null;
        for (String amountS : listOfBalance) {
            if (amountS.endsWith(" " + currency)) {
                result = amountS;
                break; // Stop searching after the first match
            }
        }
        System.out.println(result);
        result = result.replace(" "+currency,"");
        result = result.replace(".","").replace(",",".");

        Double actualAmount = Double.parseDouble(result);
        System.out.printf("%.2f%n",expectedAmount);
        System.out.printf("%.2f%n",actualAmount);

        Assert.assertEquals(expectedAmount,actualAmount);
    }

    @And("Click on date filter for NLB Funds")
    public void clickOnDateFilterForNLBFunds() throws Throwable {
        String xPath = "(//*[@resource-id='nlb-icon-button'])[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Click on search for NLB Funds")
    public void clickOnSearchForNLBFunds() throws Throwable {
        String xPath = "(//*[@resource-id='nlb-icon-button'])[2]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Remember current balance for favorite account under key {string}")
    public void rememberCurrentBalanceForFavoriteAccountUnderKey(String key) {
        String xPath = "(//*[@resource-id='nlb-value-product-primary-balance'])[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        String amount = element.getText();
        DataManager.userObject.put(key,amount);
    }

    @And("Remember available balance for favorite account under key {string}")
    public void rememberAvailableBalanceForFavoriteAccountUnderKey(String key) {
        String xPath = "(//*[@resource-id='nlb-value-product-secondary-balance'])[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        String amount = element.getText();
        DataManager.userObject.put(key,amount);
    }

    @And("Assert active account in dashboard is from Excel {string} with name {string} and iban {string} and balance under keys {string} and {string}")
    public void assertActiveAccountInDashboardIsFromExcelWithNameAndIbanAndBalanceUnderKeysAnd(String rowindex, String columnName1, String columnName2, String key1, String key2) {
        String accountName = DataManager.getDataFromHashDatamap(rowindex,columnName1);
        String accountIban = DataManager.getDataFromHashDatamap(rowindex,columnName2);
        String xPathForName = "//*[@text='"+accountName+"']";
        MobileElement elementForName = x.createMobileElementByXpath(xPathForName);
        Assert.assertTrue(elementForName.isDisplayed());
        String xPathForIban = "//*[@text='"+accountIban+"']";
        MobileElement elementForIban = x.createMobileElementByXpath(xPathForIban);
        Assert.assertTrue(elementForIban.isDisplayed());
        String xPathForBalance = "//*[@text='"+DataManager.userObject.get(key1)+"']";
        MobileElement elementForBalance = x.createMobileElementByXpath(xPathForBalance);
        Assert.assertTrue(elementForBalance.isDisplayed());
        String xPathForAvailableBalance = "//*[@text='"+DataManager.userObject.get(key2)+"']";
        MobileElement elementForAvailableBalance = x.createMobileElementByXpath(xPathForAvailableBalance);
        Assert.assertTrue(elementForAvailableBalance.isDisplayed());
    }

    @And("Click Next arrow in dashboard")
    public void clickNextArrowInDashboard() throws Throwable {
        String xPath = "//*[@resource-id='nlb-product-card-button-right']";
        MobileElement element = x.createMobileElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Click Previous arrow in dashboard")
    public void clickPreviousArrowInDashboard() throws Throwable {
        String xPath = "//*[@resource-id='nlb-product-card-button-left']";
        MobileElement element = x.createMobileElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Expand latest transactions in dashboard")
    public void expandLatestTransactionsInDashboard() throws Throwable {
        String xPath = "//*[@text='All transactions']/ancestor::android.view.View[1]/ancestor::android.view.View[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Remember first {string} transaction purposes under key {string}")
    public void rememberFirstTransactionPurposesUnderKey(String count, String key) {
        List<MobileElement> listOfPurposes = d.createMobileElementsByResourceId("nlb-title");
        List<String> listOfPurposesNew = new ArrayList<>();
        for (int i = 0; i < Integer.parseInt(count); i++) {
            listOfPurposesNew.add(listOfPurposes.get(i).getText());
        }
        DataManager.userObject.put(key,listOfPurposesNew);
    }

    @And("Assert transactions shown in dashboard are the same as in key {string}")
    public void assertTransactionsShownInDashboardAreTheSameAsInKey(String key) {
        List<MobileElement> listOfPurposes = d.createMobileElementsByResourceId("nlb-title");
        List<String> listOfPurposesNew = new ArrayList<>();
        for (MobileElement element : listOfPurposes) {
            listOfPurposesNew.add(element.getText());
        }
        List<String> listOfPurposesOld = (List<String>) DataManager.userObject.get(key);
        Assert.assertEquals(listOfPurposesOld,listOfPurposesNew);
    }

    @And("Remember latest transaction purposes from dashboard under key {string}")
    public void rememberLatestTransactionPurposesFromDashboardUnderKey(String key) {
        List<MobileElement> listOfPurposes = d.createMobileElementsByResourceId("nlb-title");
        List<String> listOfPurposesNew = new ArrayList<>();
        for (MobileElement element : listOfPurposes) {
            listOfPurposesNew.add(element.getText());
        }
        DataManager.userObject.put(key,listOfPurposesNew);
    }

    @And("Assert latest transaction purposes from dashboard are not the same as in key {string}")
    public void assertLatestTransactionPurposesFromDashboardAreNotTheSameAsInKey(String key) {
        List<MobileElement> listOfPurposes = d.createMobileElementsByResourceId("nlb-title");
        List<String> listOfPurposesNew = new ArrayList<>();
        for (MobileElement element : listOfPurposes) {
            listOfPurposesNew.add(element.getText());
        }
        List<String> listOfPurposesOld = (List<String>) DataManager.userObject.get(key);
        Assert.assertNotEquals(listOfPurposesOld,listOfPurposesNew);
    }

    @And("Click filter button in e-invoice list")
    public void clickFilterButtonInEInvoiceList() throws Throwable {
        String xPath = "(//*[@resource-id='nlb-icon-button'])[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Wait for e-invoice to filter")
    public void waitForEInvoiceToFilter() {
        WaitHelpers.waitForSeconds(10);
    }

    @And("Remember text of first following sibling of element by text {string} in txt under key {string}")
    public void rememberTextOfFirstFollowingSiblingOfElementByTextInTxtUnderKey(String text, String key) {
        String xPath = "//*[@text='"+text+"']//following-sibling::*[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        String textToRemember = element.getAttribute("text");
        Utilities.saveTheValueToFile(textToRemember, key);
        Utilities.saveTheValueToFile(textToRemember.replaceAll("\\s+", ""), key+"_noSpace");
    }

    @And("Assert SEPA Recipient has account name and iban from keys {string} and {string}")
    public void assertSEPARecipientHasAccountNameAndIbanFromKeysAnd(String key1, String key2) {
        String accountName = Utilities.getDataFromTxtFileUnderKey(key1);
        String accountIban = Utilities.getDataFromTxtFileUnderKey(key2);
        String xPath = "//*[@text='Recipient']//following-sibling::*[1]//*[@text='"+accountName+"']/following-sibling::*[@text='"+accountIban+"']";
        MobileElement elementForName = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(elementForName.isDisplayed());
    }

    @And("Click on element by text from key {string} from txt file")
    public void clickOnElementByTextFromKeyFromTxtFile(String key) throws Exception {
        String text = Utilities.getDataFromTxtFileUnderKey(key);
        By element = tx.createElementByText(text);
        hp.clickElement(element);
    }

    @And("Assert text from element by id {string} is contained within text from key {string}")
    public void assertTextFromElementByIdIsContainedWithinTextFromKey(String id, String key) {
        MobileElement element = d.createMobileElementByResourceId(id);
        String text = element.getText().replaceAll("\\s+", "").replace(":","");
        String textFromKey = Utilities.getDataFromTxtFileUnderKey(key);
        textFromKey = textFromKey.replaceAll("\\s+", "");
        Assert.assertTrue(textFromKey.contains(text));
    }

    @And("Assert text from key {string} is contained within text from element by id {string}")
    public void assertTextFromKeyIsContainedWithinTextFromElementById(String key, String id) {
        MobileElement element = d.createMobileElementByResourceId(id);
        String text = element.getText();
        String textFromKey = Utilities.getDataFromTxtFileUnderKey(key);
        System.out.println(textFromKey);
        System.out.println(text);
        Assert.assertTrue(text.contains(textFromKey));
    }

    @And("Assert element by text {string} has first following sibling from key {string}")
    public void assertElementByTextHasFirstFollowingSiblingFromKey(String text, String key) {
        String expected = Utilities.getDataFromTxtFileUnderKey(key);
        String xPath = "//*[@text='"+text+"']//following-sibling::*[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertEquals(expected,element.getText());
    }

    @And("Assert that second text {string} has first following sibling with text from key {string}")
    public void assertThatSecondTextHasFirstFollowingSiblingWithTextFromKey(String text, String key) {
        String expected = Utilities.getDataFromTxtFileUnderKey(key);
        String xPath = "//*[@text='"+text+"'][2]//following-sibling::*[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertEquals(expected,element.getText());
    }

    @And("Assert that second text {string} has first following sibling with text from key {string} with no spaces")
    public void assertThatSecondTextHasFirstFollowingSiblingWithTextFromKeyWithNoSpaces(String text, String key) {
        String expected = Utilities.getDataFromTxtFileUnderKey(key);
        String xPath = "//*[@text='"+text+"'][2]//following-sibling::*[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertEquals(expected,element.getText().replaceAll("\\s+", ""));
    }

    @And("Assert that text {string} has first following sibling with text from key {string}")
    public void assertThatTextHasFirstFollowingSiblingWithTextFromKey(String text, String key) {
        String expected = Utilities.getDataFromTxtFileUnderKey(key);
        String xPath = "//*[@text='"+text+"']//following-sibling::*[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        System.out.println(expected);
        System.out.println(element.getText());
        Assert.assertEquals(expected,element.getText());
    }

    @And("Assert element by text {string} has first following sibling from key {string} with currency {string}")
    public void assertElementByTextHasFirstFollowingSiblingFromKeyWithCurrency(String text, String key, String currency) {
        String expected = Utilities.getDataFromTxtFileUnderKey(key);
        expected = expected + " " + currency;
        String xPath = "//*[@text='"+text+"']//following-sibling::*[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertEquals(expected,element.getText());
    }

    @And("Assert that text {string} has first following sibling that contains text from key {string} with no spaces")
    public void assertThatTextHasFirstFollowingSiblingThatContainsTextFromKeyWithNoSpaces(String text, String key) {
        String expected = Utilities.getDataFromTxtFileUnderKey(key);
        String xPath = "//*[@text='"+text+"']//following-sibling::*[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        System.out.println(expected);
        System.out.println(element.getText());
        Assert.assertTrue(element.getText().replaceAll("\\s+","").contains(expected));
    }

    @And("Assert first product shown in my products is favorite account from Excel {string} columnName {string}")
    public void assertFirstProductShownInMyProductsIsFavoriteAccountFromExcelColumnName(String rowindex, String columnName) {
        String accountName = DataManager.getDataFromHashDatamap(rowindex,columnName);
        String xPath = "(//*[@resource-id='nlb-value-product-account-id'])[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertEquals(accountName,element.getText());

    }

    @And("Assert shown transaction for sending complaint is correct")
    public void assertShownTransactionForSendingComplaintIsCorrect() {
        String date = DataManager.userObject.get("date").toString();
        String amount = DataManager.userObject.get("amount").toString();
        String purpose = DataManager.userObject.get("purpose").toString();
        String currency = DataManager.userObject.get("currency").toString();
        String details = DataManager.userObject.get("details").toString();

        String xPath = "//*[@text='"+date+"']/following-sibling::*[@text='"+purpose+"']/following-sibling::*[@text='"+details+"']/following-sibling::*[@text='"+currency+"']//following-sibling::*[@text='"+amount+"']";
        WebElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert {string} is selected in complaint type")
    public void assertIsSelectedInComplaintType(String text) {
        if (text.equals("Inquiry")){
            String xPath = "(//*[@resource-id='nlb-radio-complaint-type'])[1]";
            MobileElement element = x.createMobileElementByXpath(xPath);
            Assert.assertEquals("true",element.getAttribute("checked"));
        } else if (text.equals("Complaint")){
            String xPath = "(//*[@resource-id='nlb-radio-complaint-type'])[2]";
            MobileElement element = x.createMobileElementByXpath(xPath);
            Assert.assertEquals("true",element.getAttribute("checked"));
        }
    }

    @And("Click on {string} type in complaint")
    public void clickOnTypeInComplaint(String text) throws Throwable {
        if (text.equals("Inquiry")){
            String xPath = "(//*[@resource-id='nlb-radio-complaint-type'])[1]";
            MobileElement element = x.createMobileElementByXpath(xPath);
            hp.ClickOnElement(element);
        } else if (text.equals("Complaint")){
            String xPath = "(//*[@resource-id='nlb-radio-complaint-type'])[2]";
            MobileElement element = x.createMobileElementByXpath(xPath);
            hp.ClickOnElement(element);
        }
    }

    @And("Assert that text {string} has first following sibling that matches regex {string}")
    public void assertThatTextHasFirstFollowingSiblingThatMatchesRegex(String text, String regex) {
        String xPath = "(//*[@text='"+text+"']/following-sibling::*)[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert amount for refund request is from keys {string} and {string}")
    public void assertAmountForRefundRequestIsFromKeysAnd(String key1, String key2) {
        String amount = DataManager.userObject.get(key1).toString();
        String currency = DataManager.userObject.get(key2).toString();
        String expected = amount+" "+currency;
        WebElement element = d.createMobileElementByResourceId("amount-text-value");
        Assert.assertEquals(expected,element.getText());
    }

    @And("Assert standing order start date has correct maximum value")
    public void assertStandingOrderStartDateHasCorrectMaximumValue() throws Exception {
        int year = rh.returnMaximalValidStartYearForStandingOrder();
        int month = rh.returnMaximalValidStartMonthForStandingOrder();
        int day = rh.returnMaximalValidStartDayForStandingOrder();

        int amountOfMonths = rh.getHowManyMonthsAreBetweenTodayAndSelectedDate(year, month, day);

        if(amountOfMonths>0){
            for(int i=0; i<amountOfMonths; i++){
                By el = x.createByXpath("//*[@content-desc='Change to previous month']/following-sibling::android.widget.Button");
                hp.clickElement(el);
            }
        }
        else if (amountOfMonths<0){
            for(int i=0; i<Math.abs(amountOfMonths); i++){
                By el = x.createByXpath("//*[@content-desc='Change to next month']/following-sibling::android.widget.Button");
                hp.clickElement(el);
            }
        }

        String date = rh.getDateInFormat(year, month, day, "EEEE, MMMM d, yyyy");
        String xPath = "//*[contains(@text, '" + date + "')]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertEquals("true",element.getAttribute("enabled"));

        String date2 = rh.getFormattedDate(year, month, day+1, "EEEE, MMMM d, yyyy");
        String xPath2 = "//*[contains(@text, '" + date2 + "')]";
        MobileElement element2 = x.createMobileElementByXpath(xPath2);
        Assert.assertEquals("false",element2.getAttribute("enabled"));
    }

    @And("Assert standing order start date has correct minimum value")
    public void assertStandingOrderStartDateHasCorrectMinimumValue() throws Exception {
        int year = rh.returnCurrentYear();
        int month = rh.returnCurrentMonth();
        int day = rh.returnMinimalValidStartDayForStandingOrder();

        int amountOfMonths = rh.getHowManyMonthsAreBetweenTodayAndSelectedDate(year, month, day);

        if(amountOfMonths>0){
            for(int i=0; i<amountOfMonths; i++){
                By el = x.createByXpath("//*[@content-desc='Change to previous month']/following-sibling::android.widget.Button");
                hp.clickElement(el);
            }
        }
        else if (amountOfMonths<0){
            for(int i=0; i<Math.abs(amountOfMonths); i++){
                By el = x.createByXpath("//*[@content-desc='Change to next month']/following-sibling::android.widget.Button");
                hp.clickElement(el);
            }
        }

        String date = rh.getDateInFormat(year, month, day, "EEEE, MMMM d, yyyy");
        String xPath = "//*[contains(@text, '" + date + "')]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertEquals("true",element.getAttribute("enabled"));

        String date2 = rh.getFormattedDate(year, month, day-1, "EEEE, MMMM d, yyyy");
        String xPath2 = "//*[contains(@text, '" + date2 + "')]";
        MobileElement element2 = x.createMobileElementByXpath(xPath2);
        Assert.assertEquals("false",element2.getAttribute("enabled"));
    }

    @And("Assert standing order end date has correct minimum value")
    public void assertStandingOrderEndDateHasCorrectMinimumValue() throws Exception {
        for(int i=0; i<11; i++){
            By el = x.createByXpath("//*[@content-desc='Change to previous month']/following-sibling::android.widget.Button");
            hp.clickElement(el);
        }
        int year = rh.returnCurrentYear();
        int month = rh.returnNextMonth();
        int day = rh.returnNextDay();
        int day2 = rh.returnCurrentDay();

        String date = rh.getDateInFormat(year, month, day, "EEEE, MMMM d, yyyy");
        String xPath = "//*[contains(@text, '" + date + "')]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertEquals("true",element.getAttribute("enabled"));

        String date2 = rh.getFormattedDate(year, month, day2, "EEEE, MMMM d, yyyy");
        String xPath2 = "//*[contains(@text, '" + date2 + "')]";
        MobileElement element2 = x.createMobileElementByXpath(xPath2);
        Assert.assertEquals("false",element2.getAttribute("enabled"));
    }

    @And("Assert standing order end date has correct maximum value")
    public void assertStandingOrderEndDateHasCorrectMaximumValue() throws Exception {
        //Maximal valid date to select is start date+10 years.
        int currentYear = rh.returnCurrentYear();
        int futureYear = rh.returnYearInFuture(currentYear,10);

        String xPathForSwitchingYear = "//android.view.View[@content-desc=\"Switch to selecting a year\"]";
        By elForSwitchYear = x.createByXpath(xPathForSwitchingYear);
        hp.clickElement(elForSwitchYear);

        String xPathForNeededYear = "Navigate to year "+futureYear;
        By elForNeddedYear = x.createByXpath(xPathForNeededYear);
        hp.clickElement(elForNeddedYear);

        int month = rh.returnCurrentMonth();
        int day = rh.returnMinimalValidStartDayForStandingOrder();
        String date = rh.getDateInFormat(futureYear, month, day, "EEEE, MMMM d, yyyy");
        String xPath = "//*[contains(@text, '" + date + "')]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertEquals("true",element.getAttribute("enabled"));

        int day2 = rh.returnMaximalValidEndDayForStandingOrder();
        String date2 = rh.getFormattedDate(futureYear, month, day2, "EEEE, MMMM d, yyyy");
        String xPath2 = "//*[contains(@text, '" + date2 + "')]";
        MobileElement element2 = x.createMobileElementByXpath(xPath2);
        Assert.assertEquals("false",element2.getAttribute("enabled"));

        Assert.fail();

        //Default start date je danasnji dan plus 1 dan
        //U slucaju 29og i 30og u mesecu ovaj dan se pomera na zadnji dan u mesecu
        //Maksimalni end date je start date + 10 godina
        //Ako je danas 28. koji je defaul start date i maksimalni end date? Recimo da mesec ima 31 dan
        //Posto je 1. april 3035 nedelja trebalo bi da bude 2.april 2035
        //Trenutno ponasanje na okruzenju daje 31.03.2035 sto je bug
        //Test zavrsiti kada naprave pravilno ponasanje
    }

    @And("Select currency {string} in currency selection for From currency in exchange screen")
    public void selectCurrencyInCurrencySelectionForFromCurrencyInExchangeScreen(String currency) throws Throwable {
        String xPath = "(//*[@resource-id='nlb-amount-with-currency-flag-field-currency-alpha3'])[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        hp.ClickOnElement(element);

        String xPathForCurrency = "//*[contains(@text,'"+currency+"')]";
        By el = By.xpath(xPathForCurrency);
        for(int i = 0; i<35; i++){
            if(hp.isElementNotPresent(el)){
                hp.scrollDown(driver);
            }
        }
        MobileElement elementForCurrency = x.createMobileElementByXpath(xPathForCurrency);
        hp.ClickOnElement(elementForCurrency);
    }

    @And("For currency exchange rate {string} and source amount {string} calculate foreign destination amount")
    public void forCurrencyExchangeRateAndSourceAmountCalculateForeignDestinationAmount(String buyKey, String sourceAmountString) {
        String sellExchangeRateString = (String) DataManager.userObject.get(buyKey);
        sellExchangeRateString = sellExchangeRateString.replace(",",".");
        Double sourceAmount = Double.parseDouble(sourceAmountString);
        Double sellExchangeRate = Double.parseDouble(sellExchangeRateString);
        Double destinationAmount = sourceAmount / sellExchangeRate;

        Double roundedValue = Math.round(destinationAmount * 100.0) / 100.0;
        DecimalFormat decimalFormat = new DecimalFormat("#.00");
        String expectedValue = decimalFormat.format(roundedValue);
        expectedValue = expectedValue.replace(".",",");
        DataManager.userObject.put("destination_amount",expectedValue);

        String xPath = "(//*[@resource-id='nlb-amount-with-currency-flag-field'])[2]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        String actualValue = element.getText();

        System.out.println(expectedValue);
        System.out.println(actualValue);
        assertTrue(actualValue.contains(expectedValue.substring(0,4)));

    }

    @And("Assert there are two filters for e-invoices shown on the screen")
    public void assertThereAreTwoFiltersForEInvoicesShownOnTheScreen() {
        List<MobileElement> mobileElementList = d.createMobileElementsByResourceId("nlb-icon-button");
        Assert.assertEquals(2,mobileElementList.size());
    }

    @And("Assert e-invoices are grouped by month")
    public void assertEInvoicesAreGroupedByMonth() {
        String xPathForFirstDate = "(//*[@resource-id='nlb-date'])[1]";
        MobileElement elementForFirstDate = x.createMobileElementByXpath(xPathForFirstDate);
        String date = elementForFirstDate.getText();
        int month = rh.extractMonthFromDateInFormat(date,"d. M. yyyy");
        String monthName = rh.getMonthName(month);
        String xPathForMonth = "//*[@text='"+monthName+"']";
        MobileElement elementForMonth = x.createMobileElementByXpath(xPathForMonth);
        Assert.assertTrue(elementForMonth.isDisplayed());

    }

    @Then("Find E-invoice from Excel {string} columnName {string} and {string} and click on it")
    public void findEInvoiceFromExcelColumnNameAndAndClickOnIt(String rowindex, String columnName1, String columnName2) throws Throwable {
        String purpose = DataManager.getDataFromHashDatamap(rowindex,columnName1);
        String amount = DataManager.getDataFromHashDatamap(rowindex,columnName2);

        String xPath = "//*[@text='"+purpose+"']/following-sibling::*[@text='"+amount+"']";

        By el = By.xpath(xPath);

        for(int i = 0; i<50; i++){
            if(hp.isElementNotPresent(el)){
                hp.scrollDown(driver);
            }
        }
        MobileElement element = x.createMobileElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Swipe vertical up")
    public void swipeVerticalUp() {
        int startX = 500;
        int startY = 600;
        int endX = 500;
        int endY = 1800;
        hp.swipeByCordinates(startX, startY, endX, endY);
    }

    @And("Calculate sum of all transactions in transaction list and put in key {string}")
    public void calculateSumOfAllTransactionsInTransactionListAndPutInKey(String key) throws Throwable {
        BigDecimal sum = rh.sumAllTransactionAmountsById("nlb-amount");
        System.out.println(sum);
        DataManager.userObject.put(key,sum);
    }

    @And("Assert sum of monthly transactions is correct with key {string}")
    public void assertSumOfMonthlyTransactionsIsCorrectWithKey(String key) {
        BigDecimal expectedSum = (BigDecimal) DataManager.userObject.get(key);
        MobileElement element = d.createMobileElementByResourceId("nlb-transaction-header-sum");
        String actual = element.getText();
        String cleaned = actual.replaceAll("[^\\d.,]", "");
        cleaned = cleaned.replace(".", "");
        cleaned = cleaned.replace(",", ".");
        BigDecimal value = new BigDecimal(cleaned);
        System.out.println(expectedSum);
        System.out.println(value);
        Assert.assertEquals(expectedSum.abs(),value);
    }

    @And("Click search button in e-invoice list")
    public void clickSearchButtonInEInvoiceList() throws Throwable {
        String xPath = "(//*[@resource-id='nlb-icon-button'])[2]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Enter text from text key {string} in element by id {string}")
    public void enterTextFromTextKeyInElementById(String key, String id) throws InterruptedException {
        String purpose = Utilities.getDataFromTxtFileUnderKey(key);
        String xPath = "//*[@resource-id='"+id+"']";
        By el = x.createByXpath(xPath);
        hp.enterTextToElement(purpose,el);
    }

    @And("Scroll down until element with text from txt key {string} is in view")
    public void scrollDownUntilElementWithTextFromTxtKeyIsInView(String key) {
        WaitHelpers.waitForSeconds(3);
        String text = Utilities.getDataFromTxtFileUnderKey(key);
        //MobileElement element = (MobileElement) driver.findElement(MobileBy.AndroidUIAutomator("new UiScrollable(new UiSelector().scrollable(true))" + ".scrollIntoView(new UiSelector().textContains(\"" + text +"\"))"));
        String xPath = "//*[@text = '" + text + "']";
        By el = By.xpath(xPath);

        for(int i = 0; i<35; i++){
            if(hp.isElementNotPresent(el)){
                hp.scrollDown(driver);
            }
        }
    }

    @And("Scroll down until element with text from key {string} is in view")
    public void scrollDownUntilElementWithTextFromKeyIsInView(String key) {
        WaitHelpers.waitForSeconds(3);
        String text = (String) DataManager.userObject.get(key);
        //MobileElement element = (MobileElement) driver.findElement(MobileBy.AndroidUIAutomator("new UiScrollable(new UiSelector().scrollable(true))" + ".scrollIntoView(new UiSelector().textContains(\"" + text +"\"))"));
        String xPath = "//*[@text = '" + text + "']";
        By el = By.xpath(xPath);

        for(int i = 0; i<35; i++){
            if(hp.isElementNotPresent(el)){
                hp.scrollDown(driver);
            }
        }
    }

    @And("Remember element attribute {string} by id {string} under key {string}")
    public void rememberElementAttributeByIdUnderKey(String attribute, String id, String key) {
        MobileElement element = d.createMobileElementByResourceId(id);
        String value = element.getAttribute(attribute);
        DataManager.userObject.put(key,value);
    }

    @And("Remember current value for cash flow under key {string}")
    public void rememberCurrentValueForCashFlowUnderKey(String key) {
        String xPath = "//*[@resource-id='nlb-pfm-row-cash-flow']/*[@resource-id='nlb-pfm-row-value']";
        MobileElement element = x.createMobileElementByXpath(xPath);
        String value = element.getText();
        DataManager.userObject.put(key,value);
    }

    @And("Assert cash flow difference is from key {string}")
    public void assertCashFlowDifferenceIsFromKey(String key) {
        String expected = (String) DataManager.userObject.get(key);
        String xPath = "(//*[@text='Difference']/following-sibling::*)[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        String actual = element.getText();
        expected = expected.replace('\u00A0', ' ').trim();
        actual = actual.replace('\u00A0', ' ').trim();
        Assert.assertEquals(expected,actual);
    }

    @And("Print these keys {string} {string} {string} {string}")
    public void printTheseKeys(String sumOfIncomingTransactionsCurrentMonth, String sumOfOutgoingTransactionsCurrentMonth, String sumOfIncomingTransactionsLastMonth, String sumOfOutgoingTransactionsLastMonth) {
        System.out.println("sumOfIncomingTransactionsCurrentMonth: " + DataManager.userObject.get(sumOfIncomingTransactionsCurrentMonth));
        System.out.println("sumOfOutgoingTransactionsCurrentMonth: " + DataManager.userObject.get(sumOfOutgoingTransactionsCurrentMonth));
        System.out.println("sumOfIncomingTransactionsLastMonth: " + DataManager.userObject.get(sumOfIncomingTransactionsLastMonth));
        System.out.println("sumOfOutgoingTransactionsLastMonth: " + DataManager.userObject.get(sumOfOutgoingTransactionsLastMonth));
    }

    @And("Assert current month on page in format {string}")
    public void assertCurrentMonthOnPageInFormat(String format) {
        String month = rh.getTodayDateInFormat(format);
        String xPath = "//*[@text='"+month+"']";
        By el = x.createByXpath(xPath);
        WaitHelpers.waitForElement(el);
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert incoming in cash flow is from key {string}")
    public void assertIncomingInCashFlowIsFromKey(String key) {
        BigDecimal expectedBG = (BigDecimal) DataManager.userObject.get(key);
        String expected = expectedBG.toString();
        String xPath = "(//*[@text='Incoming']/following-sibling::*)[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        expected = expected.replace(".",",");
        expected = expected + " EUR";
        String actual = element.getText();
        actual = actual.replace(".","");
        actual = actual.replace('\u00A0', ' ').trim();
        Assert.assertEquals(expected,actual);
    }

    @And("Assert outgoing in cash flow is from key {string}")
    public void assertOutgoingInCashFlowIsFromKey(String key) {
        BigDecimal expectedBG = (BigDecimal) DataManager.userObject.get(key);
        String expected = expectedBG.toString();
        String xPath = "(//*[@text='Outgoing']/following-sibling::*)[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        expected = expected.replace(".",",");
        expected = expected.replace("-","");
        expected = expected + " EUR";
        String actual = element.getText();
        actual = actual.replace(".","");
        actual = actual.replace('\u00A0', ' ').trim();
        Assert.assertEquals(expected,actual);
    }

    @And("Assert difference in cash flow using keys {string} and {string}")
    public void assertDifferenceInCashFlowUsingKeysAnd(String key1, String key2) {
        BigDecimal incomingBigDecimal = (BigDecimal) DataManager.userObject.get(key1);
        String incomingString = incomingBigDecimal.toString();
        BigDecimal outgoingBigDecimal = (BigDecimal) DataManager.userObject.get(key2);
        String outgoingString = outgoingBigDecimal.toString();
        Double incoming = Double.parseDouble(incomingString);
        Double outgoing = Double.parseDouble(outgoingString);
        Double expectedDouble = Math.abs(incoming) - Math.abs(outgoing);
        String expected = expectedDouble.toString();
        expected = String.format("%.2f EUR", expectedDouble).replace(".",",");
        String xPath = "(//*[@text='Difference']/following-sibling::*)[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        String actual = element.getText();
        actual = actual.replace(".","");
        actual = actual.replace('\u00A0', ' ').trim();
        System.out.println(expected);
        System.out.println(actual);
        Assert.assertEquals(expected,actual);
    }

    @And("Click on previous month button for cash flow")
    public void clickOnPreviousMonthButtonForCashFlow() throws Throwable {
        String xPath = "(//*[@resource-id='nlb-chip-button'][2]/following-sibling::android.view.View)[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Assert next month button for cash flow is disabled")
    public void assertNextMonthButtonForCashFlowIsDisabled() {
        String xPath = "(//*[@resource-id='nlb-chip-button'][2]/following-sibling::android.view.View)[2]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertEquals("false",element.getAttribute("enabled"));
    }

    @And("Assert previous {string} month on page in format {string}")
    public void assertPreviousMonthOnPageInFormat(String numberForPreviousMonth, String format) {
        String month = rh.getPreviousMonthInFormat(numberForPreviousMonth,format);
        String xPath = "//*[@text='"+month+"']";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert next month button for cash flow is enabled")
    public void assertNextMonthButtonForCashFlowIsEnabled() {
        String xPath = "(//*[@resource-id='nlb-chip-button'][2]/following-sibling::android.view.View)[2]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertEquals("true",element.getAttribute("enabled"));
    }

    @And("Assert previous month button for cash flow is disabled")
    public void assertPreviousMonthButtonForCashFlowIsDisabled() {
        String xPath = "(//*[@resource-id='nlb-chip-button'][2]/following-sibling::android.view.View)[1]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertEquals("false",element.getAttribute("enabled"));
    }

    @And("Remember all product ibans under key {string}")
    public void rememberAllProductIbansUnderKey(String key) {
        String listOfAllIbans = rh.returnAllTextByIdSeparatedByComma("nlb-value-product-account-id");
        DataManager.userObject.put(key,listOfAllIbans);
    }

    @Then("Compare text from Excel {string} columnName {string} and text from key {string}")
    public void compareTextFromExcelColumnNameAndTextFromKey(String rowindex, String columnName, String key) {
        String textFromExcel = DataManager.getDataFromHashDatamap(rowindex,columnName);
        String textFromKey = (String) DataManager.userObject.get(key);
        System.out.println(textFromExcel);
        //System.out.println(textFromKey);
        Assert.assertEquals(textFromExcel,textFromKey);
    }

    @And("Enter text {string} into input field {string} in amount filter")
    public void enterTextIntoInputFieldInAmountFilter(String amount, String text) throws InterruptedException {
        if (text.equals("From")){
            String xPath = "(//*[@resource-id='nlb-amount-with-currency-field'])[1]";
            By el = By.xpath(xPath);
            hp.enterTextToElement(amount,el);
        }
        if (text.equals("To")){
            String xPath = "(//*[@resource-id='nlb-amount-with-currency-field'])[2]";
            By el = By.xpath(xPath);
            hp.enterTextToElement(amount,el);
        }
    }

    @Then("Assert filtered amounts have values between {string} and {string}")
    public void assertFilteredAmountsHaveValuesBetweenAnd(String value1, String value2) {
        List<MobileElement> listOfAmounts = d.createMobileElementsByResourceId("nlb-amount");
        for (MobileElement element : listOfAmounts) {
            String amount = element.getText();
            amount = amount.replaceAll("[^\\d.,]", "");
            amount = amount.replace(".", "");
            amount = amount.replace(",", ".");
            Double value = Double.parseDouble(amount);
            Assert.assertTrue(value >= Double.parseDouble(value1) && value <= Double.parseDouble(value2));
        }
    }

    @And("Assert that second text {string} has first following sibling that is filled")
    public void assertThatSecondTextHasFirstFollowingSiblingThatIsFilled(String textFirst) {
        String xPath = "(//*[@text='"+textFirst+"']//following-sibling::*[1])[2]";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.getText().length()>=3);
    }

    @And("Scroll until Booked balance of product card of name {string} and iban {string} from Excel {string} is in view")
    public void scrollUntilBookedBalanceOfProductCardOfNameAndIbanFromExcelIsInView(String columnName1, String columnName2, String rowindex) {
        String productName = DataManager.getDataFromHashDatamap(rowindex,columnName1);
        String productIban = DataManager.getDataFromHashDatamap(rowindex,columnName2);
        String xPathForAvailableBalance = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Savings Account\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']//following-sibling::*[@resource-id='nlb-value-product-secondary-balance']";
        By el = By.xpath(xPathForAvailableBalance);

        for(int i = 0; i<50; i++){
            if(hp.isElementNotPresent(el)){
                hp.scrollDown(driver);
            }
        }
    }

    @And("Scroll until Number of Asset Units for NLB Funds from Excel {string} columnName {string} {string} is in view")
    public void scrollUntilNumberOfAssetUnitsForNLBFundsFromExcelColumnNameIsInView(String rowindex, String columnName1, String columnName2) {
        String productName = DataManager.getDataFromHashDatamap(rowindex, columnName1);
        String productIban = DataManager.getDataFromHashDatamap(rowindex, columnName2);
        String xPathForAvailableBalance = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"\"]//following-sibling::*[@text='" + productName + "']//following-sibling::*[@text='" + productIban + "']//following-sibling::*[@resource-id='nlb-value-product-secondary-balance']";
        By el = By.xpath(xPathForAvailableBalance);

        for (int i = 0; i < 50; i++) {
            if (hp.isElementNotPresent(el)) {
                hp.scrollDown(driver);
            }
        }
    }

    @And("Scroll down until element with id {string} is in view")
    public void scrollDownUntilElementWithIdStringIsInView(String id) {
        WaitHelpers.waitForSeconds(3);
        //MobileElement element = (MobileElement) driver.findElement(MobileBy.AndroidUIAutomator("new UiScrollable(new UiSelector().scrollable(true))" + ".scrollIntoView(new UiSelector().textContains(\"" + text +"\"))"));
        String xPath = "//*[@resource-id='"+id+"']";
        By el = By.xpath(xPath);

        for(int i = 0; i<35; i++){
            if(hp.isElementNotPresent(el)){
                hp.scrollDown(driver);
            }
        }
    }

    @Given("Send TPP Registration API call")
    public void sendTPPRegistrationAPICall() {
        PSD2Api.postTPPRegistration();
    }

    @And("Send Login call")
    public void sendLoginCall() throws JsonProcessingException {
        PSD2Api.postLogin();
    }

    @And("TPP Create Consent on Android and expect failure")
    public void tppCreateConsentOnAndroidAndExpectFailure() {
        PSD2Api.postTPPCreateConsentAndroidAndExpectError();
    }

    @And("TPP Create Consent on android")
    public void tppCreateConsentOnAndroid() throws JsonProcessingException {
        PSD2Api.postTPPCreateConsentAndroid();
    }

    @When("Start PSD2 app")
    public void startPSD2App() {
        PSD2Api.startApp();
    }

    @And("Wait for Role selector or Consent screen and assert")
    public void waitForRoleSelectorOrConsentScreenAndAssert() {
        WaitHelpers.waitForSeconds(10);
        List<MobileElement> mobileElementListConsent = x.createMobileElementsByXpath("//*[@text='Consent']");
        List<MobileElement> mobileElementListRole = x.createMobileElementsByXpath("//*[@text='User role']");

        if (mobileElementListConsent.size() > 0 || mobileElementListRole.size() > 0){
            Assert.assertTrue(true);
        } else {
            Assert.assertTrue(false);
        }
    }

    @And("Assert tpp name from key {string} is displayed")
    public void assertTppNameFromKeyIsDisplayed(String key) {
        String tppName = (String) DataManager.userObject.get(key);
        String xPath = "//*[@text='"+tppName+"']";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Select account from Excel {string} columnName {string} as debtor in payment screen for PSD2 consent")
    public void selectAccountFromExcelColumnNameAsDebtorInPaymentScreenForPSD2Consent(String rowindex, String columnName) throws Throwable {
        String xPathForSelector = "//android.view.View[@content-desc=\"Personal account\"]";
        MobileElement elementForSelector = x.createMobileElementByXpath(xPathForSelector);
        hp.ClickOnElement(elementForSelector);
        WaitHelpers.waitForElement(x.createByXpath("//*[@text='Please select your role.']"));
        String accountIban = DataManager.getDataFromHashDatamap(rowindex,columnName);
        String xPathForAccount = "//*[@text='"+accountIban+"']";
        By el = By.xpath(xPathForAccount);
        for(int i = 0; i<5; i++){
            if(hp.isElementNotPresent(el)){
                hp.scrollDown(driver);
            }
        }
        MobileElement elementForAccount = x.createMobileElementByXpath(xPathForAccount);
        hp.ClickOnElement(elementForAccount);
    }

    @And("Assert PSD2 is valid until today date")
    public void assertPSDIsValidUntilTodayDate() {
        String date = rh.getTodayDateInFormat("d. M. yyyy 00:00");
        String xPath = "//*[@text='Valid until']/following-sibling::*[@text='"+date+"']";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert Expiry date for PSD2 consent is today date")
    public void assertExpiryDateForPSD2ConsentIsTodayDate() {
        String date = rh.getTodayDateInFormat("d. M. yyyy 00:00");
        String xPath = "//*[@text='Expiry date: "+date+"']";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert PSD2 consent date is today date")
    public void assertPSD2ConsentDateIsTodayDate() {
        String date = rh.getTodayDateInFormat("d. M. yyyy 00:00");
        String xPath = "//*[@text='Consent date']/following-sibling::*[@text='"+date+"']";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Create Payment on Android PSD2 with debtor {string} columnName {string} and expect failure")
    public void createPaymentOnAndroidPSD2WithDebtorColumnNameAndExpectFailure(String rowindex, String columnName) {
        String debtorIban = DataManager.getDataFromHashDatamap(rowindex,columnName);
        PSD2Api.postCreatePaymentAndroidWithDebtorAndExpectError(debtorIban);
    }

    @And("Create Payment on Android PSD2 with debtor {string} columnName {string}")
    public void createPaymentOnAndroidPSDWithDebtorColumnName(String rowindex, String columnName) throws JsonProcessingException {
        String debtorIban = DataManager.getDataFromHashDatamap(rowindex,columnName);
        PSD2Api.postCreatePaymentAndroidWithDebtor(debtorIban);
    }

    @And("Enter text from excel {string} columnName {string} with random deleted character in element id {string}")
    public void enterTextFromExcelColumnNameWithRandomDeletedCharacterInElementId(String rowindex, String columnName, String id) {
        String name = DataManager.getDataFromHashDatamap(rowindex,columnName);
        String partialName = rh.removeRandomLetter(name);
        By element = d.createElementByResourceId(id);
        hp.enterTextToMobileElement(partialName,element);
    }

    @And("Enter text from excel {string} columnName {string} with random letters permuted in element id {string}")
    public void enterTextFromExcelColumnNameWithRandomLettersPermutedInElementId(String rowindex, String columnName, String id) {
        String name = DataManager.getDataFromHashDatamap(rowindex,columnName);
        String partialName = rh.swapTwoRandomLettersInSameWord(name);
        By element = d.createElementByResourceId(id);
        hp.enterTextToMobileElement(partialName,element);
    }

    @And("Enter text from excel {string} columnName {string} with random letters changed to A in element id {string}")
    public void enterTextFromExcelColumnNameWithRandomLettersChangedToAInElementId(String rowindex, String columnName, String id) {
        String name = DataManager.getDataFromHashDatamap(rowindex,columnName);
        String partialName = rh.replaceRandomNonAWithA(name);
        By element = d.createElementByResourceId(id);
        hp.enterTextToMobileElement(partialName,element);
    }

    @And("Enter text from excel {string} columnName {string} with last letter changed in element id {string}")
    public void enterTextFromExcelColumnNameWithLastLetterChangedInElementId(String rowindex, String columnName, String id) {
        String name = DataManager.getDataFromHashDatamap(rowindex,columnName);
        String partialName = rh.replaceLastLetterAorS(name);
        By element = d.createElementByResourceId(id);
        hp.enterTextToMobileElement(partialName,element);
    }

    @And("Click on info button for Payment limit amount")
    public void clickOnInfoButtonForPaymentLimitAmount() throws Throwable {
        String xPath = "//*[@text='Payment limit amount']/following-sibling::android.widget.ImageView";
        MobileElement element = x.createMobileElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Click on element by id {string} with descendant text {string}")
    public void clickOnElementByIdWithDescendantText(String id, String text) throws Throwable {
        String xPath = "//*[@resource-id='"+id+"']/*[@text='"+text+"']";
        MobileElement element = x.createMobileElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Assert no limit is placeholder in set daily limit screen")
    public void assertNoLimitIsPlaceholderInSetDailyLimitScreen() {
        String xPath = "//*[@resource-id='nlb-amount-with-currency-field']/android.widget.TextView";
        MobileElement element = x.createMobileElementByXpath(xPath);
        String expected = "no limit";
        String actual = element.getText();
        Assert.assertEquals(expected,actual);
    }

    @And("Assert text {string} is not displayed")
    public void assertTextIsNotDisplayed(String text) {
        String xPath = "//*[@text='"+text+"']";
        List<MobileElement> mobileElementList = x.createMobileElementsByXpath(xPath);
        Assert.assertEquals(0,mobileElementList.size());
    }

    @And("Enter text from excel {string} columnName {string} in element id {string} using android typer")
    public void enterTextFromExcelColumnNameInElementIdUsingAndroidTyper(String rowindex, String columnName, String id) {
        MobileElement element = d.createMobileElementByResourceId(id);
        String text = DataManager.getDataFromHashDatamap(rowindex,columnName);
        hp.typeWithKeyEvents((AndroidDriver<?>) driver,element,text,1);
    }

    @And("Assert that confirmation is created for payment")
    public void assertThatConfirmationIsCreatedForPayment() throws Throwable {
        String xPath = "//*[@resource-id='com.google.android.apps.docs:id/projector_toolbar']";
        By elWait = x.createByXpath(xPath);
        boolean doesElementExist = hp.isElementDisplayed(elWait,30,1000);
        if (doesElementExist){
            MobileElement element = x.createMobileElementByXpath(xPath);
            Assert.assertTrue(element.isDisplayed());
        } else {
            String xPathForOkButton = "//*[@text='OK']";
            By elOk = x.createByXpath(xPathForOkButton);
            hp.clickElement(elOk);
            String xPathForConfirmationButton = "//*[@text='Confirmation']";
            By elConfirmation = x.createByXpath(xPathForConfirmationButton);
            hp.clickElement(elConfirmation);
            String xPath2 = "//*[@resource-id='com.google.android.apps.docs:id/projector_toolbar']";
            By elWait2 = x.createByXpath(xPath2);
            boolean doesElementExist2 = hp.isElementDisplayed(elWait2,30,1000);
            Assert.assertTrue(doesElementExist2);
        }
        //Need to check if element is displayed


    }

    @And("Set flag {string} in framework")
    public void setFlagInFramework(String flag) {
        DataManager.userObject.put("flag",flag);
    }

    @And("Change language to english")
    public void changeLanguageToEnglish() throws  Throwable{
        String xPathDflt ="//android.widget.Button[@content-desc='Default Icon']";
        ////I0.o0/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.view.View
        MobileElement element = x.createMobileElementByXpath(xPathDflt);
        hp.ClickOnElement(element);

        MobileElement odjavaElement=x.createMobileElementByText("Odjava");
        if (odjavaElement.isDisplayed()) {

            // Klikni na "Jezik"
            //String xPathJezik="//android.widget.TextView[@text='Jezik']";
            MobileElement jezikElement=x.createMobileElementByText("Jezik");
            hp.ClickOnElement(jezikElement);
            // Sačekaj da se pojavi "Engleski"
            String xPathEng="(//android.view.View[@resource-id='nlb-radio-button'])[2]";
            MobileElement engElement=x.createMobileElementByXpath(xPathEng);
            hp.ClickOnElement(engElement);

            WaitHelpers.waitForElement(x.createByXpath("//android.widget.TextView[@text='Language']"));
            // Vrati se dva puta nazad
            String xPathBack="//android.view.View[@content-desc='Back']";
            hp.ClickOnElement(x.createMobileElementByXpath(xPathBack));

            hp.ClickOnElement(x.createMobileElementByText("Ok"));
            hp.ClickOnElement(x.createMobileElementByText("Ok"));


            hp.ClickOnElement(x.createMobileElementByXpath(xPathBack));


        } else {
            // Samo jedan back
            String xPathBack="//android.view.View[@content-desc='Back']";
            hp.ClickOnElement(x.createMobileElementByXpath(xPathBack));
        }



    }

    @When("Click {string}")
    public void click(String text) throws Throwable {
        String xPath="//android.widget.TextView[@text='" + text + "']";
        hp.ClickOnElement(x.createMobileElementByXpath(xPath));



    }

    @And("Click on element by desc {string}")
    public void clickOnElementByDesc(String text) throws Throwable {

        String xPath="//*[@content-desc='"+ text + "']";
        hp.ClickOnElement(x.createMobileElementByXpath(xPath));

    }

    @And("Assert that whole product card of loan account with name {string} and bban {string} from Excel {string} is clickable")
    public void assertThatWholeProductCardOfLoanAccountWithNameAndIbanFromExcelIsClickable(String columnName1, String columnName2, String rowindex) {

        String productName = DataManager.getDataFromHashDatamap(rowindex,columnName1);
        String productIban = DataManager.getDataFromHashDatamap(rowindex,columnName2);

        String xPathLoanCard = "//*[@resource-id='nlb-product-summary-card' and .//*[@text='" + productName + "'] and .//*[@text='" + productIban + "']]";

        // Get card
        MobileElement loanCard = x.createMobileElementByXpath(xPathLoanCard);

        // ---------- CHECK IF CARD IS CLICKABLE ----------
        String clickableAttr = loanCard.getAttribute("clickable");
        Assert.assertEquals("true", clickableAttr);
    }


    @And("Click on element by text from excel {string} columnName {string} and assert the correct page opens")
    public void clickOnElementByTextFromExcelColumnNameAndAssertTheCorrectPageOpens(String rowindex, String column) throws Exception {
        String text = DataManager.getDataFromHashDatamap(rowindex,column);
        rh.clickOnElementByText(text);

        MobileElement element = x.createMobileElementByText("My loan");
        Assert.assertTrue(element.isDisplayed());
    }



    @Then("Verify product ordering in My Products")
    public void verifyProductOrderingInMyProducts() {

        Map<String, String> detected = new LinkedHashMap<>(); // čuva redosled
        boolean reachedEnd = false;

        while (!reachedEnd) {

            List<MobileElement> visibleCards = driver.findElements(By.xpath("//*[@resource-id='nlb-product-summary-card']"));
            int beforeAdd = detected.size();

            for (MobileElement card : visibleCards) {
                String key = null;
                String type = null;

                // CURRENT ACCOUNT
                //List<MobileElement> currentDesc = card.findElements(By.xpath(".//*[@content-desc='Current account']"));
                List<MobileElement> currentDesc = card.findElements(By.xpath(".//*[@content-desc=\"Current account\"]"));

                if (!currentDesc.isEmpty()) {
                    try {
                        MobileElement ibanEl = card.findElement(By.xpath(".//*[@resource-id='nlb-value-product-account-id']"));
                        key = ibanEl.getText();
                        type = "current";
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }

                // CARDS
                if (type == null) {
                    List<MobileElement> nameText = card.findElements(By.xpath(".//*[@resource-id='nlb-value-product-account-name']"));
                    if (!nameText.isEmpty() && (nameText.get(0).getText().toLowerCase().contains("card") || nameText.get(0).getText().toLowerCase().contains("visa")) ){
                        key = nameText.get(0).getText();
                        type = "card";
                    }
                }

                // SAVINGS ACCOUNT
                if (type == null) {
                    List<MobileElement> savingsDesc = card.findElements(By.xpath(".//*[@content-desc=\"Savings Account\"]"));
                    if (!savingsDesc.isEmpty()) {
                        try {
                            MobileElement ibanEl = card.findElement(By.xpath(".//*[@resource-id='nlb-value-product-account-id']"));
                            key = ibanEl.getText();
                            type = "savings";
                        } catch (Exception ignored) {}
                    }
                }

                // LOANS
                if (type == null) {
                    List<MobileElement> nameLoan = card.findElements(By.xpath(".//*[@resource-id='nlb-value-product-account-name']"));
                    if (!nameLoan.isEmpty() && nameLoan.get(0).getText().toLowerCase().contains("loan")) {
                        key = nameLoan.get(0).getText();
                        type = "loan";
                    }
                }

                // DODAVANJE U MAPU
                if (key != null && type != null && !detected.containsKey(key)) {
                    detected.put(key, type);
                }
            }

            if (detected.size() == beforeAdd) {
                reachedEnd = true;
            } else {
                hp.scrollDown(driver);
            }
        }

        detected.forEach((k, v) -> System.out.println(k + " -> " + v));


        List<String> correctOrder = Arrays.asList(
                "current",
                "card",
                "savings",
                "loan"
        );

        int lastIndex = -1;

        for (String type : detected.values()) {
            int idx = correctOrder.indexOf(type);

            if (idx < lastIndex) {
                Assert.fail("Invalid product ordering: " + detected.values());
            }

            lastIndex = idx;
        }

        System.out.println("Product order is valid: " + detected.values());
    }


    @And("Change the name od product from Excel {string} column {string} with invalid {string}")
    public void changeTheNameOdProductFromExcelColumnWithInvalid(String rowindex, String column,String newName) throws Throwable{
        String iban = DataManager.getDataFromHashDatamap(rowindex,column);
        ////android.widget.TextView[@text='205-9031004419532-81']/ancestor::android.view.View[1]//android.view.View[@content-desc='Edit product card']
        String xPathPencil = "//android.widget.TextView[@text='" + iban + "']/ancestor::android.view.View[1]//android.view.View[@content-desc='Edit product card']";
        By waitPencil = x.createByXpath(xPathPencil);
        for(int i = 0; i<5; i++){
            if(hp.isElementNotPresent(waitPencil)){
                hp.scrollDown(driver);
            }
        }
        MobileElement pencilElement = x.createMobileElementByXpath(xPathPencil);
        hp.ClickOnElement(pencilElement);

        By elWait = x.createByText("Rename product");
        WaitHelpers.waitForElement(elWait);

        //Change product name to invalid (more than 50 chars)

        //delete current name
        String xPathDelete = "//android.view.View[contains(@content-desc, 'Clear')]";
        MobileElement deleteElement = x.createMobileElementByXpath(xPathDelete);
        hp.ClickOnElement(deleteElement);

        By elForEditText = x.createByXpath("//android.widget.EditText");
        hp.clickElement(elForEditText);

        ActionApiHelpers.clearInputField(driver.findElement(elForEditText));
        Character[] charObjectArray = Utilities.toCharacterArray(newName);
        hp.pressKey(charObjectArray);
        //error message
        String xPathForWarningMessage = "//*[@text='You have reached the maximum number of characters.']";
        MobileElement elementForWarningMessage = x.createMobileElementByXpath(xPathForWarningMessage);
        Assert.assertTrue(elementForWarningMessage.isDisplayed());
        MobileElement elementForEditText = x.createMobileElementByXpath("//android.widget.EditText");
        String contentOfEditText = elementForEditText.getText();
        Assert.assertEquals(50,contentOfEditText.length());





    }

    @And("Delete name of product {string}")
    public void deleteNameOfProduct(String name) throws Throwable {

        String xPathPencil = "//android.widget.TextView[@text='" + name + "']/ancestor::android.view.View[1]//android.view.View[@content-desc='Edit product card']";
        By waitPencil = x.createByXpath(xPathPencil);
        for(int i = 0; i<5; i++){
            if(hp.isElementNotPresent(waitPencil)){
                hp.scrollDown(driver);
            }
        }
        MobileElement pencilElement = x.createMobileElementByXpath(xPathPencil);
        hp.ClickOnElement(pencilElement);

        By elWait = x.createByText("Rename product");
        WaitHelpers.waitForElement(elWait);


        //delete current name
        String xPathDelete = "//android.view.View[contains(@content-desc, 'Clear')]";
        MobileElement deleteElement = x.createMobileElementByXpath(xPathDelete);
        hp.ClickOnElement(deleteElement);

    }

    @And("Assert product from Excel {string} has name {string}")
    public void assertProductFromExcelHasName(String rowindex, String column1) {
       // String accountIban = DataManager.getDataFromHashDatamap(rowindex,column1);
        String expectedName = DataManager.getDataFromHashDatamap(rowindex,column1);

        //String xPathForName = "//*[@text='"+accountIban+"']//preceding-sibling::*[@text='"+expectedName+"']";
        String xPathForName = "//android.view.View[.//android.widget.TextView[@text='" + expectedName + "']]";
        //System.out.println("account iban: " + accountIban + " - account name: " + expectedName);
        MobileElement elementForName = x.createMobileElementByXpath(xPathForName);
        Assert.assertTrue(elementForName.isDisplayed());
    }

    @And("Remember transaction details")
    public void rememberTransactionDetails() {
        Map<String, String> data = new HashMap<>();

        String[] ids = {
                "nlb-date",
                "nlb-title",
                "nlb-details"

        };

        for(String id : ids){
            MobileElement element = x.createMobileElementById(id);
            data.put(id,element.getText());
        }

        String[] labels = {
                "Creditor",
                "Creditor Account number",
                "Transaction ID"
        };


        for (String label : labels) {
            String xpath = "//android.widget.TextView[@text='" + label + "']/following-sibling::android.widget.TextView[1]";
            MobileElement valueElement = x.createMobileElementByXpath(xpath);
            data.put(label, valueElement.getText());
        }

        DataManager.userObject.put("TransactionDetails",data);
        System.out.println("Remembered: "+ data);

    }

    @And("Assert transaction details by remembered values")
    public void assertTransactionDetailsByRememberedValues() {

        Map<String,String> expected = (Map<String,String>) DataManager.userObject.get("TransactionDetails");
        System.out.println("Expected: " + expected);

        MobileElement contentElement = x.createMobileElementByXpath("//android.view.ViewGroup[@resource-id=\"com.google.android.apps.docs:id/pdf_view\"]//android.view.ViewGroup[@content-desc]");
        String contentRaw =contentElement.getAttribute("contentDescription");
        String content = contentRaw.replaceAll("\\s+", " ").trim();
        System.out.println("Content: " + content);
        assertTrue(content.contains("Potvrda o izvršenoj transakciji važi bez potpisa i pečata"));
        assertTrue(content.contains("Status Realizovan"));

        //System.out.println("nlb date: "+ expected.get("nlb-date"));
        //assertTrue(content.contains("Datum valute " + expected.get("nlb-date")));
        //assertTrue(content.contains("Svrha\n" + expected.get("nlb-title")));

    }


    @And("Assert Filter icon is displayed")
    public void assertFilterIconIsDisplayed() {
        String xPath = "//android.view.View[@content-desc='Filters']//following-sibling::android.view.View[@resource-id='nlb-icon-button']";
        MobileElement element = x.createMobileElementByXpath(xPath);
        assertTrue(element.isDisplayed());
    }

    @And("Assert Search field is displayed")
    public void assertSearchFieldIsDisplayed() {
        String searchFieldxPath = "//android.widget.EditText//android.widget.TextView[@text='Search...']";
        MobileElement searchFieldElement = x.createMobileElementByXpath(searchFieldxPath);
        assertTrue(searchFieldElement.isDisplayed());

        String clearxPath = "//android.widget.ImageView[@content-desc=\"Clear search input\"]";
        MobileElement clearSearchEelement = x.createMobileElementByXpath(clearxPath);
        assertTrue(clearSearchEelement.isDisplayed());
    }

    @And("Search transactions by detail from excel {string} columnName {string}")
    public void searchTransactionsByDetailFromExcelColumnName(String rowindex, String columnName) throws Throwable {
        String detail = DataManager.getDataFromHashDatamap(rowindex,columnName);
        System.out.println("Detail: " + detail);
        String searchFieldxPath = "//android.widget.EditText//android.widget.TextView[@text='Search...']";
        MobileElement searchFieldElement = x.createMobileElementByXpath(searchFieldxPath);
        hp.ClickOnElement(searchFieldElement);


        By elForEditText = x.createByXpath("//android.widget.EditText");
        hp.clickElement(elForEditText);

        ActionApiHelpers.clearInputField(driver.findElement(elForEditText));
        Character[] charObjectArray = Utilities.toCharacterArray(detail);
        hp.pressKey(charObjectArray);

    }


    @And("Remember default number of transactions")
    public void rememberDefaultNumberOfTransactions() throws Throwable{

        List<Pair<String, String>> transactions = new ArrayList<>();

        boolean end = false;

        while (!end) {

            List<MobileElement> visibleCards = driver.findElements(By.xpath("//*[@resource-id='nlb-card-container']"));
            int beforeAdd = transactions.size();

            for (MobileElement card : visibleCards) {

                try {
                    //MobileElement freshCard = (MobileElement) driver.findElements(By.xpath("//*[@resource-id='nlb-card-container']")).get(i);

                    String date = card.findElement(By.xpath(".//*[@resource-id='nlb-date']")).getText();
                    String purpose = card.findElement(By.xpath(".//*[@resource-id='nlb-title']")).getText();

                    Pair<String, String> newPair = new Pair<>(date, purpose);

                    if (!transactions.contains(newPair)) {
                        transactions.add(newPair);
                    }

                } catch (StaleElementReferenceException | NoSuchElementException stale) {
                    continue;
                }
            }

            if (transactions.size() == beforeAdd) {
                end = true;
            } else {
                hp.scrollDown(driver);
            }
        }

        for (Pair<String, String> pairs : transactions) {
            System.out.println(pairs.getKey() + " - " + pairs.getValue());
        }

        DataManager.userObject.put("defaultTransactionsNumber", transactions.size());
    }

/*
    @And("Assert there are default number of transactions")
    public void assertThereAreDefaultNumberOfTransactions() {
        int defNoTransactions = (int) DataManager.userObject.get("defaultTransactionsNumber");

        List<Pair<String, String>> transactions = new ArrayList<>();

        boolean end=false;
        while(!end) {

            List<MobileElement> visibleCards = driver.findElements(By.xpath("//*[@resource-id=\"nlb-card-container\"]"));
            int beforeAdd = transactions.size();

            try {
                for (MobileElement card : visibleCards) {

                    String date = card.findElement(By.xpath(".//*[@resource-id=\"nlb-date\"]")).getAttribute("text");
                    String purpose = card.findElement(By.xpath(".//*[@resource-id=\"nlb-title\"]")).getAttribute("text");
                    Pair<String, String> newPair = new Pair<>(date, purpose);

                    if (!transactions.contains(newPair)) {
                        transactions.add(newPair);
                    }
                }
            }catch (StaleElementReferenceException | NoSuchElementException stale) {

            }

            System.out.println("beforeAdd: " + beforeAdd + "\nposle for petlje: " + transactions.size());

            if(transactions.size()==beforeAdd){
                end=true;
            }else{
                hp.scrollDown(driver);
            }

        }
        for(Pair<String,String> pairs : transactions){
            this.pairs = pairs;
            System.out.println(pairs.getKey() + " - " + pairs.getValue());
        }
        int size=transactions.size();
        assertTrue(defNoTransactions==size);

    }*/

/*
    @And("Assert transactions are filtered by searchValue from column {string}")
    public void assertTransactionsAreFilteredBySearchValueFromColumn(String column) {

        String searchValue = driver.findElement(By.xpath("//android.widget.EditText")).getText();
        System.out.println("Search box value: " + searchValue);


        String xPathFilter="";
        switch (column) {
            case "search_purpose":
                xPathFilter = ".//*[@resource-id='nlb-title']";
                break;

            default:
                throw new RuntimeException("Excel filter type not supported: " + searchValue);
        }

        List<String> transactions = new ArrayList<>();

        boolean end = false;
        while (!end) {

            List<MobileElement> visibleCards =
                    driver.findElements(By.xpath("//*[@resource-id='nlb-card-container']"));

            int beforeAdd = transactions.size();
            System.out.println("transactions.size beforeAdd: " + beforeAdd);
            for (MobileElement card : visibleCards) {
                try {
                    String currentDetail = card.findElement(By.xpath(xPathFilter)).getText()
                            .trim().toLowerCase();

                    System.out.println("Current detail: " + currentDetail);
                    assertTrue(currentDetail.contains(searchValue));
                    transactions.add(currentDetail);

                } catch (NoSuchElementException e) {
                }
            }

            System.out.println("transactions.size: nakon for petlje " + transactions.size());

            if (transactions.size() == beforeAdd) {
                end = true;
            } else {
                hp.scrollDown(driver);
            }
        }
    }

*/

    @And("Assert there are default number of transactions")
    public void assertThereAreDefaultNumberOfTransactions() {

        int defNoTransactions =
                (int) DataManager.userObject.get("defaultTransactionsNumber");

        List<Pair<String, String>> transactions = new ArrayList<>();

        MobileElement lastVisibleCard = null;
        int maxScrolls = 20;
        int scrollCount = 0;

        while (scrollCount < maxScrolls) {

            List<MobileElement> visibleCards =
                    driver.findElements(By.xpath("//*[@resource-id='nlb-card-container']"));

            if (visibleCards.isEmpty()) {
                break;
            }

            MobileElement currentLastCard =
                    visibleCards.get(visibleCards.size() - 1);

            if (lastVisibleCard != null &&
                    currentLastCard.getLocation().getY() ==
                            lastVisibleCard.getLocation().getY()) {
                break;
            }

            for (MobileElement card : visibleCards) {
                try {
                    String date = card.findElement(By.xpath(".//*[@resource-id='nlb-date']"))
                            .getAttribute("text");

                    String purpose = card.findElement(By.xpath(".//*[@resource-id='nlb-title']"))
                            .getAttribute("text");

                    Pair<String, String> newPair = new Pair<>(date, purpose);

                    if (!transactions.contains(newPair)) {
                        transactions.add(newPair);
                    }

                } catch (StaleElementReferenceException | NoSuchElementException e) {
                }
            }

            lastVisibleCard = currentLastCard;

            hp.scrollDown(driver);
            scrollCount++;
        }

        for (Pair<String, String> pairs : transactions) {
            System.out.println(pairs.getKey() + " - " + pairs.getValue());
        }

        assertEquals(defNoTransactions, transactions.size());
    }

    @And("Assert transactions are filtered by searchValue from column {string}")
public void assertTransactionsAreFilteredBySearchValueFromColumn(String column) {

    String searchValue = driver.findElement(By.xpath("//android.widget.EditText"))
            .getText()
            .trim()
            .toLowerCase();

    System.out.println("Search box value: " + searchValue);

    String xPathFilter;
    switch (column) {
        case "search_purpose":
            xPathFilter = ".//*[@resource-id='nlb-title']";
            break;
        default:
            throw new RuntimeException("Excel filter type not supported: " + column);
    }

    MobileElement lastVisibleCard = null;

    while (true) {

        List<MobileElement> visibleCards = driver.findElements(By.xpath("//*[@resource-id='nlb-card-container']"));

        if (visibleCards.isEmpty()) {
            break;
        }

        MobileElement currentLastCard =
                visibleCards.get(visibleCards.size() - 1);

        if (lastVisibleCard != null &&
                currentLastCard.getLocation().getY() ==
                        lastVisibleCard.getLocation().getY()) {
            break;
        }

        for (MobileElement card : visibleCards) {
            try {
                String currentDetail = card.findElement(By.xpath(xPathFilter))
                        .getText()
                        .trim()
                        .toLowerCase();

                System.out.println("Current detail: " + currentDetail);
                assertTrue(currentDetail.contains(searchValue));

            } catch (NoSuchElementException e) {
            }
        }

        lastVisibleCard = currentLastCard;

        hp.scrollDown(driver);
    }
}

    @And("Click on Clear search")
    public void clickOnClearSearch() throws Throwable {
        String xPath = "//android.widget.ImageView[@content-desc=\"Clear search input\"]";
        MobileElement element=x.createMobileElementByXpath(xPath);
        hp.ClickOnElement(element);

    }

    @And("Search invalid filter {string}")
    public void searchInvalidFilter(String input) throws Throwable {

        String searchFieldxPath = "//android.widget.EditText//android.widget.TextView[@text='Search...']";
        MobileElement searchFieldElement = x.createMobileElementByXpath(searchFieldxPath);
        hp.ClickOnElement(searchFieldElement);


        By elForEditText = x.createByXpath("//android.widget.EditText");
        hp.clickElement(elForEditText);

        ActionApiHelpers.clearInputField(driver.findElement(elForEditText));
        Character[] charObjectArray = Utilities.toCharacterArray(input);
        hp.pressKey(charObjectArray);
        System.out.println("input: " + input);
    }

    @And("Assert error message for invalid search")
    public void assertErrorMessageForInvalidSearch() {
       String xPath = "//android.widget.TextView[@text=\"No results found. Adjust your values and try again.\"]";
        int maxScrolls = 2;
        boolean found = false;
        WaitHelpers.waitForSeconds(7);
        for (int i = 1; i <= maxScrolls; i++) {
            try {
                MobileElement element =(MobileElement) driver.findElement(By.xpath(xPath));
                if (element.isDisplayed()) {
                    found = true;
                    break;
                }
            } catch (Exception e) {
            }

            if (i < maxScrolls) {
                hp.scrollDown(driver);
            }
        }

        // Ako nije pronađen, fail
        assertTrue("Element se nije pojavio ni posle skrolovanja",found);
    }


    @And("Search invalid filter emoji")
    public void searchInvalidFilterEmoji() throws Throwable {
        MobileElement searchField = (MobileElement) driver.findElement(By.xpath("//android.widget.EditText"));
        searchField.click();
        Thread.sleep(500);
        searchField.sendKeys("😊");


    }
    @And("Assert transaction list is sorted by amount from {string} to {string}")
    public void assertTransactionListIsSortedToMatchConditions(String amountTo, String amountFrom) throws Exception {{

        Double amountTO=Double.valueOf(amountTo);
        Double amountFROM=Double.valueOf(amountFrom);

        List<String> listAmount = rh.scrollDownAndPutEveryElementWithIdIntoList("nlb-amount");

        int size = listAmount.size();
        for (int i = 0; i < size; i++) {
            String amountStr = listAmount.get(i);
            // Normalizacija amount-a
            String normalized = amountStr.replace(".", "").replace(",", ".").replace("−", "-");
            Float amount = Float.valueOf(normalized);

            if (amount < amountTO || amount > amountFROM) {
                System.out.println("GRESKA, FILTER ZA AMOUNT NE RADI: " + amount);
                Assert.fail();
            }




        }
    }
    }


    @And("Hide account from Excel {string} columnName {string} V")
    public void hideAccountFromExcelColumnNameV(String rowindex, String columnName) throws Throwable {
        String accountIban = DataManager.getDataFromHashDatamap(rowindex,columnName);
        By elForEdit = x.createByXpath("//*[@resource-id='nlb-button-edit-products']");
        WaitHelpers.waitForElement(elForEdit);
        MobileElement elementForEdit = d.createMobileElementByResourceId("nlb-button-edit-products");
        hp.ClickOnElement(elementForEdit);
        By elForEye = x.createByXpath("//android.view.View[@content-desc=\"Hide Account\"]");
        WaitHelpers.waitForElement(elForEye);
        String xPathForHideAccount = "//*[@text='"+accountIban+"']//following-sibling::android.view.View[2]";
        By elForHideAccount = x.createByXpath(xPathForHideAccount);
        for(int i = 0; i<10; i++){
            if(hp.isElementNotPresent(elForHideAccount)){
                hp.scrollDown(driver);
            }
        }
        MobileElement elementToHide = x.createMobileElementByXpath(xPathForHideAccount);
        hp.ClickOnElement(elementToHide);
        //String xPath = "//android.view.View[@content-desc=\"Back\"]";
        String xPath="//android.view.View[@content-desc='"+ "Back" + "']";
        By element = x.createByXpath(xPath);
        WaitHelpers.waitForElement(element); // DODATO
        WebDriverWait wait = new WebDriverWait(driver, 15);
        wait.until(ExpectedConditions.elementToBeClickable(element));
        //By element = x.createByXpath(xPath);



        //WaitHelpers.waitForSeconds(3); // DODATO
        hp.clickElement(element);
        By elForLoad = x.createByXpath("//*[@resource-id='nlb-value-product-primary-balance']");
        WaitHelpers.waitForElement(elForLoad);
    }


    @And("Unhide account from Excel {string} columnName {string} if needed V")
    public void unhideAccountFromExcelColumnNameIfNeededV(String rowindex, String columnName) throws Throwable {
        String accountIban = DataManager.getDataFromHashDatamap(rowindex,columnName);
        String text = "Edit list";
        String xPathEditList = "//*[@content-desc='" + text + "']";
        By el = x.createByXpath("//*[@text='" + text + "']");
        WaitHelpers.waitForElement(el);
        MobileElement elementForEdit = x.createMobileElementByXpath("//android.widget.Button[@content-desc=\"Edit list\"]");
        //x.createMobileElementByText("Edit list");
        try{
            hp.ClickOnElement(elementForEdit);
        }
        catch(Exception e) {
            System.out.println("EXCP");
            System.out.println(e.getMessage());
        }

        By elForEye = x.createByXpath("//android.view.View[@content-desc='Alt=\"Show Account\"']");
        WaitHelpers.waitForElement(elForEye);
        String xPathForHideAccount = "//android.view.View[@content-desc='Alt=\"Show Account\"']";
        By elForHideAccount = x.createByXpath(xPathForHideAccount);
        for(int i = 0; i<10; i++){
            if(hp.isElementNotPresent(elForHideAccount)){
                hp.scrollDown(driver);
            }
        }
        MobileElement elementToHide = x.createMobileElementByXpath(xPathForHideAccount);
        hp.ClickOnElement(elementToHide);
        //String xPath = "//android.view.View[@content-desc=\"Back\"]";
        String xPath = "//I0.o0/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View";
        By element = x.createByXpath(xPath);
        hp.clickElement(element);
        By elForLoad = x.createByXpath("//*[@resource-id='nlb-value-product-primary-balance']");
        WaitHelpers.waitForElement(elForLoad);


    }

    @And("Assert that product card of name {string} and iban {string} from Excel {string} for personal account are shown correctly V")
    public void assertThatProductCardOfNameAndIbanFromExcelForPersonalAccountAreShownCorrectlyV(String columnName1, String columnName2, String rowindex) {
        String productName = DataManager.getDataFromHashDatamap(rowindex,columnName1);
        String productIban = DataManager.getDataFromHashDatamap(rowindex,columnName2);
        String xPathForProductCard1 = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Current account\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']//following-sibling::*[@text='Current balance']";
        String xPathForProductCard2 = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Current account\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']//following-sibling::*[@text='Available balance']";
        String xPathForCurrentBalance = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Current account\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']//following-sibling::*[@resource-id='nlb-value-product-primary-balance']";
        String xPathForAvailableBalance = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Current account\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productIban+"']//following-sibling::*[@resource-id='nlb-value-product-secondary-balance']";

        MobileElement elementForProductCard1 = x.createMobileElementByXpath(xPathForProductCard1);
        Assert.assertTrue(elementForProductCard1.isDisplayed());
        MobileElement elementForProductCard2 = x.createMobileElementByXpath(xPathForProductCard2);
        Assert.assertTrue(elementForProductCard2.isDisplayed());
        MobileElement elementForCurrentBalance = x.createMobileElementByXpath(xPathForCurrentBalance);
        String stringForCurrentBalance = elementForCurrentBalance.getAttribute("text");
        Assert.assertTrue(stringForCurrentBalance.matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{2}(.{1})EUR"));
        MobileElement elementForAvailableBalance = x.createMobileElementByXpath(xPathForAvailableBalance);
        String stringForAvailableBalance = elementForAvailableBalance.getAttribute("text");
        Assert.assertTrue(stringForAvailableBalance.matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{2}(.{1})EUR"));
    }
    @And("Change name of product {string} into {string}")
    public void changeNameOfProductInto(String oldName, String newName) throws Throwable {
        String accountIban = oldName;
        By elForEdit = x.createByXpath("//*[@resource-id='nlb-button-edit-products']");
        WaitHelpers.waitForElement(elForEdit);
        MobileElement elementForEdit = d.createMobileElementByResourceId("nlb-button-edit-products");
        hp.ClickOnElement(elementForEdit);
        //By elForEye = x.createByXpath("//android.view.View[@content-desc=\"Edit product card\"]");
        //WaitHelpers.waitForElement(elForEye);
        String xPathForEditAccount =
                "//*[@text='" + accountIban + "']" +
                        "//ancestor::android.view.View[1]" +
                        "//android.view.View[@content-desc='Edit product card']";

        By elForEditAccount = x.createByXpath(xPathForEditAccount);
        for(int i = 0; i<10; i++){
            if(hp.isElementNotPresent(elForEditAccount)){
                hp.scrollDown(driver);
            }
        }

        MobileElement elementToEdit = x.createMobileElementByXpath(xPathForEditAccount);
        hp.ClickOnElement(elementToEdit);
        By elForEditText = x.createByXpath("//android.widget.EditText");
        WaitHelpers.waitForElement(elForEditText);
        hp.enterTextToMobileElement(newName,elForEditText);
        MobileElement elementForApply = x.createMobileElementByXpath("//*[@text='Apply']");
        hp.ClickOnElement(elementForApply);


        String xPath = "//android.view.View[@content-desc=\"Back\"]";
        By element = x.createByXpath(xPath);
        WaitHelpers.waitForElement(element); // DODATO
        WebDriverWait wait = new WebDriverWait(driver, 25);
        wait.until(ExpectedConditions.elementToBeClickable(element));

        hp.clickElement(element);
        By elForLoad = x.createByXpath("//*[@resource-id='nlb-value-product-primary-balance']");
        WaitHelpers.waitForElement(elForLoad);
    }
    @And("Assert Currency transaction filter is displayed correctly")
    public void assertCurrencyTransactionFilterIsDisplayedCorrectly() {
        //filter name
        String xPath1 = "//android.view.View[@resource-id='nlb-settings-menu'][3]/android.widget.TextView[1]";
        MobileElement element1 = x.createMobileElementByXpath(xPath1);
        Assert.assertTrue(element1.isDisplayed());
        Assert.assertEquals("Currency", element1.getAttribute("text"));
        //filter subtitle
        String xPath2 = "//android.view.View[@resource-id='nlb-settings-menu'][3]/android.widget.TextView[2]";
        MobileElement element2 = x.createMobileElementByXpath(xPath2);
        Assert.assertTrue(element2.isDisplayed());
        Assert.assertEquals("Select currency", element2.getAttribute("text"));
        //arrow icon
        /*String xPath3 = "(//android.view.View[@content-desc='Navigate forward'])[2]";
        MobileElement element3 = x.createMobileElementByXpath(xPath3);
        Assert.assertTrue(element3.isDisplayed());*/
    }
    @And("Click on calendar icon with index {string}")
    public void clickOnCalendarIconWithIndex(String index) throws Exception {
        By element = x.createByXpath("(//android.view.View[@content-desc=\"Select date\"])" + "[" + index + "]");
        hp.clickElement(element);
    }


    @And("Assert transaction list is sorted to match conditions {string} {string} {string} {string} {double} {double}")
    public void assertTransactionListIsSortedToMatchConditions(String date1, String date2, String transfer, String currencyToDisable, Double minAmount, Double maxAmount) throws Exception {{

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("d.M.yyyy");
        LocalDate startDate = LocalDate.parse(date1, formatter);
        LocalDate endDate = LocalDate.parse(date2, formatter);

        List<String> listAmount = rh.scrollDownAndPutEveryElementWithIdIntoList("nlb-amount");
        List<String> listCurrency = rh.scrollDownAndPutEveryElementWithIdIntoList("nlb-currency");
        List<String> listDate = rh.scrollDownAndPutEveryElementWithIdIntoList("nlb-date");

        int size = listAmount.size();
        for (int i = 0; i < size; i++) {
            String amountStr = listAmount.get(i);
            String currency = listCurrency.get(i);
            String dateStr = listDate.get(i);
            dateStr = normalizeDate2(dateStr);
            // Normalizacija amount-a
            String normalized = amountStr.replace(".", "").replace(",", ".").replace("−", "-");
            Float amount = Float.valueOf(normalized);

            if (amount < minAmount || amount > maxAmount) {
                System.out.println("GRESKA, FILTER ZA AMOUNT NE RADI: " + amount);
                Assert.fail();
            }

            if (Objects.equals(currency, currencyToDisable)) {
                System.out.println("GRESKA, FILTER ZA CURRENCY NE RADI: " + amount);
                Assert.fail();
            }

            if ((Objects.equals(transfer, "Incoming") && normalized.startsWith("-")) ||
                    (Objects.equals(transfer, "Outgoing") && !normalized.startsWith("-"))) {
                System.out.println("GRESKA, FILTER ZA TRANSFER(OUTGOING/INCOMING) NE RADI: " + amount);
                Assert.fail();
            }

            // Provera datuma
            try {
                LocalDate transactionDate = LocalDate.parse(dateStr, formatter);
                if (transactionDate.isBefore(startDate) || transactionDate.isAfter(endDate)) {
                    System.out.println("GRESKA, FILTER ZA DATE NE RADI: " + dateStr);
                    Assert.fail();
                }
            } catch (DateTimeParseException e) {
                System.out.println("GRESKA, NEVALIDAN FORMAT DATUMA: " + dateStr);
                Assert.fail();
            }

            System.out.println("Iznos transakcije: " + amount + " " + currency + " " + dateStr);
        }
    }
    }

    private String normalizeDate2(String raw) {
        // Uklanja sve vrste whitespace, uključujući non-breaking space
        raw = raw.replaceAll("[\\s\\u00A0]+", "");

        // Split (30, 6, 2025)
        String[] parts = raw.split("\\.");
        System.out.print("PARTS" + parts);
        String day = String.format("%02d", Integer.parseInt(parts[0]));
        String month = String.format("%02d", Integer.parseInt(parts[1]));
        String year = parts[2];

        return day + "." + month + "." + year;
    }


    @And("Assert product from Excel {string} with bban {string} has name {string} V")
    public void assertProductFromExcelWithIbanHasNameV(String rowindex, String columnName, String expectedName) {
        String accountIban = DataManager.getDataFromHashDatamap(rowindex,columnName);
        String xPathForName = "//*[@text='"+accountIban+"']//preceding-sibling::*[@text='"+expectedName+"']";
        MobileElement elementForName = x.createMobileElementByXpath(xPathForName);
        Assert.assertTrue(elementForName.isDisplayed());
    }

    @Then("Change name of product from Excel {string} columnName {string} into {string} V")
    public void changeNameOfProductFromExcelColumnNameIntoV(String rowindex, String columnName, String newName) throws Throwable {
        String accountIban = DataManager.getDataFromHashDatamap(rowindex,columnName);
        By elForEdit = x.createByXpath("//*[@resource-id='nlb-button-edit-products']");
        WaitHelpers.waitForElement(elForEdit);
        MobileElement elementForEdit = d.createMobileElementByResourceId("nlb-button-edit-products");
        hp.ClickOnElement(elementForEdit);
        //By elForEye = x.createByXpath("//android.view.View[@content-desc=\"Edit product card\"]");
        //WaitHelpers.waitForElement(elForEye);
        String xPathForEditAccount =
                "//*[@text='" + accountIban + "']" +
                        "//ancestor::android.view.View[1]" +
                        "//android.view.View[@content-desc='Edit product card']";

        By elForEditAccount = x.createByXpath(xPathForEditAccount);
        for(int i = 0; i<10; i++){
            if(hp.isElementNotPresent(elForEditAccount)){
                hp.scrollDown(driver);
            }
        }

        MobileElement elementToEdit = x.createMobileElementByXpath(xPathForEditAccount);
        hp.ClickOnElement(elementToEdit);
        By elForEditText = x.createByXpath("//android.widget.EditText");
        WaitHelpers.waitForElement(elForEditText);
        //DODATO KLIK NA X
        String xp = "//android.view.ViewGroup/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View";
        MobileElement xButton = x.createMobileElementByXpath(xp);
        hp.ClickOnElement(xButton);
        WaitHelpers.waitForSeconds(2);

        //DODATO
        hp.enterTextToMobileElement(newName,elForEditText);
        MobileElement elementForApply = x.createMobileElementByXpath("//*[@text='Apply']");
        hp.ClickOnElement(elementForApply);


        String xPath = "//android.view.View[@content-desc=\"Back\"]";
        By element = x.createByXpath(xPath);
        WaitHelpers.waitForElement(element); // DODATO
        WebDriverWait wait = new WebDriverWait(driver, 60);
        wait.until(ExpectedConditions.elementToBeClickable(element));

        hp.clickElement(element);
        By elForLoad = x.createByXpath("//*[@resource-id='nlb-value-product-primary-balance']");
        WaitHelpers.waitForElement(elForLoad);
    }



    @And("Change name of {string} from Excel {string} to previous name")
    public void changeNameOfFromExcelToPreviousName(String columnName, String rowindex) throws Throwable {
        String accountIban = DataManager.getDataFromHashDatamap(rowindex,columnName);
        By elForEdit = x.createByXpath("//*[@resource-id='nlb-button-edit-products']");
        WaitHelpers.waitForElement(elForEdit);
        MobileElement elementForEdit = d.createMobileElementByResourceId("nlb-button-edit-products");
        hp.ClickOnElement(elementForEdit);
        //By elForEye = x.createByXpath("//android.view.View[@content-desc=\"Edit product card\"]");
        //WaitHelpers.waitForElement(elForEye);
        String xPathForEditAccount =
                "//*[@text='" + accountIban + "']" +
                        "//ancestor::android.view.View[1]" +
                        "//android.view.View[@content-desc='Edit product card']";

        By elForEditAccount = x.createByXpath(xPathForEditAccount);
        for(int i = 0; i<10; i++){
            if(hp.isElementNotPresent(elForEditAccount)){
                hp.scrollDown(driver);
            }
        }

        MobileElement elementToEdit = x.createMobileElementByXpath(xPathForEditAccount);
        hp.ClickOnElement(elementToEdit);
        By elForEditText = x.createByXpath("//android.widget.EditText");
        WaitHelpers.waitForElement(elForEditText);
        //DODATO KLIK NA X
        String xp = "//android.view.ViewGroup/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View";
        MobileElement xButton = x.createMobileElementByXpath(xp);
        hp.ClickOnElement(xButton);
        MobileElement elementForApply = x.createMobileElementByXpath("//*[@text='Apply']");
        hp.ClickOnElement(elementForApply);

    }

    @And("Assert that products in My products page is loaded")
    public void assertThatProductsInMyProductsPageIsLoaded() throws Exception {
        By element = x.createByXpath("//android.widget.TextView[@text=\"My Products\"]");
        hp.clickElement(element);

        By productXpath = By.xpath("//android.view.View[@resource-id='nlb-product-summary-card']");
        WaitHelpers.waitForElement(productXpath);

        String xPath = "//android.widget.TextView[@text=\"Term deposit amount\"]";
        By lastProductLabel  = By.xpath(xPath);

        for(int i = 0; i<35; i++){
            if(hp.isElementNotPresent(lastProductLabel )){
                hp.scrollDown(driver);
            }
        }

        List<WebElement> products = driver.findElements(productXpath);
        Assert.assertTrue("Nijedan proizvod nije učitan!", products.size() > 0);

        Assert.assertFalse("Poslednji proizvod ('Term deposit amount') nije učitan ni posle skrolovanja!",
                hp.isElementNotPresent(lastProductLabel));
    }

    @Then("Assert amount and currency are displayed by Android xpath {string}")
    public void assertAmountAndCurrencyAreDisplayedByAndroidXpath(String xPath) {
        WebElement element = driver.findElement(By.xpath(xPath));
        Assert.assertTrue("Amount and currency are not displayed!", element.isDisplayed());

        String text = element.getText();
        System.out.println("Vraceni element: " + text);

        Assert.assertTrue("Amount not found in text!", text.matches(".*\\d.*"));
        Assert.assertTrue("Currency not found in text!", text.matches(".*[A-Za-z]{3}.*"));
    }

    @And("Assert Product number is in BBAN format by xPath {string}")
    public void assertProductNumberIsInBBANFormatByXPath(String xPath) {
        MobileElement element = x.createMobileElementByXpath(xPath);
        String accountNumber = element.getText().trim();

        Assert.assertTrue(accountNumber.matches("^\\d{3}-\\d{13}-\\d{2}$"));
    }

    @And("Assert that whole product card of term deposit account with name {string} and bban {string} from Excel {string} acts as a clickable button")
    public void assertThatWholeProductCardOfTermDepositAccountWithNameAndBbanFromExcelActsAsAClickableButton(String columnName1, String columnName2, String rowindex) throws Throwable {
        String productName = DataManager.getDataFromHashDatamap(rowindex,columnName1);
        String productBban = DataManager.getDataFromHashDatamap(rowindex,columnName2);
        String xPathForProductName = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Deposit\"]//following-sibling::*[@text='"+productName+"']";
        String xPathForProductBban = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Deposit\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productBban+"']";
        String xPathForProductCard1 = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Deposit\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productBban+"']//following-sibling::*[@text='Term deposit amount']";
        String xPathForCurrentBalance = "//*[@resource-id='nlb-product-summary-card']//android.view.View[@content-desc=\"Deposit\"]//following-sibling::*[@text='"+productName+"']//following-sibling::*[@text='"+productBban+"']//following-sibling::*[@resource-id='nlb-value-product-primary-balance']";
        String xPathForAssert = "//*[@resource-id='nlb-header-card']";
        String xPathForLoad = "//*[@resource-id='nlb-value-product-primary-balance']";

        MobileElement elementForProductName = x.createMobileElementByXpath(xPathForProductName);
        hp.ClickOnElement(elementForProductName);
        By elWait1 = x.createByXpath(xPathForAssert);
        WaitHelpers.waitForElement(elWait1);
        MobileElement elementForAssert1 = x.createMobileElementByXpath(xPathForAssert);
        Assert.assertTrue(elementForAssert1.isDisplayed());
        driver.navigate().back();
        By elForLoad1 = x.createByXpath(xPathForLoad);
        WaitHelpers.waitForElement(elForLoad1);

//        MobileElement elementForProductBban = x.createMobileElementByXpath(xPathForProductBban);
//        hp.ClickOnElement(elementForProductBban);
//        By elWait2 = x.createByXpath(xPathForAssert);
//        WaitHelpers.waitForElement(elWait2);
//        MobileElement elementForAssert2 = x.createMobileElementByXpath(xPathForAssert);
//        Assert.assertTrue(elementForAssert2.isDisplayed());
//        driver.navigate().back();
//        By elForLoad2 = x.createByXpath(xPathForLoad);
//        WaitHelpers.waitForElement(elForLoad2);
//
//        MobileElement elementForProductCard1 = x.createMobileElementByXpath(xPathForProductCard1);
//        hp.ClickOnElement(elementForProductCard1);
//        By elWait3 = x.createByXpath(xPathForAssert);
//        WaitHelpers.waitForElement(elWait3);
//        MobileElement elementForAssert3 = x.createMobileElementByXpath(xPathForAssert);
//        Assert.assertTrue(elementForAssert3.isDisplayed());
//        driver.navigate().back();
//        By elForLoad3 = x.createByXpath(xPathForLoad);
//        WaitHelpers.waitForElement(elForLoad3);
//
//        MobileElement elementForCurrentBalance = x.createMobileElementByXpath(xPathForCurrentBalance);
//        hp.ClickOnElement(elementForCurrentBalance);
//        By elWait5 = x.createByXpath(xPathForAssert);
//        WaitHelpers.waitForElement(elWait5);
//        MobileElement elementForAssert5 = x.createMobileElementByXpath(xPathForAssert);
//        Assert.assertTrue(elementForAssert5.isDisplayed());
//        driver.navigate().back();
//        By elForLoad5 = x.createByXpath(xPathForLoad);
//        WaitHelpers.waitForElement(elForLoad5);
    }

    @And("Assert button Apply in Calendar is enabled")
    public void assertButtonApplyInCalendarIsEnabled() {
        String xPath = "//android.widget.TextView[@text='Apply']/following-sibling::android.widget.Button";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
        Assert.assertTrue(element.isEnabled());
    }

    @And("Click on button Apply in Calendar")
    public void clickOnButtonApplyInCalendar() throws Exception {
        String xPath = "//android.widget.TextView[@text='Apply']/following-sibling::android.widget.Button";
        By element = x.createByXpath(xPath);
        hp.clickElement(element);
    }

    @And("Assert account number is displayed in BBAN format by xPath {string}")
    public void assertAccountNumberIsDisplayedInBBANFormatByXPath(String xPath) {
        MobileElement element = x.createMobileElementByXpath(xPath);
        String accountNumber = element.getText().trim();

        Assert.assertTrue(element.isDisplayed());
        Assert.assertTrue(accountNumber.matches("^\\d{3}-\\d{13}-\\d{2}$"));
    }

    @And("Assert account name from excel {string} column name {string} is displayed")
    public void assertAccountNameFromExcelColumnNameIsDisplayed(String rowindex, String columnName) {
        String text = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPath = "//*[@text='" + text + "']";
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert element by xPath {string} is displayed")
    public void assertElementByXPathIsDisplayed(String xPath) {
        MobileElement element = x.createMobileElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }
}