package com.modu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GroupManageController {
	
	@RequestMapping("/groupmanage")
	public String groupmanage() {
		System.out.println("모임관리");

		return "/membership/groupManage";
	}


}
