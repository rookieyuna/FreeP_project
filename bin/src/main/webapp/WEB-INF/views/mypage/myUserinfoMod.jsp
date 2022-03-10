<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<script>
//비밀번호 변경 여부
function openPasswordChange(){
    if($('.pw').css('display') == 'none'){
    	$('.pw').show();
	}
    else{
    	$('.pw').hide();
	}
}
//도메인 선택시 태그값 변경
function email_input(frm){
	var domain = email3.value;
	if(domain==''){
	    frm.email1.value='';
	    frm.email2.value='';
	}
	else if(domain=='직접입력'){
	    frm.email2.readOnly = false;
	    frm.email2.value='';
	    frm.email2.focus();
	}
	else{
	    frm.email2.value=domain;
	    frm.email2.readOnly=true;
	}
}

//우편번호 검색
function zipFind(){
    new daum.Postcode({
        oncomplete: function(data) {
        	var frm = document.frm;
            frm.zipcode.value = data.zonecode;//12345(우편번호)
            frm.address.value = data.address;//"서울시 금천구 가산동"(기본주소)
            frm.address2.focus();
        }
    }).open();
}

//정보동의 전체선택
/* $('#all_check').click(function(){
	if($("input:checkbox[id='all_check']").prop("checked")){
		$("input[type=checkbox]").prop("checked", true);
	}
	else{
		$("input[type=checkbox]").prop("checked", false);
	}
}); */
function checkAll(){
   	if(document.getElementById("all").checked==true){  //id 를 사용하여 하나의 객체만을 호출
        for(var i=0;i<3;i++) document.getElementsByName("checkBox")[i].checked=true;   //name 을 사용하여 배열 형태로 담아 호출
    }
    if(document.getElementById("all").checked==false){
        for(var i=0;i<3;i++) document.getElementsByName("checkBox")[i].checked=false;  
    }
}

//폼 값 검증
function formValidate(frm){
	
	if($('.pw').css('display') == 'none'){
	}
	else if($('.pw').css('display') != 'none'){
	    //패스워드 입력여부 확인
	    if(!frm.pass1.value || !frm.pass2.value){
	        alert('비밀번호를 입력하세요');
	        frm.pass1.focus();
	        return false;
	    }
	  	//패스워드 검증작업1-패스워드 길이 확인
	    if(frm.pass1.value.length<4 ||frm.pass1.value.length>12){
	        alert('비밀번호는 4~12자로 입력하세요');
	        frm.pass1.value='';
	        frm.pass2.value='';
	        frm.pass1.focus();
	        return false;
	    }
	    //패스워드 검증작업2-영문자/숫자만사용
	    var pwCheck= true;
	    for(var i=0; i<frm.pass1.value.length; i++){
	        if(!((frm.pass1.value[i]>='a' && frm.pass1.value[i]<='z')||
	            (frm.pass1.value[i]>='A' && frm.pass1.value[i]<='Z') ||
	            (frm.pass1.value[i]>='1' && frm.pass1.value[i]<='9')))
	        	pwCheck = false;
	    }
	    if(pwCheck==false){
	        alert('비밀번호는 숫자와 영문자만 가능합니다');
	        frm.pass1.value=''; //지워준다
	        frm.pass2.value=''; //지워준다
	        frm.pass1.focus();
	        return false;
	    }
	    
	    //패스워드 일치여부 확인
	    if(frm.pass1.value != frm.pass2.value){
	        alert('패스워드가 일치하지 않습니다.');
	        frm.pass1.value="";
	        frm.pass2.value="";
	        frm.pass1.focus();
	        return false;
	    }
	}

    //휴대전화 입력 확인
    if(frm.hand_tel1.value=='' || frm.hand_tel2.value=='' || frm.hand_tel3.value==''){
        alert('휴대전화 번호를 입력하세요');
        frm.hand_tel1.focus();
        return false;
    }
    //이메일 입력 확인
    if(frm.email1.value=='' || frm.email2.value==''){
        alert('이메일을 입력하세요');
        frm.email1.focus();
        return false;
    }
    //주소입력확인
    if(frm.zipcode.value=='' || frm.address.value==''){
        alert('주소를 입력하세요');
        return false;
    }
    
    return true;
}


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
		url:"../member/phoneCheck.do?phone=" + phone,
		cache : false, 
		success:function(data){ 
				if(data == "error"){ 
					alert("휴대폰 번호가 올바르지 않습니다."); 
							$("#phone").attr("autofocus",true); 
				}else{ 
					alert("전송된 인증번호를 입력해주세요."+data);
					//$("#phone2").attr("disabled",false); 
					//$("#phoneChk2").css("display","inline-block"); 
					$("#phone").attr("readonly",true); 
					$("#phone2").attr("disabled",false); 
					$("#phoneChk").attr("disabled",true); 
					code2 = data; 
				} 
			}, 
	    error : function(request,statue,error){
        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"
        			+"\n"+"error:"+error)
        	
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
			alert("인증에 성공했습니다.");
			flag2 = 1;
			//비밀번호 찾기할 때 window.onload(비밀번호입력할새로만든jsp경로); location.href 둘중 하나 검색해서 해보기.
			$("#phoneDoubleChk").val("true"); 
			$("#phone2").attr("disabled",true); 
		}else{ 
			alert("인증에 실패했습니다.");
			$("#phoneDoubleChk").val("false"); 
			$(this).attr("autofocus",true); 
		}
	}
	
}

