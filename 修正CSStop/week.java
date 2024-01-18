package model;

import java.io.IOException;
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
 * Servlet implementation class test
 */
@WebServlet("/week")
public class week extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = null;
        Statement stmt = null;
        ResultSet rset = null;

        //接続文字列
        String url = "jdbc:postgresql://localhost:5432/cinema";
        String user = "postgres";
        String password = "admin";
//年代別来場者-------------------------------------------------------------------------------------------------------
        List<String> agegroup = new ArrayList<>();
        try{
            //PostgreSQLへ接続
            conn = DriverManager.getConnection(url, user, password);

            //自動コミットOFF
            conn.setAutoCommit(false);
            stmt = conn.createStatement();
        String count = "SELECT COUNT(reserveid),CONCAT(FLOOR(EXTRACT(YEAR FROM AGE(TO_DATE(birth, 'YYYY年mm月dd日'))) / 10) * 10, ' ') AS age_group\r\n"
        		+ "FROM membertable\r\n"
        		+ "INNER JOIN reservetable\r\n"
        		+ "ON membertable.memberid = reservetable.memberid\r\n"
        		+ "GROUP BY age_group\r\n"
        		+ "ORDER BY age_group";
        ResultSet rs = stmt.executeQuery(count);
        while(rs.next()){
            String g = rs.getString("count");
            agegroup.add(rs.getString("count"));
          }
        System.out.println(agegroup);
        //request.setAttribute("count", count);
        //request.getRequestDispatcher("/weekchart.jsp").forward(request, response);
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        finally {
            try {
                if(rset != null)rset.close();
                if(stmt != null)stmt.close();
                if(conn != null)conn.close();
            }
            catch (SQLException e){
                e.printStackTrace();
                
            }

        }
//年代別来場者-------------------------------------------------------------------------------------------------------
//性別来場者---------------------------------------------------------------------------------------------------------
        //SQLなどの記述の追加の際は各コメントアウトの部分に1つずつ反映させてください---------------------------------
        List<String> weekgendercount = new ArrayList<>();
        try{
            //PostgreSQLへ接続
            conn = DriverManager.getConnection(url, user, password);

            //自動コミットOFF
            conn.setAutoCommit(false);
            stmt = conn.createStatement();
        String count = "SELECT COUNT(gender), gender FROM membertable\r\n"
        		+ "INNER JOIN reservetable \r\n"
        		+ "ON membertable.memberid = reservetable.memberid\r\n"
        		+ "GROUP BY gender ";
        ResultSet rs = stmt.executeQuery(count);
        while(rs.next()){
            String g = rs.getString("count");
            weekgendercount.add(rs.getString("count"));
          }
        System.out.println(weekgendercount);
        //request.setAttribute("count", count);
        //request.getRequestDispatcher("/weekchart.jsp").forward(request, response);
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        finally {
            try {
                if(rset != null)rset.close();
                if(stmt != null)stmt.close();
                if(conn != null)conn.close();
            }
            catch (SQLException e){
                e.printStackTrace();
                
            }

        }
        
//性別来場者---------------------------------------------------------------------------------------------------------
//週別の来場者-----------------------------------------------------------------------------------------------------      
        
        List<String> weekagegroup = new ArrayList<>();
        try{
            //PostgreSQLへ接続
            conn = DriverManager.getConnection(url, user, password);

            //自動コミットOFF
            conn.setAutoCommit(false);

            //SELECT文の実行
            stmt = conn.createStatement();
    /*        commit;
            SELECT   COUNT(TO_DATE(date, 'YYYY年mm月dd日'))as week
            FROM reservetable
            WHERE date BETWEEN '2024/01/01' AND '2024/01/07' AND titleid = '1'
            GROUP BY date; */

            String json = "SELECT COUNT(TO_DATE(date, 'YYYY年mm月dd日'))\r\n"
            		+ "FROM reservetable\r\n"
            		+ "WHERE date BETWEEN '2024/01/01' AND '2024/01/07' AND titleid = '1'";
            rset = stmt.executeQuery(json);
            
            //SELECT結果の受け取り
            while(rset.next()){
                String col = rset.getString(1);
                weekagegroup.add(rset.getString("week"));
                
            }
            System.out.println(weekagegroup);

            
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        finally {
            try {
                if(rset != null)rset.close();
                if(stmt != null)stmt.close();
                if(conn != null)conn.close();
            }
            catch (SQLException e){
                e.printStackTrace();
                
            }

        }
        List<String> weekagegroupc = new ArrayList<>();
        try{
            //PostgreSQLへ接続
            conn = DriverManager.getConnection(url, user, password);

            //自動コミットOFF
            conn.setAutoCommit(false);

            //SELECT文の実行
            stmt = conn.createStatement();
    /*        commit;
            SELECT   COUNT(TO_DATE(date, 'YYYY年mm月dd日'))as week
            FROM reservetable
            WHERE date BETWEEN '2024/01/01' AND '2024/01/07' AND titleid = '1'
            GROUP BY date; */

            String json = "SELECT COUNT(TO_DATE(date, 'YYYY年mm月dd日'))\r\n"
            		+ "FROM reservetable\r\n"
            		+ "WHERE date BETWEEN '2024/01/01' AND '2024/01/07' AND titleid = '7'";
            rset = stmt.executeQuery(json);
            
            //SELECT結果の受け取り
            while(rset.next()){
                String col = rset.getString(1);
                weekagegroupc.add(rset.getString("week"));
                
            }
            System.out.println(weekagegroupc);

            
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        finally {
            try {
                if(rset != null)rset.close();
                if(stmt != null)stmt.close();
                if(conn != null)conn.close();
            }
            catch (SQLException e){
                e.printStackTrace();
                
            }

        }
        
        List<String> weekagegroupa = new ArrayList<>();
        try{
            //PostgreSQLへ接続
            conn = DriverManager.getConnection(url, user, password);

            //自動コミットOFF
            conn.setAutoCommit(false);

            //SELECT文の実行
            stmt = conn.createStatement();
    /*        commit;
            SELECT   COUNT(TO_DATE(date, 'YYYY年mm月dd日'))as week
            FROM reservetable
            WHERE date BETWEEN '2024/01/01' AND '2024/01/07' AND titleid = '1'
            GROUP BY date; */

            String json = "SELECT COUNT(TO_DATE(date, 'YYYY年mm月dd日'))\r\n"
            		+ "FROM reservetable\r\n"
            		+ "WHERE date BETWEEN '2024/01/01' AND '2024/01/07' AND titleid = '4'";
            rset = stmt.executeQuery(json);
            
            //SELECT結果の受け取り
            while(rset.next()){
                String col = rset.getString(1);
                weekagegroupa.add(rset.getString("week"));
                
            }
            System.out.println(weekagegroupa);

            
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        finally {
            try {
                if(rset != null)rset.close();
                if(stmt != null)stmt.close();
                if(conn != null)conn.close();
            }
            catch (SQLException e){
                e.printStackTrace();
                
            }

        }
        List<String> weekagegroup2 = new ArrayList<>();
        try{
            //PostgreSQLへ接続
            conn = DriverManager.getConnection(url, user, password);

            //自動コミットOFF
            conn.setAutoCommit(false);

            //SELECT文の実行
            stmt = conn.createStatement();
    /*        commit;
            SELECT   COUNT(TO_DATE(date, 'YYYY年mm月dd日'))as week
            FROM reservetable
            WHERE date BETWEEN '2024/01/01' AND '2024/01/07' AND titleid = '1'
            GROUP BY date; */

            String json = "SELECT COUNT(TO_DATE(date, 'YYYY年mm月dd日'))\r\n"
            		+ "FROM reservetable\r\n"
            		+ "WHERE date BETWEEN '2024/01/08' AND '2024/01/15' AND titleid = '1'";
            rset = stmt.executeQuery(json);
            
            //SELECT結果の受け取り
            while(rset.next()){
                String col = rset.getString(1);
                weekagegroup2.add(rset.getString("week"));
                
            }
            System.out.println(weekagegroup2);

            
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        finally {
            try {
                if(rset != null)rset.close();
                if(stmt != null)stmt.close();
                if(conn != null)conn.close();
            }
            catch (SQLException e){
                e.printStackTrace();
                
            }

        }
//週別の来場者-----------------------------------------------------------------------------------------------------
//request・setAttribute----------------------------------------------------------------------------------------------
        request.setAttribute("agegroup", agegroup);
        request.setAttribute("weekagegroupa", weekagegroupa);
        request.setAttribute("weekagegroupc", weekagegroupc);
        request.setAttribute("weekagegroup", weekagegroup);
        request.setAttribute("weekagegroup2", weekagegroup2);
        request.setAttribute("weekgendercount", weekgendercount);
        request.getRequestDispatcher("/weekchart.jsp").forward(request, response);
//request・setAttribute----------------------------------------------------------------------------------------------
	}

}
/*SELECT COUNT(reserveid),CONCAT(FLOOR(EXTRACT(YEAR FROM AGE(TO_DATE(birth, 'YYYY年mm月dd日'))) / 10) * 10, ' ') AS age_group
FROM membertable
INNER JOIN reservetable
ON membertable.memberid = reservetable.memberid
GROUP BY age_group */
