<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
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

<body class="">
  <main class="main-content  mt-0">
    <section>
      <div class="page-header min-vh-100">
        <div class="container">
          <div class="row">
            <div class="col-6 d-lg-flex d-none h-100 my-auto pe-0 position-absolute top-0 start-0 text-center justify-content-center flex-column">
              <div class="position-relative bg-gradient-info h-100 m-3 px-7 border-radius-lg d-flex flex-column justify-content-center" style="background-image: url('../assets/img/illustrations/illustration-lock.jpg'); background-size: cover;">
              </div>
            </div>
            <div class="col-xl-4 col-lg-5 col-md-7 d-flex flex-column ms-auto me-auto ms-lg-auto me-lg-5">
              <div class="card card-plain">
                <div class="card-header">
                  <h4 class="font-weight-bolder">회원가입</h4>
                  <p class="mb-0">회원등록 후, 저희 서비스와 함께해요!</p>
                </div>
                <div class="card-body">
                  <form action="/member/signup.do" role="form" id="joinForm" method="post">
                    <div class="input-group input-group-outline mb-3">
                      <label class="form-label" ></label>
                      <input type="text" class="form-control" id="id" name="memId" placeholder="아이디">
                    </div>
                    <div class="input-group input-group-outline mb-3">
                      <label class="form-label"></label>
                      <input type="text" class="form-control" id="pw" name="memPw" placeholder="비밀번호">
                    </div>
                    <div class="input-group input-group-outline mb-3">
                      <label class="form-label"></label>
                      <input type="text" class="form-control" id="pw2"  placeholder="비밀번호 재입력">
                    </div>
					<div class="input-group input-group-outline mb-3">
                      <label class="form-label"></label>
                      <input type="text" class="form-control" id="name" name="memName" placeholder="이름">
                    </div>
					<div class="form-check mb-3">
					  <input class="form-check-input" type="radio" name="memGender" id="customRadio1" value="M" checked>
					  <label class="custom-control-label" for="customRadio1">남자</label>
					  <input class="form-check-input" type="radio" name="memGender" id="customRadio1" value="F">
					  <label class="custom-control-label" for="customRadio1">여자</label>
					</div>
					<div class="input-group input-group-outline mb-3">
                      <label class="form-label"></label>
                      <input type="text" class="form-control" id="tel" name="memPhone" placeholder="핸드폰번호">
                    </div>
					<div class="input-group input-group-outline mb-3">
                      <label class="form-label"></label>
                      <input type="text" class="form-control" id="email" name="memEmail" placeholder="이메일">
                    </div>
                    <div class="form-check form-switch">
					  <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault" name="memAgree" checked="">
					  <label class="form-check-label" for="flexSwitchCheckDefault">개인정보 동의</label>
					  <p class="mb-2 text-sm mx-auto">
						개인정보 동의  
						<a href="../pages/sign-in.html" class="text-primary text-gradient font-weight-bold">
						상세보기
						</a>	
					  </p>
					</div>
                    <div class="text-center">
                      <button type="button" class="btn btn-lg bg-gradient-primary btn-lg w-100 mt-4 mb-0" onclick="checkJoin()" id="joinBtn">가입하기</button>  
                    </div>
                  </form>
                </div>
                <div class="card-footer text-center pt-0 px-lg-2 px-1">
                  <p class="mb-2 text-sm mx-auto">
                    우리 서비스 회원이세요?
                    <a href="/member/main" class="text-primary text-gradient font-weight-bold">로그인</a>
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </main>
  <!--   Core JS Files   -->
  <script src="../assets/js/core/bootstrap.min.js"></script>
</body>

<script type="text/javascript">
function checkJoin(){
	
 	if("${flag}" == "error"){
		alert("가입이 실패했습니다. 다시 시도해주세요.")
	}

	var id = $("#id").val();
	var pw = $("#pw").val();
	var pw2 = $("#pw2").val();
	var name = $("#name").val();
	var customRadio1 = $("#customRadio1").val();
	var tel = $("#tel").val();
	var email = $("#email").val();
	var checkBox = document.getElementById("flexSwitchCheckDefault");
	var joinBtn = $("#joinBtn");
	
	if(id == ""){
		alert("아이디를 입력해주세요.")
		 $("#id").focus()
		return false;
	}
	
	if(pw =="") {
		alert("비밀번호를 입력해주세요.")
		$("#pw").focus()
		return false;
	}
	
	if(pw2 =="") {
		alert("비밀번호를 입력해주세요.")
		$("#pw2").focus()
		return false;
	}
	
	if(pw != pw2){
		alert("비밀번호가 일치하지 않습니다.")
		$("#pw2").focus()
		return false;
	}
	
	if(name =="") {
		alert("이름을 입력해주세요.")
		$("#name").focus()
		return false;
	}
	
	if(tel =="") {
		alert("핸드폰번호를 입력해주세요.")
		$("#tel").focus()
		return false;
	}
	
	if(email =="") {
		alert("이메일을 입력해주세요.")
		$("#email").focus()
		return false;
	}
	
	if(!checkBox.checked){
		alert("개인정보 동의에 체크를 해주세요!")
		
		return false;	
	}
	
	$("#joinForm").submit();
	//alert("가입이 완료되었습니다!")
	
	
/* 	$(joinBtn).on("click", function(){
		location.href = "/signin.do";
	}) */
}

		

</script>

</html>