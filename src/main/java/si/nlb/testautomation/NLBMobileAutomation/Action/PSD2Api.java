package si.nlb.testautomation.NLBMobileAutomation.Action;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.restassured.RestAssured;
import io.restassured.response.Response;
import org.junit.Assert;
import si.nlb.testautomation.NLBMobileAutomation.Data.DataManager;

import java.util.HashMap;
import java.util.Map;

import static io.restassured.RestAssured.given;
import static si.nlb.testautomation.NLBMobileAutomation.Core.Base.driver;

public class PSD2Api {

    static RoutineHelper rh = new RoutineHelper();

    public static void postTPPRegistration() {
        RestAssured.baseURI = "https://dbp2-iuat.nlb.si";
        RestAssured.useRelaxedHTTPSValidation();
        String new_tpp_name = rh.generateRandomStringOfCertainLenght(5);
        DataManager.userObject.put("new_tpp_name",new_tpp_name);


        Response response = given()
                .header("x-psd2-gw-key","jhaP20fMSa8vpJLMbjT11Svv9ghd8Gna")
                .header("x-request-id","2cf3dd5f-b6cb-410f-af5a-055898172d31")
                .header("cache-control","no-cache")
                .header("postman-token","c1a58c33-85fd-0cf8-d0ad-ca8732b6f909")
                .header("tpp-name",new_tpp_name)
                .header("tpp-reg-num",new_tpp_name)
                .header("tpp-nca","nan")
                .header("tpp-nca-name","name")
                .header("tpp-roles","PSP_IC,PSP_AI,PSP_PI")
                .header("content-type","application/json")
                .when()
                .post("/api/psd2-api-presentation-service/v1/tpp/register")
                .then()
                .extract().response();
        System.out.println("---status code---" + response.statusCode());
        System.out.println("---response body---" + response.prettyPrint());

        Assert.assertEquals(response.getStatusCode(),204);
    }

    public static void postLogin() throws JsonProcessingException {
        RestAssured.baseURI = "https://dbp2-iuat.nlb.si";
        RestAssured.useRelaxedHTTPSValidation();

        String new_tpp_name = (String) DataManager.userObject.get("new_tpp_name");
        Response response = given()
                .header("TPP-roles","PSP_AI,PSP_PI")
                .header("X-PSD2-GW-Key","jhaP20fMSa8vpJLMbjT11Svv9ghd8Gna")
                .header("Content-Type","application/json")
                .header("TPP-reg-num",new_tpp_name)
                .when()
                .post("/api/auth/tpp-login")
                .then()
                .extract().response();
        System.out.println("---status code---" + response.statusCode());
        System.out.println("---response body---" + response.prettyPrint());

        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode jsonNode = objectMapper.readTree(response.prettyPrint());
        String accessToken = jsonNode.get("access_token").asText();
        String tokenType = jsonNode.get("token_type").asText();
        String expiresIn = jsonNode.get("expires_in").asText();

        System.out.println("---cookie---" + accessToken);
        DataManager.userObject.put("accessToken", accessToken);
        System.out.println("---cookie---" + response.getCookie("XSRF-TOKEN"));
        DataManager.userObject.put("XSRF-TOKEN",response.getCookie("XSRF-TOKEN"));

        Assert.assertEquals(response.getStatusCode(),200);
        Assert.assertTrue(accessToken.length()>20);
        Assert.assertEquals(expiresIn,"3600");
        Assert.assertTrue(tokenType.equals("Bearer"));
    }

    public static void postTPPCreateConsentAndroidAndExpectError() {
        RestAssured.baseURI = "https://dbp2-iuat.nlb.si";
        RestAssured.useRelaxedHTTPSValidation();
        String xsrf_token = (String) DataManager.userObject.get("XSRF-TOKEN");
        String accessToken = (String) DataManager.userObject.get("accessToken");
        String todayDate = ActionApiHelpers.getTodayDateInFormat("yyyy-MM-dd");
        String tpp_name_new = (String) DataManager.userObject.get("new_tpp_name");

        String jsonBody = "{\"access\":{\"accounts\":[],\"balances\":[],\"transactions\":[]},\"recurringIndicator\":true,\"validUntil\":\""+todayDate+"\",\"frequencyPerDay\":\"4\",\"combinedServiceIndicator\":true}";

        Response response = given()
                .header("Authorization", "Bearer " + accessToken)
                .header("Cookie", "XSRF-TOKEN="+xsrf_token)
                .header("Content-Type","application/json")
                .header("X-Request-ID","2cf3dd5f-b6cb-410f-af5a-055898172d31")
                .header("TPP-Redirect-URI","")
                .header("tpp-name",tpp_name_new)
                .header("TPP-Nok-Redirect-URI","")
                .header("X-XSRF-TOKEN",xsrf_token)
                .header("PSU-IP-Address","255.255.255.0")
                .header("PSU-IP-Port","443")
                .body(jsonBody)
                .when()
                .post("/api/psd2-api-presentation-service/v1/consents")
                .then()
                .extract().response();
    }

