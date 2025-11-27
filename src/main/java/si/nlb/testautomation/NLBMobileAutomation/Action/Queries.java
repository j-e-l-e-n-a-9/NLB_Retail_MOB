package si.nlb.testautomation.NLBMobileAutomation.Action;

import si.nlb.testautomation.NLBMobileAutomation.Core.Base;
import si.nlb.testautomation.NLBMobileAutomation.Data.*;
import si.nlb.testautomation.NLBMobileAutomation.Helpers.Log;
import si.nlb.testautomation.NLBMobileAutomation.Helpers.Utilities;
import si.nlb.testautomation.NLBMobileAutomation.Test.Hooks;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.List;

/**
 * Class for creating methods to get or set data to database.
 */
public class Queries {

    /**
     * Returns Order ID from Test digital database for entered Social security numbe
     * @param SSN Social security number
     * @return String Order ID
     * @throws SQLException
     */
    public static String getSSNPaymentDataDigital(String SSN) throws SQLException {
        String res = "";
        String sqlText = "SELECT TOP (1) [OrderID] \n" +
                "      ,[Status] \n" +
                "      ,[ReceiveDate] \n" +
                "     , DateDIFF(Minute, [ReceiveDate], GetDate()) \n" +
                "  FROM [iBankingRetailUpgradedToV4].[dbo].[Order] \n" +
                "  WHERE DebtorIdentityNumber = ? \n" +
                "  AND DateDIFF(Minute, [ReceiveDate], GetDate()) < 5 " +
                "  ORDER BY 1 DESC " +
                "";

        ArrayList<HashMap<String, Object>> cardsResult = DBDefault.getObject(sqlText, SSN);
        if (cardsResult.get(0).get("Status").equals("OK"))
            res = cardsResult.get(0).get("OrderID").toString();
        return res;
    }

    public static void writeToTestRailImportResultsTable(String testID, String priority, String result, String platform, String dateOfExecution) throws SQLException {
        //String _prefix = dtcShema;
        String _prefix = "";
        String SQLText = "INSERT INTO " + _prefix + "TestRailImportResults (CaseID, Priority, Result, Platform, DateOfExecution)"
                + "VALUES (?, ?, ?, ?, cast(? AS DATETIME)) ";
        boolean rs = DBReport.dbExecuteSQL(SQLText, testID, priority, result, platform, dateOfExecution);
    }

    /**
     * Returns MidasPaymentReference from Luca database for entered Order ID
     * @param OrderID Order ID
     * @return String MidasPaymentReference
     * @throws SQLException
     */
    public static String getOrderIdPaymentDataLuca(String OrderID) throws SQLException {
        try {
            String sqlText = "SELECT TOP (1000) [ID_Payment]\n" +
                    "      ,[LucaPaymentReference]\n" +
                    "      ,[MidasPaymentReference]\n" +
                    "      ,[Id_StatusPaymentArgos]\n" +
                    "  FROM [LUKA].[dbo].[T07_Payment]\n" +
                    "  WHERE [LucaPaymentReference] = ? ";
            List<HashMap<String, Object>> result = DBCore.getObject(sqlText, OrderID);

            if (result == null) {
                throw new Exception("Got empty result set while calling for accounts!");
            }
            return result.get(0).get("MidasPaymentReference").toString();
        } catch (Exception exp) {
            Log.error(exp.getMessage());
            throw new SQLException(exp.getMessage());
        }
    }

    /**
     * Returns MidasPaymentReference for entered description from payments.
     * This will returns unique payments if description is entered unique in order.
     * Part of description should be random number or generated GUID
     * @param Description Unique description
     * @return String MidasPaymentReference
     * @throws SQLException
     */
    public static String getDescriptionPaymentDataLuca(String Description) throws SQLException {
        String parDescription = "%".concat(Description).concat("%");
        try {
            String sqlText = "SELECT TOP (10) [ID_Payment]\n" +
                    "            ,[LucaPaymentReference]\n" +
                    "            ,[MidasPaymentReference]\n" +
                    "            ,[Id_StatusPaymentArgos]\n" +
                    "    FROM [LUKA].[dbo].[T07_Payment]\n" +
                    "    WHERE [Description] like ? ";
            List<HashMap<String, Object>> result = DBCore.getObject(sqlText, parDescription);

            if (result == null) {
                throw new Exception("Got empty result set while calling for accounts!");
            }
            return result.get(0).get("MidasPaymentReference").toString();
        } catch (Exception exp) {
            Log.error(exp.getMessage());
            throw new SQLException(exp.getMessage());
        }
    }

