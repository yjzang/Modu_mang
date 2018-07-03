package com.modu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ReportController {

    @RequestMapping(value = "/annualreport",method = RequestMethod.GET)
    public String annualReport(){
        System.out.println("연간 보고서로 이동");
        return "report/annual_report";
    }

    @RequestMapping(value = "/monthlyreport",method = RequestMethod.GET)
    public String monthlyReport(){
        System.out.println("월간 보고서로 이동");
        return "report/monthly_report";
    }

    @RequestMapping(value = "/eventreport",method = RequestMethod.GET)
    public String eventReport(){
        System.out.println("행사별 보고서로 이동");
        return "report/event_report";
    }

}