</script>
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
    <!-- zipcode 띄우기 -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
<style>
    
	#phone, #phone2 {
		width: 220px;
	}
	#address, #address2 {
		width: 720px;
	}
	#phone2, #phoneChk2{
	  margin-top: 3px;
	}
	#phone3{
		vertical-align: middle;
		/* padding-top: 5px */
	}
	#phoneChk, #phoneChk2{
		margin-left: 5px;
	}
	
	
</style>
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
                                개인정보 수정
                            </h3>
                            <p>회원님의 정보를 수정하세요</p>
                        </div>

                        <form:form name="frm" id="frm" action="./myInfoUpdate.do" method="post" onsubmit="return formValidate(this);">
                        	<input type="hidden" name="name" value="${vo.name }">
                        	<input type="hidden" name="m_code" value="${vo.m_code }">
                        	<input type="hidden" name="old_pass" value="${vo.pass }">
                            <div class="myinfo-wrap">
                                <div class="form">
                                    <dl>
                                        <dt class="center">아이디</dt>
                                        <dd>${vo.id }</dd>
                                    </dl>
                                    <dl>
                                        <dt>이름</dt>
                                        <dd>
                                            <span id="name_area">${vo.name }</span>
                                        </dd>

                                    </dl>
                                    <dl class="non-pw">
                                        <dt class="center">비밀번호</dt>
                                        <dd>
                                            <a href="javascript:openPasswordChange();" class="btn-type4 v2">비밀번호 변경</a>
                                        </dd>
                                    </dl>
                                    <dl class="pw" style="display:none;" >
                                        <dt>새 비밀번호</dt>
                                        <dd>
                                            <div class="form-item number">
                                                <input type="password" name="pass1" maxlength="16" value="" id="new_passwd1" 
                                                	placeholder="4~12자 영문, 숫자 사용가능">
                                            </div>
                                        </dd>
                                        <dt id="new_passwd3">비밀번호 확인</dt>
                                        <dd>
                                            <div class="form-item number">
                                                <input type="password" name="pass2" maxlength="16" value="" id="new_passwd2" 
                                                	placeholder="4~12자 영문, 숫자 사용가능">
                                            </div>
                                        </dd>
                                    </dl>
                                    
                                    <dl>
                                    <dt class="top">휴대전화</dt>
                                    <dd>
                                        <div class="form-item name">
                                            
                                            <input type="text" name="phone" id="phone" width="400px" maxlength="16" value="${vo.phone }" placeholder="-을 제외한 휴대폰 번호 입력" />
                                            <button type="button" name="phovr"  id ="phoneChk"  onclick="phoneCheck();" style="cursor:hand;"class="btn-type v7" >번호전송</button>
                                            <br>
                                            
                                        </div>
                                        <div class="text-type4" id="tel_alert" style="display:none;"></div>
                                    </dd>
                                   
                                    <dt class="top" id="phone3">휴대전화 인증</dt>
                                    <dd>
                                        <div class="form-item name">
                                            <input type="text" name="phone2" id="phone2" maxlength="16" value="" placeholder="인증번호 입력" disabled />
                                            <button type="button" name="phovr"  id ="phoneChk2" onclick="phoneCheck2();" style="cursor:hand;"class="btn-type v7" >본인인증</button>
                                            <input type="hidden" id="phoneDoubleChk"/>
                                        </div>
                                        <div class="text-type4" id="tel_alert" style="display:none;"></div>
                                    </dd>
                                </dl>
                                    
                                    <dl>
                                        <dt class="center">이메일</dt>
                                        <dd>
                                            <div class="form-group v2">
                                                <div class="form-item e-mail">
                                                	<c:set var="email" value="${vo.email }" />
                                                    <input type="text" name="email1" id="email1" value="${fn:split(email, '@')[0] }">
                                                    <span>@</span>
                                                    <input type="text" name="email2" id="email2" value="${fn:split(email, '@')[1] }" readonly>
                                                    <div class="select-type2">
                                                        <select name="email3" id="email3" onchange="email_input(this.form);" class="selected" width=20px;>
                                                            <option value="" selected disabled>메일선택</option>
	                                                        <option value="naver.com">네이버</option>
	                                                        <option value="hanmail.net">한메일</option>
	                                                        <option value="gmail.com">지메일</option>
	                                                        <option value="hotmail.com">핫메일</option>
	                                                        <option value="nate.com">네이트</option>
	                                                        <option value="직접입력" >직접입력</option>
                                                        </select>
                                                    </div>
                                                    <!-- <button class="btn-type v7">변경/확인</button> -->
                                                </div>
                                                <div class="text-type4" id="email_alert" style="display:none;"></div>
                                            </div>
                                        </dd>
                                    </dl>
                                    <dl>
	                                    <dt class="center">우편번호</dt>
	                                    <dd>
	                                    <div class="form-group v2">
	                                        <div class="form-item e-mail">
	                                            <input type="text" placeholder="" id="zipcode" name="zipcode" value="${vo.zipcode }" readonly>
	                                            <button title="새 창으로 열림" onclick="zipFind('zipFind', '<?=$_Common[bbs_path]?>member_zipcode_find.php', 590, 500, 0);" 
	                                            	onkeypress="" type="button" class="btn-type v7" >우편번호검색
	                                            </button>
	                                        </div>
	                                    </div>
	                                    </dd>
	                                </dl>
	                                <dl>
	                                    <dt class="center">주소</dt>
	                                    <dd>
	                                        <div class="form-item name">
	                                            <input type="text" placeholder="" id="address" name="address" value="${vo.address }" readonly>
	                                            <input type="text" placeholder="상세주소" id="address2" name="address2" value="" >
	                                        </div>
	                                    </dd>
	                                </dl>
                                    <!-- <dl>
                                        <dt>정보 수신동의</dt>
                                        <dd>
                                            <div class="form agree">
                                                <div class="chk-box v4">
                                                    <input type="checkbox" id="all" name="checkBox" class="all-check" onclick="checkAll();">
                                                    <label class="checkbox" for="all"></label>
                                                    <label for="all">전체 동의하기</label>
                                                </div>
                                                <ul>
                                                    <li>
                                                        <div class="chk-box agree-children">
                                                            <input type="checkbox" id="chk_dm_fl" name="checkBox" value="Y">
                                                            <label class="checkbox" for="chk_dm_fl"></label>
                                                            <label for="chk_dm_fl">이메일을 통한 제품 및 이벤트 정보수신에
                                                                동의합니다.(선택)</label>
                                                        </div>
                                                        <div class="chk-box agree-children">
                                                            <input type="checkbox" id="chk_ds_fl" name="checkBox" value="Y">
                                                            <label class="checkbox" for="chk_ds_fl"></label>
                                                            <label for="chk_ds_fl">문자(SMS,MMS 등)를 통한 제품 및 이벤트 정보수신에
                                                                동의합니다.(선택)</label>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="text-type">
                                                - 정보수신 미 동의 시 이벤트 / 할인쿠폰 / 신제품 등의 안내를 받으실 수 없습니다.<br>
                                                - 회원정보, 서비스 주요정책 관련 메시지는 수신동의 여부와 관계없이 발송됩니다.<br>
                                                ※ 동의를 거부하시는 경우에도 프리피 서비스는 이용하실 수 있습니다.<br>
                                            </div>
                                        </dd>
                                    </dl> -->
                                    <!-- <dl>
                                        <dt>개인정보 유효기간 선택</dt>
                                        <dd>
                                            <div class="chk-wrap">
                                                <div class="chk-box">
                                                    <input type="radio" name="info_years" id="info_years1" value="1">
                                                    <label class="checkbox" for="info_years1"></label>
                                                    <label for="info_years1">1년</label>
                                                </div>
                                                <div class="chk-box selected">
                                                    <input type="radio" name="info_years" id="info_years3" value="3" checked>
                                                    <label class="checkbox" for="info_years3"></label>
                                                    <label for="info_years3">3년</label>
                                                </div>
                                                <div class="chk-box">
                                                    <input type="radio" name="info_years" id="info_years5" value="5">
                                                    <label class="checkbox" for="info_years5"></label>
                                                    <label for="info_years5">5년</label>
                                                </div>
                                            </div>
                                            <div class="text-type">
                                                - 설정하신 기간동안 로그인/주문 등의 서비스 이용이 없을 시, 휴면계정으로 처리되어 각종 이벤트/쿠폰혜택을 받아보실 수 없습니다.
                                            </div>
                                        </dd>
                                    </dl> -->
                                </div>
                                <div class="btn-wrap">
                                    <a href="javascript:location.reload();" class="btn-type v4">초기화</a>
                                	<button type="submit" class="btn-type v4">수정하기</button>
                                    <p class="desc">프리피를 더 이상 이용하지 않는다면
                                    	<a href="#" class="btn-link"><span>회원탈퇴 바로가기</span></a>
                                    </p>
                                </div>
                            </div>
                        </form:form>



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