    public static void postTPPCreateConsentAndroid() throws JsonProcessingException {
        RestAssured.baseURI = "https://dbp2-iuat.nlb.si";
        RestAssured.useRelaxedHTTPSValidation();
        String xsrf_token = (String) DataManager.userObject.get("XSRF-TOKEN");
        String accessToken = (String) DataManager.userObject.get("accessToken");
        String new_tpp_name = (String) DataManager.userObject.get("new_tpp_name");
        String todayDate = ActionApiHelpers.getTodayDateInFormat("yyyy-MM-dd");
        //String futureDate = ActionApiHelpers.getTodayDatePlusXDaysInFormat(2,"yyyy-MM-dd");
        String jsonBody = "{\"access\":{\"accounts\":[],\"balances\":[],\"transactions\":[]},\"recurringIndicator\":true,\"validUntil\":\""+todayDate+"\",\"frequencyPerDay\":\"4\",\"combinedServiceIndicator\":true}";


        Response response = given()
                .header("Authorization", "Bearer " + accessToken)
                .header("Cookie", "XSRF-TOKEN="+xsrf_token)
                .header("Content-Type","application/json")
                .header("X-Request-ID","2cf3dd5f-b6cb-410f-af5a-055898172d31")
                .header("TPP-Redirect-URI","")
                .header("tpp-name",new_tpp_name)
                .header("TPP-Nok-Redirect-URI","")
                .header("X-XSRF-TOKEN",xsrf_token)
                .header("PSU-IP-Address","255.255.255.0")
                .header("PSU-IP-Port","443")
                .body(jsonBody)
                .when()
                .post("/api/psd2-api-presentation-service/v1/consents")
                .then()
                .extract().response();

        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode jsonNode = objectMapper.readTree(response.prettyPrint());
        String consentStatus = jsonNode.get("consentStatus").asText();
        String consentId = jsonNode.get("consentId").asText();
        DataManager.userObject.put("consentId",consentId);
        JsonNode linksNode = jsonNode.get("_links");
        String scaStatus = linksNode.get("scaStatus").asText();
        String scaRedirect = linksNode.get("scaRedirect").asText();
        String scaRedirectMobileAdditional = linksNode.get("scaRedirectMobileAdditional").asText();
        String scaRedirectMobile = linksNode.get("scaRedirectMobile").asText();
        DataManager.userObject.put("scaRedirectMobile",scaRedirectMobile);
        String status = linksNode.get("status").asText();

        Assert.assertEquals(consentStatus,"received");
        Assert.assertTrue(consentId.length()>10);
        Assert.assertTrue(scaStatus.startsWith("/api/v1/consents/"));
        Assert.assertTrue(scaStatus.contains("/authorisations/"));
        Assert.assertTrue(scaRedirect.startsWith("https://odprte-storitve-uporabniki"));
        Assert.assertTrue(scaRedirect.contains("api/portal/web-psd2/consent#/login/?consentId="));
        Assert.assertTrue(scaRedirectMobileAdditional.startsWith("nlb-klikpro://consent?consentId="));
        Assert.assertTrue(scaRedirectMobile.startsWith("nlb-klikin://consent?consentId="));
        Assert.assertTrue(status.startsWith("/api/v1/consents/"));
        Assert.assertTrue(status.endsWith("/status"));


        System.out.println("---status code---" + response.statusCode());
        System.out.println("---response body---" + response.prettyPrint());
    }

    public static void startApp() {
        String redirectMobileString = (String) DataManager.userObject.get("scaRedirectMobile");
        Map<String, Object> args = new HashMap<>();
        args.put("url", redirectMobileString);
        args.put("package", "si.nlb.klik.uat");
        driver.executeScript("mobile: deepLink", args);
    }

    public static void postCreatePaymentAndroidWithDebtorAndExpectError(String debtorIban) {
        RestAssured.baseURI = "https://dbp2-iuat.nlb.si";
        RestAssured.useRelaxedHTTPSValidation();
        String xsrf_token = (String) DataManager.userObject.get("XSRF-TOKEN");
        String accessToken = (String) DataManager.userObject.get("accessToken");
        String todayDate = ActionApiHelpers.getTodayDateInFormat("yyyy-MM-dd");
        String debtorAccount = debtorIban.replace(" ","");

        String jsonBody = "{\"debtorAccount\":{\"iban\":\""+debtorAccount+"\",\"currency\":\"EUR\"},\"instructedAmount\":{\"currency\":\"EUR\",\"amount\":\"45.22\"},\"creditorAccount\":{\"iban\":\"SI56029220012208609\",\"currency\":\"EUR\"},\"creditorName\":\"DB\",\"creditorAddress\":{\"buildingNumber\":\"1\",\"city\":\"Ljubljana\",\"country\":\"SI\",\"postalCode\":\"1000\",\"street\":\"Ulica\"},\"debtorAddress\":{\"buildingNumber\":\"1\",\"city\":\"Ljubljana\",\"country\":\"SI\",\"postalCode\":\"1000\",\"street\":\"BERNEKERJEVA ULICA 24\"},\"endToEndIdentification\":\"SI002023\",\"remittanceInformationStructured\":\"SI001234\",\"remittanceInformationUnstructured\":\"TEST TPP QA ENV\",\"purposeCode\":\"OTHR\",\"executionDate\":\"" + todayDate + "\"}";

        Response response = given()
                .header("Authorization", "Bearer " + accessToken)
                .header("Cookie", "XSRF-TOKEN="+xsrf_token)
                .header("Content-Type","application/json")
                .header("Accept", "*/*")
                .header("Accept-Encoding", "gzip, deflate, br")
                .header("Connection", "keep-alive")
                .header("X-Request-ID","2cf3dd5f-b6cb-410f-af5a-055898172d31")
                .header("PSU-IP-Address", "10.0.15.202")
                .header("TPP-Redirect-URI","https://www.nlb.si")
                .header("X-XSRF-TOKEN",xsrf_token)
                .body(jsonBody)
                .when()
                .post("/api/psd2-api-presentation-service/v1/payments/sepa-credit-transfers")
                .then()
                .extract().response();
    }

