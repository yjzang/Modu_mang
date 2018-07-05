<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>

<html>
<head>
	<meta charset="UTF-8">
	<!-- <meta name="viewport" content="width=device-width", initial-scale="1"> 반응형 -->
	<title>모두의 가계부</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/bootstrap.css"> <!-- stylesheet 외부의 css 가져오겟다 -->
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/Modu.css"> <!-- stylesheet 외부의 css 가져오겟다 --> 
</head>
<body style="overflow-x:hidden; overflow-y:auto;">




<!-- 수정 확인 -->
<!-----------header------------------>

<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>

<!----------------- container------------------->

<div class="container text-center" >
 
<c:if test="${empty list}">

	<center class="mb-5">

				<div class="carousel-item active">
					<div class="carousel-caption d-none d-md-block mb-5  text-left">
						<img class="d-block w-100" src="${pageContext.request.contextPath }/assets/images/board0.png" alt="게시판에 글이 없음">
							<p>테스트</p>
						 <a	href="${pageContext.request.contextPath}/board/write" class="btn btn-sm btn-primary"> 글쓰기 </a>

					</div>

				</div>



			</center>
</c:if>				
<div class="mb-5">
      <a href="${pageContext.request.contextPath }/board/write" class="btn btn-sm btn-primary">
							글쓰기		
		</a>
