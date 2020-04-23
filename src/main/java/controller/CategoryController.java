package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import model.Auction;
import model.Category;
import service.MybatisCategoryDao;



@Controller
public class CategoryController {

	
	
    @Autowired
    MybatisCategoryDao dbPro;
	
	 @RequestMapping(value = "category", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	   public String idCheck(HttpServletRequest request,Model m) {

		    HashMap<Object, Object> map = new HashMap<Object, Object>();
	      int num = Integer.parseInt(request.getParameter("num"));
	      Category c = new Category();
	      c.setRefnum(num);
	      List<Category> category = dbPro.selectsecond(c);

	     m.addAttribute("category",category);
	      
	 
	      return "message/writeajax";
	   }
	
	 @RequestMapping(value = "categorylist", method = RequestMethod.GET)
	    public String selectbyCategory(HttpServletRequest request, HttpSession session,Model m)
	    {

	    	 int currentPage = 1;
	       
	        int cnum = Integer.parseInt(request.getParameter("cnum"));
	    

	        try
	        {
	            currentPage = Integer.parseInt(request.getParameter("pageNum"));
	            session.setAttribute("pageNum", currentPage);
	        }
	        catch (Exception e)
	        {

	            if (session.getAttribute("pageNum") == null) session.setAttribute("pageNum", 1);
	        }
	        currentPage = (int) session.getAttribute("pageNum");

	        int pageSize = 9;
	        int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int count =0;
	
		try{
			count=dbPro.getCatagoryCount(cnum);
		}catch(Exception e){
		
		}
		
		List<Auction> auctionList = dbPro.selectbyCategory(startRow, endRow, cnum);
		
	        	m.addAttribute("auctionList", auctionList);
	        
		
		
	        int number = count - (currentPage - 1) * pageSize;
	        int bottomLine = 3;
	        int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
	        int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
	        int endPage = startPage + bottomLine - 1;

	        if (endPage > pageCount) endPage = pageCount;

	        Category ca = new Category();
		      ca.setRefnum(cnum);
		      List<Category> secondcategory = dbPro.selectsecond(ca);
	        
		      List<Category> c = dbPro.selectAllcategory();
	        m.addAttribute("currentPage", currentPage);
	        m.addAttribute("startRow", startRow);
	        m.addAttribute("endRow", endRow);
	        m.addAttribute("count", count);
	        m.addAttribute("pageSize", pageSize);
	        m.addAttribute("number", number);
	        m.addAttribute("bottomLine", bottomLine);
	        m.addAttribute("startPage", startPage);
	        m.addAttribute("endPage", endPage);
	        m.addAttribute("pageCount", pageCount);
	        m.addAttribute("category",c);
	    	m.addAttribute("secondcategory",secondcategory);
	
	     
	
	        return "auction/list";
	    }
	 @RequestMapping(value = "secondcategorylist", method = RequestMethod.GET)
	 public String secondcategorylist(HttpServletRequest request, HttpSession session,Model m)
	 {
		 
		 int currentPage = 1;
		 
		 int cnum = Integer.parseInt(request.getParameter("cnum"));
		 
		 
		 try
		 {
			 currentPage = Integer.parseInt(request.getParameter("pageNum"));
			 session.setAttribute("pageNum", currentPage);
		 }
		 catch (Exception e)
		 {
			 
			 if (session.getAttribute("pageNum") == null) session.setAttribute("pageNum", 1);
		 }
		 currentPage = (int) session.getAttribute("pageNum");
		 
		 int pageSize = 9;
		 int startRow = (currentPage - 1) * pageSize + 1;
		 int endRow = currentPage * pageSize;
		 int count =0;
		 
		 try{
			 count=dbPro.getSecondCatagoryCount(cnum);
		 }catch(Exception e){
			 
		 }
		 
		 List<Auction> auctionList = dbPro.selectbysecondCategory(startRow, endRow, cnum);
		 
		 m.addAttribute("auctionList", auctionList);
		 
		 
		 
		 int number = count - (currentPage - 1) * pageSize;
		 int bottomLine = 3;
		 int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		 int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
		 int endPage = startPage + bottomLine - 1;
		 
		 if (endPage > pageCount) endPage = pageCount;
		 
		 Category ca = new Category();
		 int fnum = (cnum/100)*100;
		 System.out.println(fnum);
		 ca.setRefnum(fnum);
		 List<Category> secondcategory = dbPro.selectsecond(ca);
		 
		 List<Category> c = dbPro.selectAllcategory();
		 m.addAttribute("currentPage", currentPage);
		 m.addAttribute("startRow", startRow);
		 m.addAttribute("endRow", endRow);
		 m.addAttribute("count", count);
		 m.addAttribute("pageSize", pageSize);
		 m.addAttribute("number", number);
		 m.addAttribute("bottomLine", bottomLine);
		 m.addAttribute("startPage", startPage);
		 m.addAttribute("endPage", endPage);
		 m.addAttribute("pageCount", pageCount);
		 m.addAttribute("category",c);
		 m.addAttribute("secondcategory",secondcategory);
		 
		 
		 
		 return "auction/list";
	 }
	
}
