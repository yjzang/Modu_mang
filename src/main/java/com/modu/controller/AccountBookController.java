package com.modu.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.modu.service.ModuAccountbookService;
import com.modu.service.ModuUserService;
import com.modu.vo.AccountbookVo;
import com.modu.vo.ModuGroupVo;
import com.modu.vo.ModuUserVo;

@Controller
@RequestMapping(value="/accountbook")
public class AccountBookController {

	@Autowired
	private ModuUserService moduUserService;	
	@Autowired
	private ModuAccountbookService moduAccountbookService;
	
	@RequestMapping( "/accountbook")
	public String accountbook(){
		return "/accountbook/accountbook";
	}
	
	@ResponseBody
	@RequestMapping( "/getaccountlist")
	public List<AccountbookVo> getaccountlist(@RequestParam("groupNo") String groupNo, @RequestParam("month") String month){
		List<AccountbookVo> list = moduAccountbookService.getaccountlist(groupNo,month);
		System.out.println(list);
		return list;
	}
	
	
	
	
	
	
	
	////////////////////////////////////////////////////////////////////////////////////
	
	@RequestMapping( "/login")
	public String login(HttpSession session,Model model){
		int userNo = 1;
		
		Map<String,Object> map = moduUserService.login(userNo);
		ModuUserVo authUser = (ModuUserVo) map.get("user"); 
		ModuGroupVo group = (ModuGroupVo) map.get("group"); 

		if (authUser != null) {
			session.setAttribute("authUser", authUser);
			session.setAttribute("group", group);
			return "redirect:/accountbook/accountbook";
		} else {
			model.addAttribute("result", "fail");
			return "redirect:/main";
		}
	}
}
