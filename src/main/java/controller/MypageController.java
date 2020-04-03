package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.Auction;
import model.User;
import service.MybatisAuctionDao;
import service.MybatisCashDao;

@Controller
public class MypageController {

	@Autowired
	MybatisAuctionDao dbPro;

	@Autowired
	MybatisCashDao cashDbPro;

	@RequestMapping(value = "mypage")
	public String mypage(HttpServletRequest req, Model m) {
		User user = (User) req.getSession().getAttribute("user");
		int mycash = cashDbPro.myCash(user.getId());
		int myAuctionCount = dbPro.getMyAuctionCount(user.getId());
		int myBidCount = dbPro.getMyBidCount(user.getId());
		m.addAttribute("mycash", mycash);
		m.addAttribute("myAuctionCount", myAuctionCount);
		m.addAttribute("myBidCount", myBidCount);
		return "mypage/mypage";
	}

	@RequestMapping(value = "myOnSale", method = RequestMethod.GET)
	public String myOnSale(HttpServletRequest req, Model m) {

		User user = (User) req.getSession().getAttribute("user");
		HttpSession session = req.getSession();

		int currentPage = 1;

		try {
			currentPage = Integer.parseInt(req.getParameter("pageNum"));
			session.setAttribute("pageNum", currentPage);
		} catch (Exception e) {

			if (session.getAttribute("pageNum") == null)
				session.setAttribute("pageNum", 1);
		}
		currentPage = (int) session.getAttribute("pageNum");

		int pageSize = 9;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;

		int myOnSaleCount = dbPro.getMyOnSaleCount(user.getId());
		int myDealingCount = dbPro.getMyDealingCount(user.getId());
		int myEndSaleCount = dbPro.getMyEndSaleCount(user.getId());
		
		List<Auction> myOnSaleList = dbPro.getMyOnSaleList(startRow, endRow, user.getId());

		int number = myOnSaleCount - (currentPage - 1) * pageSize;
		int bottomLine = 3;
		int pageCount = myOnSaleCount / pageSize + (myOnSaleCount % pageSize == 0 ? 0 : 1);
		int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
		int endPage = startPage + bottomLine - 1;

		if (endPage > pageCount)
			endPage = pageCount;

		

		req.setAttribute("currentPage", currentPage);
		req.setAttribute("startRow", startRow);
		req.setAttribute("endRow", endRow);
		req.setAttribute("count", myOnSaleCount);
		req.setAttribute("pageSize", pageSize);
		req.setAttribute("number", number);
		req.setAttribute("bottomLine", bottomLine);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("pageCount", pageCount);

		req.setAttribute("myAuctionList", myOnSaleList);

		return "mypage/mySellList";
	}

	@RequestMapping(value = "myDealing", method = RequestMethod.GET)
	public String myDealing(HttpServletRequest req, Model m) {

		User user = (User) req.getSession().getAttribute("user");
		HttpSession session = req.getSession();

		int currentPage = 1;

		try {
			currentPage = Integer.parseInt(req.getParameter("pageNum"));
			session.setAttribute("pageNum", currentPage);
		} catch (Exception e) {

			if (session.getAttribute("pageNum") == null)
				session.setAttribute("pageNum", 1);
		}
		currentPage = (int) session.getAttribute("pageNum");

		int pageSize = 9;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;

		int myDealingCount = dbPro.getMyDealingCount(user.getId());
		

		List<Auction> myDealingList = dbPro.getMyDealingList(startRow, endRow, user.getId());

		int number = myDealingCount - (currentPage - 1) * pageSize;
		int bottomLine = 3;
		int pageCount = myDealingCount / pageSize + (myDealingCount % pageSize == 0 ? 0 : 1);
		int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
		int endPage = startPage + bottomLine - 1;

		if (endPage > pageCount)
			endPage = pageCount;

		req.setAttribute("currentPage", currentPage);
		req.setAttribute("startRow", startRow);
		req.setAttribute("endRow", endRow);
		req.setAttribute("count", myDealingCount);
		req.setAttribute("pageSize", pageSize);
		req.setAttribute("number", number);
		req.setAttribute("bottomLine", bottomLine);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("pageCount", pageCount);

		req.setAttribute("myAuctionList", myDealingList);

		return "mypage/mySellList";
	}

