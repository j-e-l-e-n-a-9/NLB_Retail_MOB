package si.nlb.testautomation.NLBMobileAutomation.Helpers;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.text.PDFTextStripper;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import si.nlb.testautomation.NLBMobileAutomation.Action.ActionApiHelpers;
import si.nlb.testautomation.NLBMobileAutomation.Action.Queries;
import si.nlb.testautomation.NLBMobileAutomation.Core.Base;
import si.nlb.testautomation.NLBMobileAutomation.Data.DataManager;
import si.nlb.testautomation.NLBMobileAutomation.Data.ExcelFactory;
import si.nlb.testautomation.NLBMobileAutomation.Test.RunTest;
import si.nlb.testautomation.NLBMobileAutomation.Test.Steps;

import java.io.*;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.net.URL;
import java.nio.file.*;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.regex.Pattern;

import static si.nlb.testautomation.NLBMobileAutomation.Test.Hooks.dbWriteResults;

/**
 * Class for various util methods
 */
public class Utilities {
    //region - Methods -
    /**
     * Transform string to array of characters
     * @param s String to transform
     * @return Character[] Transformed array of characters.
     */
    public static Character[] toCharacterArray(String s) {
        if (s == null) {
            return null;
        }
        int len = s.length();
        Character[] array = new Character[len];
        for (int i = 0; i < len; i++) {
            array[i] = s.charAt(i);
        }
        return array;
    }

    /**
     * Gets time minus minutes in format yyyy-MM-dd'T'HH:mm:ss.SSSS
     * @param min Int, minutes in int format
     * @return String in format yyyy-MM-dd'T'HH:mm:ss.SSSS
     */
    public static String GetDateTimeNowMinusMinutes(int min){
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSS");
        Date date;
        LocalDateTime d = LocalDateTime.now();
        d = d.plusMinutes(-min);
        date = Timestamp.valueOf(d);
        return formatter.format(date);
    }

    /**
     * Returns random GUID as String
     * @return String
     */
    public static String GetGUID(){
        return java.util.UUID.randomUUID().toString();
    }

    /**
     * Random string  without letters, with length in parameter @i
     * @param length Integer, length of random string.
     * @return String, random value.
     */
    public static String randomNumber(int length) {
        boolean useLetters = false;
        boolean useNumbers = true;
        return RandomStringUtils.random(length, useLetters, useNumbers);
    }

