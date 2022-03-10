<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

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
    <link rel="stylesheet" href="../style/company.css">
    <link rel="stylesheet" href="../style/layout.css">
    <!-- icon영역 -->
    <link
        href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
        rel="stylesheet">
    <!-- js 라이브러리 영역 -->
    <script src="../js/jquery-3.6.0.js"></script>
    
</head>

<body>
    <!-- wrap s -->
    <div id="wrap">

        <!-- header s -->
        <header id="header">
            <%@ include file="../../common/header.jsp" %>
        </header>
        <!-- header e -->

        <!-- content s -->
        <div id="container">
            <section id="content">
                <div class="sub-type company">
                    <div class="inner-box">
                        <div class="page-title-wrap">
                            <h2 class="page-title">회사소개</h2>
                            <div class="depth-area">
                                <ol>
                                    <li><a href="/FreeP/index.html">홈</a></li>
                                    <li><strong>회사소개</strong></li>
                                </ol>
                            </div>
                        </div>
                        <article class="company-area">
                            <!-- menu-list -->
                            <div class="menu-nav-wrap">
                                <div class="menu-nav">
                                    <ul>
                                        <li class="active"><a href="../company/intro.do">회사소개</a></li>
                                        <li><a href="../company/notice.do">공지사항</a></li>
                                        <li><a href="../company/searchStore.do">매장찾기</a></li>
                                    </ul>
                                </div>
                            </div>

                            
                            <div class="tab-type4">
                                <ul class="btn_tab">
                                    <li><a href="../company/intro.do">Overview</a></li>
                                    <li><a href="../company/introCeo.do">CEO</a></li>
                                    <li class="active"><a href="../company/introLocation.do">Location</a></li>
                                </ul>
                            </div>
                            <div class="tab_content_wrap">
                                <div class="tab_content active">
                                    <div class="location_area">
                                        <dl>
                                            <dt>FREEP LOCATION</dt>
                                            <dd>
                                                <div class="location_map">
                                                    <img src="../images/03visual/img_location.png"
                                                        alt="" width="530px">
                                                </div>
                                                <div class="location_info">
                                                    <dl>
                                                        <dt>주소</dt>
                                                        <dd>서울시 금천구 가산디지털2로 123 월드메르디앙2차 4층 413호</dd>
                                                    </dl>
                                                    <dl>
                                                        <dt>전화번호</dt>
                                                        <dd>
                                                            <ul>
                                                                <li>Tel: 02-1234-1234</li>
                                                                <li>Fax: 02-1234-1234</li>
                                                                <li>고객상담: 000-000-0000</li>
                                                            </ul>
                                                        </dd>
                                                    </dl>
                                                    <dl>
                                                        <dt>오시는 길</dt>
                                                        <dd>가산디지털단지역 6번 출구로 나와서 도보 약 520M(10분 소요)</dd>
                                                    </dl>
                                                </div>
                                            </dd>
                                        </dl>
                                    </div>
                                </div>
                            </div>
                        </article>
                    </div>
                </div>
            </section>
        </div>
        <!-- content e -->


        <footer id="footer">
            <%@ include file="../../common/footer.jsp" %>
        </footer>

    </div>


    <!-- script area -->
    <script src="../js/includeHTML.js"></script>
    <script>
        includeHTML();
    </script>

    <script src="../js/motion.js"></script>
    <script src="../js/ui.js"></script>
</body>

</html>