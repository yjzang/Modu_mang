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
import com.modu.service.ModuGroupService;
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
	
	@Autowired
	private ModuGroupService groupService;
	
	//모임 카테고리 불러오기 
	
	@RequestMapping( "/accountbook")
	public String accountbook(Model model, HttpSession session,@RequestParam("groupNo")int groupNo){
		
		// 모임 카테고리 
		ModuUserVo uservo =  (ModuUserVo) session.getAttribute("authUser");
		List<ModuGroupVo> gList  = groupService.selectGroup(uservo.getUserNo());
		model.addAttribute("gList",gList);
		
		// 클릭한 모임  가계부 보여주기
		ModuGroupVo gvo = groupService.selectGroupImg(groupNo);
		model.addAttribute("gvo",gvo);
		
		return "/accountbook/accountbook";
	}
	
	@ResponseBody
	@RequestMapping( "/getaccountlist")
	public Map<String,Object> getAccountList(@RequestParam("groupNo") String groupNo, @RequestParam("month") String month){
		Map<String,Object> map = moduAccountbookService.getAccountList(groupNo,month);
		System.out.println(map.get("categoryList"));
		return map;
	}
	
	@ResponseBody
	@RequestMapping( "/searchaccountlistbydate")
	public Map<String,Object> searchaccountlistbydate(@RequestParam("groupNo") String groupNo, @RequestParam("search_date1") String search_date1, @RequestParam("search_date2") String search_date2){		
		Map<String,Object> map = moduAccountbookService.searchaccountlistbydate(groupNo,search_date1,search_date2);
		return map;
	}
	
	@ResponseBody
	@RequestMapping( "/searchaccountlist")
	public Map<String,Object> searchaccountlist(@RequestParam("groupNo") String groupNo, @RequestParam("mode") String mode, @RequestParam("search_text") String search_text){	
		Map<String,Object> map = moduAccountbookService.searchaccountlist(groupNo,mode,search_text);
		return map;
	}
	
	
	
	
	
	///////////////////////////////////////로그인/////////////////////////////////////////////
	
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
