package controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.Cash;
import model.Member;
import model.User;
import service.MybatisCashDao;
import service.MybatisMemberDao;



@Controller
public class MemberController {

	
	@Autowired
	MybatisMemberDao dbPro;
	
	@Autowired
	MybatisCashDao cashPro;
	
	@RequestMapping(value = "regist",method = RequestMethod.GET)
	public String member_registForm(Member member){
		
		return "member/registrationForm";
	}
	
	@RequestMapping(value = "regist",method = RequestMethod.POST)
	public String member_registPro(Member member) throws Exception{		
		
		dbPro.insertmember(member);
		
		Cash cash = new Cash();
		cash.setCash(0);
		cash.setId(member.getId());
		cash.setReason("회원가입");
		cashPro.insertCash(cash);
		
		return "redirect:/main";
	}
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String loginForm(){
		return "member/loginForm";
	}
	@RequestMapping(value = "login",method=RequestMethod.POST)
	public String loginPro(Member member, HttpServletRequest request){
		
		Member check = dbPro.authenticate(member.getId()); 
		
		
		
		if(check==null){
			return "member/loginForm";
		}else {
			if(member.getPassword().equals(check.getPassword())){
				HttpSession session = request.getSession(); 
				User user = new User(check.getId(), check.getPosition(), check.getStatus());
				session.setAttribute("user", user);
				return "redirect:/main";
			}else{
				return "member/loginForm";
			}
		}
	}
	@RequestMapping(value = "logout")
	public String logoutPro(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/main";
	}
	
}
