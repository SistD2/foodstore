<%@page import="parkjonghyun.foodstore.user.domain.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
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
.divshadow{
    box-shadow: 2.5px 2.5px 2.5px 2.5px slategrey;
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
	margin-top: 5%;
	margin-left: 5%;
	margin-right: 5%;
}

#carousel-set {
	background-color: lightgray;
	border: 2px black solid;
	height: 30em;
}

#sidebar {
	background-color: orange !important;
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
.fieldset{
   border: 1px solid;
   width: 95%;
   display: block;
   padding-left: 4%;
   margin:0 auto;
}
.legend{
   border: 1px solid;
   padding-left:15px;
   padding-right:15px;
   display: inline;
   width: auto;
}
.main-title{
   border:1px solid;
   height:3%;
   width:200px;
   padding-left:10px;
   margin-bottom:20px;
}
.all{
   float: left;
}
.img{
   width: 100%;
   height: 300px;
   text-align: center;
   position:relative;
}
.img-form{
   height: 300px;
   text-align: center;
   position:relative;
}
.name{
   background: white;
   position:absolute;
     bottom:10px;
     right:40%;
   padding:5px 5px;
   font-size:15px;
   border:0.5px solid;
}
.current{
   width: 50%;
   height: 50px;
   text-align: center;
}

.num {
   width: 40%;
   text-align: center;
}

.tab{
   width: 350px;
   margin-top: 10px;
   margin-left: 20px;
   margin-right: 50px;
   float: center;
}

.test {
   margin-top: 30px;
   margin-bottom: 30px;
}
.cartBtn {
   position: fixed;
   float: right;
   top : 50em;
   right: 5em;
   width: 150px; height: 50px;
   margin-bottom: 30px;
   margin-right: 60px;
}
.modal-title{
   margin-left:168px;
   font-family: 'NanumGothic';
}
.modal-body{
   text-align: center;
      font-family: 'NanumGothic';
}
.txt1{
   margin-bottom:20px;
}
.pwInfo{
   width:70%;
}

</style>
<script>
function buttonBlue(){
   Swal.fire({
      title: '수정 하시겠습니까?',
      text: "현재 수량이 수정됩니다.",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: '수정',
      cancelButtonText: '취소'
      }).then((result) => {
        if (result.value) {
          Swal.fire(
            '수정 되었습니다!',
            '현재수량이 수정 되었습니다.',
            'success'
          )
        }
      })
}
function buttonGreen(){
   Swal.fire({
      title: '결재 하시겠습니까?',
      text: "현재 상품이 결재됩니다.",
      icon: 'info',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: '결재',
      cancelButtonText: '취소'
      }).then((result) => {
        if (result.value) {
          Swal.fire(
            '결재',
            '상품이 결재 되었습니다.',
            'success'
          )
          setTimeout(function(){
             $("#saleform").submit();
          }, 1500);
        }
      })
      
}
function buttonred(type, text){
   Swal.fire({
        icon: 'error',
        title: type,
        text: text,
        footer: ''
      })
}
</script>

<script type="text/javascript">
var totcnt = 0;
var totpri = 0;
function updown(id, type){
   var now = $("#c"+id).val();
   var pri = $("#p"+id).val();
   if(type==1){
      if(now<5){
         now++;
         totcnt++;
         totpri += Number(pri);
         $("#c"+id).val(now);
         $("#totcnt").html(totcnt);
         $("#totpri").html(totpri);   
      }
   }else{
      if($("#c"+id).val()>1){
         now--;
         totcnt--;
         totpri -= Number(pri);
         $("#c"+id).val(now);
         $("#totcnt").html(totcnt);
         $("#totpri").html(totpri);
      }
   }
}
function selectProd(id){
   if($("#"+id).hasClass("divshadow"))$("#"+id).removeClass("divshadow");
   else $("#"+id).addClass("divshadow"); 
}
var str = "";

