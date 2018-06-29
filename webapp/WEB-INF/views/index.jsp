<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">



	
	<!-- <meta name="viewport" content="width=device-width", initial-scale="1"> 반응형 -->
	<title>모두의 가계부</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/bootstrap.css"> <!-- stylesheet 외부의 css 가져오겟다 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/Modu.css"> <!-- stylesheet 외부의 css 가져오겟다 -->
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
	
</head>




<body style="overflow-x:hidden; overflow-y:auto;">


<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>

<!----------------- container------------------->
<div class="container">

	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" width="100%">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<div class="carousel-caption d-none d-md-block mb-5">		      
					<h1 class="mr-5">누구나, 한눈에 볼 수 있는 &ensp;&ensp;</h1>

					<h1 class="ml-4">&nbsp;&ensp;&ensp;&ensp; 투명한 재정관리 </h1>
					<br><br>
					<button class="btn btn-primary btn-lg">모두의 가계부 시작하기</button>
					<br>
				</div>

				<img class="d-block w-100" src="${pageContext.request.contextPath }/assets/images/main01.png" alt="First slide">

			</div>
			<div class="carousel-item"  >
				<div class="carousel-caption d-none d-md-block mb-5">
					<h1> 여러 모임 속에서 </h1>
					<h1> 다양한 가계부를 한눈에 </h1>
					<br>
					<br>
					<button class="btn btn-primary btn-lg">지금 바로 시작하기</button>
				</div>
				<img class="d-block w-100" src="${pageContext.request.contextPath }/assets/images/main02.png" alt="Second slide" >
			</div>
			<div class="carousel-item">
				<div class="carousel-caption d-none d-md-block mb-5">
					<h1> 총무에게 편리한 </h1>
					<h1>  &ensp; &ensp;회비 관리 서비스</h1>
					<br>
					<br>
					<button class="btn btn-primary btn-lg">바로 시작하기</button>
				</div>
				<img class="d-block w-100" src="${pageContext.request.contextPath }/assets/images/main03.png" alt="Third slide">
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
	<div class="ment" style="text-align: center;">
		<br>
		<span class="ment01" style="color: #0070c0;"> 모두의</span>
		<span class="ment02" > 가계부</span>
		<span class="ment03">만의 확실한 서비스</span>

	</div>
	<div class="card-deck mt-5" >
		<div class="card" style="border: none">
			<img class="w-40 mx-auto" src="${pageContext.request.contextPath }/assets/images/skill01.png" alt="Card image cap">
			<div class="card-body" style="text-align: center">
				<h4 class="card-title">빅데이터 기반 <br> 맞춤 추천 서비스</h4>
				<p class="card-text">다양한 모임장소 데이터를 기반으로 <br>우리 모임에게 적절한<br> 모임 장소를 추천</p>
			</div>

		</div>
		<div class="card" style="border: none">
			<img class="w-40 mx-auto" src="${pageContext.request.contextPath }/assets/images/skill02.png" alt="Card image cap">
			<div class="card-body" style="text-align: center">
				<h4 class="card-title">다중 가계부</h4>
				<p class="card-text">여러 모임에<br> 다양한 가계부를<br> 한번에 정리할 수 있어요</p>
			</div>
		</div>
		<div class="card" style="border: none">
			<img class="w-40 mx-auto" src="${pageContext.request.contextPath }/assets/images/skill03.png" alt="Card image cap">
			<div class="card-body" style="text-align: center">
				<h4 class="card-title">SMS 인식 기반 <br> 자동 입력 기능</h4>
				<p class="card-text">모든 sms알람을 <br>자동으로 인식하여 <br>편하게 입력할 수 있어요</p>
			</div>
		</div>
	</div>
</div>
	

<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>




	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/header.js"></script>
	
	
</body>
</html>