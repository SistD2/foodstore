<%@page import="parkjonghyun.foodstore.user.domain.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
<script src='http://code.jquery.com/jquery-3.1.1.min.js'></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="sweetalert2.all.min.js"></script>
<!-- Optional: include a polyfill for ES6 Promises for IE11 -->
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>

<style type="text/css">
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
   width: 7.5em;
   height: 2.8em;
   font-size: 1em;
   margin-right: 1.54em;
}

#context {
   margin-top: 3%;
   margin-left: 5%;
   margin-right: 0%;
   margin-bottom: 17%;
}

#carousel-set {
   background-color: lightgray;
   border: 2px black solid;
   height: 30em;
}

#sidebar {
   font-size: 19px;
   background-color: orange !important;
   height: 1000px;
}

.nav-link {
   color: black;
}

.logo {
   margin-left: -5px;
   margin-top: 10px;
   padding-bottom: 7px;
}

.childli {
 	margin-left: 1em;
}

.fieldset {
   border: 1px solid;
   width: 650px;
   display: block;
   padding-left: 4%;
   padding-right: 4%;
   padding-bottom: 4%;
   padding-top: 2%;
   margin: 0 auto;
}

.legend {
   border: 1px solid;
   padding-left: 15px;
   padding-right: 15px;
   display: inline;
   width: auto;
}

.modal-content {
   width: 600px;
}

.txt1 {
   font-size: 28px;
   margin-left: 5%;
   margin-top: 2%;
   margin-bottom: 5px;
}

.txt2 {
   margin-left: 5%;
   font-size: 18px;
   margin-bottom: 3%;
   margin-right: 5%;
}

.pwInfo {
   margin-left: 5%;
   width: 80%;
   height: 45px;
   margin-bottom: 2%;
   padding-left: 10px;
}

.btn-primary {
   margin-left: 5%;
   width: 80%;
   height: 50px;
   margin-bottom: 5%;
}

.left-value {
   display: inline-block;
   width: 95px;
   padding-left: 10px;
}

.mid-value {
   display: inline-block;
   padding-right: 8px;
}

.right-value {
   display: inline-block;
   padding-bottom: 15px;
}

.info-footer {
   text-align: center;
   margin: 0 auto;
   margin-bottom: 30px;
   border: 1px solid;
   width: 470px;
}

.modal-footer {
   display: flex;
   justify-content: center;
}

.btn-secondary {
   margin: 0 auto;
   width: 300px;
   height: 50px;
}
</style>

<script>
   var isUserPw = function() {
      if ($('.pwInfo').val() == "")
         return true;
      else
         return false;
   }

   var clearPwInfo = function() {
      $('.pwInfo').val('');
   }
   function sweetalert(context) {
      Swal.fire({
         icon : 'error',
         title : '비밀번호 에러',
         text : context
      });
   }
   function formsubmit() {
      if (isUserPw()) {
         sweetalert('비밀번호를 입력해주세요');
         }else{
            $.ajax({
            type : 'POST',
            url : 'check',
            data : { pwInfo: $('.pwInfo').val()},
            success : function(user){
               if (user.userPw == $('.pwInfo').val()) {
                  $("#userId").append(user.userId);
                  $("#userName").append(user.userName);
                  $("#regDate").append(user.regDate);
                  $("#userTel").append(user.userTel);
                  $("#userAddress").append(user.userAddress);
                  $("#userEmail").append(user.userEmail);   
                  $('#exampleModal').modal('toggle');
                  clearPwInfo()
               }else{
                  sweetalert('비밀번호가 틀렸습니다.');
                  clearPwInfo()
               }
            },
            error : function(a, b, errMsg) {
               alert(errMsg, 'error');
            },
         });
      }
   }

