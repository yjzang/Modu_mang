package com.modu.vo;

public class AccountbookCategoryVo {
	private int categoryNo;
	private String categoryName;
	private int groupNo;
	
	public AccountbookCategoryVo() {
	}
	
	public AccountbookCategoryVo(String categoryName, int groupNo) {
		this.categoryName = categoryName;
		this.groupNo = groupNo;
	}
	
	public AccountbookCategoryVo(int categoryNo, String categoryName, int groupNo) {
		super();
		this.categoryNo = categoryNo;
		this.categoryName = categoryName;
		this.groupNo = groupNo;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	@Override
	public String toString() {
		return "AccountbookCategoryVo [categoryNo=" + categoryNo + ", categoryName=" + categoryName + ", groupNo="
				+ groupNo + "]";
	}
	
	
	
	
}
