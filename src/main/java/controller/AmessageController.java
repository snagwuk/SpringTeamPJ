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
	    public String messagelist(HttpSession session,HttpServletRequest request)
	    {
		 User user = (User) session.getAttribute("user");
		 Amessage m = new Amessage();
		 Amessage me = new Amessage();
		 me.setReceiver(user.getId());
	
		 try{
			 String seller =  (String) session.getAttribute("seller");
			
	if(seller!=null){
		 m.setSender(user.getId());
		 m.setReceiver(seller);
		/* mePro.deleteintromessage(me);*/
	
			 int chatnum = mePro.checkchatnum(m);
			 if(chatnum==0){
				 mePro.insertnewmessage(m);
			
			 }else{
				 
			 }
			 }
		 }catch(Exception e){}
		 
		 
		 /*mePro.readcountupdate(user.getId());*/
		
		 
		 int num;
			try{num = mePro.recentnum(me);
			 session.setAttribute("num", num);
			 System.out.println(num);
			 mePro.readcountupdate(num,user.getId());
					}catch (Exception e) {
						 session.setAttribute("num", null);
					
					}
		
		
		 
		 List<Amessage> messagelist = mePro.recentmessage(me);
		 List<Amessage> allList = mePro.recentsender(me);
		
		 
		 System.out.println(messagelist);
		 session.setAttribute("messagelist", messagelist);
		 session.setAttribute("allList", allList);
		 session.setAttribute("user", user);

		 session.setAttribute("unreadcount", null);
	
		   return "message/messagelist";
		
		
	    }
	 
	 
	 @RequestMapping(value = "message/mslist")
	    public String getmessagebynum(HttpSession session,int num)
	    {
		 
		 
		 
		 
		 User user = (User) session.getAttribute("user");
		 int chatnum = (int) session.getAttribute("num");
		 mePro.readcountupdate(chatnum,user.getId());
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
	 
	/* @RequestMapping(value = "message/sendseller" )
	    public String sendmessagetoseller(HttpSession session,HttpServletRequest requset)
	    {
		 
		 
		 User user = (User) session.getAttribute("user");
		 String seller = requset.getParameter("seller");
	
		 Amessage me = new Amessage();
		 me.setSender(user.getId());
		 me.setReceiver(seller);
		 mePro.deleteintromessage(me);
		 try{
			 int chatnum = mePro.checkchatnum(me);
			 if(chatnum==0){
				 mePro.insertnewmessage(me);
			 }
		 }catch(Exception e){}
		 

		
		 int num = mePro.selectchatnum(me);
		 mePro.readcountupdate(num,user.getId());
		
		 Amessage me2 = new Amessage();
		 me2.setNum(num);
		 Amessage usermessage = new Amessage();
		 usermessage.setReceiver(user.getId());
	
		 
		 List<Amessage> messagelist = mePro.recentmessage(usermessage);
		 List<Amessage> allList = mePro.selectAllms(me2);
		
		 System.out.println(messagelist);
		 session.setAttribute("messagelist", messagelist);
		 session.setAttribute("allList", allList);
		 session.setAttribute("user", user);
		 session.setAttribute("num", num);
		 session.setAttribute("unreadcount", null);
		 mePro.deleteintromessage(me);
	        return "message/messagelist";
	        
	    }
	 */
	 
	
}
