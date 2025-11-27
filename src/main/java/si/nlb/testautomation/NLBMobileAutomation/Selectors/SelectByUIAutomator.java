package si.nlb.testautomation.NLBMobileAutomation.Selectors;

import io.appium.java_client.MobileBy;
import org.junit.Assert;
import org.openqa.selenium.By;
import si.nlb.testautomation.NLBMobileAutomation.Action.ActionApiHelpers;
import si.nlb.testautomation.NLBMobileAutomation.Helpers.Log;
import si.nlb.testautomation.NLBMobileAutomation.Test.Hooks;

public class SelectByUIAutomator {
    //region - parameters -
    ActionApiHelpers a = new ActionApiHelpers();
    //endregion - parameters -

    //region - Methods -
    /**
     * Asserts element with resource ID in parameter @id, and index in parameter @index
     * @param id Resource ID
     * @param index Index
     * @return By element
     * @throws Throwable
     */
    public By assertElementByIdIndex(String id, String index) throws Throwable {
        By by = MobileBy.AndroidUIAutomator("new UiSelector().index(" + index + ").resourceId(\"" + Hooks.resourceId + id + "\")");
        if (a.isElementDisplayed(by))
            Log.info("!!!!!!!!!!!!Element with index: " + id + " is present !!!!!!");
        else
            Log.error("!!!!!!!!!!!!Element with index: " + id + " is NOT present !!!!!!");
        Assert.assertTrue(a.isElementDisplayed(by));
        return by;
    }

    /**
     * Creates By element by visible text in parameter @text
     * @param text String - visible text
     * @return By element
     * @throws Throwable Error
     */
    public By createElementByVisibleText(String text) throws Throwable {
        String script = "new UiScrollable(new UiSelector().scrollable(true).instance(0)).scrollIntoView(new UiSelector().textContains(\"" + text + "\").instance(0))";
        return MobileBy.AndroidUIAutomator(script);
    }
    //region - methods -
}
