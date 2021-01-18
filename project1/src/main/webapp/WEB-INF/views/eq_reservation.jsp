<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>장비예약</title>
	
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
	
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
	<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
	
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

	// 날짜 포맷 yyy-mm-dd
	  function formatDate2(date) { 
		  	var d = new Date(date), month = '' + (d.getMonth() + 1), day = '' + d.getDate(), year = d.getFullYear(); 
		  	if (month.length < 2) month = '0' + month; if (day.length < 2) day = '0' + day; 
		  	return [year,month,day].join('-'); // 날짜
		    	
	}

	// 시간 포맷 HH:mm
	  function formatClock(date) { 
	  	var d = new Date(date), hour = d.getHours().toString(), minute = d.getMinutes().toString(); 
	 
	  	if(hour.length < 2) hour = '0' + hour; if(minute.length < 2) minute = minute + '0';
	  	
	  	return [hour,minute].join(':'); // 시간
	  		
	  	
	  }
	  	
	document.addEventListener('DOMContentLoaded', function() {
		
	  var dataset = [
		<c:forEach var="rlist" items="${rlist}" varStatus="status">
			{"groupId":'<c:out value="${rlist.num}"/>'
			,"id":'<c:out value="${rlist.id}" />'
			,"title":'<c:out value="${rlist.title}" />'    
			,"start":'<c:out value="${rlist.res_date}"/>'+'T'+'<c:out value="${rlist.start_time}" />'
			,"end":'<c:out value="${rlist.res_date}"/>'+'T'+'<c:out value="${rlist.end_time}" />'
			,"backgroundColor":'<c:out value="${rlist.color}" />'
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
			  firstDay: 1,
			  selectable: true,
			  navLinks:true,
			  minTime:"08:00:00",
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

					var today = new Date();			
						
					var betweenDay = (s_date_obj.getTime()-today.getTime())/1000/60/60/24;
					console.log(betweenDay);

					// 2주만 예약 가능
					if(betweenDay>=-1 && betweenDay<=14){
				    	modal.style.display = "block";
					}
					
			        },
			        events : dataset,
			        eventClick:function(info){
			        	//info.jsEvent.preventDefault();
			        	
			        	$('#res_modal').show();
			        	$('#res_modal .modal-body .res_id').text(info.event.id);
			        	$('#res_modal .modal-body .res_title').text(info.event.title);
			        	$('#res_modal .modal-body .res_date').text(formatDate(info.event.start) + ' ~ ' + formatDate(info.event.end));
			        	
			        	$('#res_modal .modal-body #id').val(info.event.id);
			        	$('#res_modal .modal-body #num').val(info.event.groupId);
			        	$('#res_modal .modal-body #title').val(info.event.title);
			        	$('#res_modal .modal-body #res_date').val(formatDate2(info.event.start));
			        	$('#res_modal .modal-body #start_time').val(formatClock(info.event.start));
			        	$('#res_modal .modal-body #end_time').val(formatClock(info.event.end));
			        	$('#res_modal .modal-body #color').val(info.event.backgroundColor);
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
		function eqChange(e){
			var camera = ['소니 6500','소니 캠코더1','소니 캠코더2','고프로 히어로9','고프로 히어로7'];
			var tripod = ['삼각대 4번','삼각대 5번','삼각대 6번','모노포드 7번'];
			var mike = ['마이크1', '마이크2', '마이크3', '마이크4', '마이크5', '마이크6', '마이크7', '로드마이크1', '로드마이크2'];
			var target = document.getElementsByName('eq2')[0];
			
			if(e.value == "카메라") var d = camera;
			else if(e.value == "삼각대") var d = tripod;
			else if(e.value == "마이크") var d = mike;
			
			target.options.length = 0;
	
			for (x in d) {
				var opt = document.createElement("option");
				opt.value = d[x];
				opt.innerHTML = d[x];
				if(target)
					target.appendChild(opt);
			}	
		}
		
		function eqChangeModal(e){
			var camera = ['소니 6500','소니 캠코더1','소니 캠코더2','고프로 히어로9','고프로 히어로7'];
			var tripod = ['삼각대 4번','삼각대 5번','삼각대 6번','모노포드 7번'];
			var mike = ['마이크1', '마이크2', '마이크3', '마이크4', '마이크5', '마이크6', '마이크7', '로드마이크1', '로드마이크2'];
			var target = document.getElementsByName('eq2')[1];
			
			if(e.value == "카메라") var d = camera;
			else if(e.value == "삼각대") var d = tripod;
			else if(e.value == "마이크") var d = mike;
			
			target.options.length = 0;
	
			for (x in d) {
				var opt = document.createElement("option");
				opt.value = d[x];
				opt.innerHTML = d[x];
				if(target)
					target.appendChild(opt);
			}	
		}

		$(document).ready(function(){

		    
			$("#eq_res_submit").click(function(){
	
				theForm = document.eq_reservationAdd;
	
				$.ajax({
					type:"post",
					url: "eq_submit",
					data : {
						id : $("input[name=id]").val(),
						eq1 : $(".eq1").val(),
						eq2 : $(".eq2").val(),
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
	<script>
	    $(document).ready(function(){
	    	$('.timepicker').timepicker({
	    	    timeFormat: 'HH:mm',
	    	    interval: 30,
	    	    maxTime: '23:00',   
	    	    dynamic: false,
	    	    dropdown: true,
	    	    scrollbar: true,
	    	    zindex:99999
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
<h1 style="position:absolute; top:40%; left:45%;">장비 예약신청</h1>

<form name="eqShow" method ="post" action="/project1/eq_show">
	<span style="position:absolute; top:50%; left:41%;">
		<select class="form-control" id="exampleSelect1" name="eq1" onchange="eqChange(this)">
			<option>예약구분</option>
			<option value="카메라">카메라</option>
			<option value="삼각대">삼각대</option>
			<option value="마이크">마이크</option>
		</select>
	</span>
	
	<span style="position:absolute; top:50%; left:48%;">	
		<select class="form-control" id="exampleSelect1" name="eq2">
			<option>종류</option>	
		</select>
	</span>
	
	<span style="position:absolute; top:50%; left:58%;">	
		<input type="submit" class="btn btn-info select" value="조회">
	</span>
</form>

<c:if test="${!empty url}">
<figure style="position:absolute; top:45%; left:28%; z-index:-1;">
<img src="${url}" style=" width:25%; height:25%;">
<figcaption>
	<c:if test="${!empty eq2}">
		${eq2}
	</c:if>
</figcaption>
</figure>
</c:if>


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
      <form name="eq_reservationAdd" method="post">
        <table>
        	<tr>
        		<td style="text-align:center">아이디</td><td>${sessionScope.id}</td>
        		<input type="hidden" id="id" name="id" value="${sessionScope.id}">
        	</tr>
        	<tr>
				<td style="text-align:center">장소</td>
				<td>
				<select class="form-control eq1" name ="eq1" id="exampleSelect1" onchange="eqChangeModal(this)">
					<option>예약구분</option>
					<option value="카메라" <c:if test="${eq1 eq '카메라'}"> selected </c:if>>카메라</option>
					<option value="삼각대"<c:if test="${eq1 eq '삼각대'}"> selected </c:if>>삼각대</option>
					<option value="마이크"<c:if test="${eq1 eq '마이크'}"> selected </c:if>>마이크</option>
				</select>
				</td>
				<td>
				<select class="form-control eq2" name ="eq2" id="exampleSelect1">
					<option>종류</option>
					<c:if test="${eq1 eq '카메라' && !empty eq2}">
						<option value="소니 6500" <c:if test="${eq2 eq '소니 6500'}">selected</c:if>>소니 6500</option>
						<option value="소니 캠코더1" <c:if test="${eq2 eq '소니 캠코더1'}">selected</c:if>>소니 캠코더1</option>
						<option value="소니 캠코더2" <c:if test="${eq2 eq '소니 캠코더2'}">selected</c:if>>소니 캠코더2</option>
						<option value="고프로 히어로7" <c:if test="${eq2 eq '고프로 히어로7'}">selected</c:if>>고프로 히어로7</option>
						<option value="고프로 히어로9" <c:if test="${eq2 eq '고프로 히어로9'}">selected</c:if>>고프로 히어로9</option>
					</c:if>
					<c:if test="${eq1 eq '삼각대' && !empty eq2}">
						<option value="삼각대 4번" <c:if test="${eq2 eq '삼각대 4번'}">selected</c:if>>삼각대 4번</option>
						<option value="삼각대 5번" <c:if test="${eq2 eq '삼각대 5번'}">selected</c:if>>삼각대 5번</option>
						<option value="삼각대 6번" <c:if test="${eq2 eq '삼각대 6번'}">selected</c:if>>삼각대 6번</option>	
						<option value="삼각대(모노포드) 7번" <c:if test="${eq2 eq '모노포드 7번'}">selected</c:if>>삼각대(모노포드) 7번</option>	
							
					</c:if>
					<c:if test="${eq1 eq '마이크' && !empty eq2}">
						<option value="마이크1" <c:if test="${eq2 eq '마이크1'}">selected</c:if>>마이크1</option>
						<option value="마이크2" <c:if test="${eq2 eq '마이크2'}">selected</c:if>>마이크2</option>
						<option value="마이크3" <c:if test="${eq2 eq '마이크3'}">selected</c:if>>마이크3</option>	
						<option value="마이크4" <c:if test="${eq2 eq '마이크4'}">selected</c:if>>마이크4</option>	
						<option value="마이크5" <c:if test="${eq2 eq '마이크5'}">selected</c:if>>마이크5</option>	
						<option value="마이크6" <c:if test="${eq2 eq '마이크6'}">selected</c:if>>마이크6</option>	
						<option value="마이크7" <c:if test="${eq2 eq '마이크7'}">selected</c:if>>마이크7</option>	
						<option value="로드마이크1" <c:if test="${eq2 eq '로드마이크1'}">selected</c:if>>로드마이크1</option>	
						<option value="로드마이크2" <c:if test="${eq2 eq '로드마이크2'}">selected</c:if>>로드마이크2</option>		
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
				<td style="text-align:center">예약시간</td><td><input type="text" class="timepicker" name="start_time" id="start_time"></td><td><input type="text" class="timepicker" name="end_time" id="end_time"></td>
			</tr>
			<tr>
				<td style="text-align:center">색상</td>
				<td>
					<input type="color" name="color" id="color">

				</td>
			</tr>
        </table>
       </form>
      </div>      
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="eq_res_submit" name="eq_res_submit">저장</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>     
    </div>
  </div>
</div>

<!-- 예약 상세내용 모달창(수정 기능 포함) -->
<div id="res_modal" class="modal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">예약확인</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
       <form name="form">
      <div class="modal-body" id="content">
     
	       <table>
	       		<tr>
	       			<td>예약 Id</td><td class="res_id" name="id"></td>       		
	       			<input type="hidden" id="id" name="id">
	       			<input type="hidden" id="num" name="num">
	       		</tr>	      		
	       		<tr>
	      			<td>예약명 </td><!-- <td class="res_title" name="title"></td> -->
	      			<td><input type="text" id="title" name="title"></td>
	      		</tr> 
	      		<tr>
	      			<td>예약일 </td><!-- <td class="res_date" name="res_date"></td> -->
	      			<td><input type="date" id="res_date" name="res_date"></td>
	      			
	      		</tr>
	      		<tr>
	      			<td>시간</td>
	      			<td><input type="text" id="start_time" name="start_time" class="timepicker"></td>
	      			<td><input type="text" id="end_time" name="end_time" class="timepicker"></td>
	      		</tr>
	      		<tr>
	      			<td>색상</td>
	      			<td><input type="color" id="color" name="color"></td>
	      		</tr>
	       </table>
	      
	      </div>
	      <div class="modal-footer">
	      	<input type="submit" class="btn btn-primary" id="res_submit" name="res_submit" value="삭제" onclick="javascript: form.action='/project1/eq_delete'">
	      	<input type="submit" class="btn btn-primary" id="res_update" name="res_update" value="수정" onclick="javascript: form.action='/project1/eq_update'">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	      </div>
      </form>
    </div>
  </div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>  
</body>
</html>