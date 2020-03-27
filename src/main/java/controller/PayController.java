
package controller;

import java.io.FileOutputStream;
import java.time.LocalDateTime;
import java.util.List;
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
	public String payGET(int num, Model m) {
		Auction auction = dbPro.getAuction(num);
		m.addAttribute("auction", auction);

		return "content";
	}
	
	
	
	@RequestMapping(value = "pay", method = RequestMethod.POST)
    public String payPOST(Cash cash, Auction auction, HttpServletRequest request) throws Exception { //�Ա��ϱ� ��������
	//돈 일치 할때만
		
		HttpSession session = request.getSession();
		
		cash.setId(session.getId());
		cash.setCash((cash.getCash())*-1);
		cash.setCashdate(LocalDateTime.now());
        cash.setReason("입금");        
		cashPro.insertCash(cash); //구매자 캐시 증가

		auction.setPstatus("입금완료");		
		dbPro.updateContent(auction); //상품 상태 "입금완료" 로 변경
		
       return "paySuccess";
    }

	
	
}