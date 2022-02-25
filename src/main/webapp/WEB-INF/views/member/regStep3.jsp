<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                        <div class="join-step3">
                            <div class="step-list">
                                <ul>
                                    <li>01 약관동의</li>
                                    <li>02 개인정보입력</li>
                                    <li class="active">03 가입완료</li>
                                </ul>
                            </div>
                            <div class="info-text-wrap">
                                <strong class="title">WELCOME TO<br>
                                    FREEP’S PIZZA!
                                </strong>
                                <p>
                                    <span>
                                         고객님, FreeP 회원이 되신 것을 환영합니다.
                                    </span>
                                </p>
                                <p class="sub-txt">
                                    로그인 후 쿠폰함으로 제공된 선물을 확인하세요!
                                </p>
                                <div class="btn-wrap">
                                    <a href="/freepproject/index.do" class="btn-type v4">HOME</a>
                                    <a href="/freepproject/member/login.do" class="btn-type v6">로그인</a>
                                </div>
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