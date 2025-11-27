package si.nlb.testautomation.NLBMobileAutomation.Wait;

import org.openqa.selenium.*;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import si.nlb.testautomation.NLBMobileAutomation.Core.Base;
import si.nlb.testautomation.NLBMobileAutomation.Helpers.Log;

/**
 * Class for methods for waiting.
 */
public class WaitHelpers {
    //region - Parameters -
    protected static WebDriverWait waitVar=null;
    private static String getErrorMessage = "";
    //endregion - Parameters -

    //region - Methods -
    /**
     * Method for waiting on By element with timeout in seconds.
     * @param element By element for waiting,
     * @param time Int time in seconds.
     */
    public static void waitForElement(By element, int time) {
        try {
            waitVar = new WebDriverWait(Base.driver, time);
            waitVar.until(ExpectedConditions.presenceOfElementLocated(element));
        } catch (Exception e) {
            Log.error("Error " + e);
        }
    }

    public static void waitForElementToDisappear(By element, int time) {
        try {
            waitVar = new WebDriverWait(Base.driver, time);
            //waitVar.until(ExpectedConditions.presenceOfElementLocated(element));
            waitVar.until(ExpectedConditions.invisibilityOfElementLocated(element));
        } catch (Exception e) {
            Log.error("Error " + e);
        }
    }

    public static void waitForElement(By element) {
        try {
            waitVar = new WebDriverWait(Base.driver, 50);
            waitVar.until(ExpectedConditions.presenceOfElementLocated(element));
        } catch (Exception e) {
            Log.error("Error " + e);
        }
    }

    /**
     * Method for waiting WebElement.
     * @param element WebElement for waiting.
     * @param elementName Text for log.
     * @throws InterruptedException or NoSuchElementException
     */
    public static void WaitForElement(WebElement element, String elementName) throws InterruptedException {
        for (int i = 1; i <= 30; i = i + 1) {
            try {
                element.isDisplayed();
                break;
            } catch (NoSuchElementException e) {
                Thread.sleep(500);
                if (i == 30) {
                    getErrorMessage = e.getMessage();
                    Log.info("Element " + elementName + " is not displayed!!!");
                    Log.info(getErrorMessage);
                }
            }
        }
    }

    /**
     * Method for idle waiting
     * @param time - seconds for waiting
     */
    public static void waitForSeconds(long time)
    {
        try {
            Thread.sleep(time * 1000);
        }
        catch (Exception e){
            Log.error("Error "+e);
        }
    }
    //endregion - Methods -
}
