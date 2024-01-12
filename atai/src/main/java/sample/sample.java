package sample;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class sample {
	public static void main(String[] args) {
		//初期化
		Connection dbResult = null;
		try {
			//個人設定に必要な文字列
			String dbUrl = "jdbc:postgresql://localhost:5432/mydb";
			String dbUserName = "postgres";
			String dbPassword = "admin";
			System.out.println("接続開始。");

			// 接続
			dbResult = DriverManager.getConnection(dbUrl, dbUserName, dbPassword);
			System.out.println("接続できました。");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				// クローズ
				if (dbResult != null) {
					dbResult.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}