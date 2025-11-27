package si.nlb.testautomation.NLBMobileAutomation.Test;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        dryRun=false,
        features="Features",
        glue={"si.nlb.testautomation.NLBMobileAutomation.Test"},
        plugin = {
                "pretty",
                "html:target/cucumber/report.html",
                "si.nlb.testautomation.NLBMobileAutomation.Test.StepDetails"
        }
)
public class Runner {

}