</div>
<c:forEach items="${list}"	var="boardVo" >
	<div class="card text-center w-75 mx-auto my-2">
		<div class="card-header">
			<!-- Button trigger modal -->

			<h4 class="card-title mt-3">
				${boardVo.boardTitle}
			</h4>
			<div class="text-right mr-5">
				
				<a href="${pageContext.request.contextPath }/board/write" class="btn btn-sm btn-secondary">
					수정		
				</a>
				<button type="button" class="btn btn-sm btn-secondary" data-toggle="modal" data-target="#deleteModal">
					삭제		
				</button>
			</div>

			<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							
						
						</div>
						<div class="modal-body d-flex" style="align-items: center; justify-content: center;">
							<div style="font-weight: bold;">정말로 삭제 하시겠습니까?</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-outline-dark" data-dismiss="modal">닫기</button>
							<button type="button" class="btn btn-outline-danger">삭제</button>
						</div>
					</div>
				</div>
			</div>


			<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active" style="color: #00b0f0"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
				</ol>
				<div class="carousel-inner boardImg">
					<div class="carousel-item active">
						<img class="d-block" src="${pageContext.request.contextPath }/assets/images/moim01.jpg" alt="First slide">
					</div>
					<div class="carousel-item">
						<img class="d-block" src="${pageContext.request.contextPath }/assets/images/moim02.jpg" alt="Second slide">
					</div>
					<div class="carousel-item">
						<img class="d-block" src="${pageContext.request.contextPath }/assets/images/moim03.jpg" alt="Third slide">
					</div>
					<div class="carousel-item">
						<img class="d-block" src="${pageContext.request.contextPath }/assets/images/moim04.jpg" alt="Third slide">
					</div>
					<div class="carousel-item">
						<img class="d-block" src="${pageContext.request.contextPath }/assets/images/moim05.jpg" alt="Third slide">
					</div>
					
				</div>
				<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a>
				<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
			<!-- Button trigger modal -->
			<div class="text-right mr-5">
				<button type="button" class="btn btn-primary " data-toggle="modal" data-target="#boardUploadModal">
					사진 추가하기 			
				</button>
			</div>

			<!-- Modal -->
			<div class="modal fade" id="boardUploadModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content">
						<div class="modal-header">

							<h4 class="modal-title mt-2" id="exampleModalCenterTitle">&nbsp;사진 추가</h4>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">

							<form enctype="multipart/form-data" >
								<div class="form-group p-2" style="position: relative;">
									<input type="file" class="custom-file-input" id="boardUpload"  multiple="true" onchange="loadFile(event);">
									<label class="custom-file-label text-center pr-5" for="inputGroupFile04">이미지 업로드 &emsp;</label>
									<img id="addImg"  src="" class="w-100 mx-auto mt-3">
								</div>
							</form>

							<!-- <form enctype="multipart/form-data">
								<div class="form-group p-2">
									<input type="file" class="form-control-file" id="boardUpload" multiple="true" onchange="loadFile(event);">
									<img id="addImg"  src="" class="w-100 mx-auto mt-3">
								</div>
							</form> -->
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
							<button type="button" class="btn btn-primary">추가</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="card-body">
			<div class="text-left p-5 mb-4" style="border:dashed black 1px ; width: 50%">
				<pre class="card-text" id="boardContent" > ${boardVo.boardContent}</pre>
			

			</div>
			<div class="text-left my-3">
				<span class="p-2" style="border:#54c9ad 2px solid; border-radius: 15px;  ">
					#6월모임
				</span>
			</div>
			<div>
				<table class="table table-sm text-center">
					<thead class="thead-light">
						<tr>
							<th scope="col"></th>
							<th scope="col">날짜</th>
							<th scope="col">사용내역</th>
							<th scope="col">금액</th>
							<th scope="col">분류</th>
							<th scope="col">태그</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">
								<input width=40px type="checkbox" aria-label="Checkbox for following text input">

							</th>
							<td>2018/06/28</td>
							<td>삼겹살</td>
							<td>150000</td>
							<td>식비</td>
							<td>#6월모임</td>

						</tr>
						<tr>
							<th scope="row">
								<input type="checkbox" aria-label="Checkbox for following text input">
							</th>
							<td>2018/06/28</td>
							<td>소주한잔</td>
							<td>77000</td>
							<td>식비</td>
							<td>#6월모임</td>

						</tr>
						<tr>
							<th scope="row">
								<input type="checkbox" aria-label="Checkbox for following text input">
							</th>
							<td>2018/06/28</td>
							<td>버스 대절</td>
							<td>200000</td>
							<td>교통비</td>
							<td>#6월모임</td>

							
						</tr>
					</tbody>
				</table>

			</div>

			<div class="card-footer p-1">
				<div class="text-left my-2">
					<span>
						<!-- <button class="t-button p-1"> <img width=50px src="${pageContext.request.contextPath }/assets/images/coment.png"></button> -->
						<button class="t-button p-1 ml-2"> <img id="like" width=50px src="${pageContext.request.contextPath }/assets/images/like_off.png"> </button>
					</span>
					<span class="ml-2">
						12명의 회원이 좋아합니다.
					</span>

				</div>



				<div>

					<div class="my-2 text-left comment-top" id="multiCollapseExample1">

						<div class="card">
							<h5 class="card-header"><span class="mr-3  mb-1"><img src="${pageContext.request.contextPath }/assets/images/club02.png"></span><span>김삼겹</span></h5>
							<div class="card-body comment">

								<p class="comment">삼겹살에 김치 꿉고 상추에 쌈싸서 크흐~</p>

							</div>
						</div>
					</div>
				</div>

				<p>
					<button class="btn btn-sm btn-secondary" id="btn-comment" type="button" data-toggle="collapse" data-target=".multi-collapse" aria-expanded="false" aria-controls="multiCollapseExample1 multiCollapseExample2" value="0">댓글 더 보기</button>
				</p>
				<div>
					<div>
						
						<div class="collapse multi-collapse my-2 text-left" id="multiCollapseExample1">
							
							<div class="card">
								<h5 class="card-header"><span class="mr-3  mb-1"><img src="${pageContext.request.contextPath }/assets/images/club02.png"></span><span>김삼겹</span></h5>
								<div class="card-body comment">
									
									<p class="comment">삼겹살에 김치 꿉고 상추에 쌈싸서 크흐~</p>
									
								</div>
							</div>
						</div>
					</div>
					<div>
						
						<div class="collapse multi-collapse my-2 text-left" id="multiCollapseExample2">
							
							<div class="card">
								<h5 class="card-header"><span class="mr-3 mb-1"><img src="${pageContext.request.contextPath }/assets/images/club01.png"></span><span>김태클</span></h5>
								<div class="card-body comment">
									
									<p  class="comment">근데 여기 사이트 댓글 형식 좀 이상하지 않냐?</p>

									
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="input-group my-3">
					<div class="input-group-prepend"  >
						<span class="input-group-text" id="">장현수</span>
					</div>
					<input type="text" class="form-control " placeholder="댓글을 입력하세요" aria-label="Recipient's username" aria-describedby="basic-addon2">
					<div class="input-group-append">
						<button class="btn btn-outline-secondary" type="button" style="border:"><img src="${pageContext.request.contextPath }/assets/images/write01.png"></button>
					</div>
				</div>


			</div>
		</div>

	</div>
	
