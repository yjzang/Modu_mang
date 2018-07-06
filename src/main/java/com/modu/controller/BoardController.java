package com.modu.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.annotation.MultipartConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.modu.service.BoardService;
import com.modu.vo.BoardVo;
import com.modu.vo.FileVo;

@Controller
@RequestMapping("/board")
public class BoardController {

	
	@Autowired
	BoardService service;
	
	@RequestMapping(value="", method={RequestMethod.GET,RequestMethod.POST})
	public String goBoard(Model model){
		System.out.println("/hellospring/hello");
		List<BoardVo> list= service.getPostList();
	    
		if(list.isEmpty()) {
			System.out.println("리스트 없음");
			return "/board/boardStart";
			
		} else {
		
			System.out.println("리스트 있음");
			model.addAttribute("list",list);
			return "/board/board";
			
		}
	}
	
	
	
	@RequestMapping("/write")
	public String goBoardWrite(){
		System.out.println("글쓰기 입장");
		return "/board/boardWrite";
		
	}
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public String addPost( @ModelAttribute BoardVo boardVo,
							@RequestParam("files") MultipartFile[] files ,
							@ModelAttribute FileVo fileVo,
							Model model) {
		
		System.out.println("글쓰기 저장 오긴 왔음");
		/*service.addPost(boardVo);*/
		
		

		System.out.println("컨트롤러 :" + fileVo.getUserNo());
		for(MultipartFile file: files) {
		
		System.out.println("배열로 받아지는지 보자" +file.getOriginalFilename());
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("fileVo", fileVo);
		map.put("file",file);
		
		service.addPost(boardVo,map);



	}
		
		return "redirect:/board";
		
		
	}
	
	
	/*
	@ResponseBody
	@RequestMapping(value="/getPostList",method=RequestMethod.POST)
	public List<BoardVo> getPostList() {
		
		
		List<BoardVo> list= service.getPostList();
		return list;
	}
	*/
	
	

}
