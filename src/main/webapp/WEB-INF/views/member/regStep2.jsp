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
	
	
 	/* function id_check_person() {
		$.ajax({  
			url : '/member/id_check_person.do',               
			type : 'post', 
			dataType : "JSON"
			data : {"id" : $("#id").val()},
			success : function(data){
				if(data == 1){
					 alert("아이디가 이미 사용 중입니다.");
				}else if(data == 0){
					 $("#idChk").attr("value", "Y");
					 alert("사용 가능한 아이디 입니다.");
				}
			} 
			 
		})
	} */
 	function id_check_person() {
		
		var token = $("meta[name='_csrf']").attr("content");
	    var header = $("meta[name='_csrf_header']").attr("content");
		
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
					 alert("아이디가 이미 사용 중입니다.");
					 
				 }
			 },
			 error : function(request,statue,error){
	            	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"
	            			+"\n"+"error:"+error)
	            	
	            }
			}); 
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
                            <form:form name="regFrm" id="regFrm" action="./regAction.do" method="post">
                                <dl>
                                    <dt class="center">이름</dt>
                                    <dd>
                                        <div class="form-item name">
                                            <input type="text" placeholder="" id="name" name="name" value="" >
                                        </div>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt class="top">아이디</dt>
                                    <dd>
                                        <div class="form-item name">
                                            <input type="text" name="id" id="id" maxlength="16">
                                            <button type="button" name="idovr"  id ="idChk" onclick="id_check_person();" style="cursor:hand;"class="btn-type v7" >중복확인</button>
                                        </div>
                                        <div class="text-type4" id="id_alert" style="display:none;"></div>
                                    </dd>
                                    
                                </dl>
                                <dl>
                                    <dt class="top">비밀번호</dt>
                                    <dd class="mb">
                                        <div class="form-item number">
                                            <input type="password" name="pass" id="passwd" maxlength="16" placeholder="8~16자 영문대소문자,숫자, 특수문자 사용가능">
                                        </div>
                                        <div class="text-type4" id="passwd_alert" style="display:none;"></div>
                                    </dd>
                                    <dt class="top">비밀번호 확인</dt>
                                    <dd>
                                        <div class="form-item number">
                                            <input type="password" name="confirmpw" id="confirmpw" maxlength="16" value="">
                                        </div>
                                        <div class="text-type4" id="confirmpw_alert" style="display:none;"></div>
                                    </dd>
                                </dl>
                                
                                <dl>
                                    <dt class="top">휴대전화</dt>
                                    <dd>
                                        <div class="form-group v2">
                                            <div class="form-item">
                                                <div class="select-type2">
                                                <input type="hidden" name="sel_hand_tel_agency" id="sel_hand_tel_agency" value="SKT">
                                                    <select name="hand_tel1" id="hand_tel1" class="selected" title="휴대전화번호">
                                                        <option value="010">010</option>
                                                        <option value="011">011</option>
                                                        <option value="016">016</option>
                                                        <option value="017">017</option>
                                                        <option value="018">018</option>
                                                        <option value="019">019</option>
                                                    </select>
                                                </div>
                                                <input type="text" name="hand_tel2" id="hand_tel2" maxlength="4" value=""  class="i_text" onkeyup="checkNum($(this), '숫자만 입력해주세요.');" title="휴대전화번호">
                                                <input type="text" name="hand_tel3" id="hand_tel3" maxlength="4" value=""  class="i_text" onkeyup="checkNum($(this), '숫자만 입력해주세요.');" title="휴대전화번호">
                                                <br>
                                                
                                                <a href="javascript:void(0)" class="btn-type v7">
                                                            인증완료
                                                        </a>	
                                                    </div> <!-- //form-item -->
                                            <div class="text-type4" id="tel_alert" style="display:none;"></div>
                                        </div>
                                    </dd> 
                                </dl>
                                
                                <dl>
                                    <dt class="center">이메일</dt>
                                    <dd>
                                        <div class="form-group v2">
                                            <div class="form-item e-mail">
                                                <input type="text" name="email1" id="email1">
                                                <span>@</span>
                                                <input type="text" name="email2" id="email2" readonly>
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
                                            <input type="text" placeholder="" id="zipcode" name="zipcode" value="" >
                                            <a href="javascript:;" title="새 창으로 열림" onclick="zipFind('zipFind', '<?=$_Common[bbs_path]?>member_zipcode_find.php', 590, 500, 0);" onkeypress="">[우편번호검색]</a>
                                        </div>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt class="center">주소</dt>
                                    <dd>
                                        <div class="form-item name">
                                            <input type="text" placeholder="" id="address" name="address" value="" >
                                            <input type="text" placeholder="상세주소" id="address2" name="address2" value="" >
                                        </div>
                                    </dd>
                                </dl>
                                
                                <div class="btn-wrap">
                                	<button type="submit" class="btn-type v6">가입하기</button>
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