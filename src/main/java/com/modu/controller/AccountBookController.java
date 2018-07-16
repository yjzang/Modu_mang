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
import com.modu.vo.AccountbookCategoryVo;
import com.modu.vo.AccountbookTagVo;
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
	public Map<String,Object> getAccountList(@RequestParam("groupNo") String groupNo, @RequestParam("month") String month){
		Map<String,Object> map = moduAccountbookService.getAccountList(groupNo,month);
		return map;
	}
	
	@ResponseBody
	@RequestMapping( "/saveaccountbook")
	public int saveaccountbook(
			@RequestParam( value="usage", required=false, defaultValue="사용내역") String usage,
			@RequestParam( value="spend", required=false, defaultValue="0") String spend,
			@RequestParam( value="category", required=false, defaultValue="1") String category,
			@RequestParam("groupNo") String groupNo,
			@RequestParam("date") String date){
		return moduAccountbookService.saveAccountbook(usage,spend,category,groupNo,date);
	}
	
	@ResponseBody
	@RequestMapping( "/deleteaccountbook")
	public void deleteaccountbook(@RequestParam("AccountbookList") String AccountbookList){
		moduAccountbookService.deleteaccountbook(AccountbookList);
	}
	
	@ResponseBody
	@RequestMapping( "/updateaccountbook")
	public void updateaccountbook(@RequestParam("accountbookno") String accountbookno, @RequestParam("data") String data, @RequestParam("updatePos") String updatePos){
		moduAccountbookService.updateAccountbook(accountbookno,data,updatePos);
	}
	
	@ResponseBody
	@RequestMapping( "/taggroup")
	public void taggroup(@RequestParam("AccountbookList") String AccountbookList,@RequestParam("tagName") String tagName){
		moduAccountbookService.taggroup(AccountbookList,tagName);
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
	
	@ResponseBody
	@RequestMapping( "/inserttag")
	public void insertTag(@RequestParam("accountbookNo") String accountbookNo, @RequestParam("tagname") String tagname){	
		moduAccountbookService.insertTag(accountbookNo,tagname);
	}
	
	@ResponseBody
	@RequestMapping( "/updateTag")
	public void updateTag(@RequestParam("accountbookNo") String accountbookNo, @RequestParam("accountbooktagno") String accountbooktagno, @RequestParam("tagno") String tagno, @RequestParam("tagname") String tagname){	
		moduAccountbookService.updateTag(accountbookNo,accountbooktagno,tagno,tagname);
	}
	
	@ResponseBody
	@RequestMapping( "/getTagList")
	public List<AccountbookTagVo> getTagList(@RequestParam("accountNo") String accountNo){
		return moduAccountbookService.getTagList(accountNo);
	}
	
	@ResponseBody
	@RequestMapping( "/tagDelete")
	public void tagDelete(@RequestParam("accountbooktagno") String accountbooktagno,@RequestParam("tagno") String tagno){
		moduAccountbookService.tagDelete(accountbooktagno,tagno);
	}
	
	@ResponseBody
	@RequestMapping( "/getcategorylist")
	public List<AccountbookCategoryVo> getcategorylist(@RequestParam("groupNo") String groupNo){
		return moduAccountbookService.getCategoryList(groupNo);
	}
	
	@ResponseBody
	@RequestMapping( "/categorydelete")
	public void categorydelete(@RequestParam("groupNo") String groupNo,@RequestParam("categoryno") String categoryno){
		moduAccountbookService.categoryDelete(groupNo,categoryno);
	}
	
	@ResponseBody
	@RequestMapping( "/updatecategory")
	public void updateCategory(@RequestParam("categoryno") String categoryno,@RequestParam("categoryname") String categoryname){
		moduAccountbookService.categoryUpdate(categoryno,categoryname);
	}
	
	@ResponseBody
	@RequestMapping( "/insertcategory")
	public void insertCategory(@RequestParam("groupNo") String groupNo,@RequestParam("categoryname") String categoryname){
		moduAccountbookService.categoryInsert(groupNo,categoryname);
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
