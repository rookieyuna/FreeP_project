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
                                    <li><a href="#">나만의피자</a></li>
                                    <li><a href="#">1:1문의</a></li>
                                    <li><a href="#">정보수정</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="title-wrap-center">
                            <h3 class="title-type">
                                MY프리피
                            </h3>
                            <p>다양한 혜택을 확인해보세요</p>
                        </div>

                        <div class="mapage-wrap">
                            <div class="section-box">
                                <div class="body-section mypage-section">
                                    <div class="contents-section">
                                        <div class="section-wrap section-top">
                                            <div class="section-box">
                                                <div class="section-group oil-information">
                                                    <div class="my-oil-details section-left">
                                                        <br>
                                                        <p class="user">
                                                            <strong class="user-name">홍길동</strong>님 반갑습니다.
                                                        </p>
                                                        <div class="my-info">
                                                            <div class="title-wrap title-type2">
                                                                <h2 class="tit">주문 내역</h2>
                                                            </div>
                                                            <div class="info-box">
                                                                <p class="my-date font-secondary">
                                                                    2022.02
                                                                </p>
                                                                <p class="my-lastMonth-sum">
                                                                    고객님의 스탬프는 <strong class="my-state down"><em
                                                                            class="font-secondary">X</em>장</strong>입니다.<br>
                                                                    <strong class="my-state down"><em
                                                                            class="font-secondary">X</em>장</strong>더 모으면
                                                                    사용이 가능합니다.

                                                                </p>
                                                                <div class="my-account">쿠폰피자이미지</div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="section-right">

                                                        <div class="my-coupon">
                                                            <div class="title-wrap title-type2">
                                                                <h2 class="tit">FreeP 쿠폰</h2>
                                                            </div>
                                                            <div class="info-box">
                                                                <ul class="list">
                                                                    <li>
                                                                        <dl class="item">
                                                                            <dt>사용 가능 쿠폰</dt>
                                                                            <dd><strong
                                                                                    class="font-secondary">X</strong><span>개</span>
                                                                            </dd>
                                                                        </dl>
                                                                    </li>
                                                                    <li>
                                                                        <dl class="item">
                                                                            <dt>소멸 예정 쿠폰</dt>
                                                                            <dd><strong
                                                                                    class="font-secondary font-color-primary">X</strong><span>개</span>
                                                                            </dd>
                                                                        </dl>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                            


                                                        <div class="my-point">
                                                            <div class="title-wrap title-type2">
                                                                <h2 class="tit">FreeP 적립금</h2>
                                                            </div>
                                                            <div class="info-box">
                                                                <ul class="list">
                                                                    <li>
                                                                        <dl class="item">
                                                                            <dt>사용 가능 쿠폰</dt>
                                                                            <dd><strong
                                                                                    class="font-secondary">X</strong><span>개</span>
                                                                            </dd>
                                                                        </dl>
                                                                    </li>
                                                                    <li>
                                                                        <dl class="item">
                                                                            <dt>소멸 예정 쿠폰</dt>
                                                                            <dd><strong
                                                                                    class="font-secondary font-color-primary">X</strong><span>개</span>
                                                                            </dd>
                                                                        </dl>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>


                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
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


    <script src="../js/includeHTML.js"></script>
    <script>
        includeHTML();
    </script>

    <script src="../js/motion.js"></script>
    <script src="../js/ui.js"></script>

</body>

</html>