    /**
     * Returns current date in format "dd.MM.yyyy"
     * @return String in format "dd.MM.yyyy"
     * @throws ParseException Error
     */
    public static String todayDDMMYYYY() throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("dd.MM.yyyy");
        return sdf.format(new Date());
    }

    public static String tomorrowDateDDMMYYYY(){
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.DAY_OF_YEAR, 1);
        Date tomorrow = calendar.getTime();
        DateFormat dateFormat = new SimpleDateFormat("dd.MM.yyyy");
        String tomorrowAsString = dateFormat.format(tomorrow);
        return tomorrowAsString;
    }

    public static String getTodayDateInFormat(String dateFormat) {
        String dateInString = new SimpleDateFormat(dateFormat).format(new Date());
        return dateInString;
    }

    public static void saveTheValueToFile(String randomPurpose, String key) {
        //final String outputFilePath = "C:\\Users\\Jovan Jacov\\Downloads\\DTC Test Repo\\testdata\\assertkeys.txt";
        final String outputFilePath = "testdata/assertkeys.txt";
        HashMap<String, String> map = new HashMap<String, String>();

        File file = new File(outputFilePath);

        BufferedWriter bf = null;
        BufferedReader br = null;

        try{
            br = new BufferedReader(new FileReader(file));
            String line = null;

            while((line = br.readLine()) != null) {
                String[] parts = line.split(":");
                String name = parts[0].trim();
                String purpose = parts[1].trim();

                if (!name.equals("") && !purpose.equals("")){
                    map.put(name,purpose);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            if (br != null){
                try {
                    br.close();
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }
            }
        }
        map.put(key,randomPurpose);
        try{
            bf = new BufferedWriter(new FileWriter(file));

            for (Map.Entry<String,String> entry : map.entrySet()){
                bf.write(entry.getKey() + ":" + entry.getValue());
                bf.newLine();
            }

            bf.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
        finally {
            try {
                bf.close();
            } catch (Exception e) {
            }
        }
    }

    //region - PDF -
    /**
     * Create instance document for work with PDF
     * @param path Path to file on storage
     * @return PDDocument for work with PDF
     * @throws IOException Error
     */
    public static PDDocument createPDDDocument(String path) throws IOException {
        // Kreiranje objekta PDDocument za rad sa PDF fajlom
        return PDDocument.load(new File("path/to/pdf/file.pdf"));
    }

    /**
     * Close file object for work with PDF
     * @param document Instance of document
     * @throws IOException Input-output error
     */
    public static void closePDDDocument(PDDocument document) throws IOException {
        document.close();
    }

    /**
     * Method returns is text in document.
     * Document is instance of PDDocument
     * @param doc PDDocument - instance of PDF file
     * @param searchTerm Text for searching in PDF
     * @return boolean: true - text is in PDF, false - text is not in PDF
     * @throws IOException Input - output error
     */
    public static boolean findTextInDoc(PDDocument doc, String searchTerm) throws IOException {
        PDFTextStripper pdfStripper = new PDFTextStripper();
        String text = pdfStripper.getText(doc);
        return text.contains(searchTerm);
    }

    /**
     * Method returns is text in document.
     * Document is file on the disk
     * @param path Path to file on disk
     * @param searchTerm Text for search
     * @return boolean: true - text is in PDF, false - text is not in PDF
     * @throws IOException Input - output error
     */
    public static boolean findTextInPdf(String path, String searchTerm) throws IOException {
        boolean result = false;
        PDDocument document = null;
        try {
            // Create object PDDocument for work with PDF file
            document = PDDocument.load(new File(path));

            // Create object PDFTextStripper for extraction text from PDF file
            PDFTextStripper pdfStripper = new PDFTextStripper();

            // Extraction text from PDF file
            String text = pdfStripper.getText(document);

            result = text.contains(searchTerm);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            // Close PDF document
            document.close();
        }
        return result;
    }
    //endregion - PDF -

    public static String getDownloadsDirPath() {
        String path = "";
        try {
            Process process = Runtime.getRuntime().exec("adb shell echo $EXTERNAL_STORAGE/Download");
            BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
            path = reader.readLine();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return path;
    }

    public static File getLatestFile(String directoryPath) {
        File dir = new File(directoryPath);
        File[] files = dir.listFiles();
        Arrays.sort(files, new Comparator<File>() {
            public int compare(File f1, File f2) {
                return Long.valueOf(f2.lastModified()).compareTo(f1.lastModified());
            }
        });
        return files[0];
    }

    public static String getLatestFilePath(String directoryPath) {
        File dir = new File(directoryPath);
        File[] files = dir.listFiles();
        Arrays.sort(files, new Comparator<File>() {
            public int compare(File f1, File f2) {
                return Long.valueOf(f2.lastModified()).compareTo(f1.lastModified());
            }
        });
        return files[0].getAbsolutePath();
    }

    public static String getDataFromTxtFileUnderKey(String key){
        //final String filePath = "C:\\Users\\Jovan Jacov\\Downloads\\DTC Test Repo\\testdata\\assertkeys.txt";
        final String filePath = "testdata/assertkeys.txt";

        HashMap<String,String> map = new HashMap<String, String>();
        BufferedReader br = null;

        try{
            File file = new File(filePath);

            br = new BufferedReader(new FileReader(file));
            String line = null;

            while ((line = br.readLine()) != null){
                String[] parts = line.split(":");

                String name = parts[0].trim();
                String purpose = parts[1].trim();

                if (!name.equals("") && !purpose.equals("")){
                    map.put(name,purpose);
                }
            }

        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        finally {
            if(br != null){
                try{
                    br.close();
                }
                catch (Exception e){

                }
            }
        }
        String returnedValue = map.get(key);
        return returnedValue;
    }

    public static String removeSpecials(String text){
        return text.replace("#", "_").replace(":","_").replace(",","_").replace("?","_");
    }

    public static LocalDateTime now(){
        LocalDateTime d = LocalDateTime.now();
        return d;
    }

    public static String getDDMMYYYYDate(LocalDateTime d){
        SimpleDateFormat formatter = new SimpleDateFormat("dd.MM.YYYY");
        Date date = Timestamp.valueOf(d);
        return formatter.format(date);
    }

    public static String timeBetween(LocalDateTime newTime, LocalDateTime oldTime){
        long h = oldTime.getHour();
        long m = oldTime.getMinute();
        long s = oldTime.getSecond();
        long oldSec =  (h * 3600) + (m * 60) + s;
        h = newTime.getHour();
        m = newTime.getMinute();
        s = newTime.getSecond();
        long newSec =  (h * 3600) + (m * 60) + s - oldSec;
        if(newSec < 0)
            return "0";
        else
            return String.valueOf(newSec/60).concat("m ").concat(String.valueOf(newSec % 60)).concat("s");
    }

    public static void trySaveResults (List<HashMap<String, Object>> arr){
        try {
            Utilities.saveResults(arr);
        }
        catch (Exception e){}
    }

    public static void saveResults(List<HashMap<String, Object>> arr) throws IOException {
        FileWriter writer = new FileWriter("results/fail.txt");
        int pass = 0;
        int fail = 0;
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDateTime now = LocalDateTime.now();
        String today = now.format(dtf);

        writer.write("<TABLE id=\"table-1\" class=\"table table-hover\">" + System.lineSeparator());
        writer.write("<THead>" + System.lineSeparator());
        writer.write("<TR><TH>Scenario name</TH><TH>Result</TH></TR>" + System.lineSeparator());
        writer.write("</THead>" + System.lineSeparator());
        writer.write("<TBody>" + System.lineSeparator());

        /*for(HashMap<String, Object> item: arr) {
            if (item.get("result") != null) {
                String s = "<TR><TD>" + item.get("name") + "</TD><TD>" + item.get("result") + "</TD></TR>";
                writer.write(s + System.lineSeparator());
                if (item != null)
                    if (item.get("result").equals("FAIL"))
                        fail++;
                    else
                        pass++;
            }
        }*/

        for(HashMap<String, Object> item: arr) {
            if (item.get("result") != null) {
                String s = "<TR><TD>" + item.get("name") + "</TD><TD>" + item.get("result") + "</TD></TR>";
                if (item != null)
                    if (item.get("result").equals("FAIL")){
                        writer.write(s + System.lineSeparator());
                        fail++;}
                    else
                        pass++;
            }
        }

        writer.write("</TBody>" + System.lineSeparator());
        writer.write("</TABLE>" + System.lineSeparator());
        writer.close();
        FileWriter wRes = new FileWriter("results/res.txt");
        wRes.write("<TABLE id=\"table-2\" class=\"table table-hover\"><THead>" + System.lineSeparator());
        wRes.write("<TR><TH>Status</TH><TH>" + today + "</TH></TR>" + System.lineSeparator());
        wRes.write("</THead>" + System.lineSeparator());
        wRes.write("<TBody>" + System.lineSeparator());
        wRes.write("<TR><TD>PASSED</TD><TD>" + String.valueOf(pass) + "</TD></TR>" + System.lineSeparator());
        wRes.write("<TR><TD>FAIL</TD><TD>" + String.valueOf(fail) + "</TD></TR>" + System.lineSeparator());
        wRes.write("</TBody>" + System.lineSeparator());
        wRes.write("</TABLE>" + System.lineSeparator());
        wRes.close();

        BufferedReader reader;
        try {
            reader = new BufferedReader(new FileReader("results/days.txt"));
            List<String> dani = new ArrayList<>();
            String line = reader.readLine();
            while (line != null) {
                // System.out.println(line);
                // read next line
                line = reader.readLine();
                dani.add(line);
            }
            reader.close();

            boolean ima = false;
            for (String item : dani) {
                if(item != null)
                    if(item.contains(today)){
                        item = today.concat(";").concat(String.valueOf(pass).concat(";").concat(String.valueOf(fail)));
                        ima = true;
                    }
            }
            if(!(ima))
                dani.add(today.concat(";").concat(String.valueOf(pass).concat(";").concat(String.valueOf(fail))));
            //dani.sort(String.CASE_INSENSITIVE_ORDER);
            while (dani.remove(null));
            Collections.sort(dani);
            List<String> last7 = new ArrayList<>();
            if (dani.size()> 7) {
                last7 = dani.subList(dani.size() - 7, dani.size());
            }
            else {
                last7 = dani;
            }
            FileWriter sDays = new FileWriter("results/days.txt");
            for(String s : last7){
                sDays.write(s + System.lineSeparator());
            }
            sDays.close();

            FileWriter wDays = new FileWriter("results/daysRes.txt");
            wDays.write("<TABLE id=\"table-3\" class=\"table table-hover\">" + System.lineSeparator() + "<TR><TH>Date</TH>");
            for (String item : last7) {
                String[] arrOfStr = item.split(";");
                wDays.write("<TH>" + arrOfStr[0] +"</TH>");
            }
            wDays.write("</TR>" + System.lineSeparator() + "<TR><TD>Passed</TD>");
            for (String item : last7) {
                String[] arrOfStr = item.split(";");
                wDays.write("<TD>" + arrOfStr[1] +"</TD>");
            }
            wDays.write("</TR>" + System.lineSeparator() + "<TR><TD>Fail</TD>");
            for (String item : last7) {
                String[] arrOfStr = item.split(";");
                wDays.write("<TD>" + arrOfStr[2] +"</TD>");
            }
            wDays.write("<TR>" + System.lineSeparator());
            wDays.write("</TABLE>" + System.lineSeparator());
            wDays.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //endregion - Methods -
    //region - regex -

    /**
     * Return is text matches amount
     * example: 1.234.567,89 EUR
     * pattern: ^([1-9]\d{0,2}(\.\d{3})*)(\,\d{2})? [A-Z]{3}$
     * @param text Text to compare
     * @return boolean, true - text matches, false - text don't matches
     */
    public static boolean regexAmountDotCommaSpaceCurrency(String text){
        String pattern = "^([1-9]\\d{0,2}(\\.\\d{3})*)(\\,\\d{2})? [A-Z]{3}$";
        boolean result = Pattern.compile(pattern).matcher(text).matches();
        return result;
    }

    /**
     * Return is text matches amount
     * example: 1.234.567,89 EUR
     * pattern: ^([1-9]\d{0,2}(\.\d{3})*)(\,\d{2})? EUR$
     * @param text Text to compare
     * @param currency Currency
     * @return boolean, true - text matches, false - text don't matches
     */
    public static boolean regexAmountDotCommaSpaceCurrency(String text, String currency){
        String pattern = "^([1-9]\\d{0,2}(\\.\\d{3})*)(\\,\\d{2})? " + currency + "$";
        boolean result = Pattern.compile(pattern).matcher(text).matches();
        return result;
    }

    /**
     * Return is text matches date in format DD.MM.YYYY
     * example: 31.10.2022
     * pattern: ^(0?[1-9]|[12][0-9]|3[01])[\.\-](0?[1-9]|1[012])[\.\-]\d{4}$
     * @param text Text to compare
     * @return boolean, true - text matches, false - text don't matches
     */
    public static boolean regexDateInFormatDDMMYYY(String text){
        String pattern = "^(0?[1-9]|[12][0-9]|3[01])[\\.\\-](0?[1-9]|1[012])[\\.\\-]\\d{4}$";
        boolean result = Pattern.compile(pattern).matcher(text).matches();
        return result;
    }
    //endregion - regex -
    //region - Testrail -
    public static String getBasic64(String username, String password){
        String userpass = username + ":" + password;
        return "Basic :" + new String(Base64.getEncoder().encode(userpass.getBytes()));
    }

    public static String getOneCase(int n) throws SQLException {
        String result = "";
        for(HashMap<String, Object> item : DataManager.resultContainer){
            String c = item.get("id").toString();
            String nameOfTest = item.get("name").toString();
            String startTime = item.get("startTime").toString();
            String endTime = item.get("endTime").toString();
            String time = item.get("time").toString();
            String results = item.get("result").toString();
            String cmp = "C".concat(String.valueOf(n));
            //Queries.writeToTestResultsTable(cmp,nameOfTest,results,startTime,endTime,time);
            if (c.contains(cmp)){
                String[] idColumn =  c.split(",");
                String priorityColumn = item.get("priority").toString();
                String[] priority = priorityColumn.split(",");
                int i = 0;
                for (String s : idColumn){
                    if (s.equals(cmp)){
                        break;
                    }
                    i++;
                }
                String priorityOfTest = priority[i];
                String r = "";
                if (item.get("result").toString().equals("PASSED")){
                    r = "{\n" +
                            "            \"case_id\": " + String.valueOf(n) + ",\n" +
                            "            \"status_id\": 1,\n" +
                            "            \"comment\": \"Test completed successful!\",\n" +
                            "            \"elapsed\": \"" + item.get("time").toString() + "\"\n" +
                            "        }";
                    ExcelFactory.addRowInExcel("results/SanityStatus.xlsx", "Sheet1", cmp, priorityOfTest, "1", Base.testPlatform);
                    if (dbWriteResults.equals("ON")){
                        Queries.writeToTestRailImportResultsTable(cmp, priorityOfTest, "1", Base.testPlatform, DataManager.DateHHMMSS());
                    }
                    //Queries.writeToTestResultsTable(cmp,nameOfTest,"PASS",startTime,endTime,time);
                }
                else {
                    String err;
                    try{
                        err = item.get("message").toString();
                    }
                    catch (Exception e){
                        err = "No error message!";
                    }
                    if (err.length()>1024)
                        err = err.substring(0,1023);
                    err = err.replace('"', '?');
                    err = err.replace('{', '(');
                    err = err.replace('}', ')');
                    r = "{\n" +
                            "            \"case_id\": " + String.valueOf(n) + ",\n" +
                            "            \"status_id\": 5,\n" +
                            //"            \"comment\": \"This test failed\",\n" +
                            "            \"comment\": \"" + err + "\"\n" +
                            "        }";
                    ExcelFactory.addRowInExcel("results/SanityStatus.xlsx", "Sheet1", cmp, priorityOfTest, "5", Base.testPlatform);
                    if (dbWriteResults.equals("ON")){
                        Queries.writeToTestRailImportResultsTable(cmp, priorityOfTest, "5", Base.testPlatform, DataManager.DateHHMMSS());
                    }

                    //Queries.writeToTestResultsTable(cmp,nameOfTest,"FAIL", startTime, endTime,time);
                }
                result = r;
            }
        }
        return result;
    }

    public static void replaceExecutionListWithFailedExecutionList() {
        FileSystem system = FileSystems.getDefault();
        Path original = system.getPath("results/failedExecutionList.xlsx");
        Path target = system.getPath("testdata/execute.xlsx");

        try {
            // Throws an exception if the original file is not found.
            Files.copy(original, target, StandardCopyOption.REPLACE_EXISTING);
            deleteAllContentInFailedExecutionListNewMethod();
        } catch (IOException ex) {
            System.out.println("ERROR");
        }

    }

    public static void deleteAllContentInFailedExecutionListNewMethod() throws IOException {
        FileInputStream file = null;
        //HSSFWorkbook wb = null;
        XSSFWorkbook wb = null;
        FileOutputStream out = null;
        try{
            file = new FileInputStream(new File("C:\\Users\\Jovan Jacov\\IdeaProjects\\NLBMobile\\results\\failedExecutionList.xlsx"));

            wb = new XSSFWorkbook(file);
            XSSFSheet sheet = wb.getSheetAt(0);

            for(int i = sheet.getLastRowNum(); i> sheet.getFirstRowNum(); i--){
                sheet.removeRow(sheet.getRow(i));
            }

            out = new FileOutputStream(new File("C:\\Users\\Jovan Jacov\\IdeaProjects\\NLBMobile\\results\\failedExecutionList.xlsx"));
            wb.write(out);


        }
        catch(Exception e){}
        finally{
            if(file!=null)
                file.close();
            if(out!=null)
                out.close();
            if(wb!=null)
                wb.close();
        }
    }

    public static void savePreviousTestResults() {

        //String sourceTestResults = "C:\\Users\\Jovan Jacov\\IdeaProjects\\DTC Test Repo\\results\\TestResults.xlsx";
        String sourceTestResults = "results/TestResults.xlsx";
        File srcTestResults = new File(sourceTestResults);
        String sourceTestSanityStatus = "results/SanityStatus.xlsx";
        File srcSanityStatus = new File(sourceTestSanityStatus);
        //Path src = Paths.get(sourceTestResults);

        String date = ActionApiHelpers.getTodayDateInFormat("dd.MM.YYYY HHmmss");
        String folderName = "C:\\RezultatiMobile\\"+date;
        File theDir = new File(folderName);
        if (!theDir.exists()){
            theDir.mkdirs();
        }
        //Path dest = Paths.get(folderName);
        //Files.copy(src.toFile(), dest.toFile());

        try {
            FileUtils.copyFileToDirectory(srcTestResults,theDir);
            FileUtils.copyFileToDirectory(srcSanityStatus, theDir);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static boolean replaceTestrailExcelFile()  {
        boolean res = false;
        URL rootResource = RunTest.class.getClassLoader().getResource(".");
        String targetFolder;
        if(rootResource == null) {
            targetFolder = new File(".").getAbsolutePath().replace("%20", " ");
        } else {
            File currentDir = new File(RunTest.class.getClassLoader().getResource(".").getFile());
            targetFolder = currentDir.getParentFile().getParent();
        }
        File resultFile = new File(targetFolder.replace("%20", " "), "results");
        File testData =  new File(targetFolder.replace("%20", " "), "testdata");
        File destinationFile = new File(resultFile, "SanityStatus.xlsx");
        if(destinationFile.exists()) {
            destinationFile.delete();
        }

        try {
            Files.copy(Paths.get(new File(testData, "SanityStatus.xlsx").getAbsolutePath().replace("%20", " ")),
                    Paths.get(destinationFile.getAbsolutePath().replace("%20", " ")));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        res = true;
        return res;
    }

    public static String getPreviousDateInFormat(String dateFormat, int previous) {
        String dateInString = new SimpleDateFormat(dateFormat).format(DateUtils.addDays(new Date(),-previous));
        return dateInString;
    }
    public static String getPreviousMonthInFormat(String dateFormat, int previous) {
        String dateInString = new SimpleDateFormat(dateFormat).format(DateUtils.addMonths(new Date(),-previous));
        return dateInString;
    }

    /*public static void archiveStatusFile() throws Exception {
        String targetStr = "results/SanityStatus.xlsx";
        List<HashMap<String, String>> delta = ExcelFactory.setListData(targetStr, "Sheet1");
        List<HashMap<String, String>> current;// = ExcelFactory.setListData("results/SanityStatus.xlsx", "Shhet1");
        FileSystem system = FileSystems.getDefault();
        Path original = system.getPath(targetStr);
        String targetString = "results/StatusPriorityMobile";

        String targetStrOld;
        //Path target = system.getPath("results/listForExecution.xlsx");
        boolean toCopy = true;
        int i = 0;
        while (toCopy) {
            i++;
            targetStrOld = targetStr;
            targetStr = targetString.concat(String.valueOf(i)).concat(".xlsx");
            try {
                // Throws an exception if the original file is not found.
                Path target = system.getPath(targetStr);
                DataManager.userObject.put("StatusResultPath", targetStr);
                //Path targetOld = system.getPath(targetStrOld);
                //Files.copy(targetOld, target);
                Files.copy(original, target);
                current = ExcelFactory.setListData(targetStrOld, "Sheet1");
                for (HashMap<String, String> item : current) {
                    boolean isNotInNew = true;
                    for (HashMap<String, String> change : delta)
                        if (change.get("Case ID").equals(item.get("Case ID"))) {
                            isNotInNew = false;
                        }
                    if (isNotInNew) {
                        String caseId = item.get("Case ID");
                        String priority = item.get("Priority");
                        String result = item.get("Result");
                        String platform = item.get("Platform");
                        item.put("result", item.get("Result"));
                        ExcelFactory.addRowInExcel(targetStr, "Sheet1", caseId, priority, result, platform);
                    }
                }
                toCopy = false;
            } catch (IOException ex) {
                if (i > 8) {
                    //toCopy = false;
                    throw new Exception("Files already exists!");
                }
            }
        }
    }*/

    /*public static void copyFileToServer() {
        FileSystem system = FileSystems.getDefault();
        String source = DataManager.userObject.get("StatusResultPath").toString();
        String target = DataManager.serverLogFolder.concat("\\StatusPriorityAndroid.xlsx");
        Path sourcePath = system.getPath(source);
        Path targetPath = system.getPath(target);
        try {
            Files.copy(sourcePath, targetPath, StandardCopyOption.REPLACE_EXISTING);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }*/

    public static String getFutureMonthInFormat(String dateFormat, int future) {
        String dateInString = new SimpleDateFormat(dateFormat).format(DateUtils.addMonths(new Date(),future));
        return dateInString;
    }
    //endregion - Testrail -

    /**
     * Method for saving results from several executions
     * @throws Exception Custom Error
     */
    public static void archiveStatusFile() throws Exception {
        String targetStr = "results/SanityStatus.xlsx";
        List<HashMap<String, String>> delta = ExcelFactory.setListData(targetStr, "Sheet1");
        List<HashMap<String, String>> current;
        FileSystem system = FileSystems.getDefault();
        Path original = system.getPath(targetStr);
        String targetString;
        if (Base.testPlatform.equals("iOS"))
            targetString = "results/StatusPriorityIos";
        else
            targetString = "results/StatusPriorityAndroid";
        String targetStrOld;
        //Path target = system.getPath("results/listForExecution.xlsx");
        boolean toCopy = true;
        int i = 0;
        while (toCopy) {
            i++;
            targetStrOld = targetStr;
            targetStr = targetString.concat(String.valueOf(i)).concat(".xlsx");
            try {
                Path target = system.getPath(targetStr);
                DataManager.userObject.put("StatusResultPath", targetStr);
                Files.copy(original, target);
                current = ExcelFactory.setListData(targetStrOld, "Sheet1");
                for (HashMap<String, String> item : current) {
                    boolean isNotInNew = true;
                    for (HashMap<String, String> change : delta)
                        if (change.get("Case ID").equals(item.get("Case ID"))) {
                            isNotInNew = false;
                        }
                    if (isNotInNew) {
                        String caseId = item.get("Case ID");
                        String priority = item.get("Priority");
                        String result = item.get("Result");
                        String platform = item.get("Platform");
                        item.put("result", item.get("Result"));
                        ExcelFactory.addRowInExcel(targetStr, "Sheet1", caseId, priority, result, platform);
                    }
                }
                toCopy = false;
            } catch (IOException ex) {
                if (i > 8) {
                    //toCopy = false;
                    throw new Exception("Files already exists!");
                }
            }
        }
    }

    public static void copyFileToServer() {
        FileSystem system = FileSystems.getDefault();
        String source = DataManager.userObject.get("StatusResultPath").toString();
        String target;
        if (Base.testPlatform.equals("iOS"))
            target = DataManager.serverLogFolder.concat("\\StatusPriorityIos.xlsx");
        else
            target = DataManager.serverLogFolder.concat("\\StatusPriorityAndroid.xlsx");
        Path sourcePath = system.getPath(source);
        Path targetPath = system.getPath(target);
        try {
            Files.copy(sourcePath, targetPath, StandardCopyOption.REPLACE_EXISTING);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * Replace strings with {string}vin @text
     * @param text text to change
     * @return String changed text
     */
    public static String replaceParams(String text){
        int a = text.indexOf('"');
        int b = 0;
        while(a > 0){
            b = text.indexOf('"',a +1 );
            text = text.substring(0, a).concat("{string}").concat(text.substring(b +1));
            a = text.indexOf('"');
        }
        return text;
    }

    /**
     * Find code method in java file
     * @param stepText pattern in tag to find method
     * @return List of strings with code
     */
    public static List<String> getMethodCodeSimple (String stepText){
        List<String> list = new ArrayList<String>();
        CharSequence cs = "(\"".concat(stepText).concat("\")");
        final String filePath = "src/main/java/si/nlb/testautomation/NLBMobileAutomation/Test/Steps.java";
        BufferedReader br = null;
        boolean isFound = false;
        boolean isNotEnd = true;
        int flag = 0;
        long counter = 0;
        try{
            File file = new File(filePath);
            br = new BufferedReader(new FileReader(file));
            String line = null;
            while ((line = br.readLine()) != null){
                if (line.contains(cs)){
                    isFound = true;
                }
                if(isFound && isNotEnd){
                    switch (flag){
                        case 0 :
                            flag = 1;
                            break;
                        case 1 :
                            list.add(line);
                            if(line.contains("{")){
                                flag = 2;
                                counter = line.chars().filter(ch -> ch == '{').count() - line.chars().filter(ch -> ch == '}').count();
                                if (counter == 0)
                                    flag = 3;
                            }
                            break;
                        case 2:
                            list.add(line);
                            counter = counter + line.chars().filter(ch -> ch == '{').count() - line.chars().filter(ch -> ch == '}').count();
                            if (counter == 0)
                                flag = 3;
                            break;
                        case 3:
                            isNotEnd = false;
                    }
                }
            }
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        finally {
            if(br != null){
                try{
                    br.close();
                }
                catch (Exception e){

                }
            }
        }
        return list;
    }

    /**
     * Method for logging code from Steps.java file
     * @param stepText Step pattern
     * @return String list with method code
     */
    public static List<String> getMethodCode(String stepText){
        boolean hasNumber = false;
        List<String> list = new ArrayList<String>();
        stepText = replaceParams(stepText);
        String[] params = stepText.split(" ");
        for(String s : params){
            if(StringUtils.isNumeric(s))
                hasNumber = true;
        }
        if(hasNumber){
            String stepTextAlt = stepText;
            int index = 0;
            for(String s : params){
                if(StringUtils.isNumeric(s)) {
                    if (params.length == 1)
                        stepTextAlt = stepTextAlt.replace(s, "{int}");
                    if (index == 0)
                        stepTextAlt = stepTextAlt.replace(s.concat(" "), "{int} ");
                    else if (index == (params.length - 1)) {
                        stepTextAlt = stepTextAlt.replace(" ".concat(s), " {int}");
                    } else
                        stepTextAlt = stepTextAlt.replace(" ".concat(s).concat(" "), " {int} ");
                }
                index++;
            }
            list = getMethodCodeSimple(stepTextAlt);
            if (list.isEmpty())
                list = getMethodCodeSimple(stepText);
        } else {
            list = getMethodCodeSimple(stepText);
        }
        return list;
    }

    public static double round(Double value, int places) {
        if (places < 0) throw new IllegalArgumentException();

        BigDecimal bd = BigDecimal.valueOf(value);
        bd = bd.setScale(places, RoundingMode.HALF_UP);
        return bd.doubleValue();
    }
    //public static void testList(){
      //  String text = "Assert there are more than 30 transactions";
        //List<String> lista = Utilities.getMethodCode(text);
        //for(String s : lista)
          //  Log.info(s);
    //}
}
