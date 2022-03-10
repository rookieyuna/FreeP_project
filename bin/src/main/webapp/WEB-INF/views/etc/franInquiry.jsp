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
//거주지역 셀렉트문
function LocationChange(e) {
	
    const state = document.getElementById("region_code_2");

    const seoul = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
    const incheon = ["계양구","남동구","미추홀구","부평구","서구","연수구","중구","강화군","옹진군"];
    const gyeonggi = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","양평군","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","여주군",];
    const gangwon = ["강릉시","동해시","삼척시","속초시","영월군","원주시","인제군","정선군","철원군","춘천시","태백시","평창군","홍천군","횡성군"];
    const chungnam = ["계룡시","공주시","논산시","당진시","보령시","부여군","서산시","아산시","천안시","태안군","홍성군"];
    const chungbuk = ["제천시","음성군","증평군","진천군","청주시","충주시"];
    const daejeon = ["대덕구", "동구", "서구", "유성구", "중구"];
    const gyeongsangnam = ["거제시", "거창군", "김해시", "밀양시", "사천시", "양산시", "진주시", "창원시", "통영시"];
    const gyeongsangbuk = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","예천군","칠곡군","포항시"];
    const daegu = ["남구", "달서구", "동구", "북구", "서구", "수성구", "중구", "달성군"];
    const jeonnam = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
    const jeonbuk = ["군산시", "김제시", "남원시", "익산시", "전주시", "정읍시", "고창군", "무주군", "부안군", "순창군", "완주군", "임실군", "장수군", "진안군"];
    const gwangju = ["광산구", "남구", "동구", "북구", "서구"];
    const ulsan = ["남구","동구","북구","중구","울주군"];
    const busan = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
    const jeju = ["서귀포시","제주시","남제주군","북제주군"];
    const sejong = ["세종시"];
    

    if (e.value == "서울") {
        add = seoul;
    } else if (e.value == "인천") {
        add = incheon;
    } else if (e.value == "경기") {
        add = gyeonggi;
    } else if (e.value == "강원") {
        add = gangwon;
    } else if (e.value == "충남") {
        add = chungnam;
    } else if (e.value == "충북") {
        add = chungbuk;
    } else if (e.value == "대전") {
        add = daejeon;
    } else if (e.value == "경남") {
        add = gyeongsangnam;
    } else if (e.value == "경북") {
        add = gyeongsangbuk;
    } else if (e.value == "대구") {
        add = daegu;
    } else if (e.value == "전남") {
        add = jeonnam;
    } else if (e.value == "전북") {
        add = jeonbuk;
    } else if (e.value == "광주") {
        add = gwangju;
    } else if (e.value == "울산") {
        add = ulsan;
    } else if (e.value == "부산") {
        add = busan;
    } else if (e.value == "세종특별자치시") {
        add = sejong;
    } else if (e.value == "제주") {
        add = jeju;
    }

    //초기화 
    state.options.length = 1;

    for (property in add) {
        let opt = document.createElement("option");
        opt.value = add[property];
        opt.innerHTML = add[property];
        state.appendChild(opt);
    }
}

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
                                    <form:form name="frm" id="frm" action="./franWriteAction.do" method="post" >
                                    
                                    <input type="hidden" name="_csrf" value="${_csrf.token}"> 
	 								<input type="hidden" name="_csrf_header" value="${_csrf.headerName}"> 
	 
                                    
                                    
                                        <dl>
                                            <dt class="center">이름</dt>
                                            <dd>
                                                <div class="form-item name">
                                                    <input type="text" placeholder="이름입력" id="name" name="f_name" value="" >
                                                </div>
                                            </dd>
                                        </dl>
                                        <dl>
                                            <dt class="center">창업 희망지역</dt>
                                            <dd>
                                                <div class="form-group srch-type">
                                                    <div>
                                                        <div class="select-type2" style="width: 130px;">
                                                            <select name="address1" id="region_code_1" onchange="LocationChange(this);">
                                                                <option value=""  selected="">시/도</option>
                                                                <option value="서울">서울</option>
                                                                <option value="인천">인천</option>
                                                                <option value="경기">경기</option>
                                                                <option value="강원">강원</option>
                                                                <option value="충남">충남</option>
                                                                <option value="충북">충북</option>
                                                                <option value="대전">대전</option>
                                                                <option value="경남">경남</option>
                                                                <option value="경북">경북</option>
                                                                <option value="대구">대구</option>
                                                                <option value="전남">전남</option>
                                                                <option value="전북">전북</option>
                                                                <option value="광주">광주</option>
                                                                <option value="울산">울산</option>
                                                                <option value="부산">부산</option>
                                                                <option value="세종특별자치시">세종특별자치시</option>
                                                                <option value="제주">제주</option>
                                                                </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-item">
                                                        <div class="select-type2" style="width: 130px;">
                                                            <select name="address2"  id="region_code_2">
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
                                            
                                            <input type="text" name="f_phone" id="phone" maxlength="16" style="width: 265px; value="" placeholder="-을 제외한 휴대폰 번호 입력" />
                                            <button type="button" name="phovr"  id ="phoneChk"  onclick="phoneCheck();" style="cursor:hand;"class="btn-type v7" >번호전송</button>
                                            <br>
                                            
                                        </div>
                                        <div class="text-type4" id="tel_alert" style="display:none;"></div>
                                    </dd>
                                   
                                    <dt class="top" id="phone3">휴대전화 인증</dt>
                                    <dd>
                                        <div class="form-item name">
                                            <input type="text" name="phone2" id="phone2" maxlength="16" style="width: 265px; value="" placeholder="인증번호 입력" disabled />
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
                                                            <select name="email3" id="email3" onchange="email_input(this.form);" class="selected">
                                                                <option value="naver.com">네이버</option>
                                                                <option value="hanmail.net">한메일</option>
                                                                <option value="gmail.com">지메일</option>
                                                                <option value="hotmail.com">핫메일</option>
                                                                <option value="nate.com">네이트</option>
                                                                <option value="WRITE" selected="">직접입력</option>
                                                            </select>
                                                        </div>
                                                       
                                                    </div>
                                                    <div class="text-type4" id="email_alert" style="display:none;"></div>
                                                </div>
                                            </dd>
                                        </dl>
 
                                        <dl>
                                            <dt class="top">문의내용</dt>
                                            <dd>
                                                <div class="form-item name">
                                                    <textarea name="f_content" style="width: 544px; height:300px" placeholder="문의내용을 입력해 주세요"></textarea>
                                                </div>
                                                <div class="text-type4" id="frn_alert" style="display:none;"></div>   
                                            </dd>
                                        </dl>
                                        <div class="btn-wrap">
                                       		<button class="btn-type v6">문의하기</button>
                                    	</div> 
                                    </form:form></div>
                                    
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