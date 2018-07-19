package com.modu.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.modu.service.ModuGroupService;
import com.modu.vo.ModuGroupVo;
import com.modu.vo.ModuUserVo;

@Controller
public class ReportController {

	@Autowired
	private ModuGroupService groupService;

	@RequestMapping(value = "/annualreport", method = RequestMethod.GET)
	public String annualReport(Model model, HttpSession session, @RequestParam("groupNo") int groupNo) {
		System.out.println("연간 보고서로 이동");

		// 모임 카테고리
		ModuUserVo uservo = (ModuUserVo) session.getAttribute("authUser");
		List<ModuGroupVo> gList = groupService.selectGroup(uservo.getUserNo());
		model.addAttribute("gList", gList);

		// 클릭한 모임 연간보고서 보여주기
		ModuGroupVo gvo = groupService.selectGroupImg(groupNo);
		model.addAttribute("gvo", gvo);

		return "/report/annual_report";
	}

	@RequestMapping(value = "/monthlyreport", method = RequestMethod.GET)
	public String monthlyReport(Model model, HttpSession session, @RequestParam("groupNo") int groupNo) {
		System.out.println("월간 보고서로 이동");

		// 모임 카테고리
		ModuUserVo uservo = (ModuUserVo) session.getAttribute("authUser");
		List<ModuGroupVo> gList = groupService.selectGroup(uservo.getUserNo());
		model.addAttribute("gList", gList);

		// 클릭한 모임 월간 보고서 보여주기
		ModuGroupVo gvo = groupService.selectGroupImg(groupNo);
		model.addAttribute("gvo", gvo);
		
		return "/report/monthly_report";
	}

	@RequestMapping(value = "/eventreport", method = RequestMethod.GET)
	public String eventReport(Model model, HttpSession session, @RequestParam("groupNo") int groupNo) {
		System.out.println("행사별 보고서로 이동");

		// 모임 카테고리
		ModuUserVo uservo = (ModuUserVo) session.getAttribute("authUser");
		List<ModuGroupVo> gList = groupService.selectGroup(uservo.getUserNo());
		model.addAttribute("gList", gList);

		// 클릭한 모임 행사별 보고서 보여주기
		ModuGroupVo gvo = groupService.selectGroupImg(groupNo);
		model.addAttribute("gvo", gvo);
		
		return "/report/event_report";
	}

}
