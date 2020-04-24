package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorController
{
    @RequestMapping(value ="error/500")
    public String errer500 (Model m){
       m.addAttribute("msg","500 error 다시 로그인 해주세요.");
       return "errors/errorpage";
    }
   
    
    @RequestMapping(value ="error/400")
    public String errer400 (Model m){
       m.addAttribute("msg","400 error");
       return "errors/errorpage";
    }
    
    @RequestMapping(value ="error/403")
    public String errer403 (Model m){
       m.addAttribute("msg","403 error");
       return "errors/errorpage";
    }
    @RequestMapping(value ="error/404")
    public String errer404 (Model m){
       m.addAttribute("msg","404 error");
       return "errors/errorpage";
    }
    @RequestMapping(value ="error/405")
    public String errer405 (Model m){
       m.addAttribute("msg","405 error");
       return "errors/errorpage";
    }
    
    @RequestMapping(value ="error/sqlerror")
    public String errersqlerror(Model m){
       m.addAttribute("msg","sqlerror");
       return "errors/errorpage";
    }
    @RequestMapping(value ="error/exception")
    public String errerexception(Model m){
       m.addAttribute("msg","예외 오류발생");
       return "errors/errorpage";
    }
    @RequestMapping(value ="error/throwable")
    public String errerthrowable(Model m){
       m.addAttribute("msg","throwable 오류발생");
       return "errors/errorpage";
    }
}
