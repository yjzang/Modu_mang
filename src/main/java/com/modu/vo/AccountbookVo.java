package com.modu.vo;

public class AccountbookVo {
	private int accountbookno;
	private String accountbookRegDate;
	private String accountbookUsage;
	private int accountbookSpend;
	private int accountbookIncome;
	private String categoryNo;
	private String categoryName;
	private int groupNo;
	private String tagName;

	public AccountbookVo() {

	}

	public AccountbookVo(String accountbookRegDate, String accountbookUsage, int accountbookSpend,
			int accountbookIncome, String categoryNo, String categoryName, int groupNo, String tagName) {
		this.accountbookRegDate = accountbookRegDate;
		this.accountbookUsage = accountbookUsage;
		this.accountbookSpend = accountbookSpend;
		this.accountbookIncome = accountbookIncome;
		this.categoryNo = categoryNo;
		this.categoryName = categoryName;
		this.groupNo = groupNo;
		this.tagName = tagName;
	}

	public AccountbookVo(int accountbookno, String accountbookRegDate, String accountbookUsage, int accountbookSpend,
			int accountbookIncome, String categoryNo, String categoryName, int groupNo, String tagName) {
		this.accountbookno = accountbookno;
		this.accountbookRegDate = accountbookRegDate;
		this.accountbookUsage = accountbookUsage;
		this.accountbookSpend = accountbookSpend;
		this.accountbookIncome = accountbookIncome;
		this.categoryNo = categoryNo;
		this.categoryName = categoryName;
		this.groupNo = groupNo;
		this.tagName = tagName;
	}

	public int getAccountbookno() {
		return accountbookno;
	}

	public void setAccountbookno(int accountbookno) {
		this.accountbookno = accountbookno;
	}

	public String getAccountbookRegDate() {
		return accountbookRegDate;
	}

	public void setAccountbookRegDate(String accountbookRegDate) {
		this.accountbookRegDate = accountbookRegDate;
	}

	public String getAccountbookUsage() {
		return accountbookUsage;
	}

	public void setAccountbookUsage(String accountbookUsage) {
		this.accountbookUsage = accountbookUsage;
	}

	public int getAccountbookSpend() {
		return accountbookSpend;
	}

	public void setAccountbookSpend(int accountbookSpend) {
		this.accountbookSpend = accountbookSpend;
	}

	public int getAccountbookIncome() {
		return accountbookIncome;
	}

	public void setAccountbookIncome(int accountbookIncome) {
		this.accountbookIncome = accountbookIncome;
	}

	public String getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(String categoryNo) {
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

	public String getTagName() {
		return tagName;
	}

	public void setTagName(String tagName) {
		this.tagName = tagName;
	}

	@Override
	public String toString() {
		return "AccountbookVo [accountbookno=" + accountbookno + ", accountbookRegDate=" + accountbookRegDate
				+ ", accountbookUsage=" + accountbookUsage + ", accountbookSpend=" + accountbookSpend
				+ ", accountbookIncome=" + accountbookIncome + ", categoryNo=" + categoryNo + ", categoryName="
				+ categoryName + ", groupNo=" + groupNo + ", tagName=" + tagName + "]";
	}
	
	
	
	
}
