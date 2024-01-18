import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

@WebServlet("/ReservationServlet")
public class ReservationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        

        // クライアントから送信されたパラメータを取得
        int titleId = Integer.parseInt(request.getParameter("titleId"));
        String date = request.getParameter("date");
        String time = request.getParameter("time");

        // データベースから予約済みの座席情報を取得
        try {
            Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/cinema", "postgres", "admin");
            List<String> reservedSeats = getReservedSeatsFromDatabase(connection, titleId, date, time);

            // 座席情報をJSON形式でクライアントに返す
         // 座席情報をJSON形式でクライアントに返す
         // 座席情報をJSON形式でクライアントに返す
            PrintWriter out = response.getWriter();
            out.write("{\"reservedSeats\": " + new Gson().toJson(reservedSeats) + "}");

        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("Error fetching data from the database");
        }
    }

    private List<String> getReservedSeatsFromDatabase(Connection connection, int titleId, String date, String time)
            throws SQLException {
    	
        List<String> reservedSeats = new ArrayList<>();
        
        String query = "SELECT seat FROM reservetable WHERE titleid = ? AND date = ? AND time = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, titleId);
            preparedStatement.setString(2, date);
            preparedStatement.setString(3, time);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    reservedSeats.add(resultSet.getString("seat"));
                }
            }
        }

        return reservedSeats;
    }
}