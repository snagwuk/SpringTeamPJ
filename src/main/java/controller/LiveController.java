package controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.Auction;

import model.User;
import service.MybatisAuctionDao;

@Controller
public class LiveController
{
    
    @Autowired
    MybatisAuctionDao dbPro;
    
    private String liveId = null;
    
    private int livenum = 1;
    
    @RequestMapping(value = "startlive", method = RequestMethod.GET)
    public String startlive(HttpSession session, Model m)
    {
        int num = 1;
       /* User user = (User) session.getAttribute("user");
        if (liveId == null)
        {
            liveId = user.getId();
            livenum = num;
        }
        else
            return "main";*/
        
        Auction auction = dbPro.getAuction(livenum);
        m.addAttribute("auction", auction);
        int hprice = (int) dbPro.gethightprice(livenum);
        m.addAttribute("hprice", hprice);
        
        return "live/a";
    }
    
    @RequestMapping(value = "endlive", method = RequestMethod.GET)
    public String endlive() throws Exception
    {
        liveId = null;
        livenum = 0;
        return "redirect:/main";
    }
    
    @RequestMapping(value = "liveview", method = RequestMethod.GET)
    public String liveview(Model m) throws Exception
    {
        Auction auction = dbPro.getAuction(livenum);
        m.addAttribute("auction", auction);
        
        int hprice = (int) dbPro.gethightprice(livenum);
        m.addAttribute("hprice", hprice);
        
        return "live/b";
    }
    
}