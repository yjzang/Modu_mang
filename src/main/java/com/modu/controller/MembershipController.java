package com.modu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MembershipController {

	@RequestMapping("/membershipfee")
	public String membershipFeeStart() {
		System.out.println("/startMembership");

		return "/membership/membershipFeeStart";
	}

	@RequestMapping("membershipsetting")
	public String membershipSetting() {
		System.out.println("/membershipSetting");

		return "/membership/membershipSetting";
	}

}
