package com.modu.vo;

public class AccountbookVo {
	private int accountbookno;
	private String accountbookdate;
	private String usage;
	private int spend;
	private int categoryno;
	private String categoryName;
	private int importmoney;
	private String tag;

	public AccountbookVo() {

	}

	public AccountbookVo(String accountbookdate, String usage, int spend, int categoryno,
			String categoryName, int importmoney, String tag) {
		this.accountbookdate = accountbookdate;
		this.usage = usage;
		this.spend = spend;
		this.categoryno = categoryno;
		this.categoryName = categoryName;
		this.importmoney = importmoney;
		this.tag = tag;
	}
	
	public AccountbookVo(int accountbookno, String accountbookdate, String usage, int spend, int categoryno,
			String categoryName, int importmoney, String tag) {
		this.accountbookno = accountbookno;
		this.accountbookdate = accountbookdate;
		this.usage = usage;
		this.spend = spend;
		this.categoryno = categoryno;
		this.categoryName = categoryName;
		this.importmoney = importmoney;
		this.tag = tag;
	}

	public int getAccountbookno() {
		return accountbookno;
	}

	public void setAccountbookno(int accountbookno) {
		this.accountbookno = accountbookno;
	}

	public String getAccountbookdate() {
		return accountbookdate;
	}

	public void setAccountbookdate(String accountbookdate) {
		this.accountbookdate = accountbookdate;
	}

	public String getUsage() {
		return usage;
	}

	public void setUsage(String usage) {
		this.usage = usage;
	}

	public int getSpend() {
		return spend;
	}

	public void setSpend(int spend) {
		this.spend = spend;
	}

	public int getCategoryno() {
		return categoryno;
	}

	public void setCategoryno(int categoryno) {
		this.categoryno = categoryno;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public int getImportmoney() {
		return importmoney;
	}

	public void setImportmoney(int importmoney) {
		this.importmoney = importmoney;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	@Override
	public String toString() {
		return "AccountbookVo [accountbookno=" + accountbookno + ", accountbookdate=" + accountbookdate + ", usage="
				+ usage + ", spend=" + spend + ", categoryno=" + categoryno + ", categoryName=" + categoryName
				+ ", importmoney=" + importmoney + ", tag=" + tag + "]";
	}
	
	
	
}
