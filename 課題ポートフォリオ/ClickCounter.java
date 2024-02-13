import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ClickCounter {

    private static final String URL = "jdbc:postgresql://localhost:5432/counter";
    private static final String USER = "postgres";
    private static final String PASSWORD = "admin";

    public static void incrementClickCount() {
        // UPDATE文ではなく、INSERT文を使用して新しいカウントをデータベースに挿入
        String insertQuery = "INSERT INTO click_count (count) VALUES (1) ON CONFLICT (id) DO UPDATE SET count = click_count.count + 1 WHERE click_count.id = 1;";

        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(insertQuery)) {
            
            pstmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static int getClickCount() {
        String selectQuery = "SELECT count FROM click_count WHERE id = 1;";
        int count = 0;

        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(selectQuery);
             ResultSet rs = pstmt.executeQuery()) {

            if (rs.next()) {
                count = rs.getInt("count");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return count;
    }
}
