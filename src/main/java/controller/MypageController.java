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
import model.Member;
import model.Penalty;
import model.User;
import model.Wishseller;
import service.MybatisAuctionDao;
import service.MybatisCashDao;
import service.MybatisMemberDao;
import service.MybatisPenaltyDao;

@Controller
public class MypageController {

	@Autowired
	MybatisAuctionDao dbPro;

	@Autowired
	MybatisCashDao cashDbPro;
	
	@Autowired
	MybatisMemberDao memPro;
	
	@Autowired
	MybatisPenaltyDao penPro;

	@RequestMapping(value = "mypage")
	public String mypage(HttpServletRequest req, Model m) {
		User user = (User) req.getSession().getAttribute("user");
		
		int mycash = cashDbPro.myCash(user.getId());
		Member member = memPro.getMemberinfo(user.getId());
		int myAuctionCount = dbPro.getMyAuctionCount(user.getId());
		int myBidCount = dbPro.getMyBidCount(user.getId());
		
		m.addAttribute("mycash", mycash);
		m.addAttribute("myAuctionCount", myAuctionCount);
		m.addAttribute("myBidCount", myBidCount);
		m.addAttribute("member", member);
		
		return "mypage/mypage";
	}

	@RequestMapping(value = "myOnSale", method = RequestMethod.GET)
	public String mySellList(HttpServletRequest req, Model m) {

		User user = (User) req.getSession().getAttribute("user");
		HttpSession session = req.getSession();	
	
		int myAuctionCount = dbPro.getMyAuctionCount(user.getId());
		int myBidCount = dbPro.getMyBidCount(user.getId());
		
		int myOnSaleCount = dbPro.getMyOnSaleCount(user.getId());
		int myDealingCount = dbPro.getMyDealingCount(user.getId());
		int myEndSaleCount = dbPro.getMyEndSaleCount(user.getId());
		int myFailureSaleCount = dbPro.getMyFailureSaleCount(user.getId());

		m.addAttribute("myAuctionCount",myAuctionCount);
		m.addAttribute("myBidCount",myBidCount);
		
		m.addAttribute("myOnSaleCount",myOnSaleCount);
		m.addAttribute("myDealingCount",myDealingCount);
		m.addAttribute("myEndSaleCount",myEndSaleCount);
		m.addAttribute("myFailureSaleCount",myFailureSaleCount);

		return "mypage/mySellList";
	}
	
	@RequestMapping(value = "myOnSaleTab1", method = RequestMethod.GET)
	public String myOnSaleTab1(HttpServletRequest req, Model m) {

		User user = (User) req.getSession().getAttribute("user");
		HttpSession session = req.getSession();
		
		int currentPage = 1;

		try {
			currentPage = Integer.parseInt(req.getParameter("pageNum"));
			session.setAttribute("pageNum", currentPage);
		} catch (Exception e) {

			if (req.getParameter("pageNum") == null)
				session.setAttribute("pageNum", 1);
		}
		currentPage = (int) session.getAttribute("pageNum");

		int pageSize = 3;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		
		int myOnSaleCount = dbPro.getMyOnSaleCount(user.getId());
		List<Auction> myOnSaleList = dbPro.getMyOnSaleList(startRow, endRow, user.getId());

		int number = myOnSaleCount - (currentPage - 1) * pageSize;
		int bottomLine = 3;
		int pageCount = myOnSaleCount / pageSize + (myOnSaleCount % pageSize == 0 ? 0 : 1);
		int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
		int endPage = startPage + bottomLine - 1;

		if (endPage > pageCount)
			endPage = pageCount;

		m.addAttribute("currentPage", currentPage);
		m.addAttribute("startRow", startRow);
		m.addAttribute("endRow", endRow);
		m.addAttribute("pageSize", pageSize);
		m.addAttribute("number", number);
		m.addAttribute("bottomLine", bottomLine);
		m.addAttribute("startPage", startPage);
		m.addAttribute("endPage", endPage);
		m.addAttribute("pageCount", pageCount);		
		
		m.addAttribute("count", myOnSaleCount);
		m.addAttribute("myAuctionList", myOnSaleList);
		m.addAttribute("pagename", "myOnSaleTab1");

		return "myList/mySellList";
	}
	
	
	@RequestMapping(value = "myDealingTab2", method = RequestMethod.GET)
	public String myDealingTab2(HttpServletRequest req, Model m) {

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

		int pageSize = 3;
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

		m.addAttribute("currentPage", currentPage);
		m.addAttribute("startRow", startRow);
		m.addAttribute("endRow", endRow);
		m.addAttribute("pageSize", pageSize);
		m.addAttribute("number", number);
		m.addAttribute("bottomLine", bottomLine);
		m.addAttribute("startPage", startPage);
		m.addAttribute("endPage", endPage);
		m.addAttribute("pageCount", pageCount);	

		m.addAttribute("count", myDealingCount);
		m.addAttribute("myAuctionList", myDealingList);
		m.addAttribute("pagename", "myDealingTab2");

		return "myList/mySellList";
	}

