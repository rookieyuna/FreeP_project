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
    <style type="text/css">
    	.text_reg{
    		width: 500px;
    		height: 300px;
    		margin-top :25px;
    	}
    	button {
		  margin-top: 15px;
		}
    	
    </style>
    <script>
	function ckCheck(Chk) {
	   var chk1=document.Chk.chk_ds_fl.checked;
	   if(chk1==""){
	    alert('약관에동의해 주세요');
	    Chk.chk_ds_fl.focus();
	   
	    return false;
	   }
	}
	</script>
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
                        <div class="join-step1">
                            <div class="step-list">
                                <ul>
                                    <li class="active">01 약관동의</li>
                                    <li>02 개인정보입력</li>
                                    <li id="last">03 가입완료</li>
                                </ul>
                            </div>
                            <div class="info-text-wrap">
                                <strong class="title">반갑습니다.</strong>
                                <div style="white-space:nowrap ;">
	                                <textarea class="text_reg" rows="30" cols="30" name="contents" readonly>
	                                
주식회사 FreeP(이하 ‘회사’라고 함)은 회사에서 제공하는 서비스(이하 ‘서비스’라고 함)를 이용하는 회원님(이하 ‘이용자’라고 함)의 개인정보를 매우 소중하게 생각하고 있으며, 이용자의 개인정보를 보호하기 위하여 최선의 노력을 다하고 있습니다.
회사는 『정보통신망이용촉진및정보보호등에관한법률』을 비롯한 모든 개인정보보호 관련 법률규정을 준수하고 있으며 회사의 개인정보보호정책을 별도로 제정하고 이를 준수함으로써 이용자의 개인정보를 더욱 보호하고 있습니다. 또한 회사는 개인정보보호정책을 항상 회사 홈페이지 첫 화면에 공개함으로써 이용자들이 언제나 쉽게 열람할 수 있도록 조치하고 있습니다.
										
회사의 개인정보보호정책은 관련 법률 및 고시의 변경 또는 내부 운영방침의 변경에 따라 변경될 수 있습니다. 회사의 개인정보보호정책이 수정될 경우 변경된 사항은 홈페이지를 통하여 공지합니다. FreeP (이하 ‘회사’라고 함) 은 회사에서 제공하는 서비스 (이하 ‘서비스’라고 함) 를 이용하는 회원님 (이하 ‘이용자’라고 함) 의 개인정보를 매우 소중하게 생각하고 있으며, 이용자의 개인정보를 보호하기 위하여 최선의 노력을 다하고 있습니다.
회사는 『정보통신망이용촉진및정보보호등에관한법률』을 비롯한 모든 개인정보보호 관련 법률규정을 준수하고 있으며 회사의 개인정보보호정책을 별도로 제정하고 이를 준수함으로써 이용자의 개인정보를 더욱 보호하고 있습니다. 또한 회사는 개인정보보호정책을 항상 회사 홈페이지 첫 화면에 공개함으로써 이용자들이 언제나 쉽게 열람할 수 있도록 조치하고 있습니다.
										
회사의 개인정보보호정책은 관련 법률 및 고시의 변경 또는 내부 운영방침의 변경에 따라 변경될 수 있습니다. 회사의 개인정보보호정책이 수정될 경우 변경된 사항은 홈페이지를 통하여 공지합니다.
										
									</textarea>
								</div>    
                                <form:form name="Chk" method="post" action="./regist2.do" onsubmit="return ckCheck(this);">
	                                
	                                <div class="btn-wrap">
	                                	
	                                	<!-- <p><input type="checkbox" id="check_reg" name="agreement1" value="1" >이용약관과 개인정보취급방침에 동의합니다.</p> -->
	                                    <div class="chk-box v4">
                                            <input type="checkbox" id="chk_ds_fl" name="chk_ds_fl" value="Y">
                                            <label class="checkbox" for="chk_ds_fl"></label>
                                            <label for="chk_ds_fl">이용약관과 개인정보취급방침에 동의합니다.</label>
                                        </div>
	                                	
	                                    
	                                </div>
	                                    <button type="submit" class="btn-type v4" >가입하기</button>
                                </form:form>
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