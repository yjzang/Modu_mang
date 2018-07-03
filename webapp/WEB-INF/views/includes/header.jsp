<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-----------header------------------>
<header>
	<nav class="container navbar navbar-expand-lg navbar-light bg-light">

		<a class="navbar-brand" href="${pageContext.request.contextPath }/main">
			<img class="mb-1" src="${pageContext.request.contextPath }/assets/images/logo1.png" width="168" height="72" alt="모두의 가계부"> 
		</a>


		<form class="form-inline mt-3" >
			<input class="form-control mr-sm-1 searchForm"  style= "border-bottom-width:2px; border-color: #0070c0; width: 300px;" type="search" placeholder="모임을 검색하세요" aria-label="search">
			<button class="t-button mt-2" type="submit"> <img src="${pageContext.request.contextPath }/assets/images/search.png"> </button>
		</form>
		<div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
			<ul class="navbar-nav mt-2">

				<button class="mr-2" style="border:2px solid #0179c1;  background-color:white;">
					<a class="nav-link" href="#" style="color: #0179c1; font-weight: bold;">로그인</a>
				</button> 

				<button class="mr-2"style="border:2px solid #0179c1; background-color:white; ">
					<a class="nav-link" href="#" style="color: #0179c1; font-weight: bold;">회원가입</a>
				</button> 

			</ul>

		</div>
	</nav>
	<!-- <div style="margin-bottom: 80px;"></div> -->


	<nav id="secNav" class="container navbar navbar-expand-lg navbar-light bg-light">

		<div class="collapse navbar-collapse justify-content-center" id="navbarNavDropdown" width="70">

			<ul class="navbar-nav icon">

				<li class="nav-item">
					<a class="nav-link" href="#" style="font-size: 1.4em;  font-weight: 800; color: #54c9ad;">나의 모임 <span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item">
					<div class="clubIcon active">
						<img src="${pageContext.request.contextPath }/assets/images/club01.png" alt="club01">
						<br>
						<a class="nav-link" href="#">모임1</a>
					</div>

				</li>
				<li class="nav-item">
					<div class="clubIcon">
						<img src="${pageContext.request.contextPath }/assets/images/club02.png" alt="club02">
						<a class="nav-link" href="#">모임2</a>
					</div>  

				</li>
				<li class="nav-item">
					<div class="clubIcon">
						<img src="${pageContext.request.contextPath }/assets/images/club03.png" alt="club03">
						<a class="nav-link" href="#">모임3</a>
					</div>

				</li>

				<li class="nav-item">
					<div class="clubIcon"> 
						<img src="${pageContext.request.contextPath }/assets/images/club04.png" alt="club04">
						<a class="nav-link" href="#">모임4</a>
					</div>
				</li>
				<li class="nav-item">
					<div class="clubIcon">
						<img src="${pageContext.request.contextPath }/assets/images/club05.png" alt="club05">
						<a class="nav-link" href="#">모임5</a>
					</div>
				</li> 
				<li class="nav-item ml-0">
					<div class="clubIcon">
						<button class="t-button"><img src="${pageContext.request.contextPath }/assets/images/down.png" alt="more"></button>
					</div>
				</li>	
				<li class="nav-item ml-0">
					<div class="clubIcon">
						<button class="btn btn-sm btn-mint">모임 추가하기 </button>
					</div>
				</li>	
			</ul>
		</div>
	</nav>



	<nav id="thirdNav" class="container navbar navbar-expand-lg navbar-light bg-light" >



		<div class="collapse navbar-collapse justify-content-center" id="navbarNavDropdown" >

			<ul class="navbar-nav ">
				<li id="btn_main" class="nav-item menuTab active">
					<a class="nav-link" href="${pageContext.request.contextPath }/main">메인 <span class="sr-only">(current)</span></a>
				</li>
				<li id="accountbook" class="nav-item menuTab">
					<a class="nav-link" href="${pageContext.request.contextPath }/accountbook/accountbook">가계부</a>
				</li>
				<li class="nav-item menuTab dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						통계
					</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="#">월간</a>
						<a class="dropdown-item" href="#">연간</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">행사별</a>
					</div>
				</li>
				<li id="btn_board" class="nav-item menuTab">
					<a class="nav-link" href="${pageContext.request.contextPath }/board" onclick="btn_board()">게시판</a>
				</li>

				<li class="nav-item menuTab">
					<a class="nav-link" href="${pageContext.request.contextPath }/membershipfee">회비관리</a>
				</li>
				<li class="nav-item menuTab">
					<a class="nav-link" href="#">모임관리</a>
				</li>
			</ul> 	
		</div>
	</nav>  
</header>
