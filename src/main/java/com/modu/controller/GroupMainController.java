package com.modu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class GroupMainController {

    @RequestMapping(value = "/groupmain",method = RequestMethod.GET)
    public String GroupMain(){
        System.out.println("모임메인");
        return "/group/groupMain";
    }
}
