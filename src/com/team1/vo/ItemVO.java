package com.team1.vo;

public class ItemVO {
	private int item_idx;    // 자동 증가 상품 등록순 번호
	private String link;  // 링크
	private String imgSrc;    // 이미지 주소
	private String itemName;  // 상품 이름
	private int itemPrice; // 상품가격
	private String tagColor; // 태그 컬러(1-red,2- orange,3- green,4-blue,5-violet)
	private int bookmark; //북마크 체크 여부(0-false, 1-true)
	private String userMail;//user 메일과 비교하여 유저별 아이템 구별
	
	public int getItem_idx() {
		return item_idx;
	}
	public void setItem_idx(int item_idx) {
		this.item_idx = item_idx;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	
	public String getImgSrc() {
		return imgSrc;
	}
	public void setImgSrc(String imgSrc) {
		this.imgSrc = imgSrc;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public int getItemPrice() {
		return itemPrice;
	}
	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}
	public String getTagColor() {
		return tagColor;
	}
	public void setTagColor(String tagColor) {
		this.tagColor = tagColor;
	}
	public int getBookmark() {
		return bookmark;
	}
	public void setBookmark(int bookmark) {
		this.bookmark = bookmark;
	}
	public String getUserMail() {
		return userMail;
	}
	public void setUserMail(String userMail) {
		this.userMail = userMail;
	}
	
}
