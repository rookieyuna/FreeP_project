<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <link rel="stylesheet" href="../style/company.css">
    <link rel="stylesheet" href="../style/layout.css">
    <!-- icon영역 -->
    <link
        href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
        rel="stylesheet">
    <!-- js 라이브러리 영역 -->
    <script src="../js/jquery-3.6.0.js"></script>
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
                <div class="sub-type notice">
                    <div class="inner-box">
                        <div class="page-title-wrap">
                            <h2 class="page-title">공지사항</h2>
                            <div class="depth-area">
                                <ol>
                                    <li><a href="/FreeP/index.html">홈</a></li>
                                    <li><strong>공지사항</strong></li>
                                </ol>
=                            </div>
                        </div>

                        <article class="view-area">
                            <!-- menu-list -->
                            <div class="menu-nav-wrap">
                                <div class="menu-nav">
                                    <ul>
                                        <li><a href="../company/intro.do">회사소개</a></li>
                                        <li class="active"><a href="../company/notice.do">공지사항</a></li>
                                        <li><a href="../company/searchStore.do">매장찾기</a></li>
                                    </ul>
                                </div>
                            </div>

                            <div class="board-view">
                                <form:form id="newsForm" name="newsForm" method="post">
                                    <dl class="board-content">
                                        
                                        <dt><strong>${dto.title}</strong>
                                            <ul>
                                                <li>${dto.postdate }</li>
                                                <li>조회
                                                    <span>${dto.hits }</span>
                                                </li>
                                            </ul>
                                        </dt>
                                        <dd>
                                            <p>
                                            	
                                              ${dto.contents }
                                            </p>

                                        </dd>
                                    </dl>
                                    <ul class="board-button">
                                        <li>
                                            <span>이전</span>
                                            <a href="./noticeView.do?idx=${pre.b_idx }">${pre.title }
                                            </a>
                                        </li>
                                        <li>
                                            <span>다음</span>
                                            <a href="./noticeView.do?idx=${next.b_idx }">${next.title }
                                            </a>
                                        </li>
                                    </ul>
                                </form:form>
                            </div>
                            <div class="btn-wrap">
                                <a href="http://localhost:8081/freepproject/company/notice.do" class="btn-type v2">목록</a>
                            </div>
                        </article>
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
    <script>includeHTML();</script>
    
    <script src="../js/motion.js"></script>
    <script src="../js/ui.js"></script>
</body>
</html>