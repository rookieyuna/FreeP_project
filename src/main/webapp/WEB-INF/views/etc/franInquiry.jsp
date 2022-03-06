<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

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
    <link rel="stylesheet" href="../style/company.css">
    <link rel="stylesheet" href="../style/etc.css">
    <link rel="stylesheet" href="../style/layout.css">
    <!-- icon영역 -->
    <link
        href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
        rel="stylesheet">
    <!-- js 라이브러리 영역 -->
    <script src="../js/jquery-3.6.0.js"></script>
    
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

</head>

<body>
    <div id="wrap">
        <!-- header s -->
        <header id="header">
            <%@ include file="../common/header.jsp" %>
        </header>
        <!-- header e -->

        <!-- content s -->
        <div id="container">
            <section id="content">
                <div class="sub-type member fran">
                    <div class="inner-box">
                        <div class="page-title-wrap">
                            <h2 class="page-title">가맹문의</h2>
                            <div class="depth-area">
                                <ol>
                                    <li><a href="/FreeP/index.html">홈</a></li>
                                    <li><strong>가맹문의</strong></li>
                                </ol>
                            </div>
                        </div>
                        <article class="fran-area join-area">
                            <!-- menu-list -->
                            <div class="menu-nav-wrap">
                                <div class="menu-nav">
                                    <ul>
                                    </ul>
                                </div>
                            </div>

                            <div class="title-wrap-center">
                                <h3 class="title-type">
                                    가맹문의
                                </h3>
                                <p>구체적으로 입력해 문의해주시면 보다 정확한 답변과 안내가 가능합니다</p>
                            </div>

                            <div class="franinfo-wrap myinfo-wrap">
                                <div class="form">
                                    <form name="frm" id="frm" action="https://web.dominos.co.kr/member/regStep2Proc" method="post">
                                    <input type="hidden" name="parent_email" id="parent_email">
                                    <input type="hidden" name="dupInfo" id="dupInfo" value="MC0GCCqGSIb3DQIJAyEAGpryv5hXuF3Mze96RapmC//9q0rovUNhxVKAfNF7lhY=">
                                    <input type="hidden" name="connInfo" id="connInfo" value="csf72nHasLNu3IL4dOX9P+AXuuS5CXd0ypD3QBmw4XSrcRxhSPFi0S/Y6n/R2sr8hgZyXYU8U6rPqAoU0+yFWg==">
                                    <input type="hidden" name="auth_type" id="auth_type" value="kg">
                                    <input type="hidden" name="age" id="age" value="26">
                                    <input type="hidden" name="vno" id="vno" value="">
                                    <input type="hidden" name="birth" id="birth" value="">
                                    <input type="hidden" name="job" id="job" value="">
                                    <input type="hidden" name="idDupChk" id="idDupChk" value="N">
                                    <input type="hidden" name="frnDupChk" id="frnDupChk" value="N">
                                    <input type="hidden" name="hand_tel_agency" id="hand_tel_agency">
                                    <input type="hidden" name="hand_tel1" id="hand_tel1">
                                    <input type="hidden" name="email" id="email">
                                    <input type="hidden" name="dm_fl" id="dm_fl" value="N">
                                    <input type="hidden" name="o_dm_fl" id="o_dm_fl" value="N">
                                    <input type="hidden" name="ds_fl" id="ds_fl" value="N">
                                    <input type="hidden" name="hdnAuthKey" id="hdnAuthKey" value="">
                                    <input type="hidden" name="hdnAuthChk" id="hdnAuthChk" value="Y">
                                    <input type="hidden" name="joinptype" id="joinptype" value="D">
                                    <input type="hidden" name="emailChk" id="emailChk" value="">
                                    
                                        <dl>
                                            <dt class="center">이름</dt>
                                            <dd>
                                                <div class="form-item name">
                                                    <input type="text" placeholder="" id="name" name="name" value="" >
                                                </div>
                                            </dd>
                                        </dl>
                                        <dl>
                                            <dt class="center">창업 희망지역</dt>
                                            <dd>
                                                <div class="form-group srch-type">
                                                    <div>
                                                        <div class="select-type2" style="width: 130px;">
                                                            <select id="region_code_1" onchange="LocationChange(this);">
                                                                <option value=""  selected="">시/도</option>
                                                                <option value="01">서울</option>
                                                                <option value="02">인천</option>
                                                                <option value="03">경기</option>
                                                                <option value="04">강원</option>
                                                                <option value="05">충남</option>
                                                                <option value="06">충북</option>
                                                                <option value="07">대전</option>
                                                                <option value="08">경남</option>
                                                                <option value="09">경북</option>
                                                                <option value="10">대구</option>
                                                                <option value="11">전남</option>
                                                                <option value="12">전북</option>
                                                                <option value="13">광주</option>
                                                                <option value="14">울산</option>
                                                                <option value="15">부산</option>
                                                                <option value="16">세종특별자치시</option>
                                                                <option value="17">제주</option>
                                                                </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-item">
                                                        <div class="select-type2" style="width: 130px;">
                                                            <select id="region_code_2">
                                                                <option value="" selected="">구/군</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
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
                                                        <input type="text" name="email1" id="email1">
                                                        <span>@</span>
                                                        <input type="text" name="email2" id="email2">
                                                        <div class="select-type2">
                                                            <select name="email3" id="email3" onchange="checkEmailState($('#email3'),$('#email2'))" class="selected">
                                                                <option value="naver.com">네이버</option>
                                                                <option value="hanmail.net">한메일</option>
                                                                <option value="gmail.com">지메일</option>
                                                                <option value="hotmail.com">핫메일</option>
                                                                <option value="nate.com">네이트</option>
                                                                <option value="WRITE" selected="">직접입력</option>
                                                            </select>
                                                        </div>
                                                        <a href="javaScript:doCheckEmail();" class="btn-type v7">중복확인</a>
                                                    </div>
                                                    <div class="text-type4" id="email_alert" style="display:none;"></div>
                                                </div>
                                            </dd>
                                        </dl>
                                        
                                        <dl>
                                            <dt class="top">문의내용</dt>
                                            <dd>
                                                <div class="form-item name">
                                                    <textarea style="width: 544px; height:300px"></textarea>
                                                </div>
                                                <div class="text-type4" id="frn_alert" style="display:none;"></div>   
                                            </dd>
                                        </dl>
                                        
                                    </form></div>
                                    <div class="btn-wrap">
                                        <a href="../etc/franComplete.do" class="btn-type v6">문의하기</a>
                                    </div>
                            </div>
                        </article>

                        <div class="bottom-guide-area">
                            <div class="box">
                                <div class="list-text">
                                    <dt>※ 가맹점 개설 조건</dt>
                                    <dd>
                                        <ul>
                                            <li>1층 점포 기준 실평수 25평 이상(층고 높이 2.7m 이상)</li>
                                            <li>편도 2차선 왕복도로 이상</li>
                                            <li>점포전면 길이 6m이상</li>
                                            <li>오토바이(5대기준)</li>
                                            <li>주차 확보 공간 여부</li>
                                        </ul>
                                    </dd>
                                </div>
                            </div>
                        </div>
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
        <script>
            includeHTML();
        </script>

        <script src="../js/motion.js"></script>
        <script src="../js/ui.js"></script>
</body>

</html>