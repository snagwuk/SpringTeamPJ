package controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import model.Member;
import model.User;
import service.MybatisMemberDao;



@Controller
public class MemberController {

	
	@Autowired
	MybatisMemberDao dbPro;
	
	
	@RequestMapping(value = "regist",method = RequestMethod.GET)
	public String member_registForm(Member member){
		
		return "member/registrationForm";
	}
	
	@RequestMapping(value = "regist",method = RequestMethod.POST)
	public String member_registPro(Member member) throws Exception{		
		
		dbPro.insertmember(member);
	
		return "redirect:/main";
	}
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String loginForm(){
		return "member/loginForm";
	}
	@RequestMapping(value = "login",method=RequestMethod.POST)
	public String loginPro(Member member, HttpSession session){
		
		Member check = dbPro.authenticate(member.getId()); 
	
		if(check==null){
			return "member/loginForm";
		}else {
			if(member.getPassword().equals(check.getPassword())){ 
				User user = new User(check.getId(), check.getPosition(), check.getStatus());
				session.setAttribute("user", user);
				return "redirect:/main";
			}else{
				return "member/loginForm";
			}
		}
	}
	@RequestMapping(value = "logout")
	public String logoutPro(HttpSession session){
		session.invalidate();
		return "redirect:/main";
	}
	@RequestMapping(value = "tobeseller", method = RequestMethod.GET)
	public String seller(Model m, HttpSession session){
		User user = (User) session.getAttribute("user");
		Member member = dbPro.selectmember(user.getId());
		m.addAttribute("member", member);	
		return "member/tobeSellerForm";
	}
	@RequestMapping(value = "tobeseller", method = RequestMethod.POST)
	public String sellerPro(Member member,HttpSession session)throws Exception{
		System.out.println(member.getId()+"=======");
		System.out.println(member);
		dbPro.updatemember(member);
		System.out.println(member);
		/*User user = new User(member.getId(), member.getPosition(), member.getStatus());
		session.setAttribute("user", user);*/
		
		return "member/sucess";
	}
	@RequestMapping(value = "grade", method = RequestMethod.GET)
	public String upGrade(){
		return "member/upGrade";
	}
	
}
