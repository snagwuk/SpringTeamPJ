
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
import service.MybatisAuctionDao;
import service.MybatisCashDao;

@Controller
public class PayController {

	@Autowired
	MybatisAuctionDao dbPro;

	@Autowired
	MybatisCashDao cashPro;

	@RequestMapping(value = "pay", method = RequestMethod.GET)
	public String payGET(Model m) {

		Auction temp = new Auction();
		temp.setNum(2);
	
		Auction myAuction = dbPro.getMyAuction(temp);
		m.addAttribute("myAuction", myAuction);

		int cash = cashPro.myCash(myAuction.getWinid());
		m.addAttribute("cash", cash);

		int myBalance = cash - myAuction.getBeginsprice();
		m.addAttribute("myBalance", myBalance); // 결제후 잔액구하기

		return "pay/pay";
	}

	@RequestMapping(value = "pay", method = RequestMethod.POST)
	public String payPOST(int num) throws Exception {

		Auction temp = new Auction();
		temp.setNum(num);
		Auction myAuction = dbPro.getMyAuction(temp);
		
		System.out.println("aaaaaaaaaaaaa"+myAuction);
		Cash cash = new Cash();
		cash.setId(myAuction.getWinid());
		
		cash.setCash((myAuction.getBeginsprice()) * -1);
		cash.setCashdate(LocalDateTime.now());
		cash.setReason(myAuction.getNum() + "번 경매물품 대금 결제");
		cashPro.insertCash(cash); 
		
		myAuction.setPstatus("입금완료");
		dbPro.updateContent(myAuction); // 상품 상태 "입금완료" 로 변경
		
	
		return "pay/paySuccess";
	}

}