</c:forEach>

</div>





	<!----------------- footer------------------->		
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>



	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/header.js"></script>
	<script type="text/javascript">

	

		$(document).ready(function(){
			
			$('.menuTab').removeClass("active");
			$("#btn_board").addClass("active");
		});
	
		/*좋아요*/


		$("#like").on('click',function(){

			var fileName = $("#like").attr('src');
			fileName = fileName.split(".");
			fileName = fileName[0].split("/");
			fileName = fileName.pop(); /* 배열의 맨마지막 요소 불러오기 */
			console.log(fileName);
			if(fileName=="like_off"){
				$("#like").attr("src","${pageContext.request.contextPath }/assets/images/like.png");
			} else{
				$("#like").attr("src","${pageContext.request.contextPath }/assets/images/like_off.png");
			}
		

		});

		/*   댓글 펼치기,감추기   */


		$("#btn-comment").on("click",function(){

			var val = $('#btn-comment').val();
			console.log(val);

			if(val==0){
				$('.comment-top').hide();
				$('#btn-comment').val("1");
				$(this).html("댓글 감추기");
			} else {

				$('.comment-top').show();
				$('#btn-comment').val("0");
				$(this).html("댓글 더 보기");
			}
			
			return	

		});    


		/*  이미지 미리보기 , 확장자 체크  */		

		var loadFile = function(event) {
			var addImg = document.getElementById('addImg');
			addImg.src = URL.createObjectURL(event.target.files[0]);

			var fileName = $("#boardUpload").val();

			fileName = fileName.slice(fileName.indexOf(".") + 1).toLowerCase();
			console.log(fileName);
			if(fileName != "jpg" && fileName != "png" &&  fileName != "gif" &&  fileName != "bmp"){

				alert("이미지 파일은 (jpg, png, gif, bmp) 형식만 등록 가능합니다.");

				$("#boardUpload").val('');
				$("#addImg").hide();
				
				/*$('#boardUploadModal').modal('hide');*/
				
			} else{
				$("#addImg").show();
			}

		};

		/*  navbar 스크롤 제어  */

		//Hide Header on on scroll down 
		var didScroll; 
		var lastScrollTop = 0; 
		var delta = 5; 
		var navbarHeight = $('header').outerHeight(); 

		$(window).scroll(function(event){ 
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

         // Make sure they scroll more than delta 
         if(Math.abs(lastScrollTop - st) <= delta) 
         	return; 

         // If they scrolled down and are past the navbar, add class .nav-up. 
         // This is necessary so you never see what is "behind" the navbar. 
         if (st > lastScrollTop && st > navbarHeight){ 
         // Scroll Down 
         $('header').removeClass('nav-down').addClass('nav-up');
     } else { 
         // Scroll Up 
         if(st + $(window).height() < $(document).height()) { 
         	$('header').removeClass('nav-up').addClass('nav-down'); 
         } 
     } 

     lastScrollTop = st; 

     

 }
</script>
</body>
