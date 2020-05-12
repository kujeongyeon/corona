package com.spring.contoller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
 
import com.spring.service.MemberService;
 
@Controller
//@RequestMapping("/test")
public class memController {
    @Autowired
    private MemberService memberservice;
     
    @RequestMapping("/test/usercheck.do")
    public String usercheck(Model model) throws Exception{
        int cnt = 0;
        cnt = memberservice.userIdCheck("testid");
         
        model.addAttribute("cnt", cnt );
        
        return "index";
    }
    
    @RequestMapping("/test/jvtest.do")
    public String jvtest() throws Exception{
    	
    	return "jvtest1";
    	
    }
    
}
