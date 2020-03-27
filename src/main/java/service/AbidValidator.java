package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import model.Abid;
import model.Auction;

public class AbidValidator implements Validator {
	 @Autowired
	    MybatisAuctionDao dbPro;
	 Auction auction;
	 
	@Override
	public boolean supports(Class<?> clazz) {
		return Abid.class.isAssignableFrom(clazz);
	}

	@SuppressWarnings("unused")
	@Override
	public void validate(Object target, Errors errors) {
	
		Abid regReq = (Abid) target;
		auction = dbPro.getAuction(regReq.getNum());
		int hprice = dbPro.gethightprice(regReq.getNum());
		
	
			if(hprice>regReq.getBidprice()){
				ValidationUtils.rejectIfEmptyOrWhitespace(errors, "bidprice", "smallprice");
			}
		
		
		if (regReq.getBidprice()%auction.getBidunit()!=0){
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "bidprice", "wrongunit");
		}
			
		Integer price=regReq.getBidprice();
		
		
		if (price==null)
			errors.rejectValue("bidprice", "required"); 
		
		
	}

}
