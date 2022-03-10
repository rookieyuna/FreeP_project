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
	//휴대폰 본인인증이나 아이디 중복확인 해야만 가입할 수 있는 작업을 하기위한 변수선언.
	var flag1 = 0;
	var flag2 = 0;


	//이메일 골라서 인풋박스에 집어넣는 작업과 직접 입력 누를때 외에는 작성 못하도록 disabled 속성 추가.
	function email_input(frm){
		var domain = email3.value;
		if(domain==''){//--선택-- 부분을 선택했을때 
		    frm.email1.value='';//모든 입력값을 지운다.
		    frm.email2.value='';
		}
		else if(domain=='직접입력'){//직접입력을 선택했을때
		    frm.email2.readOnly = false;//사용자가 입력해야 하므로 readonly속성을 해제한다.
		    frm.email2.value='';
		    frm.email2.focus();
		}
		else{//도메인을 선택했을때
		    frm.email2.value=domain;//선택한 도메인을 입력한다.
		    frm.email2.readOnly=true;//입력된 값을 수정할 수 없도록 readonly속성을 활성화한다.
		}
	}
	
	
 	// 아이디 중복확인.
 	function id_check_person() {
		
		var token = $("meta[name='_csrf']").attr("content");
	    var header = $("meta[name='_csrf_header']").attr("content");
		
	    
	    if($("#id").val() == ""){
	    	alert("아이디를 입력해주세요.");
	    }
	    else{
	    	
			$.ajax({  
				 url : './id_check_person.do?id='+$("#id").val(),               
				 type : 'get',
				 beforeSend : function(xhr){
		        		xhr.setRequestHeader(header, token);
		            },
				 dataType : "json",
				 success : function(data){
					 var num = data.num;
					 if(num != 0){
						 alert("아이디가 이미 사용 중입니다. 다시 입력해주세요.");
						 $("#id").val("");
					 }
					 else{
						 alert("사용 가능한 아이디 입니다.");
						 flag1 = 1;
						 $('#passwd').focus();
					 }
				 },
				 error : function(request,statue,error){
		            	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"
		            			+"\n"+"error:"+error)
		            	
		         }
			}); 
	    }
	}
 	
 	//회원정보 입력 확인
	var validateForm = function(frm) {
		if(frm.name.value==''){
	        alert('이름을 입력하세요');
	        frm.name.focus();
	        return false;
	    }
		if(frm.id.value==''){
	        alert('아이디를 입력하세요');
	        frm.id.focus();
	        return false;
	    }
		//아이디는 8~12자로 입력
	    if(!(frm.id.value.length>=4 && frm.id.value.length<=12)){
	        alert("아이디는 4~12자 사이만 가능합니다.");
	        frm.id.value = '';//잘못된 입력값이므로 지워준다.
	        frm.id.focus();//재입력해야 하므로 포커싱 한다.
	        return false;//서버로 전송을 중단해야 하므로 false반환
	    }
		
	    /*
	    아이디를 구성하는 각 문자가 소문자a~z, 대문자A~Z 숫자0~9사이가 아니라면
	    잘못된 문자가 포함된 경우이므로 전송을 중단해야 한다.
	    */
	    for(var i=0 ; i<frm.id.value.length; i++){//아이디의 길이만큼 반복
	        if(!((frm.id.value[i]>='a'&& frm.id.value[i]<='z') ||
	            (frm.id.value[i]>='A'&& frm.id.value[i]<='Z') ||
	            (frm.id.value[i]>='0'&& frm.id.value[i]<='9'))){
	            alert('아이디는 영문과 숫자의 조합으로만 사용할 수 있습니다.');
	            frm.id.value='';
	            frm.id.focus();
	            return false;
	        }
		}
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
		/* if(!frm.hand_tel1.value || !frm.hand_tel2.value || !frm.hand_tel3.value){
	        alert('전화번호를 입력하세요');
	        return false;
	    } */
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
		
		//이메일 주소를 입력
		if(frm.email1.value==''){
	        alert('이메일주소를 입력하세요');
	        frm.email1.focus();
	        return false;
	    }
		//이메일 도메인 주소 입력
		if(frm.email2.value==''){
	        alert('도메인주소를 입력하세요');
	        frm.email2.focus();
	        return false;
	    }
		//우편번호를 입력
		if(frm.zipcode.value==''){
	        alert('우편번호를 입력하세요');
	        frm.zipcode.focus();
	        return false;
	    }
		//주소를 입력
		if(frm.address.value==''){
	        alert('주소를 입력하세요');
	        frm.address.focus();
	        return false;
	    }
		//상세주소를 입력
		if(frm.address2.value==''){
	        alert('상세주소를 입력하세요');
	        frm.address2.focus();
	        return false;
	    }
		if(flag1 == 0){
	        alert('아이디 중복확인을 해주세요.');
	        return false;
	    }
		if(flag2 == 0){
	        alert('휴대폰 본인인증을 진행해주세요.');
	        return false;
	    }
	    
	}
 	
 	
</script>

