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
    <link rel="stylesheet" href="./font/font.css">
    <!-- style 영역 -->
    <link rel="stylesheet" href="./style/common.css">
    <link rel="stylesheet" href="./style/sub.css">
    <link rel="stylesheet" href="./style/community.css">
    <link rel="stylesheet" href="./style/layout.css">
    <!-- icon영역 -->
    <link
        href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
        rel="stylesheet">
    <!-- js 라이브러리 영역 -->
    <script src="./js/jquery-3.6.0.js"></script>
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
                                <li><a href="./review.html">커뮤니티</a></li>
                                <li><strong>고객후기</strong></li>
                            </ol>
                        </div>
                    </div>
                    <!-- //1depth 메뉴명 & 네비게이션 -->

                    <article class="menu-list-area">
                        <!-- menu-list -->
                        <div class="menu-nav-wrap">
                            <div class="menu-nav">
                                <ul>
                                    <li class="active"><a href="../community/review.do">고객후기</a></li>
                                    <li><a href="../community/event.do">이벤트</a></li>
                                    <li><a href="../community/question.do">1:1문의</a></li>
                                </ul>
                            </div>
                        </div>

                        <!-- 게시판 영역 -->

                        <div class="sp_play">
                            <div class="sp_play_wrap freep_community">
                                <div class="review_view">
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
                                                    <td class="review_false"><button></button></td>
                                                </tr>
                                            </tbody>
                                        </table>
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
    <script src="./js/includeHTML.js"></script>
    <script>includeHTML();</script>
    
    <script src="./js/motion.js"></script>
    <script src="./js/ui.js"></script>
</body>

</html>