import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseUtil {
    private static final String dbURL = "jdbc:postgresql://localhost:5432/cinema";
    private static final String username = "postgres";
    private static final String password = "pass67";

    public static Connection getConnection() throws SQLException {
        try {
        	Class.forName("org.postgresql.Driver");
            return DriverManager.getConnection(dbURL, username, password);
        } catch (ClassNotFoundException e) {
            throw new SQLException("Database driver not found", e);
        }
    }
}