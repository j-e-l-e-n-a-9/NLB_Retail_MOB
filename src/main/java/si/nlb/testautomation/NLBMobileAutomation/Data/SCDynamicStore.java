package si.nlb.testautomation.NLBMobileAutomation.Data;

public class SCDynamicStore {
    public native String copyComputerName();
    static {
        System.loadLibrary("SCDynamicStore");
    }
}
