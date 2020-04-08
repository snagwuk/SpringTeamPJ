package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.Amessage;
import model.Bid;
import model.User;

import service.MybatisMessageDao;

@Controller
public class AmessageController {

	
	
	
	@Autowired
    MybatisMessageDao mePro;
	
	
	 @RequestMapping(value = "message/messagelist")
	    public String messagelist(HttpSession session)
	    {
		 User user = (User) session.getAttribute("user");
		 
		 mePro.readcountupdate(user.getId());
		 Amessage me = new Amessage();
		 me.setReceiver(user.getId());
		 List<Amessage> messagelist = mePro.recentmessage(me);
		 List<Amessage> allList = mePro.recentsender(me);
		 int num = mePro.recentnum(me);
		
		 System.out.println(messagelist);
		 session.setAttribute("messagelist", messagelist);
		 session.setAttribute("allList", allList);
		 session.setAttribute("user", user);
		 session.setAttribute("num", num);
		 session.setAttribute("unreadcount", null);
	        return "message/messagelist";
	    }
	 
	 
	 @RequestMapping(value = "message/mslist")
	    public String getmessagebynum(HttpSession session,int num)
	    {
		 User user = (User) session.getAttribute("user");
		 
		 mePro.readcountupdate(user.getId());
		 Amessage me = new Amessage();
		 Amessage me2 = new Amessage();
		 me2.setNum(num);
		 me.setReceiver(user.getId());
		 List<Amessage> messagelist = mePro.recentmessage(me);
		 List<Amessage> allList = mePro.selectAllms(me2);
		
		 System.out.println(messagelist);
		 session.setAttribute("messagelist", messagelist);
		 session.setAttribute("allList", allList);
		 session.setAttribute("user", user);
		 session.setAttribute("num", num);
		 session.setAttribute("unreadcount", null);
	        return "message/messagelist";
	        
	    }
	 
/*	 @RequestMapping(value = "message/sendseller" )
	    public String sendmessagetoseller(HttpSession session,HttpServletRequest requset)
	    {
		 
		 User user = (User) session.getAttribute("user");
		 String seller = requset.getParameter("seller");
		 mePro.readcountupdate(user.getId());
		 Amessage me = new Amessage();
		 Amessage me2 = new Amessage();
		 me2.setNum(num);
		 me.setReceiver(user.getId());
		 List<Amessage> messagelist = mePro.recentmessage(me);
		 List<Amessage> allList = mePro.selectAllms(me2);
		
		 System.out.println(messagelist);
		 session.setAttribute("messagelist", messagelist);
		 session.setAttribute("allList", allList);
		 session.setAttribute("user", user);
		 session.setAttribute("num", num);
		 session.setAttribute("unreadcount", null);
	        return "message/messagelist";
	        
	    }*/
	 
	 
	
}
