<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->


<html>
<head>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/message.css">



<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script type="text/javascript">

   var wsocket;

   function connect() {
      wsocket = new SockJS("http://121.135.204.130:8080/SpringTeamPJ/chat.sockjs");
      wsocket.onopen = onOpen;
      wsocket.onmessage = onMessage;
      wsocket.onclose = onClose;

   }
   function disconnect() {
      wsocket.close();
   }
   function onOpen(evt) {

   }
   function onMessage(evt) {

      var data = evt.data;
      console.log(data)
      var obj = JSON.parse(data)
      console.log(obj)
      appendMessage(obj)

//       if (data.substring(0, 4) == "content:") {
//          appendMessage(data.substring(4));
//       }
   }
   function onClose(evt) {
      appendMessage("연결을 끊었습니다.");
   }

   function send() {
      var nickname = $("#nickname").val();
      var msg = $("#message").val();

      if(msg != ""){
    	  message = {};
    	  message.num = '${num}'
      	  message.sender = '${user.id}'
      	  message.receiver = $("#receiver").val()
      	  message.content = $("#message").val()

      }


//       wsocket.send("msg:"+nickname+":" + msg);
      wsocket.send(JSON.stringify(message));

      $("#message").val("");
   }

   function appendMessage(msg) {

	var num = ${num};
	var sender = '${user.id}';
	   var nowtime = getTimeStamp();
	if (msg.num!=num)
		{ $("#chatMessageArea").append("")}else{
	   if(msg.receiver!=sender){
		   msgajax();
		    $("#chatMessageArea").append("<div class="+"outgoing_msg"+">"+
		              "<div class="+"sent_msg"+">"+
		      "<p>"+msg.content+"</p>"+
		      "<span class="+"time_date"+">"+nowtime+"</span></div></div>");
	   }
	   if(msg.receiver==sender){
		   msgajax();
		   if(msg.sender.equals("admin")){
			   $("#chatMessageArea").append(
					   "<div class="+"incoming_msg"+"><div class="+"incoming_msg_img"+">"+
			             "<img src="+"https://ptetutorials.com/images/user-profile.png"+" alt="+"sunil"+"> </div><div class="+"received_msg"+"><p>"
			             +"갬성마켓"+"</p><div class="+"received_withd_msg"+">"+
			                 "<p>"+msg.content+"</p>"+
			                 "<span class="+"time_date"+">"+nowtime+"</span></div></div></div>");
		   }else{
		   $("#chatMessageArea").append(
				   "<div class="+"incoming_msg"+"><div class="+"incoming_msg_img"+">"+
		             "<img src="+"https://ptetutorials.com/images/user-profile.png"+" alt="+"sunil"+"> </div><div class="+"received_msg"+"><p>"
		             +msg.sender+"</p><div class="+"received_withd_msg"+">"+
		                 "<p>"+msg.content+"</p>"+
		                 "<span class="+"time_date"+">"+nowtime+"</span></div></div></div>");
		   }

	   }

	   $("#chatMessageArea").scrollTop($("#chatMessageArea")[0].scrollHeight);
	 }


     /*  var chatAreaHeight = $("#chatArea").height();
      var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
      $("#chatArea").scrollTop(maxScroll); */
   }

   $(document).ready(function() {
	   $('#chatMessageArea').scrollTop($('#chatMessageArea').prop('scrollHeight'));


	   msgajax();

	   connect();

      $('#message').keypress(function(event){
         var keycode = (event.keyCode ? event.keyCode : event.which);
         if(keycode == '13'){
            send();

         }
         event.stopPropagation();

      });
      $('#sendBtn').click(function() { send(); });

   });


   function getTimeStamp() {
	   var d = new Date();
	   var s =
	     leadingZeros(d.getFullYear(), 4) + '-' +
	     leadingZeros(d.getMonth() + 1, 2) + '-' +
	     leadingZeros(d.getDate(), 2) + ' ' +

	     leadingZeros(d.getHours(), 2) + ':' +
	     leadingZeros(d.getMinutes(), 2) + ':' +
	     leadingZeros(d.getSeconds(), 2);

	   return s;
	 }

	 function leadingZeros(n, digits) {
	   var zero = '';
	   n = n.toString();

	   if (n.length < digits) {
	     for (i = 0; i < digits - n.length; i++)
	       zero += '0';
	   }
	   return zero + n;
	 }

	 function msgajax() {





			$.ajax({
				url : "${pageContext.request.contextPath}/updatemessage",
				type : "get",
				data : {
					id : '${user.id}',
					num : '${num}'
				},
				dataType : "TEXT",
				success : function(result) {

				//	alert(result.list);



						$("#inbox_chat").empty();
						$("#inbox_chat").append('<div>' + result + '</div>');

					/* 	 $("#list").append(
								"<p>"+result+"</p>"
						 );
					 */

				}, error : function(x, t, e){
					alert("실패ㅜㅜ"+x.status);
					alert("실패ㅜㅜ"+t);
					alert("실패ㅜㅜ"+e);
				}
			});


	 }


