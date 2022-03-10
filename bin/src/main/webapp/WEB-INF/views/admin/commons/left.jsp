<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="app-sidebar sidebar-shadow">
                    <div class="app-header__logo">
                        <div class="logo-src"></div>
                        <div class="header__pane ml-auto">
                            <div>
                                <button type="button" class="hamburger close-sidebar-btn hamburger--elastic" data-class="closed-sidebar">
                                    <span class="hamburger-box">
                                        <span class="hamburger-inner"></span>
                                    </span>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="app-header__mobile-menu">
                        <div>
                            <button type="button" class="hamburger hamburger--elastic mobile-toggle-nav">
                                <span class="hamburger-box">
                                    <span class="hamburger-inner"></span>
                                </span>
                            </button>
                        </div>
                    </div>
                    <div class="app-header__menu">
                        <span>
                            <button type="button" class="btn-icon btn-icon-only btn btn-primary btn-sm mobile-toggle-header-nav">
                                <span class="btn-icon-wrapper">
                                    <i class="fa fa-ellipsis-v fa-w-6"></i>
                                </span>
                            </button>
                        </span>
                    </div>    
                    
                    <div class="scrollbar-sidebar">
                        <div class="app-sidebar__inner">
                            <ul class="vertical-nav-menu">
                            	 <li class="app-sidebar__heading">메인</li>
                            	  <li>
                                    <a href="./index.do">
                                        <i class="metismenu-icon pe-7s-diamond"></i>
                                        메인화면바로가기
                                    </a>
                                </li>
                            	<li class="app-sidebar__heading">관리자메뉴</li>
                            	<li>
                                    <a href="#">
                                        <i class="metismenu-icon pe-7s-car"></i>
                                        계정관리
                                        <i class="metismenu-state-icon pe-7s-angle-down caret-left"></i>
                                    </a>
                                    <ul>
                                        <li>
                                            <a href="member.do?grade=3">
                                                <i class="metismenu-icon"></i>
                                                관리자계정
                                            </a>
                                        </li>
                                        <li>
                                            <a href="member.do?grade=1">
                                                <i class="metismenu-icon"></i>
                                                고객계정
                                            </a>
                                        </li>
                                        <li>
                                            <a href="member.do?grade=2">
                                                <i class="metismenu-icon"></i>
                                                배달원계정
                                            </a>
                                        </li>                               
                                    </ul>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="metismenu-icon pe-7s-car"></i>
                                        게시판관리
                                        <i class="metismenu-state-icon pe-7s-angle-down caret-left"></i>
                                    </a>
                                    <ul>
                                        <li>
                                            <a href="notice.do">
                                                <i class="metismenu-icon"></i>
                                                공지사항
                                            </a>
                                        </li>
                                        <li>
                                            <a href="event.do">
                                                <i class="metismenu-icon"></i>
                                                이벤트
                                            </a>
                                        </li>
                                        <li>
                                            <a href="review.do">
                                                <i class="metismenu-icon"></i>
                                                후기게시판
                                            </a>
                                        </li>
                                        <li>
                                            <a href="coupon.do">
                                                <i class="metismenu-icon"></i>
                                                쿠폰 등록
                                            </a>
                                        </li>
                                                                     
                                    </ul>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="metismenu-icon pe-7s-car"></i>
                                        메뉴관리
                                        <i class="metismenu-state-icon pe-7s-angle-down caret-left"></i>
                                    </a>
                                    <ul>
                                        <li>
                                            <a href="menu.do">
                                                <i class="metismenu-icon"></i>
                                                상품/메뉴
                                            </a>
                                        </li>
                                                                     
                                    </ul>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="metismenu-icon pe-7s-car"></i>
                                        주문관리
                                        <i class="metismenu-state-icon pe-7s-angle-down caret-left"></i>
                                    </a>
                                    <ul>
                                        <li>
                                            <a href="orderlist.do">
                                                <i class="metismenu-icon"></i>
                                                주문목록
                                            </a>
                                        </li>
                                                                   
                                    </ul>
                                </li>
                                <li class="app-sidebar__heading">지점관리</li>
                                <li>
                                    <a href="#">
                                        <i class="metismenu-icon pe-7s-car"></i>
                                        지점관리
                                        <i class="metismenu-state-icon pe-7s-angle-down caret-left"></i>
                                    </a>
                                    <ul>
                                        <li>
                                            <a href="storelist.do">
                                                <i class="metismenu-icon"></i>
                                                매장목록
                                            </a>
                                        </li>
                                        <li>
                                            <a href="storechart.do">
                                                <i class="metismenu-icon"></i>
                                                지점별매출
                                            </a>
                                        </li>
                                        <li>
                                            <a href="franlist.do">
                                                <i class="metismenu-icon"></i>
                                                가맹문의목록
                                            </a>
                                        </li>
<!--                                         <li>
                                            <a href="list">
                                                <i class="metismenu-icon"></i>
                                                가맹문의상세
                                            </a>
                                        </li>
 -->                                                                   
                                    </ul>
                                </li>
                                <li class="app-sidebar__heading">문의관리</li>
                                <li>
                                    <a href="#">
                                        <i class="metismenu-icon pe-7s-diamond"></i>
                                        1:1문의관리
                                        <i class="metismenu-state-icon pe-7s-angle-down caret-left"></i>
                                    </a>
                                    <ul>
                                        <li>
                                            <a href="question.do">
                                                <i class="metismenu-icon"></i>
                                                문의목록
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                
                     
                                
                               
                               
                            </ul>
                        </div>
                    </div>
                </div>