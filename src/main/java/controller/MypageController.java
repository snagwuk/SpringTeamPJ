package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import model.Amessage;
import model.Auction;
import model.User;
import model.Wishseller;
import service.MybatisAuctionDao;
import service.MybatisCashDao;

@Controller
public class MypageController {

	 @Autowired
	    MybatisAuctionDao dbPro;
	 
	 @Autowired
	    MybatisCashDao cashDbPro;
	 
	 
	 @RequestMapping(value = "mypage")
	    public String mypage(HttpServletRequest req, Model m)
	    {
		 User user = (User) req.getSession().getAttribute("user");
	        int mycash = cashDbPro.myCash(user.getId());
	        m.addAttribute("mycash",mycash);
	        return "mypage/mypage";
	    }

	 
	 @RequestMapping(value = "myList")
	    public String myList(HttpServletRequest req, Model m)
	    {
		 User user = (User) req.getSession().getAttribute("user");
		 
		 int myAuctionCount = dbPro.getMyAuctionCount(user.getId());
		 int myBidCount = dbPro.getMyBidCount(user.getId());
		 
		 m.addAttribute("myAuctionCount", myAuctionCount);
		 m.addAttribute("myBidCount", myBidCount);
		 
	    	return "mypage/myList";
	}
	 
	 
	 @RequestMapping(value = "myAuctionList", method = RequestMethod.GET)
	    public String myAuctionList(HttpServletRequest req, Model m)
	    {
		 
		User user = (User) req.getSession().getAttribute("user");
		 HttpSession session = req.getSession();
		 
		 int currentPage = 1;
	        
	        try
	        {
	            currentPage = Integer.parseInt(req.getParameter("pageNum"));
	            session.setAttribute("pageNum", currentPage);
	        }
	        catch (Exception e)
	        {
	            
	            if (session.getAttribute("pageNum") == null) 
	                session.setAttribute("pageNum", 1);
	        }
	        currentPage = (int) session.getAttribute("pageNum");
	        
	        int pageSize = 9;
	        int startRow = (currentPage - 1) * pageSize + 1;
	        int endRow = currentPage * pageSize;
	        
	        int count = dbPro.getMyAuctionCount(user.getId());
	        
	        
	        
	        List<Auction> MyAuctionList = dbPro.getMyAuctionList(startRow, endRow, user.getId());
	      
	        int number = count - (currentPage - 1) * pageSize;
	        int bottomLine = 3;
	        int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
	        int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
	        int endPage = startPage + bottomLine - 1;
	        
	        if (endPage > pageCount) endPage = pageCount;
	        
	        req.setAttribute("currentPage", currentPage);
	        req.setAttribute("startRow", startRow);
	        req.setAttribute("endRow", endRow);
	        req.setAttribute("count", count);
	        req.setAttribute("pageSize", pageSize);
	        req.setAttribute("number", number);
	        req.setAttribute("bottomLine", bottomLine);
	        req.setAttribute("startPage", startPage);
	        req.setAttribute("endPage", endPage);
	        req.setAttribute("pageCount", pageCount);
	        
	        req.setAttribute("MyAuctionList", MyAuctionList);
	        
	        return "mypage/myAuctionList";
	    }
	 
	 
	@RequestMapping(value = "myBidList", method = RequestMethod.GET)
	    public String myBidList(HttpServletRequest req, Model m)
	    {
		 
		User user = (User) req.getSession().getAttribute("user");
		 HttpSession session = req.getSession();
		 
		 int currentPage = 1;
	        
	        try
	        {
	            currentPage = Integer.parseInt(req.getParameter("pageNum"));
	            session.setAttribute("pageNum", currentPage);
	        }
	        catch (Exception e)
	        {
	            
	            if (session.getAttribute("pageNum") == null) 
	                session.setAttribute("pageNum", 1);
	        }
	        currentPage = (int) session.getAttribute("pageNum");
	        
	        int pageSize = 9;
	        int startRow = (currentPage - 1) * pageSize + 1;
	        int endRow = currentPage * pageSize;
	        
	        int count = dbPro.getMyBidCount(user.getId());
	        
	        
	        List<Auction> MyBidList = dbPro.getMyBidList(startRow, endRow, user.getId());
	        
	        
	        
	        int number = count - (currentPage - 1) * pageSize;
	        int bottomLine = 3;
	        int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
	        int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
	        int endPage = startPage + bottomLine - 1;
	        
	        if (endPage > pageCount) endPage = pageCount;
	        
	        req.setAttribute("currentPage", currentPage);
	        req.setAttribute("startRow", startRow);
	        req.setAttribute("endRow", endRow);
	        req.setAttribute("count", count);
	        req.setAttribute("pageSize", pageSize);
	        req.setAttribute("number", number);
	        req.setAttribute("bottomLine", bottomLine);
	        req.setAttribute("startPage", startPage);
	        req.setAttribute("endPage", endPage);
	        req.setAttribute("pageCount", pageCount);
	        
	        req.setAttribute("MyBidList", MyBidList);
	        
	        return "mypage/myBidList";
	    }
	    
	
	    

	    
	 
	 
	@RequestMapping(value = "mywishseller", method = RequestMethod.GET)
	    public String mywishseller(HttpSession session,HttpServletRequest request)
	    {
		  User user = (User) session.getAttribute("user");
		  int pageNum ;
			  
				  
				
		 if(request.getParameter("pageNum")==null){
			 pageNum=1;
		 }else{
			 pageNum= Integer.parseInt(request.getParameter("pageNum"));
		 }

	        int currentPage = 1;

	        try
	        {
	            currentPage = pageNum;
	            session.setAttribute("pageNum", currentPage);
	        }
	        catch (Exception e)
	        {

	            if (session.getAttribute("pageNum") == null)
	                session.setAttribute("pageNum", 1);
	        }
	        currentPage = (int) session.getAttribute("pageNum");

	        int pageSize = 9;
	        int startRow = (currentPage - 1) * pageSize + 1;
	        int endRow = currentPage * pageSize;

	        int count = dbPro.getAuctionCount();

	        List<Auction> auctionList = dbPro.getmyseller(startRow, endRow, user.getId());

	        int number = count - (currentPage - 1) * pageSize;
	        int bottomLine = 3;
	        int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
	        int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
	        int endPage = startPage + bottomLine - 1;

	        if (endPage > pageCount) endPage = pageCount;

	        session.setAttribute("currentPage", currentPage);
	        session.setAttribute("startRow", startRow);
	        session.setAttribute("endRow", endRow);
	        session.setAttribute("count", count);
	        session.setAttribute("pageSize", pageSize);
	        session.setAttribute("number", number);
	        session.setAttribute("bottomLine", bottomLine);
	        session.setAttribute("startPage", startPage);
	        session.setAttribute("endPage", endPage);
	        session.setAttribute("pageCount", pageCount);

	        session.setAttribute("auctionList", auctionList);
	        session.setAttribute("user", user);
	        session.setAttribute("seller", null);
	        
	        session.setAttribute("pagename", "mywishseller");
	        return "auction/list";
	        
	    }

	 
	
	 @RequestMapping(value = "addmyseller", method = RequestMethod.GET)
	    public String mypage(HttpSession session,HttpServletRequest request)
	    {
		 
		 User user = (User) session.getAttribute("user");
		 
	   
		 
		 Wishseller seller = new Wishseller();
		 seller.setId(user.getId());
		 seller.setSeller(request.getParameter("seller"));
	
		 dbPro.addseller(seller);
	     //insert하기 전에 같이 게 있으면 이미 등록된 판매자입니다라는 창띄워야함 //  
	        return "redirect:/mywishseller";
	    }

	
	/* @RequestMapping("messagebox")
	    public String message(Model m,HttpServletRequest request)
	    {
		 
		 HttpSession session = request.getSession();
		 String id = request.getParameter("id");
		 session.setAttribute("id", id);
		
		 int i =dbPro.getunreadMessage(id);
		 m.addAttribute("unreadcount",i);
		 m.addAttribute("id",id);

		 return "messagebox";
	    }*/
	

	 
	

}
