<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link rel="stylesheet" href="../style/order.css">
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
                        <h2 class="page-title">주문하기</h2>
                        <div class="depth-area">
                            <ol>
                                <li><a href="/main">홈</a></li>
                                <li><strong>주문하기</strong></li>
                            </ol>
                        </div>
                    </div>
                    <!-- //1depth 메뉴명 & 네비게이션 -->

                    <article class="menu-list-area">
                        <!-- menu-list -->
                        <div class="menu-nav-wrap">
                            <div class="menu-nav">
                                <ul>
                                    <li><a href="../order/orderDIY.do">DIY피자</a></li>
                                    <li class="active"><a href="../order/orderNormal.do">기본피자</a></li>
                                    <li><a href="../order/orderSide.do">사이드메뉴</a></li>
                                    <li><a href="../order/orderDrink.do">음료</a></li>
                                </ul>
                            </div>
                        </div>


						  <div class="otherMenu menu-list">
                            <div class="menu-cart">
                                <button class="menu-cart-btn">
                                    <span class="material-icons-outlined">
                                        shopping_cart
                                    </span>
                                </button>
                                <div class="menu-cart-modal">
                                    <h4>선택품목</h4>
                                    <form action="./insertCart.do" id="insertCart" name="insertCart" method="post" onsubmit="" >
                                    <input type="hidden"
										name="${_csrf.parameterName}"
										value="${_csrf.token}"/>
                                    <table class="cart-modal-wrap">
                                        <tbody>
                                           
                                        </tbody>
                                    </table>
									</form>
                                    <div class="DIY-cart-mypick">
                                        <h5><span>FreeP</span>이런 토핑은 어떠세요?</h5>
                                        <ul>
                                            <li><button>양파</button></li>
                                            <li><button>토마토</button></li>
                                            <li><button>파인애플</button></li>
                                        </ul>
                                    </div>
                                    <div class="fx cart-total">
                                        <p><span>총 선택정보</span><span class="kcal total">0</span><span class="won total">0</span></p>
                                    </div>
                                    <button type="submit" class="cart-btn" form="insertCart">장바구니 담기</button>
                                </div>
                            </div>

							
							<c:choose>
							<c:when test="${empty lists }">
								<div>아무것도 없어요</div>
							</c:when>
                                
                            <c:otherwise>

                            <div class="title-wrap-center">
                                <h3 class="title-type">
                                    스페셜 에디션
                                </h3>
                            </div>

                            <ul class="NORMALmenu now-product normalPizza">
                                <!-- 피자&사이드 -->
							<c:forEach items="${lists }" var="row" begin="0" step="2">
							<c:if test="${row.g_code eq 1}">	
							<c:if test="${fn:contains(row.p_code, '111100')}">
                                <li class="select-item">
                                    <div class="prd-img">
                                        <img class="lazyload"
                                            src="../uploads/../uploads/../uploads/${row.p_sfile }"
                                            alt="${row.p_name }">
                                    </div>
                                    <div class="prd-cont">
                                        <div class="subject">
                                            <input type="text" value="${row.p_code }" class="order-code">
                                            <div class="order-name">${row.p_name }</div>
                                            <div class="label-box">
                                                <span class="label limit">기간한정</span>
                                            </div>
                                        </div>
                                        <div class="prd-origin">
                                            <p style="display:none;"><span class="kcal info1">${row.p_info1 }</span><span class="kcal info2">${row.p_info }</span></p>
                                        </div>
                                    </div>
                                    <div class="prd-price">
                                        <div class="price-box">
                                            <span class="size_l">${row.p_size1 }</span><span class="price1 won"><fmt:formatNumber value="${row.p_price1 }" pattern="#,###" /></span>
                                            <span class="size_m">${row.p_size }</span><span class="price2 won"><fmt:formatNumber value="${row.p_price }" pattern="#,###" /></span>
                                        </div>
                                    </div>
                                    <div class="hashtag">
                                        <span># 기가막혀 이맛이야!</span>
                                        <span># 불고기 + 오리지날 도우 + 치즈</span>
                                    </div>
                                </li>
                            </c:if>
							</c:if>
							</c:forEach>

                                <!-- //피자&사이드 -->
                            </ul>
    

                            <div class="title-wrap-center">
                                <h3 class="title-type">
                                    프리미엄
                                </h3>
                            </div>
							
                            <ul class="NORMALmenu now-product normalPizza">
                                <!-- 피자&사이드 -->
 							<c:forEach items="${lists }" var="row" begin="0" step="2">
							<c:if test="${row.g_code eq 1}">	
							<c:if test="${fn:contains(row.p_code, '111101')}">
                                <li class="select-item">
                                    <div class="prd-img">
                                        <img class="lazyload"
                                            src="../uploads/../uploads/../uploads/${row.p_sfile }"
                                            alt="${row.p_name }">
                                    </div>
                                    <div class="prd-cont">
                                        <div class="subject">
                                            <input type="text" value="${row.p_code }" class="order-code">
                                            <div class="order-name">${row.p_name }</div>
                                            <div class="label-box">
                                                <span class="label limit">기간한정</span>
                                            </div>
                                        </div>
                                        <div class="prd-origin">
                                            <p style="display:none;"><span class="kcal info1">${row.p_info1 }</span><span class="kcal info2">${row.p_info }</span></p>
                                        </div>
                                    </div>
                                    <div class="prd-price">
                                        <div class="price-box">
                                            <span class="size_l">${row.p_size1 }</span><span class="price1 won"><fmt:formatNumber value="${row.p_price1 }" pattern="#,###" /></span>
                                            <span class="size_m">${row.p_size }</span><span class="price2 won"><fmt:formatNumber value="${row.p_price }" pattern="#,###" /></span>
                                        </div>
                                    </div>
                                    <div class="hashtag">
                                        <span># 기가막혀 이맛이야!</span>
                                        <span># 불고기 + 오리지날 도우 + 치즈</span>
                                    </div>
                                </li>
                            </c:if>
							</c:if>
							</c:forEach>
                                <!-- //피자&사이드 -->
                            </ul>


                            <div class="title-wrap-center">
                                <h3 class="title-type">
                                    하프앤하프 시그니처
                                </h3>
                            </div>

                            <ul class="NORMALmenu now-product normalPizza">
                                <!-- 피자&사이드 -->
							<c:forEach items="${lists }" var="row" begin="0" step="2">
							<c:if test="${row.g_code eq 1}">	
							<c:if test="${fn:contains(row.p_code, '111102')}">
                                <li class="select-item">
                                    <div class="prd-img">
                                        <img class="lazyload"
                                            src="../uploads/../uploads/../uploads/${row.p_sfile }"
                                            alt="${row.p_name }">
                                    </div>
                                    <div class="prd-cont">
                                        <div class="subject">
                                            <input type="text" value="${row.p_code }" class="order-code">
                                            <div class="order-name">${row.p_name }</div>
                                            <div class="label-box">
                                                <span class="label limit">기간한정</span>
                                            </div>
                                        </div>
                                        <div class="prd-origin">
                                            <p style="display:none;"><span class="kcal info1">${row.p_info1 }</span><span class="kcal info2">${row.p_info }</span></p>
                                        </div>
                                    </div>
                                    <div class="prd-price">
                                        <div class="price-box">
                                            <span class="size_l">${row.p_size1 }</span><span class="price1 won"><fmt:formatNumber value="${row.p_price1 }" pattern="#,###" /></span>
                                            <span class="size_m">${row.p_size }</span><span class="price2 won"><fmt:formatNumber value="${row.p_price }" pattern="#,###" /></span>
                                        </div>
                                    </div>
                                    <div class="hashtag">
                                        <span># 기가막혀 이맛이야!</span>
                                        <span># 불고기 + 오리지날 도우 + 치즈</span>
                                    </div>
                                </li>
                            </c:if>
							</c:if>
							</c:forEach>
                                <!-- //피자&사이드 -->
                            </ul>


                            <div class="title-wrap-center">
                                <h3 class="title-type">
                                    클래식
                                </h3>
                            </div>

                            <ul class="NORMALmenu now-product normalPizza">
                                <!-- 피자&사이드 -->
							<c:forEach items="${lists }" var="row" begin="0" step="2">
							<c:if test="${row.g_code eq 1}">	
							<c:if test="${fn:contains(row.p_code, '111103')}">
                                <li class="select-item">
                                    <div class="prd-img">
                                        <img class="lazyload"
                                            src="../uploads/../uploads/../uploads/${row.p_sfile }"
                                            alt="${row.p_name }">
                                    </div>
                                    <div class="prd-cont">
                                        <div class="subject">
                                            <input type="text" value="${row.p_code }" class="order-code">
                                            <div class="order-name">${row.p_name }</div>
                                            <div class="label-box">
                                                <span class="label limit">기간한정</span>
                                            </div>
                                        </div>
                                        <div class="prd-origin">
                                            <p style="display:none;"><span class="kcal info1">${row.p_info1 }</span><span class="kcal info2">${row.p_info }</span></p>
                                        </div>
                                    </div>
                                    <div class="prd-price">
                                        <div class="price-box">
                                            <span class="size_l">${row.p_size1 }</span><span class="price1 won"><fmt:formatNumber value="${row.p_price1 }" pattern="#,###" /></span>
                                            <span class="size_m">${row.p_size }</span><span class="price2 won"><fmt:formatNumber value="${row.p_price }" pattern="#,###" /></span>
                                        </div>
                                    </div>
                                    <div class="hashtag">
                                        <span># 기가막혀 이맛이야!</span>
                                        <span># 불고기 + 오리지날 도우 + 치즈</span>
                                    </div>
                                </li>
                            </c:if>
							</c:if>
							</c:forEach>
                                <!-- //피자&사이드 -->
                            </ul>
                            
                            </c:otherwise>
                            </c:choose>
                            
                        </div>

                        <!-- //NEW 피자 영역 -->

                    </article>

                    <div class="bottom-guide-area">
                        <div class="box">
                            <div class="list-text">
                                <dt>※ 유의사항</dt>
                                <dd>
                                    <ul>
                                        <li>단종으로 인한 상품권 사용 안내 : 동일 가격 또는 더 높은 가격의 제품으로 대체 주문 가능<br>
                                            (상품권에 명시된 제품보다 더 높은 가격대의 제품 주문 시, 금액 추가 발생)<br>
                                            (단, 상품권에 명시된 제품보다 저렴한 제품 주문 시 발생하는 차액에 대해서는 환불 처리 불가)</li>
                                        <li>
                                            일부 리조트 및 특수매장은 상기 가격과 차이가 있음</li>
                                        <li>모든 사진은 이미지 컷이므로 실제 제품과 다를 수 있습니다.</li>
                                    </ul>
                                </dd>
                            </div>
                        </div>
                        <div class="box">
                            <p class="text-type">제품의 영양성분 및 알레르기 유발성분을 먼저 확인하세요.</p>
                            <div class="btn-wrap2">
                                <a href="javascript:UI.layerPopUp({selId:'#pop-allergy', url:'/contents/ingredient'})"
                                    class="btn-type-left">영양성분 및 알레르기 유발성분</a>
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
  <script src="../js/cartMotion.js"></script>
  <script src="../js/ui.js"></script>
  

</body>

</html>