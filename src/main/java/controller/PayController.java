
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.Auction;
import model.Cash;
import model.Member;
import model.Penalty;
import model.User;
import service.MybatisAuctionDao;
import service.MybatisCashDao;
import service.MybatisMemberDao;
import service.MybatisPenaltyDao;

@Controller
public class PayController {

	@Autowired
	MybatisAuctionDao dbPro;

	@Autowired
	MybatisCashDao cashPro;

	@Autowired
	MybatisMemberDao memPro;

	@Autowired
	MybatisPenaltyDao penPro;

	@RequestMapping(value = "pay", method = RequestMethod.GET)
	public String payGET(HttpSession session, HttpServletResponse response, int num, Model m) throws IOException {

		User user = (User) session.getAttribute("user");
		if(user.getStatus()==1) {
			response.setContentType("text/html; charset=UTF-8");			 
			PrintWriter out = response.getWriter();			 
			out.println("<script>alert('활동중지 회원입니다. 나의패널티기록을 확인하세요.'); history.go(-1);</script>");			 
			out.flush();
		}
		
		Auction myBidCompleteAuction = dbPro.getAuction(num);
		m.addAttribute("myBidCompleteAuction", myBidCompleteAuction);

		int cash = cashPro.myCash(user.getId());
		m.addAttribute("cash", cash);

		int myBalance = cash - myBidCompleteAuction.getImmediateprice();
		m.addAttribute("myBalance", myBalance);
		return "pay/pay";
	}

	@RequestMapping(value = "pay", method = RequestMethod.POST)
	public String payPOST(HttpSession session, int num) throws Exception {

		User user = (User) session.getAttribute("user");

		Auction auction = new Auction();
		auction.setNum(num);
		Auction myAuction = dbPro.getAuction(num);

		Cash cash = new Cash();
		cash.setId(user.getId());

		if (myAuction.getPstatus().equals("입찰중")) {
			cash.setCash((myAuction.getImmediateprice()) * -1);
		} else {
			cash.setCash((myAuction.getBeginsprice()) * -1);
		}

		cash.setCashdate(LocalDateTime.now());
		cash.setReason(myAuction.getNum() + "번 경매물품 대금 결제");
		cash.setCstatus(1);
		cashPro.insertCash(cash);

		myAuction.setPstatus("입금완료");
		dbPro.updateContent(myAuction); // 상품 상태 "입금완료" 로 변경

		return "redirect:/mypage";
	}

	@RequestMapping(value = "shippingInfo", method = RequestMethod.GET)
	public String shippingInfo(HttpServletRequest req, String winid, int num, Model m) {

		Member member = memPro.getMemberinfo(winid); // 낙찰자 배송정보 가져오기
		m.addAttribute("member", member);
		System.out.println(member);
		Auction myAuction = dbPro.getAuction(num);
		m.addAttribute("auction", myAuction);

		return "pay/shippingInfo";

	}

	@RequestMapping(value = "shippingComplete", method = RequestMethod.POST)
	public String shippingComplete(int num, Model m) throws Exception {
		Auction auction = new Auction();
		auction.setNum(num);

		Auction myAuction = dbPro.getAuction(num);
		myAuction.setPstatus("배송중");
		dbPro.updateAuctionStatus(myAuction);
		m.addAttribute("auction", auction);

		return "redirect:/myOnSale";
	}

	@RequestMapping(value = "confirmShipping", method = RequestMethod.POST)
	public String confirmShipping(int num, Model m) throws Exception {

		Auction myAuction = dbPro.getAuction(num);
		myAuction.setPstatus("거래종료");
		dbPro.updateAuctionStatus(myAuction);

		int payCash = (cashPro.getPayCash(myAuction.getWinid(), num)) * -1;
		Cash cash = new Cash();
		cash.setId(myAuction.getSeller());
		cash.setCash(payCash);

		cash.setCashdate(LocalDateTime.now());
		cash.setReason(num + "번 경매물품 대금 지급");
		cash.setCstatus(1);
		cashPro.insertCash(cash);

		return "redirect:/myBiddingComplete";

	}

