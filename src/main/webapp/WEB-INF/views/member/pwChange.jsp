<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 시큐리티랑 ajax같이 쓰려면 이걸 써야 함. -->
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<title>나만의 맞춤 피자 Free</title>

<!-- font 영역 -->
<link rel="stylesheet" href="../font/font.css">
<!-- style 영역 -->
<link rel="stylesheet" href="../style/common.css">
<link rel="stylesheet" href="../style/sub.css">
<link rel="stylesheet" href="../style/regist.css">
<link rel="stylesheet" href="../style/layout.css">
<!-- icon영역 -->
<link
    href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
    rel="stylesheet">
<!-- js 라이브러리 영역 -->
<script src="../js/jquery-3.6.0.js"></script>
<script>

	//패스워드 입력 확인
	function validateForm(frm){
		if(frm.pass.value==''){
	        alert('비밀번호를 입력하세요');
	        frm.pass.focus();
	        return false;
	    }
		
		//패스워드는 4~12자로 입력
	    if(!(frm.pass.value.length>=4 && frm.pass.value.length<=12)){
	        alert("패스워드는 4~12자 사이만 가능합니다.");
	        frm.pass.value = '';//잘못된 입력값이므로 지워준다.
	        frm.pass.focus();//재입력해야 하므로 포커싱 한다.
	        return false;//서버로 전송을 중단해야 하므로 false반환
	    }
		
	    /*
	    패스워드를 구성하는 각 문자가 소문자a~z, 대문자A~Z 숫자0~9사이가 아니라면
	    잘못된 문자가 포함된 경우이므로 전송을 중단해야 한다.
	    */
	    for(var i=0 ; i<frm.pass.value.length; i++){//아이디의 길이만큼 반복
	        if(!((frm.pass.value[i]>='a'&& frm.pass.value[i]<='z') ||
	            (frm.pass.value[i]>='A'&& frm.pass.value[i]<='Z') ||
	            (frm.pass.value[i]>='0'&& frm.pass.value[i]<='9'))){
	            alert('패스워드는 영문과 숫자의 조합으로만 사용할 수 있습니다.');
	            frm.pass.value='';
	            frm.pass.focus();
	            return false;
	        }
		}
		
		if(frm.pass2.value==''){
	        alert('비밀번호확인을 입력하세요');
	        frm.pass2.focus();
	        return false;
	    }
	    //비밀번호 : 입력값이 둘 다 동일한지 검증. 만약 틀리면 다시 입력요구
	    if(frm.pass.value != frm.pass2.value){
	        alert('입력한 패스워드가 일치하지 않습니다.');
	        //frm.pass.value="";//기존에 입력된 패스워드를
	        frm.pass2.value="";//지워준다.
	        frm.pass2.focus();
	        return false;
	    }
	}
		
	
</script>


<style>
     #phone2, #phoneChk2{
	  margin-top: 30px;
	} 
	#phone3{
		vertical-align: middle;
		padding-top: 17px
	}
    
	#passwd, #confirmpw {
	  padding-left: 20px;
	}
	#zipcode2{
	  padding-left: 10px;
	}
	
	
</style>
</head>
<body>
    <!-- header s -->
    <header id="header">
        <%@ include file="../common/header.jsp" %>
    </header>
    <!-- header e -->

<!-- content s -->
<div id="container">
    <section id="content">
        <div class="sub-type member">
            <div class="inner-box">
                <div class="page-title-wrap v2">
                    <h2 class="page-title">패스워드 변경</h2>
                    <div class="depth-area">
                        <ol>
                            <li><a href="/FreeP/index.html">홈</a></li>
                            <li><strong>패스워드 변경</strong></li>
                        </ol>
                    </div>
                </div>
                <article class="join-area">
                    <div class="join-step2">
                        <div class="step-list">
                            
                        </div>
                        <div class="myinfo-wrap">
                            <div class="form">
                            <form:form name="regFrm" id="regFrm" action="./pwAction.do" method="post" onsubmit="return validateForm(this);">
                                <input type="hidden" name="phone" value=${phone } />
                                
                                <dl>
                                    <dt class="top">변경할 패스워드</dt>
                                    <dd class="mb">
                                        <div class="form-item number">
                                            <input type="password" name="pass" id="passwd" maxlength="16" placeholder="4~12자 영문,숫자만 사용가능합니다." class="passwd">
                                        </div>
                                        <div class="text-type4" id="passwd_alert" style="display:none;"></div>
                                    </dd>
                                    <dt class="top">패스워드 확인</dt>
                                    <dd>
                                        <div class="form-item number">
                                            <input type="password" name="pass2" id="confirmpw" maxlength="16" value="" placeholder="4~12자 영문,숫자만 사용가능합니다." class="passwd">
                                        </div>
                                        <div class="text-type4" id="confirmpw_alert" style="display:none;"></div>
                                    </dd>
                                </dl>
                                
                                
                                <div class="btn-wrap">
                                	<button type="submit" class="btn-type v6" >패스워드 변경하기</button>
                            	</div>
                            </form:form></div>
                            
                        </div>
                    </div>
                </article>
            </div>
        </div> 
    </section> 
</div>
<!-- content e -->

	<!-- footer s -->
    <footer id="footer">
        <%@ include file="../common/footer.jsp" %>
    </footer>
    <!-- footer e -->

    <!-- script area -->
    <script src="../js/includeHTML.js"></script>
    <script>includeHTML();</script>
    
    <script src="../js/motion.js"></script>
    <script src="../js/ui.js"></script>
</body>
</html>