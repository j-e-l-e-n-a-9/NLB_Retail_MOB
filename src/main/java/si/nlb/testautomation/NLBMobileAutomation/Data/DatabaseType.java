package si.nlb.testautomation.NLBMobileAutomation.Data;

/**
 * Enumeration of supported database engines
 */
public enum DatabaseType {
    MSSQL("MSSqlServer"),
    ORACLE("Oracle"),
    POSTGRESQL("PostgreSQL"),
    MYSQL("MySQL");

    DatabaseType(String type) { this.dbEngineType = type; }

    private String dbEngineType;
    public String getEngineType() { return this.dbEngineType; }
}
