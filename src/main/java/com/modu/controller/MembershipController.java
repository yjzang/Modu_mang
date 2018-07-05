package com.modu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MembershipController {

	@RequestMapping("/membershipfee")
	public String membershipFeeStart() {
		System.out.println("/회비설정 전 첫화면");
		return "/membership/membershipFeeStart";
	}

	
	@RequestMapping("/membershipsetting")
	public String membershipSetting() {
		System.out.println("/회비 설정하기");
		return "/membership/membershipSetting";
	}
	
	@RequestMapping("/feemanage")
	public String feemanage() {
		System.out.println("회비관리페이지");
		return "/membership/feeManage";
	}

}
