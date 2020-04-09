
package controller;

import java.time.LocalDateTime;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.Auction;
import model.Cash;
import model.Member;
import model.User;
import service.MybatisAuctionDao;
import service.MybatisCashDao;
import service.MybatisMemberDao;

@Controller
public class PayController {

	@Autowired
	MybatisAuctionDao dbPro;

	@Autowired
	MybatisCashDao cashPro;

	@Autowired
	MybatisMemberDao memPro;

	@RequestMapping(value = "pay", method = RequestMethod.GET)
	public String payGET( HttpSession session, int num, Model m) {

		User user = (User) session.getAttribute("user");

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

		return "mypage/myPurchaseList";
	}

	@RequestMapping(value = "shippingInfo", method = RequestMethod.GET)
	public String shippingInfo(HttpServletRequest req, String winid, int num, Model m) {

		Member member = memPro.getMemberinfo(winid); // 낙찰자 배송정보 가져오기
		m.addAttribute("member", member);

		User user = (User) req.getSession().getAttribute("user");

		Auction auction = new Auction();
		// auction.setSeller(user.getId());
		auction.setNum(num);
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

		return "mypage/mySellList";
	}

	@RequestMapping(value = "confirmShipping", method = RequestMethod.POST)
	public String confirmShipping(int num, Model m) throws Exception {

		Auction myAuction = dbPro.getAuction(num);
		myAuction.setPstatus("거래종료");
		dbPro.updateAuctionStatus(myAuction);

		return "mypage/myPurchaseList";

	}

}
