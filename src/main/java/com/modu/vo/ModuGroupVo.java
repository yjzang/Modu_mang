package com.modu.vo;

public class ModuGroupVo {
	private int groupNo;
	private String groupName;
	private String groupExplain;
	private String groupImg;
	private String groupType;
	private int manager;

	public ModuGroupVo() {
	}

	public ModuGroupVo(String groupName, String groupExplain, String groupImg, String groupType, int manager) {
		this.groupName = groupName;
		this.groupExplain = groupExplain;
		this.groupImg = groupImg;
		this.groupType = groupType;
		this.manager = manager;
	}

	public ModuGroupVo(int groupNo, String groupName, String groupExplain, String groupImg, String groupType,
			int manager) {
		this.groupNo = groupNo;
		this.groupName = groupName;
		this.groupExplain = groupExplain;
		this.groupImg = groupImg;
		this.groupType = groupType;
		this.manager = manager;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public String getGroupExplain() {
		return groupExplain;
	}

	public void setGroupExplain(String groupExplain) {
		this.groupExplain = groupExplain;
	}

	public String getGroupImg() {
		return groupImg;
	}

	public void setGroupImg(String groupImg) {
		this.groupImg = groupImg;
	}

	public String getGroupType() {
		return groupType;
	}

	public void setGroupType(String groupType) {
		this.groupType = groupType;
	}

	public int getManager() {
		return manager;
	}

	public void setManager(int manager) {
		this.manager = manager;
	}

	@Override
	public String toString() {
		return "ModuGroupVo [groupNo=" + groupNo + ", groupName=" + groupName + ", groupExplain=" + groupExplain
				+ ", groupImg=" + groupImg + ", groupType=" + groupType + ", manager=" + manager + "]";
	}

	
}