    public static void postCreatePaymentAndroidWithDebtor(String debtorIban) throws JsonProcessingException {
        RestAssured.baseURI = "https://dbp2-iuat.nlb.si";
        RestAssured.useRelaxedHTTPSValidation();
        String xsrf_token = (String) DataManager.userObject.get("XSRF-TOKEN");
        String accessToken = (String) DataManager.userObject.get("accessToken");
        String todayDate = ActionApiHelpers.getTodayDateInFormat("yyyy-MM-dd");
        String randomPurpose = rh.generateRandomStringOfCertainLenght(10);
        String debtorAccount = debtorIban.replace(" ","");
        String jsonBody = "{\"debtorAccount\":{\"iban\":\""+debtorAccount+"\",\"currency\":\"EUR\"},\"instructedAmount\":{\"currency\":\"EUR\",\"amount\":\"45.22\"},\"creditorAccount\":{\"iban\":\"SI56020102753253980\",\"currency\":\"EUR\"},\"creditorName\":\"DB\",\"creditorAddress\":{\"buildingNumber\":\"1\",\"city\":\"Ljubljana\",\"country\":\"SI\",\"postalCode\":\"1000\",\"street\":\"Ulica\"},\"debtorAddress\":{\"buildingNumber\":\"1\",\"city\":\"Ljubljana\",\"country\":\"SI\",\"postalCode\":\"1000\",\"street\":\"BERNEKERJEVA ULICA 24\"},\"endToEndIdentification\":\"SI002023\",\"remittanceInformationStructured\":\"SI001234\",\"remittanceInformationUnstructured\":\"" + randomPurpose + "\",\"purposeCode\":\"OTHR\",\"executionDate\":\"" + todayDate + "\"}";

        Response response = given()
                .header("Authorization", "Bearer " + accessToken)
                .header("Cookie", "XSRF-TOKEN="+xsrf_token)
                .header("Content-Type","application/json")
                .header("Accept", "*/*")
                .header("Accept-Encoding", "gzip, deflate, br")
                .header("Connection", "keep-alive")
                .header("X-Request-ID","2cf3dd5f-b6cb-410f-af5a-055898172d31")
                .header("PSU-IP-Address", "10.0.15.202")
                .header("TPP-Redirect-URI","https://www.nlb.si")
                .header("X-XSRF-TOKEN",xsrf_token)
                .body(jsonBody)
                .when()
                .post("/api/psd2-api-presentation-service/v1/payments/sepa-credit-transfers")
                .then()
                .extract().response();

        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode jsonNode = objectMapper.readTree(response.prettyPrint());
        String transactionStatus = jsonNode.get("transactionStatus").asText();
        String paymentId = jsonNode.get("paymentId").asText();
        JsonNode linksNode = jsonNode.get("_links");
        String scaRedirect = linksNode.get("scaRedirect").asText();
        String scaRedirectMobileAdditional = linksNode.get("scaRedirectMobileAdditional").asText();
        String scaRedirectMobile = linksNode.get("scaRedirectMobile").asText();
        DataManager.userObject.put("scaRedirectMobile",scaRedirectMobile);
        String status = linksNode.get("status").asText();
        DataManager.userObject.put("randomPurpose",randomPurpose);

        Assert.assertEquals(transactionStatus,"RCVD");
        Assert.assertTrue(paymentId.length()>10);
        Assert.assertTrue(scaRedirect.startsWith("https://odprte-storitve-uporabniki"));
        Assert.assertTrue(scaRedirect.contains("/api/portal/web-psd2/consent#/login/?paymentRequestId="));
        Assert.assertTrue(scaRedirectMobileAdditional.startsWith("nlb-klikpro://payment?paymentRequestId="));
        Assert.assertTrue(scaRedirectMobile.startsWith("nlb-klikin://payment?paymentRequestId="));
        Assert.assertTrue(status.startsWith("/api/v1/payments/"));
        Assert.assertTrue(status.endsWith("/status"));


        System.out.println("---status code---" + response.statusCode());
        System.out.println("---response body---" + response.prettyPrint());
    }
}
