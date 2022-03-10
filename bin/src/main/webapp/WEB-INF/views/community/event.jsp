<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <link rel="stylesheet" href="../style/community.css">
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
            <div class="sub-type menu">
                <div class="inner-box">
                    <!-- 1depth 메뉴명 & 네비게이션 -->
                    <div class="page-title-wrap">
                        <h2 class="page-title">커뮤니티</h2>
                        <div class="depth-area">
                            <ol>
                                <li><a href="/main">홈</a></li>
                                <li><strong>커뮤니티</strong></li>
                            </ol>
                        </div>
                    </div>
                    <!-- //1depth 메뉴명 & 네비게이션 -->

                    <article class="menu-list-area">
                        <!-- menu-list -->
                        <div class="menu-nav-wrap">
                            <div class="menu-nav">
                                <ul>
                                    <li><a href="../community/review.do">고객후기</a></li>
                                    <li class="active"><a href="../community/event.do">이벤트</a></li>
                                    <li><a href="../community/question.do">1:1문의</a></li>
                                </ul>
                            </div>
                        </div>

                        <!-- NEW 피자 영역 -->
                        <div class="title-wrap-center">
                            <h3 class="title-type">
                                이벤트
                            </h3>
                            <p>다양한 이벤트를 한눈에 확인해보세요</p>
                        </div>

                        <div class="sp_play">
                            <div class="sp_play_wrap freep_community">

                                <div class="con_inner_mid event_list">
                                    <ul id="eventListArea">
                                    
                                    
                                    <c:choose>
										<c:when test="${empty lists }">
											<li style="width: 100%;">
	                                           <div class="event_list_empty" style="
	                                               min-height: 390px;
	                                               border-top: 1px solid #d9d9d9;
	                                               border-bottom: 1px solid #d9d9d9;
	                                               display: flex;
	                                               justify-content: center;
	                                               align-items: center;">
	                                               <p style="text-align: center;">등록된 이벤트가 없습니다.</p>
	                                           </div>
	                                       </li>	
										</c:when>
											
										<c:otherwise>
											<c:forEach items="${lists }" var="row" ><!-- 리스트반복시작 -->
													 <li>
	                                            <a href="../community/eventView.do?idx=${row.b_idx} " target="_self">
	                                                <div class="img_wrap">
	                                                    <img
	                                                        src="../uploads/${row.sfile}">
	                                                </div>
	                                                <div class="text_wrap">
	                                                    <div class="event_info now">${row.title}</div>
	                                                </div>
	                                            </a>
	                                        </li>
											</c:forEach>
										</c:otherwise>
									</c:choose>
                                    

                                    </ul>
                                    
                                    <div class="pagingArea">
                                        <div class="common-pagingType-1">
                                           ${ pagingStr }
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                </div>
            </div>
        </div>
    </div>

    <footer id="footer">
        <%@ include file="../common/footer.jsp" %>
    </footer>


    <!-- script area -->
    <script src="../js/includeHTML.js"></script>
    <script>includeHTML();</script>
    
    <script src="../js/motion.js"></script>
    <script src="../js/ui.js"></script>
</body>

</html>