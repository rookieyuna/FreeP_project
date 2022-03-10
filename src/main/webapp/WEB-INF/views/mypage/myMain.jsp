<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="form" 
	uri="http://www.springframework.org/tags/form" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<!DOCTYPE html>
<html lang="ko">

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
    <link rel="stylesheet" href="../style/mypage.css">
    <link rel="stylesheet" href="../style/layout.css">
    <!-- icon영역 -->
    <link
        href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
        rel="stylesheet">
    <!-- js 라이브러리 영역 -->
    <script src="../js/jquery-3.6.0.js"></script>


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
                                    <li class="active"><a href="../mypage/myMain.do">MY프리피</a></li>
                                    <li><a href="../mypage/myOrder.do">주문내역</a></li>
                                    <li><a href="../mypage/myCoupon.do">쿠폰/적립금</a></li>
                                    <li><a href="../mypage/myReview.do">MY리뷰</a></li>
                                    <li><a href="../mypage/myQuestion.do">1:1문의</a></li>
                                    <li><a href="../mypage/myUserinfo.do">정보수정</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="title-wrap-center">
                            <h3 class="title-type">
                                MY프리피
                            </h3>
                            <p>다양한 혜택을 확인해보세요</p>
                        </div>

                        <div class="mapage-wrap">
                            <div class="section-box">
                                <div class="body-section mypage-section">
                                    <div class="contents-section">
                                        <div class="section-wrap section-top">
                                            <div class="section-box">
                                                <div class="section-group oil-information">
                                                    <div class="my-oil-details section-left">
                                                        <br>
                                                        <p class="user">
                                                            <strong class="user-name font-secondary font-color-primary">${name }</strong> 님 반갑습니다.
                                                        </p>
                                                        <div class="my-info">
                                                            <div class="title-wrap title-type2">
                                                                <h2 class="tit">FreeP 쿠폰</h2>
                                                            </div>
                                                            <div class="info-box">
                                                                <p class="my-lastMonth-sum">
                                                                    고객님의 사용가능 쿠폰은 <strong class="my-state down"><em
                                                                            class="font-secondary">${myCouponCount }</em>장</strong>입니다.<br><br>
                                                                </p>
                                                            </div>
                                                            <button class="btn-type4 v4" onclick="location.href='myCoupon.do';">사용 가능 쿠폰 확인하기</button>
                                                        </div>
                                                    </div>

                                                    <div class="section-right">
														<div class="my-coupon">
                                                            <div class="title-wrap title-type2">
                                                                <h2 class="tit">FreeP 적립금</h2>
                                                            </div>
                                                            <div class="info-box">
                                                                <ul class="list">
                                                                    <li>
                                                                        <dl class="item">
                                                                            <dt>사용 가능 적립금</dt>
                                                                            <dd><strong class="font-secondary font-color-primary">
                                                                            		<fmt:formatNumber value="${myPoint }" pattern="#,###"/>
                                                                                </strong><span>원</span>
                                                                            </dd>
                                                                        </dl>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <%-- <div class="my-coupon">
                                                            <div class="title-wrap title-type2">
                                                                <h2 class="tit">FreeP 쿠폰</h2>
                                                            </div>
                                                            <div class="info-box">
                                                                <ul class="list">
                                                                	<li>
                                                                        <dl class="item">
                                                                            <dt>사용 가능 쿠폰</dt>
                                                                            <dd>
                                                                            	<strong class="font-secondary">${myCouponCount }</strong><span>개</span>
                                                                            </dd>
                                                                            <dd></dd>
                                                                        </dl>
                                                                    </li>
                                                                </ul>
                                                                <ul>
                                                                    <c:forEach items="${myCoupons }" var="row">
                                                                    	<li>
	                                                                        <dl class="item">
	                                                                            <dt>쿠폰명</dt>
	                                                                            <dd>
	                                                                            	<strong class="font-secondary">${row.cp_name }</strong>
	                                                                            </dd>
	                                                                        </dl>
	                                                                        <dl class="item">
	                                                                            <dt>할인금액</dt>
	                                                                            <dd>
	                                                                            	<strong class="font-secondary font-color-primary">
			                                                                            <fmt:formatNumber value="${row.cp_price }" pattern="#,###"/>
	                                                                            	</strong><span>원</span>
	                                                                            </dd>
	                                                                        </dl>
	                                                                        <dl class="item">
	                                                                            <dt>쿠폰 만료일자</dt>
	                                                                            <dd>
		                                                                            <c:set var="expire_date" value="${row.expire_date }" />
																					<strong class="font-secondary">${fn:substring(expire_date, 0, 10)}</strong>
	                                                                            	<strong class="font-secondary font-color-primary">${row.expire_date }</strong>
	                                                                            </dd>
	                                                                        </dl>
	                                                                    </li>
																	</c:forEach>
                                                                </ul>
                                                            </div>
                                                        </div> --%>
                                                            


                                                        


                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>




                    </article>
                </div>
            </div>
        </div>
    </div>

    <footer id="footer">
        <%@ include file="../common/footer.jsp" %>
    </footer>


    <script src="../js/includeHTML.js"></script>
    <script>
        includeHTML();
    </script>

    <script src="../js/motion.js"></script>
    <script src="../js/ui.js"></script>

</body>

</html>