package si.nlb.testautomation.NLBMobileAutomation.Selectors;

import io.appium.java_client.MobileElement;
import org.junit.Assert;
import si.nlb.testautomation.NLBMobileAutomation.Action.ActionApiHelpers;
import si.nlb.testautomation.NLBMobileAutomation.Core.Base;
import si.nlb.testautomation.NLBMobileAutomation.Helpers.Log;
import si.nlb.testautomation.NLBMobileAutomation.Test.Hooks;
import io.appium.java_client.MobileBy;
import org.openqa.selenium.By;

import java.util.List;

import static si.nlb.testautomation.NLBMobileAutomation.Core.Base.driver;

import java.util.List;

/**
 * Class for creating elements by xPath
 */
public class SelectByXpath {
    //region - parameters -
    ActionApiHelpers a = new ActionApiHelpers();
    //endregion - parameters -

    //region - Methods -
    /**
     * Returns By element by string parameter xPath
     * @param xPath xPath for creating element.
     * @return By element
     */
    public By createByXpath(String xPath) {
        By element = null;
        if (Base.testPlatform.equals("iOS")) {
            element = MobileBy.xpath(xPath);
        }
        if (Base.testPlatform.equals("Android")) {
            element = MobileBy.xpath(xPath);
        }
        return element;
    }

    /**
     * Returns By element with name equals parameter @text and index in parameter index
     * @param text Name of element
     * @param index Index of element
     * @return By Element
     * @throws Throwable
     */
    public By createButtonNameIndex(String text, String index) throws Throwable {
        By el = MobileBy.xpath("(//XCUIElementTypeButton[@name='"+text+"'])["+index+"]");
        Assert.assertTrue(a.isElementDisplayed(el));
        return el;
    }
    //endregion - Methods -

    //region - Methods from old project -
    /**
     * Custom function for finding currency
     * Find element with name in parameter currency that following sibling element with name in parameter text
     * @param text Name of parameter in front of currency
     * @param currency Currency code
     * @return By element
     */
    public By createCurrency(String text, String currency){
        By element = null;
        if (Base.testPlatform.equals("iOS")) {
            element = MobileBy.xpath("//XCUIElementTypeStaticText[@name=\"" + text + "\"]/following-sibling::*[@name=\""+currency+"\"]");
        }
        if (Base.testPlatform.equals("Android")) {
            element = MobileBy.xpath("//android.widget.LinearLayout//*[@text = '" + text + "']/following::android.widget.LinearLayout[2]//*[@text = '"+currency+"']");
        }
        return element;
    }

    /**
     * Returns By element preceding element with text equal parameter @text
     * @param text Text to search
     * @return By element
     */
    public By createLayoutPrecedingText(String text) {
        return MobileBy.xpath("//android.widget.LinearLayout//*[@text = '"+text+"']/preceding::android.widget.RelativeLayout[1]");
    }

    /**
     * Returns By element with special characteristics. Third ancestor of element with name equals parameter @text
     * then index of element
     * @param index Index of element
     * @param text Name of element
     * @return By element
     * @throws Throwable
     */
    public By createOtherPrecedingText(String index, String text) throws Throwable {
        By el =  null;
        if (Base.testPlatform.equals("iOS")) {
            el = MobileBy.xpath("(//*[@name='"+text+"']/../../../XCUIElementTypeOther)["+index+"]");
        }
        Assert.assertTrue(a.isElementDisplayed(el));
        return el;
    }

    /**
     * Search XCUIElementTypeSecureTextField with index descendant element in parameter @text
     * Only for iOS
     * @param index String index of element in the view
     * @param text String, text to search
     * @return By element
     * @throws Throwable Error
     */
    public By secureFieldPrecedingText(String index, String text) throws Throwable {
        By inputField =  null;
        if (Base.testPlatform.equals("iOS")) {
            inputField = MobileBy.xpath("(//*[contains(@name,'"+text+"')]/../../XCUIElementTypeSecureTextField)["+index+"]");
        }
        Assert.assertTrue(a.isElementDisplayed(inputField));
        return inputField;
    }

    /**
     * Creating XCUIElementType element with index in parameter @index
     * @param text String, text to search
     * @param index String, index of element in the view
     * @return By element
     */
    public By createTypeTextField(String text,String index){
        By element = null;

        if (Base.testPlatform.equals("iOS"))
            element = MobileBy.xpath("(//XCUIElementTypeOther/XCUIElementType"+text+"[1])["+index+"]");
        return element;
    }

