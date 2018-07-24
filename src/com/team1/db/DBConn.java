package com.team1.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConn {
	public static Connection getConnection() throws Exception {
		// Mysql DB 연결 시
		String url = "jdbc:mysql://203.250.32.44:3306/team1";   // team0 은 각 조 DB명 
		//String url = "jdbc:mysql://localhost:3306/team1";   // team0 은 각 조 DB명 
		String driver = "com.mysql.jdbc.Driver";
		// 오라클 DB 연결 시
		// String url = "jdbc:oracle:thin:@localhost:1521:xe"; // 127.0.0.1 == localhost
		// String driver = "oracle.jdbc.driver.OracleDriver";

		String user = "root"; // java
		String pw = "1234!"; // java
		/*String user = "team1"; // java
		String pw = "moa1234!"; // java
*/		
		// 드라이버 로딩(jar 파일 로드)
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url, user, pw);
		return conn;
	}
}