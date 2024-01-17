<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*, javax.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%
// PostgreSQLへの接続情報
String dbURL = "jdbc:postgresql://localhost:5432/reserve";
String username = "postgres";
String password = "admin";

// データベースの接続
Connection conn = null;
ResultSet rs = null;
Statement stmt = null;

try {
    // JDBCドライバのロード
    Class.forName("org.postgresql.Driver");

    // データベースに接続
    conn = DriverManager.getConnection(dbURL, username, password);

    // クエリの作成と実行
    String query = "SELECT * FROM reservetable"; 
    stmt = conn.createStatement();
    rs = stmt.executeQuery(query);

    // 結果の表示
    out.println("<h2>予約履歴</h2>");
    out.println("<table border='1'>");
    out.println("<tr><th>予約ID</th><th>合計金額</th><th>席</th></tr>");

    while (rs.next()) {
        out.println("<tr>");
        out.println("<td>" + rs.getInt("reserveid") + "</td>"); 
        out.println("<td>" + rs.getString("total") + "</td>"); 
        out.println("<td>" + rs.getString("seats") + "</td>"); 
        out.println("</tr>");
    }

    out.println("</table>");

} catch (Exception e) {
    e.printStackTrace();
} finally {
    // リソースの解放
    try {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
%>

