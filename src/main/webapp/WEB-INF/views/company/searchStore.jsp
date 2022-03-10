<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="_csrf" content="${_csrf.token}">
	<meta name="_csrf_header" content="${_csrf.headerName}">
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
	
	<!-- 모달창 부분 -->
	<script>
	
	/* 매장 상세정보 */
	function storeDetailOpen(b_code){ 
		
		var token = $("meta[name='_csrf']").attr("content");
	    var header = $("meta[name='_csrf_header']").attr("content");
		
		$.ajax({ 
			url: "storedetail.do",
			type:"POST",
			beforeSend : function(xhr){
	    		xhr.setRequestHeader(header, token);
	        },
	        async:false,
			data: {"b_code":b_code},
			dataType:'json', 
			success:function(response) { 
				var name = response.vo;
				var name1 = response.vo1;
				
				storeDetail(name, name1); 
				
			}, 
			error: function(data){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"
	        			+"\n"+"error:"+error)
			} 
		}); 
	}; 
	function storeDetail(data, data1){ 
		document.getElementById("b_name").innerText=data.b_name;
		document.getElementById("phone").innerText=data.phone;
		document.getElementById("address").innerText=data.address;
	};
	</script>
	<style>
		/* 모달창 화면가운데 정렬 CSS */
		.pop-wrap{
			position: fixed;
			top: 50%;
			left: 50%;
			-webkit-transform: translate(-50%, -50%);
			-moz-transform: translate(-50%, -50%);
			-ms-transform: translate(-50%, -50%);
			-o-transform: translate(-50%, -50%);
			transform: translate(-50%, -50%);
		}
	</style>
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
                        	
                        	<!-- 매장 전체보기 -->
                            <div class="btn-wrap">
                                <a href="javascript:return false;" class="btn-type v4 detail-map"  onclick="openLayerPopup('${list}');">전체매장
                                    보기</a>
                            </div>
                            
                            <!-- ///////////////////////////////////////// -->
                            <!-- 매장 전체보기 모달 (motion.js 131.line) -->
							<div class="map-detail-modal pop-layer pop-full" id="pop-store-all">
								<div class="dim"></div>
								<div class="pop-wrap">
									<div class="pop-title-wrap type2">
										<h2 class="pop-title" onclick="openLayerPopup(&#39;detail_map&#39;); return false;">전체 매장 보기</h2>
									</div>
									<a href="javascript:UI.layerPopUp({selId:'#pop-allergy', st:'close'});" class="btn-close"></a>
									<div class="pop-content">
										<div class="detail-map" id="map_large_canvas">
											<!-- MAP 영역 -->
											<div id="map_viewport" style="position: relative; width: 990px; height: 650px; z-index: 0; overflow: hidden;">
												<script>
												$(document).ready(function(){
													
													//alert('dddd');
													var mapContainer = document.getElementById('map_viewport'), // 지도를 표시할 div  
												    mapOption = { 
												        center: new kakao.maps.LatLng(37.478714, 126.878665), // 지도의 중심좌표
												        level: 11, // 지도의 확대 레벨
												    };
												 
													var maps = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
													
													var positions = [
														{
															title : '본점',
															latlng : new kakao.maps.LatLng(37.478714, 126.878665)
														},
														{
															title : '강남점',
															latlng : new kakao.maps.LatLng(37.4942635, 127.0296699)
														},
														{
															title : '마포점',
															latlng : new kakao.maps.LatLng(37.550787, 126.912592)
														},
														{
															title : '영등포점',
															latlng : new kakao.maps.LatLng(37.50966, 126.904673)
														},
														{
															title : '용산점',
															latlng : new kakao.maps.LatLng(37.5405032, 126.9691858)
														},
														{
															title : '합정점',
															latlng : new kakao.maps.LatLng(37.5502177, 126.9153071)
														},
														{
															title : '서초점',
															latlng : new kakao.maps.LatLng(37.4952967, 126.9889993)
														},
														{
															title : '등촌점',
															latlng : new kakao.maps.LatLng(37.5494106, 126.8675998)
														},
														{
															title : '종로점',
															latlng : new kakao.maps.LatLng(37.577112, 126.99766)
														},
														{
															title : '신촌점',
															latlng : new kakao.maps.LatLng(37.4942635, 127.0296699)
														},
														{
															title : '금천구점',
															latlng : new kakao.maps.LatLng(37.4762052, 126.8933986)
														},
														{
															title : '구로점',
															latlng : new kakao.maps.LatLng(37.5000384, 126.8828494)
														},
														{
															title : '부천점',
															latlng : new kakao.maps.LatLng(37.50334207, 126.7637937)
														},
														{
															title : '미추홀점',
															latlng : new kakao.maps.LatLng(37.443824,126.673017)
														},
														{
															title : '부평점',
															latlng : new kakao.maps.LatLng(37.476022, 126.709494)
														},
														{
															title : '인하대점',
															latlng : new kakao.maps.LatLng(37.45157626, 126.6557593)
														},
														{
															title : '안양점',
															latlng : new kakao.maps.LatLng(37.38959826, 126.9521795)
														},
														{
															title : '성남점',
															latlng : new kakao.maps.LatLng(37.38163615, 127.1282697)
														},
														{
															title : '시흥점',
															latlng : new kakao.maps.LatLng(37.37410466, 126.7334437)
														},
														{
															title : '광명점',
															latlng : new kakao.maps.LatLng(37.41565, 126.87895)
														},
														{
															title : '태백점',
															latlng : new kakao.maps.LatLng(37.09886232, 129.0191345)
														},
														{
															title : '영월점',
															latlng : new kakao.maps.LatLng(37.136383, 128.836149)
														},
														{
															title : '공주점',
															latlng : new kakao.maps.LatLng(36.44882075, 127.120576)
														},
														{
															title : '서산점',
															latlng : new kakao.maps.LatLng(36.78126614, 126.450733)
														},
														{
															title : '청주점',
															latlng : new kakao.maps.LatLng(36.62486354, 127.4423189)
														},
														{
															title : '충주점',
															latlng : new kakao.maps.LatLng(37.0224929, 128.0262237)
														},
														{
															title : '동구점',
															latlng : new kakao.maps.LatLng(36.250736, 127.33621)
														},
														{
															title : '중구점',
															latlng : new kakao.maps.LatLng(36.30998894, 127.4078018)
														},
														{
															title : '김해점',
															latlng : new kakao.maps.LatLng(35.20382,128.8092)
														},
														{
															title : '진주점',
															latlng : new kakao.maps.LatLng(35.24735, 128.27347)
														},
														{
															title : '안동점',
															latlng : new kakao.maps.LatLng(36.561367, 128.747798)
														},
														{
															title : '경주점',
															latlng : new kakao.maps.LatLng(35.919975, 129.2449008)
														},
														{
															title : '서구점',
															latlng : new kakao.maps.LatLng(35.87212319, 128.5751549)
														},
														{
															title : '수성구점',
															latlng : new kakao.maps.LatLng(35.84137047, 128.6098821)
														},
														{
															title : '목포점',
															latlng : new kakao.maps.LatLng(34.791093, 126.383348)
														},
														{
															title : '여수점',
															latlng : new kakao.maps.LatLng(34.74148379, 127.7276831)
														},
														{
															title : '고창점',
															latlng : new kakao.maps.LatLng(35.388045, 126.670124)
														},
														{
															title : '전주점',
															latlng : new kakao.maps.LatLng(35.80369311, 127.116927)
														},
														{
															title : '동구점',
															latlng : new kakao.maps.LatLng(35.15438611, 126.9109556)
														},
														{
															title : '광산구점',
															latlng : new kakao.maps.LatLng(35.19423259, 126.791337)
														},
														{
															title : '남구점',
															latlng : new kakao.maps.LatLng(35.53851, 129.33396)
														},
														{
															title : '울주점',
															latlng : new kakao.maps.LatLng(35.55377, 129.11803)
														},
														{
															title : '해운대점',
															latlng : new kakao.maps.LatLng(35.16655632, 129.178066)
														},
														{
															title : '명지점',
															latlng : new kakao.maps.LatLng(35.10438371, 128.9220773)
														},
														{
															title : '세종점',
															latlng : new kakao.maps.LatLng(36.601886914037365, 127.2900686)
														},
														{
															title : '제주점',
															latlng : new kakao.maps.LatLng(33.50823534,	126.5200254)
														},
														{
															title : '서귀포점',
															latlng : new kakao.maps.LatLng(33.246471, 126.506865)
														}
														
													]; 
													
													// 마커 이미지의 이미지 주소입니다
													var imageSrc = "../images/01brand/brand_logo_marker.png"; 
													    
													for (var i = 0; i < positions.length; i ++) {
														
													    // 마커 이미지의 이미지 크기 입니다
													    var imageSize = new kakao.maps.Size(54, 55); 
													    
													    // 마커 이미지를 생성합니다    
													    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
													    
													    // 마커를 생성합니다
													    var marker = new kakao.maps.Marker({
													        map: maps, // 마커를 표시할 지도
													        position: positions[i].latlng, // 마커를 표시할 위치
													        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
													        image : markerImage // 마커 이미지 
													    });
													    
													    marker.setMap(maps);
													  
													}
													
												});
												function resizeMap() {
												    var mapContainer = document.getElementById('map_viewport');
												    mapContainer.style.width = '970px';
												    mapContainer.style.height = '650px'; 
												}
												
												setTimeout(function() {
												    map.relayout();
												    map.setCenter(new kakao.maps.LatLng(lat, lng));
												    // map.setLevel(2); 필요하면 레벨조정
												}, 100);
												</script>
											</div>
										</div>
									</div>
								</div>
							</div>
                            <!-- 매장 전체보기 모달 끝 -->
                            <!-- ///////////////////////////////////////// -->

                            
                            <!-- 매장검색 & 지도부분 -->
                            <div class="store-map-area">
                                <div class="store-map-wrap">
                                    <div class="store-map" id="map_canvas">
                                        <div id="map" style="position: relative; width: 100%; height: 100%; z-index: 0; overflow: hidden;">
    									<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=593cf326bf3de1201b2f6d9d0a803f3f&libraries=services"></script>
										<!-- 지도관련 스크립트 -->
										<script>
										var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
									    mapOption = { 
									        center: new kakao.maps.LatLng(37.478714, 126.878665), // 지도의 중심좌표
									        level: 6, // 지도의 확대 레벨
									    };
									 
										var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
										 
										 
										//주소-좌표 변환 객체를 생성합니다
										var geocoder = new kakao.maps.services.Geocoder();
										
										
										var positions = [
											{
												title : '본점',
												latlng : new kakao.maps.LatLng(37.478714, 126.878665)
											},
											{
												title : '강남점',
												latlng : new kakao.maps.LatLng(37.4942635, 127.0296699)
											},
											{
												title : '마포점',
												latlng : new kakao.maps.LatLng(37.550787, 126.912592)
											},
											{
												title : '영등포점',
												latlng : new kakao.maps.LatLng(37.50966, 126.904673)
											},
											{
												title : '용산점',
												latlng : new kakao.maps.LatLng(37.5405032, 126.9691858)
											},
											{
												title : '합정점',
												latlng : new kakao.maps.LatLng(37.5502177, 126.9153071)
											},
											{
												title : '서초점',
												latlng : new kakao.maps.LatLng(37.4952967, 126.9889993)
											},
											{
												title : '등촌점',
												latlng : new kakao.maps.LatLng(37.5494106, 126.8675998)
											},
											{
												title : '종로점',
												latlng : new kakao.maps.LatLng(37.577112, 126.99766)
											},
											{
												title : '신촌점',
												latlng : new kakao.maps.LatLng(37.4942635, 127.0296699)
											},
											{
												title : '금천구점',
												latlng : new kakao.maps.LatLng(37.4762052, 126.8933986)
											},
											{
												title : '구로점',
												latlng : new kakao.maps.LatLng(37.5000384, 126.8828494)
											},
											{
												title : '부천점',
												latlng : new kakao.maps.LatLng(37.50334207, 126.7637937)
											},
											{
												title : '미추홀점',
												latlng : new kakao.maps.LatLng(37.443824,126.673017)
											},
											{
												title : '부평점',
												latlng : new kakao.maps.LatLng(37.476022, 126.709494)
											},
											{
												title : '인하대점',
												latlng : new kakao.maps.LatLng(37.45157626, 126.6557593)
											},
											{
												title : '안양점',
												latlng : new kakao.maps.LatLng(37.38959826, 126.9521795)
											},
											{
												title : '성남점',
												latlng : new kakao.maps.LatLng(37.38163615, 127.1282697)
											},
											{
												title : '시흥점',
												latlng : new kakao.maps.LatLng(37.37410466, 126.7334437)
											},
											{
												title : '광명점',
												latlng : new kakao.maps.LatLng(37.41565, 126.87895)
											},
											{
												title : '태백점',
												latlng : new kakao.maps.LatLng(37.09886232, 129.0191345),
											},
											{
												title : '영월점',
												latlng : new kakao.maps.LatLng(37.136383, 128.836149)
											},
											{
												title : '공주점',
												latlng : new kakao.maps.LatLng(36.44882075, 127.120576)
											},
											{
												title : '서산점',
												latlng : new kakao.maps.LatLng(36.78126614, 126.450733)
											},
											{
												title : '청주점',
												latlng : new kakao.maps.LatLng(36.62486354, 127.4423189)
											},
											{
												title : '충주점',
												latlng : new kakao.maps.LatLng(37.0224929, 128.0262237)
											},
											{
												title : '동구점',
												latlng : new kakao.maps.LatLng(36.250736, 127.33621)
											},
											{
												title : '중구점',
												latlng : new kakao.maps.LatLng(36.30998894, 127.4078018)
											},
											{
												title : '김해점',
												latlng : new kakao.maps.LatLng(35.20382,128.8092)
											},
											{
												title : '진주점',
												latlng : new kakao.maps.LatLng(35.24735, 128.27347)
											},
											{
												title : '안동점',
												latlng : new kakao.maps.LatLng(36.561367, 128.747798)
											},
											{
												title : '경주점',
												latlng : new kakao.maps.LatLng(35.919975, 129.2449008)
											},
											{
												title : '서구점',
												latlng : new kakao.maps.LatLng(35.87212319, 128.5751549)
											},
											{
												title : '수성구점',
												latlng : new kakao.maps.LatLng(35.84137047, 128.6098821)
											},
											{
												title : '목포점',
												latlng : new kakao.maps.LatLng(34.791093, 126.383348)
											},
											{
												title : '여수점',
												latlng : new kakao.maps.LatLng(34.74148379, 127.7276831)
											},
											{
												title : '고창점',
												latlng : new kakao.maps.LatLng(35.388045, 126.670124)
											},
											{
												title : '전주점',
												latlng : new kakao.maps.LatLng(35.80369311, 127.116927)
											},
											{
												title : '동구점',
												latlng : new kakao.maps.LatLng(35.15438611, 126.9109556)
											},
											{
												title : '광산구점',
												latlng : new kakao.maps.LatLng(35.19423259, 126.791337)
											},
											{
												title : '남구점',
												latlng : new kakao.maps.LatLng(35.53851, 129.33396)
											},
											{
												title : '울주점',
												latlng : new kakao.maps.LatLng(35.55377, 129.11803)
											},
											{
												title : '해운대점',
												latlng : new kakao.maps.LatLng(35.16655632, 129.178066)
											},
											{
												title : '명지점',
												latlng : new kakao.maps.LatLng(35.10438371, 128.9220773)
											},
											{
												title : '세종점',
												latlng : new kakao.maps.LatLng(36.601886914037365, 127.2900686)
											},
											{
												title : '제주점',
												latlng : new kakao.maps.LatLng(33.50823534,	126.5200254)
											},
											{
												title : '서귀포점',
												latlng : new kakao.maps.LatLng(33.246471, 126.506865)
											}
										]; 
										
										// 마커 이미지의 이미지 주소입니다
										var imageSrc = "../images/01brand/brand_logo_marker.png"; 
										    
										for (var i = 0; i < positions.length; i ++) {
										    
										    // 마커 이미지의 이미지 크기 입니다
										    var imageSize = new kakao.maps.Size(54, 55); 
										    
										    // 마커 이미지를 생성합니다    
										    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
										    
										    // 마커를 생성합니다
										    var marker = new kakao.maps.Marker({
										        map: map, // 마커를 표시할 지도
										        position: positions[i].latlng, // 마커를 표시할 위치
										        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
										        image : markerImage // 마커 이미지 
										    });
										    
										    //marker.setMap(map);
										} 
										 
										<c:forEach items="${list }" var="row">
									    //주소로 좌표를 검색합니다
									    geocoder.addressSearch("${row.address}", function(result, status) {
									        // 정상적으로 검색이 완료됐으면 
									        if (status === kakao.maps.services.Status.OK) {
									    			
									            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
									            
									            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
									            map.setCenter(coords);    
									        } 
									    });    
									   	</c:forEach>
										</script>
                                        </div>
                                    </div>
                                </div>
                                   
                            <div class="store-search">
                                <div class="tab-type5 js_tab">
                                    <ul>
                                        <li id="tabs" class="active"><a href="https://web.dominos.co.kr/branch#storeSrch1" onclick="navTabs('address', this); return false;">지역 검색</a></li>
                                        <li id="tabs"><a href="https://web.dominos.co.kr/branch#storeSrch2" onclick="navTabs('name', this); return false;">매장명</a></li>
                                    </ul>
                                </div>
                                <!-- 지역 검색 -->
                                <form name="storeMap" action="" method="get">
                                <div class="tab-content active" id="storeSrch1">
                                    <div class="address-set-wrap store">
                                        <div class="form-group srch-type">
                                            <div class="form-item">
                                                <div class="select-type type2">
                                                    <select id="region_code_1" name="searchField" onchange="LocationChange(this)">
                                                        <option value="" selected="">시/도</option>
                                                        <option value="01" >서울</option>
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
                                                    <select id="region_code_2" name="searchTxt">
                                                        <option value="">구/군</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-item">
                                                <button class="btn-search" >
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
                                </form>
                                <!-- //지역 검색 -->
        
                                <!-- 매장명 -->
                                <form method="get" name="storeNameSearch" onsubmit="searchPlaces(); return false;">
                                <div class="tab-content" id="menu_wrap">
                                    <div class="address-set-wrap store">
                                        <div class="form-group srch-type">
                                            <div class="form-item">
                                            	<form onsubmit="searchPlaces(); return false;">
                                                <input type="text" id="keyword"  name="storeName" placeholder="매장명을 검색하세요." value="">
                                                </form>
                                            </div>
                                            <div class="form-item">
                                            	<!-- onclick="findBranch('name'); return false;" -->
                                                <button class="btn-search">
                                                    <span class="material-icons-outlined">search</span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </form>
                                
                                <!-- //매장명 -->
                                <div class="store-address-list">
                                    <ul id="placesList">
                                    	<c:choose>
											<c:when test="${empty list }">
					                    		<dd colspan="3" align="center">등록된 매장이 없습니다.</td>
											</c:when>
											<c:otherwise> 
												<!-- 게시물이 있을때 -->
												<c:forEach items="${list }" var="row">
													<li>
			                                            <dl>
			                                                <dt>${row.b_name }<span class="tel" href="">${row.phone }</span></dt>
			                                                <dd class="address">${row.address }</dd>
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
			                                                <a href="javascript:return false;" class="store-info-box" onclick="storeDetailOpen('${row.b_code}');">상세보기</a>		
			                                                <a href="../order/orderDIY.do" class="type2">주문하기</a>	
			                                            </div> 
			                                        </li>
												</c:forEach>
											</c:otherwise>
										</c:choose>
                                    </ul>
                                </div>
                                
                             	<!-- //////////////////////////////////////////// -->
                             	<!-- 매장상세 모달(motion.js line.124) -->
								<div class="store-detail-modal pop-layer pop-store" id="pop-store">
									<div class="dim"></div>
									<div class="pop-wrap" style="width: 900px; height: 500px">
									<div class="pop-modal2">
										<div class="pop-title-wrap">
											<h2 class="pop-title">매장 상세정보</h2>
										</div>
										<a href="javascript:UI.layerPopUp({selId:'#pop-allergy', st:'close'});" class="btn-close"></a>
										<div class="modal2-con">
										<div class="pop-content">
											<div class="store-view">
												<div class="store-info-box">
													<ul>
														<li>
															<h3 id="b_name">ㅇㅇ점</h3>
															<p class="promotion">
																<span class="type" id="detail_on_sale">온라인 방문포장 30%</span><span class="type2" id="detail_off_sale">오프라인 방문포장 30%</span>
															</p>
															<div class="btn-wrap">
																<a href="../order/orderDIY.do" class="btn-type v3" id="">주문하기</a>
															</div>
														</li>
														<li> 
															<dl>
																<dt></dt>
																<dd></dd>
															</dl>
															<dl>
																<dt>전화번호</dt>
																<dd id="phone">091-996-30525</dd>
															</dl>
															<dl>
																<dt>주소</dt>
																<dd id="address">경기도 김포시 김포한강9로 12번길 97-10</dd>
															</dl>
															<dl>
																<dt>영업시간</dt>
																<dd>11:00 ~ 22:00</dd>
															</dl>
															<dl>
																<dt>주차정보</dt>
																<dd>매장 후면 1대</dd>
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
								<!-- //매장 상세보기 팝업(e) -->
                             	<!-- //////////////////////////////////////////// -->
                                </div>
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
                add = chungnam;
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