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

        <!-- container -->
        <div id="container">
            <!-- content -->
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
                                        <li class="active"><a href="/FreeP/company/about/intro.html">회사소개</a></li>
                                        <li><a href="/FreeP/company/notice.html">공지사항</a></li>
                                        <li><a href="/FreeP/company/searchStore.html">매장찾기</a></li>
                                    </ul>
                                </div>
                            </div>

                            
                            <div class="tab-type4">
                                <ul class="btn_tab">
                                    <li><a href="./intro.html">Overview</a></li>
                                    <li class="active"><a href="./introCeo.html">CEO</a></li>
                                    <li><a href="./introLocation.html">Location</a></li>
                                </ul>
                            </div>
                            <div class="tab_content_wrap">
                                <div class="tab_content active">
                                    <div class="ceo_area">
                                        <div class="ceo_lft">
                                            <strong>고객 여러분 안녕하십니까?<br>한국도미노피자 회장 오광현입니다.</strong>
                                            <p>
                                                세계 배달 피자 리더 한국도미노피자는 배달 피자 개념이 전무했던 1990년 1호점 오금점을
                                                시작으로 한국 시장에 진출한 이후 지난 32년간 피자 대중화를 선도하였습니다.
                                            </p>
                                            <p>
                                                완벽한 조리법과 배달 서비스로 남녀노소 모두가 일상 속에서 즐길 수 있는 완벽한 한 끼로
                                                Life food를 만들겠다는 의지를 담은 브랜드 슬로건 “Life Food, Domino’s.”(라이프 푸드, 도미노)와
                                                “고객들에게 가장 맛있고 영양가 높은 피자를 제공”한다는 원칙 아래, 최고급 식자재와 새로운 맛을 선보이며
                                                프리미엄 피자 시장을 개척하였습니다. 업계 최초 국내산 오이로 만든 우리 피클 도입 및 6가지 슈퍼시드가
                                                함유된 슈퍼시드 도우를 출시해 더욱 건강한 피자를 만들기 위해 최선을 다했습니다.
                                                또한 ‘피자 라이스볼’ 등 기존 피자업계에서는 볼 수 없던 제품을 출시하여 고객들에게 항상 새로운 모습으로
                                                다가가기 위해 노력하고 있습니다.
                                            </p>
                                            <p>
                                                도미노피자는 “고객들이 편하고 쉽게 주문할 수 있도록 최상의 서비스를 제공한다”는
                                                목표 아래 주문, 배달을 혁신하였습니다. 2010년 업계 최초로 주문형 애플리케이션 출시하고
                                                2015년에는 업계 최초 고객 맞춤형 DIY 주문 서비스 마이키친(My Kitchen) 런칭,
                                                2017년에는 업계 최초 A.I 채팅 주문서비스 “도미챗(Domichat)”을 선보였습니다.
                                                그 이듬해 배달업계 최초로 “GPS 트래커”와 현재 야외를 포함한 전국 1,300개 지역에서
                                                피자 시식이 가능한 “도미노 스팟” 서비스를 실시하였습니다. 그리고 2019년 피자 업계 최초로 차량을
                                                이용해 매장 방문 포장 시 직원이 고객의 차량까지 직접 피자를 전달하는
                                                “도미노 드라이빙 픽업 서비스”, 2021년에는 국내 최초로 드론 배달 서비스를 상용화하는 등
                                                혁신적인 IT 서비스로 푸드테크를 선도하고 있습니다.
                                            </p>
                                            <p>
                                                또한, 도미노피자는 코로나19 확산을 방지하기 위한 노력을 아끼지 않고 있습니다.
                                                철저한 매장 방역 및 개인 위생관리, 사회적 거리두기 캠페인 준수는 물론,
                                                온라인 배달 주문 시 고객의 문 앞에 피자를 배달한 후 고객에게 피자가 도착 했음을 알려주는
                                                ‘비대면 안전 배달’ 서비스 등 고객에게 안심까지 전할 수 있도록 최선을 다하고 있습니다.
                                            </p>
                                            <p>
                                                이러한 노력을 인정받아, 도미노피자는 &lt;고객이 가장 추천하는 기업(KNPS) 9년 연속 1위 수상&gt;,
                                                &lt;한국 산업의 고객 만족도(KCSI)피자부문 1위 7년 연속 수상&gt;,
                                                &lt;Korean Standard 프리미엄 브랜드 지수 6년 연속 1위&gt;
                                                수상으로 2021년 2년 연속 3관왕을 달성하는 쾌거를 거두었습니다.
                                            </p>
                                        </div>
                                        <div class="ceo_rgt">
                                            <p>
                                                한국도미노피자는 앞으로도 세계 배달피자 리더로써 건강한 외식문화를 리드하기 위해 최상의
                                                식재료, 제품, 주문 및 배달 서비스를 제공하며, 언제나 고객들이 믿고 먹을 수 있는
                                                웰빙 먹거리 문화를 만들 수 있도록 최선을 다할 것입니다.
                                            </p>
                                            <p>고객 여러분의 많은 사랑과 관심 부탁 드립니다.<br>감사합니다.</p>
                                            <div class="txt_sign">
                                                <span>FreeP 사장</span>
                                                <img src="../images/03visual/img_ceo_sign.jpg" alt="">
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
        <!-- content e-->

        <!-- footer s -->
        <footer id="footer">
            <%@ include file="../../common/footer.jsp" %>
        </footer>
        <!-- footer e -->
    </div>
    <!-- wrap e-->

    <!-- script area -->
    <script src="../js/includeHTML.js"></script>
    <script>
        includeHTML();
    </script>

    <script src="../js/motion.js"></script>
    <script src="../js/ui.js"></script>
</body>

</html>