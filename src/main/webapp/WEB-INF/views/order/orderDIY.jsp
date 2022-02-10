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
                                <li><a href="#">홈</a></li>
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
                                    <li class="active"><a href="../order/orderDIY.do">DIY피자</a></li>
                                    <li><a href="../order/orderNormal.do">기본피자</a></li>
                                    <li><a href="../order/orderSide.do">사이드메뉴</a></li>
                                    <li><a href="../order/orderDrink.do">음료</a></li>
                                </ul>
                            </div>

                        </div>

                        <!-- NEW 피자 영역 -->
                        <div class="title-wrap-center">
                            <h3 class="title-type">
                                DIY 피자
                                <p>나만의 특별한 피자 레시피를 만들어보세요</p>
                            </h3>
                        </div>

                        <div class="menu-list">
                            <div class="menu-cart">
                                <button class="menu-cart-btn">
                                    <span class="material-icons-outlined">
                                        shopping_cart
                                    </span>
                                </button>
                                <div class="menu-cart-modal">
                                    <h4>선택품목</h4>
                                    <table class="cart-modal-wrap">
                                        <tbody>
                                            <!-- set 시작 -->
                                            <tr class="set">
                                                <td>
                                                    <table class="set-item">
                                                        <tr>
                                                            <td>
                                                                <p class="set-title">오리지날</p>
                                                                <div class="quantity-box">
                                                                    <ul class="size-select">
                                                                        <li class="active"><button class="size-L">L</button></li>
                                                                        <li><button class="size-M">M</button></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td><span class="kcal">124</span></td>
                                                            <td><span class="won">2,000</span></td>
                                                        </tr>
                                                    </table>
                                                    <table class="set-item">
                                                        <tr>
                                                            <td>갈릭소스</td><td><span class="kcal">124</span></td><td><span class="won">2,000</span></td>
                                                        </tr>
                                                        <tr>
                                                            <td>양상추</td><td><span class="kcal">124</span></td><td><span class="won">2,000</span></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            
                                            <tr class="set">
                                                <td>
                                                    <table class="set-item">
                                                        <tr>
                                                            <td>
                                                                <p class="set-title">오리지날</p>
                                                                <div class="quantity-box">
                                                                    <ul class="size-select">
                                                                        <li class="active"><button class="size-L">L</button></li>
                                                                        <li><button class="size-M">M</button></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td><span class="kcal">124</span></td>
                                                            <td><span class="won">2,000</span></td>
                                                        </tr>
                                                    </table>
                                                    <table class="set-item">
                                                        <tr>
                                                            <td>양상추</td><td><span class="kcal">124</span></td><td><span class="won">2,000</span></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>

                                            <tr class="set">
                                                <td>
                                                    <table class="set-item">
                                                        <tr>
                                                            <td>
                                                                <p class="set-title">오리지날</p>
                                                                <div class="quantity-box">
                                                                    <ul class="size-select">
                                                                        <li class="active"><button class="size-L">L</button></li>
                                                                        <li><button class="size-M">M</button></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td><span class="kcal">124</span></td>
                                                            <td><span class="won">2,000</span></td>
                                                        </tr>
                                                    </table>
                                                    <table class="set-item">
                                                        <tr>
                                                            <td>양상추</td><td><span class="kcal">124</span></td><td><span class="won">2,000</span></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>

                                    <div class="DIY-cart-mypick">
                                        <h5><span>FreeP</span>이런 토핑은 어떠세요?</h5>
                                        <ul>
                                            <li><button>양파</button></li>
                                            <li><button>토마토</button></li>
                                            <li><button>파인애플</button></li>
                                        </ul>
                                    </div>
                                    <div class="fx cart-total">
                                        <h5>총 선택정보</h5>
                                        <p><span class="kcal total">1024</span></p>
                                        <p><span class="won total">22,000</span></p>
                                    </div>
                                    <a href="../order/cart.do" class="cart-btn">장바구니</a>
                                </div>
                            </div>

                            <ul class="DIYmenu fx">
                                <li class="menu-depth dough">
                                    <div class="DIYmenu_section">
                                        도우 ( 필수선택 )
                                    </div>
                                    <ul class="DIYmenu_section_list">
                                        <li class="">
                                            <div class="prd-img">
                                                <div>
                                                    <img class="lazyload"
                                                        src="../images/04product/04topping/pizzaDough01-removebg-preview.png" alt="#">
                                                </div>
                                                <button class="btn-detail">
                                                    <i class="DIYmenu-detail">
                                                        <span class="material-icons info">
                                                            info
                                                        </span>
                                                    </i>
                                                    <span class="hidden">상세버튼</span>
                                                </button>
                                            </div>
        
                                            <div class="prd-cont">
                                                <div class="subject">
                                                    <div class="label-box">
                                                        <span class="label limit">기간한정</span>
                                                    </div>
                                                    <div>오리지날</div>
                                                </div>
                                                <div class="prd-origin">
                                                    <p><span>원산지 : </span>국내산</p>
                                                </div>
                                            </div>
        
                                            <div class="prd-price">
                                                <div class="price-box">
                                                    <span class="price">5,900원&nbsp;</span>
                                                </div>
                                            </div>
                                        </li>

                                        <li>
                                            <div class="prd-img">
                                                <div>
                                                    <img class="lazyload"
                                                        src="../images/04product/04topping/pizzaDough01-removebg-preview.png" alt="#">
                                                </div>
                                                <button class="btn-detail">
                                                    <i class="DIYmenu-detail">
                                                        <span class="material-icons info">
                                                            info
                                                        </span>
                                                    </i>
                                                    <span class="hidden">상세버튼</span>
                                                </button>
                                            </div>
        
                                            <div class="prd-cont">
                                                <div class="subject">
                                                    <div class="label-box">
                                                        <span class="label limit">기간한정</span>
                                                    </div>
                                                    <div>나폴리</div>
                                                </div>
                                                <div class="prd-origin">
                                                    <p><span>원산지 : </span>국내산</p>
                                                </div>
                                            </div>
        
                                            <div class="prd-price">
                                                <div class="price-box">
                                                    <span class="price">5,900원&nbsp;</span>
                                                </div>
                                            </div>
                                        </li>

                                    </ul>
                                </li>

                                <li class="menu-depth sauce">
                                    <div class="DIYmenu_section">
                                        소스 ( 필수선택 )
                                    </div>
                                    <ul class="DIYmenu_section_list">
                                        <li>
                                            <div class="prd-img">
                                                <div>
                                                    <img class="lazyload"
                                                        src="../images/04product/04topping/DIY_t_001.png" alt="#">
                                                </div>
                                                <button class="btn-detail">
                                                    <i class="DIYmenu-detail">
                                                        <span class="material-icons info">
                                                            info
                                                        </span>
                                                    </i>
                                                    <span class="hidden">상세버튼</span>
                                                </button>
                                            </div>
        
                                            <div class="prd-cont">
                                                <div class="subject">
                                                    <div class="label-box">
                                                        <span class="label limit">기간한정</span>
                                                    </div>
                                                    <div>닭가슴살</div>
                                                </div>
                                                <div class="prd-origin">
                                                    <p><span>원산지 : </span>국내산</p>
                                                </div>
                                            </div>
        
                                            <div class="prd-price">
                                                <div class="price-box">
                                                    <span class="price">5,900원&nbsp;</span>
                                                </div>
                                            </div>
                                        </li>

                                        <li>
                                            <div class="prd-img">
                                                <div>
                                                    <img class="lazyload"
                                                        src="../images/04product/04topping/DIY_t_001.png" alt="#">
                                                </div>
                                                <button class="btn-detail">
                                                    <i class="DIYmenu-detail">
                                                        <span class="material-icons info">
                                                            info
                                                        </span>
                                                    </i>
                                                    <span class="hidden">상세버튼</span>
                                                </button>
                                            </div>
        
                                            <div class="prd-cont">
                                                <div class="subject">
                                                    <div class="label-box">
                                                        <span class="label limit">기간한정</span>
                                                    </div>
                                                    <div>닭가슴살</div>
                                                </div>
                                                <div class="prd-origin">
                                                    <p><span>원산지 : </span>국내산</p>
                                                </div>
                                            </div>
        
                                            <div class="prd-price">
                                                <div class="price-box">
                                                    <span class="price">5,900원&nbsp;</span>
                                                </div>
                                            </div>
                                        </li>

                                        <li>
                                            <div class="prd-img">
                                                <div>
                                                    <img class="lazyload"
                                                        src="../images/04product/04topping/DIY_t_001.png" alt="#">
                                                </div>
                                                <button class="btn-detail">
                                                    <i class="DIYmenu-detail">
                                                        <span class="material-icons info">
                                                            info
                                                        </span>
                                                    </i>
                                                    <span class="hidden">상세버튼</span>
                                                </button>
                                            </div>
        
                                            <div class="prd-cont">
                                                <div class="subject">
                                                    <div class="label-box">
                                                        <span class="label limit">기간한정</span>
                                                    </div>
                                                    <div>닭가슴살</div>
                                                </div>
                                                <div class="prd-origin">
                                                    <p><span>원산지 : </span>국내산</p>
                                                </div>
                                            </div>
        
                                            <div class="prd-price">
                                                <div class="price-box">
                                                    <span class="price">5,900원&nbsp;</span>
                                                </div>
                                            </div>
                                        </li>

                                        <li>
                                            <div class="prd-img">
                                                <div>
                                                    <img class="lazyload"
                                                        src="../images/04product/04topping/DIY_t_001.png" alt="#">
                                                </div>
                                                <button class="btn-detail">
                                                    <i class="DIYmenu-detail">
                                                        <span class="material-icons info">
                                                            info
                                                        </span>
                                                    </i>
                                                    <span class="hidden">상세버튼</span>
                                                </button>
                                            </div>
        
                                            <div class="prd-cont">
                                                <div class="subject">
                                                    <div class="label-box">
                                                        <span class="label limit">기간한정</span>
                                                    </div>
                                                    <div>닭가슴살</div>
                                                </div>
                                                <div class="prd-origin">
                                                    <p><span>원산지 : </span>국내산</p>
                                                </div>
                                            </div>
        
                                            <div class="prd-price">
                                                <div class="price-box">
                                                    <span class="price">5,900원&nbsp;</span>
                                                </div>
                                            </div>
                                        </li>

                                        <li>
                                            <div class="prd-img">
                                                <div>
                                                    <img class="lazyload"
                                                        src="../images/04product/04topping/DIY_t_001.png" alt="#">
                                                </div>
                                                <button class="btn-detail">
                                                    <i class="DIYmenu-detail">
                                                        <span class="material-icons info">
                                                            info
                                                        </span>
                                                    </i>
                                                    <span class="hidden">상세버튼</span>
                                                </button>
                                            </div>
        
                                            <div class="prd-cont">
                                                <div class="subject">
                                                    <div class="label-box">
                                                        <span class="label limit">기간한정</span>
                                                    </div>
                                                    <div>닭가슴살</div>
                                                </div>
                                                <div class="prd-origin">
                                                    <p><span>원산지 : </span>국내산</p>
                                                </div>
                                            </div>
        
                                            <div class="prd-price">
                                                <div class="price-box">
                                                    <span class="price">5,900원&nbsp;</span>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </li>

                                <li class="menu-depth">
                                    <div class="DIYmenu_section">
                                        토핑 ( 최대 5개 )
                                    </div>
                                    <ul class="DIYmenu_section_list topping">
                                        <li>
                                            <div class="prd-img">
                                                <div>
                                                    <img class="lazyload"
                                                        src="../images/04product/04topping/DIY_t_001.png" alt="#">
                                                </div>
                                                <button class="btn-detail">
                                                    <i class="DIYmenu-detail">
                                                        <span class="material-icons info">
                                                            info
                                                        </span>
                                                    </i>
                                                    <span class="hidden">상세버튼</span>
                                                </button>
                                            </div>
        
                                            <div class="prd-cont">
                                                <div class="subject">
                                                    <div class="label-box">
                                                        <span class="label limit">기간한정</span>
                                                    </div>
                                                    <div>닭가슴살</div>
                                                </div>
                                                <div class="prd-origin">
                                                    <p><span>원산지 : </span>국내산</p>
                                                </div>
                                            </div>
        
                                            <div class="prd-price">
                                                <div class="price-box">
                                                    <span class="price">5,900원&nbsp;</span>
                                                </div>
                                            </div>
                                        </li>

                                        <li>
                                            <div class="prd-img">
                                                <div>
                                                    <img class="lazyload"
                                                        src="../images/04product/04topping/DIY_t_001.png" alt="#">
                                                </div>
                                                <button class="btn-detail">
                                                    <i class="DIYmenu-detail">
                                                        <span class="material-icons info">
                                                            info
                                                        </span>
                                                    </i>
                                                    <span class="hidden">상세버튼</span>
                                                </button>
                                            </div>
        
                                            <div class="prd-cont">
                                                <div class="subject">
                                                    <div class="label-box">
                                                        <span class="label limit">기간한정</span>
                                                    </div>
                                                    <div>닭가슴살</div>
                                                </div>
                                                <div class="prd-origin">
                                                    <p><span>원산지 : </span>국내산</p>
                                                </div>
                                            </div>
        
                                            <div class="prd-price">
                                                <div class="price-box">
                                                    <span class="price">5,900원&nbsp;</span>
                                                </div>
                                            </div>
                                        </li>

                                        <li>
                                            <div class="prd-img">
                                                <div>
                                                    <img class="lazyload"
                                                        src="../images/04product/04topping/DIY_t_001.png" alt="#">
                                                </div>
                                                <button class="btn-detail">
                                                    <i class="DIYmenu-detail">
                                                        <span class="material-icons info">
                                                            info
                                                        </span>
                                                    </i>
                                                    <span class="hidden">상세버튼</span>
                                                </button>
                                            </div>
        
                                            <div class="prd-cont">
                                                <div class="subject">
                                                    <div class="label-box">
                                                        <span class="label limit">기간한정</span>
                                                    </div>
                                                    <div>닭가슴살</div>
                                                </div>
                                                <div class="prd-origin">
                                                    <p><span>원산지 : </span>국내산</p>
                                                </div>
                                            </div>
        
                                            <div class="prd-price">
                                                <div class="price-box">
                                                    <span class="price">5,900원&nbsp;</span>
                                                </div>
                                            </div>
                                        </li>

                                        <li>
                                            <div class="prd-img">
                                                <div>
                                                    <img class="lazyload"
                                                        src="../images/04product/04topping/DIY_t_001.png" alt="#">
                                                </div>
                                                <button class="btn-detail">
                                                    <i class="DIYmenu-detail">
                                                        <span class="material-icons info">
                                                            info
                                                        </span>
                                                    </i>
                                                    <span class="hidden">상세버튼</span>
                                                </button>
                                            </div>
        
                                            <div class="prd-cont">
                                                <div class="subject">
                                                    <div class="label-box">
                                                        <span class="label limit">기간한정</span>
                                                    </div>
                                                    <div>닭가슴살</div>
                                                </div>
                                                <div class="prd-origin">
                                                    <p><span>원산지 : </span>국내산</p>
                                                </div>
                                            </div>
        
                                            <div class="prd-price">
                                                <div class="price-box">
                                                    <span class="price">5,900원&nbsp;</span>
                                                </div>
                                            </div>
                                        </li>

                                        <li>
                                            <div class="prd-img">
                                                <div>
                                                    <img class="lazyload"
                                                        src="../images/04product/04topping/DIY_t_001.png" alt="#">
                                                </div>
                                                <button class="btn-detail">
                                                    <i class="DIYmenu-detail">
                                                        <span class="material-icons info">
                                                            info
                                                        </span>
                                                    </i>
                                                    <span class="hidden">상세버튼</span>
                                                </button>
                                            </div>
        
                                            <div class="prd-cont">
                                                <div class="subject">
                                                    <div class="label-box">
                                                        <span class="label limit">기간한정</span>
                                                    </div>
                                                    <div>닭가슴살</div>
                                                </div>
                                                <div class="prd-origin">
                                                    <p><span>원산지 : </span>국내산</p>
                                                </div>
                                            </div>
        
                                            <div class="prd-price">
                                                <div class="price-box">
                                                    <span class="price">5,900원&nbsp;</span>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                                <!-- DIY재료 -->
                            </ul>
                            
                            <!-- 제품 list 끝 -->

                            <!-- 제품 info 정보 창 모달 -->
                            <div class="DIY-detail-modal pop-layer pop-menu" id="pop-menu-detail">
                                <div class="dim"></div>
                                <div class="pop-wrap" style="margin-left: -494px; margin-top: -290px;">
                                    <div class="pop-title-wrap">
                                        <div class="pop-title v2">영양성분 및 알레르기 유발성분</div>
                                    </div>
                                    <div class="pop-content">
                                        <div class="tab-type v2 js_tab">
                                            <ul>
                                                <li class="active"><button href="#allergy1">영양성분</button></li>
                                                <li><button href="#allergy2">원산지</button></li>
                                            </ul>
                                        </div>
                                        <div id="allergy1" class="tab-content active">
                                            <div id="allergy1-1" class="tab-content-v2 active">
                                                <div class="table-type v2">
                                                    <img src="../images/04product/04topping/DIY_t_001.png"
                                                        alt="">
                                                    <p>닭가슴살</p>
                                                    <ul class="allergy-table">

                                                        <!-- 영양성분 -->
                                                        <li class="allergy_info1 active">
                                                            <table class="bg-table">
                                                                <caption>재료 영양성분</caption>
                                                                <colgroup>
                                                                    <col width="200px">
                                                                    <col width="*">
                                                                    <col width="*">
                                                                    <col width="*">
                                                                    <col width="*">
                                                                    <col width="*">
                                                                    <col width="*">
                                                                </colgroup>
                                                                <thead>
                                                                    <tr>
                                                                        <th>제품명</th>
                                                                        <th>칼로리 정보</th>
                                                                        <th>단백질</th>
                                                                        <th>칼슘</th>
                                                                        <th>비타민A</th>
                                                                        <th>비타민B1</th>
                                                                        <th>비타민B2</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <tr>
                                                                        <td>닭가슴살</td>
                                                                        <td>174</td>
                                                                        <td>0.75</td>
                                                                        <td>0</td>
                                                                        <td>0.05</td>
                                                                        <td>0.02</td>
                                                                        <td>0.7</td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </li>

                                                        <!--제품 알레르기 유발성분 -->
                                                        <li class="allergy_info2">
                                                            <table class="bg-table">
                                                                <caption>재료 영양성분</caption>
                                                                <colgroup>
                                                                    <col width="200px">
                                                                    <col width="*">
                                                                </colgroup>
                                                                <thead>
                                                                    <tr>
                                                                        <th>제품명</th>
                                                                        <th>원산지 정보</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <tr>
                                                                        <td>닭가슴살</td>
                                                                        <td>국내산</td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </li>
                                                    </ul>

                                                </div>
                                            </div>
                                        </div>
                                        <a href="javascript:UI.layerPopUp({selId:'#pop-allergy', st:'close'});"
                                            class="btn-close"></a>
                                    </div>
                                </div>
                            </div>
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
  <script src="../js/ui.js"></script>
  
</body>

</html>