function selectedProd(){
   str = "";
   totcnt = 0;
   totpri = 0;
   $("[class^=divshadow]").each(function(idx, id){
      str += $(id).attr('id')+"/";
   });
   if(str == ""){
      buttonred('info', '최소 한 가지 항목을 선택해주세요.');
   }else{
      $("#productList").empty();
      $.ajax({
         method : 'POST',
         url:'orderdetail',
         data: {str : str},
         success:function(product){
            console.log(product);
            var list = [];
            $(product).each(function(idx, prod){
                  totcnt++;
                  list.push(
                  "<tr style='border-bottom: 1px solid black;'>"+
                                    "<td scope='col' colspan='2'>"+prod.prodName+"</td>"+
                                    "<td scope='col' colspan='5'>"+prod.prodPrice+"</td>"+
                                    "<td scope='col' align='right'>"+
                                       "<input type='button' class='btn btn-default' onclick='updown(\""+ prod.prodNo +"\", 0)' style='border: 2px solid skyblue' value='▼'>"+
                                    "</td>"+
                                    "<td scope='col'>"+
                                       "<input type='number' name='prodCnt' id='c"+prod.prodNo+"' class='form-control' value='1' size='1' readonly style = 'text-align:center;'>"+
                                    "</td>"+
                                    "<td scope='col'>"+
                                       "<input type='button' class='btn btn-default' onclick='updown(\""+prod.prodNo+"\", 1)' style='border: 2px solid skyblue' value='▲'>"+
                                    "</td>"+
                                    "<td scope='col'>"+
                                       "<input type='text' id='p"+prod.prodNo+"' class='form-control' value='"+prod.prodPrice+"' size='5' readonly style = 'text-align:right;'>"+
                                    "</td>"+
                                    "<input type='hidden' value="+prod.prodNo+" name='prodNo'>"+
                                 "</tr>"
                  );
                  
                  totpri += prod.prodPrice;
            })
            list.push(
               "<tr><td><br><br><br><br></td></tr><tr style='border-bottom: 1px solid black;'>"+
                        "<td colspan='2'>총 수량:</td>"+
                        "<td id='totcnt' colspan='5'>"+totcnt+"</td>"+
                        "<td></td>"+
                        "<td></td>"+
                        "<td>총액 : </td>"+
                        "<td id='totpri'>"+totpri+"</td>"+
                     "</tr>"+
                     
                     "<tr>"+
                        "<td colspan='10' align='right'><input type='button' value='취소' class='btn btn-danger' data-dismiss='modal'></td>"+
                        "<td colspan='1' align='left'><input type='button' value='결재' class='btn btn-success' onclick='buttonGreen()'><td>"+
                     "</tr>"
                     
            );
            
            $('#productList').append(list.join(""));
            $('#mymodal').modal('show');
         },
         error: function(a, b, errMsg){
            console.log('error');
         },
         complete: console.log('complete') 
      });
   }
}
</script>

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
            url : '../user/order',
            data : { pwInfo: $('.pwInfo').val()},
            success : function(user){
               if (user.userPw == $('.pwInfo').val()) {
                  window.location.href = "../main";
               }else{
                  sweetalert('비밀번호가 틀렸습니다.');
                  clearPwInfo()
               }
            },
            error : function(a, b, errMsg) {
               alert(errMsg, 'error');
               clearPwInfo();
            },
         });
      }
   }

</script>

</head>
<body>

   <div class="container-fluid">
      <div class="row">
         <nav class="col-md-2 d-none d-md-block bg-light sidebar" id="sidebar">
            <div class="sidebar-sticky">
               <ul class="nav flex-column">
                  <li class="nav-item"><a class="nav-link active">
                  <span data-feather="home"></span>
                        <h2 class="logo">
                           <strong>LOGO</strong>
                        </h2><hr> <span class="sr-only"></span>
                  </a></li>
                  <% User user = (User)session.getAttribute("user"); %>
                  
                  <li class="nav-item"><a class="nav-link" href="order"> <span
                        data-feather="file"></span>
                     <p class="childli">주문 하기</p>
                  </a>
                 </li>
                 </ul>
            </div>
         </nav>

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

                  <button type="button" class="dropdown-item" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">가맹점으로</button>
                     </div>
                  <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                      <div class="modal-content">
                        <div class="modal-header">
                          <h5 class="modal-title" id="exampleModalLabel">비밀번호 확인</h5>
                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                          </button>
                        </div>
                        <div class="modal-body">
                          
                            <div class="form-group">
                               <div class="txt1">비밀번호를 입력해주세요.</div>
                              <input type="password" class="pwInfo" name="pwInfo">
                            </div>
                          
                        </div>
                        <div class="modal-footer">
                          <input type="button" class="btn btn-primary" value="확인" onclick="formsubmit()">
                          <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                        </div>
                      </div>
                    </div>
                  </div>
                  </div>
               </div>
         </div>

         <div id="context">
		

         <fieldset class="fieldset"><legend class="legend">매장 상품</legend>


            <!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->

            <c:forEach items="${stocks}" var="stock">
               
               <div class="all">
                     <table border="1" class="tab">
                        <tr id="${stock.prodNo}" onclick="selectProd(this.id);">
                           <th colspan="2" class="img-form">
                              <c:forEach items="${products}" var="product">
                                 <c:if test="${product.prodNo == stock.prodNo}">
                                    <img src="<c:url value="/upload/${product.prodImgPath}"/>" class="img">
                                    <div class="name">${product.prodName}</div>
                                 </c:if>
                              </c:forEach>
                           </th>
                        </tr>
                     </table>
               </div>
         </c:forEach>
            <!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->


            

            <div id='mymodal' class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
               <div class="modal-dialog modal-lg">
                  <div class="modal-content">
                     <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">장바구니</h5>
                     </div>
                     <div class="modal-body">
                        <form id="saleform" method="POST" action="addSale">
                           <table class="table table-borderless" >
                              <tbody id="productList">


                              </tbody>
                           </table>
                        </form>
                     </div>
                  </div>
               </div>
            </div>
            	<button type="button" class="btn btn-info cartBtn" onclick="selectedProd();">장바구니</button>
            </fieldset>
      </div>
      </div>
      </div>
   </div>
</html>