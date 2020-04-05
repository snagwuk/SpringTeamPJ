package controller;

import java.util.List;

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
		 
		 System.out.println(messagelist);
		 session.setAttribute("messagelist", messagelist);
		 session.setAttribute("allList", allList);
		 session.setAttribute("user", user);
		 session.setAttribute("unreadcount", null);
	        return "message/messagelist";
	    }
	 
	 
	
	
}