	@RequestMapping(value = "giveUpBidding", method = RequestMethod.POST)
	public String cancleDeal(HttpSession session, int num) throws Exception {
		// 낙찰자가 입금전일때 낙찰포기 -> 패널티부여
		User user = (User) session.getAttribute("user");
		Auction myAuction = dbPro.getAuction(num);
		myAuction.setPstatus("유찰");
		dbPro.updateAuctionStatus(myAuction);

		LocalDateTime today = LocalDateTime.now();
		Penalty insertPenalty = new Penalty();
		insertPenalty.setId(user.getId());
		insertPenalty.setPenaltyDate(today);
		insertPenalty.setPenaltyReason("거래취소");

		if (penPro.penaltyCount(user.getId()) % 3 == 2) {
			insertPenalty.setPenaltyEndDate(today.plusDays(7));
			penPro.insertPenalty(insertPenalty);

			memPro.memberStop(user.getId());

		} else {
			insertPenalty.setPenaltyEndDate(null);
			penPro.insertPenalty(insertPenalty);
		}

		return "redirect:/content?num=" + num;

	}

	@RequestMapping(value = "refundbuyer", method = RequestMethod.POST)
	public String refundbuyer(int num) throws Exception {

		Auction myAuction = dbPro.getAuction(num);
		myAuction.setPstatus("거래취소");
		dbPro.updateAuctionStatus(myAuction);

		LocalDateTime today = LocalDateTime.now();
		Penalty insertPenalty = new Penalty();
		insertPenalty.setId(myAuction.getWinid());
		insertPenalty.setPenaltyDate(today);
		insertPenalty.setPenaltyReason("거래취소");

		if (penPro.penaltyCount(myAuction.getWinid()) % 3 == 2) {
			insertPenalty.setPenaltyEndDate(today.plusDays(7));
			penPro.insertPenalty(insertPenalty);

			memPro.memberStop(myAuction.getWinid());

		} else {
			insertPenalty.setPenaltyEndDate(null);
			penPro.insertPenalty(insertPenalty);
		}

		int refund = (cashPro.getPayCash(myAuction.getWinid(), num)) * -1;
		Cash cash = new Cash();
		cash.setId(myAuction.getWinid());
		cash.setCash(refund);
		cash.setCashdate(LocalDateTime.now());
		cash.setReason(num + "번 경매물품 대금 환불");
		cash.setCstatus(1);
		cashPro.insertCash(cash);

		return "redirect:/mypage";

	}

	@RequestMapping(value = "refundseller", method = RequestMethod.POST)
	public String refundseller(int num) throws Exception {

		Auction myAuction = dbPro.getAuction(num);
		
		if (!myAuction.getPstatus().equals("입금전")) {
			int refund = (cashPro.getPayCash(myAuction.getWinid(), num)) * -1;

			Cash cash = new Cash();
			cash.setId(myAuction.getWinid());
			cash.setCash(refund);
			cash.setCashdate(LocalDateTime.now());
			cash.setReason(num + "번 경매물품 대금 환불");
			cash.setCstatus(1);
			cashPro.insertCash(cash);
		}		
		
		myAuction.setPstatus("거래취소");
		dbPro.updateAuctionStatus(myAuction);

		LocalDateTime today = LocalDateTime.now();
		Penalty insertPenalty = new Penalty();
		insertPenalty.setId(myAuction.getSeller());
		insertPenalty.setPenaltyDate(today);
		insertPenalty.setPenaltyReason("거래취소");

		if (penPro.penaltyCount(myAuction.getSeller()) % 3 == 2) {
			insertPenalty.setPenaltyEndDate(today.plusDays(7));
			penPro.insertPenalty(insertPenalty);

			memPro.memberStop(myAuction.getSeller());

		} else {
			insertPenalty.setPenaltyEndDate(null);
			penPro.insertPenalty(insertPenalty);
		}
	

		return "redirect:/mypage";

	}
}
