<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" 
	uri="http://www.springframework.org/tags/form" %> 
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<div id="header-wrap">
    <div class="top-wrap">
        <div class="inner-box" id="tip-box-top">
            <!-- 로고 -->
            <a href="/freepproject/index.do" class="btn-logo">
                <img src="/freepproject/images/01brand/brand_logo_type007.png" alt="logo" style="width: 130px;">
            </a>
            
			<sec:authorize access="isAnonymous()">
            <!-- 로그인/회원가입 -->
            <div class="util-nav">
                <a href="/freepproject/member/login.do">로그인</a>
                <a href="/freepproject/member/regist1.do">회원가입</a>
                <a href="/freepproject/order/cart.do"><span class="material-icons-outlined">shopping_cart</span></a>
            </div>
			</sec:authorize>
			
			<sec:authorize access="isAuthenticated()">
            <!-- 로그아웃/마이페이지 -->
            <div class="util-nav">
            <a><form:form method="post" action="${pageContext.request.contextPath}/member/logout">
				<input class="logout" type="submit" value="로그아웃" />
			</form:form></a>
	            <a href="/freepproject/mypage/myMain.do">마이페이지</a>
	            <a href="/freepproject/order/cart.do"><span class="material-icons-outlined">shopping_cart</span></a>
            </div>
            </sec:authorize>
        </div>
    </div>


    <!-- main 1dep menu -->
    <div id="gnb" class="gnb-wrap">
        <div class="gnb-inner" align="middle">
            <ul>
                <li>
                    <a href="/freepproject/order/orderDIY.do"><span>주문하기</span></a>
                </li>
                <li>
                    <a href="/freepproject/community/review.do"><span>커뮤니티</span></a>
                </li>
                <li>
                    <a href="/freepproject/company/intro.do"><span>회사소개</span></a>
                </li>
            </ul>
            <button class="snb-more">더보기</button>
        </div>

        <div class="snb-wrap">
            <div class="inner-box">
                <div class="mnu-wrap">
                    <div class="mnu-box">
                        <!-- <a href="#">주문하기</a> -->
                        <ul>
                            <li><a href="/freepproject/order/orderDIY.do">DIY피자</a></li>
                            <li><a href="/freepproject/order/orderNormal.do">일반피자</a></li>
                            <li><a href="/freepproject/order/orderSide.do">사이드메뉴</a></li>
                        </ul>
                    </div>
                    <div class="mnu-box">
                        <!-- <a href="#">커뮤니티</a> -->
                        <ul>
                            <li><a href="/freepproject/community/review.do">고객후기</a></li>
                            <li><a href="/freepproject/community/event.do">이벤트</a></li>
                            <li><a href="/freepproject/community/question.do">1:1문의</a></li>
                        </ul>
                    </div>
                    <div class="mnu-box">
                        <!-- <a href="#">매장소개</a> -->
                        <ul>
                            <li><a href="/freepproject/company/intro.do">FreeP</a></li>
                            <li><a href="/freepproject/company/notice.do">공지사항</a></li>
                            <li><a href="/freepproject/company/searchStore.do">매장찾기</a></li>
                        </ul>
                    </div>
                </div>
                <div class="notice-box">
                    <ul>
                        <li><a href="/freepproject/etc/faq.do">FAQ</a></li>
                        <li><a href="/freepproject/etc/franInquiry.do">가맹문의</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
