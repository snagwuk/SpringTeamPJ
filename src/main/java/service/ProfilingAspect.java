package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import model.Amessage;
import model.Member;
import model.User;

@Aspect
public class ProfilingAspect {
	
@Autowired
MybatisMessageDao mePro;
	
	
@Pointcut("@annotation(org.springframework.web.bind.annotation.RequestMapping)")
private void profileTarget(){
	
}
@Around("profileTarget()")
public Object trace(ProceedingJoinPoint joinPoint) throws Throwable{
	
	String signatureString = joinPoint.getSignature().toString();
	System.out.println(signatureString+"시작");

	int unreadcount = 0;
	try{
		 HttpServletRequest request =((ServletRequestAttributes)RequestContextHolder
			      .getRequestAttributes()).getRequest();
			    HttpSession session = request.getSession(true);
		/*if(session.getAttribute("member")!=null){
			Member member= (Member) session.getAttribute("member");
			 Amessage me = new Amessage();
			 me.setReceiver(member.getId());
			 mePro.deleteintromessage(me);
			 unreadcount = mePro.getunreaccount(member.getId());}*/
	 if(session.getAttribute("user")!=null){
		User member= (User) session.getAttribute("user");
		 Amessage me = new Amessage();
		 me.setReceiver(member.getId());
		 mePro.deleteintromessage(me);
		 unreadcount = mePro.getunreaccount(member.getId());
	 
	
		 
	 
	 }	
		
		
	
		if(unreadcount==0){
			session.setAttribute("unreadcount", null);
		}else{
			 session.setAttribute("unreadcount", unreadcount);}
			
			 System.out.println(unreadcount);
		Object result = joinPoint.proceed();
		return result;
		
		}finally{
	
		System.out.println(signatureString+"종료");
		
	}

}
}