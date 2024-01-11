
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;





/**
 * Servlet implementation class History3
 */
@WebServlet("/History3")
public class History3 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();

		String dbURL = "jdbc:postgresql://localhost:5432/classic";
		String username = "postgres";
		String password = "admin";

		// データベースの接続
		Connection conn = null;
		ResultSet rs = null;
		Statement stmt = null;
		//		String yourJsonString = "{\"reserveHistory\":["
		//                + "{\"reserveId\":\"Id\", "
		//                + "\"seats\":\"S1\", "
		//                + "\"date\":\"2024-01-16\"},"
		//                + "{\"reserveId\":\"Id\", "
		//                + "\"seats\":\"S1\", "
		//                + "\"date\":\"2024-01-16\"}"
		//                + "]}";
		try {
			// JDBCドライバのロード
			Class.forName("org.postgresql.Driver");

			// データベースに接続
			conn = DriverManager.getConnection(dbURL, username, password);

			// クエリの作成と実行
			String query = "SELECT * FROM reservetable";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			List<ReserveHistory> history = new ArrayList<ReserveHistory>();
			while (rs.next()) {
				int reserveId = rs.getInt("reserveId");
				String seats = rs.getString("seats");
				String date = rs.getString("date");
			
				history.add(new ReserveHistory(reserveId, seats, date));
			}


			ReservationData data = new ReservationData(history);
			String yourJsonString = data.toJson();
			out.print(yourJsonString);
			out.flush();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// リソースの解放
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
