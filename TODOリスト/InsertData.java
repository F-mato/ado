import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class InsertData {

    private final String url = "jdbc:postgresql://localhost:5432/TODOlist";
    private final String user = "postgres";
    private final String password = "admin";

    /**
     * データベースに接続する
     *
     * @return データベース接続オブジェクト
     */
    public Connection connect() throws SQLException {
        return DriverManager.getConnection(url, user, password);
    }

    /**
     * todosテーブルにデータを挿入する
     *
     * @param task タスクの内容
     * @param date タスクの日付
     * @param time タスクの時間
     * @param completed タスクが完了したかどうか
     */
    public void insertTask(String task, String date, String time, boolean completed) {
        String SQL = "INSERT INTO todos(task, date, time, completed) VALUES(?,?,?,?)";

        try (Connection conn = connect();
             PreparedStatement pstmt = conn.prepareStatement(SQL)) {

            pstmt.setString(1, task);
            pstmt.setString(2, date);
            pstmt.setString(3, time);
            pstmt.setBoolean(4, completed);

            int affectedRows = pstmt.executeUpdate();

            // 挿入された行の数を確認
            if (affectedRows > 0) {
                System.out.println("A new task was inserted successfully.");
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }

    public static void main(String[] args) {
        InsertData app = new InsertData();
        // デモ用のタスクデータを挿入
        app.insertTask("Learn Java", "2023-01-01", "10:00:00", false);
    }
}
