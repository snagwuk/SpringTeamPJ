
package controller;

import java.io.FileOutputStream;
import java.time.LocalDateTime;
import java.util.List;

import javax.security.auth.login.AccountException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
	public String payGET(HttpServletRequest req, Model m) {
		User user = (User) req.getSession().getAttribute("user");

		Auction auction = new Auction();
		auction.setWinid(user.getId());
		auction.setNum(6);

		Auction myBidCompleteAuction = dbPro.getMyBidCompleteAuction(auction);
		m.addAttribute("myBidCompleteAuction", myBidCompleteAuction);

		int cash = cashPro.myCash(user.getId());
		m.addAttribute("cash", cash);

		int myBalance = cash - myBidCompleteAuction.getBeginsprice();
		m.addAttribute("myBalance", myBalance); // 결제후 잔액구하기

		return "pay/pay";
	}

	@RequestMapping(value = "pay", method = RequestMethod.POST)
	public String payPOST(HttpServletRequest req, int num) throws Exception {

		User user = (User) req.getSession().getAttribute("user");

		Auction auction = new Auction();
		auction.setNum(num);
		Auction myAuction = dbPro.getMyAuction(auction);

		Cash cash = new Cash();
		cash.setId(user.getId());
		cash.setCash((myAuction.getBeginsprice()) * -1);
		cash.setCashdate(LocalDateTime.now());
		cash.setReason(myAuction.getNum() + "번 경매물품 대금 결제");
		cashPro.insertCash(cash);

		myAuction.setPstatus("입금완료");
		dbPro.updateContent(myAuction); // 상품 상태 "입금완료" 로 변경

		return "pay/paySuccess";
	}
	
	@RequestMapping(value = "shipping", method = RequestMethod.GET)
	public String shippingInfo(String winid, int num, Model m) {
		
		Auction auction = new Auction();
		auction.setWinid(winid);
		auction.setNum(num);//여기서 num을 못 가져옴
		Auction myAuction = dbPro.getMyAuction(auction);
		m.addAttribute("myAuction", myAuction);	
		
		Member member = memPro.getMemberinfo(winid); //낙찰자 배송정보 가져오기
		m.addAttribute("member", member);	
		
		return "pay/shippingInfo";
		
		
	}

}