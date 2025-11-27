package si.nlb.testautomation.NLBMobileAutomation.Test;
import org.junit.runner.JUnitCore;
import si.nlb.testautomation.NLBMobileAutomation.Action.Queries;
import si.nlb.testautomation.NLBMobileAutomation.Core.Base;
import si.nlb.testautomation.NLBMobileAutomation.Data.DataManager;
import si.nlb.testautomation.NLBMobileAutomation.Data.ExcelFactory;
import si.nlb.testautomation.NLBMobileAutomation.Helpers.Utilities;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class RunTest {

    // helper main class to run Cucumber tests

    public static void main(String[] args) throws SQLException {
        String testRunsStartTime = DataManager.DateHHMMSS();
        Base.AppiumServerJava appiumServer = new Base.AppiumServerJava();

        int port = 4723;
        if (!appiumServer.checkIfServerIsRunnning(port)) {

            System.out.println("Starting Appium Server on port - " + port);
            appiumServer.startServer();
            Runtime.getRuntime().addShutdownHook(new Thread(new Runnable() {
                @Override
                public void run() {
                    System.out.println("Stopping Appium server");
                    appiumServer.stopServer();
                }
            }));
        } else {
            System.out.println("Appium Server already running on Port - " + port);
        }

        Utilities.replaceTestrailExcelFile();

        //JUnitCore.main("si.nlb.testautomation.NLBMobileAutomation.Test.Runner");
        try{
            JUnitCore.runClasses(Runner.class);
        } catch(Exception e){
            System.out.println(e.getMessage());
        }
        Utilities.trySaveResults(DataManager.resultContainer);

        DataManager.tryCallTestrail();
        //Added for running failed tests again
        //Utilities.replaceExecutionListWithFailedExecutionList();
        //Utilities.savePreviousTestResults();

        try {
            Utilities.archiveStatusFile();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        ExcelFactory.writeTestRunValueInConfigurationExcel("0");
        //Utilities.copyFileToServer();

    }
}