<!-- 휴대폰 번호 인증 -->
<script>

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
					code2 = data; 
					$('#phone2').focus();
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
			alert("인증에 성공했습니다.");
			flag2 = 1;
			$("#phoneDoubleChk").val("true"); 
			$("#phone2").attr("disabled",true); 
			$('#email1').focus();
		}else{ 
			alert("인증에 실패했습니다.");
			$("#phoneDoubleChk").val("false"); 
			$(this).attr("autofocus",true); 
		}
	}
	
}

</script>

<!-- zipcode 띄우기 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function zipFind(){
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
                // 예제를 참고하여 다양한 활용법을 확인해 보세요.
                
            	var frm = document.regFrm;
                frm.zipcode.value = data.zonecode;//12345(우편번호)
                frm.address.value = data.address;//"서울시 금천구 가산동"(기본주소)
                frm.address2.focus();
            }
        }).open();
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
                    <h2 class="page-title">회원가입</h2>
                    <div class="depth-area">
                        <ol>
                            <li><a href="/FreeP/index.html">홈</a></li>
                            <li><strong>회원가입</strong></li>
                        </ol>
                    </div>
                </div>
                <article class="join-area">
                    <div class="join-step2">
                        <div class="step-list">
                            <ul>
                                <li>01 약관동의</li>
                                <li class="active">02 개인정보입력</li>
                                <li>03 가입완료</li>
                            </ul>
                        </div>
                        <div class="myinfo-wrap">
                            <div class="form">
                            <form:form name="regFrm" id="regFrm" action="./regAction.do" method="post" onsubmit="return validateForm(this);">
                                <dl>
                                    <dt class="center">이름</dt>
                                    <dd>
                                        <div class="form-item name">
                                            <input type="text" placeholder="이름입력" id="name" name="name" value="" >
                                        </div>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt class="top">아이디</dt>
                                    <dd>
                                        <div class="form-item name">
                                            <input type="text" name="id" id="id" maxlength="16" placeholder="4~12자 영문,숫자만 사용가능합니다.">
                                            <button type="button" name="idovr"  id ="idChk" onclick="id_check_person();" style="cursor:hand;"class="btn-type v7" >중복확인</button>
                                        </div>
                                        <div class="text-type4" id="id_alert" style="display:none;"></div>
                                    </dd>
                                    
                                </dl>
                                <dl>
                                    <dt class="top">비밀번호</dt>
                                    <dd class="mb">
                                        <div class="form-item number">
                                            <input type="password" name="pass" id="passwd" maxlength="16" placeholder="4~12자 영문,숫자만 사용가능합니다." class="passwd">
                                        </div>
                                        <div class="text-type4" id="passwd_alert" style="display:none;"></div>
                                    </dd>
                                    <dt class="top">비밀번호 확인</dt>
                                    <dd>
                                        <div class="form-item number">
                                            <input type="password" name="pass2" id="confirmpw" maxlength="16" value="" placeholder="4~12자 영문,숫자만 사용가능합니다." class="passwd">
                                        </div>
                                        <div class="text-type4" id="confirmpw_alert" style="display:none;"></div>
                                    </dd>
                                </dl>
                                
                                <dl>
                                    <dt class="top">휴대전화</dt>
                                    <dd>
                                        <div class="form-item name">
                                            
                                            <input type="text" name="phone" id="phone" maxlength="16" value="" placeholder="-을 제외한 휴대폰 번호 입력" />
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
                                                <input type="text" name="email1" id="email1" placeholder="메일주소입력">
                                                <span>@</span>
                                                <input type="text" name="email2" id="email2" readonly placeholder="도메인입력">
                                                <div class="select-type2">
                                                    <select name="email3" id="email3" onchange="email_input(this.form);" class="selected" width=20px;>
                                                    	<option selected="" value="">메일선택</option>
                                                        <option value="naver.com">네이버</option>
                                                        <option value="hanmail.net">한메일</option>
                                                        <option value="gmail.com">지메일</option>
                                                        <option value="hotmail.com">핫메일</option>
                                                        <option value="nate.com">네이트</option>
                                                        <option value="직접입력" >직접입력</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="text-type4" id="email_alert" style="display:none;"></div>
                                        </div>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt class="center">우편번호</dt>
                                    <dd>
                                        <div class="form-item name">
                                            <input type="text" placeholder="우편번호입력" id="zipcode" name="zipcode" value="" >
                                            <a href="javascript:;" title="새 창으로 열림" onclick="zipFind('zipFind', '<?=$_Common[bbs_path]?>member_zipcode_find.php', 590, 500, 0);" onkeypress="" id="zipcode2">[우편번호검색]</a>
                                        </div>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt class="center">주소</dt>
                                    <dd>
                                        <div class="form-item name">
                                            <input type="text" placeholder="주소입력" id="address" name="address" value="" >
                                            <input type="text" placeholder="상세주소입력" id="address2" name="address2" value="" >
                                        </div>
                                    </dd>
                                </dl>
                                
                                <div class="btn-wrap">
                                	<button type="submit" class="btn-type v6" >가입하기</button>
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