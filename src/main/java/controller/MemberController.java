package controller;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import model.Amessage;
import model.Cash;
import model.Member;
import model.User;
import service.MybatisCashDao;
import service.MybatisMemberDao;
import service.MybatisMessageDao;
import service.MybatisPenaltyDao;



@Controller
public class MemberController {


	@Autowired
	MybatisMemberDao dbPro;

	@Autowired
	MybatisCashDao cashPro;

	@Autowired
	MybatisMessageDao mePro;
	
	@Autowired
	MybatisPenaltyDao penPro;

	@RequestMapping(value = "regist",method = RequestMethod.GET)
	public String member_registForm(Member member){

		return "member/registrationForm";
	}

	@RequestMapping(value = "regist",method = RequestMethod.POST)
	public String member_registPro(Member member) throws Exception{

		dbPro.insertmember(member);

		Cash cash = new Cash();
		cash.setCashdate(LocalDateTime.now());
		cash.setCash(1000);
		cash.setId(member.getId());
		cash.setReason("회원가입");
		cash.setCstatus(1);
		cashPro.insertCash(cash);

		return "redirect:/main";
	}
	@ResponseBody
	@RequestMapping(value="idcheck", method=RequestMethod.GET)
	public int idcheckPro(@RequestParam("id") String id){
		return dbPro.idcheck(id);
	}
	@ResponseBody
	@RequestMapping(value="pwcheck", method=RequestMethod.GET)
	public int pwcheckPro(@RequestParam("pw1") String pw1, @RequestParam("pw2") String pw2 ){
		int result=0;
		if(!pw1.equals(pw2)){
			result=1;
		}
		return result;
	}
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String loginForm(){
		return "member/loginForm";
	}
	@RequestMapping(value = "login",method=RequestMethod.POST)
	public String loginPro(Member member, HttpSession session)
		{
			Member check = dbPro.selectmember(member.getId());
			if(check!=null)
			{
				String encryption = dbPro.authenticate(member.getPassword());
					if(encryption.equals(check.getPassword()))
					{
						User user = new User(check.getId(), check.getPosition(), check.getStatus());
						session.setAttribute("user", user);

						if(user.getStatus()==1){
							
							LocalDateTime today = LocalDateTime.now();
							
							if(today.isAfter(penPro.getRecentPenalty(user.getId()).getPenaltyEndDate())) {
								dbPro.memberStart(user.getId());
								
							}
						}
						
						// message
						Amessage me = new Amessage();
						me.setReceiver(member.getId());
						mePro.deleteintromessage(me);
					


						return "redirect:/main";
					}
					else
						return "member/loginForm";
			}
				else
					return "member/loginForm";
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
	public String sellerPro(Member member,HttpSession session,HttpServletRequest req)throws Exception{
		dbPro.updatemember(member);
		Member change = dbPro.selectmember(member.getId());
		User user = new User(change.getId(), change.getPosition(), change.getStatus());
		session.setAttribute("user", user);
		req.setAttribute("message", "판매자 신청이 완료되었습니다");
		req.setAttribute("url", "main");
		return "alert/alert";
	}
	@RequestMapping(value = "admin", method = RequestMethod.GET)
	public String upGrade(Model m){
		List<Member> memberList = dbPro.selectposition();
		m.addAttribute("memberList", memberList);
		return "admin/upGrade";
	}
	@RequestMapping(value = "upgrade")
	public String upGradePro(Member member){
		dbPro.upposition(member.getId());
		return "redirect:/admin/grade";
	}
	@RequestMapping(value = "downgrade")
	public String downGradePro(Member member){
		dbPro.downposition(member.getId());
		return "redirect:/admin/grade";
	}
	@RequestMapping(value = "beformodify", method = RequestMethod.GET)
	public String beformodify(Model m, HttpSession session){
		User user = (User) session.getAttribute("user");
		m.addAttribute("user", user);
		return "member/beforModify";
	}
	@RequestMapping(value = "beformodify", method = RequestMethod.POST)
	public String beformodifyPro(Member member){
		Member check = dbPro.selectmember(member.getId());
		String encryption = dbPro.authenticate(member.getPassword());
			if(encryption.equals(check.getPassword())){
				return "redirect:/modifyForm";
			}else{
				return "redirect:/main";
			}
	}
	@RequestMapping(value = "modifyForm", method = RequestMethod.GET)
	public String modifyForm(Model m,HttpSession session){
		User user = (User) session.getAttribute("user");
		Member member = dbPro.selectmember(user.getId());
		m.addAttribute("member", member);
		return "member/modifyForm";
	}
	@RequestMapping(value = "modifyForm", method = RequestMethod.POST)
	public String modifyPro(Member member){
		dbPro.modifymember(member);
		return "redirect:/main";
	}

	
}
