import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

@WebServlet("/Reserve")
public class Reserve extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=UTF-8");

       
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        Object titleId = request.getParameter("titleid");
        
        //List<String> availableTimes = getAvailableTimes(titleId, date);
        List<String> reservedSeats = getReservedSeats(titleId, date, time);

        // JSON形式のデータを生成
        String json = "{\"reservedSeats\":" + new Gson().toJson(reservedSeats) + "}";
        			 // ",\"times\":" + new Gson().toJson(availableTimes) + "}";

        response.getWriter().write(json);
    }
    
//    private List<String> getAvailableTimes(int titleId, String date) {
//        List<String> availableTimes = new ArrayList<>();
//
//        try {
//            Class.forName("org.postgresql.Driver");
//            Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/cinema", "postgres",
//                    "admin");
//
//            PreparedStatement ps = con.prepareStatement(
//                    "SELECT time1, time2, time3, time4, time5, time6 FROM title WHERE titleid = ?");
//            ps.setInt(1, titleId);
//
//            ResultSet rs = ps.executeQuery();
//
//            if (rs.next()) {
//                // Add available times to the list
//                availableTimes.add(rs.getString("time1"));
//                availableTimes.add(rs.getString("time2"));
//                availableTimes.add(rs.getString("time3"));
//                availableTimes.add(rs.getString("time4"));
//                availableTimes.add(rs.getString("time5"));
//                availableTimes.add(rs.getString("time6"));
//            }
//
//            rs.close();
//            ps.close();
//            con.close();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        return availableTimes;
//    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        
		HttpSession session = request.getSession();
	    int memberId = (int) session.getAttribute("session_memberId");
	    String name = (String) session.getAttribute("session_name");
	    String mail = (String) session.getAttribute("session_mail");

        PrintWriter out = response.getWriter();
        
        int titleId = Integer.parseInt(request.getParameter("titleid")); 
        String[] seats = request.getParameterValues("seats");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        //int ticketId = Integer.parseInt(request.getParameter("ticketId"));
        String total = request.getParameter("total");
        String freewrite = request.getParameter("freewrite");
        
        
		// reserveIdを配列に格納して、併記する準備 ★メール用★
		ArrayList<Integer> reserveIdList = new ArrayList<Integer>();
		ArrayList<String> stReserveIdList = new ArrayList<String>();
		int reserveId = 0;
		String stReserveIdList2 = null;
		

        List<String> reservedSeats = getReservedSeats(titleId, date, time);

        try {
            Class.forName("org.postgresql.Driver");
            Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/cinema", "postgres",
                    "admin");
            con.setAutoCommit(false);

            int count = 0;
            List<String> failedSeats = new ArrayList<>(); // 予約できなかった座席を格納するリスト

            for (String seat : seats) {
                if (!reservedSeats.contains(seat)) {
                    PreparedStatement ps = con.prepareStatement(
                            "insert into reservetable (titleId, seat, date, time, total, freewrite, memberId) values(?, ?, ?, ?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
                    ps.setInt(1, titleId);
                    ps.setString(2, seat);
                    ps.setString(3, date);
                    ps.setString(4, time);
                    //ps.setInt(5, ticketId);
                    ps.setString(5, total);
                    ps.setString(6, freewrite);
                    ps.setInt(7, memberId);

                    count += ps.executeUpdate();
                    
                    // ★メール用★
                    ResultSet rs = ps.getGeneratedKeys();
    				while(rs.next()) {
    					reserveId = rs.getInt(1);
    					reserveIdList.add(reserveId);
    					System.out.println("リストに格納した予約番号  " + reserveId);
    				}
                    
                    
                } else {
                    // 既に予約されている場合の処理
                    failedSeats.add(seat);
                }
            }

            if (count == seats.length) {
                con.commit();             // トランザクションをコミット
                response.setContentType("text/html; charset=UTF-8");
                out.print("<h3 style='color:green'> 予約が完了しました。 </h3>");

                
                // ★メール送信準備★
				System.out.println("コミットできた");

				System.out.println("引き継いだ名前:" + name);
				System.out.println("引き継いだメール:" + mail);
				System.out.println("引き継いだメンバID:" + memberId);
				System.out.println("引き継いだdate:" + date);
				System.out.println("引き継いだtime:" + time);
				System.out.println("引き継いだtotal:" + total);
				System.out.println("引き継いだstReserveIdList2:" + stReserveIdList2);
				
				// 配列併記 ★カンマ入れたい！！
				for(int num : reserveIdList) {
					stReserveIdList.add(String.valueOf(num));
					stReserveIdList2 = String.join(",", stReserveIdList);
					System.out.println(stReserveIdList2);
				}
					
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
					msg.setSubject("【ご予約内容の確認】 クラシック映画館");
				
					// 本文設定
					msg.setText(name + "様\n"
						+ "\n"
						+ "この度はご予約いただきましてありがとうございます。\n"
						+ "本日ご予約いただきました内容は、以下の通りです。\n"
						+ "予約をキャンセルされる場合は、ご予約日の前日までにお願いいたします。\n"
						+ "（予約日前日の23：59までに手続き完了が必要）\n"
						+ "\n"
						+ "【予約日時】\n"
						+ date + "\n"
						+ time + "\n"
						+ "\n"
						+ "【予約内容】\n"
						+ "予約番号" + stReserveIdList2 + "\n"
						//+ "券種：" + type + "\n"
						//+ "金額：" + price + "\n"
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
				                
                
                
                RequestDispatcher rd = request.getRequestDispatcher("/mypage.jsp");
                rd.include(request, response);
            } else {
                con.rollback();
                if (!failedSeats.isEmpty()) {
                    // 予約できなかった座席をエラーメッセージで表示
                    response.setContentType("text/html; charset=UTF-8");
                    out.print("<h3 style='color:red'>座席 " + String.join(", ", failedSeats) + " は既に予約されています。</h3>");

                    RequestDispatcher rd = request.getRequestDispatcher("/reserve.jsp");
                    rd.include(request, response);
                } else {
                    response.setContentType("text/html; charset=UTF-8");
                    out.print("<h3 style='color:red'> エラーが発生しました。 </h3>");

                    RequestDispatcher rd = request.getRequestDispatcher("/reserve.jsp");
                    rd.include(request, response);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();

            response.setContentType("text/html; charset=UTF-8");
            out.print("<h3 style='color:red'>予期せぬエラーが発生しました。</h3>");

            RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
            rd.include(request, response);
        }
    }

    private List<String> getReservedSeats(Object titleId, String date, String time) {
        List<String> reservedSeats = new ArrayList<>();

        try {
            Class.forName("org.postgresql.Driver");
            Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/cinema", "postgres",
                    "admin");

            PreparedStatement ps = con.prepareStatement(
                    "select seat from reservetable where titleId = ? and date = ? and time = ?");
            ps.setInt(1, (int)titleId);
            ps.setString(2, date);
            ps.setString(3, time);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                reservedSeats.add(rs.getString("seat"));
            }

            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return reservedSeats;
    }
}