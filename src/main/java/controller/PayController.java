
package controller;

import java.io.FileOutputStream;
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

@Controller
public class PayController {

	@Autowired
	MybatisAuctionDao dbPro;

	@RequestMapping(value = "pay", method = RequestMethod.GET)
	public String payGET(int num, Model m) {
		Auction auction = dbPro.getAuction(num);
		m.addAttribute("auction", auction);

		return "content";
	}
	
	
	
	@RequestMapping(value = "pay", method = RequestMethod.POST)
    public String payPOST(Cash cash) throws Exception { //�Ա��ϱ� ��������
	//�Ա��ϱ� �������� �� ĳ�� ����, �Ǹ��� ĳ�� �ö�, �Ա�Ȯ�� ���·� ����, ���� ��ġ�ؾ߸� �Ѿ��
       dbPro.updateCash(cash);

       return "paySuccess";
    }

}