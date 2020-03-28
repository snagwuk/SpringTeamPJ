package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import model.Bid;

@Component
public class BidValidator implements Validator {
	@Autowired 
	MybatisAuctionDao dbPro; 
	 
	@Override
	public boolean supports(Class<?> clazz) {
		return Bid.class.isAssignableFrom(clazz);}

	
	@Override
	public void validate(Object target, Errors errors) {
		
		Bid regReq = (Bid) target;
		System.out.println(regReq);
		int num =regReq.getNum();
		System.out.println(num);
		
		
		 int hprice = (int)dbPro.gethightprice(num);
		System.out.println(hprice);
		int bidunit = (int)dbPro.getbidunit(num);
	
		if (regReq.getBidprice()==0){
			errors.rejectValue( "bidprice", "inputprice");
		}
			if(hprice>=regReq.getBidprice()){
				errors.rejectValue("bidprice", "smallprice");
			}
		
		
		if (regReq.getBidprice()%bidunit!=0){
			errors.rejectValue( "bidprice", "wrongunit");
		}
		
		
		
		
		 
		
		
	}

}
