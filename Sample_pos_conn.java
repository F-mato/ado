import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Sample_pos_conn {

	public static void main(String[] args) {
		// TODO 自動生成されたメソッド・スタブ
		Connection conn = null;
        Statement stmt = null;
        ResultSet rset = null;

        //接続文字列
        String url = "jdbc:postgresql://localhost:5432/mydb";
        String user = "postgres";
        String password = "admin"; 

        try{
            //PostgreSQLへ接続
            conn = DriverManager.getConnection(url, user, password);

            //自動コミットOFF
            conn.setAutoCommit(false);

            //SELECT文の実行
            stmt = conn.createStatement();
            String sql = "SELECT * FROM mybook;";
            rset = stmt.executeQuery(sql);

            //SELECT結果の受け取り
            while(rset.next()){
            	String col1 = rset.getString(1);
                String col2 = rset.getString(2);
                System.out.println(col1 + ":" + col2);
            }
            conn.commit();
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
	}

}