	@RequestMapping(value = "myEndSaleTab3", method = RequestMethod.GET)
	public String myEndSaleTab3(HttpServletRequest req, Model m) {

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

		int pageSize = 3;
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

		m.addAttribute("currentPage", currentPage);
		m.addAttribute("startRow", startRow);
		m.addAttribute("endRow", endRow);
		m.addAttribute("pageSize", pageSize);
		m.addAttribute("number", number);
		m.addAttribute("bottomLine", bottomLine);
		m.addAttribute("startPage", startPage);
		m.addAttribute("endPage", endPage);
		m.addAttribute("pageCount", pageCount);

		m.addAttribute("count", myEndSaleCount);
		m.addAttribute("myAuctionList", myEndSaleList);
		m.addAttribute("pagename", "myEndSaleTab3");

		return "myList/mySellList";
	}

	@RequestMapping(value = "myFailureSaleTab4", method = RequestMethod.GET) // 유찰/거래취소(판매)
	public String myFailureSaleTab4(HttpServletRequest req, Model m) {

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

		int pageSize = 3;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;

		int myFailureSaleCount = dbPro.getMyFailureSaleCount(user.getId());
		List<Auction> myFailureSale = dbPro.getMyFailureSaleList(startRow, endRow, user.getId());

		int number = myFailureSaleCount - (currentPage - 1) * pageSize;
		int bottomLine = 3;
		int pageCount = myFailureSaleCount / pageSize + (myFailureSaleCount % pageSize == 0 ? 0 : 1);
		int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
		int endPage = startPage + bottomLine - 1;

		if (endPage > pageCount)
			endPage = pageCount;

		m.addAttribute("currentPage", currentPage);
		m.addAttribute("startRow", startRow);
		m.addAttribute("endRow", endRow);
		m.addAttribute("pageSize", pageSize);
		m.addAttribute("number", number);
		m.addAttribute("bottomLine", bottomLine);
		m.addAttribute("startPage", startPage);
		m.addAttribute("endPage", endPage);
		m.addAttribute("pageCount", pageCount);

		req.setAttribute("count", myFailureSaleCount);
		req.setAttribute("myAuctionList", myFailureSale);
		req.setAttribute("pagename", "myFailureSaleTab4");

		return "myList/mySellList";
	}

	////////////////////////////////// 위는 판매 아래는 구매
	////////////////////////////////// /////////////////////////////////

	@RequestMapping(value = "myBidding", method = RequestMethod.GET)
	public String myPurchaseList(HttpServletRequest req, Model m) {

		User user = (User) req.getSession().getAttribute("user");
		HttpSession session = req.getSession();	

		int myAuctionCount = dbPro.getMyAuctionCount(user.getId());
		int myBidCount = dbPro.getMyBidCount(user.getId());
		
		int myBiddingCount = dbPro.getMyBiddingCount(user.getId());
		int myBiddingDealingCount = dbPro.getMyBiddingDealingCount(user.getId());
		int myBiddingCompleteCount = dbPro.getMyBiddingCompleteCount(user.getId());
		int myFailureBiddingCount = dbPro.getMyFailureBiddingCount(user.getId());

		m.addAttribute("myAuctionCount", myAuctionCount);
		m.addAttribute("myBidCount", myBidCount);
		
		m.addAttribute("myBiddingCount", myBiddingCount);
		m.addAttribute("myBiddingDealingCount", myBiddingDealingCount);
		m.addAttribute("myBiddingCompleteCount", myBiddingCompleteCount);
		m.addAttribute("myFailureBiddingCount", myFailureBiddingCount);

		return "mypage/myPurchaseList";
	}