	@RequestMapping(value = "myEndSale", method = RequestMethod.GET)
	public String myEndSale(HttpServletRequest req, Model m) {

		User user = (User) req.getSession().getAttribute("user");
		HttpSession session = req.getSession();

		int currentPage = 1;

		try {
			currentPage = Integer.parseInt(req.getParameter("pageNum"));
			session.setAttribute("pageNum", currentPage);
		} catch (Exception e) {

			if (session.getAttribute("pageNum") == null)
				session.setAttribute("pageNum", 1);
		}
		currentPage = (int) session.getAttribute("pageNum");

		int pageSize = 9;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;

		int myEndSaleCount = dbPro.getMyEndSaleCount(user.getId());
		
		List<Auction> myEndSaleList = dbPro.getMyEndSaleList(startRow, endRow, user.getId());

		int number = myEndSaleCount - (currentPage - 1) * pageSize;
		int bottomLine = 3;
		int pageCount = myEndSaleCount / pageSize + (myEndSaleCount % pageSize == 0 ? 0 : 1);
		int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
		int endPage = startPage + bottomLine - 1;

		if (endPage > pageCount)
			endPage = pageCount;

		req.setAttribute("currentPage", currentPage);
		req.setAttribute("startRow", startRow);
		req.setAttribute("endRow", endRow);
		req.setAttribute("count", myEndSaleCount);
		req.setAttribute("pageSize", pageSize);
		req.setAttribute("number", number);
		req.setAttribute("bottomLine", bottomLine);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("pageCount", pageCount);

		req.setAttribute("myAuctionList", myEndSaleList);

		return "mypage/mySellList";
	}

	//////////////////////////////////위는 구매 아래는 판매/////////////////////////////////
	
	@RequestMapping(value = "myBidding", method = RequestMethod.GET)
	public String myBidList(HttpServletRequest req, Model m) {

		User user = (User) req.getSession().getAttribute("user");
		HttpSession session = req.getSession();

		int currentPage = 1;

		try {
			currentPage = Integer.parseInt(req.getParameter("pageNum"));
			session.setAttribute("pageNum", currentPage);
		} catch (Exception e) {

			if (session.getAttribute("pageNum") == null)
				session.setAttribute("pageNum", 1);
		}
		currentPage = (int) session.getAttribute("pageNum");

		int pageSize = 9;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;

		int myBiddingCount = dbPro.getMyBiddingCount(user.getId());

		List<Auction> myBiddingList = dbPro.getMyBiddingList(startRow, endRow, user.getId());

		int number = myBiddingCount - (currentPage - 1) * pageSize;
		int bottomLine = 3;
		int pageCount = myBiddingCount / pageSize + (myBiddingCount % pageSize == 0 ? 0 : 1);
		int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
		int endPage = startPage + bottomLine - 1;

		if (endPage > pageCount)
			endPage = pageCount;

		req.setAttribute("currentPage", currentPage);
		req.setAttribute("startRow", startRow);
		req.setAttribute("endRow", endRow);
		req.setAttribute("count", myBiddingCount);
		req.setAttribute("pageSize", pageSize);
		req.setAttribute("number", number);
		req.setAttribute("bottomLine", bottomLine);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("pageCount", pageCount);

		req.setAttribute("myBidList", myBiddingList);

		return "mypage/myPurchaseList";
	}
	
	@RequestMapping(value = "myBiddingDealing", method = RequestMethod.GET)
	public String myBiddingDealing(HttpServletRequest req, Model m) {

		User user = (User) req.getSession().getAttribute("user");
		HttpSession session = req.getSession();

		int currentPage = 1;

		try {
			currentPage = Integer.parseInt(req.getParameter("pageNum"));
			session.setAttribute("pageNum", currentPage);
		} catch (Exception e) {

			if (session.getAttribute("pageNum") == null)
				session.setAttribute("pageNum", 1);
		}
		currentPage = (int) session.getAttribute("pageNum");

		int pageSize = 9;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;

		int myBiddingCount = dbPro.getMyBiddingDealingCount(user.getId());

		List<Auction> myBiddingDealingList = dbPro.getMyBiddingDealingList(startRow, endRow, user.getId());

		int number = myBiddingCount - (currentPage - 1) * pageSize;
		int bottomLine = 3;
		int pageCount = myBiddingCount / pageSize + (myBiddingCount % pageSize == 0 ? 0 : 1);
		int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
		int endPage = startPage + bottomLine - 1;

		if (endPage > pageCount)
			endPage = pageCount;

		req.setAttribute("currentPage", currentPage);
		req.setAttribute("startRow", startRow);
		req.setAttribute("endRow", endRow);
		req.setAttribute("count", myBiddingCount);
		req.setAttribute("pageSize", pageSize);
		req.setAttribute("number", number);
		req.setAttribute("bottomLine", bottomLine);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("pageCount", pageCount);

		req.setAttribute("myBidList", myBiddingDealingList);

		return "mypage/myPurchaseList";
	}
	
