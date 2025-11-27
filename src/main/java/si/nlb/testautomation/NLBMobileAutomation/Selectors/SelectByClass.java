package si.nlb.testautomation.NLBMobileAutomation.Selectors;

import io.appium.java_client.MobileBy;
import org.openqa.selenium.By;

/**
 * Class for crating element by class name
 */
public class SelectByClass {

    //region - Methods -
    /**
     * Returns By element searched by class name
     * @param className class name
     * @return By element
     */
    public By createElementByClassName(String className) {
        return  MobileBy.className(className);
    }
    //endregion - Methods -
}
