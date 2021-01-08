<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>예약신청</title>
	
	<!-- 제이쿼리를 사용하기 위한 라이브러리 -->
	<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
	
	<!-- fullcalendar 라이브러리 -->
	<link href='resources/packages/core/main.css' rel='stylesheet' />
	<link href='resources/packages/daygrid/main.css' rel='stylesheet' />
	<link href='resources/packages/timegrid/main.css' rel='stylesheet' />
	<link href='resources/packages/list/main.css' rel='stylesheet' />
	<script src='resources/packages/core/main.js'></script>
	<script src='resources/packages/interaction/main.js'></script>
	<script src='resources/packages/daygrid/main.js'></script>
	<script src='resources/packages/timegrid/main.js'></script>
	<script src='resources/packages/list/main.js'></script>
	<script src='resources/packages/moment/main.js'></script>
	
	<link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="resources/css/style-css.css" rel="stylesheet" type="text/css">
  	
	<script>
	// 날짜 포맷 yyyy-mm-dd HH:mm
	  function formatDate(date) { 
	  	var d = new Date(date), month = '' + (d.getMonth() + 1), day = '' + d.getDate(), year = d.getFullYear(), hour = d.getHours().toString(), minute = d.getMinutes().toString(); 
	  	if (month.length < 2) month = '0' + month; if (day.length < 2) day = '0' + day; 
	  	if(hour.length < 2) hour = '0' + hour; if(minute.length < 2) minute = minute + '0';
	  	var date = [year,month,day].join('-'); // 날짜
	  	var time = [hour,minute].join(':'); // 시간
	  		return date+" "+time;
	  	
	  }
	  	
	document.addEventListener('DOMContentLoaded', function() {
		
	  var dataset = [
		<c:forEach var="rlist" items="${rlist}" varStatus="status">
			{"id":'<c:out value="${rlist.id}" />'
			,"title":'<c:out value="${rlist.title}" />'    
			,"start":'<c:out value="${rlist.res_date}"/>'+'T'+'<c:out value="${rlist.start_time}" />'
			,"end":'<c:out value="${rlist.res_date}"/>'+'T'+'<c:out value="${rlist.end_time}" />'
			,"color":'<c:out value="${rlist.color}" />'
			},
				
		</c:forEach>
	  ];
	  	
	 var modal = document.getElementById('myModal'); // 모달창 - 예약
	 var modal2 = document.getElementById('res_modal'); // 모달창 - 예약 상세내용
	 var close = document.getElementsByClassName("close")[0]; // 닫기창 - 예약
	 var close2 = document.getElementsByClassName("close")[1]; // 닫기창 - 예약 상세내용
	 var close_button = document.getElementsByClassName("btn btn-secondary")[0]; // close버튼 - 예약
	 var close_button2 = document.getElementsByClassName("btn btn-secondary")[1]; // close버튼 - 예약 상세내용
	  	
	 var calendarEl = document.getElementById('calendar');
		
	 var calendar = new FullCalendar.Calendar(calendarEl, {
			  plugins: ['interaction','interactionPlugin','dayGrid','timeGrid' ],
			  header: {
			        left: 'prev,next today',
			        center: 'title',
			        right: 'dayGridMonth,timeGridWeek,timeGridDay'
			      },
			  defaultView: 'timeGridWeek',
			  locale : "ko",
			  selectable: true,
			  navLinks:true,
		      select: function(info) {
				var start_time = info.startStr.substring(11,16); // 시작 시간
				var end_time = info.endStr.substring(11,16); // 끝 시간
				
				var d = info.startStr.substring(0,10); // 날짜 가져오기
				var str2arr = d.split("-");
				var s_date_obj = new Date(str2arr[0], str2arr[1] - 1, str2arr[2]);
				var s_year = s_date_obj.getFullYear(); // 선택된 날짜 연도
				var s_month = s_date_obj.getMonth() + 1; // 선택된 날짜 월
				var s_day = s_date_obj.getDate(); // 선택된 날짜 일
				if(s_month < 10) s_month = '0' + s_month; // 10월 보다 작은 월에 0을 붙혀주기 위함
				if(s_day < 10) s_day = '0' + s_day; // 10일 보다 작은 일에 0을 붙혀주기 위함
				
			    $.ajax({
				    type : "post", //송신 데이터타입
				    url : "date",
				    data : {year:s_year, month:s_month, day:s_day},
				    success : function(data){
				    	$('#res_date').val(data);
				    }
				});
	
			    	$("#start_time").val(start_time);
			    	$("#end_time").val(end_time);
			    	modal.style.display = "block";   
	     
		        },
		        timeFormat: 'H(:mm)',
		        events : dataset,
		        eventClick:function(info){
		        	//info.jsEvent.preventDefault();
		        	
		        	$('#res_modal').show();
		        	$('#res_modal .modal-body .res_id').text(info.event.id);
		        	$('#res_modal .modal-body .res_title').text(info.event.title);
		        	$('#res_modal .modal-body .res_date').text(formatDate(info.event.start) + ' ~ ' + formatDate(info.event.end));
		        	
					
					/* var id = info.event.id;
					var r1 = info.event.r1;
					var r2 = info.event.r2;
					var title = info.event.title;
					var res_date = info.event.start.substring(0,10);
					$.ajax({
			    		type : "post", //송신 데이터타입
			    		url : "reservation_detail",
			    		data : {id:id, r1:r1, r2:r2, title:title, res_date:res_date}, // day_detail.mw에 넘길 데이터
			    		success : function(data){
			    			$("#content").html(data);
			    		}
			    	}); */
				 }
	
			});
			close.onclick = function() {
		        modal.style.display = "none";
		    }
			close2.onclick = function() {
		        res_modal.style.display = "none";
		    }
		    close_button.onclick = function() {
				modal.style.display = "none";
			}
		    close_button2.onclick = function() {
				res_modal.style.display = "none";
			}
		
			calendar.render();
		});
		
 		
	</script>
	
	<script>
		function roomChange(e){
			var studio = ['1006호 A','1006호 B','1707호 C'];
			var meeting = ['A','B','C']
			var target = document.getElementsByName('room2')[0];
			
			if(e.value == "studio") var d = studio;
			else if(e.value == "meeting") var d = meeting;

			target.options.length = 0;
	
			for (x in d) {
				var opt = document.createElement("option");
				opt.value = d[x];
				opt.innerHTML = d[x];
				if(target)
					target.appendChild(opt);
			}	
		}
		    function roomChange_modal(e){
			var studio = ['1006호 A','1006호 B','1707호 C'];
			var meeting = ['A','B','C']
			var target = document.getElementsByName('r2')[0];

			if(e.value == "studio") var d = studio;
			else if(e.value == "meeting") var d = meeting;
			
			target.options.length = 0;

			for (x in d) {
				var opt = document.createElement("option");
				opt.value = d[x];
				opt.innerHTML = d[x];
				target.appendChild(opt);
			}	
		}

		$(document).ready(function(){

			    
			$("#res_submit").click(function(){
	
				theForm = document.reservationAdd;
	
				$.ajax({
					type:"post",
					url: "res_submit",
					data : {
						id : $("input[name=id]").val(),
						r1 : $("select[name=r1]").val(),
						r2 : $("select[name=r2]").val(),
						title : $("input[name=title]").val(),
						res_date : $("input[name=res_date]").val(),
						start_time : $("input[name=start_time]").val(),
						end_time : $("input[name=end_time]").val(),
						color : $("#color").val()
					},
					success : function(data){
						alert("예약되었습니다.");
						$('#myModal').hide();
						window.location.reload();
					}
		
				});
			});
		});
		
	</script>
	
	<style>
		#calendar{
		
			position:absolute;
			left:20%;
			top:70%;
			width:60%;
			height:80%;
		}

	</style>
