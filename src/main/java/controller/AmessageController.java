package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonArray;

import model.Amessage;
import model.Bid;
import model.User;

import service.MybatisMessageDao;

@Controller
public class AmessageController {

	@Autowired
	MybatisMessageDao mePro;

	@RequestMapping(value = "message/messagelist")
	public String messagelist(HttpSession session, HttpServletRequest request,Model model) {
		User user = (User) session.getAttribute("user");
		Amessage m = new Amessage();
		Amessage me = new Amessage();
		me.setReceiver(user.getId());
		mePro.deleteintromessage(me);
		try {
			String seller = (String)request.getParameter("seller");

			if (seller != null) {
				m.setSender(user.getId());
				m.setReceiver(seller);
				/* mePro.deleteintromessage(me); */

				int chatnum = mePro.checkchatnum(m);
				if (chatnum == 0) {
					mePro.insertnewmessage(m);

				} else {

				}
			}
		} catch (Exception e) {
		}

		/* mePro.readcountupdate(user.getId()); */

		int num = 0;
		try {
			num = mePro.recentnum(me);
		
		
			mePro.readcountupdate(num, user.getId());
		} catch (Exception e) {
			session.setAttribute("num", null);

		}
		List<Amessage> messagelist = mePro.recentmessage(me);
		List<Amessage> allList = mePro.recentsender(me);


	
	model.addAttribute("allList", allList);
		session.setAttribute("user", user);
		model.addAttribute("num", num);
	

		return "message/messagelist";

	}

	@RequestMapping(value = "message/mslist")
	public String getmessagebynum(HttpSession session, int num,Model m) {

		User user = (User) session.getAttribute("user");
		Amessage me = new Amessage();
		Amessage me2 = new Amessage();
		me2.setNum(num);
		me.setReceiver(user.getId());
		List<Amessage> allList = mePro.selectAllms(me2);
		int unreadcount = mePro.getunreaccount(user.getId());
		if(unreadcount==0){
			session.setAttribute("unreadcount", null);
		}else{
			 session.setAttribute("unreadcount", unreadcount);}
		m.addAttribute("allList", allList);
		session.setAttribute("user", user);
		m.addAttribute("num", num);
	
		return "message/messagelist";

	}

	@RequestMapping(value = "updatemessage", method = RequestMethod.GET, produces = "application/text; charset=utf8")

	public String idCheck(int num,String id, Model m) {

		
		System.out.println(id);
		Amessage me = new Amessage();
		me.setReceiver(id);
			
		mePro.readcountupdate(num,id);
		List<Amessage> mlist = mePro.recentmessage(me);
	
		
		m.addAttribute("list", mlist);
		m.addAttribute("id", id);

		return "message/messageajax";
	}

}
