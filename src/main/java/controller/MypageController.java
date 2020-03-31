

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
import model.Member;
import service.MybatisAuctionDao;
import service.MybatisCashDao;


@Controller
public class MypageController
{ 
	
    @Autowired
    MybatisAuctionDao dbPro;
    
    @Autowired
    MybatisCashDao cashDbPro;
    
    @RequestMapping(value = "mypage")
    public String mypage(Model m)
    {
        String id = "psw";
        int mycash = cashDbPro.myCash(id);
        m.addAttribute("mycash",mycash);
        return "mypage/mypage";
    }
       
    @RequestMapping(value = "bidList", method = RequestMethod.GET)
    public String myBidListGET(HttpServletRequest request)
    {
        HttpSession session = request.getSession();
        //String id = session.getId();
        String id = "psw";
        Member WinnerMemberInfo = dbPro.getWinnerMemberInfo(id);
        
        int currentPage = 1;
        
        try
        {
            currentPage = Integer.parseInt(request.getParameter("pageNum"));
            session.setAttribute("pageNum", currentPage);
        }
        catch (Exception e)
        {
            
            if (session.getAttribute("pageNum") == null) 
                session.setAttribute("pageNum", 1);
        }
        currentPage = (int) session.getAttribute("pageNum");
        
        int pageSize = 9;
        int startRow = (currentPage - 1) * pageSize + 1;
        int endRow = currentPage * pageSize;
        
        int count = dbPro.getMyBidCount(id);
        
        List<Auction> myBidList = dbPro.getMyBidList(startRow, endRow, id);
        
        
        
        int number = count - (currentPage - 1) * pageSize;
        int bottomLine = 3;
        int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
        int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
        int endPage = startPage + bottomLine - 1;
        
        if (endPage > pageCount) endPage = pageCount;
        
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("startRow", startRow);
        request.setAttribute("endRow", endRow);
        request.setAttribute("count", count);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("number", number);
        request.setAttribute("bottomLine", bottomLine);
        request.setAttribute("startPage", startPage);
        request.setAttribute("endPage", endPage);
        request.setAttribute("pageCount", pageCount);
        
        request.setAttribute("myBidList", myBidList);
        request.setAttribute("WinnerMemberInfo", WinnerMemberInfo);
        
        return "mypage/myBidList";
    }
    
 
    
    @RequestMapping(value = "myAuctionList", method = RequestMethod.GET)
    public String myAuctionList(HttpServletRequest request)
    {
        //한별언니가 할 수도 있어서 (회원기능이라) 비워뒀어요 -진희-
    	return "mypage/myAuctionList";
}
    
}