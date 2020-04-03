

package controller;

import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import model.Auction;
import model.Bid;
import service.BidValidator;
import service.MybatisAuctionDao;


@Controller
public class AuctionController
{ 
	
 @Autowired
    MybatisAuctionDao dbPro;
 
 @Autowired
 BidValidator bidvalidator;
 
 
 @InitBinder("bid")
	protected void initBinder(WebDataBinder binder) {
		binder.addValidators(bidvalidator);
	}

    
       
    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String auction_listGET(HttpServletRequest request)
    {
        HttpSession session = request.getSession();
        
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
        
        int count = dbPro.getAuctionCount();
        
        List<Auction> auctionList = dbPro.getAuctions(startRow, endRow);
        
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
        
        request.setAttribute("auctionList", auctionList);
        
        return "auction/list";
    }
    
    @RequestMapping(value = "write", method = RequestMethod.GET)
    public String auction_writeForm(Auction auction)
    {
        return "auction/writeForm";
    }
    
    @RequestMapping(value = "write", method = RequestMethod.POST)
   public String auction_writePro(MultipartHttpServletRequest multipart, Auction auction) throws Exception {

      MultipartFile multi = multipart.getFile("uploadfile");
      
      String filename = multi.getOriginalFilename();
      if (filename != null && !filename.equals("")) {
         String uploadPath = multipart.getRealPath("/") + "/uploadFile";
         System.out.println(uploadPath);

         FileCopyUtils.copy(multi.getInputStream(),
               new FileOutputStream(uploadPath + "/" + multi.getOriginalFilename()));

         auction.setFilename(filename);
         auction.setFilesize((int) multi.getSize());
      } else {
         auction.setFilename("");
         auction.setFilesize(0);
      }
      
      dbPro.insertauction(auction);
      return "redirect:/list";
   }
    
    @RequestMapping(value = "content", method = RequestMethod.GET)
    public String auction_content(int num, Model m)
    {
            Auction auction = dbPro.getAuction(num);
            m.addAttribute("auction", auction);

            return "auction/content";
        
    }
    
    @RequestMapping("modify")
    public String auction_modifyForm(int num, Model m) {
    
       Auction auction = dbPro.getAuction(num);
       m.addAttribute("auction", auction);

       return "auction/modify";
    }

    @RequestMapping(value = "modify", method = RequestMethod.POST)
    public String auction_modifyPro(Auction auction) throws Exception {
       
       dbPro.updateContent(auction);
       System.out.println(auction);

       return "redirect:/content?num=" + auction.getNum();
    }
    
   @RequestMapping(value = "delete")
    public String auction_delete(int num)
    {
        dbPro.deleteAuction(num);
        return "redirect:/list";
    }
//지은
   @RequestMapping(value = "bidding", method = RequestMethod.GET)
   public String auction_bidding(int num, Model m)
   {
          
	   int hprice = (int)dbPro.gethightprice(num);
	  Auction auction = dbPro.getAuction(num);
	   List<Bid> bidlist = dbPro.getbidlist(num);
          SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
          
          m.addAttribute("sf",sf);
           m.addAttribute("hprice",hprice);
           m.addAttribute("unit",auction.getBidunit());
           m.addAttribute("bidlist", bidlist);
           m.addAttribute("num", num);
           m.addAttribute("bid", new Bid());
           return "bidlist";
       
   }
   
   
   @RequestMapping(value = "bidding", method = RequestMethod.POST )
   public String auction_bidding(
			@ModelAttribute("bid") Bid bid,
			BindingResult bindingResult,Model m) {
	   bidvalidator.validate(bid, bindingResult);
		if (bindingResult.hasErrors()) {
			 Auction auction = dbPro.getAuction(bid.getNum());
			int hprice = (int)dbPro.gethightprice(bid.getNum());
			   List<Bid> bidlist = dbPro.getbidlist(bid.getNum());
		          SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		       m.addAttribute("unit",auction.getBidunit());
		       m.addAttribute("sf",sf);
	           m.addAttribute("hprice",hprice);
	           m.addAttribute("bidlist", bidlist);
	           m.addAttribute("num", bid.getNum());
			 
		          
	           
			System.out.println("error");
			return "bidlist";
		}
		dbPro.insertbid(bid);
		return "redirect:/bidding?num=" + bid.getNum();
   }
   

 /*@RequestMapping(value = "bidding", method = RequestMethod.POST )
   public String auction_bidding(
			@ModelAttribute("bid") Bid bid) {
		
		dbPro.insertbid(bid);
		return "redirect:/bidding?num=" + bid.getNum();
 }*/
   
   
   
   
   
   @RequestMapping(value = "sellerstore", method = RequestMethod.GET)
   public String sellerstore(HttpServletRequest request)
   {
       HttpSession session = request.getSession();
       
       int currentPage = 1;
       String id = request.getParameter("seller");
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
       
       int count = dbPro.getAuctionCount();
       
       List<Auction> auctionList = dbPro.getsellerstore(startRow, endRow,id);
       
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
       
       request.setAttribute("auctionList", auctionList);
       request.setAttribute("seller", id);
       return "list";
   }

   
   
}