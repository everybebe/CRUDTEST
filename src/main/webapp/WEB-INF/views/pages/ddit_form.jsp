<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="../assets/img/favicon.png">
  <title>
    대덕인재개발원 CRUD 연습
  </title>
  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700" />
  <!-- Nucleo Icons -->
  <link href="../assets/css/nucleo-icons.css" rel="stylesheet" />
  <link href="../assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <!-- Material Icons -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
  <!-- CSS Files -->
  <link id="pagestyle" href="../assets/css/material-dashboard.css?v=3.0.4" rel="stylesheet" />
  <!-- 제이쿼리 -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    
</head>

<body class="g-sidenav-show  bg-gray-200">>
  <c:set value="등록" var="name" />
  <c:if test="${status eq 'u' }">
	<c:set value="수정" var="name" />
  </c:if>
  <aside class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-3   bg-gradient-dark" id="sidenav-main">
    <div class="sidenav-header">
      <i class="fas fa-times p-3 cursor-pointer text-white opacity-5 position-absolute end-0 top-0 d-none d-xl-none" aria-hidden="true" id="iconSidenav"></i>
      <a class="navbar-brand m-0" href="/board/boardlist.do" target="_blank">
        <img src="../assets/img/logo-ct.png" class="navbar-brand-img h-100" alt="main_logo">
        <span class="ms-1 font-weight-bold text-white">대덕인재개발원</span>
      </a>
    </div>
    <hr class="horizontal light mt-0 mb-2">
    <div class="collapse navbar-collapse  w-auto " id="sidenav-collapse-main">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link text-white active bg-gradient-info" href="/board/boardlist.do">
            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
              <i class="material-icons opacity-10">table_view</i>
            </div>
            <span class="nav-link-text ms-1">공지사항</span>
          </a>
        </li>
      </ul>
    </div>
  </aside>
  <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
    <!-- Navbar -->
    <nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl" id="navbarBlur" data-scroll="true">
      <div class="container-fluid py-1 px-3">
        <div class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4" id="navbar">
          <div class="ms-md-auto pe-md-3 d-flex align-items-center">
          </div>
          <ul class="navbar-nav  justify-content-end">
            <li class="nav-item d-flex align-items-center">
              <a href="" class="nav-link text-body font-weight-bold px-0">
                <i class="fa fa-user me-sm-1"></i>
                <span class="d-sm-inline d-none">로그인</span>
              </a>
            </li>
			<li class="nav-item d-flex align-items-center">　</li>
			<li class="nav-item">
			  <div class="d-flex align-items-center justify-content-between">
				<div class="avatar-group mt-2 avatar avatar-xs rounded-circle">
				  <img alt="Image placeholder" src="../assets/img/team-1.jpg" style="width:40px;">
				</div>
			  </div>
			</li>
			<li class="nav-item d-flex align-items-center">　</li>
			<li class="nav-item d-flex align-items-center">
				<div class="d-flex flex-column justify-content-center">
				  <h6 class="mb-0 text-sm">304호반장</h6>
				  <p class="text-xs text-secondary mb-0">Leader-Park@ddit.or.kr</p>
				</div>
			</li>
			<li class="nav-item d-flex align-items-center">　</li>
			<li class="nav-item d-flex align-items-center">
              <a href="" class="nav-link text-body font-weight-bold px-0">
                <i class="fa fa-user me-sm-1"></i>
                <span class="d-sm-inline d-none">로그아웃</span>
              </a>
            </li>
			<li class="nav-item d-flex align-items-center">　</li>
			<li class="nav-item d-flex align-items-center">
              <a href="" class="nav-link text-body font-weight-bold px-0">
                <i class="fa fa-user me-sm-1"></i>
                <span class="d-sm-inline d-none">마이페이지</span>
              </a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <!-- End Navbar -->
	<form class="card card-primary" method="post" action="/board/insert.do" id="boardForm">
   		<c:if test="${status eq 'u' }">
			<input type="hidden" name="boNo" value="${board.boNo }" />
		</c:if>
    <div class="container-fluid px-2 px-md-4">
      <div class="page-header min-height-300 border-radius-xl mt-4" style="background-image: url('https://images.unsplash.com/photo-1531512073830-ba890ca4eba2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1920&q=80');">
        <span class="mask  bg-gradient-secondary opacity-6"></span>
      </div>
      <div class="card card-body mx-3 mx-md-4 mt-n6">
        <div class="row gx-4 mb-2">
		  <div class="col-md-12">
			<div class="input-group input-group-outline mb-4">
			  <label class="form-label"></label>
			  <input type="text" class="form-control" placeholder="제목을 입력해주세요." id="boTitle" name="boTitle" value="${board.boTitle }">
			</div>
		  </div>
		  <div class="col-md-12">
		    <div class="input-group input-group-outline mb-4">
			  <textarea class="form-control" rows="20" placeholder="내용을 입력해주세요." id="boContent" name="boContent">${board.boContent }</textarea>
			 
		    </div>
		  </div>
		  <div class="col-md-12">　</div>
		  <div class="col-md-12">
		   <input type="button" value="${name }" id="submitBtn" class="btn btn-primary float-right"> <!-- 등록 -->
				<c:if test="${status eq 'u' }">
					<a href="/board/detail.do?boNo=${board.boNo }">
						<input type="button" value="취소" class="btn btn-success float-right">
					</a>
				</c:if>
		    	<c:if test="${status ne 'u' }">
					<a href="/board/boardlist.do">
						<input type="button" value="목록" class="btn btn-success float-right">
					</a>
				</c:if>
		  </div>
        </div>
      </div>
    </div>
    </form>
    <c:if test="${not empty errors }">
		<p>
			${errors.boTitle }<br>
			${errors.boContent }<br>
			${errors.msg }
		</p>
	</c:if>
  </main>
  <div class="fixed-plugin">
    <a class="fixed-plugin-button text-dark position-fixed px-3 py-2">
      <i class="material-icons py-2">settings</i>
    </a>
    <div class="card shadow-lg">
       <div class="card-header pb-0 pt-3">
        <div class="float-start">
          <h5 class="mt-3 mb-0">Material UI Configurator</h5>
          <p>See our dashboard options.</p>
        </div>
        <div class="float-end mt-4">
          <button class="btn btn-link text-dark p-0 fixed-plugin-close-button">
            <i class="material-icons">clear</i>
          </button>
        </div>
        <!-- End Toggle Button -->
      </div>
      <hr class="horizontal dark my-1">
      <div class="card-body pt-sm-3 pt-0">
        <!-- Sidebar Backgrounds -->
        <div>
          <h6 class="mb-0">Sidebar Colors</h6>
        </div>
        <a href="javascript:void(0)" class="switch-trigger background-color">
          <div class="badge-colors my-2 text-start">
            <span class="badge filter bg-gradient-primary active" data-color="primary" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-dark" data-color="dark" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-info" data-color="info" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-success" data-color="success" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-warning" data-color="warning" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-danger" data-color="danger" onclick="sidebarColor(this)"></span>
          </div>
        </a>
        <hr class="horizontal dark my-3">
        <div class="mt-2 d-flex">
          <h6 class="mb-0">Light / Dark</h6>
          <div class="form-check form-switch ps-0 ms-auto my-auto">
            <input class="form-check-input mt-1 ms-auto" type="checkbox" id="dark-version" onclick="darkMode(this)">
          </div>
        </div>
        <hr class="horizontal dark my-sm-4">
      </div>
    </div>
  </div>
  <!--   Core JS Files   -->
  <script src="../assets/js/core/popper.min.js"></script>
  <script src="../assets/js/core/bootstrap.min.js"></script>
  <script src="../assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="../assets/js/plugins/smooth-scrollbar.min.js"></script>
  
 <%--  <script src="${pageContext.request.contextPath}/resources/plugins/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/dist/js/adminlte.min.js"></script> --%>
  <script type="text/javascript" src="${pageContext.request.contextPath }/resources/ckeditor/ckeditor.js"></script>
  <script>
    var win = navigator.platform.indexOf('Win') > -1;
    if (win && document.querySelector('#sidenav-scrollbar')) {
      var options = {
        damping: '0.5'
      }
      Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
    }
  </script>
  <!-- Github buttons -->
  <script async defer src="https://buttons.github.io/buttons.js"></script>
  <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
</body>
<script type="text/javascript">
$(function(){
	CKEDITOR.replace("boContent");
	CKEDITOR.config.allowedContent = true; //html태그가 사라지는걸 방지

	var submitBtn = $("#submitBtn");
	
	submitBtn.on("click",function(){
		var title = $("#boTitle").val();
		var content =  CKEDITOR.instances.boContent.getData(); // 내용에 대한 데이터 얻어오기
		
		if(title == "") {
			alert("제목을 입력해주세요")
			$("#boTitle").focus();
			return false;
		}
		
		if(content == "") {
			alert("내용을 입력해주세요")
			$("#boContent").focus();
			return false;
		}
		
		if($(this).val()=="수정") {
			$("#boardForm").attr("action", "/board/update.do");
			
		}
		
		$("#boardForm").submit();
	})
	
})
</script>
</html>