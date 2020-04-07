package controller;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.Cash;
import model.User;
import service.MybatisCashDao;

@Controller
public class CashController
{
    
    @Autowired
    MybatisCashDao dbPro;
    
    @RequestMapping(value = "charge", method = RequestMethod.GET)
    public String cash_chargeForm(HttpSession session, String winid, Model m)
    {
        User user = (User) session.getAttribute("user");
        int mycash = dbPro.myCash(user.getId());
        m.addAttribute("mycash", mycash);
        return "pay/charge";
    }
    
    @RequestMapping(value = "charge", method = RequestMethod.POST)
    public String cash_chargePro(Cash cash) throws Exception
    {
        cash.setCashdate(LocalDateTime.now());
        cash.setReason("캐쉬충전");
        dbPro.insertCash(cash);
        return "redirect:/mypage";
    }
    
    @RequestMapping(value = "withdraw", method = RequestMethod.GET)
    public String cash_withdrawForm(HttpSession session, Model m)
    {
        User user = (User) session.getAttribute("user");
        int mycash = dbPro.myCash(user.getId());
        m.addAttribute("mycash", mycash);
        return "pay/withdraw";
    }
    
    @RequestMapping(value = "withdraw", method = RequestMethod.POST)
    public String cash_withdrawPro(Cash cash) throws Exception
    {
        cash.setCashdate(LocalDateTime.now());
        cash.setReason("캐쉬출금");
        cash.setCash(0 - cash.getCash());
        dbPro.insertCash(cash);
        return "redirect:/mypage";
    }
    
    @RequestMapping(value = "cashlist", method = RequestMethod.GET)
    public String cash_cashlist(HttpSession session, Model m)
    {
        User user = (User) session.getAttribute("user");
        int mycash = dbPro.myCash(user.getId());
        m.addAttribute("mycash", mycash);
        int count = dbPro.getMyCashCount(user.getId());
        m.addAttribute("count", count);
        if(count != 0)
        {
            List<Cash> cashlist = dbPro.getMyCashList(user.getId());
            m.addAttribute("cashlist", cashlist);
        }
        return "pay/cashlist";
    }
    
    @RequestMapping(value = "cashchecklist", method = RequestMethod.GET)
    public String cash_cashchecklist(HttpSession session, Model m)
    {
        User user = (User) session.getAttribute("user");
        if(!user.getPosition().equals("관리자"))
            return "redirect:/main";
        List<Cash> cashchecklist = dbPro.getCashCheckList();
        m.addAttribute("cashchecklist", cashchecklist);
        return "pay/cashcheck";
    }
    
    @RequestMapping(value = "cashcheck", method = RequestMethod.GET)
    public String cash_cashcheck(int cnum, int cstatus, HttpSession session, Model m) throws Exception
    {
        User user = (User) session.getAttribute("user");
        if(!user.getPosition().equals("관리자"))
            return "redirect:/main";
        Cash cash = dbPro.getCashCnum(cnum);
        cash.setCstatus(cstatus);
        dbPro.adminCheck(cash);
        return "redirect:/cashchecklist";
    }
    
}