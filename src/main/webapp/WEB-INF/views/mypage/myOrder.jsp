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
                                    <li><a href="../mypage/myMain.do">MY프리피</a></li>
                                    <li class="active"><a href=".../mypage/myOrder.do">주문내역</a></li>
                                    <li><a href="../mypage/myCoupon.do">쿠폰/적립금</a></li>
                                    <li><a href="../mypage/myReview.do">MY리뷰</a></li>
                                    <li><a href="./myFavorite.html">나만의피자</a></li>
                                    <li><a href="./myQuestion.html">1:1문의</a></li>
                                    <li><a href="./myUserinfo.html">정보수정</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="title-wrap-center">
                            <h3 class="title-type">
                                주문내역
                            </h3>
                            <p>주문하신 내역을 확인해보세요</p>
                        </div>

                        <div class="myOrder_list">
                            <div class="table-type4">
                                <table>
                                    <colgroup>
                                        <col style="width:100px">
                                        <col>
                                        <col style="width:140px">
                                        <col style="width:140px">
                                        <col style="width:140px">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>번호</th>
                                            <th>주문내용</th>
                                            <th>주문날짜</th>
                                            <th>주문상태</th>
                                            <th>리뷰</th>
                                        </tr>
                                    </thead>

                                    <!-- 문의 내역 없음 -->
                                    <tbody class="board-list empty hide">
                                            <tr>
                                            <td colspan="4">주문하신 내용이 없습니다.</td>
                                        </tr>
                                    </tbody>

                                    <!-- 주문 내역 있음 -->
                                    <tbody class="board-list fill">
                                        <tr>
                                            <td>2</td>
                                            <td>[DIY] 나만의 피자 + 콜라 + 소스</td>
                                            <td>2022.02.08</td>
                                            <td>주문완료</td>
                                            <td class="review_true"></td>
                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>프리피 스페셜 산타 엉덩이 피자 + 두개먹으면 살쪄 피자 + 콜라 + 소스</td>
                                            <td>2022.01.08</td>
                                            <td>주문완료</td>
                                            <td class="review_false"><button onClick="location.href='./myReviewWrite.html'"></button></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
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
                            <div class="btn-wrap">
                                <a href="/FreeP/order/orderDIY.html" class="btn-type v4">다른 제품 보러가기</a>
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