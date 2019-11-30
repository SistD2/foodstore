<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
	
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="sweetalert2.all.min.js"></script>
<!-- Optional: include a polyfill for ES6 Promises for IE11 -->
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
<style type="text/css">
body {
	font-size: 1.2em;
}

#context {
	margin-top: 5%;
	margin-left: 10%;
	margin-right: 10%;
	margin-bottom: 10%;
	position: relative
}

#carousel-set {
	background-color: lightgray;
	border: 2px black solid;
	height: 30em;
}

#sidebar {
	background-color: orange !important;
	height: 51em;
}

.nav-link {
	color: black;
}

.childli {
	margin-left: 1em;
}

.formlabel {
	width: 90px;
}
</style>
<script type="text/javascript">
function sweetalert(context){
	 Swal.fire({
	    icon: 'error',
	    title: '정보 입력 에러',
	    text: context
	  });
}
function telchk() {
	var len = $("input[name=userTel]").val().length;
	if( len==3||len==8){
		$("input[name=userTel]").val($("input[name=userTel]").val()+"-");
	}
}
function chkTel(){
	var regExp = /^\d{3}-\d{3,4}-\d{4}$/;
	
	if (regExp.test($('input[name=userTel]').val())) return true;
    else return false;
}

function chkEmail() {
    var regExp = /^[A-Za-z0-9_\.\-]+@[A-Za-z\-]+\.[A-Za-z\-]+/;
    
    if (regExp.test($('input[name=userEmail]').val())) return true;
    else return false;
}
function chkaddress(){
	if($("#sample4_roadAddress").val()=="" && $("#sample4_postcode").val()=="") return false;
	else return true;
}
function formsubmit() {
	if(!chkTel()){
		sweetalert('정확한 전화번호를 입력해주세요.');
	}else if(!chkEmail()){
		sweetalert('정확한 이메일를 입력해주세요.');
	}else if(!chkaddress()){
		sweetalert('우편번호 찾기로 주소를 입력해주세요.');
	}else{
		$("#joinform").submit();
	}
	
}


</script>
<script>
	// Example starter JavaScript for disabling form submissions if there are invalid fields
	(function() {
		'use strict';
		window.addEventListener('load', function() {
			// Fetch all the forms we want to apply custom Bootstrap validation styles to
			var forms = document.getElementsByClassName('needs-validation');
			// Loop over them and prevent submission
			var validation = Array.prototype.filter.call(forms, function(form) {
				form.addEventListener('submit', function(event) {
					if (form.checkValidity() === false) {
						event.preventDefault();
						event.stopPropagation();
					}
					form.classList.add('was-validated');
				}, false);
			});
		}, false);
	})();
</script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                
                
             

               
            }
        }).open();
    }
</script>

<script type="text/javascript">
</script>
</head>
<body>

	<div class="container-fluid">
		<div class="row">
			<nav class="col-md-2 d-none d-md-block bg-light sidebar" id="sidebar">
				<div class="sidebar-sticky">
					<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link active"
							href="../main"> <span data-feather="home"></span>
								<h2>
									<strong>LOGO</strong>
									<hr>
								</h2> <span class="sr-only"></span>
						</a></li>
						<li class="nav-item"><a class="nav-link" href="#"> <span
								data-feather="file"></span>
								<p class="childli">매출 조회</p>
						</a></li>
						<li class="nav-item"><a class="nav-link" href="#"> <span
								data-feather="file"></span>
								<p class="childli">가맹점</p>
						</a></li>
						<li class="nav-item"><a class="nav-link" href="#"> <span
								data-feather="file"></span>
								<p class="childli">제품 목록</p>
						</a></li>
						
						
					</ul>


					<!-- 
        <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
          <span>Saved reports</span>
          <a class="d-flex align-items-center text-muted" href="#">
            <span data-feather="plus-circle"></span>
          </a>
        </h6>
        <ul class="nav flex-column mb-2">
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file-text"></span>
              Current month
            </a>
          </li>
        </ul>
         -->
				</div>
			</nav>

			<main role="main" class="col-md-10 ml-sm-auto col-lg-10"
				style="padding:0">
			<div
				class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
				<h1 class="h2">&nbsp;스시오</h1>
				<div class="btn-toolbar mb-2 mb-md-0">
				
				</div>
			</div>

			<div id="context">
				<div style="border-bottom: 2px solid black">
					<h2>가맹점 회원 가입</h2>
				</div>
				<br>
				<form class="needs-validation" novalidate id="joinform"  method="POST">

					<div class="form-group row">
						<label for="validationTooltip01" class="formlabel">ID </label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="userId"
								id="validationTooltip01" placeholder="ID"
								value="fran${nextUser}" required readonly>
						</div>
					</div>
					<div class="form-group row">
						<label for="validationTooltip02" class="formlabel">PW</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" name="userPw"
								id="validationTooltip02" value="" required>
						</div>
					</div>
					<div class="form-group row">
						<label for="validationTooltipUsername" class="formlabel">지점명</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="userName"
								id="validationTooltipUsername" placeholder="지점명" required>
						</div>
					</div>
					<div class="form-group row">
						<label for="validationTooltipUsername" class="formlabel">등록일</label>
						<div class="col-sm-10">
							<input type="date" class="form-control" name="regDate"
								id="validationTooltipUsername" placeholder="등록일" required>

						</div>
					</div>
					<div class="form-group row">
						<label for="validationTooltip03" class="formlabel">전화번호</label>
						<div class="col-sm-10">
							<input type="tel" class="form-control" id="validationTooltip03"
								 onkeydown="telchk()" name="userTel"
								placeholder="010-0000-0000" required maxlength="13">
						</div>
					</div>
					<div class="form-group row">
						<label for="validationTooltip04" class="formlabel">이메일</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="validationTooltip04" name="userEmail"
								placeholder="test@google.com" required>
						</div>
					</div>
					<div class="form-group row">
						<label class="formlabel">주소</label>
						<div class="col-sm-8">
							<input type="text" id="sample4_roadAddress" class="form-control" name="userAddress1" placeholder="도로명주소" required readonly> 
						</div>
						<input class="btn btn-primary" type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
						
						
					</div>
					<div class="form-group row">
						<label class="formlabel">상세주소</label>
						<div class="col-sm-5">
							<input type="text" id="sample4_postcode" class="form-control" name="userAddress2" placeholder="우편번호" required readonly>
						</div>
						<div class="col-sm-5">
							<input type="text" id="sample4_detailAddress" class="form-control" name="userAddress3" placeholder="상세주소" required >
						</div>
					</div>
					

					<br>
					<hr>
					<div style="text-align: center;">
						<input class="btn btn-primary" type="button" onclick="formsubmit()" value="회원가입">
					</div>
				</form>

			</div>
		</div>

		</main>

	</div>
</html>
