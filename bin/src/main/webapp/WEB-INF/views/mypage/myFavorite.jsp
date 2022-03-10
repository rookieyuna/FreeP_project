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
                                    <li><a href="#">정보수정</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="title-wrap-center">
                            <h3 class="title-type">
                                나만의 피자
                            </h3>
                            <p>나만의 특별한 DIY피자의 좋아요와 리뷰를 확인해보세요</p>
                        </div>

                        <div class="tab-type6"><!--2020-01-03 클래스명수정-->
                            <ul class="tabTab">
                                <li class="active"><button class="btnC1 myfavor_review_btn">내 DIY피자</button></li>
                                <li><button class="btnC1 myfavor_review_btn">좋아요 리뷰</button></li>
                            </ul>
                        </div>
                        
                        <div class="tab-list">
                            <div class="order-list active">
                                <div class="myDIY_list no-data">
                                    나만의 DIY피자가 없습니다.
                                </div>
                                <!-- <div class="myDIY_list">
                                    나만의 피자 리스트
                                </div> -->
                            </div>

                            <div class="order-list">
                                <div class="myReview_list no-data">
                                    좋아요 한 리뷰가 없습니다.
                                </div>
                                <!-- <div class="myReview_list">
                                    내가 좋아요 한 목록
                                </div> -->
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
    <script>includeHTML();</script>

    <script src="../js/motion.js"></script>
    <script src="../js/ui.js"></script>
    
</body>

</html>