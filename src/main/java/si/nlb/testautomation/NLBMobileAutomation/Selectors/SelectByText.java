package si.nlb.testautomation.NLBMobileAutomation.Selectors;

import io.appium.java_client.MobileElement;
import si.nlb.testautomation.NLBMobileAutomation.Core.Base;
import io.appium.java_client.MobileBy;
import org.openqa.selenium.By;

import static si.nlb.testautomation.NLBMobileAutomation.Core.Base.driver;

/**
 * Class for crating element by xPath, by text attribute
 */
public class SelectByText {

    //region - Simple methods -
    /**
     * Creates element that attribute text is equal parameter @text
     * Overloaded method.
     * Pattern //*[@text = "my-name"]
     * @param text String, text to search
     * @return By element
     */
    public By createElementByText(String text) {
        By element = null;
        if (Base.testPlatform.equals("Android")) {
            element = MobileBy.xpath("//*[@text = \"" + text + "\"]");
        }
        if (Base.testPlatform.equals("iOS")) {
            element = MobileBy.xpath("//*[@text = \"" + text + "\"]");
        }
        return element;
    }

    public By createElementByTagAndText(String tag, String text) {
        By element = null;
        if (Base.testPlatform.equals("Android")) {
            element = MobileBy.xpath("//android.widget."+tag+"[@text='"+text+"']");
        }
        if (Base.testPlatform.equals("iOS")) {
            element = MobileBy.xpath("//android.widget."+tag+"[@text='"+text+"']");
        }
        return element;
    }

    /**
     * Creates element that attribute text contains parameter @text
     * Overloaded method.
     * Pattern //*[contains(@text, "my-name")]
     * @param text String, text to search
     * @return By element
     */
    public By createElementByTextContains(String text) {
        By element = null;
        if (Base.testPlatform.equals("Android")) {
            element = MobileBy.xpath("//*[contains(@text,'" + text + "')]");
        }
        if (Base.testPlatform.equals("iOS")) {
            element = MobileBy.xpath("//*[contains(@name,\"" + text + "\")]");
        }
        return element;
    }

    /**
     * Creates element that attribute text is equal parameter @text with index equals parameter @index
     * Overloaded method.
     * Pattern //*[@text = "my-name"]
     * @param text String, text to search
     * @param index String index of searched element in String format.
     * @return By element
     */
    public By createElementByText(String text, String index) {
        By element = null;
        if (Base.testPlatform.equals("Android")) {
            element = MobileBy.xpath("//*[@text = \"" + text + "\"][" + index + "]");
        }
        if (Base.testPlatform.equals("iOS")) {
            element = MobileBy.xpath("//*[@text = \"" + text + "\"][" + index + "]");
        }
        return element;
    }

    /**
     * Creates element that attribute text contains parameter @text with index equals parameter @index
     * Overloaded method.
     * Pattern //*[contains(@text, "my-name")]
     * @param text String, text to search
     * @param index String index of searched element in String format.
     * @return By element
     */
    public By createElementByTextContains(String text, String index) {
        By element = null;
        if (Base.testPlatform.equals("Android")) {
            element = MobileBy.xpath("//*[contains(@text,'" + text + "')][" + index + "]");
        }
        if (Base.testPlatform.equals("iOS")) {
            element = MobileBy.xpath("//*[contains(@name,\"" + text + "\")][" + index + "]");
        }
        return element;
    }
    //endregion - Simple methods -

    //region - Utils -
    public By createElementByStaticText(String text) {
        By element = null;
        if (Base.testPlatform.equals("iOS")) {
            element = MobileBy.xpath("(//XCUIElementTypeStaticText[@name=\"" + text + "\"])[1]");
        }
        if (Base.testPlatform.equals("Android")) {
            element = MobileBy.xpath("//android.widget.LinearLayout//*[@text = '" + text + "']");
        }
        return element;
    }

    //endregion - Utils -

    /**
     * Returns By element with text which contains text in parameter @text2 preceding text equal
     * text in parameter @text1
     * @param text1 preceding text
     * @param text2 searched text
     * @return By element
     */
    public By createElementByTextPrecedingText(String text1, String text2) {
        return MobileBy.xpath("//android.widget.LinearLayout//*[@text = '"+text1+"']/preceding::*[contains(@text,'"+text2+"')][1]");
    }

}
