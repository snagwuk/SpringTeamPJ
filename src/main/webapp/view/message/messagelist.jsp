<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->


<html>
<head>

<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet">

<style type="text/css">
.container{max-width:1170px; margin:auto;}
img{ max-width:100%;}
.inbox_people {
  background: #f8f8f8 none repeat scroll 0 0;
  float: left;
  overflow: hidden;
  width: 40%; border-right:1px solid #c4c4c4;
}
.inbox_msg {
  border: 1px solid #c4c4c4;
  clear: both;
  overflow: hidden;
}
.top_spac{ margin: 20px 0 0;}


.recent_heading {float: left; width:40%;}
.srch_bar {
  display: inline-block;
  text-align: right;
  width: 60%; padding:
}
.headind_srch{ padding:10px 29px 10px 20px; overflow:hidden; border-bottom:1px solid #c4c4c4;}

.recent_heading h4 {
  color: #05728f;
  font-size: 21px;
  margin: auto;
}
.srch_bar input{ border:1px solid #cdcdcd; border-width:0 0 1px 0; width:80%; padding:2px 0 4px 6px; background:none;}
.srch_bar .input-group-addon button {
  background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
  border: medium none;
  padding: 0;
  color: #707070;
  font-size: 18px;
}
.srch_bar .input-group-addon { margin: 0 0 0 -27px;}

.chat_ib h5{ font-size:15px; color:#464646; margin:0 0 8px 0;}
.chat_ib h5 span{ font-size:13px; float:right;}
.chat_ib p{ font-size:14px; color:#989898; margin:auto}
.chat_img {
  float: left;
  width: 11%;
}
.chat_ib {
  float: left;
  padding: 0 0 0 15px;
  width: 88%;
}

.chat_people{ overflow:hidden; clear:both;}
.chat_list {
  border-bottom: 1px solid #c4c4c4;
  margin: 0;
  padding: 18px 16px 10px;
}
.inbox_chat { height: 550px; overflow-y: scroll;}

.active_chat{ background:#ebebeb;}

.incoming_msg_img {
  display: inline-block;
  width: 6%;
}
.received_msg {
  display: inline-block;
  padding: 0 0 0 10px;
  vertical-align: top;
  width: 92%;
 }
 .received_withd_msg p {
  background: #ebebeb none repeat scroll 0 0;
  border-radius: 3px;
  color: #646464;
  font-size: 14px;
  margin: 0;
  padding: 5px 10px 5px 12px;
  width: 100%;
}
.time_date {
  color: #747474;
  display: block;
  font-size: 12px;
  margin: 8px 0 0;
}
.received_withd_msg { width: 57%;}
.mesgs {
  float: left;
  padding: 30px 15px 0 25px;
  width: 60%;
  overflow:scroll;
}

 .sent_msg p {
  background: #05728f none repeat scroll 0 0;
  border-radius: 3px;
  font-size: 14px;
  margin: 0; color:#fff;
  padding: 5px 10px 5px 12px;
  width:100%;
}
.outgoing_msg{ overflow:hidden; margin:26px 0 26px;}
.sent_msg {
  float: right;
  width: 46%;
}
.input_msg_write input {
  background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
  border: medium none;
  color: #4c4c4c;
  font-size: 15px;
  min-height: 48px;
  width: 100%;
}

.type_msg {border-top: 1px solid #c4c4c4;position: relative;}
.msg_send_btn {
  background: #05728f none repeat scroll 0 0;
  border: medium none;
  border-radius: 50%;
  color: #fff;
  cursor: pointer;
  font-size: 17px;
  height: 33px;
  position: absolute;
  right: 0;
  top: 11px;
  width: 33px;
}
.messaging { padding: 0 0 50px 0;}
.msg_history {
/*   height: 516px; */
  overflow-y: auto;
}

span.step {
 margin-left : 25%;
  background: #cccccc;
  border-radius: 0.8em;
  -moz-border-radius: 0.8em;
  -webkit-border-radius: 0.8em;
  color: #ffffff;
  display: inline-block;
  font-weight: bold;
  line-height: 1.6em;
  margin-right: 5px;
  text-align: center;
  width: 1.6em; 
}

</style>

<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script type="text/javascript">

   var wsocket;
   
   function connect() {
      wsocket = new SockJS("http://211.63.89.93:8080/SpringTeamPJ/chat.sockjs");
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
		    $("#chatMessageArea").append("<div class="+"outgoing_msg"+">"+
		              "<div class="+"sent_msg"+">"+
		      "<p>"+msg.content+"</p>"+
		      "<span class="+"time_date"+">"+nowtime+"</span></div></div>");
	   } 
	   if(msg.receiver==sender){
		   
		   $("#chatMessageArea").append(
				   "<div class="+"incoming_msg"+"><div class="+"incoming_msg_img"+">"+ 
		             "<img src="+"https://ptetutorials.com/images/user-profile.png"+" alt="+"sunil"+"> </div><div class="+"received_msg"+"><p>"
		             +msg.sender+"</p><div class="+"received_withd_msg"+">"+
		                 "<p>"+msg.content+"</p>"+
		                 "<span class="+"time_date"+">"+nowtime+"</span></div></div></div>");
		   
  
	   }
	   
	   $("#chatMessageArea").scrollTop($("#chatMessageArea")[0].scrollHeight);
	 } 
      
      
     /*  var chatAreaHeight = $("#chatArea").height();
      var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
      $("#chatArea").scrollTop(maxScroll); */
   }

   $(document).ready(function() {
	   $('#chatMessageArea').scrollTop($('#chatMessageArea').prop('scrollHeight'));




	   
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
          <c:if test="${!messagelist.isEmpty()}">
          <c:forEach var="messages" items="${messagelist}">
          <div  id = "chat" >
          <div class="chat_list" onclick="change()" >
      
              <div class="chat_people">
                <div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
               <a href="mslist?num=${messages.num}">
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
          </c:if>
 
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
             <p>${list.sender}</p>
                <div class="received_withd_msg">
                  <p>${list.content}</p>
                  <span class="time_date"> ${list.sendtime}</span></div>
              </div>
            </div>
            </c:if>
            <c:if test="${list.receiver!=user.id}">
             <input type="hidden" value="${list.receiver}" id= "receiver">
            <div class="outgoing_msg">
              <div class="sent_msg">
                <p>${list.content}</p>
                <span class="time_date"> ${list.sendtime}</span> </div>
            </div>
            </c:if>
            </c:forEach>
            </c:if>
            
          
          
          
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
      
    
    </div></div>
    </body>
    </html>