	@RequestMapping(value = "myBiddingTab1", method = RequestMethod.GET)
	public String myBiddingTab1(HttpServletRequest req, Model m) {

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

		int pageSize = 3;
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

		m.addAttribute("currentPage", currentPage);
		m.addAttribute("startRow", startRow);
		m.addAttribute("endRow", endRow);
		m.addAttribute("pageSize", pageSize);
		m.addAttribute("number", number);
		m.addAttribute("bottomLine", bottomLine);
		m.addAttribute("startPage", startPage);
		m.addAttribute("endPage", endPage);
		m.addAttribute("pageCount", pageCount);

		m.addAttribute("count", myBiddingCount);
		m.addAttribute("myBidList", myBiddingList);
		m.addAttribute("pagename", "myBiddingTab1");
	
		return "myList/myPurchaseList";
	}
	
	@RequestMapping(value = "myBiddingDealingTab2", method = RequestMethod.GET)
	public String myBiddingDealingTab2(HttpServletRequest req, Model m) {

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

		int pageSize = 3;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;

		int myBiddingDealingCount = dbPro.getMyBiddingDealingCount(user.getId());
		List<Auction> myBiddingDealingList = dbPro.getMyBiddingDealingList(startRow, endRow, user.getId());

		int number = myBiddingDealingCount - (currentPage - 1) * pageSize;
		int bottomLine = 3;
		int pageCount = myBiddingDealingCount / pageSize + (myBiddingDealingCount % pageSize == 0 ? 0 : 1);
		int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
		int endPage = startPage + bottomLine - 1;

		if (endPage > pageCount)
			endPage = pageCount;

		m.addAttribute("currentPage", currentPage);
		m.addAttribute("startRow", startRow);
		m.addAttribute("endRow", endRow);
		m.addAttribute("pageSize", pageSize);
		m.addAttribute("number", number);
		m.addAttribute("bottomLine", bottomLine);
		m.addAttribute("startPage", startPage);
		m.addAttribute("endPage", endPage);
		m.addAttribute("pageCount", pageCount);

		m.addAttribute("count", myBiddingDealingCount);
		m.addAttribute("myBidList", myBiddingDealingList);
		m.addAttribute("pagename", "myBiddingDealingTab2");
		
		return "myList/myPurchaseList";
	}

	@RequestMapping(value = "myBiddingCompleteTab3", method = RequestMethod.GET)
	public String myBiddingCompleteTab3(HttpServletRequest req, Model m) {

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

		int pageSize = 3;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;

		int count = dbPro.getMyBiddingCompleteCount(user.getId());
		List<Auction> myBidList = dbPro.getMyBiddingCompleteList(startRow, endRow, user.getId());

		int number = count - (currentPage - 1) * pageSize;
		int bottomLine = 3;
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
		int endPage = startPage + bottomLine - 1;

		if (endPage > pageCount)
			endPage = pageCount;

		m.addAttribute("currentPage", currentPage);
		m.addAttribute("startRow", startRow);
		m.addAttribute("endRow", endRow);
		m.addAttribute("pageSize", pageSize);
		m.addAttribute("number", number);
		m.addAttribute("bottomLine", bottomLine);
		m.addAttribute("startPage", startPage);
		m.addAttribute("endPage", endPage);
		m.addAttribute("pageCount", pageCount);
		
		m.addAttribute("count", count);
		m.addAttribute("myBidList", myBidList);
		m.addAttribute("pagename", "myBiddingCompleteTab3");
		
		return "myList/myPurchaseList";
	}

	@RequestMapping(value = "myFailureBiddingTab4", method = RequestMethod.GET)																			
	public String myFailureBiddingTab4(HttpServletRequest req, Model m) {

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

		int pageSize = 3;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;

		int myFailureBiddingCount = dbPro.getMyFailureBiddingCount(user.getId());
		List<Auction> myFailureBidding = dbPro.getMyFailureBiddingList(startRow, endRow, user.getId());

		int number = myFailureBiddingCount - (currentPage - 1) * pageSize;
		int bottomLine = 3;
		int pageCount = myFailureBiddingCount / pageSize + (myFailureBiddingCount % pageSize == 0 ? 0 : 1);
		int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
		int endPage = startPage + bottomLine - 1;

		if (endPage > pageCount)
			endPage = pageCount;

		m.addAttribute("currentPage", currentPage);
		m.addAttribute("startRow", startRow);
		m.addAttribute("endRow", endRow);
		m.addAttribute("pageSize", pageSize);
		m.addAttribute("number", number);
		m.addAttribute("bottomLine", bottomLine);
		m.addAttribute("startPage", startPage);
		m.addAttribute("endPage", endPage);
		m.addAttribute("pageCount", pageCount);
		
		m.addAttribute("count", myFailureBiddingCount);
		m.addAttribute("myBidList", myFailureBidding);
		m.addAttribute("pagename", "myFailureBiddingTab4");
		
		return "myList/myPurchaseList";
	}

