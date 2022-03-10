<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" href="../style/regist.css">
    <link rel="stylesheet" href="../style/layout.css">
    <!-- icon영역 -->
    <link
        href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
        rel="stylesheet">
    <!-- js 라이브러리 영역 -->
    <script src="../js/jquery-3.6.0.js"></script>
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script src="https://kenwheeler.github.io/slick/slick/slick.js"></script>
   
    <script>

    
        function goTab(idx){
            $(".login_area").hide();
            $(".btn_tab li").removeClass("active");
            $(".btn_tab li").eq(idx).addClass("active");
            $(".login_area").eq(idx).show();
        }

    </script>
    <script type="text/javascript"> jQuery.noConflict(); </script>
    
    
    
     <script>
        Kakao.init('30aa936b37aaca1c82a705936e71d6bf'); //발급받은 키 중 javascript키를 사용해준다.
        console.log(Kakao.isInitialized()); // sdk초기화여부판단
        
          function kakaoLogin() {
        	  var token = jQuery("meta[name='_csrf']").attr("content");
        	  var header = jQuery("meta[name='_csrf_header']").attr("content");
        	    
        	    Kakao.Auth.login({
        	        success: function(response) {
        	            Kakao.API.request({ // 사용자 정보 가져오기 
        	                url: '/v2/user/me',
        	                success: (response) => {
        	                	console.log("여긴 넘어옴1")
        	                	var kakaoid = response.id;
        	                	var kakaoname = response.properties.nickname;
        	                	var kakaoemail = response.account_email;
							
        	                	console.log(response);
        	                	
        	                	
        	                	
        	                    jQuery.ajax({
        	    					type : "post",
        	    					url : "kakaoLogin.do", // ID중복체크를 통해 회원가입 유무를 결정한다.
        	    					beforeSend : function(xhr){
                	            		xhr.setRequestHeader(header, token);
                	                },
        	    					data : {
        	    						"kakaoid":kakaoid,
        	    						"kakaoname":kakaoname
        	    						/* "kakaoemail":kakaoemail */
        	    					},
        	    					success : function(data){   
										/* console.log("넘어옴2"); */
										console.log(data);	
										
        	    						if(data.kakaoNum==1){
        	    							document.getElementById("id").value=data.kakaoid;
        	    							document.getElementById("passwd").value='0000';
        	    							document.loginFrm.submit();
        	    							
        	    						}else{
        	    							 location.href="regStepKakao.do?kakaoid="+data.kakaoid;
        	    						}
        	    					},
        	    					error: function(request, status, error){
        	    							/* console.log("여기서 에러"); */
        	    		                   alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
        	    		                   location.href="regStep1.do";
        	    		            }
        	    				});
        	                }
        	            });
        	            // window.location.href='/ex/kakao_login.html' //리다이렉트 되는 코드
        	        },
        	        fail: function(error) {
        	            alert(error);
        	        }
        	    });
        	}

      
