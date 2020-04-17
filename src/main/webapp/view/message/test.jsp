<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/message.css">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 댓글 템플릿 -->
<script id="reply-template" type="text/x-handlebars-template">
		{{#each .}}
			<li class="list-group-item" >
				<div class="timeline-item">
					<div class="media-left" style="margin-top: 10px; margin-right: 10px;">
						<a href="#">
							<img class="media-object" src="..." alt="IMG">
						</a>
					</div>
					<div class="media-body">
						
						<span class="time">
							<i class="fa fa-clock-o"></i> {{prettifyDate regdate}}
						</span>
					</div>
					<div class="timeline-boddy" style="margin-top: 10px; margin-bottom: 30px;">{{replytext}}</div>
					{{#eqReplywriter replywriter}}
						<div class="timeline-footer" style="margin-top: 10px">
							<button type="button" class="btn btn-info" data-toggle="modal" data-target="#replyModal">관리</button>
						</div>
					{{/eqReplywriter}}
				</div>
			</li>
		{{/each}}
	</script>

<!-- 댓글 달기 -->
<script>
	$(document).ready(function() {
		$("#sendBtn").click(function() {

			var id = '${user.id}';
			

			$.ajax({
				url : "${pageContext.request.contextPath}/id_check",
				type : "get",
				data : {
					id : '${user.id}'
				},
				dataType : "TEXT",
				success : function(result) {
					
				//	alert(result.list);
					
					
					$("#list").empty();

						$("#list").append('<div class="inbox_chat" id ="inbox_chat">' + result + '</div>');
						
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
		});
	});
</script>

<!-- 댓글 목록 불러오기 -->


<title>Insert title here</title>
</head>
<body>
	<div id="list"></div>


	<button class="sendBtn" id="sendBtn" type="button">전송</button>

</body>
</html>