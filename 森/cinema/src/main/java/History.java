
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;





/**
 * Servlet implementation class History3
 */
@WebServlet("/History")
public class History extends HttpServlet {
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
		
		HttpSession session = request.getSession();
		int memberId = (int) session.getAttribute("session_memberId");
		System.out.println("引き継いだメンバID " + memberId);
		
		PrintWriter out = response.getWriter();
		
		String dbURL = "jdbc:postgresql://localhost:5432/cinema";
		//String dbURL = "jdbc:postgresql://localhost:5432/1";
		String username = "postgres";
		String password = "admin";
		//String password = "1974";

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
			String sql = "SELECT * FROM reservetable WHERE memberid=?";
			PreparedStatement pStmt = conn.prepareStatement(sql);
			
			// sqlの「？」の箇所にコマンドライン引数として受け取った値を設定する
			pStmt.setInt(1, memberId);

			
			//stmt = conn.createStatement();
			//rs = stmt.executeQuery(query);
			rs = pStmt.executeQuery();

			List<ReserveHistory> history = new ArrayList<ReserveHistory>();
			while (rs.next()) {
				int reserveId = rs.getInt("reserveId");
				String seat = rs.getString("seat");
				String date = rs.getString("date");

				history.add(new ReserveHistory(reserveId, seat, date));
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
	
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
	    String name = (String) session.getAttribute("session_name");
	    String mail = (String) session.getAttribute("session_mail");
		
		PrintWriter out = response.getWriter();

		String dbURL = "jdbc:postgresql://localhost:5432/cinema";
		//String dbURL = "jdbc:postgresql://localhost:5432/1";
		String username = "postgres";
		String password = "admin";
		//String password = "1974";
		
		// データベースの接続
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String reserveIdParam = null;
		int reserveId = 0;
		String date = null;
		String time = null;
		String type = null;
		String price = null;
		
		try {
			// JDBCドライバのロード
			Class.forName("org.postgresql.Driver");

			// データベースに接続
			conn = DriverManager.getConnection(dbURL, username, password);

			// 削除するreserveIdをリクエストパラメータから取得
			reserveIdParam = request.getParameter("id");
			reserveId = Integer.parseInt(reserveIdParam);
			
			System.out.println("パラメータから取得したキャンセルする予約番号 " + reserveId);
			
			// SELECT文を準備
			String sql = "SELECT * FROM reservetable "
					+ "JOIN ticket ON reservetable.ticketid=ticket.ticketid "
					+ "WHERE reserveid=?";
			PreparedStatement pStmt = conn.prepareStatement(sql);
			
			// sqlの「？」の箇所にコマンドライン引数として受け取った値を設定する
			pStmt.setInt(1, reserveId);
			
			// SELECTを実行し、結果表（ResultSet）を取得
			ResultSet rs = pStmt.executeQuery();
			
			// 表に格納されたレコードの内容を表示
			while (rs.next()) {
				date = rs.getString("date");
				time = rs.getString("time");
				type = rs.getString("type");
				price = rs.getString("price");
				
				System.out.println("キャンセルする日付 " + date);
				
			}
		} catch (SQLException | ClassNotFoundException e1) {
			e1.printStackTrace();
		}	
		

		try {
			// JDBCドライバのロード
			Class.forName("org.postgresql.Driver");

			// データベースに接続
			conn = DriverManager.getConnection(dbURL, username, password);
			
			/*
			// 削除するreserveIdをリクエストパラメータから取得
			String reserveIdParam = request.getParameter("id");
			int reserveId = Integer.parseInt(reserveIdParam);
*/
			// DELETE文の作成と実行
			String query = "DELETE FROM reservetable WHERE reserveId = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, reserveId);
			int rowsAffected = pstmt.executeUpdate();
		
			if (rowsAffected > 0) {
				out.print("Data deleted successfully");
				
				System.out.println("キャンセルする予約番号int " + reserveId);
				System.out.println("キャンセルする予約番号String " + reserveIdParam);
				System.out.println("キャンセルする日付 " + date);
				
				try {
					
					// プロパティの設定
					Properties props = System.getProperties();
				
					// ホスト
					props.put("mail.smtp.host", "smtp.gmail.com");
				
					// 認証（する）
					props.put("mail.smpt.auth", "true");
				
					// ポート指定（サブミッションポート）
					props.put("mail.smtp.port", "587");
				
					// STARTTLSによる暗号化（する）
					props.put("mail.smtp.starttls.enable", "true");
				
					// セッションの取得
					Session Esession = Session.getInstance(props);
				
					// MimeMessageの取得と設定
					Message msg = new MimeMessage(Esession);
				
					// 送信者設定
					msg.setFrom(new InternetAddress("example.recurrent7d@gmail.com"));
				
					// 宛先設定
					msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(mail, false));
				
					// タイトル設定
					msg.setSubject("【ご予約キャンセルのご案内】 クラシック映画館");
				
					// 本文設定
					msg.setText(name + "様\n"
						+ "\n"
						+ "ご予約のキャンセルを承りましたので、ご連絡いたします。\n"
						+ "キャンセル内容は下記のとおりです。\n"
						+ "\n"
						+ "【キャンセル日時】\n"
						+ date + "\n"
						+ time + "\n"
						+ "\n"
						+ "【キャンセル内容】\n"
						+ "券種: " + type + "\n"
						+ "金額: " + price + "円\n"
						+ "予約番号: " + reserveId + "\n"

						+ "\n"
						+ "【アクセス】\n"
						+ "Mapアプリにて確認をお願いします。\n"
						+ "-------------------------------------\n"
						+ "＜連絡先＞\n"
						+ "クラシック映画館\n"
						+ "電話\n"
						+ "住所\n"
						+ "URL\n"
						+ "-------------------------------------\n"
						);
					
									
					// 送信日時設定
					msg.setSentDate(new Date());
				
					// 送信
					Transport t = (Transport) Esession.getTransport("smtp");
					try {
						t.connect("smtp.gmail.com", "example.recurrent7d@gmail.com", "mchm vidv vpmr zmnt");
								t.sendMessage(msg, msg.getAllRecipients());
							} finally {
								t.close();
							}
				
						} catch (Exception e2) {
							e2.printStackTrace();
						}
				
			} else {
				out.print("No data deleted or data not found");
			}
			out.flush();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// リソースの解放
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
	}
}