    public static void writeToTestRunsTableResults(String testRunsStartTime) throws SQLException {
        String SQLText = "INSERT INTO TestRuns (Timestamp, Environment, Name)"
                + "VALUES (cast(? AS DATETIME), ?, ?) ";
        String environment = DataManager.getDataFromHashDatamap("1","envName");
        String name = environment + " " + Utilities.getTodayDateInFormat("dd MM yyyy hh:mm:ss");
        boolean rs = DBReport.dbExecuteSQL(SQLText, testRunsStartTime, environment, name);
        //DataManager.userObject.put("nameOfTestRun", name);
        ExcelFactory.writeTestRunNameInConfigurationExcel(name);

    }

    public static String selectTestRunsIDByName() throws SQLException {
        String name = Base.getDataFromConfEnvironment("2","nameOfTestRun");
        String SQLText = "SELECT id FROM testruns WHERE name = ?;";
        String testRunId = DBReport.GetString(SQLText,name);
        return testRunId;
    }

    /*public static void writeToTestResultsTable(String testCaseId,String testCaseName, String status, String startTime, String endTime, String time) throws SQLException {
        String SQLText = "INSERT INTO TestResults (test_run_id, test_case_id, test_case_name, platform, status, start_time, end_time, duration)"
                + "VALUES (?,?,?,?,?,cast(? AS DATETIME), cast(? AS DATETIME), ?) ";
        String testRunId = Queries.selectTestRunsIDByName();
        String platform = ExcelFactory.ReadExcelByKey("testdata/configuration_environment.xlsx", "Active", "on", "Platform");
        boolean rs = DBReport.dbExecuteSQL(SQLText,testRunId, testCaseId, testCaseName, platform, status, startTime, endTime, time);

    }*/

    public static void writeToTestResultsTable(String testCaseId,String testCaseName, String status, String startTime, String endTime, String time) throws SQLException {
        String SQLText = "UPDATE testresults " +
                "SET test_case_id = ?, test_case_name= ?, platform= ?, status=?, start_time=?, end_time = ?, duration=? " +
                "WHERE test_run_id = ? and start_time = cast(? AS DATETIME)";
        String testRunId = Queries.selectTestRunsIDByName();
        String platform = ExcelFactory.ReadExcelByKey("testdata/configuration_environment.xlsx", "Active", "on", "Platform");
        boolean rs = DBReport.dbExecuteSQL(SQLText,testCaseId,testCaseName, platform,status,startTime,endTime,time,testRunId,startTime);

    }

    public static void writeToTestResultsTableWithMinimalData(String startTime) throws SQLException {
        String SQLText = "INSERT INTO TestResults (test_run_id, test_case_id, test_case_name, platform, status, start_time, end_time, duration)"
                + "VALUES (?,?,?,?,?,?,?,?) ";
        String testRunId = Queries.selectTestRunsIDByName();
        String platform = ExcelFactory.ReadExcelByKey("testdata/configuration_environment.xlsx", "Active", "on", "Platform");
        boolean rs = DBReport.dbExecuteSQL(SQLText,testRunId, "", "", platform, "", startTime, "2027-06-20 23:00:00", "");
    }

    public static void writeToTestStepTable(int currentStepDefIndex, String stepCode, String stepName, String screenshotName, String stepStartTime, String stepEndTime, String stepDuration, String testStartTime) throws SQLException {
        String SQLText = "INSERT INTO TestSteps (test_result_id, step_number, step_command, input_data, output, screenshot, start_time, end_time, duration)"
                + "VALUES (?,?,?,?,?,?,cast(? AS DATETIME), cast(? AS DATETIME), ?) ";
        String testRunId = Queries.selectTestRunsIDByName();
        String testResultId = Queries.selectTestResultIDByRunAndTime(testRunId,testStartTime);
        String stepNumber = String.valueOf(currentStepDefIndex);
        String formattedStepCode = stepCode.replaceAll("\"","\\\"");
        String formattedStepName = stepName.replaceAll("\"","\\\"");
        boolean rs = DBReport.dbExecuteSQL(SQLText, testResultId, stepNumber, formattedStepCode, formattedStepName, "null", screenshotName, stepStartTime, stepEndTime, stepDuration);
    }

    private static String selectTestResultIDByRunAndTime(String testRunId, String stepStartTime) throws SQLException {
        String SQLText = "SELECT id FROM testresults WHERE start_time = cast(? AS DATETIME) AND test_run_id = ?;";
        String testResultId = DBReport.GetString(SQLText,stepStartTime,testRunId);
        return testResultId;
    }
}