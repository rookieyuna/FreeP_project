<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    <link href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp" rel="stylesheet">
    <!-- js 라이브러리 영역 -->
    <script src="../js/jquery-3.6.0.js"></script>
    <script>
	function fn_search() {
	    $("#findBranch").submit();
	    return false;
	}
	</script>
 
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
										var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
										    mapOption = {
										        center: new kakao.maps.LatLng(37.478714, 126.878665), // 지도의 중심좌표
										        level: 3 // 지도의 확대 레벨
										    };  
										
										// 지도를 생성합니다    
										var map = new kakao.maps.Map(mapContainer, mapOption); 
										
										var imageSrc = "../images/01brand/brand_logo_marker.png"; 
										var imageSize = new kakao.maps.Size(64, 69); 
									    // 마커 이미지를 생성합니다    
									    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
									        
										
										// 주소-좌표 변환 객체를 생성합니다
										var geocoder = new kakao.maps.services.Geocoder();
										
										// 주소로 좌표를 검색합니다
										geocoder.addressSearch('서울시 금천구 가산동 1512', function(result, status) {
										    // 정상적으로 검색이 완료됐으면 
										     if (status === kakao.maps.services.Status.OK) {
										        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
												
											    // 결과값으로 받은 위치를 마커로 표시합니다
										        var marker = new kakao.maps.Marker({
										            map: map,
										            position: coords,
										            image : markerImage // 마커 이미지 
										        });
										
										       /*  // 인포윈도우로 장소에 대한 설명을 표시합니다
										        var infowindow = new kakao.maps.InfoWindow({
										            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
										        });
										        infowindow.open(map, marker); */
										
										        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
										        map.setCenter(coords);
										    } 
										});    
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
                                                    <select id="region_code_1" onchange="LocationChange(this)">
                                                        <option value="" selected="">시/도</option>
                                                        <option value="01">서울</option>
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
                                                        <option value="16">세종특별자치시</option>
                                                        <option value="17">제주</option>
                                                        </select>
                                                </div>
                                            </div>
                                            <div class="form-item">
                                                <div class="select-type type2">
                                                    <select id="region_code_2">
                                                        <option value="">구/군</option>
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
                                    	<c:choose>
											<c:when test="${empty lists }">
					                    		<dd colspan="3" align="center">등록된 매장이 없습니다.</td>
											</c:when>
											<c:otherwise> 
												<!-- 게시물이 있을때 -->
												<c:forEach items="${lists }" var="row">
													<li>
			                                            <dl>
			                                                <dt>${row.b_name }<span class="tel" href="">${row.phone }</span></dt>
			                                                <dd class="address">${row.address }</dd>
			                                                <dd class="hash"><span>[고객감사] 방문포장 1+1 이벤트</span></dd>	
			                                            </dl>	
			                                            <div class="promotion">		
			                                                <div class="type">
			                                                    <span>온라인<br>방문포장<br>20%</span>
			                                                </div>		
			                                                <div class="type2">
			                                                    <span>오프라인<br>방문포장<br>30%</span>
			                                                </div>	
			                                            </div>	
			                                            <div class="btn-wrap">		
			                                                <a href="" onclick="">상세보기</a>		
			                                                <a href="" class="type2">방문포장</a>	
			                                            </div>	
			                                        </li>
												</c:forEach>
											</c:otherwise>
										</c:choose>
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
	
	<script>
        //거주지역 셀렉트문
        function LocationChange(e) {
            const state = document.getElementById("region_code_2");

            const seoul = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
            const incheon = ["계양구","남동구","미추홀구","부평구","서구","연수구","중구","강화군","옹진군"];
            const gyeonggi = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","양평군","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","여주군",];
            const gangwon = ["강릉시","동해시","삼척시","속초시","영월군","원주시","인제군","정선군","철원군","춘천시","태백시","평창군","홍천군","횡성군"];
            const chungnam = ["계룡시","공주시","논산시","당진시","보령시","부여군","서산시","아산시","천안시","태안군","홍성군"];
            const chungbuk = ["제천시","음성군","증평군","진천군","청주시","충주시"];
            const daejeon = ["대덕구", "동구", "서구", "유성구", "중구"];
            const gyeongsangnam = ["거제시", "거창군", "김해시", "밀양시", "사천시", "양산시", "진주시", "창원시", "통영시"];
            const gyeongsangbuk = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","예천군","칠곡군","포항시"];
            const daegu = ["남구", "달서구", "동구", "북구", "서구", "수성구", "중구", "달성군"];
            const jeonnam = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
            const jeonbuk = ["군산시", "김제시", "남원시", "익산시", "전주시", "정읍시", "고창군", "무주군", "부안군", "순창군", "완주군", "임실군", "장수군", "진안군"];
            const gwangju = ["광산구", "남구", "동구", "북구", "서구"];
            const ulsan = ["남구","동구","북구","중구","울주군"];
            const busan = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
            const jeju = ["서귀포시","제주시","남제주군","북제주군"];
            const sejong = ["세종시"];
            

            if (e.value == "01") {
                add = seoul;
            } else if (e.value == "02") {
                add = incheon;
            } else if (e.value == "03") {
                add = gyeonggi;
            } else if (e.value == "04") {
                add = gangwon;
            } else if (e.value == "05") {
                add = gwangju;
            } else if (e.value == "06") {
                add = chungbuk;
            } else if (e.value == "07") {
                add = daejeon;
            } else if (e.value == "08") {
                add = gyeongsangnam;
            } else if (e.value == "09") {
                add = gyeongsangbuk;
            } else if (e.value == "10") {
                add = daegu;
            } else if (e.value == "11") {
                add = jeonnam;
            } else if (e.value == "12") {
                add = jeonbuk;
            } else if (e.value == "13") {
                add = gwangju;
            } else if (e.value == "14") {
                add = ulsan;
            } else if (e.value == "15") {
                add = busan;
            } else if (e.value == "16") {
                add = sejong;
            } else if (e.value == "17") {
                add = jeju;
            }
        
            //초기화 
            state.options.length = 1;

            for (property in add) {
                let opt = document.createElement("option");
                opt.value = add[property];
                opt.innerHTML = add[property];
                state.appendChild(opt);
            }
        }
    </script>
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