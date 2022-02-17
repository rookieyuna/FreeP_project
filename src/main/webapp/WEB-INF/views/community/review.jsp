<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
                                    <li class="active"><a href="../community/review.do">고객후기</a></li>
                                    <li><a href="../community/event.do">이벤트</a></li>
                                    <li><a href="../community/question.do">1:1문의</a></li>
                                </ul>
                            </div>
                        </div>

                        <!-- 게시판 영역 -->
                        <div class="title-wrap-center">
                            <h3 class="title-type">
                                고객후기
                            </h3>
                            <p>프리피 고객님들께서 남겨주신 소중한 후기를 확인해보세요!</p>
                        </div>

                        <div class="sp_play">
                            <div class="sp_play_wrap freep_community">

                                <div class="con_inner_mid review_list">
                                    <div class="review best">
                                        <h2>베스트 리뷰</h2>
                                        
                                        <!-- 리뷰클릭시 나오는 상세모달창 -->
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
                                                    
                                                </div>
                                            </div>
                                        </div> <!-- end of 상세모달창 -->

                                        <ul>
                                            <li>
                                                <div class="img_wrap">
                                                    <a href="#best"><img src="../images/05community/1b6078b5bd51521860a43103b0a6cae5.jpg"></a>
                                                </div>
                                                <div class="text_wrap">
                                                    <div class="review_text">
                                                        <div class="review_icon diy"></div>
                                                        <div class="review_name">Wozniak</div>
                                                        <div class="review_like">
                                                            <div class="favorite-heart">
                                                                <i class="material-icons unlike">favorite</i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="review_cont">
                                                        <p>
                                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id augue arcu vulputate phasellus pharetra. Nunc eget ut neque risus adipiscing nibh ac. In eget diam convallis leo.
                                                        </p>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="img_wrap">
                                                    <a href="#best"><img src="../images/05community/5460a0721c26e6d3c7a1848ac1a24abd.jpg"></a>
                                                </div>
                                                <div class="text_wrap">
                                                    <div class="review_text">
                                                        <div class="review_icon best diy"></div>
                                                        <div class="review_name">Wozniak</div>
                                                        <div class="review_like">
                                                            <div class="favorite-heart">
                                                                <i class="material-icons unlike">favorite</i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="review_cont">
                                                        <p>
                                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id augue arcu vulputate phasellus pharetra. Nunc eget ut neque risus adipiscing nibh ac. In eget diam convallis leo.
                                                        </p>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="img_wrap">
                                                    <a href="#best"><img src="../images/05community/5748f66613de9ac009fd9337e99b6e6b.jpg"></a>
                                                </div>
                                                <div class="text_wrap">
                                                    <div class="review_text">
                                                        <div class="review_icon best diy"></div>
                                                        <div class="review_name">Wozniak</div>
                                                        <div class="review_like">
                                                            <div class="favorite-heart">
                                                                <i class="material-icons unlike">favorite</i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="review_cont">
                                                        <p>
                                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id augue arcu vulputate phasellus pharetra. Nunc eget ut neque risus adipiscing nibh ac. In eget diam convallis leo.
                                                        </p>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="img_wrap">
                                                    <a href="#best"><img src="../images/05community/ecfec5c38e6d033c7f01b77eecc1bf8a.jpg"></a>
                                                </div>
                                                <div class="text_wrap">
                                                    <div class="review_text">
                                                        <div class="review_icon best diy"></div>
                                                        <div class="review_name">Wozniak</div>
                                                        <div class="review_like">
                                                            <div class="favorite-heart">
                                                                <i class="material-icons unlike">favorite</i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="review_cont">
                                                        <p>
                                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id augue arcu vulputate phasellus pharetra. Nunc eget ut neque risus adipiscing nibh ac. In eget diam convallis leo.
                                                        </p>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>

                                    <div class="review normal">
                                        <h2>일반 리뷰</h2>
                                        <ul>
                                        	<c:forEach items="${lists }" var="row"> 
                                            <li>
                                            	<c:set var="file" value="${row.rv_sfile1 }" />
                                                <div class="img_wrap">
	                                                <c:if test="${file != null }">
	                                                    <a href="#normal"><img src="../uploads/${row.rv_sfile1 }"></a>
	                                                </c:if>
                                                </div>
                                                <div class="text_wrap">
                                                    <div class="review_text">
                                                        <div class="review_icon normal"></div>
                                                        <div class="review_name">${row.title}</div>
                                                        <div class="review_like">
                                                            <div class="favorite-heart">
                                                                <i class="material-icons unlike">favorite</i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="review_cont">
                                                        <p>
                                                            ${row.contents}
                                                        </p>
                                                    </div>
                                                </div>
                                            </li>
                                            </c:forEach>
                                            <li>
                                                <div class="img_wrap">
                                                    <a href="#normal"><img src="../images/04product/01pizza/maru/0120200821213326.jpg"></a>
                                                </div>
                                                <div class="text_wrap">
                                                    <div class="review_text">
                                                        <div class="review_icon normal"></div>
                                                        <div class="review_name">Wozniak</div>
                                                        <div class="review_like">
                                                            <div class="favorite-heart">
                                                                <i class="material-icons unlike">favorite</i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="review_cont">
                                                        <p>
                                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id augue arcu vulputate phasellus pharetra. Nunc eget ut neque risus adipiscing nibh ac. In eget diam convallis leo.
                                                        </p>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="pagingArea">
                                        <div class="common-pagingType-1">
                                             ${pagingImg } 
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