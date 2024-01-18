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

@WebServlet("/DataInfo")
public class DataInfo extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        String dbURL = "jdbc:postgresql://localhost:5432/cinema";
        String username = "postgres";
        String password = "admin";

        String selectedDate = request.getParameter("date");

        // データベースの接続
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pstmt = null;

        try {
            // JDBCドライバのロード
            Class.forName("org.postgresql.Driver");

            // データベースに接続
            conn = DriverManager.getConnection(dbURL, username, password);

            // プリペアードステートメントを使用してSQLクエリを作成
            String query = "SELECT * FROM title where date = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, selectedDate); // Set the value for the parameter

            // クエリの実行
            rs = pstmt.executeQuery();

            List<Movie> movies = new ArrayList<Movie>();
            while (rs.next()) {
                int screenId = rs.getInt("screenId");
                String title = rs.getString("title");
                String description = rs.getString("description");
                String imgpath = rs.getString("imgpath");
                String moviepath = rs.getString("moviepath");
                String time1 = rs.getString("time1");
                String time2 = rs.getString("time2");
                String time3 = rs.getString("time3");
                String time4 = rs.getString("time4");
                String time5 = rs.getString("time5");
                String time6 = rs.getString("time6");

                movies.add(new Movie(screenId, title, description, imgpath, moviepath, time1, time2, time3, time4, time5, time6));
            }

            MovieOut data = new MovieOut(movies);
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