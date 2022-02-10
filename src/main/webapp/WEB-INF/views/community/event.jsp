<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                                        <li>
                                            <a href="../eventView.html" target="_self">
                                                <div class="img_wrap">
                                                    <img
                                                        src="../images/05community/20210401_7cAyiD07.jpg">
                                                </div>
                                                <div class="text_wrap">
                                                    <div class="event_info now">프리피 Zero Waste 캠페인</div>
                                                </div>
                                            </a>
                                        </li>

                                        <li>
                                            <a href="#" target="_self">
                                                <div class="img_wrap">
                                                    <img
                                                        src="../images/05community/20210401_7cAyiD07.jpg">
                                                </div>
                                                <div class="text_wrap">
                                                    <div class="event_info end">프리피 Zero Waste 캠페인</div>
                                                </div>
                                            </a>
                                        </li>

                                        <li>
                                            <a href="#" target="_self">
                                                <div class="img_wrap">
                                                    <img
                                                        src="../images/05community/20210401_7cAyiD07.jpg">
                                                </div>
                                                <div class="text_wrap">
                                                    <div class="event_info end">프리피 Zero Waste 캠페인</div>
                                                </div>
                                            </a>
                                        </li>

                                        <li>
                                            <a href="#" target="_self">
                                                <div class="img_wrap">
                                                    <img
                                                        src="../images/05community/20210401_7cAyiD07.jpg">
                                                </div>
                                                <div class="text_wrap">
                                                    <div class="event_info end">프리피 Zero Waste 캠페인</div>
                                                </div>
                                            </a>
                                        </li>

                                        <li>
                                            <a href="#" target="_self">
                                                <div class="img_wrap">
                                                    <img
                                                        src="../images/05community/20210401_7cAyiD07.jpg">
                                                </div>
                                                <div class="text_wrap">
                                                    <div class="event_info end">프리피 Zero Waste 캠페인</div>
                                                </div>
                                            </a>
                                        </li>

                                        <li>
                                            <a href="#" target="_self">
                                                <div class="img_wrap">
                                                    <img
                                                        src="../images/05community/20210401_7cAyiD07.jpg">
                                                </div>
                                                <div class="text_wrap">
                                                    <div class="event_info end">프리피 Zero Waste 캠페인</div>
                                                </div>
                                            </a>
                                        </li>

                                        <li>
                                            <a href="#" target="_self">
                                                <div class="img_wrap">
                                                    <img
                                                        src="../images/05community/20210401_7cAyiD07.jpg">
                                                </div>
                                                <div class="text_wrap">
                                                    <div class="event_info end">프리피 Zero Waste 캠페인</div>
                                                </div>
                                            </a>
                                        </li>

                                        <li>
                                            <a href="#" target="_self">
                                                <div class="img_wrap">
                                                    <img
                                                        src="../images/05community/20210401_7cAyiD07.jpg">
                                                </div>
                                                <div class="text_wrap">
                                                    <div class="event_info end">프리피 Zero Waste 캠페인</div>
                                                </div>
                                            </a>
                                        </li>


                                    </ul>
                                    
                                    <div class="pagingArea">
                                        <div class="common-pagingType-1">
                                            <a href="#" class="btn-prev" title="이전 페이지로 이동"><span class="hidden">이전 페이지로 이동</span></a>
                                            <a href="#none" title="현재 페이지" class="sel"><span>1</span></a>
                                            <a href="#"><span>2</span></a>
                                            <a href="#"><span>3</span></a>
                                            <a href="#"><span>4</span></a>
                                            <a href="#"><span>5</span></a>
                                            <a href="#"><span>6</span></a>
                                            <a href="#"><span>7</span></a>
                                            <a href="#"><span>8</span></a>
                                            <a href="#"><span>9</span></a>
                                            <a href="#"><span>10</span></a>
                                            <a href="#" class="btn-next" title="다음 페이지로 이동"><span class="hidden">다음 페이지로 이동</span></a>
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