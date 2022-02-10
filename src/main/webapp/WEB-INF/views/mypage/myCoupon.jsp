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
                                    <li><a href="../mypage/myOrder.do">주문내역</a></li>
                                    <li class="active"><a href="../mypage/myCoupon.do">쿠폰/적립금</a></li>
                                    <li><a href="../mypage/myReview.do">MY리뷰</a></li>
                                    <li><a href="./myFavorite.html">나만의피자</a></li>
                                    <li><a href="./myQuestion.html">1:1문의</a></li>
                                    <li><a href="./myUserinfo.html">정보수정</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="title-wrap-center">
                            <h3 class="title-type">
                                쿠폰/적립금
                            </h3>
                            <p>보유하신 쿠폰 및 적립금 내역을 확인해보세요</p>
                        </div>

                        <div class="CP-wrap">
                            <div class="tab-type6"><!--2020-01-03 클래스명수정-->
                                <ul class="tabTab">
                                    <li class="active"><button class="btnC1 myCP_list_btn">내 쿠폰</button></li>
                                    <li><button class="btnC1 myCP_list_btn">내 적립금</button></li>
                                </ul>
                            </div>

                            <div class="tab-list">
                                <div class="coupon-area active">
                                    <div class="myCoup_lsit table-type4">
                                        <table class="myCP_list">
                                            <caption>내 쿠폰 목록</caption>
                                            <colgroup>
                                                <col style="width:50%">
                                                <col style="width:50%">
                                            </colgroup>
                                            <thead>
                                            <tr>
                                                <th>쿠폰명</th>
                                                <th>유효기간</th>
                                            </tr>
                                            </thead>
                                            
                                            <!-- 쿠폰 내역 없음 -->
                                            <tbody class="board-list empty hide">
                                                <tr>
                                                    <td colspan="4">보유하신 쿠폰이 없습니다.</td>
                                                </tr>
                                            </tbody>

                                            <!-- 쿠폰 내역 있음 -->
                                            <tbody class="board-list fill">
                                                <tr>
                                                    <td>[웰컴백 쿠폰] 20%할인</td>
                                                    <td>2022.01.26 ~ 2022.02.25</td>
                                                </tr>
                                                <tr>
                                                    <td>응원합니다! 클래식 피자 L 배달 6천원 할인</td>
                                                    <td>2022.02.04 ~ 2022.02.20</td>
                                                </tr>
                                                <tr>
                                                    <td>힘내세요! 프리미엄 피자 L 배달 8천원 할인</td>
                                                    <td>2022.02.04 ~ 2022.02.20</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                
                                <div class="point-area">
                                    <div class="table-type4">
                                        <table class="myPoint_list">
                                            <caption>나의 적립금 내역</caption>

                                            <thead>
                                            <tr>
                                                <th>구분</th>
                                                <th>내용</th>
                                                <th>적립금액</th>
                                                <th>적립날짜</th>
                                            </tr>
                                            </thead>

                                            <!-- 적립금 내역 없음 -->
                                            <tbody class="board-list empty hide">
                                                <tr>
                                                    <td colspan="4">보유하신 적립금 내역이 없습니다.</td>
                                                </tr>
                                            </tbody>

                                            <!-- 적립금 내역 있음 -->
                                            <tbody class="board-list fill">
                                                <tr>
                                                    <td>적립</td>
                                                    <td>회원가입 선물 적립금</td>
                                                    <td>+2000원</td>
                                                    <td>2022.02.06</td>
                                                </tr>
                                                <tr>
                                                    <td>사용</td>
                                                    <td>피자 주문</td>
                                                    <td>-1500원</td>
                                                    <td>2022.02.08</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
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

                            <!-- 적립금 -->
                            <div class="btn-wrap">
                                <a href="/FreeP/order/orderDIY.html" class="btn-type v4">주문 바로가기</a>
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