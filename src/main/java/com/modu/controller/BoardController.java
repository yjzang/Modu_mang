package com.modu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("/board")
public class BoardController {

	
	@RequestMapping("")
	public String goBoard(){
		System.out.println("/hellospring/hello");
		return "/board/board";
	}
	
	
	
	@RequestMapping( "/write")
	public String goBoardWrite(){
		System.out.println("글쓰기 입장");
		return "/board/board_write";
		
	}

}
