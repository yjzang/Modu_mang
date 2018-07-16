<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>모두의 가계부</title>

<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/Modu.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/themes/smoothness/jquery-ui.css">

</head>

<style type="text/css">

table {
	font-family: 'Nanum Gothic', sans-serif;
	font-weight: 600;
	font-size: 0.9em;
	text-align: center;
}

</style>

<body style="overflow-x: hidden; overflow-y: auto;">

	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>

	<!----------------- container------------------->
	<div class="container">

		<!----------------- 통계 그래프------------------->
		<center>
			<div id="chartCanvas">
				<canvas class="m-4 w-75" id="myChart" width="50" height="13"></canvas>
			</div>
		</center>

		<!----------------- 월 선택 달력------------------->
		<div class="calendar-content" style="margin-left: 500px">
			<input type="text" class="form-control page-link col-4 text-center" style="font-size: 25px" id="monthCal" value="">
		</div>

		<hr>

		<!----------------- 검색 창------------------->
		<div>
			<form class="form-inline ml-2 float-left">
				<select class="custom-select" id="inputGroupSelect01" name="search_mode">
					<option selected>검색 유형</option>
					<option value="1">날짜 검색</option>
					<option value="2">태그 검색</option>
					<option value="3">내역 검색</option>
				</select> 
				<input class="form-control mr-sm-2 ml-2" type="search" id="search_text" placeholder="모임 찾기" aria-label="search">
				<div id="search_date_div">
				<input class="form-control mr-sm-2 ml-2" type="search" id="search_date1" placeholder="모임 찾기" aria-label="search">
				~
				<input class="form-control mr-sm-2 ml-2" type="search" id="search_date2" placeholder="모임 찾기" aria-label="search">
				</div>
				<button class="btn btn-outline-primary my-2 my-sm-0" id="search_btn">검색</button>
			</form>
		</div>
		
		<!----------------- 그래프 숨김/보이기 , 카테고리 수정 버튼 ------------------->
		<div class="float-right">
			<button id="hidegraph" type="button" class="btn btn-primary">그래프 숨기기</button>
			<button id="categoryUpdate" type="button" class="btn btn-primary">카테고리 수정</button>
		</div>
		
		<!----------------- 가계부 테이블------------------->
		<div class="table-responsive">
				<input type="text" value="${authUser.userName}"> 
				<input type="text" id="groupno" value="${group.groupNo}">
			<form>
				<table class="table table-striped table-sm">
					<thead>
						<tr>
							<th>
								<div class="custom-control custom-checkbox">
									<input type="checkbox" class="custom-control-input" id="checkall"> 
									<label class="custom-control-label" for="checkall">&nbsp;</label>
								</div>
							</th>
							<th>날짜</th>
							<th>사용내역</th>
							<th>지출액</th>
							<th>분류</th>
							<th>태그</th>
						</tr>
					</thead>

					<tbody id="accountbookContent">

					</tbody>

				</table>
			</form>
		</div>

		<!----------------- 태그 버튼------------------->
		<div>
			<button id="tagGroup" type="button" class="btn btn-primary float-left">#태그</button>
		</div>

		<!----------------- CRUD 버튼------------------->
		<div class="float-right">
			<button type="button" class="btn btn-primary">글쓰기</button>
			&nbsp;
			<button id="deleteAccountbook" type="button" class="btn btn-danger">삭제하기</button>
			&nbsp;
		</div>
		<br> <br>
	</div>
	<br>
	<br>
	
	<!----------------- 모달 (개별 태그)------------------->
	<div class="modal fade" id="modal" tabindex="-1" role="dialog">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">태그</h5>
	        <input type="hidden" id="hiddenAnoTag" value="">	
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body" id="tagBody">					
	      </div>
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	      	<button type="button" name="tagInsert" class="btn btn-primary mr-2">태그 추가</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!----------------- 모달 (일괄 태그)------------------->
	<div class="modal fade" id="modal1" tabindex="-1" role="dialog">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">태그</h5>
	        <input type="hidden" id="hiddenAnoTag" value="">	
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">	
	      <input class='form-control mr-sm-2 ml-2 w-100' type='search' id='inputTagName' value=''>				
	      </div>
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	      	<button type="button" name="saveTag" class="btn btn-primary mr-2">저장하기</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!----------------- 모달 (카테고리)------------------->
	<div class="modal fade" id="modal2" tabindex="-1" role="dialog">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">카테고리</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body" id="categoryBody">					
	      </div>
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	      	<button type="button" name="categoryInsert" class="btn btn-primary mr-2">카테고리 추가</button>
	      </div>
	    </div>
	  </div>
	</div>

	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>

	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/header.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/jquery-ui.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/jquery/jquery.mtz.monthpicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/locales/bootstrap-datetimepicker.ko.js" charset="UTF-8"></script>

	<script>
		$(document).ready( function() {		
			
			//차트 작성
			function MyChart(chartDataList){
				
				 $('[id=myChart]').replaceWith('<canvas class="m-4 w-75" id="myChart" width="50" height="13"></canvas>');
				 
				var chartCategoryList = new Array();
				var chartCategoryDatas = new Array(); 
				
				for(var i=0; i<chartDataList.length; i++){
					chartCategoryList.push(chartDataList[i].categoryName);
					chartCategoryDatas.push(chartDataList[i].total);
				} 
				
				var canvas = document.getElementById('myChart');
				
				var data = {
				    labels: [ ],
				    datasets: [
				        {
				        	backgroundColor: "rgba(75,192,192,0.4)",
		                	data: [ ]
				        }
				    ]
				};
	
				function adddata(index,data,label){
					myBarChart.data.datasets[0].data[index] = data;
				  	myBarChart.data.labels[index] = label;
				  	myBarChart.update();
				}
	
				var option = {
					scales : {
						yAxes : [ {
							ticks : {
								beginAtZero : false,
								beginAtZero: true,
								callback : function(value, index, values) {
									return value.toString().replace(
											/\B(?=(\d{3})+(?!\d))/g, ",")
											+ "원";
								}
							}
						} ]
					},
			     	legend: { display: false },
			      	title: {
			        	display: true
			      	}
				};
				
				var myBarChart = Chart.Bar(canvas,{
					data:data,
				  options:option
				});
				
				for(var i=0;i<chartCategoryList.length;i++){
					adddata(i,chartCategoryDatas[i],chartCategoryList[i]);
				}

			}			
			    
			//내비바 가계부 탭 활성화
			$('.menuTab').removeClass("active");
			$("#accountbook").addClass("active");
			
			$('[id=hidegraph]').on('click',function(){
				$('[id=chartCanvas]').toggle();
				if ( $('[id=hidegraph]').html() == '그래프 숨기기'){
					$('[id=hidegraph]').html('그래프 보이기');
				}else{
					$('[id=hidegraph]').html('그래프 숨기기') ;
				}
				
			});
			
			//검색창 숨기기 및 datepicker이벤트 추가
			$('[id=search_date1]').datepicker();
			$('[id=search_date2]').datepicker();
			$('[id=search_date_div]').hide();

			//오늘 날짜 불러와서 달력에 입력
			var today = new Date();
			var year = today.getFullYear();
			var month = '' + (today.getMonth() + 1);
			if (month.length < 2) {
				month = "0" + month;
			}
			$('[id=monthCal]').val(year + " / " + month);

			//표에 가계부 내역 호출
			fetchAccountbookList();

			//최상단 체크박스 클릭시 체크박스 전체 선택 / 전체 해제
			$("#checkall").click(
					function() {
						//클릭되었으면
						if ($("#checkall").prop("checked")) {
							//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
							$("input[name=chk]").prop(
									"checked", true);
							//클릭이 안되있으면
						} else {
							//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
							$("input[name=chk]").prop(
									"checked", false);
						}
					})	
					
			//태그 일괄 적용 모달창 팝업
			$("[id=tagGroup]").click(function() {
				$('[id=inputTagName]').val('');
				$('[id=modal1]').modal();
				$('[id=modal]').modal('hide');
				$('[id=moda2]').modal('hide');		
			});
			
			//태그 저장 버튼 클릭시 체크된 항목 태그 일괄 적용	
			$('[name=saveTag]').on('click',function(){
				
				var AccountbookList = '';
			    $('input:checkbox[name=chk]').each(function() {
			    	if($(this).is(':checked')){
			       		AccountbookList += ","+($(this).closest("tr").attr("id"));	
			    	}
				})
				
				var tagName = $('[id=inputTagName]').val();
				tagGroup(AccountbookList,tagName);
				$('[id=modal1]').modal('hide');
			})
			
			//db에서 태그 일괄 적용
			function tagGroup(AccountbookList,tagName){
				$.ajax({
					url : "${pageContext.request.contextPath }/accountbook/taggroup",
					type : "post",
					//contentType : "application/json",
					data : {
						AccountbookList : AccountbookList,
						tagName : tagName
					},
					//dataType : "json",
					success : function() {
						fetchAccountbookList();
					},
					error : function(XHR, status, error) {
						console.error(status + " : " + error);
					}
				});
			}
			
			//삭제 버튼 클릭시 체크된 항목 모두 제거	
			$("[id=deleteAccountbook]").click(function() {
				var AccountbookList = '';
			    	$('input:checkbox[name=chk]').each(function() {
			        	if($(this).is(':checked')){
			       			AccountbookList += ","+($(this).closest("tr").attr("id"));		
			        	}
			      	});
				deleteAccountbook(AccountbookList);							      
			});
									
			//db에서 삭제
			function deleteAccountbook(AccountbookList){
				$.ajax({
					url : "${pageContext.request.contextPath }/accountbook/deleteaccountbook",
					type : "post",
					//contentType : "application/json",
					data : {
						AccountbookList : AccountbookList
					},
					//dataType : "json",
					success : function() {
						fetchAccountbookList();
					},
					error : function(XHR, status, error) {
						console.error(status + " : " + error);
					}
				});
			}			
			
			//페이지 로딩시 리스트 불러오기
			var globalCategoryList;
			
			function fetchAccountbookList() {
				$.ajax({
					url : "${pageContext.request.contextPath }/accountbook/getaccountlist",
					type : "post",
					//contentType : "application/json",
					data : { 	groupNo : $("[id=groupno]").val(),
								month : $('[id=monthCal]').val()
					},
					dataType : "json",
					success : function(map) {
						$("[id=accountbookContent]").empty();
						
						var accountbookList = map.accountList;
						var categoryList = map.categoryList;
						var chartDataList = map.chartDataList;
						globalCategoryList = categoryList;

						for (var i = 0; i < accountbookList.length; i++) {
							render(accountbookList[i], i, categoryList);
						}
						newline(i, categoryList);

						MyChart(chartDataList);
					},
					error : function(XHR, status, error) {
						console.error(status + " : " + error);
					}
				});
			}

			//가계부 리스팅
			function render(accountbookVo, i, categoryList) {
				
				var str = "";

				str += "<tr id='" + accountbookVo.accountbookno + "' class='form-group'>";
				str += "<td>" 								
				str += "<div class='custom-control custom-checkbox'>";
				str += "<input type='checkbox' class='custom-control-input data" + i + "' id='customCheck" + i + "' name='chk'>";
				str += "<label class='custom-control-label'  for='customCheck" + i + "' style='margin-top: 7px'>&nbsp;</label>";
				str += "</div>";
				str += "</td>"
				str += "<td>"
				str += "<input type='text' id='date" + i + "' readonly='readonly' class='datepicker form-control text-center date' value='" + accountbookVo.accountbookRegDate + "' style='margin-top:7px' placeholder='날짜'>";
				str += "</td>";
				str += "<td>";
				str += "<input type='text' class='form-control text-center usage' style='margin-top: 7px' id='usage" + i + "' value='" + accountbookVo.accountbookUsage + "' placeholder='사용내역'>";
				str += "</td>";
				str += "<td>";
				str += "<input type='text' class='form-control text-center spend' style='margin-top: 7px' id='spend" + i + "' value='" + accountbookVo.accountbookSpend + "' placeholder='지출액'>";
				str += "</td>";
				str += "<td>";
				str += "<select class='form-control custom-select text-center category' style='margin-top: 7px' id='category" + i + "'>";
				str += "<option value='' selected>분류</option>";

				for (var i = 0; i < categoryList.length; i++) {
					if (categoryList[i].categoryNo == accountbookVo.categoryNo) {
						str += "<option value='" + categoryList[i].categoryNo + "' selected>"
									+ categoryList[i].categoryName
								+ "</option>";
					} else {
						str += "<option value='" + categoryList[i].categoryNo + "'>"
									+ categoryList[i].categoryName
								+ "</option>";
					}
				}

				str += "</select>";
				str += "</td>";
				str += "<td>";
				if (accountbookVo.tagName == (" "))
					accountbookVo.tagName = "";
				str += "<input type='text' class='tag form-control text-center' style='margin-top: 7px' id='tag" + i + "' value='" + accountbookVo.tagName + "' placeholder='태그'>";
				str += "<td>";
				str += "</tr>";

				$("[id=accountbookContent]").append(str);
				datepickerReset();

			}

			//마지막칸 새로운 라인 추가
			function newline(i, categoryList) {
				
				var mode = $("[name=search_mode]").val();
				
				if(mode != 1 && mode != 2 && mode != 3){
					var str = "";

					str += "<tr id='' name='" + i + "'class='form-group'>";
					str += "<td>";
					str += "<div class='custom-control custom-checkbox'>";
					str += "<input type='checkbox' class='custom-control-input data" + i + "' id='customCheck" + i + "' name='chk'>";
					str += "<label class='custom-control-label'  for='customCheck" + i + "' style='margin-top: 7px'>&nbsp;</label>";
					str += "</div>";
					str += "</td>"
					str += "<td>"
					str += "<input type='text' id='date" + i + "' readonly='readonly' class='date datepicker form-control text-center data" + i + "' value='' style='margin-top:7px' placeholder='날짜'>";
					str += "</td>";
					str += "<td>";
					str += "<input type='text' class='usage form-control text-center data" + i + "' style='margin-top: 7px' id='usage" + i + "' value='' placeholder='사용내역'>";
					str += "</td>";
					str += "<td>";
					str += "<input type='text' class='spend form-control text-center data" +i + "' style='margin-top: 7px' id='spend" + i + "' value='' placeholder='지출액'>";
					str += "</td>";
					str += "<td>";
					str += "<select class='category form-control custom-select text-center data" + i + "' style='margin-top: 7px' id='category" + i + "'>";
					str += "<option value='' selected>분류</option>";

					for (var i = 0; i < categoryList.length; i++) {
						str += "<option value='" + categoryList[i].categoryNo + "'>"
									+ categoryList[i].categoryName
								+ "</option>";
					}

					str += "</select>";
					str += "</td>";
					str += "<td>";
					str += "<input type='text' class='tag form-control text-center data" + i + "' style='margin-top: 7px' id='tag" + i + "' value='' placeholder='태그'>";
					str += "<td>";
					str += "</tr>";

					$("[id=accountbookContent]").append(str);
					datepickerReset();
				}
			}

			//focusout시 데이터 변화 있으면 데이터 삽입
			$("[id=accountbookContent]").on("focusout","tr",function() {
				var id = $(this).closest("tr").attr("id");
				var groupno = $("[id=groupno]").val();
				var date = $(this).find(".date").val()
				if ( id == '' ){
					if( $(this).find(".usage").val() != '' ){
						var id = $(this).closest("tr").attr("id",0);
						var usage = $(this).find(".usage").val();
						$(this).closest("tr").attr("id",saveAccountbook(usage,'','',groupno,date));
					}else if( $(this).find(".spend").val() != '' ){
						var id = $(this).closest("tr").attr("id",0);
						var spend = $(this).find(".spend").val();
						$(this).closest("tr").attr("id",saveAccountbook('',spend,'',groupno,date));
					}else if( $(this).find(".category").val() != '' ){
						var id = $(this).closest("tr").attr("id",0);
						var category = $(this).find(".category").val();
						$(this).closest("tr").attr("id",saveAccountbook('','',category,groupno,date));
					}else{	
						var id = $(this).closest("tr").attr("id",0);
						$(".date").change(function(){			
							date = $(this).val();
							$(this).closest("tr").attr("id",saveAccountbook('','','',groupno,date));
						}) 	
					}
				}
			});	
			
			//가계부 db저장
			function saveAccountbook(usage,spend,category,groupNo,date){
				var accNo; 
				$.ajax({
					url : "${pageContext.request.contextPath }/accountbook/saveaccountbook",
					type : "post",
					//contentType : "application/json",
					data : {
						usage : usage,		
						spend : spend,	
						category : category,	
						groupNo : groupNo,
						date : date
					},
					//dataType : "json", 
					async: false,
					success : function(accountbookno) {									
						//fetchAccountbookList();	
						/* $(this).closest("tr").attr("id",accountbookno);
						console.log(accountbookno);
						console.log("##" + $(this).closest("tr").attr("id")); */
						accNo = accountbookno;
					},
					error : function(XHR, status, error) {
						console.error(status + " : " + error);
					}
				});	
				return accNo;
			}
			
			//데이터 업데이트 및 마지막 줄 선택시 새로운 라인 삽입
			$("[id=accountbookContent]").on("focus","tr",function() {
				var $this = $(this);
				if ($('[id=accountbookContent] > tr').index(this) == $('[id=accountbookContent] > tr ').last().index()) {
					var today = new Date();
					var yyyy = today.getFullYear();
					var mm = today.getMonth() + 1;
					if(mm<10){
						mm = '0'+mm;
					}
					var dd = today.getDate();
					if(dd<10){
						dd = '0'+dd;
					}

					$("[id=date"+ $this.attr("name")+ "]").attr("value",yyyy+ "년 "+ mm+ "월 "+ dd+ "일");

					var row = parseInt($this.attr("name")) + 1;
									
					newline(row,globalCategoryList);
				}else{
					var updatePos;
					var accountbookno;
					$(this).find(".usage").change(function(){
						accountbookno = $(this).closest("tr").attr("id");
						data = $(this).val();
						updatePos='accountbookusage';
						updateAccountbook(accountbookno,data,updatePos);
					})
					
					$(this).find(".date").change(function(){
						accountbookno = $(this).closest("tr").attr("id");
						data = $(this).val();
						updatePos='accountbookregdate';
						updateAccountbook(accountbookno,data,updatePos);
					}) 
					
					$(this).find(".spend").change(function(){
						accountbookno = $(this).closest("tr").attr("id");
						data = $(this).val();
						updatePos='accountbookspend';
						updateAccountbook(accountbookno,data,updatePos);
					})
					
					$(this).find(".category").change(function(){
						accountbookno = $(this).closest("tr").attr("id");
						data = $(this).val();
						updatePos='categoryno';
						updateAccountbook(accountbookno,data,updatePos);
					})
				}

			});
			
			//db 가계부 업데이트
			function updateAccountbook(accountbookno,data,updatePos){
				$.ajax({
					url : "${pageContext.request.contextPath }/accountbook/updateaccountbook",
					type : "post",
					//contentType : "application/json",
					data : {
						accountbookno : accountbookno,		
						data : data,	
						updatePos : updatePos
					},
					//dataType : "json", 
					success : function() {									
						//fetchAccountbookList();
					},
					error : function(XHR, status, error) {
						console.error(status + " : " + error);
					}
				});	
			}

			/*datepicker*/
			$(function() {
				$(".datepicker").datepicker();
			});

			/*캘린더 datepicker*/
			$('#monthCal').monthpicker(
					{
						pattern : 'yyyy / mm',
						selectedYear : (new Date()).getFullYear(),
						startYear : 1900,
						finalYear : 2212,
						monthNames : [ 	'1월', '2월', '3월', '4월',
										'5월', '6월', '7월', '8월', '9월',
										'10월', '11월', '12월' ],
					});

			//내비바 효과
			var didScroll;
			var lastScrollTop = 0;
			var delta = 5;
			var navbarHeight = $('header').outerHeight();

			$(window).scroll(function(event) {
				didScroll = true;
			});

			setInterval(function() {
				if (didScroll) {
					hasScrolled();
					didScroll = false;
				}
			}, 250);

			function hasScrolled() {
				var st = $(this).scrollTop();

				if (Math.abs(lastScrollTop - st) <= delta)
					return;

				// 속도 향상 클래스 - nav-up. 
				if (st > lastScrollTop && st > navbarHeight) {
					// 스크롤 내릴때
					$('header').removeClass('nav-down').addClass('nav-up');
				} else {
					// 스크롤 올릴때
					if (st + $(window).height() < $(document).height()) {
						$('header').removeClass('nav-up').addClass('nav-down');
					}
				}
				lastScrollTop = st;
			}

			//append시 datepicker 이벤트 먹지 않는 문제 발생 - datepicker 이벤트 제거후 재 실행
			function datepickerReset() {
				$(document).find(".datepicker").removeClass('hasdatepicker').datepicker();

				$.datepicker.setDefaults({
					prevText : '이전 달',
					nextText : '다음 달',
					monthNames : [ 	'1월', '2월', '3월', '4월',
									'5월', '6월', '7월', '8월', '9월',
									'10월', '11월', '12월' ], //월 이름
					monthNamesShort : [ '1월', '2월', '3월', '4월',
										'5월', '6월', '7월', '8월', '9월',
										'10월', '11월', '12월' ], //
					dayNames : [ '일', '월', '화', '수', '목', '금',
								'토' ],
					dayNamesShort : [ '일', '월', '화', '수', '목',
									'금', '토' ],
					dayNamesMin : [ '일', '월', '화', '수', '목',
									'금', '토' ],
					showMonthAfterYear : true,
					yearSuffix : '년',
					changeMonth : true,
					changeYear : true,
					dateFormat : "yy년 mm월 dd일"
				});
			}

			//월 선택시 재 리스팅
			$('[id=monthCal]').change(
					function changeAccountbookList() {
						fetchAccountbookList()
			});
			
			//검색 모드에 따른 검색창 갯수 변화
			$('[name=search_mode]').change(
					function search() {
						var mode = $(this).val();
						if(mode==1){
							$('[id=search_text]').hide();
							$('[id=search_date1]').val('');
							$('[id=search_date2]').val('');
							$('[id=search_date_div]').show();
						}else{
							$('[id=search_date_div]').hide();
							$('[id=search_text]').val('');
							$('[id=search_text]').show();
						}
			});
			
			//검색
			$('[id=search_btn]').on("click",function() {
				event.preventDefault();
				searching();
			});		
			
			//db 검색 mode1:날짜 검색 / mode2:태그 검색 / mode3:내역 검색 
			function searching(){
				var mode = $("[name=search_mode]").val();
				
				if(mode == 1){
					$.ajax({
						url : "${pageContext.request.contextPath }/accountbook/searchaccountlistbydate",
						type : "post",
						//contentType : "application/json",
						data : {
								search_date1 : $("[id=search_date1]").val(),
								search_date2 : $("[id=search_date2]").val(),
								groupNo : $("[id=groupno]").val()
								},
						dataType : "json",
						success : function(map) {
							$("[id=accountbookContent]").empty();
							var accountbookList = map.accountList;
							var categoryList = map.categoryList;
							var chartDataList = map.chartDataList;

							for (var i = 0; i < accountbookList.length; i++) {
								render(accountbookList[i],i, categoryList);
							}
							
							MyChart(chartDataList);
						},
						error : function(XHR, status, error) {
							console.error(status + " : " + error);
						}
					}); 
				}else if(mode == 2 || mode ==3){
					$.ajax({
						url : "${pageContext.request.contextPath }/accountbook/searchaccountlist",
						type : "post",
						//contentType : "application/json",
						data : { mode : mode , 
								search_text : $("[id=search_text]").val(),
								groupNo : $("[id=groupno]").val() },
						dataType : "json",
						success : function(map) {
							$("[id=accountbookContent]").empty();
							var accountbookList = map.accountList;
							var categoryList = map.categoryList;
							var chartDataList = map.chartDataList;

							for (var i = 0; i < accountbookList.length; i++) {
								render(accountbookList[i], i, categoryList);
							}
							
							MyChart(chartDataList);
						},
						error : function(XHR, status, error) {
							console.error(status + " : " + error);
						}
					}); 
				}else{
					fetchAccountbookList();	
				}
			}
			
			//태그 모달창 팝업
			
			var tagRow;
			var insertedTagRow;
			
			$("[id=accountbookContent]").on("focusin",".tag",function() {	
				$('[id=modal]').modal();
				$('[id=modal1]').modal('hide');
				$('[id=modal2]').modal('hide');
				$("[id=tagBody]").empty();
				
				var accountNo = $(this).closest("tr").attr('id');
				$('[id=hiddenAnoTag]').val(accountNo);
				tagRow = 1;												
				
				tagList(accountNo);					
			});
			
			//태그 리스팅
			function tagList(accountNo){
				$.ajax({
					url : "${pageContext.request.contextPath }/accountbook/getTagList",
					type : "post",
					//contentType : "application/json",
					data : {
						accountNo : accountNo
					},
					dataType : "json", 
					success : function(tagList) {									
						for(var i=0;i<tagList.length;i++){
							tagRowInsert(tagList[i]);
						}
						insertedTagRow = tagRow - 1;
					},
					error : function(XHR, status, error) {
						console.error(status + " : " + error);
					}
				});						
			}
			
			//태그 추가 버튼
			$("[name=tagInsert]").on("click",function() {								
				tagRowInsert('');								
			});
			
			//태그 칸 추가
			function tagRowInsert(tagList){
				var str = "";
				
				str+="<div class='my-1' id='" + tagList.accountbooktagno + "'>";
				if(typeof(tagList.tagname) == 'undefined'){
					str+="<input class='inputTag form-control mr-sm-2 ml-2 w-75 float-left' type='search' id='inputTag' name='' value='' placeholder='태그'>";
				}
				else{
					str+="<input class='inputTag form-control mr-sm-2 ml-2 w-75 float-left' type='search' id='inputTag' name='" + tagList.tagno + "' value='" + tagList.tagname + "'>";
				}
				str+="<button type='button' name='tagDelete' class='btn btn-danger mr-1 float-left' id='" + tagList.tagno + "' value='" + tagRow + "'>삭제</button>";
				str+="<div style='clear:both;''></div>";
				str+="</div>";
				
				$("[id=tagBody]").append(str);
				
				tagRow++;
			}							
			
			//태그 삭제
			$("[id=tagBody]").on("click","[name=tagDelete]",function() {
			
				$(this).closest("div").remove();
				var accountbooktagno = $(this).closest("div").attr("id");
				var tagno = $(this).attr('id');
				tagDelete(accountbooktagno,tagno);
				insertedTagRow--;
				
			});
			
			//db에서 태그 삭제
			function tagDelete(accountbooktagno,tagno){
				$.ajax({
					url : "${pageContext.request.contextPath }/accountbook/tagDelete",
					type : "post",
					//contentType : "application/json",
					data : {
						accountbooktagno : accountbooktagno,
						tagno : tagno
					},
					//dataType : "json",	
					success : function() {	
						$("[id=accountbookContent]").empty();
						searching();
					},
					error : function(XHR, status, error) {
						console.error(status + " : " + error);
					}
				});
			}
			
			
			//태그 변화 감지
			$("[id=tagBody]").on("focusout","[id=inputTag]",function() {
				
				var accountbookNo = $('[id=hiddenAnoTag]').val();
				var tagname = $(this).val();

				var selRow = $(this).closest("div").index() + 1;
				
				if(selRow <= insertedTagRow){
					var tagno = $(this).attr('name');
					var accountbooktagno = $(this).closest("div").attr("id");
					updateTag(accountbookNo,accountbooktagno,tagno,tagname);								
				}else{
					insertTag(accountbookNo,tagname);					
				}

			});	
			
			//태그 수정
			function updateTag(accountbookNo,accountbooktagno,tagno,tagname){						
				$.ajax({
					url : "${pageContext.request.contextPath }/accountbook/updateTag",
					type : "post",
					//contentType : "application/json",
					data : {
						accountbookNo : accountbookNo,
						accountbooktagno : accountbooktagno,
						tagno : tagno,
						tagname : tagname
					},
					//dataType : "json",	
					success : function() {
						$("[id=accountbookContent]").empty();
						searching();	
						$("[id=tagBody]").empty();
						tagRow = 1;	
						tagList(accountbookNo);
					},
					error : function(XHR, status, error) {
						console.error(status + " : " + error);
					}
				});
			}
			
			//태그 삽입
			function insertTag(accountbookNo,tagname) {
				$.ajax({
					url : "${pageContext.request.contextPath }/accountbook/inserttag",
					type : "post",
					//contentType : "application/json",
					data : {
						accountbookNo : accountbookNo,
						tagname : tagname
					},
					//dataType : "json",	
					success : function() {
						$("[id=accountbookContent]").empty();
						searching();	
						$("[id=tagBody]").empty();
						tagRow = 1;	
						tagList(accountbookNo);
					},
					error : function(XHR, status, error) {
						console.error(status + " : " + error);
					}
				});
			}
			
			//카테고리 모달창 팝업
			
			var cateRow;
			var insertedCateRow;
			
			$("[id=categoryUpdate]").on("click",function() {	
				$('[id=modal2]').modal();
				$('[id=modal]').modal('hide');
				$('[id=modal1]').modal('hide');
				$("[id=categoryBody]").empty();
				
				cateRow = 1;												
				
				cateList();			
			});
			
			//카테고리 리스팅
			function cateList(){
				$.ajax({
					url : "${pageContext.request.contextPath }/accountbook/getcategorylist",
					type : "post",
					//contentType : "application/json",
					data : {
						groupNo : $("[id=groupno]").val(),
					},
					dataType : "json", 
					success : function(cateList) {									
						for(var i=0;i<cateList.length;i++){
							cateRowInsert(cateList[i]);
						}
						insertedCateRow = cateRow - 1;
					},
					error : function(XHR, status, error) {
						console.error(status + " : " + error);
					}
				});						
			}
			
			//카테고리 칸 추가
			function cateRowInsert(cateList){
				
				var str = "";
				
				str+="<div class='my-1' id='" + cateList.categoryNo + "'>";
				if(typeof(cateList.categoryName) == 'undefined'){
					str+="<input class='inputCategory form-control mr-sm-2 ml-2 w-75 float-left' type='search' id='inputCategory' name='' value='' placeholder='카테고리'>";
				}
				else{
					str+="<input class='inputCategory form-control mr-sm-2 ml-2 w-75 float-left' type='search' id='inputCategory' name='" + cateList.categoryNo + "' value='" + cateList.categoryName + "'>";
				}
				str+="<button type='button' name='categoryDelete' class='btn btn-danger mr-1 float-left' id='" + cateList.categoryNo + "' value='" + cateRow + "'>삭제</button>";
				str+="<div style='clear:both;''></div>";
				str+="</div>";
				
				$("[id=categoryBody]").append(str);
				
				cateRow++;
			}	
			
			//카테고리 추가 버튼
			$("[name=categoryInsert]").on("click",function() {								
				cateRowInsert('');								
			});
			
			//카테고리 삭제
			$("[id=categoryBody]").on("click","[name=categoryDelete]",function() {
			
				$(this).closest("div").remove();
				var categoryno = $(this).attr('id');
				categoryDelete(categoryno);
				insertedTagRow--;
				
			});
			
			//db에서 카테고리 삭제
			function categoryDelete(categoryno){
				$.ajax({
					url : "${pageContext.request.contextPath }/accountbook/categorydelete",
					type : "post",
					//contentType : "application/json",
					data : {
						groupNo : $("[id=groupno]").val(),
						categoryno : categoryno
					},
					//dataType : "json",	
					success : function() {	
						$("[id=accountbookContent]").empty();
						searching();
					},
					error : function(XHR, status, error) {
						console.error(status + " : " + error);
					}
				});
			}
				
			//카테고리 변화 감지
			$("[id=categoryBody]").on("focusout","[id=inputCategory]",function() {
				var categoryname = $(this).val();

				var selRow = $(this).closest("div").index() + 1;
				if(selRow <= insertedCateRow){
					var categoryno = $(this).attr('name');
					updateCategory(categoryno,categoryname);								
				}else{
					insertCategory(categoryname);					
				}

			});	
			
			//카테고리 수정
			function updateCategory(categoryno,categoryname){						
				$.ajax({
					url : "${pageContext.request.contextPath }/accountbook/updatecategory",
					type : "post",
					//contentType : "application/json",
					data : {
						categoryno : categoryno,
						categoryname : categoryname
					},
					//dataType : "json",	
					success : function() {
						$("[id=accountbookContent]").empty();
						searching();	
						$("[id=categoryBody]").empty();
						cateRow = 1;	
						cateList();
					},
					error : function(XHR, status, error) {
						console.error(status + " : " + error);
					}
				});
			}
			
			//카테고리 삽입
			function insertCategory(categoryname) {
				$.ajax({
					url : "${pageContext.request.contextPath }/accountbook/insertcategory",
					type : "post",
					//contentType : "application/json",
					data : {
						categoryname : categoryname,
						groupNo : $("[id=groupno]").val(),
					},
					//dataType : "json",	
					success : function() {
						$("[id=accountbookContent]").empty();
						searching();	
						$("[id=categoryBody]").empty();
						cateRow = 1;	
						cateList();
					},
					error : function(XHR, status, error) {
						console.error(status + " : " + error);
					}
				});
			}
			
		})
	</script>


</body>
</html>