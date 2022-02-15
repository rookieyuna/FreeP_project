<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" 
	uri="http://www.springframework.org/tags/form" %> 
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
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
                        <div class="join-step1">
                            <div class="step-list">
                                <ul>
                                    <li class="active">01 본인인증</li>
                                    <li>02 개인정보입력</li>
                                    <li id="last">03 가입완료</li>
                                </ul>
                            </div>
                            <div class="info-text-wrap">
                                <a href="javascript:UI.layerPopUp({selId: '#pop-accredit'});" class="notice-text">본인인증 안내</a>
                                <strong class="title">반갑습니다.</strong>
                                <p>
                                                    도미노피자 회원가입을 위해서는 본인인증이 필요합니다.<br>
                                                    회원가입은 아동의 개인정보 보호를 위해 만 14세 이상만 가능합니다.
                                </p>
                                <div class="btn-wrap">
                                    <a href="javascript:goCheckByPhone();" class="btn-type v4">휴대전화 인증</a>
                                    <a href="javascript:goCheckByIpin();" class="btn-type v4">아이핀 인증</a>
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