    /**
     * Custom method for searching elements in array.
     * Pin for every digit has separate element.
     * @param text name of the element
     * @param index String - index of element.
     * @return By Element
     */
    public By createInputPINElement(String text, String index) {
        By element = null;
        if (Base.testPlatform.equals("iOS")) {
            element = MobileBy.xpath("(//XCUIElementTypeStaticText[@name=\"" + text + "\"]/../XCUIElementTypeOther)[" + index + "]/XCUIElementTypeOther");
        }
        if (Base.testPlatform.equals("Android")) {
            element = MobileBy.xpath("//*[@text = '" + text + "']/../android.widget.LinearLayout[" + index + "]/android.widget.LinearLayout/android.widget.EditText");
        }
        return element;
    }

    public MobileElement createMobileElementByXpath(String xPath) {
        MobileElement element = null;
        if (Base.testPlatform.equals("iOS")){
            element = (MobileElement) driver.findElementByXPath(xPath);
        }
        if (Base.testPlatform.equals("Android")){
            element = (MobileElement) driver.findElementByXPath(xPath);
        }
        return element;
    }

    public MobileElement createMobileElementByTagAndName(String tag, String name) {
        MobileElement element = null;
        String xPath = "//" + tag + "[@name='" + name + "']";
        if (Base.testPlatform.equals("iOS")){
            element = (MobileElement) driver.findElementByXPath(xPath);
        }
        if (Base.testPlatform.equals("Android")){
            element = (MobileElement) driver.findElementByXPath(xPath);
        }
        return element;
    }

    public By createByXpathTextWithFollowingSiblingId(String text, String id) {
        String xPath = "//android.widget.TextView[@text='"+text+"']/following-sibling::*[@resource-id='"+id+"']";
        return createByXpath(xPath);
    }

    public List<MobileElement> createMobileElementsByXpath(String xPath) {
        return (List<MobileElement>) Base.driver.findElementsByXPath(xPath);
    }
    //endregion - Methods from old project -

    public List<MobileElement> createElementsByXpath(String xpath) {
        return (List<MobileElement>) Base.driver.findElementsByXPath(xpath);
    }

    //region - Name -

    /**
     * Returns By by tag name and element name, using xpath method
     * pattern: //XCUIElementTypeButton[@name="Login to NLB Klik - BETA"]
     * @param tagName - Name of the tag
     * @param elementName - Name of the element
     * @return By element
     */
    public By createByTagAndName(String tagName, String elementName){
        String xPath = "//" + tagName + "[@name=\"" + elementName + "\"]";
        return createByXpath(xPath);
    }

    /**
     * Returns By by tag name and element name, using xpath method
     * @param elementName
     * @return
     */
    public By createByName(String elementName){
        String xPath = "//*[@name=\"" + elementName + "\"]";
        return createByXpath(xPath);
    }

    public List<MobileElement> createElementsByName(String elementName){
        String xPath = "//*[@name=\"" + elementName + "\"]";
        return createElementsByXpath(xPath);
    }
    //endregion - Name -

    //region - iOS text -
    public By createBySomeTextAfterTextInStaticElement(String staticText){
        String xPath = "//XCUIElementTypeStaticText[@name=\"" + staticText + "\"]/preceding-sibling::XCUIElementTypeStaticText[@name!=\"" + staticText + "\"]";
        return  createByXpath(xPath);
    }

    public MobileElement createMobileElementByText(String text) {
        MobileElement element = null;
        String xPath = "//*[@text='" + text + "']";
        if (Base.testPlatform.equals("iOS")){
            element = (MobileElement) driver.findElementByXPath(xPath);
        }
        if (Base.testPlatform.equals("Android")){
            element = (MobileElement) driver.findElementByXPath(xPath);
        }
        return element;
    }

    public MobileElement createMobileElementByContainsText(String text) {
        MobileElement element = null;
        String xPath = "//*[contains(@text,'"+text+"')]";
        if (Base.testPlatform.equals("iOS")){
            element = (MobileElement) driver.findElementByXPath(xPath);
        }
        if (Base.testPlatform.equals("Android")){
            element = (MobileElement) driver.findElementByXPath(xPath);
        }
        return element;
    }

    public MobileElement createMobileElementByIdAndContainsText(String id, String text) {
        MobileElement element = null;
        String xPath = "//*[@resource-id = '"+id+"' and contains(@text,'"+text+"')]";
        if (Base.testPlatform.equals("iOS")){
            element = (MobileElement) driver.findElementByXPath(xPath);
        }
        if (Base.testPlatform.equals("Android")){
            element = (MobileElement) driver.findElementByXPath(xPath);
        }
        return element;
    }

    public By createByText(String text) {
        String xPath = "//*[@text=\"" + text + "\"]";
        return createByXpath(xPath);
    }




    //endregion - iOS text -

}
