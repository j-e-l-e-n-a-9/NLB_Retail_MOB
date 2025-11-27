package si.nlb.testautomation.NLBMobileAutomation.Data;

import com.google.common.collect.Iterators;
import si.nlb.testautomation.NLBMobileAutomation.Action.HTTPAction;
import si.nlb.testautomation.NLBMobileAutomation.Action.Queries;
import si.nlb.testautomation.NLBMobileAutomation.Core.Base;
import si.nlb.testautomation.NLBMobileAutomation.Helpers.Log;
import si.nlb.testautomation.NLBMobileAutomation.Test.Hooks;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.*;

public class DataManager {
    //region - Parameters -
    public static ArrayList<HashMap<String, String>> datamap = null;
    public static HashMap<String,Object> userObject = new HashMap<>();
    public static Map<String,Object> userApiResponse = new HashMap<>();
    public static List<Map<String,Object>> userApiResponseList = new ArrayList<>();
    public static String dbEngine;
    public static String dbConnectionString;
    public static String dtcShema;
    public static String dbUser;
    public static String dbPassword;

    public static String dbEngineCore;
    public static String dbConnectionStringCore;
    public static String dtcShemaCore;
    public static String dbUserCore;
    public static String dbPasswordCore;

    public static String dbEngineReport;
    public static String dbConnectionStringReport;
    public static String dtcShemaReport;
    public static String dbUserReport;
    public static String dbPasswordReport;

    public static String dbEngineLuca;
    public static String dbConnectionStringLuca;
    public static String dtcShemaLuca;
    public static String dbUserLuca;
    public static String dbPasswordLuca;

    public static String dbEngineRbalOne;
    public static String dbConnectionStringRbalOne;
    public static String dtcSchemaRbalOne;
    public static String dbUserRbalOne;
    public static String dbPasswordRbalOne;

    public static String UserActiveApiURL;
    public static String UserDeatailsApiUrl;
    public static String webServiceBaseURL;

    public static String testrailBaseURL;
    public static String testrailUsername;
    public static String testrailPassword;
    public static String serverLogFolder;

    public static int TestrailProjectId = 30;
    public static boolean logTestrail;

    //endregion - Parameters -

