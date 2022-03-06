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
	var flag = 0;
		function validateForm(frm){
			
			//전화번호를 입력
			if(frm.phone.value==''){
		        alert('전화번호를 입력하세요');
		        frm.phone.focus();
		        return false;
		    }
		    //인증번호를 입력
			if(frm.phone2.value==''){
		        alert('인증번호를 입력하세요');
		        frm.phone2.focus();
		        return false;
		    }
		    if(flag == 0){
		    	alert("본인 인증 버튼을 눌러주세요.")
		    	return false;
		    }
		}
	    
</script>

<!-- 휴대폰 번호 인증 -->
<script>
//휴대폰 번호 인증 


var code2 = ""; 
function phoneCheck() {
	
	var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    
    if($("#phone").val() == ""){
    	alert("휴대폰 번호를 입력해주세요.");
    	$('#phone').focus();
    }
    else{
    	
		alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.");
		
		var phone = $("#phone").val(); 
		$.ajax({ 
		type:"GET",
		dataType : "text",
		beforeSend : function(xhr){
			xhr.setRequestHeader(header, token);
	    },
		url:"./phoneCheck.do?phone=" + phone,
		cache : false, 
		success:function(data){ 
				if(data == "error"){ 
					alert("휴대폰 번호가 올바르지 않습니다."); 
							$("#phone").attr("autofocus",true); 
				}else{ 
					alert("전송된 인증번호를 입력해주세요."+data);
					
					$("#phone").attr("readonly",true); 
					$("#phone2").attr("disabled",false); 
					$("#phoneChk").attr("disabled",true);
					$('#phone2').focus();
					code2 = data; 
				} 
			} 
		}); 
    }
};

function phoneCheck2() {
	
	if($("#phone2").val()==""){
		alert("인증번호를 입력해주세요.");
	}
	else{
		
		if($("#phone2").val() == code2){ 
			alert("인증에 성공했습니다, 패스워드를 변경해주세요.");
			$("#phoneDoubleChk").val("true"); 
			$("#phone2").attr("disabled",true); 
			$("#passChage").show(); 
			flag = 1;
		}else{ 
			alert("인증에 실패했습니다.");
			$("#phoneDoubleChk").val("false"); 
			$(this).attr("autofocus",true); 
		}
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
                    <h2 class="page-title">패스워드 찾기</h2>
                    <div class="depth-area">
                        <ol>
                            <li><a href="/FreeP/index.html">홈</a></li>
                            <li><strong>패스워드 찾기</strong></li>
                        </ol>
                    </div>
                </div>
                <article class="join-area">
                    <div class="join-step2">
                        <div class="step-list">
                        
                        </div>
                        <div class="myinfo-wrap">
                            <div class="form">
                            <form:form name="regFrm" id="regFrm" action="./pwChange.do" method="post" onsubmit="return validateForm(this);">
                                
                               
                               
                                <dl>
                                    <dt class="top">가입 시 입력한 휴대전화</dt>
                                    <dd>
                                        <div class="form-item name">
                                            
                                            <input type="text" name="phone" id="phone" maxlength="16" value="" placeholder="- 을 제외한 휴대폰 번호 입력" />
                                            <button type="button" name="phovr"  id ="phoneChk"  onclick="phoneCheck();" style="cursor:hand;"class="btn-type v7" >번호전송</button>
                                            <br>
                                            
                                        </div>
                                        <div class="text-type4" id="tel_alert" style="display:none;"></div>
                                    </dd>
                                   
                                    <dt class="top" id="phone3">인증번호 입력</dt>
                                    <dd>
                                        <div class="form-item name">
                                            <input type="text" name="phone2" id="phone2" maxlength="16" value="" placeholder="문자로 받은 인증번호 입력" disabled />
                                            <button type="button" name="phovr"  id ="phoneChk2" onclick="phoneCheck2();" style="cursor:hand;"class="btn-type v7" >본인인증</button>
                                            <input type="hidden" id="phoneDoubleChk"/>
                                        </div>
                                        <div class="text-type4" id="tel_alert" style="display:none;"></div>
                                    </dd>
                                </dl>
                                
                                <div class="btn-wrap" style="display: none;" id="passChage">
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