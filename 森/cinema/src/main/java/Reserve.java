import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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

        PrintWriter out = response.getWriter();
        
        int titleId = Integer.parseInt(request.getParameter("titleid")); 
        String[] seats = request.getParameterValues("seats");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        //int ticketId = Integer.parseInt(request.getParameter("ticketId"));
        String total = request.getParameter("total");
        String freewrite = request.getParameter("freewrite");

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
                            "insert into reservetable (titleId, seat, date, time, total, freewrite, memberId) values(?, ?, ?, ?, ?, ?, ?)");
                    ps.setInt(1, titleId);
                    ps.setString(2, seat);
                    ps.setString(3, date);
                    ps.setString(4, time);
                    //ps.setInt(5, ticketId);
                    ps.setString(5, total);
                    ps.setString(6, freewrite);
                    ps.setInt(7, memberId);

                    count += ps.executeUpdate();
                } else {
                    // 既に予約されている場合の処理
                    failedSeats.add(seat);
                }
            }

            if (count == seats.length) {
                con.commit();
                response.setContentType("text/html; charset=UTF-8");
                out.print("<h3 style='color:green'> 予約が完了しました。 </h3>");

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