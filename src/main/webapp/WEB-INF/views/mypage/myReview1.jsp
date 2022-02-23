<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
                                    <li><a href="../mypage/myCoupon.do">쿠폰/적립금</a></li>
                                    <li class="active"><a href="../mypage/myReview1.do">MY리뷰</a></li>
                                    <li><a href="../mypage/myQuestion.do">1:1문의</a></li>
                                    <li><a href="./myUserinfo.html">정보수정</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="title-wrap-center">
                            <h3 class="title-type">
                                MY리뷰
                            </h3>
                            <p>작성하신 리뷰와 좋아요한 다른사람의 리뷰를 확인해보세요</p>
                        </div>

                        <div class="CP-wrap">
                            <div class="tab-type6"><!--2020-01-03 클래스명수정-->
                                <ul class="tabTab">
                                    <li class="active"><button class="btnC1">내가쓴리뷰</button></li>
                                    <li><button class="btnC1" onclick="location.href='myReview2.do?';">좋아요리뷰</button></li>
                                </ul>
                            </div>

                            <div class="myReview-wrap">
                            <div class="table-type4">
                                <table>
                                    <colgroup>
                                        <col style="width:10%">
                                        <col style="width:230px">
                                        <col style="width:100%">
                                        <col style="width:15%">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>번호</th>
                                            <th>사진</th>
                                            <th>리뷰내용</th>
                                            <th>등록날짜</th>
                                        </tr>
                                    </thead>
                                    <!-- 문의 내역 없음 -->
                                    <tbody class="board-list empty hide">
                                        <tr>
                                            <td colspan="4">남긴 리뷰가 없습니다.</td>
                                        </tr>
                                    </tbody>
                                    
                                    <!-- 문의 내역 있음 -->
                                    <tbody class="board-list fill">
                                        <tr>
                                            <td>2</td>
                                            <td><span><img src="../images/05community/1b6078b5bd51521860a43103b0a6cae5.jpg"></span></td>
                                            <td>킹왕짱! 진짜 잘먹었어요</td>
                                            <td>2022.02.08</td>
                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td><span><img src="../images/05community/ecfec5c38e6d033c7f01b77eecc1bf8a.jpg"></span></td>                                            <td>이거 핵존맛임 ㅋㅋㅋㅋㅋㅋ</td>
                                            <td>2022.01.08</td>
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

                        <div class="review-detail-modal pop-layer pop-menu" id="pop-menu-detail">
                            <div class="dim"></div>
                            <div class="pop-wrap">
                                
                                <div class="pop-modal2">
                                    <a href="javascript:UI.layerPopUp({selId:'#pop-allergy', st:'close'});" class="btn-close"></a>
                                    <div class="modal2-con">
                                        <div class="con1-top-wrap">
                                            <!-- 이미지 -->
                                            <div class="img-wrap">
                                                <img src="../images/05community/1b6078b5bd51521860a43103b0a6cae5.jpg" alt="">
                                                <ul class="review-modal-slickBtn">
                                                    <li><button type="button" data-role="none" class="slick-prev slick-arrow" aria-label="Previous" role="button">Previous</button></li>
                                                    <li><button type="button" data-role="none" class="slick-next slick-arrow" aria-label="Next" role="button">Next</button></li>
                                                </ul>
                                                <ul class="review-modal-cicleBtn">
                                                    <li class="active"><button></button></li>
                                                    <li><button></button></li>
                                                    <li><button></button></li>
                                                </ul>
                                            </div>
                                        </div>

                                        <div class="con1-con-wrap">
                                            <div class="con-top">
                                                <!-- 아이디 -->
                                                <div class="review_user">
                                                    <p class="review_name"><span>Wozniak</span> 님의 리뷰입니다</p>
                                                    <p class="review_pdate">2022-02-02</p>
                                                </div>

                                                <!-- 제목 -->
                                                <p class="review_title">입에서 새우랑 치즈가 춤춰요!</p>
                                                <div class="favorite-heart">
                                                    <div class="favorite-heart">
                                                        <i class="material-icons unlike">favorite</i>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- 내용 -->
                                            <div class="con-mid">
                                                <p class="review_text">
                                                    치즈크러스트에 갈릭디핑 찍어 먹으면 진짜 엄청 맛있어요ㅜㅜㅜㅜ♡
                                                </p>

                                                <div class="review_order">
                                                    <ul class="order_list">
                                                        <!-- 리뷰 > 주문 목록 -->
                                                        <li>
                                                            <div class="order_list_wrap">

                                                                <div class="aco_top">
                                                                    <h6 class="detail_title">세상에 이런 피자</h6>
                                                                    <button class="review_to_order">
                                                                        바로주문
                                                                    </button>
                                                                    <button class="detail-more-btn"></button>
                                                                </div>

                                                                <div class="aco_bottom">
                                                                    <ul class="detail_list">
                                                                        <li>나폴리도우</li>
                                                                        <li>갈릭소스</li>
                                                                        <li>양파</li>
                                                                        <li>새우</li>
                                                                        <li>파인애플</li>
                                                                        <li>페퍼로니</li>
                                                                        <li>콘</li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        
                                                        <li>
                                                            <div class="order_list_wrap">

                                                                <div class="aco_top">
                                                                    <h6 class="detail_title">오리지날 프리피 기본 피자</h6>
                                                                    <button class="review_to_order">
                                                                        바로주문
                                                                    </button>
                                                                    <button class="detail-more-btn"></button>
                                                                </div>

                                                                <div class="aco_bottom">
                                                                    <ul class="detail_list">
                                                                        <li>오리지날</li>
                                                                        <li>케챱소스</li>
                                                                        <li>페어로니</li>
                                                                        <li>양파</li>
                                                                        <li>브로콜리</li>
                                                                        <li>피망</li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </li>

                                                        <li>
                                                            <div class="order_list_wrap">

                                                                <div class="aco_top">
                                                                    <h6 class="detail_title">사이드 메뉴</h6>
                                                                    <button class="review_to_order">
                                                                        바로주문
                                                                    </button>
                                                                    <button class="detail-more-btn"></button>
                                                                </div>

                                                                <div class="aco_bottom">
                                                                    <ul class="detail_list">
                                                                        <li>SIDE NAME</li>
                                                                        <li>SIDE NAME</li>
                                                                        <li>SIDE NAME</li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                            
                                            <div class="con-bot">
                                                <!-- 댓글 -->
                                            </div>
                                            <div class="review-title">
                                                
                                            </div>
                                            <div class="review-id">

                                            </div>
                                            <div class="review-pdate">

                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal2-layer-btn">
                                        <ul>
                                            <li><a href="./myReviewWrite.html">수정하기</a></li>
                                            <li><button onclick="">삭제하기</button></li>
                                        </ul>
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


    <script src="../js/includeHTML.js"></script>
    <script>includeHTML();</script>

    <script src="../js/motion.js"></script>
    <script src="../js/ui.js"></script>
    
</body>

</html>