package com.team1.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.team1.db.DBConn;
import com.team1.vo.ItemVO;

public class ItemDAO {
	/*
	 CREATE TABLE `item` (
	`item_idx` INT(11) NOT NULL AUTO_INCREMENT,
	`link` VARCHAR(5000) NOT NULL,
	`imgSrc` VARCHAR(5000) NULL DEFAULT NULL,
	`itemName` VARCHAR(50) NULL DEFAULT NULL,
	`itemPrice` INT(11) NULL DEFAULT NULL,
	`tagColor` VARCHAR(50) NOT NULL DEFAULT 'red',
	`bookmark` INT(11) NULL DEFAULT '0',
	PRIMARY KEY (`item_idx`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
	 * */
	public static void InsertUser(ItemVO vo) throws Exception {
		// DB 접속
		Connection db = DBConn.getConnection();
		// 쿼리 날려서 상품 정보를 삽입
		// insert into item (name, email, pw) values ('이름', 'a@a.com', '1234')
		String sql  = "insert into user (name, phone, email, pw) values (?, ?, ?)";
		PreparedStatement pstmt = db.prepareStatement(sql);
		/*pstmt.setString(1, vo.getName());
		pstmt.setString(2, vo.getEmail());
		pstmt.setString(3, vo.getPw());
		*/
		// 쿼리 실행
		pstmt.executeUpdate();
		db.close();
	}
}