</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

   <div class="container-fluid">
      <div class="row">
         <nav class="col-md-2 d-none d-md-block bg-light sidebar" id="sidebar">
         <div class="sidebar-sticky">
            <ul class="nav flex-column">
               <li class="nav-item"><a class="nav-link active"
                  href="../main"> <span data-feather="home"></span>
                     <h2 class="logo">
                        <strong>LOGO</strong>
                     </h2>
                     <hr> <span class="sr-only"></span>
               </a></li>
               <li class="nav-item"><a class="nav-link"
                  href="../order/check"> <span data-feather="file"></span>
                     <p class="childli">주문 확인</p>
               </a> <a class="nav-link" href="../sale/saleList"> <span
                     data-feather="file"></span>
                     <p class="childli">매출 조회</p>
               </a> <a class="nav-link" href="../stock/modify"> <span
                     data-feather="file"></span>
                     <p class="childli">수량 수정</p>
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
         </nav><% User user = (User)session.getAttribute("user"); %>

         <div role="main" class="col-md-10 ml-sm-auto col-lg-10">
            <div id="top"
               class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
               <h1 class="h2">&nbsp;스시오</h1>
               <div class="btn-toolbar mb-2 mb-md-0">
                  <div class="dropdown">
                     <button class="btn btn-warning dropdown-toggle" type="button"
                        id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true"
                        aria-expanded="false"><%=user.getUserName() %></button>
                     <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
                        <button class="dropdown-item" type="button">
                           <a href="../user/check">정보 확인</a>
                        </button>
                        <button class="dropdown-item" type="button">
                           <a href="../user/logout">로그아웃</a>
                        </button>
                     </div>
                  </div>
               </div>
            </div>

            <div id="context">


               <fieldset class="fieldset">
                  <legend class="legend">회원정보 확인</legend>
                  <div class="txt1">비밀번호 재확인</div>
                  <div class="txt2">안전한 사용을 위해 비밀번호를 다시 한 번 입력해주세요.</div>

                  <input type="password" class="pwInfo" name="pwInfo">


                  <!-- Button trigger modal -->
                  <input type="button" class="btn btn-primary" value="확인" onclick="formsubmit()">

                  <!-- Modal -->
                  <div class="modal fade" id="exampleModal" tabindex="-1"
                     role="dialog" aria-labelledby="exampleModalLabel"
                     aria-hidden="true">
                     <div class="modal-dialog" role="document">
                        <div class="modal-content">
                           <div class="modal-header">
                              <h5 class="modal-title" id="exampleModalLabel">회원정보 확인</h5>
                              <button type="button" class="close" data-dismiss="modal"
                                 aria-label="Close">
                                 <span aria-hidden="true">&times;</span>
                              </button>
                           </div>

                           <div class="modal-body">
                              <div class="left-value">ID</div>
                              <div class="mid-value">:</div>
                              <div class="right-value" id="userId"></div>
                              <br>

                              <div class="left-value">PW</div>
                              <div class="mid-value">:</div>
                              <div class="right-value">**********</div>
                              <br>

                              <div class="left-value">지점명</div>
                              <div class="mid-value">:</div>
                              <div class="right-value" id="userName"></div>
                              <br>

                              <div class="left-value">등록일</div>
                              <div class="mid-value">:</div>
                              <div class="right-value" id="regDate"></div>
                              <br>

                              <div class="left-value">주소</div>
                              <div class="mid-value">:</div>
                              <div class="right-value" id="userAddress"></div>
                              <br>

                              <div class="left-value">전화번호</div>
                              <div class="mid-value">:</div>
                              <div class="right-value" id="userTel"></div>
                              <br>

                              <div class="left-value">이메일</div>
                              <div class="mid-value">:</div>
                              <div class="right-value" id="userEmail"></div>
                              <br>

                           </div>
                           <div class="info-footer">
                              ※ 수정이 필요한 경우 본사(02-1234-5678)로<br>연락주시기 바랍니다.

                           </div>
                           <div class="modal-footer">
                              <button type="button" class="btn btn-secondary"
                                 data-dismiss="modal">확인</button>
                           </div>
                        </div>
                     </div>
                  </div>

               </fieldset>


            </div>
         </div>
      </div>
   </div>
</body>
</html>