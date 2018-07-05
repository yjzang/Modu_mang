package com.modu.vo;

public class FileVo {
    private int no;
    private String filepath;
    private String orgName;
    private String saveName;
    private long fileSize;
    
    public FileVo(int no, String filepath, String orgName, String saveName, long fileSize) {
		this.no = no;
		this.filepath = filepath;
		this.orgName = orgName;
		this.saveName = saveName;
		this.fileSize = fileSize;
	}
	public FileVo() {
	}
    
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public String getOrgName() {
		return orgName;
	}
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	public String getSaveName() {
		return saveName;
	}
	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	@Override
	public String toString() {
		return "FileVo [no=" + no + ", filepath=" + filepath + ", orgName=" + orgName + ", saveName=" + saveName
				+ ", fileSize=" + fileSize + "]";
	}
	
    
    
    
}
