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
                    <div class="page-title-wrap">
                        <h2 class="page-title">커뮤니티</h2>
                        <div class="depth-area">
                            <ol>
                                <li><a href="/FreeP/index.html">홈</a></li>
                                <li><strong>마이페이지</strong></li>
                            </ol>
                        </div>
                    </div>
                    <article class="menu-list-area">
                        <div class="menu-nav-wrap">
                            <div class="menu-nav">
                                <ul>
                                    <li><a href="./myMain.html">MY프리피</a></li>
                                    <li><a href="./myOrder.html">주문내역</a></li>
                                    <li><a href="./myCoupon.html">쿠폰/적립금</a></li>
                                    <li><a href="../mypage/myReview1.do">MY리뷰</a></li>
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


                        <div class="sp_play">
                            <div class="sp_play_wrap freep_community">

                                <div class="counsil-wrap">
                                    <div class="table-type4">
                                        <table>
                                            <caption>피자 영양성분</caption>
                                            <colgroup>
                                                <col style="width:140px">
                                                <col>
                                                <col style="width:180px">
                                                <col style="width:180px">
                                            </colgroup>
                                            <thead>
                                                <tr>
                                                    <th>번호</th>
                                                    <th>제목</th>
                                                    <th>등록일</th>
                                                    <th>처리상태</th>
                                                </tr>
                                            </thead>
                                            <!-- 문의 내역 없음 -->
                                            <tbody class="board-list empty hide">
                                                <tr>
                                                    <td colspan="4">문의하신 내용이 없습니다.</td>
                                                </tr>
                                            </tbody> 
                                            

                                            <!-- 문의 내역 있음 -->
                                            <tbody class="board-list fill">
                                                <tr onClick="location.href='./myQuestionView.html';">
                                                    <td>2</td>
                                                    <td>이거 맛있나요?</td>
                                                    <td>2022.02.08</td>
                                                    <td>미답변</td>
                                                </tr>
                                                <tr onClick="location.href='./myQuestionView.html';">
                                                    <td>1</td>
                                                    <td>햄최몇?</td>
                                                    <td>2022.01.08</td>
                                                    <td>답변완료</td>
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


    <!-- script area -->
    <script src="../js/includeHTML.js"></script>
    <script>includeHTML();</script>
    
    <script src="../js/motion.js"></script>
    <script src="../js/ui.js"></script>
</body>

</html>