	@RequestMapping(value = "myBiddingComplete", method = RequestMethod.GET)
	public String myBiddingComplete(HttpServletRequest req, Model m) {

		User user = (User) req.getSession().getAttribute("user");
		HttpSession session = req.getSession();

		int currentPage = 1;

		try {
			currentPage = Integer.parseInt(req.getParameter("pageNum"));
			session.setAttribute("pageNum", currentPage);
		} catch (Exception e) {

			if (session.getAttribute("pageNum") == null)
				session.setAttribute("pageNum", 1);
		}
		currentPage = (int) session.getAttribute("pageNum");

		int pageSize = 9;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;

		int myBiddingCount = dbPro.getMyBiddingCount(user.getId());

		List<Auction> myBiddingCompleteList = dbPro.getMyBiddingCompleteList(startRow, endRow, user.getId());

		int number = myBiddingCount - (currentPage - 1) * pageSize;
		int bottomLine = 3;
		int pageCount = myBiddingCount / pageSize + (myBiddingCount % pageSize == 0 ? 0 : 1);
		int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
		int endPage = startPage + bottomLine - 1;

		if (endPage > pageCount)
			endPage = pageCount;

		req.setAttribute("currentPage", currentPage);
		req.setAttribute("startRow", startRow);
		req.setAttribute("endRow", endRow);
		req.setAttribute("count", myBiddingCount);
		req.setAttribute("pageSize", pageSize);
		req.setAttribute("number", number);
		req.setAttribute("bottomLine", bottomLine);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("pageCount", pageCount);

		req.setAttribute("myBidList", myBiddingCompleteList);

		return "mypage/myPurchaseList";
	}

	/*
	 * @RequestMapping(value = "mywishseller", method = RequestMethod.GET)
	 * public String auction_listGET(HttpServletRequest request) { HttpSession
	 * session = request.getSession();
	 * 
	 * 
	 * String id = request.getParameter("id");
	 * 
	 * 
	 * 
	 * int currentPage = 1;
	 * 
	 * try { currentPage = Integer.parseInt(request.getParameter("pageNum"));
	 * session.setAttribute("pageNum", currentPage); } catch (Exception e) {
	 * 
	 * if (session.getAttribute("pageNum") == null)
	 * session.setAttribute("pageNum", 1); } currentPage = (int)
	 * session.getAttribute("pageNum");
	 * 
	 * int pageSize = 9; int startRow = (currentPage - 1) * pageSize + 1; int
	 * endRow = currentPage * pageSize;
	 * 
	 * int count = dbPro.getAuctionCount();
	 * 
	 * List<Auction> auctionList = dbPro.getmyseller(startRow, endRow, id);
	 * 
	 * int number = count - (currentPage - 1) * pageSize; int bottomLine = 3;
	 * int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1); int
	 * startPage = 1 + (currentPage - 1) / bottomLine * bottomLine; int endPage
	 * = startPage + bottomLine - 1;
	 * 
	 * if (endPage > pageCount) endPage = pageCount;
	 * 
	 * request.setAttribute("currentPage", currentPage);
	 * request.setAttribute("startRow", startRow);
	 * request.setAttribute("endRow", endRow); request.setAttribute("count",
	 * count); request.setAttribute("pageSize", pageSize);
	 * request.setAttribute("number", number);
	 * request.setAttribute("bottomLine", bottomLine);
	 * request.setAttribute("startPage", startPage);
	 * request.setAttribute("endPage", endPage);
	 * request.setAttribute("pageCount", pageCount);
	 * 
	 * request.setAttribute("auctionList", auctionList);
	 * 
	 * return "list"; }
	 */
}
