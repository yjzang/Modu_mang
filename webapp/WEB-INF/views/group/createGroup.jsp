<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<title>첫 모임생성페이지</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/bootstrap.css"> <!-- stylesheet 외부의 css 가져오겟다 -->
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/Modu.css"> <!-- stylesheet 외부의 css 가져오겟다 --> 
</head>
<body style="overflow-x:hidden; overflow-y:auto;">

<!-----------header------------------>

<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>

<div class="container">
	<div width="100%">
		<div class="carousel-inner">
		    <div class="carousel-caption d-none d-md-block mb-5">		      
			    <h1 class="textalgin-center">모임이 없습니다.</h1>
			    
			    <h1 class="textalgin-center">모임을 추가하세요.</h1>
			    <br><br>
			    <button type="button" class="btn btn-mint btn-lg" data-toggle="modal" data-target="#exampleModalCenter">모임 추가하기</button>
			    <br>
			</div>
		    <img class="d-block w-100" src="${pageContext.request.contextPath }/assets/images/main04.png" alt="create-group">
		</div>
	</div>
</div>


	<!-- Modal -->
	 <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content text-center">
	      <div class="modal-header">
	        <h5 class="modal-title ml-3" id="exampleModalCenterTitle">모임 정보 입력</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      	<center>
	      	<!-- <label for="gname1">모임 이름</label> -->
	      	<input type="text" class="form-control w-75 text-center" aria-label="Large" aria-describedby="inputGroup-sizing-sm" id="gname1" name="gname" value="모임이름"><br>
	      	<!-- <label for="gtag1">모임 설명, 해시태그</label> -->
	      	<input type="text" class="form-control w-75 text-center" aria-label="Large" aria-describedby="inputGroup-sizing-sm" id="gtag1" name="gtag" value="모임설명, 해시태그"><br>

	      	<div class="input-group w-75">
			  <div class="custom-file">
			    <input type="file" class="custom-file-input" id="inputGroupFile02">
			    <label class="custom-file-label" for="inputGroupFile02">이미지 업로드 &emsp;</label>
			  </div>
			</div>
			<br>

			<label for="gcar1">모임 성격</label>
	      	<!-- <input type="text" class="form-control w-75" aria-label="Large" aria-describedby="inputGroup-sizing-sm" id="gcar1" name="gcar"> --><br>

	      	<div class="custom-control custom-radio custom-control-inline">
			  <input type="radio" id="customRadioInline1" name="customRadioInline" class="custom-control-input">
			  <label class="custom-control-label" for="customRadioInline1">성격1</label>
			</div>
			<div class="custom-control custom-radio custom-control-inline">
			  <input type="radio" id="customRadioInline2" name="customRadioInline" class="custom-control-input">
			  <label class="custom-control-label" for="customRadioInline2">성격2</label>
			</div>
			<div class="custom-control custom-radio custom-control-inline">
			  <input type="radio" id="customRadioInline3" name="customRadioInline" class="custom-control-input">
			  <label class="custom-control-label" for="customRadioInline3">성격3</label>
			</div>
			<div class="custom-control custom-radio custom-control-inline">
			  <input type="radio" id="customRadioInline4" name="customRadioInline" class="custom-control-input">
			  <label class="custom-control-label" for="customRadioInline4">기타</label>
			</div>

	      	</center>
	        <div class="text-center mb-3">
	        	<br>
	        <button class="btn btn-success">모임 생성하기</button>
	      </div>
	    </div>
	  </div>
	</div>
	</div>  

<!--footer--> 
<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>


	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>
	<script type="text/javascript">
		$('#exampleModal').on('show.bs.modal', function (event) {
		  var button = $(event.relatedTarget) // Button that triggered the modal
		  var recipient = button.data('whatever') // Extract info from data-* attributes
		  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
		  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
		  var modal = $(this)
		  modal.find('.modal-title').text('New message to ' + recipient)
		  modal.find('.modal-body input').val(recipient)
		});
	</script>
</body>
</html>