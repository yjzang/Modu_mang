<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>모두의 가계부</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/bootstrap.css">
<!-- stylesheet 외부의 css 가져오겟다 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/Modu.css">
<!-- stylesheet 외부의 css 가져오겟다 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic"
	rel="stylesheet">
<link rel="stylesheet"
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/themes/smoothness/jquery-ui.css">

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

		<center>
			<canvas class="m-4 w-75" id="myChart" width="50" height="13"></canvas>
		</center>

		<div class="calendar-content" style="margin-left: 500px">
			<input type="text" class="form-control page-link col-4 text-center"
				style="font-size: 25px" id="monthCal" value="">
		</div>

		<hr>

		<div class="table-responsive">
			<form>
				<input type="text" value="${authUser.userName}"> <input
					type="text" id="groupno" value="${group.groupNo}">
				<table class="table table-striped table-sm">
					<thead>
						<tr>
							<th>
								<div class="custom-control custom-checkbox">
									<input type="checkbox" class="custom-control-input"
										id="checkall"> <label class="custom-control-label"
										for="checkall">&nbsp;</label>
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

		<div>
			<button type="button" class="btn btn-primary float-left">#태그</button>
			<form class="form-inline ml-2 float-left">
				<select class="custom-select" id="inputGroupSelect01">
					<option selected>검색 유형</option>
					<option value="1">날짜 검색</option>
					<option value="2">태그 검색</option>
					<option value="3">내역 검색</option>
				</select> <input class="form-control mr-sm-2 ml-2" type="search"
					placeholder="모임 찾기" aria-label="search">
				<button class="btn btn-outline-primary my-2 my-sm-0" type="submit">검색</button>
			</form>
		</div>


		<div class="float-right">
			<button type="button" class="btn btn-primary">글쓰기</button>
			&nbsp;
			<button type="button" class="btn btn-primary">저장하기</button>
			&nbsp;
			<button type="button" class="btn btn-danger">삭제하기</button>
			&nbsp;
		</div>
		<br> <br>
	</div>
	<br>
	<br>


	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>




	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script
		src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/header.js"></script>

	<!-- Graphs -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
	<script>
		var ctx = document.getElementById("myChart");
		var myChart = new Chart(ctx, {
			responsive : true,
			type : 'line',
			data : {
				labels : [ "Sunday", "Monday", "Tuesday", "Wednesday",
						"Thursday", "Friday", "Saturday" ],
				datasets : [ {
					data : [ 15339, 21345, 18483, 24003, 23489, 24092, 12034 ],
					lineTension : 0,
					backgroundColor : 'transparent',
					borderColor : '#007bff',
					borderWidth : 4,
					pointBackgroundColor : '#007bff'
				} ]
			},
			options : {
				scales : {
					yAxes : [ {
						ticks : {
							beginAtZero : false,
							callback : function(value, index, values) {
								return value.toString().replace(
										/\B(?=(\d{3})+(?!\d))/g, ",")
										+ "원";
							}
						}
					} ]
				},
				legend : {
					display : false,
				}
			}
		});
	</script>



	<script
		src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/jquery-ui.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/assets/jquery/jquery.mtz.monthpicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/assets/js/bootstrap-datetimepicker.js"
		charset="UTF-8"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/assets/js/locales/bootstrap-datetimepicker.ko.js"
		charset="UTF-8"></script>

	<script>
		$(document)
				.ready(
						function() {

							//내비바 가계부 탭 활성화
							$('.menuTab').removeClass("active");
							$("#accountbook").addClass("active");
							
							//오늘 날짜 불러와서 달력에 입력
							var today = new Date();
							var year = today.getFullYear();
							var month = '' + (today.getMonth() + 1);
							if(month.length < 2) 
								{month = "0" + month;}
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

							//////////////////////////////////////////////////////////////

						

							//페이지 로딩시 리스트 불러오기
							function fetchAccountbookList(groupNo,month) {
								$
										.ajax({

											url : "${pageContext.request.contextPath }/accountbook/getaccountlist",
											type : "post",
											//contentType : "application/json",
											data : {
												groupNo : $("[id=groupno]").val() , month : $('[id=monthCal]').val()
											},

											dataType : "json",
											success : function(list) {
												$("[id=accountbookContent]").empty();
												for (var i = 0; i < list.length; i++) {
													render(list[i], i);
												}
												newline(i);
											},
											error : function(XHR, status, error) {
												console.error(status + " : "
														+ error);
											}
										});
							}

							//가계부 리스팅
							function render(accountbookVo, i) {
								var str = "";

								str += "<tr id='" + i + "' class='form-group'>";
								str += "<td>";
								str += "<div class='custom-control custom-checkbox'>";
								str += "<input type='checkbox' class='custom-control-input data" + i + "' id='customCheck" + i + "' name='chk'>";
								str += "<label class='custom-control-label'  for='customCheck" + i + "' style='margin-top: 7px'>&nbsp;</label>";
								str += "</div>";
								str += "</td>"
								str += "<td>"
								str += "<input type='text' id='date" + i + "' readonly='readonly' class='datepicker form-control text-center data" + i + "' value='" + accountbookVo.accountbookRegDate + "' style='margin-top:7px' placeholder='날짜'>";
								str += "</td>";
								str += "<td>";
								str += "<input type='text' class='form-control text-center data" + i + "' style='margin-top: 7px' id='usage" + i + "' value='" + accountbookVo.accountbookUsage + "' placeholder='사용내역'>";
								str += "</td>";
								str += "<td>";
								str += "<input type='text' class='form-control text-center data" + i + "' style='margin-top: 7px' id='spend" + i + "' value='" + accountbookVo.accountbookSpend + "' placeholder='지출액'>";
								str += "</td>";
								str += "<td>";
								str += "<select class='form-control custom-select text-center data" + i + "' style='margin-top: 7px' id='category" + i + "'>";
								str += "<option selected>분류</option>";
								if (accountbookVo.categoryNo == 1) {
									str += "<option value='1' selected>식당</option>";
								} else {
									str += "<option value='1'>식당</option>";
								}
								str += "<option value='2'>주점</option>";
								str += "<option value='3'>카페</option>";
								str += "<option value='4'>배달</option>";
								str += "<option value='5'>간식</option>";
								str += "<option value='6'>잡화(비품)</option>";
								str += "<option value='7'>여행/MT</option>";
								str += "<option value='8'>교통비</option>";
								str += "<option value='9'>경조사비</option>";
								str += "<option value='10'>모임회비</option>";
								str += "<option value='11'>기타지출 </option>";
								str += "</select>";
								str += "</td>";
								str += "<td>";
								str += "<input type='text' class='form-control text-center data" + i + "' style='margin-top: 7px' id='tag" + i + "' value='" + accountbookVo.tagName + "' placeholder='태그'>";
								str += "<td>";
								str += "</tr>";

								$("[id=accountbookContent]").append(str);
								datepickerReset();

							}

							//마지막칸 새로운 라인 추가
							function newline(i) {
								var str = "";

								str += "<tr id='" + i + "' class='form-group'>";
								str += "<td>";
								str += "<div class='custom-control custom-checkbox'>";
								str += "<input type='checkbox' class='custom-control-input data" + i + "' id='customCheck" + i + "' name='chk'>";
								str += "<label class='custom-control-label'  for='customCheck" + i + "' style='margin-top: 7px'>&nbsp;</label>";
								str += "</div>";
								str += "</td>"
								str += "<td>"
								str += "<input type='text' id='date" + i + "' readonly='readonly' class='datepicker form-control text-center data" + i + "' value='' style='margin-top:7px' placeholder='날짜'>";
								str += "</td>";
								str += "<td>";
								str += "<input type='text' class='form-control text-center data" + i + "' style='margin-top: 7px' id='usage" + i + "' value='' placeholder='사용내역'>";
								str += "</td>";
								str += "<td>";
								str += "<input type='text' class='form-control text-center data" +i + "' style='margin-top: 7px' id='spend" + i + "' value='' placeholder='지출액'>";
								str += "</td>";
								str += "<td>";
								str += "<select class='form-control custom-select text-center data" + i + "' style='margin-top: 7px' id='category" + i + "'>";
								str += "<option selected>분류</option>";
								str += "<option value='1'>식당</option>";
								str += "<option value='2'>주점</option>";
								str += "<option value='3'>카페</option>";
								str += "<option value='4'>배달</option>";
								str += "<option value='5'>간식</option>";
								str += "<option value='6'>잡화(비품)</option>";
								str += "<option value='7'>여행/MT</option>";
								str += "<option value='8'>교통비</option>";
								str += "<option value='9'>경조사비</option>";
								str += "<option value='10'>모임회비</option>";
								str += "<option value='11'>기타지출 </option>";
								str += "</select>";
								str += "</td>";
								str += "<td>";
								str += "<input type='text' class='form-control text-center data" + i + "' style='margin-top: 7px' id='tag" + i + "' value='' placeholder='태그'>";
								str += "<td>";
								str += "</tr>";

								$("[id=accountbookContent]").append(str);
								datepickerReset();
							}

							//마지막 줄 선택시 새로운 라인 삽입
							$("[id=accountbookContent]")
									.on(
											"focus",
											"tr",
											function() {
												var $this = $(this);
												console.log($('[id=tag]').attr('value'));
												$this.attr("id");
												if ($(
														'[id=accountbookContent] > tr')
														.index(this) == $(
														'[id=accountbookContent] > tr ')
														.last().index()) {
													var today = new Date();
													var yyyy = today
															.getFullYear();
													var mm = today.getMonth() + 1;
													var dd = today.getDate();

													$("[id=date" + $this.attr("id")+ "]").attr("value",yyyy + "년 " + mm + "월 " + dd + "일");

													var row = parseInt($this
															.attr("id")) + 1;
													newline(row);
												}

											});

							//////////////////////////////////////////////////////////////
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
										monthNames : [ '1월', '2월', '3월', '4월',
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
									$('header').removeClass('nav-down')
											.addClass('nav-up');
								} else {
									// 스크롤 올릴때
									if (st + $(window).height() < $(document)
											.height()) {
										$('header').removeClass('nav-up')
												.addClass('nav-down');
									}
								}
								lastScrollTop = st;
							}

							function datepickerReset() {
								$(document).find(".datepicker").removeClass(
										'hasdatepicker').datepicker();

								$.datepicker.setDefaults({
									prevText : '이전 달',
									nextText : '다음 달',
									monthNames : [ '1월', '2월', '3월', '4월',
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
							
							$('[id=monthCal]').change( 
									function changeAccountbookList() {
										fetchAccountbookList()
									}
									 );
						})
	</script>


</body>
</html>