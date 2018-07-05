package com.modu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.modu.dao.ModuGroupDao;
import com.modu.service.ModuGroupService;
import com.modu.vo.ModuGroupVo;

@Controller
public class GroupManageController {
	

	@Autowired
	private ModuGroupService groupService;
	
	@RequestMapping("/groupmanage")
	public String groupmanage() {
		System.out.println("모임관리");
		return "/group/groupManage";
	}
	
	
	@RequestMapping("/creategroup")
	public String creategroup() {
		System.out.println("모임 생성하기 첫 화면");
		return "/group/createGroup";
	}
	
	@RequestMapping("/plusgroup")
	public String groupstart(ModuGroupVo groupvo, @RequestParam("file") MultipartFile file) {
		System.out.println("그룹생성후 첫 화면");
		int no = groupService.plusGroup(groupvo);
		System.out.println(no+"모임생성완료");
	
		
		return "/group/firstGroupPage";
	}
	
	
	


}