</head>
<body>

<h1 style="position:absolute; top:40%; left:45%;">예약신청</h1>

	
<form name="scheduleShow" method ="post" action="/project1/schedule_show">
	<span style="position:absolute; top:50%; left:41%;">
		<select class="form-control" id="exampleSelect1" name="room1" onchange="roomChange(this)">
			<option>예약구분</option>
			<option value="studio">스튜디오</option>
			<option value="meeting">회의실</option>
		</select>
	</span>
	
	<span style="position:absolute; top:50%; left:51%;">	
		<select class="form-control" id="exampleSelect1" name="room2">
			<option>장소</option>	
		</select>
	</span>
	
	<span style="position:absolute; top:50%; left:60%;">	
		<input type="submit" id="show_btn" name="show" class="btn btn-info" value="조회">
	</span>
</form>

<span style="position:absolute; top:58%; left:40%;">
	<c:if test="${!empty room2}">
		<h1>${room1} ${room2}</h1>
	</c:if>
</span>

<div id='calendar'></div>	


<!-- 예약 모달창 -->
<div id="myModal" class="modal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">예약하기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">  
      <form name="reservationAdd" method="post">
        <table>
        	<tr>
        		<td style="text-align:center">아이디</td><td>${sessionScope.id}</td>
        		<input type="hidden" id="id" name="id" value="${sessionScope.id}">
        	</tr>
        	<tr>
				<td style="text-align:center">장소</td>
				<td>
				<select class="form-control" name ="r1" id="exampleSelect1" onchange="roomChange_modal(this)">
					<option value=""> 예약구분</option>
					<option value="studio" <c:if test="${room1 eq 'studio'}"> selected </c:if> >스튜디오</option>
					<option value="meeting"<c:if test="${room1 eq 'meeting'}"> selected </c:if> >회의실</option>
				</select>
				</td>
				<td>
				<select class="form-control" name = "r2" id="exampleSelect1">
					<option>장소</option>
					<c:if test="${room1 eq 'studio' && !empty room2}">
						<option value="1006호 A" <c:if test="${room2 eq '1006호 A'}">selected</c:if>>1006호 A</option>
						<option value="1006호 B" <c:if test="${room2 eq '1006호 B'}">selected</c:if>>1006호 B</option>
						<option value="1707호 C" <c:if test="${room2 eq '1707호 C'}">selected</c:if>>1707호 C</option>
					</c:if>
					<c:if test="${room1 eq 'meeting' && !empty room2}">
						<option value="A" <c:if test="${room2 eq 'A'}">selected</c:if>>A</option>
						<option value="B" <c:if test="${room2 eq 'B'}">selected</c:if>>B</option>
						<option value="C" <c:if test="${room2 eq 'C'}">selected</c:if>>C</option>
						
					</c:if> 
				</select>
				</td>
			</tr>
			<tr>
				<td style="text-align:center">일정명</td><td><input type="text" name="title"></td>
			</tr>
			<tr>
				<td style="text-align:center">날짜</td><td><input type="date" name="res_date" id="res_date"></td>
			</tr>        
			<tr>
				<td style="text-align:center">예약시간</td><td><input type="time" name="start_time" id="start_time"> ~ <input type="time" name="end_time" id="end_time">    </td>
			</tr>
			<tr>
				<td style="text-align:center">색상</td>
				<td>
					<select class="custom-select" name="color" id="color">
						<!-- <select class="sc_color" name="sc_color" id="sc_color"> -->
						<option value="">색상
						<option value="#FFEB5A" style="color:#FFEB5A;"> 노랑색</option>
						<option value="#C45FDD" style="color:#C45FDD;"> 보라색</option>
						<option value="#5AD18F" style="color:#5AD18F;"> 초록색</option>
						<option value="#5CEEE6" style="color:#5CEEE6;"> 민트색</option>
					</select>
		
				</td>
			</tr>
        </table>
       </form>
      </div>      
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="res_submit" name="res_submit">저장</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>     
    </div>
  </div>
</div>

<!-- 예약 상세내용 모달창 -->
<div id="res_modal" class="modal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">예약확인</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id="content">
       <table>
       		<tr>
       			<td>예약 Id</td><td class="res_id"></td>
       		</tr>
      		<tr>
      			<td>예약명 </td><td class="res_title"></td>
      		</tr> 
      		<tr>
      			<td>예약일 </td><td class="res_date"></td>
      		</tr>
       </table>
      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div> 
<%@ include file="/WEB-INF/views/include/footer.jsp" %>  
</body>
</html>