    //region - Static Variables -
    static {
        try {
            dbEngine  = ExcelFactory.ReadExcelByKey("testdata/configuration_environment.xlsx", "Active", "on", "dbEngine");
            dbConnectionString  = ExcelFactory.ReadExcelByKey("testdata/configuration_environment.xlsx", "Active", "on", "dbConnectionString");
            String s = ExcelFactory.ReadExcelByKey("testdata/configuration_environment.xlsx", "Active", "on", "dtcShema");
            if((s != "") && (s != null))
                dtcShema = s + ".";
            else
                dtcShema = "";
            dbUser = ExcelFactory.ReadExcelByKey("testdata/configuration_environment.xlsx", "Active", "on", "dbUser");
            dbPassword = ExcelFactory.ReadExcelByKey("testdata/configuration_environment.xlsx", "Active", "on", "dbPassword");

            dbEngineCore  = ExcelFactory.ReadExcelByKey("testdata/configuration_environment.xlsx", "Active", "on", "dbEngineCore");
            dbConnectionStringCore  = ExcelFactory.ReadExcelByKey("testdata/configuration_environment.xlsx", "Active", "on", "dbConnectionStringCore");
            webServiceBaseURL = ExcelFactory.ReadExcelByKey("testdata/configuration_environment.xlsx", "Active", "on", "webServiceBaseURL");
            String s1 = ExcelFactory.ReadExcelByKey("testdata/configuration_environment.xlsx", "Active", "on", "dtcShemaCore");
            if((s1 != "") && (s1 != null))
                dtcShemaCore = s1 + ".";
            else
                dtcShemaCore = "";
            dbUserCore = ExcelFactory.ReadExcelByKey("testdata/configuration_environment.xlsx", "Active", "on", "dbUserCore");
            dbPasswordCore = ExcelFactory.ReadExcelByKey("testdata/configuration_environment.xlsx", "Active", "on", "dbPasswordCore");

            dbEngineReport  = ExcelFactory.ReadExcelByKey("testdata/configuration_environment.xlsx", "Active", "on", "dbEngineReport");
            dbConnectionStringReport  = ExcelFactory.ReadExcelByKey("testdata/configuration_environment.xlsx", "Active", "on", "dbConnectionStringReport");
            String s_r = ExcelFactory.ReadExcelByKey("testdata/configuration_environment.xlsx", "Active", "on", "dtcShemaReport");
            if((s_r != "") && (s_r != null))
                dtcShemaReport = s_r + ".";
            else
                dtcShemaCore = "";
            dbUserReport = ExcelFactory.ReadExcelByKey("testdata/configuration_environment.xlsx", "Active", "on", "dbUserReport");
            dbPasswordReport = ExcelFactory.ReadExcelByKey("testdata/configuration_environment.xlsx", "Active", "on", "dbPasswordReport");


            dbEngineLuca = ExcelFactory.ReadExcelByKey("testdata/configuration_environment.xlsx", "Active", "on", "dbEngineLuca");
            dbConnectionStringLuca = ExcelFactory.ReadExcelByKey("testdata/configuration_environment.xlsx", "Active", "on", "dbConnectionStringLuca");
            dtcShemaLuca = ExcelFactory.ReadExcelByKey("testdata/configuration_environment.xlsx", "Active", "on", "dtcShemaLuca");
            if((dtcShemaLuca != "") && (dtcShemaLuca != null))
                dtcShemaLuca = dtcShemaLuca + ".";
            else
                dtcShemaLuca = "";
            dbUserLuca = ExcelFactory.ReadExcelByKey("testdata/configuration_environment.xlsx", "Active", "on", "dbUserLuca");
            dbPasswordLuca = ExcelFactory.ReadExcelByKey("testdata/configuration_environment.xlsx", "Active", "on", "dbPasswordLuca");

            dbEngineRbalOne = ExcelFactory.ReadExcelByKey("testdata/configuration_environment.xlsx", "Active", "on", "dbEngineRbalOne");
            dbConnectionStringRbalOne = ExcelFactory.ReadExcelByKey("testdata/configuration_environment.xlsx", "Active", "on", "dbConnectionStringRbalOne");
            String rbalOneSchema = ExcelFactory.ReadExcelByKey("testdata/configuration_environment.xlsx", "Active", "on", "dtcSchemaRbalOne");

            if (rbalOneSchema != "" && rbalOneSchema != null) {
                dtcSchemaRbalOne = rbalOneSchema + ".";
            }else {
                dtcSchemaRbalOne = "";
            }
            dbUserRbalOne = ExcelFactory.ReadExcelByKey("testdata/configuration_environment.xlsx", "Active", "on", "dbUserRbalOne");
            dbPasswordRbalOne = ExcelFactory.ReadExcelByKey("testdata/configuration_environment.xlsx", "Active", "on", "dbPasswordRbalOne");

            String s_trail = ExcelFactory.ReadExcelByKey("testdata/configuration_environment.xlsx", "Active", "on", "logTestrail");
            serverLogFolder = ExcelFactory.ReadExcelByKey("testdata/configuration_environment.xlsx", "Active", "on", "serverLogFolder");
            testrailBaseURL= ExcelFactory.ReadExcelByKey("testdata/configuration_environment.xlsx", "Active", "on", "testrailBaseURL");
            testrailUsername= ExcelFactory.ReadExcelByKey("testdata/configuration_environment.xlsx", "Active", "on", "testrailUsername");
            testrailPassword= ExcelFactory.ReadExcelByKey("testdata/configuration_environment.xlsx", "Active", "on", "testrailPassword");
            serverLogFolder = ExcelFactory.ReadExcelByKey("testdata/configuration_environment.xlsx", "Active", "on", "serverLogFolder");

            if(s_trail.equals("ON"))
                logTestrail = true;
            else
                logTestrail = false;

        } catch (Exception e) {
            Log.error(e.getMessage());
        }
    }

    public static List<HashMap<String, Object>> resultContainer = new ArrayList<>();
    public static ArrayList<String> listForExecution = ExcelFactory.GetListOfTestForExecution(
            "testdata/execute.xlsx", "TestName", "test");

    //endregion - Static Variables -

    //region - Various methods -
    /**
     * Method for finding Computer name
     * @return String
     */
    public static String getHostname()
    {
        String result = "";
        String OS = System.getProperty("os.name").toLowerCase();
        if(OS.contains("win")){
            result = System.getenv("COMPUTERNAME");
        }
        else if(OS.contains("mac")){
            result = "MacBookPro";
        }
        else if(OS.contains("nix") || OS.contains("nux") || OS.contains("aix")){
            try {
                result = InetAddress.getLocalHost().getHostName();
            } catch (UnknownHostException e) {
                Log.error(e.getMessage());
            }

        }else{
            try {
                result = InetAddress.getLocalHost().getHostName();
            } catch (UnknownHostException e) {
                Log.error(e.getMessage());
            }
        }
        return result;
    }