	@RequestMapping(value = "myPenalty", method = RequestMethod.GET)
	public String myPenalty(HttpSession session, String pageNum, Model m) {
		
		User user = (User) session.getAttribute("user");
		
		int currentPage = 1;

		try {
			currentPage = Integer.parseInt(pageNum);
			session.setAttribute("pageNum", currentPage);
		} catch (Exception e) {

			if (session.getAttribute("pageNum") == null)
				session.setAttribute("pageNum", 1);
		}
		currentPage = (int) session.getAttribute("pageNum");

		int pageSize = 3;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;

		int myAuctionCount = dbPro.getMyAuctionCount(user.getId());
		int myBidCount = dbPro.getMyBidCount(user.getId());
		int myPenaltyCount = penPro.getMyPenaltyCount(user.getId());

		List<Penalty> myPenaltyList = penPro.getMyPenaltyList(startRow, endRow, user.getId());
		Member member = memPro.getMemberinfo(user.getId());
		
		int number = myPenaltyCount - (currentPage - 1) * pageSize;
		int bottomLine = 3;
		int pageCount = myPenaltyCount / pageSize + (myPenaltyCount % pageSize == 0 ? 0 : 1);
		int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
		int endPage = startPage + bottomLine - 1;

		if (endPage > pageCount)
			endPage = pageCount;	
		
		m.addAttribute("currentPage", currentPage);
		m.addAttribute("startRow", startRow);
		m.addAttribute("endRow", endRow);
		m.addAttribute("pageSize", pageSize);
		m.addAttribute("number", number);
		m.addAttribute("bottomLine", bottomLine);
		m.addAttribute("startPage", startPage);
		m.addAttribute("endPage", endPage);
		m.addAttribute("pageCount", pageCount);
		
		m.addAttribute("myAuctionCount", myAuctionCount);
		m.addAttribute("myBidCount", myBidCount);
		
		m.addAttribute("myPenaltyCount", myPenaltyCount);
		m.addAttribute("myPenaltyList", myPenaltyList);		
		m.addAttribute("member", member);		
		m.addAttribute("pagename", "myPenalty");
		
		return "mypage/myPenalty";
	}

	
	@RequestMapping(value = "mywishseller", method = RequestMethod.GET)
	public String mywishseller(HttpSession session, HttpServletRequest request,Model m) {
		User user = (User) session.getAttribute("user");
		int pageNum;

		if (request.getParameter("pageNum") == null) {
			pageNum = 1;
		} else {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}

		int currentPage = 1;

		try {
			currentPage = pageNum;
			session.setAttribute("pageNum", currentPage);
		} catch (Exception e) {

			if (session.getAttribute("pageNum") == null)
				session.setAttribute("pageNum", 1);
		}
		currentPage = (int) session.getAttribute("pageNum");

		int pageSize = 3;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;

		int count = dbPro.getAuctionCount();

		List<Auction> auctionList = dbPro.getmyseller(startRow, endRow, user.getId());

		int number = count - (currentPage - 1) * pageSize;
		int bottomLine = 3;
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
		int endPage = startPage + bottomLine - 1;

		if (endPage > pageCount)
			endPage = pageCount;

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

		m.addAttribute("auctionList", auctionList);
		m.addAttribute("user", user);
		m.addAttribute("seller", null);

		m.addAttribute("pagename", "mywishseller");
		return "auction/list";

	}

	@RequestMapping(value = "addmyseller", method = RequestMethod.GET)
	public String mypage(HttpSession session, HttpServletRequest request) {

		User user = (User) session.getAttribute("user");

		Wishseller seller = new Wishseller();
		seller.setId(user.getId());
		seller.setSeller(request.getParameter("seller"));

		dbPro.addseller(seller);
		// insert하기 전에 같이 게 있으면 이미 등록된 판매자입니다라는 창띄워야함 //
		return "redirect:/sellerstore?seller=" + seller.getSeller();
	}

	/*
	 * @RequestMapping("messagebox") public String message(Model
	 * m,HttpServletRequest request) {
	 * 
	 * HttpSession session = request.getSession(); String id =
	 * request.getParameter("id"); session.setAttribute("id", id);
	 * 
	 * int i =dbPro.getunreadMessage(id); m.addAttribute("unreadcount",i);
	 * m.addAttribute("id",id);
	 * 
	 * return "messagebox"; }
	 */

}
