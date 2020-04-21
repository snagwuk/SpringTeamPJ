package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import model.Category;
import service.MybatisCategoryDao;



@Controller
public class CategoryController {

	
	
    @Autowired
    MybatisCategoryDao dbPro;
	
	 @RequestMapping(value = "category", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	   public String idCheck(HttpServletRequest request,Model m) {

		    HashMap<Object, Object> map = new HashMap<Object, Object>();
	      int num = Integer.parseInt(request.getParameter("num"));
	      Category c = new Category();
	      c.setRefnum(num);
	      List<Category> category = dbPro.selectsecond(c);

	     m.addAttribute("category",category);
	      
	 
	      return "message/writeajax";
	   }
	
	
}
