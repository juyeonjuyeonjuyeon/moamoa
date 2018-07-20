package com.team1.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.team1.db.DBConn;
import com.team1.vo.ItemVO;
import com.team1.vo.UserVO;

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
AUTO_INCREMENT=2
;

	 * */
	
	/*아이템 삽입*/
	public static void InsertItem(ItemVO vo) throws Exception {
		// DB 접속
		Connection db = DBConn.getConnection();
		// 쿼리 날려서 상품 정보를 삽입
		// insert into item (link,imgSrc,itemName,itemPrice,tagColor,bookmark) values (~~~)
		String sql  = "insert into item (link, imgSrc, itemName, itemPrice, tagColor, bookmark, userMail) "
				+ "values (?, ?, ?, ?, ?, ?, ?)";
		System.out.println(sql);
		PreparedStatement pstmt = db.prepareStatement(sql);
		pstmt.setString(1, vo.getLink());
		pstmt.setString(2, vo.getImgSrc());
		pstmt.setString(3, vo.getItemName());
		pstmt.setInt(4, vo.getItemPrice());
		pstmt.setString(5, vo.getTagColor());
		pstmt.setInt(6, vo.getBookmark());
		pstmt.setString(7, vo.getUserMail());
		
		// 쿼리 실행
		pstmt.executeUpdate();
		db.close();
	}
	
	/*아이템 가져오기*/
	public static ItemVO getItemInfo(String item_idx) throws Exception {
		// DB 접속
		Connection db = DBConn.getConnection();
		// 쿼리 날려서 아이템 정보를 검색
		String sql  = "select * from item where item_idx = ?";
		PreparedStatement pstmt = db.prepareStatement(sql);
		pstmt.setString(1, item_idx);
		
		ItemVO vo = null;   // 아이템 정보를 담는 객체
		ResultSet rs = pstmt.executeQuery();
		if (rs.next()) {
			vo = new ItemVO();
			vo.setItem_idx(rs.getInt("item_idx"));
			vo.setLink(rs.getString("link"));
			vo.setImgSrc(rs.getString("imgSrc"));
			vo.setItemName(rs.getString("itemName"));
			vo.setItemPrice(rs.getInt("itemPrice"));
			vo.setTagColor(rs.getString("tagColor"));
			vo.setBookmark(rs.getInt("bookmark"));
			vo.setUserMail(rs.getString("userMail"));
		}	
		db.close();
		return vo;
	}
	
	/*아이템 가져오기*/
	public static ArrayList<ItemVO> getItem() throws Exception {
		// DB 접속
		Connection db = DBConn.getConnection();
		// 쿼리 날려서 아이템 정보를 검색
		String sql  = "select * from item";   // 사용자 정보 전체 검색 쿼리
		PreparedStatement pstmt = db.prepareStatement(sql);  // sql 관리 객체
		ResultSet rs = pstmt.executeQuery();   // 쿼리를 DB에 날려서 rs에 값을 받음
		
		// 사용자 정보를 담을 리스트
		ArrayList<ItemVO> itemList = new ArrayList<>();

		// 사용자 정보가 한줄씩 읽어서 user 테이블 정보의 마지막 까지
		// 읽어서 더이상 읽어올 정보가 없으면 while 문 종료
		while (rs.next()) {
			ItemVO vo = new ItemVO();
			vo.setItem_idx(rs.getInt("item_idx"));
			vo.setLink(rs.getString("link"));
			vo.setImgSrc(rs.getString("imgSrc"));
			vo.setItemName(rs.getString("itemName"));
			vo.setItemPrice(rs.getInt("itemPrice"));
			vo.setTagColor(rs.getString("tagColor"));
			vo.setBookmark(rs.getInt("bookmark"));
			vo.setUserMail(rs.getString("userMail"));
			itemList.add(vo);   // 사용자 정보 객체를 리스트에 담기
		}	
		db.close();  // db 연결 정보 닫기
		return itemList;   // 사용자 정보 리스트를 메소드 외부로 보내기
	}
	
	/*아이템 정렬*/
	public static ArrayList<ItemVO> getItem(int st) throws Exception {
		// DB 접속
		Connection db = DBConn.getConnection();
		// 쿼리 날려서 유저 정보를 검색
		String sql  = "select * from item";   // 사용자 정보 전체 검색 쿼리
		// st 가 1이면 높은가격순 정렬
		// st 가 2이면 낮은가격순 정렬
		if(st == 1) {
			sql  = "select * from item order by itemPrice desc";
		} else if (st == 2) {
			sql  = "select * from item order by itemPrice asc";
		} else if (st == 3) {
			sql  = "select * from item where bookmark = 1";
		} else if (st == 4) {
			sql  = "select * from item where tagColor = 'redTag'";
		} else if (st == 5) {
			sql  = "select * from item where tagColor = 'orangeTag'";
		} else if (st == 6) {
			sql  = "select * from item where tagColor = 'greenTag'";
		} else if (st == 7) {
			sql  = "select * from item where tagColor = 'blueTag'";
		} else if (st == 8) {
			sql  = "select * from item where tagColor = 'violetTag'";
		}else if (st == 0) {
			sql  = "select * from item";
		}
		
		PreparedStatement pstmt = db.prepareStatement(sql);  // sql 관리 객체
		ResultSet rs = pstmt.executeQuery();   // 쿼리를 DB에 날려서 rs에 값을 받음
		
		// 사용자 정보를 담을 리스트
		ArrayList<ItemVO> itemList = new ArrayList<>();

		// 사용자 정보가 한줄씩 읽어서 user 테이블 정보의 마지막 까지
		// 읽어서 더이상 읽어올 정보가 없으면 while 문 종료
		while (rs.next()) {
			ItemVO vo = new ItemVO();
			vo.setItem_idx(rs.getInt("item_idx"));
			vo.setLink(rs.getString("link"));
			vo.setImgSrc(rs.getString("imgSrc"));
			vo.setItemName(rs.getString("itemName"));
			vo.setItemPrice(rs.getInt("itemPrice"));
			vo.setTagColor(rs.getString("tagColor"));
			vo.setBookmark(rs.getInt("bookmark"));
			vo.setUserMail(rs.getString("userMail"));
			itemList.add(vo);   // 사용자 정보 객체를 리스트에 담기
		}	
		db.close();  // db 연결 정보 닫기
		return itemList;   // 사용자 정보 리스트를 메소드 외부로 보내기
	}
	
	/*아이템 수정*/
	public static void updateItem(ItemVO vo) throws Exception {
		// DB 접속
		Connection db = DBConn.getConnection();
		// 쿼리 날려서 유저 정보를 삽입(link, imgSrc, itemName, itemPrice, tagColor, bookmark, userMail)
		String sql  = "update user set link=?, imgSrc=?, itemName=?, itemPrice=?, tagColor=?, bookmark=?, userMail=? where item_idx=?";
		PreparedStatement pstmt = db.prepareStatement(sql);
		pstmt.setString(1, vo.getLink());    // 이름
		pstmt.setString(2, vo.getImgSrc());    // 이름
		pstmt.setString(3, vo.getItemName());    // 이름
		pstmt.setInt(4, vo.getItemPrice());    // 이름
		pstmt.setString(5, vo.getTagColor());    // 이름
		pstmt.setInt(6, vo.getBookmark());    // 이름
		pstmt.setString(7, vo.getUserMail());    // 이름
		pstmt.setInt(8, vo.getItem_idx());    // 이름
		
		// 쿼리 실행
		pstmt.executeUpdate();
		db.close();
	}
	/*아이템 삭제*/
	public static void delItem(String item_idx) throws Exception {
		// DB 접속
		Connection db = DBConn.getConnection();
		
		String sql  = "delete from item where item_idx = ?";
		PreparedStatement pstmt = db.prepareStatement(sql);
		pstmt.setString(1, item_idx);
		
		// 쿼리 실행
		pstmt.executeUpdate();
		db.close();
	}
	
	/*//테이블 행 개수 출력
	public static ItemVO countItem() throws Exception {
		// DB 접속
		Connection db = DBConn.getConnection();
		// 쿼리 날려서 아이템 정보를 검색
		String sql  = "SELECT COUNT(*) as cnt FROM item";
		PreparedStatement pstmt = db.prepareStatement(sql);  // sql 관리 객체
		
		
		db.close();
		return vo;
	}*/
}
