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
		
			mePro.readcountupdate(num, user.getId());
		} catch (Exception e) {
			session.setAttribute("num", null);

		}
		List<Amessage> messagelist = mePro.recentmessage(me);
		List<Amessage> allList = mePro.recentsender(me);


	
	model.addAttribute("allList", allList);
		session.setAttribute("user", user);
		session.setAttribute("num", num);
		model.addAttribute("unreadcount", null);
	/*	session.setAttribute("messagelist", messagelist);*/
		return "message/messagelist";

	}

	@RequestMapping(value = "message/mslist")
	public String getmessagebynum(HttpSession session, int num,Model m) {

		User user = (User) session.getAttribute("user");
		int chatnum = (int) session.getAttribute("num");
		mePro.readcountupdate(chatnum, user.getId());
		Amessage me = new Amessage();
		Amessage me2 = new Amessage();
		me2.setNum(num);
		me.setReceiver(user.getId());

		List<Amessage> allList = mePro.selectAllms(me2);

		m.addAttribute("allList", allList);
	
		session.setAttribute("user", user);
		session.setAttribute("num", num);
		m.addAttribute("unreadcount", null);

		return "message/messagelist";

	}

	/*@RequestMapping(value = "message/test")
	public String test(HttpSession session, HttpServletRequest request) {
		User user = (User) session.getAttribute("user");
		Amessage m = new Amessage();
		Amessage me = new Amessage();
		me.setReceiver(user.getId());
		mePro.deleteintromessage(me);
		try {
			String seller = (String) session.getAttribute("seller");

			if (seller != null) {
				m.setSender(user.getId());
				m.setReceiver(seller);
				 mePro.deleteintromessage(me); 

				int chatnum = mePro.checkchatnum(m);
				if (chatnum == 0) {
					mePro.insertnewmessage(m);

				} else {

				}
			}
		} catch (Exception e) {
		}

		 mePro.readcountupdate(user.getId()); 

		int num = 0;
		try {
			num = mePro.recentnum(me);
			mePro.readcountupdate(num, user.getId());
			System.out.println(num);
			mePro.readcountupdate(num, user.getId());
		} catch (Exception e) {
			session.setAttribute("num", null);

		}

		List<Amessage> messagelist = mePro.recentmessage(me);
		List<Amessage> allList = mePro.recentsender(me);

		System.out.println(messagelist);
		session.setAttribute("messagelist", messagelist);
		session.setAttribute("allList", allList);
		session.setAttribute("user", user);
		session.setAttribute("num", num);
		session.setAttribute("unreadcount", null);

		return "message/test";

	}*/

	/*@RequestMapping(value = "id_check", method = RequestMethod.GET, produces = "application/text; charset=utf8")

	public @ResponseBody List<Amessage> idCheck(String id) {

		System.out.println(id);
		Amessage me = new Amessage();
		me.setReceiver(id);
		
		Map<String, Object> ma = new HashMap<>();
		
		List<Amessage> mlist = mePro.recentmessage(me);
		System.out.println("====="+mlist);
		ma.put("list", mlist);
		System.out.println("에러 체크");
		return mlist;
	}*/
	@RequestMapping(value = "id_check", method = RequestMethod.GET, produces = "application/text; charset=utf8")

	public String idCheck(String id, Model m) {

		
		System.out.println(id);
		Amessage me = new Amessage();
		me.setReceiver(id);
		
		int num = mePro.recentnum(me);
		mePro.readcountupdate(num, id);
		
		List<Amessage> mlist = mePro.recentmessage(me);
	
		m.addAttribute("list", mlist);
		m.addAttribute("id", id);
		System.out.println("에러 체크");
		return "message/test2";
	}
	/*
	 * @RequestMapping(value = "message/sendseller" ) public String
	 * sendmessagetoseller(HttpSession session,HttpServletRequest requset) {
	 * 
	 * 
	 * User user = (User) session.getAttribute("user"); String seller =
	 * requset.getParameter("seller");
	 * 
	 * Amessage me = new Amessage(); me.setSender(user.getId());
	 * me.setReceiver(seller); mePro.deleteintromessage(me); try{ int chatnum =
	 * mePro.checkchatnum(me); if(chatnum==0){ mePro.insertnewmessage(me); }
	 * }catch(Exception e){}
	 * 
	 * 
	 * 
	 * int num = mePro.selectchatnum(me);
	 * mePro.readcountupdate(num,user.getId());
	 * 
	 * Amessage me2 = new Amessage(); me2.setNum(num); Amessage usermessage =
	 * new Amessage(); usermessage.setReceiver(user.getId());
	 * 
	 * 
	 * List<Amessage> messagelist = mePro.recentmessage(usermessage);
	 * List<Amessage> allList = mePro.selectAllms(me2);
	 * 
	 * System.out.println(messagelist); session.setAttribute("messagelist",
	 * messagelist); session.setAttribute("allList", allList);
	 * session.setAttribute("user", user); session.setAttribute("num", num);
	 * session.setAttribute("unreadcount", null); mePro.deleteintromessage(me);
	 * return "message/messagelist";
	 * 
	 * }
	 */

}
