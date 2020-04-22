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
	public String myOnSale(HttpServletRequest req, Model m) {

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

		int myAuctionCount = dbPro.getMyAuctionCount(user.getId());
		int myBidCount = dbPro.getMyBidCount(user.getId());
		int myOnSaleCount = dbPro.getMyOnSaleCount(user.getId());

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
		req.setAttribute("pageSize", pageSize);
		req.setAttribute("number", number);
		req.setAttribute("bottomLine", bottomLine);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("pageCount", pageCount);

		req.setAttribute("myAuctionCount", myAuctionCount);
		req.setAttribute("myBidCount", myBidCount);
		req.setAttribute("count", myOnSaleCount);

		req.setAttribute("myAuctionList", myOnSaleList);
		req.setAttribute("pagename", "myOnSale");

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

		int pageSize = 3;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;

		int myAuctionCount = dbPro.getMyAuctionCount(user.getId());
		int myBidCount = dbPro.getMyBidCount(user.getId());
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
		req.setAttribute("pageSize", pageSize);
		req.setAttribute("number", number);
		req.setAttribute("bottomLine", bottomLine);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("pageCount", pageCount);

		req.setAttribute("myAuctionCount", myAuctionCount);
		req.setAttribute("myBidCount", myBidCount);
		req.setAttribute("count", myDealingCount);

		req.setAttribute("myAuctionList", myDealingList);
		req.setAttribute("pagename", "myDealing");

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

		int pageSize = 3;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;

		int myAuctionCount = dbPro.getMyAuctionCount(user.getId());
		int myBidCount = dbPro.getMyBidCount(user.getId());
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
		req.setAttribute("pageSize", pageSize);
		req.setAttribute("number", number);
		req.setAttribute("bottomLine", bottomLine);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("pageCount", pageCount);

		req.setAttribute("myAuctionCount", myAuctionCount);
		req.setAttribute("myBidCount", myBidCount);
		req.setAttribute("count", myEndSaleCount);

		req.setAttribute("myAuctionList", myEndSaleList);
		req.setAttribute("pagename", "myEndSale");

		return "mypage/mySellList";
	}

	@RequestMapping(value = "myFailureSale", method = RequestMethod.GET) // 유찰/거래취소(판매)
	public String myFailureSale(HttpServletRequest req, Model m) {

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

		int myAuctionCount = dbPro.getMyAuctionCount(user.getId());
		int myBidCount = dbPro.getMyBidCount(user.getId());
		int myFailureSaleCount = dbPro.getMyFailureSaleCount(user.getId());

		List<Auction> myFailureSale = dbPro.getMyFailureSaleList(startRow, endRow, user.getId());

		int number = myFailureSaleCount - (currentPage - 1) * pageSize;
		int bottomLine = 3;
		int pageCount = myFailureSaleCount / pageSize + (myFailureSaleCount % pageSize == 0 ? 0 : 1);
		int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
		int endPage = startPage + bottomLine - 1;

		if (endPage > pageCount)
			endPage = pageCount;

		req.setAttribute("currentPage", currentPage);
		req.setAttribute("startRow", startRow);
		req.setAttribute("endRow", endRow);
		req.setAttribute("pageSize", pageSize);
		req.setAttribute("number", number);
		req.setAttribute("bottomLine", bottomLine);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("pageCount", pageCount);

		req.setAttribute("myAuctionCount", myAuctionCount);
		req.setAttribute("myBidCount", myBidCount);
		req.setAttribute("count", myFailureSaleCount);

		req.setAttribute("myAuctionList", myFailureSale);
		req.setAttribute("pagename", "myFailureSale");

		return "mypage/mySellList";
	}

	////////////////////////////////// 위는 판매 아래는 구매
	////////////////////////////////// /////////////////////////////////

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

		int pageSize = 3;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;

		int myAuctionCount = dbPro.getMyAuctionCount(user.getId());
		int myBidCount = dbPro.getMyBidCount(user.getId());
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
		req.setAttribute("pageSize", pageSize);
		req.setAttribute("number", number);
		req.setAttribute("bottomLine", bottomLine);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("pageCount", pageCount);

		req.setAttribute("myAuctionCount", myAuctionCount);
		req.setAttribute("myBidCount", myBidCount);
		req.setAttribute("count", myBiddingCount);

		req.setAttribute("myBidList", myBiddingList);
		req.setAttribute("pagename", "myBidding");

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

		int pageSize = 3;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;

		int myAuctionCount = dbPro.getMyAuctionCount(user.getId());
		int myBidCount = dbPro.getMyBidCount(user.getId());
		int myBiddingDealingCount = dbPro.getMyBiddingDealingCount(user.getId());

		List<Auction> myBiddingDealingList = dbPro.getMyBiddingDealingList(startRow, endRow, user.getId());

		int number = myBiddingDealingCount - (currentPage - 1) * pageSize;
		int bottomLine = 3;
		int pageCount = myBiddingDealingCount / pageSize + (myBiddingDealingCount % pageSize == 0 ? 0 : 1);
		int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
		int endPage = startPage + bottomLine - 1;

		if (endPage > pageCount)
			endPage = pageCount;

		req.setAttribute("currentPage", currentPage);
		req.setAttribute("startRow", startRow);
		req.setAttribute("endRow", endRow);
		req.setAttribute("pageSize", pageSize);
		req.setAttribute("number", number);
		req.setAttribute("bottomLine", bottomLine);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("pageCount", pageCount);

		req.setAttribute("myAuctionCount", myAuctionCount);
		req.setAttribute("myBidCount", myBidCount);
		req.setAttribute("count", myBiddingDealingCount);

		req.setAttribute("myBidList", myBiddingDealingList);
		req.setAttribute("pagename", "myBiddingDealing");
		
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

		int pageSize = 3;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;

		int myAuctionCount = dbPro.getMyAuctionCount(user.getId());
		int myBidCount = dbPro.getMyBidCount(user.getId());
		int count = dbPro.getMyBiddingCompleteCount(user.getId());

		List<Auction> myBidList = dbPro.getMyBiddingCompleteList(startRow, endRow, user.getId());

		int number = count - (currentPage - 1) * pageSize;
		int bottomLine = 3;
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
		int endPage = startPage + bottomLine - 1;

		if (endPage > pageCount)
			endPage = pageCount;

		req.setAttribute("currentPage", currentPage);
		req.setAttribute("startRow", startRow);
		req.setAttribute("endRow", endRow);
		req.setAttribute("pageSize", pageSize);
		req.setAttribute("number", number);
		req.setAttribute("bottomLine", bottomLine);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("pageCount", pageCount);

		req.setAttribute("myAuctionCount", myAuctionCount);
		req.setAttribute("myBidCount", myBidCount);
		req.setAttribute("count", count);

		req.setAttribute("myBidList", myBidList);
		req.setAttribute("pagename", "myBiddingComplete");
		
		return "mypage/myPurchaseList";
	}

	@RequestMapping(value = "myFailureBidding", method = RequestMethod.GET) // 유찰
																			// 취소
	public String myFailureBidding(HttpServletRequest req, Model m) {

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

		int myAuctionCount = dbPro.getMyAuctionCount(user.getId());
		int myBidCount = dbPro.getMyBidCount(user.getId());
		int myFailureBiddingCount = dbPro.getMyFailureBiddingCount(user.getId());

		List<Auction> myFailureBidding = dbPro.getMyFailureBiddingList(startRow, endRow, user.getId());

		int number = myFailureBiddingCount - (currentPage - 1) * pageSize;
		int bottomLine = 3;
		int pageCount = myFailureBiddingCount / pageSize + (myFailureBiddingCount % pageSize == 0 ? 0 : 1);
		int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
		int endPage = startPage + bottomLine - 1;

		if (endPage > pageCount)
			endPage = pageCount;

		req.setAttribute("currentPage", currentPage);
		req.setAttribute("startRow", startRow);
		req.setAttribute("endRow", endRow);
		req.setAttribute("pageSize", pageSize);
		req.setAttribute("number", number);
		req.setAttribute("bottomLine", bottomLine);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("pageCount", pageCount);

		req.setAttribute("myAuctionCount", myAuctionCount);
		req.setAttribute("myBidCount", myBidCount);
		req.setAttribute("count", myFailureBiddingCount);
		req.setAttribute("myBidList", myFailureBidding);
		req.setAttribute("pagename", "myFailureBidding");
		
		return "mypage/myPurchaseList";
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
