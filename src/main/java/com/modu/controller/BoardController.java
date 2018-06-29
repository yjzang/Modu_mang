package com.modu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {

	
	@RequestMapping( "/board")
	public String hello(){
		System.out.println("/hellospring/hello");
		return "/board/board";
	}
}