</script>

<script type="text/javascript">
window.opener.location.reload();


function change(){
	var btnContainer = document.getElementById("chat");


	var btns = btnContainer.getElementsByClassName("chat_list");

	// Loop through the buttons and add the active class to the current/clicked button
	for (var i = 0; i < btns.length; i++) {
	  btns[i].addEventListener("click", function() {
	    var current = document.getElementsByClassName("active_chat");
	    current[0].className = current[0].className.replace(" active_chat", "");
	    this.className += " active_chat";
	  });
	}
}
</script>
</head>
<body>
<div class="container">
<h3 class=" text-center">메시지함</h3>
<div class="messaging">
      <div class="inbox_msg">
        <div class="inbox_people">
          <div class="headind_srch">
            <div class="recent_heading">
              <h4>Recent</h4>
            </div>
            <div class="srch_bar">
              <div class="stylish-input-group">
                <input type="text" class="search-bar"  placeholder="Search" >
                <span class="input-group-addon">
                <button type="button"> <i class="fa fa-search" aria-hidden="true"></i> </button>
                </span> </div>
            </div>
          </div>
          <div class="inbox_chat" id ="inbox_chat" >
          <%-- <c:if test="${!messagelist.isEmpty()}">
          <c:forEach var="messages" items="${messagelist}">
          <div  id = "chat" >
          <div class="chat_list" >

              <div class="chat_people">
                <div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
               <a href="mslist?num=${messages.num}" onclick="msgajax();">
                <div class="chat_ib" >
                <c:if test="${messages.sender==user.id}">
                  <h5>${messages.receiver}</h5>
                  </c:if>
                  <c:if test="${messages.sender!=user.id}">
                  <h5>${messages.sender}</h5>
                  </c:if>
                  <span class="chat_date">${messages.sendtime}</span>
                  <c:if test="${messages.unreadcount!=0}">
                  <span class="step">${messages.unreadcount}</span>
                   </c:if></h5>
                  <p>${messages.content}</p>

                </div>
                </a>
              </div>
            </div>
            </div>
          </c:forEach>
          </c:if>  --%>

          </div>
        </div>
<!--         <div> -->
<!--         <div class="mesgs" id ="chatArea"> -->
<!--           <div class="msg_history" id = "chatMessageArea"> -->
        <div>
		<div class="mesgs"id = "chatArea" style=" overflow: auto;">

			<div class="msg_history" id="chatMessageArea" style="height: 600px;" >

            <c:if test="${!allList.isEmpty()}">

            	<c:forEach var="list" items="${allList}">


             <c:if test="${num!=null}">
                  <input type="hidden" value="${num}" id= "chatnum">
                  </c:if>
                     <c:if test="${num==null}">
                  <input type="hidden" value="null" id= "chatnum">
                  </c:if>
            <c:if test="${list.receiver==user.id}">
              <input type="hidden" value="${list.sender}" id= "receiver">
            <div class="incoming_msg">
              <div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
              <div class="received_msg">
              <c:choose>
               <c:when test="${list.sender eq 'admin@naver.com'}">
                   <p>갬성마켓</p>
                  </c:when>
                  <c:otherwise>
             <p>${list.sender}</p>
             </c:otherwise>
             </c:choose>
                <div class="received_withd_msg">
                  <p>${list.content}</p>
                  <span class="time_date">
                    <fmt:formatDate value="${list.sendtime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                </span></div>
              </div>
            </div>
            </c:if>
            <c:if test="${list.receiver!=user.id}">
             <input type="hidden" value="${list.receiver}" id= "receiver">
            <div class="outgoing_msg">
              <div class="sent_msg">
                <p>${list.content}</p>
                <span class="time_date">  <fmt:formatDate value="${list.sendtime}" pattern="yyyy-MM-dd HH:mm:ss"/></span> </div>
            </div>
            </c:if>
            </c:forEach>



 <%--
            <div class="incoming_msg">
              <div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
              <div class="received_msg">
       <span id = "nickname" value = "${list.receiver}"></span>
                <div class="received_withd_msg">
                  <p></p>
                  <span class="time_date"></span></div>
              </div>
            </div>


            <div class="outgoing_msg">
              <div class="sent_msg">
                <p></p>
                <span class="time_date"></span> </div>
            </div> --%>




          </div>
          <div class="type_msg">
            <div class="input_msg_write">
            <input type="hidden" value="${user.id}" id= "nickname">

              <input type="text" class="write_msg" placeholder="Type a message" id="message">
              <button class="msg_send_btn" id="sendBtn" type="button"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></button>
            </div>
          </div>
        </div>
        </div>
      </div>

   </c:if>
    </div></div>
    </body>
    </html>
