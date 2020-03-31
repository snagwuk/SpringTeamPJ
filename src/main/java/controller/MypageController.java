package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.Auction;
import service.MybatisAuctionDao;

@Controller
public class MypageController {

	 @Autowired
	    MybatisAuctionDao dbPro;

	 @RequestMapping(value = "mywishseller", method = RequestMethod.GET)
	    public String auction_listGET(HttpServletRequest request)
	    {
	        HttpSession session = request.getSession();


	        String id = request.getParameter("id");



	        int currentPage = 1;

	        try
	        {
	            currentPage = Integer.parseInt(request.getParameter("pageNum"));
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

	        List<Auction> auctionList = dbPro.getmyseller(startRow, endRow, id);

	        int number = count - (currentPage - 1) * pageSize;
	        int bottomLine = 3;
	        int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
	        int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
	        int endPage = startPage + bottomLine - 1;

	        if (endPage > pageCount) endPage = pageCount;

	        request.setAttribute("currentPage", currentPage);
	        request.setAttribute("startRow", startRow);
	        request.setAttribute("endRow", endRow);
	        request.setAttribute("count", count);
	        request.setAttribute("pageSize", pageSize);
	        request.setAttribute("number", number);
	        request.setAttribute("bottomLine", bottomLine);
	        request.setAttribute("startPage", startPage);
	        request.setAttribute("endPage", endPage);
	        request.setAttribute("pageCount", pageCount);

	        request.setAttribute("auctionList", auctionList);

	        return "list";
	    }
}