</script>
</head>
<body>
    <!-- header s -->
    <header id="header">
        <%@ include file="../common/header.jsp" %>
    </header>
    <!-- header e -->
	
	<!-- <a style="border:2px solid red; padding: 200px;" href="regStepKakao.do">프리피 이동</a> -->
    <!-- content s -->
    <div id="container">
        <section id="content">
            <div class="sub-type member">
                <div class="inner-box">
                    <div class="page-title-wrap v2">
                        <h2 class="page-title">로그인</h2>
                        <div class="depth-area">
                            <ol>
                                <li><a href="/FreeP/index.html">홈</a></li>
                                <li><strong>로그인</strong></li>
                            </ol>
                        </div>
                    </div>
                    <article class="login-area">
                        <div class="tab-type5 js_tab">
                            <ul>
                                <li class="active"><a href="#login">회원로그인</a></li>
                                <li><a href="#guest" onclick="showAlert(); return false;">비회원 주문</a></li>
                            </ul>
                        </div>
                        <div class="tab-content active" id="login">
                        <c:url value="/mainLoginAction" var="loginUrl" />
                        
                        <form:form id="loginFrm" name="loginFrm" action="./mainLoginAction" method="post">
                        	<c:if test="${param.error != null }">
								<p>아이디와 패스워드가 잘못되었습니다.</p>
							</c:if>
                            <div class="form-item">
                                <input type="text" name="id" id="id" maxlength="20" placeholder="아이디" value="" >
                            </div>
                            <div class="form-item">
                                <input type="password" placeholder="비밀번호" name="pass" id="passwd" maxlength="20" onkeydown="">
                            </div>
                            <div class="chk-item">
                                <div class="chk-box v4">
                                    <input type="checkbox" id="idcheck">
                                    <label class="checkbox" for="idcheck"></label>
                                    <label for="idcheck">아이디저장</label>
                                </div>
                                <div class="btn-member-wrap" style="margin-bottom:20px">
                                    <span><a href="./findId.do">아이디 찾기</a></span>
                                    <span id="pw"><a href="./findPw.do">패스워드 찾기</a></span>
                                </div>
                            </div>
                            
                            <div class="btn-wrap">
                                <button class="btn-type v4">로그인</button>
                            </div>
                            <div class="btn-wrap">
                                <a href="../member/regist.do" class="btn-type-brd5">회원가입</a>
                            </div>
                            
                            <div class="btn-sns-wrap">
                                <div class="title-wrap">
                                    <div class="title-type">소셜 간편 로그인</div>
                                </div>
                               
                               <form:form action="/member/regStepKakao.do">
                                    <div class="btn-sns-list" id="kakaologin">
                                    	<div class="kakaobtn">
                                    		<input type="hidden" name="kakaoemail" id="kakaoemail" />
                                    		<input type="hidden" name="kakaoname" id="kakaoname" />
                                    		<input type="hidden" name="kakaoid" id="kakaoid" />
                                    		<button type="button" id="custom-login-btn" onclick="kakaoLogin();">
                                            <img src="../images/03visual/btn-kakao.png" alt="카카오" style="width: 222px;">
                                        </button>
                                    	</div>
                                    </div>
                               </form:form>

                                    <div id="appleid-signin" style="display:none;"></div>
                                </ul>
                            </div>
                        </form:form>
                        </div>
                        <div class="tab-content" id="guest">
                        <form name="nonf" id="nonf" action="" method="post">
                        <input type="hidden" name="hp" id="hp" value="" />
                        <input type="hidden" name="returnUrl" id="returnUrl" value="/main" />
                            <div class="sub-text">
                                        아직 FreeP 회원이 아니세요?
                                <a href="">회원가입</a>
                            </div>
                            <div class="form">
                                <div class="form-item">
                                    <input type="text" name="name" id="name" placeholder="이름">
                                </div>
                                <span class="i_error show" id="name_alert"></span>
                                <div class="form-group">
                                    <div class="form-item number">
                                        <div class="select-type2">
                                            <select name="hp1" id="hp1">
                                                <option value="010">010</option>
                                                <option value="011">011</option>
                                                <option value="016">016</option>
                                                <option value="017">017</option>
                                                <option value="018">018</option>
                                                <option value="019">019</option>
                                            </select>
                                        </div>
                                        <input type="text" name="hp2" id="hp2" maxlength="4" onkeyup="checkNum($(this), '숫자만 입력하세요.');">
                                        <input type="text" name="hp3" id="hp3" maxlength="4" onkeyup="checkNum($(this), '숫자만 입력하세요.');">
                                    </div>
                                    <a href="" class="btn-type v7">인증번호</a>
                                </div>
                                <div class="form-group">
                                    <div class="form-item">
                                        <input type="text" placeholder="인증번호" name="auth_num" id="auth_num">
                                    </div>
                                </div>
                            </div>
                            <div class="chk-item">
                                <div class="chk-box v4">
                                    <input type="checkbox" id="agree1" name="agree" value="Y" >
                                    <label class="checkbox" for="agree1"></label>
                                    <label for="agree1">개인정보 수집 및 이용 동의(필수)</label>
                                </div>
                                <a href="" class="btn-link side2">보기</a>
                            </div>
                            
                            
                            <div class="chk-item">
                                <div class="chk-box v4">
                                    <input type="checkbox" id="agree2" name="agree1" value="Y" >
                                    <label class="checkbox" for="agree2"></label>
                                    <label for="agree2">위치기반 서비스 이용약관 동의(필수)</label>
                                </div>
                                <a href="" class="btn-link side2">보기</a>
                            </div>
                            
                            <div class="btn-wrap">
                                <a href="" class="btn-type3">주문하기</a>
                            </div>
                            <p class="title-type2">
                                비회원 주문 시 매니아 및 제휴할인 혜택을 받을 수 없습니다.
                            </p>
                            <div class="banner-wrap">
                                <ul>
                                    <li>
                                        FreeP의 특별한 매니아 혜택을 누려보세요! <a href="../event/mania.html">매니아 혜택</a>
                                    </li>
                                    <li>
                                        10대 고객에게만 드리는 특별한 혜택을 마음껏 누려보세요!<a href="../event/mania4ab4.html?tab=5">틴 매니아</a>
                                    </li>
                                </ul>
                            </div>
                            </form>
                            
                            <!-- kakaoemail을 넘기기 위한 숨겨진 form  -->
                            <!--  
                            <form action="./kakaologin.do" method="post" name="ifrm" hidden>
                            	<input type="text" name="kakaoemail" id="kakaoemail" value="" />
                            </form>
                            -->
                            
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