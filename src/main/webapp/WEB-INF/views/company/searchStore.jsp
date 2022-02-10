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
        <%@ include file="../common/header.jsp" %>
    </header>
    <!-- header e -->

    <!-- content s -->
    <div id="container">
        <section id="content">
            <div class="sub-type store">
                <div class="inner-box">
                    <div class="page-title-wrap">
                        <h2 class="page-title">매장찾기</h2>
                        <div class="depth-area">
                            <ol>
                                <li><a href="/FreeP/index.html">홈</a></li>
                                <li><strong>매장찾기</strong></li>
                            </ol>
                        </div>
                    </div>
                    <article class="notice-area">
                        <!-- menu-list -->
                        <div class="menu-nav-wrap">
                            <div class="menu-nav">
                                <ul>
                                    <li><a href="../company/intro.do">회사소개</a></li>
                                    <li><a href="../company/notice.do">공지사항</a></li>
                                    <li class="active"><a href="../company/searchStore.do">매장찾기</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="title-wrap-center">
                            <h3 class="title-type">
                                매장찾기
                            </h3>
                            <p>지역별 매장 또는 매장명 검색으로 전국 곳곳의 프리피 매장을 확인해보세요</p>
                        </div>

                        <div class="store-wrap">
                            <div class="btn-wrap">
                                <a href="" class="btn-type v4" onclick="openLayerPopup('detail_map'); return false;">전체매장
                                    보기</a>
                            </div>
                            <div class="store-map-area">
                                <div class="store-map-wrap">
                                    <div class="store-map" id="map_canvas">
                                        <div id="map" style="position: relative; width: 100%; height: 100%; z-index: 0; overflow: hidden;">
                                        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=593cf326bf3de1201b2f6d9d0a803f3f"></script>
                                        <script>
                                            var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
                                            var options = { //지도를 생성할 때 필요한 기본 옵션
                                                center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
                                                level: 3 //지도의 레벨(확대, 축소 정도)
                                            };
                                    
                                            var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
                                        </script>
                                            
                                        </div>
                                    </div>
                                </div>
                                    
                            <div class="store-search">
                                <div class="tab-type5 js_tab">
                                    <ul>
                                        <li class="active"><a href="https://web.dominos.co.kr/branch#storeSrch1" onclick="navTabs('address', this); return false;">지역 검색</a></li>
                                        <li><a href="https://web.dominos.co.kr/branch#storeSrch2" onclick="navTabs('name', this); return false;">매장명</a></li>
                                    </ul>
                                </div>
                                <!-- 지역 검색 -->
                                <div class="tab-content active" id="storeSrch1">
                                    <div class="address-set-wrap store">
                                        <div class="form-group srch-type">
                                            <div class="form-item">
                                                <div class="select-type type2">
                                                    <select id="region_code_1" onchange="getRegionSubList();">
                                                        <option value="">시/도</option>
                                                        <option value="01" selected="">서울</option>
                                                        <option value="02">인천</option>
                                                        <option value="03">경기</option>
                                                        <option value="04">강원</option>
                                                        <option value="05">충남</option>
                                                        <option value="06">충북</option>
                                                        <option value="07">대전</option>
                                                        <option value="08">경남</option>
                                                        <option value="09">경북</option>
                                                        <option value="10">대구</option>
                                                        <option value="11">전남</option>
                                                        <option value="12">전북</option>
                                                        <option value="13">광주</option>
                                                        <option value="14">울산</option>
                                                        <option value="15">부산</option>
                                                        <option value="16">제주</option>
                                                        <option value="17">세종특별자치시</option>
                                                        </select>
                                                </div>
                                            </div>
                                            <div class="form-item">
                                                <div class="select-type type2">
                                                    <select id="region_code_2">
                                                        <option value="">구/군</option>
                                                        <option value="0111">강남구</option>
                                                        <option value="0110">강동구</option>
                                                        <option value="0117">강북구</option>
                                                        <option value="0124">강서구</option>
                                                        <option value="0120">관악구</option>
                                                        <option value="0118">광진구</option>
                                                        <option value="0121">구로구</option>
                                                        <option value="0122">금천구</option>
                                                        <option value="0115">노원구</option>
                                                        <option value="0108">도봉구</option>
                                                        <option value="0106">동대문구</option>
                                                        <option value="0123">동작구</option>
                                                        <option value="0104">마포구</option>
                                                        <option value="0103">서대문구</option>
                                                        <option value="0113">서초구</option>
                                                        <option value="0109">성동구</option>
                                                        <option value="0112">성북구</option>
                                                        <option value="0114">송파구</option>
                                                        <option value="0125">양천구</option>
                                                        <option value="0119">영등포구</option>
                                                        <option value="0116">용산구</option>
                                                        <option value="0105">은평구</option>
                                                        <option value="0102">종로구</option>
                                                        <option value="0101" selected="">중구</option>
                                                        <option value="0107">중랑구</option>
                                                        </select>
                                                </div>
                                            </div>
                                            <div class="form-item">
                                                <button type="button" class="btn-search" onclick="findBranch('address'); return false;">
                                                    <span class="material-icons-outlined">search</span>
                                                </button>
                                            </div>
                                        </div>
                                        <!-- <div class="text-link-area">
                                            <a href="#" onclick="schAllPrmt(); return false;">
                                                <span>특별할인 진행 매장</span>
                                            </a>
                                        </div>
                                        <p class="notice-text">
                                            <a href="javascript:openLayerPopup('promotion');" >이용안내</a>
                                        </p> -->
        
        
                                    </div>
                                </div>
                                <!-- //지역 검색 -->
        
                                <!-- 매장명 -->
                                <div class="tab-content" id="storeSrch2">
                                    <div class="address-set-wrap store">
                                        <div class="form-group srch-type">
                                            <div class="form-item">
                                                <input type="text" id="branch_name" placeholder="매장명을 검색하세요.">
                                            </div>
                                            <div class="form-item">
                                                <button type="button" class="btn-search" onclick="findBranch('name'); return false;">
                                                    <span class="material-icons-outlined">search</span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- //매장명 -->
                                <div class="store-address-list">
                                    <ul id="ul_shop_list">
                                        <li>
                                            <dl>
                                                <dt>명동점<span class="tel" href="tel:02-2264-3081">02-2264-3081</span></dt>
                                                <dd class="address">서울특별시 중구 마른내로 47 (초동)</dd>
                                                <dd class="hash"><span>[고객감사] 방문포장 1+1 이벤트</span></dd>	
                                            </dl>	
                                            <div class="promotion">		
                                                <div class="type">
                                                    <span>온라인<br>방문포장<br>0%</span>
                                                </div>		
                                                <div class="type2">
                                                    <span>오프라인<br>방문포장<br>0%</span>
                                                </div>	
                                            </div>	
                                            <div class="btn-wrap">		
                                                <a href="https://web.dominos.co.kr/branch#none" onclick="openDetailPop(86365);">상세보기</a>		
                                                <a href="javascript:setBranch(86365);" class="type2">방문포장</a>	
                                            </div>	
                                        </li>
                                        <li>	
                                            <dl>
                                                <dt>신당점<span class="tel" href="tel:02-2233-3082">02-2233-3082</span></dt>
                                                <dd class="address">서울특별시 중구 다산로 156 (신당동)</dd>	
                                            </dl>	
                                            <div class="promotion">		
                                                <div class="type">
                                                    <span>온라인<br>방문포장<br>30%</span>
                                                </div>		
                                                <div class="type2">
                                                    <span>오프라인<br>방문포장<br>30%</span>
                                                </div>	
                                            </div>	
                                            <div class="btn-wrap">		
                                                <a href="https://web.dominos.co.kr/branch#none" onclick="openDetailPop(86371);">상세보기</a>		
                                                <a href="javascript:setBranch(86371);" class="type2">방문포장</a>	
                                            </div>	
                                        </li>
                                        <li>	
                                            <dl>
                                                <dt>연희점<span class="tel" href="tel:02-326-3083">02-326-3083</span></dt>
                                                <dd class="address">서울특별시 서대문구 연희로 95 (연희동)</dd>
                                                <dd class="hash"><span>[고객감사] 방문포장 1+1 이벤트</span></dd>	
                                            </dl>	
                                            <div class="promotion">		
                                                <div class="type">
                                                    <span>온라인<br>방문포장<br>30%</span>
                                                </div>		
                                                <div class="type2">
                                                    <span>오프라인<br>방문포장<br>30%</span>
                                                </div>	
                                            </div>	
                                            <div class="btn-wrap">		
                                                <a href="https://web.dominos.co.kr/branch#none" onclick="openDetailPop(86510);">상세보기</a>		
                                                <a href="javascript:setBranch(86510);" class="type2">방문포장</a>	
                                            </div>	
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        
                    </article>
                    
                </div>
            </div>
        </section>
        <!-- 전체 매장 보기 -->
        <!--//전체 매장 보기 -->
        <!-- 이용안내 보기 -->
        <!--//이용안내 보기 -->
    </div>
    <!-- content e -->

    <!-- footer s -->
    <footer id="footer">
        <%@ include file="../common/footer.jsp" %>
    </footer>
    <!-- footer e -->

    <!-- script area -->
    <script src="../js/includeHTML.js"></script>
    <script>includeHTML();</script>
    
    <script src="../js/motion.js"></script>
    <script src="../js/ui.js"></script>
</body>
</html>