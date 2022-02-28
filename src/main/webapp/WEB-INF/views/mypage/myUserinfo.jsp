<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   	<meta name="_csrf" content="${_csrf.token}">
	<meta name="_csrf_header" content="${_csrf.headerName}">
    <title>나만의 맞춤 피자 Free</title>

    <!-- font 영역 -->
    <link rel="stylesheet" href="../font/font.css">
    <!-- style 영역 -->
    <link rel="stylesheet" href="../style/common.css">
    <link rel="stylesheet" href="../style/sub.css">
    <link rel="stylesheet" href="../style/mypage.css">
    <link rel="stylesheet" href="../style/layout.css">
    <!-- icon영역 -->
    <link
        href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
        rel="stylesheet">
    <!-- js 라이브러리 영역 -->
    <script src="../js/jquery-3.6.0.js"></script>
<script>
function myPwdChk(){ 
	var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
	
	$.ajax({ 
		url: "./myPwdChk.do",
		type:"POST", 
		beforeSend : function(xhr){
    		xhr.setRequestHeader(header, token);
        },
        async:false,
		data: {"password":$('#pop_passwd').val()},
		dataType:'json', 
		success:function(result) { 
			var result = result.chkResult;
			if(result == 0){
				alert("비밀번호를 잘못 입력하셨습니다.");
			}
			else{
				window.location = "./myUserinfoMod.do";
			}
		}, 
		error: function(data){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"
        			+"\n"+"error:"+error)
		} 
	}); 
};
</script>

</head>

<body id="body">
    <header id="header">
        <%@ include file="../common/header.jsp" %>
    </header>

    <div id="container">
        <div class="cont-wrap">
            <div class="sub-type mypage">
                <div class="inner-box">
                    <div class="page-title-wrap">
                        <h2 class="page-title">마이페이지</h2>
                        <div class="depth-area">
                            <ol>
                                <li><a href="/FreeP/index.html">홈</a></li>
                                <li><strong>마이페이지</strong></li>
                            </ol>
                        </div>
                    </div>
                    <article class="mypage-wrap mypage-grade">
                        <div class="menu-nav-wrap">
                            <div class="menu-nav">
                                <ul>
                                    <li><a href="../mypage/myMain.do">MY프리피</a></li>
                                    <li><a href="../mypage/myOrder.do">주문내역</a></li>
                                    <li><a href="../mypage/myCoupon.do">쿠폰/적립금</a></li>
                                    <li><a href="../mypage/myReview.do">MY리뷰</a></li>
                                    <li><a href="../mypage/myQuestion.do">1:1문의</a></li>
                                    <li class="active"><a href="./myUserinfo.do">정보수정</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="title-wrap-center">
                            <h3 class="title-type">
                                정보수정
                            </h3>
                            <p>회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인합니다.</p>
                        </div>

                        <div class="myinfo-wrap">
                            <div class="form">
                                <dl>
                                    <dt>아이디</dt>
                                    <dd>${id}</dd>
                                </dl>
                                <dl>
                                    <dt>비밀번호</dt>
                                    <dd>
                                        <div class="form-group2">
                                            <div class="form-item number">
                                                <form name="frm_popup" id="frm_popup" method="post">
                                                    <input type="password" id="pop_passwd" name="pop_passwd" onkeydown="">
                                                    <a href="javascript:void(0);" class="btn-type v4" onclick="myPwdChk();">확인</a>
                                                </form>
                                            </div>
                                            <div class="text-type4" style="display:none;"></div>
                                        </div>
                                    </dd>
                                </dl>
                            </div>
                        </div>
                    </article>
                </div>
            </div>
        </div>
    </div>

    <footer id="footer">
        <%@ include file="../common/footer.jsp" %>
    </footer>


    <script src="../js/includeHTML.js"></script>
    <script>includeHTML();</script>

    <script src="../js/motion.js"></script>
    <script src="../js/ui.js"></script>
    
</body>

</html>