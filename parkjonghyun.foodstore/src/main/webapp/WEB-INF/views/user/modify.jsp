<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src='http://code.jquery.com/jquery-3.1.1.min.js'></script>
<script
   src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="sweetalert2.all.min.js"></script>
<!-- Optional: include a polyfill for ES6 Promises for IE11 -->
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script><style type="text/css">
@font-face{
	font-family: 'Binggrae';
	src:url("../../resources/css/Binggrae-Bold.ttf") format('truetype');
}
body {
	font-size: 1.2em;
	font-family: Binggrae;
}
input[type=password]{
	font-family: serif;
}
.dropdown-toggle {
   background: #ECC45D;
   color: black;
   border: 2px solid;
   width: 5.8em;
   height: 2.8em;
   font-size: 1em;
   margin-right: 1em;
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

.logo{
   margin-left:-5px;
   margin-top:10px;
   padding-bottom:7px;
}
.childli {
	margin-left: 1em;
}

.formlabel {
   width: 90px;
}

.btn-primary{
   margin-right:10px;
}
</style>
<script type="text/javascript">
function telchk() {
   var len = $("input[name=userTel]").val().length;
   if( len==3||len==8){
      $("input[name=userTel]").val($("input[name=userTel]").val()+"-");
   }
}
</script>

<script>


function buttonYellow(){
   Swal.fire({
   title: '수정 하시겠습니까?',
   text: "회원정보가 수정 됩니다.",
   icon: 'warning',
   showCancelButton: true,
   confirmButtonColor: '#3085d6',
   cancelButtonColor: '#d33',
   confirmButtonText: '수정',
   cancelButtonText: '취소'
   }).then(result => {
      if (result.value) {
         $.ajax({
            url:'update',
            type:'POST',
            data:{ userId: $('[name="userId"]').val(),
               userPw: $('[name="userPw"]').val(),
               regDate: $('[name="regDate"]').val(),
               userName: $('[name="userName"]').val(),
               userTel: $('[name="userTel"]').val(),
               userEmail: $('[name="userEmail"]').val(),
               userAddress: $('[name="userAddress"]').val()
            },
            success: function(data){
               if(data){
                  Swal.fire(
                  '수정 되었습니다!',
                  '회원정보가 수정 되었습니다.',
                  'success'
                  )
                  setTimeout(function(){
                     window.location.href = "list"
                     }, 1500);
               }
               },
         error: function(a, b, errMsg){
            Swal.fire(
                  '모든 값을 입력해주세요.',
                  '회원정보가 수정에 실패했습니다.',
                  'warning'
                  )
         },
      });
      }
   })
}

function buttonRed(id){
   Swal.fire({
      title: '삭제 하시겠습니까?',
      text: "회원정보가 삭제됩니다.",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: '삭제',
      cancelButtonText: '취소'
      }).then((result) => {
        if (result.value) {
          Swal.fire(
            '삭제 되었습니다!',
            '회원 정보가 되었습니다.',
            'success'
          )
          
          setTimeout(function(){
        	  deleteuser(id);
          }, 1500);
          
        }
      })
}
function deleteuser(id){
	$.ajax({
        url:'delete',
        type:'POST',
        data:{ id : id},
        success: function(data){
        	window.location.href = "list"
        },
     	error: function(a, b, errMsg){
        	alert('에러 발생 관리자에게 문의해주세요');
     }
  });
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
                     href="../main1.html"> <span data-feather="home"></span>
                        <h2 class="logo">
                           <strong>LOGO</strong>
                        </h2><hr> <span class="sr-only"></span>
                  </a></li>
                  <li class="nav-item"><a class="nav-link" href="../sale/01.html"> <span
                        data-feather="file"></span>
                     <p class="childli">매출 조회</p>
                  </a>
                  <a class="nav-link" href="list"> <span
                        data-feather="file"></span>
                     <p class="childli">가맹점</p>
                  </a>
                  <a class="nav-link" href="../product/list"> <span
                        data-feather="file"></span>
                     <p class="childli">제품 목록</p>
                  </a>
                 </li>
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

         <div role="main" class="col-md-10 ml-sm-auto col-lg-10">
            <div
               class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
               <h1 class="h2">&nbsp;스시오</h1>
               <div class="btn-toolbar mb-2 mb-md-0">
                  <p>
                     <div class="dropdown">
                        <button class="btn btn-warning dropdown-toggle" type="button"
                           id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true"
                           aria-expanded="false">본사</button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
                           <button class="dropdown-item" type="button">
                              <a href="join">가맹점 등록</a>
                           </button>
                           <button class="dropdown-item" type="button">
                              <a href="logout">로그아웃</a>
                           </button>
                        </div>
                     </div>
                  </p>
               </div>
            </div>
         <div id="context">
            <div style="border-bottom: 2px solid black">
               <h2>가맹점 회원 수정</h2>
            </div>
            <br>

               <div class="form-group row">
                  <label for="validationTooltip01" class="formlabel">ID </label>
                  <div class="col-sm-10">
                     <input type="text" class="form-control" name="userId"
                        id="validationTooltip01" placeholder="ID"
                        value="${user.userId}" required readonly>
                  </div>
               </div>
               <div class="form-group row">
                  <label for="validationTooltip02" class="formlabel">PW</label>
                  <div class="col-sm-10">
                     <input type="password" class="form-control" name="userPw"
                        id="validationTooltip02" value="${user.userPw}" required>
                  </div>
               </div>
               <div class="form-group row">
                  <label for="validationTooltipUsername" class="formlabel">지점명</label>
                  <div class="col-sm-10">
                     <input type="text" class="form-control" name="userName" value="${user.userName}"
                        id="validationTooltipUsername" placeholder="지점명" required>
                  </div>
               </div>
               <div class="form-group row">
                  <label for="validationTooltipUsername" class="formlabel">등록일</label>
                  <div class="col-sm-10">
                     <input type="date" class="form-control" name="regDate"
                        id="validationTooltipUsername" placeholder="등록일" value="${user.regDate}" required>

                  </div>
               </div>
               <div class="form-group row">
                  <label for="validationTooltip03" class="formlabel">전화번호</label>
                  <div class="col-sm-10">
                     <input type="tel" class="form-control" id="validationTooltip03"
                        onkeyup="telchk()" name="userTel" value="${user.userTel}"
                        placeholder="010-0000-0000" required maxlength="13">
                  </div>
               </div>
               <div class="form-group row">
                  <label for="validationTooltip04" class="formlabel">이메일</label>
                  <div class="col-sm-10">
                     <input type="email" class="form-control" id="validationTooltip04" name="userEmail"
                        placeholder="test@google.com" value="${user.userEmail}" required>
                  </div>
               </div>
               <div class="form-group row">
                  <label class="formlabel">주소</label>
                  <div class="col-sm-10">
                     <input type="text" id="sample4_roadAddress" class="form-control" name="userAddress" placeholder="도로명주소" value="${user.userAddress}" readonly required>
                  </div>


               </div>

               <br>
               <hr>
               <div style="text-align: center;">
                  <input type="button" onClick="buttonYellow()" class="btn btn-primary" value="수정">
                  <input type="button" onClick="buttonRed('${user.userId}')" class="btn btn-danger" value="삭제">
                  
               </div>
          

         </div>
      </div>


</html>