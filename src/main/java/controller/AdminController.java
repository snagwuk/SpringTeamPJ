package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.Member;
import service.MybatisInfoDao;
import service.MybatisMemberDao;

@Controller
public class AdminController {
	@Autowired
	MybatisMemberDao dbPro;
	
	@Autowired
	MybatisInfoDao infoPro;
	
	@RequestMapping(value = "grade", method = RequestMethod.GET)
	public String upGrade(Model m){
		List<Member> memberList = dbPro.selectposition();
		m.addAttribute("memberList", memberList);
		return "admin/grade";
	}
	@RequestMapping(value = "upgrade")
	public String upGradePro(Member member){
		dbPro.upposition(member.getId());
		return "redirect:/grade";
	}
	@RequestMapping(value = "downgrade")
	public String downGradePro(Member member){
		dbPro.downposition(member.getId());
		return "redirect:/grade";
	}
	@RequestMapping(value = "memberList", method = RequestMethod.GET)
	public String memberList(Model m){ 
		List<Member> memberList = dbPro.memberList();
		m.addAttribute("memberList", memberList);
		return "admin/memberList";
	}
	@RequestMapping(value = "memberChart", method = RequestMethod.GET)
	public String memberChart(Model m){
		int female = infoPro.allfemale(); 
		int male = infoPro.allmale();
		int allgender = female + male;
		m.addAttribute("persentfe",(female*100)/allgender);
		m.addAttribute("persentma",(male*100)/allgender);
		return "admin/chart";
	}

}
