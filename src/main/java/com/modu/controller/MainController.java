package com.modu.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController{

	@RequestMapping( "/main")
	public String hello(){
		System.out.println("/hellospring/hello");
		return "/index";
	}
}