    /**
     * Returns string from datamap global HashMap
     * @param arg1 Order number of row
     * @param columnName Name of the column
     * @return String value of data in HashMap
     */
    public static String getDataFromHashDatamap(String arg1, String columnName) {
        int index = Integer.parseInt(arg1) - 1;
        String myData = datamap.get(index).get(columnName);
        return myData;
    }
    //endregion - Various methods -

    //region - Write to log -
    /**
     * Helps to get current date-time in correct format
     * @return String in format 'yyyy-MM-dd HH:mm:ss.SSS'
     */
    public static String DateHHMMSS() {
        SimpleDateFormat outputFormatter = new SimpleDateFormat(
                "yyyy-MM-dd HH:mm:ss.SSS");
        return outputFormatter.format(new Date());
    }

    /**
     * Method for entry log into database
     * @param App - Application name
     * @param Test_Name - Test name
     * @param Result - Result SUCCESS or FAIL
     * @param Logdate - Date time of log
     * @param Environment - On which environment is tested
     * @param Iteration - Number of iteration
     * @param HostName - Computer name
     * @param Browser - Tested with browser
     * @param TestCaseId - Test Case ID
     * @param HostName - Computer name
     * @param PlatformName - Platform (Web, Android, iOS) in this case always Web
     * @throws SQLException
     */
    public static void WriteToTestResult(String App, String Test_Name, String Result, String Logdate, String Environment,
                                         String Iteration, String HostName, String Browser, String TestCaseId, String PlatformName, String DeviceName, String PlatformVersion) throws SQLException {
        //String _prefix = dtcShema;
        String _prefix = "";
        String SQLText = "INSERT INTO " + _prefix + "TestResult (App, Test_Name, Result, LogDateTime, Environment, Iteration, HostName, Browser, TestCaseId, PlatformName, DeviceName, PlatformVersion)"
                + "VALUES (?, ?, ?, cast(? AS DATETIME), ?, ?, ?, ?, ?, ?, ?, ?) ";
        boolean rs = DBReport.dbExecuteSQL(SQLText, App, Test_Name, Result, Logdate, Environment, Iteration, HostName, Browser, TestCaseId, PlatformName,DeviceName, PlatformVersion);
    }

    /**
     * Method for log with same parameters as Excel
     * @param testName - Test name
     * @param state - Success or faile
     * @param description - Description
     * @throws SQLException
     */
    public static void WriteTestResult(String testName, String state, String description) throws SQLException {
        String App = "";
        if(App == null) App = "";
        String testCaseId = "";
        try{
            testCaseId = testName.split("[\\[\\]]")[1];
        }
        catch (Exception ex){}
        WriteToTestResult(
                App,
                testName,
                state,
                //LocalDateTime.now().toString(),
                DateHHMMSS(),
                Base.env,
                "1",
                getHostname(),
                "Mobile",
                testCaseId,
                Base.testPlatform,
                Hooks.DeviceName,
                Hooks.PlatformVersion
        );
    }
    //endregion - Write to log -

    //region - call testrail -
    public static void tryCallTestrail(){
        if(logTestrail){
            try {
                callTestrail();
            }
            catch (Exception e){}
        }
    }

    public static void callTestrail() throws SQLException {
        List<String> l = new ArrayList<String>();
        for(HashMap<String, Object> item : DataManager.resultContainer){
            String Fid = item.get("id").toString();
            String[] parts = Fid.split(",");
            //Queries.writeToTestResultsTable(Fid,nameOfTest,results,startTime,endTime,time);
            for(String part : parts){
                String trimPart = part.trim();
                if (!(l.contains(trimPart)) && (!(l.equals("")))){
                    l.add(trimPart);
                }
            }

        }
        int n = 0;
        for(String s : l){
            try {
                String c = s.substring(1);
                int newid = Integer.valueOf(c);
                if (newid > 0)
                    n++;
            }
            catch (Exception e){}
        }
        //int[] listf = new int[l.size()];
        int[] listf = new int[n];
        int i = 0;
        for(String s : l){
            try {
                String c = s.substring(1);
                int newid = Integer.valueOf(c);
                listf[i++] = newid;
            }
            catch (Exception e){}

        }

        //HTTPAction.addRun(TestrailProjectId, listf);

        HTTPAction.addResultsForCasesByOne(listf);

        //HTTPAction.addAttachment();
    }

    public static void WriteTestResultsInQuery() {

    }


    //endregion - call testrail -
}
