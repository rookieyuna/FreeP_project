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
                                    <li class="active"><a href="../company/intro.do">Overview</a></li>
                                    <li><a href="../company/introCeo.do">CEO</a></li>
                                    <li><a href="../company/introLocation.do">Location</a></li>
                                </ul>
                            </div>
                            <div class="tab_content_wrap">
                                <div class="tab_content active">
                                    <div class="overview_area">
                                        <div class="overview_top">
                                            <div class="visual_overview">
                                                <img src="../images/03visual/company01.png" alt="">
                                            </div>
                                            <div class="overview_ex">
                                                <div class="ex_lft">
                                                    <p>
                                                        세계 배달 피자 리더 프리피는 배달 피자 개념이 전무했던 1990년 1호점 오금점을 시작으로 한국 시장에 진출한 이후 지난 32년간 피자 대중화를 선도하였습니다.
                                                    </p>
                                                    <p>
                                                        완벽한 조리법과 배달 서비스로 남녀노소 모두가 일상 속에서 즐길 수 있는 완벽한 한 끼로 Life food를 만들겠다는 의지를 담은 브랜드 슬로건 “Life Food, FreeP.”(라이프 푸드, 프리피)와 “고객들에게 가장 맛있고 영양가 높은 피자를 제공”한다는 원칙 아래, 최고급 식자재와 새로운 맛을 선보이며 프리미엄 피자 시장을 개척하였습니다. 
                                                    </p>
                                                    <p>
                                                    업계 최초 국내산 오이로 만든 우리 피클 도입 및 6가지 슈퍼시드가 함유된 슈퍼시드 도우를 출시해 더욱 건강한 피자를 만들기 위해 최선을 다했습니다. 또한 ‘피자 라이스볼’ 등 기존 피자업계에서는 볼 수 없던 제품을 출시하여 고객들에게 항상 새로운 모습으로 다가가기 위해 노력하고 있습니다.
                                                    </p>
                                                </div>
                                                <div class="ex_rgt">
                                                    <p>
                                                        프리피는 “고객들이 편하고 쉽게 주문할 수 있도록 최상의 서비스를 제공한다”는 목표 아래 주문, 배달을 혁신하였습니다. 또한 배달업계 최초로 “GPS 트래커”와 현재 야외를 포함한 전국 1,300개 지역에서 피자 시식이 가능한 “프리피 스팟” 서비스를 실시하였습니다. 그리고 2019년 피자 업계 최초로 차량을 이용해 매장 방문 포장 시 직원이 고객의 차량까지 직접 피자를 전달하는 “프리피 드라이빙 픽업 서비스”, 2021년에는 국내 최초로 드론 배달 서비스를 상용화하는 등 혁신적인 IT 서비스로 푸드테크를 선도하고 있습니다.
                                                    </p>
                                                    <p>
                                                    	프리피는 앞으로도 세계 배달피자 리더로써 건강한 외식문화를 리드하기 위해 최상의 식재료, 제품, 주문 및 배달 서비스를 제공하며, 언제나 고객들이 믿고 먹을 수 있는 웰빙 먹거리 문화를 만들 수 있도록 최선을 다할 것입니다.
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="vision_info">
                                            <div class="vision_tit">
                                                <span>V I S I O N</span>
                                                <strong>Life Food, FreeP</strong>
                                            </div>
                                            <div class="vision_ex">
                                                
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </article>
                    </div>
                </div>
            </section>
        </div>
        <!-- content e -->

        <!-- footer s -->
        <footer id="footer">
            <%@ include file="../../common/footer.jsp" %>
        </footer>
        <!-- footer e -->

    </div>




    <!-- script area -->
    <script src="../js/includeHTML.js"></script>
    <script>includeHTML();</script>
    
    <script src="../js/motion.js"></script>
    <script src="../js/ui.js"></script>
</body>

</html>