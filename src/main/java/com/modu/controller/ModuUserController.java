package com.modu.controller;

import com.modu.service.ModuUserService;
import com.modu.vo.ModuUserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


import javax.servlet.http.HttpSession;

@Controller
public class ModuUserController {

    @Autowired
    private ModuUserService moduUserService;
    
    @RequestMapping(value = "/emailcheck", method = RequestMethod.POST)
    @ResponseBody
    public int emailCheck(@ModelAttribute ModuUserVo userVo) {
        System.out.println("이메일 체크");
        int result = moduUserService.emailCheckAjax(userVo);
        System.out.println("이메일 체크 완료 : " + result);
        return result;
    }

    @RequestMapping(value = "/join", method = RequestMethod.POST)
    public String join(@ModelAttribute ModuUserVo userVo) {
        System.out.println("회원가입 확인");
        System.out.println(userVo.toString());
        moduUserService.joinUser(userVo);
        System.out.println("갔다옴");
        return "redirect:/main";
    }

    @RequestMapping(value = "/userlogincheck", method = RequestMethod.POST)
    @ResponseBody
    public int userLoginCheck(@ModelAttribute ModuUserVo userVo, HttpSession session) {
        System.out.println("아이디 체크하러가자");
        System.out.println(userVo.toString());
        ModuUserVo moduUserVo = moduUserService.userLoginCheck(userVo);
        System.out.println("아이디 체크하고 왔다 : " + moduUserVo.toString());
        
        if (moduUserVo != null) {
       
            session.setAttribute("authUser", moduUserVo);
            System.out.println("로그인 됨");
            return 1;
        } else {
            System.out.println("로그인 실패");
            return 0;
        }
                
    }
  /*  
    @RequestMapping(value="/getGroupList",method=RequestMethod.GET)
    public String getGroupList(@RequestParam("userNo")int userNo, Model model) {
    	System.out.println("노나여니 들어왔냐");
    	List<ModuGroupVo> gList  = groupService.selectGroup(userNo);
    	model.addAttribute("gList",gList);
    	System.out.println(gList.toString());
    	return "/index";
    }
    */

    @RequestMapping(value = "/kakaoJoin", method = RequestMethod.POST)
    public String kakaoJoin(@ModelAttribute ModuUserVo userVo) {
        System.out.println("카카오 회원가입하기 : " + userVo);
        moduUserService.joinUser(userVo);
        return "redirect:/main";
    }

    @RequestMapping(value = "/kakaoLogin", method = RequestMethod.GET)
    public String kakaoLogin(@RequestParam String userEmail,HttpSession session) {
        System.out.println("카카오톡 로그인하기");
        ModuUserVo userVo = moduUserService.kakaoLogin(userEmail);
        System.out.println("유저 세션 세팅 : "+userVo.toString());
        session.setAttribute("authUser",userVo);
        return "redirect:/main";
    }

    @RequestMapping(value = "/logout",method = RequestMethod.GET)
    public String logout(HttpSession session){
        System.out.println("로그아웃");
        session.invalidate();
        return "redirect:/main";
    }

}
