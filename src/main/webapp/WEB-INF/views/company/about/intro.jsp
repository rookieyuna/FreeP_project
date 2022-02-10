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
                                    <li class="active"><a href="./intro.html">Overview</a></li>
                                    <li><a href="#">CEO</a></li>
                                    <li><a href="#">Location</a></li>
                                </ul>
                            </div>
                            <div class="tab_content_wrap">
                                <div class="tab_content active">
                                    <div class="overview_area">
                                        <div class="overview_top">
                                            <div class="visual_overview">
                                                <img src="../images/03visual/visual_overview.jpg" alt="">
                                            </div>
                                            <div class="overview_ex">
                                                <div class="ex_lft">
                                                    <p>
                                                        배달피자의 개념이 전무했던 1990년, 한국도미노피자는 국내 최초 피자
                                                        <br>
                                                        배달 전문 브랜드로서 1호점인 오금점을 시작으로 국내 피자 소비자들에게
                                                        <br>
                                                        첫 선을 보인 이후, 2022년 현재 전국 477개 매장에서 고객이 원하는 가장 맛있고
                                                        영양 높은 피자를 가장 친절하게 고객들에게 제공하는 세계 배달 피자 리더
                                                        도미노피자로 자리매김하게 되었습니다.
                                                    </p>
                                                    <p>
                                                        한국도미노피자는 저온 숙성 도우와 최고급 프리미엄 치즈 등 가장 신선한
                                                        <br>
                                                        최고급 식자재를 사용하여 고객들이 미처 생각하지 못했던 혁신적인
                                                        <br>
                                                        피자를 만들어왔습니다.
                                                    </p>
                                                </div>
                                                <div class="ex_rgt">
                                                    <p>
                                                        그리고 그 피자가 위생적이고 안전하게 고객에게 전달될 수 있도록 전
                                                        <br>
                                                        과정에서 엄격한 시스템을 도입, 이러한 노력의 일환으로 업계 최초로 ISO
                                                        <br>
                                                        22000을 획득하면서 맛과 영양, 그리고 안전과 위생 측면에서 국제적인
                                                        <br>
                                                        표준을 인정받았습니다. 누구보다 피자를 잘 아는 피자분야의 최고
                                                        <br>
                                                        전문가이자 피자 마스터인 한국 도미노피자는 앞으로도 지속적으로 최고의
                                                        <br>
                                                        피자를 최상의 서비스로 제공하기 위한 노력을 아끼지 않을 것입니다.
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="vision_info">
                                            <div class="vision_tit">
                                                <span>V I S I O N</span>
                                                <strong>Be the #1 Pizza Company in the world<br> and in every
                                                    neighborhood</strong>
                                            </div>
                                            <div class="vision_ex">
                                                <p>
                                                    <span class="ico ico_quote2"></span>
                                                    ‘한 번 한다면 꼭 이루어낸다’라는 사명감과
                                                    <br>
                                                    책임감을 가진 <span>BEST PEOPLE</span>이 만드는
                                                    <br>
                                                    고객에게 사랑 받는 세계 배달 피자 리더 프리피
                                                    <span class="ico ico_quote3"></span>
                                                </p>
                                                <ul>
                                                    <li>
                                                        <dl>
                                                            <dt>BEST PRODUCT</dt>
                                                            <dd>
                                                                <img src="../images/03visual/lst_vision.png"
                                                                    alt="">
                                                                <dl>
                                                                    <dt>맛있게!</dt>
                                                                    <dd>
                                                                        쫄깃하고 고소한 저온숙성도우, 손으로 직접 만드는 HAND
                                                                        <br>
                                                                        TOSSED 방식, 재료 본연의 맛을 살린 스크린 방식,
                                                                        <br>
                                                                        신선한 토핑, 풍부하고 깊은 맛의 고급프리미엄 치즈.
                                                                        <br>
                                                                        프리피만의 특별한 노하우를 경험하세요
                                                                    </dd>
                                                                </dl>
                                                            </dd>
                                                        </dl>
                                                    </li>
                                                    <li>
                                                        <dl>
                                                            <dt>BEST SERVICE</dt>
                                                            <dd>
                                                                <img src="../images/03visual/lst_vision2.png"
                                                                    alt="">
                                                                <dl>
                                                                    <dt>친절하게!</dt>
                                                                    <dd>프리피는 밝고 환한 표정으로 고객을 맞이하고<br>적극적으로 소통합니다. 고객이
                                                                        최우선으로 환대받고<br>있음을 느끼게 하기 위해 최선을 다해 노력하고 있습니다.
                                                                    </dd>
                                                                </dl>
                                                            </dd>
                                                        </dl>
                                                    </li>
                                                    <li>
                                                        <dl>
                                                            <dt>BEST IMAGE</dt>
                                                            <dd>
                                                                <img src="../images/03visual/lst_vision3.png"
                                                                    alt="">
                                                                <dl>
                                                                    <dt>깨끗하게!</dt>
                                                                    <dd>365일 늘 변함없이 고객에게 최상의 제품과 서비스를<br>제공하기 위하여 노력하고
                                                                        있습니다.<br>엄격한 평가를 통해 피자 메이킹에서부터 위생적인<br>매장, 시설
                                                                        이미지까지 완벽한 Operation관리를<br>실시하고 있습니다.</dd>
                                                                </dl>
                                                            </dd>
                                                        </dl>
                                                    </li>
                                                    <li>
                                                        <dl>
                                                            <dt>BEST SAFETY</dt>
                                                            <dd>
                                                                <img src="../images/03visual/lst_vision4.png"
                                                                    alt="">
                                                                <dl>
                                                                    <dt>안전하게!</dt>
                                                                    <dd>고객의 건강과 안전을 지켜주는 프리피 피자로<br>정기적인
                                                                        감사와 교육을 실시하고 있습니다.<br>안전한 식자재 위생관리, 배달 등 전 과정의
                                                                        매뉴얼화를<br>통한 철저한 안전관리는 고객과 도미노피자의 약속입니다.</dd>
                                                                </dl>
                                                            </dd>
                                                        </dl>
                                                    </li>
                                                </ul>
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