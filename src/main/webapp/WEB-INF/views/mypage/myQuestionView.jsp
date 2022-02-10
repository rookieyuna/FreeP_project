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
                                    <li><a href="./myMain.html">MY프리피</a></li>
                                    <li><a href="./myOrder.html">주문내역</a></li>
                                    <li><a href="./myCoupon.html">쿠폰/적립금</a></li>
                                    <li><a href="./myReview.html">MY리뷰</a></li>
                                    <li><a href="./myFavorite.html">나만의피자</a></li>
                                    <li class="active"><a href="./myQuestion.html">1:1문의</a></li>
                                    <li><a href="./myUserinfo.html">정보수정</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="title-wrap-center">
                            <h3 class="title-type">
                                1:1문의
                            </h3>
                            <p>1:1 문의 내용을 확인하세요</p>
                        </div>

                        <article class="view-area">
                            <div class="menu-nav-wrap">
                            </div>
                            <div class="board-view">
                            
                                <dl class="board-content">                            
                                    <input type="hidden" id="type" name="type" value="N" />
                                    <input type="hidden" id="pageNo" name="pageNo" value="1" />
                                    <input type="hidden" id="search" name="search" value="subject" />
                                    <input type="hidden" id="condition" name="condition" value="" />
                                    <dt>
                                        <strong>[제품문의] 이거 맛있나요?</strong>
                                        <ul>
                                            <li>2022-02-08</li>
                                            <li>답변완료</li>
                                            <!-- <li>좋아요 <span>20</span></li> -->
                                        </ul>
                                    </dt>
                                    <dd>
                                        <P>
                                        불고기피자 맛있는지 궁금합니다<br>
                                        피자 구성이 어떻게 되죠?<br>
                                        알려주세요~
                                        </P> 
                                    </dd>
                                </dl>
                                <!-- <div class="menu-nav-wrap">
                                </div> -->
                                <dl class="board-content answer-title"> 
                                    <dt>
                                        <strong>From. FreeP</strong>
                                        <ul>
                                            <li>2022-02-08</li>
                                        </ul>
                                    </dt>
                                    <dd>
                                        <P>
                                        불고기피자는 아주 인기가 많은 스테디셀러입니다.<br>
                                        불고기와 양파 올리브 불고기소스가 들어갑니다.<br>
                                        감사합니다~
                                        </P> 
                                    </dd>
                                </dl>

                            </div>
                            <div class="btn-wrap">
                                <a href="./myQuestion.html" class="btn-type v2">1:1문의목록</a>
                            </div>
                        </article>
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