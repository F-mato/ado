import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MovieReservation {
	public static void main(String[] args) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			// PostgreSQLへの接続
			Class.forName("org.postgresql.Driver");
			String url = "jdbc:postgresql://localhost:5432/reserve";
			String username = "postgres";
			String password = "pass67";
			connection = DriverManager.getConnection(url, username, password);

			// クエリの実行
			String query = "SELECT * FROM reservetable where reserveid=37 ";
			preparedStatement = connection.prepareStatement(query);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				// データを取得して表示する例（カラム名は適切なものに置き換えてください）
				System.out.println("Reservation ID: " + resultSet.getInt("reserveid"));
				System.out.println("Total: " + resultSet.getString("total"));
				System.out.println("Seat: " + resultSet.getString("seats"));
				// 他のカラムも同様に取得可能
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 接続をクローズ
			try {
				if (resultSet != null) resultSet.close();
				if (preparedStatement != null) preparedStatement.close();
				if (connection != null) connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
