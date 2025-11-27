package si.nlb.testautomation.NLBMobileAutomation.Test;


import io.cucumber.core.gherkin.Step;
import io.cucumber.java.*;
import io.cucumber.plugin.event.*;
import io.cucumber.java.After;
import io.cucumber.java.Before;
import io.cucumber.java.AfterStep;
import io.cucumber.java.BeforeStep;
import org.apache.commons.io.FileUtils;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.junit.AssumptionViolatedException;
import org.junit.BeforeClass;
import org.junit.Test;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import si.nlb.testautomation.NLBMobileAutomation.Action.Queries;
import si.nlb.testautomation.NLBMobileAutomation.Core.Base;
import si.nlb.testautomation.NLBMobileAutomation.Data.DataManager;
import si.nlb.testautomation.NLBMobileAutomation.Data.ExcelFactory;
import si.nlb.testautomation.NLBMobileAutomation.Helpers.Log;
import si.nlb.testautomation.NLBMobileAutomation.Helpers.Utilities;

import java.lang.reflect.Field;
import java.sql.SQLException;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class Hooks {
   public static String FeatureName = "";
    String ScName = "";
    public static String FeaturePlatform = "";
public static String rowinConfExcel = "";
public static String resourceId = "";
public static String bundleId = "";
public static String PlatformeName="";
public static String DeviceName="";
public static String PlatformVersion="";
public static String dbWriteResults="";
public static String App="";
public static String nativeElement="android:id/";

public static String testRun = "";

private int currentStepDefIndex = 0;



   private static Map<String, Integer> multiDeviceCounter = new HashMap<>();
    String FeatureId = "";
    String FeaturePriority = "";
    LocalDateTime t;
    LocalDateTime stepT;

    @BeforeStep
    public void beforeStepFunction(Scenario scenario){
        stepT = Utilities.now();
        currentStepDefIndex++;
    }

    @AfterStep
    public void afterStepFunction(Scenario scenario) throws IOException, SQLException {
        //System.out.println(StepDetails.stepName);
        if (dbWriteResults.equals("ON")){
            String strDate = new SimpleDateFormat("dd_MM_yyyy_HH_mm").format(Calendar.getInstance().getTime());
            String stepName = StepDetails.stepName;
            String stepCode = Utilities.getMethodCode(stepName).toString();
            String stepEndTime = Utilities.now().toString();
            String stepDuration = Utilities.timeBetween(Utilities.now(), stepT);
            File file = ((TakesScreenshot) Base.driver).getScreenshotAs(OutputType.FILE);
            String screenshotName = scenario.getName() + "_" + strDate + ".jpg";
            FileUtils.copyFile(file, new File("results/" + screenshotName));
            Queries.writeToTestStepTable(currentStepDefIndex,stepCode,stepName,screenshotName,stepT.toString(),stepEndTime,stepDuration,t.toString());
        }
    }


    /**
     * checks if should skip scenario based on listForExecution,
     * creates driver and gets data from excel file testdata/<Feature Name>.xlsx to be used in test
     * */
    @Before
    public void beforeHookFunction(Scenario scenario) throws IOException, InvalidFormatException, InterruptedException, SQLException {
        boolean multiDevice = scenario.getSourceTagNames().contains("@multidevice");
        ScName = scenario.getName();
        DataManager.userObject.clear();
        if(multiDevice) {
            Integer occurence = multiDeviceCounter.getOrDefault(scenario.getName(), 1);
            rowinConfExcel = ExcelFactory.ReadExcelByKey("testdata/execute.xlsx", "TestName", ScName,"Platforme", occurence);
            multiDeviceCounter.put(scenario.getName(), occurence + 1);
        } else {
            rowinConfExcel = ExcelFactory.ReadExcelByKey("testdata/execute.xlsx", "TestName", ScName,"Platforme");
        }

        //resourceId =  ExcelFactory.ReadExcelByKey("testdata/configuration_environment.xlsx", "Active", "on", "resource_id");
        resourceId = "";
        bundleId =  ExcelFactory.ReadExcelByKey("testdata/configuration_environment.xlsx", "Active", "on", "bundle_id");
        Base.env = ExcelFactory.ReadExcelByKey("testdata/configuration_environment.xlsx", "Active", "on", "Environment");
        dbWriteResults = ExcelFactory.ReadExcelByKey("testdata/configuration_environment.xlsx", "Active", "on", "dbWriteResults");

        if(!DataManager.listForExecution.contains(ScName))
        {
            throw new AssumptionViolatedException("skip test");
        }
        //Runtime.getRuntime().exec(cmdstr);
        Base base = new Base();
        base.createDriver();
        FeatureName = ExcelFactory.ReadExcelByKey("testdata/execute.xlsx", "TestName", ScName, "Feature");
        FeatureId = ExcelFactory.ReadExcelByKey("testdata/execute.xlsx","TestName",ScName,"ID");
        FeaturePriority = ExcelFactory.ReadExcelByKey("testdata/execute.xlsx","TestName",ScName,"Priority");
        FeaturePlatform = ExcelFactory.ReadExcelByKey("testdata/execute.xlsx", "TestName", ScName, "Platforme");
        DataManager.datamap = ExcelFactory.getDataFromExcel("testdata/"+FeatureName+".xlsx","Sheet1");
        Log.startTestCase(ScName);
        t = Utilities.now();
        testRun = Base.getDataFromConfEnvironment("2","testRun");
        if (dbWriteResults.equals("ON")){
            if (testRun.equals("0")) {
                String testRunsStartTime = DataManager.DateHHMMSS();
                Queries.writeToTestRunsTableResults(testRunsStartTime);
                ExcelFactory.writeTestRunValueInConfigurationExcel("1");
        }
            Queries.writeToTestResultsTableWithMinimalData(t.toString());
        }
        currentStepDefIndex = 0;
    }
    /**
     * checks scenario result and logs it, if failed saves browser screenshot to testdata folder,
     * closes web driver
     * */
//String testName, String state, String screenshot, String iteration
    @After
    public void afterHookFunction(Scenario scenario) throws IOException, SQLException {
        Base base = new Base();
        App = Base.getDataFromFileConf(Hooks.rowinConfExcel, "APP");
        PlatformeName = Base.getDataFromFileConf(Hooks.rowinConfExcel, "PLATFORM_NAME");
        PlatformVersion = Base.getDataFromFileConf(Hooks.rowinConfExcel, "PLATFORM_VERSION");
        DeviceName = Base.getDataFromFileConf(Hooks.rowinConfExcel, "DEVICE_NAME");

        if (scenario.isFailed()) {
            try {
                ExcelFactory.WriteFailedTestResultInNewExecutionList(ScName,FeatureId,FeaturePriority);
                String strDate = new SimpleDateFormat("dd_MM_yyyy_HH_mm").format(Calendar.getInstance().getTime());
                //String errorMessage = Log.lastError;
                String errorMessage = "";
                try {
                    if(!(Log.lastError.equals(null)))
                        errorMessage = Log.lastError;
                }catch (Exception ex) {}
                File file = ((TakesScreenshot) Base.driver).getScreenshotAs(OutputType.FILE);
                String screenshotName = scenario.getName() + "_" + strDate + ".jpg";
                FileUtils.copyFile(file, new File("results/" + screenshotName));
                Log.error("!!!!!!!!!!!!!!!!!!!!!!!!!! Test Scenario " + ScName + " failed.!!!!!!!!!!!!!!!!!!!!!!!!");
                ExcelFactory.WriteTestResult(ScName,"FAILED", "1", screenshotName,"test", PlatformeName);
                if (dbWriteResults.equals("ON")){
                try {
                    DataManager.WriteTestResult(ScName, "FAILED","Screen_" + scenario.getName() + "_" + strDate + ".png");
                    DataManager.WriteTestResultsInQuery();
                } catch (SQLException throwables) {
                    Log.error(throwables.getMessage());
                }}
                Log.error("FAILED!");
                HashMap<String, Object> nh = new HashMap<>();
                nh.put("name", ScName);
                nh.put("id", FeatureId);
                nh.put("priority",FeaturePriority);
                nh.put("message", errorMessage);
                nh.put("result", "FAIL");
                nh.put("startTime", t);
                nh.put("endTime",Utilities.now());
                nh.put("time", Utilities.timeBetween(Utilities.now(), t));
                if (dbWriteResults.equals("ON")){
                    Queries.writeToTestResultsTable(FeatureId,ScName,"FAIL",t.toString(),Utilities.now().toString(),Utilities.timeBetween(Utilities.now(), t).toString());
                }
                //DataManager.resultContainer.add(nh);
                boolean toAdd = true;
                boolean toRemove = false;
                HashMap<String, Object> forRemove = null;
                for(HashMap<String, Object> item : DataManager.resultContainer){
                    if(item.get("id").toString().equals(FeatureId)){
                        if(item.get("result").equals("FAIL"))
                            toAdd = false;
                        else{
                            toRemove = true;
                            forRemove = item;
                        }
                    }
                }
                if(toRemove)
                    DataManager.resultContainer.remove(forRemove);
                if(toAdd)
                    DataManager.resultContainer.add(nh);
                base.teardown();

            } catch (Exception e) {
                Log.error("!!!!!!!!!!!!!!!!!!!!!!!!!! Screenshot for scenario \""+scenario.getName()+"\" failed.!!!!!!!!!!!!!!!!!!!!!!!!");
                //String errorMessage = e.getMessage();
                String errorMessage = "";
                try {
                    if(!(e.getMessage().equals(null))){
                        errorMessage = e.getMessage();
                    }
                }catch (Exception ex){}
                ExcelFactory.WriteTestResult(ScName, "FAILED","1", "1", "test", PlatformeName);
                if (dbWriteResults.equals("ON")){
                try {
                    DataManager.WriteTestResult(ScName, "FAILED","failed");
                } catch (SQLException throwables) {
                    Log.error(throwables.getMessage());
                }}
                Log.error("Exception: "+e+".");
                Log.error("FAILED!");
                HashMap<String, Object> nh = new HashMap<>();
                nh.put("name", ScName);
                nh.put("id", FeatureId);
                nh.put("priority",FeaturePriority);
                nh.put("message", errorMessage);
                nh.put("result", "FAIL");
                nh.put("startTime", t);
                nh.put("endTime",Utilities.now());
                nh.put("time", Utilities.timeBetween(Utilities.now(), t));
                if (dbWriteResults.equals("ON")){
                    Queries.writeToTestResultsTable(FeatureId,ScName,"FAIL",t.toString(),Utilities.now().toString(),Utilities.timeBetween(Utilities.now(), t).toString());
                }
                //for (HashMap<String, Object> item : DataManager.resultContainer){
                //    if (item.get("id").toString().equals(FeatureId))
                //        DataManager.resultContainer.remove(item);
                boolean toAdd = true;
                boolean toRemove = false;
                HashMap<String, Object> forRemove = null;
                for(HashMap<String, Object> item : DataManager.resultContainer){
                    if(item.get("id").toString().equals(FeatureId)){
                        if(item.get("result").equals("FAIL"))
                            toAdd = false;
                        else{
                            toRemove = true;
                            forRemove = item;
                        }
                    }
                }
                if(toRemove)
                    DataManager.resultContainer.remove(forRemove);
                if(toAdd)
                    DataManager.resultContainer.add(nh);
                base.teardown();

            }
        }

        else if(!scenario.getStatus().toString().equals("SKIPPED"))
        {
            Log.info("!!!!!!!!!!!!!!!!!!!!!!!!!! TestScenario \""+ScName+"\" finished successfully.!!!!!!!!!!!!!!!!!!!!!!!!");
            ExcelFactory.WriteTestResult(ScName, "PASSED","1", "", "test", PlatformeName);
            base.passed = base.passed + 1;
            if (dbWriteResults.equals("ON")){
            try {
                DataManager.WriteTestResult(ScName, "PASSED", "");
            } catch (SQLException throwables) {
                Log.error(throwables.getMessage());
            }}
            Log.info("PASSED!");
            Log.endTestCase(ScName);
            HashMap<String, Object> nh = new HashMap<>();
            nh.put("name", ScName);
            nh.put("id", FeatureId);
            nh.put("priority",FeaturePriority);
            nh.put("result", "PASSED");
            nh.put("startTime", t);
            nh.put("endTime",Utilities.now());
            nh.put("time", Utilities.timeBetween(Utilities.now(), t));
            if (dbWriteResults.equals("ON")){
                Queries.writeToTestResultsTable(FeatureId,ScName,"PASSED",t.toString(),Utilities.now().toString(),Utilities.timeBetween(Utilities.now(), t).toString());
            }
            boolean toAdd = true;
            for(HashMap<String, Object> item : DataManager.resultContainer){
                if(item.get("id").toString().equals(FeatureId)){
                    toAdd = false;
                }
            }
            if(toAdd)
                DataManager.resultContainer.add(nh);
            base.teardown();
        }
    }
}
