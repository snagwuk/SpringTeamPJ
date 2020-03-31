package controller;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import service.MybatisReviewDao;



@Controller
public class ReviewController
{
    
    @Autowired
    MybatisReviewDao dbPro;
    
    @RequestMapping(value = "charge", method = RequestMethod.GET)
    public String cash_chargeForm(Model m)
    {
        String id = "psw";
        int mycash = dbPro.myCash(id);
        m.addAttribute("mycash", mycash);
        return "pay/charge";
    }
    
    @RequestMapping(value = "charge", method = RequestMethod.POST)
    public String cash_chargePro(Cash cash) throws Exception
    {
        cash.setCashdate(LocalDateTime.now());
        cash.setReason("캐쉬충전");
        System.out.println(cash);
        dbPro.insertCash(cash);
        return "redirect:/mypage";
    }
    
    @RequestMapping(value = "withdraw", method = RequestMethod.GET)
    public String cash_withdrawForm(Model m)
    {
        // id
        String id = "psw";
        int mycash = dbPro.myCash(id);
        m.addAttribute("mycash", mycash);
        return "pay/withdraw";
    }
    
    @RequestMapping(value = "withdraw", method = RequestMethod.POST)
    public String cash_withdrawPro(Cash cash) throws Exception
    {

        cash.setCashdate(LocalDateTime.now());
        cash.setReason("캐쉬출금");
        int minuscash = 0 - cash.getCash();
        cash.setCash(minuscash);
        System.out.println(cash);
        dbPro.insertCash(cash);
        return "redirect:/mypage";
    }
    
    @RequestMapping(value = "cashlist", method = RequestMethod.GET)
    public String cash_cashlist(Model m)
    {

        // id
        String id = "psw";
        
        int mycash = dbPro.myCash(id);
        m.addAttribute("mycash", mycash);
        
        int count = dbPro.getMyCashCount(id);
        m.addAttribute("count", count);
        
        System.out.println(count);
        if(count != 0)
        {
            List<Cash> cashlist = dbPro.getMyCashList(id);
            m.addAttribute("cashlist", cashlist);
        }

        return "pay/cashlist";
    }
    
    
}