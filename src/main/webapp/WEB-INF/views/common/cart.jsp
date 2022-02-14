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
        <%@ include file="./header.jsp" %>
    </header>

    <div id="container">
        <div class="cont-wrap">
            <div class="sub-type cart">
                <div class="inner-box">
                    <div class="page-title-wrap">
                        <h2 class="page-title">장바구니</h2>
                        <div class="depth-area">
                            <ol>
                                <li><a href="/main">홈</a></li>
                                <li><strong>장바구니</strong></li>
                            </ol>
                        </div>
                    </div>
                    <article class="cart-area pay">
                        
                        <!-- 주문 내역 -->
                        <div class="step-wrap">

                            <!-- 주소 -->
                            <div class="step-wrap">
                                <div class="title-wrap">
                                    <h3 class="title-type"><strong>주문방식</strong></h3>
                                </div>
                                <div class="deli-info">
                                    <div class="chk-wrap">
                                        <div class="chk-box selected">
                                            <input type="radio" id="order_delivery" name="order_how" value="D"
                                                checked="checked">
                                            <label class="checkbox" for="order_delivery"></label>
                                            <label for="order_delivery">배달주문</label>
                                        </div>
                                        <div class="chk-box">
                                            <input type="radio" id="order_packaging" name="order_how" value="P">
                                            <label class="checkbox" for="order_packaging"></label>
                                            <label for="order_packaging">포장주문</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- //주소 -->
                            
                            <div class="title-wrap">
                                <h3 class="title-type">
                                    <strong>주문내역</strong>
                                </h3>
                                <span class="summary side">
                                    <a href="javascript:allDelete();">전체 삭제</a>
                                </span>
                            </div>
                            <div class="cart-list">
                                <ul>
                                    <li class="category">
                                        <div>상품정보</div>
                                        <div>추가토핑</div>
                                        <div>수량</div>
                                        <div>금액</div>
                                        <div></div>
                                    </li>
                                    <li class="row" id="sold-out0">
                                        <div class="sold-out-btn" id="sold-out-btn0" style="display:none">
                                            <p>Sold Out</p>
                                            <a href="javascript:changeGoodsCnt('delete',0,'RPZ253HL', '1', 1, 0);"
                                                class="btn-type4-brd3">삭제</a>
                                        </div>
                                        <div class="prd-info">
                                            <div class="prd-img">
                                                <img src="https://cdn.dominos.co.kr/admin/upload/goods/20220113_IFF5qj8e.jpg"
                                                    alt="새해 복 만두"
                                                    onerror="this.src='https://cdn.dominos.co.kr/admin/upload/goods/goods_default.jpg'">
                                            </div>
                                            <div class="prd-cont">
                                                <div class="subject">새해 복 만두</div>
                                                <div class="option">
                                                    <input type="hidden" name="pizza" value="1">
                                                    씬 /L</div>
                                                <div class="price">
                                                    26,900원
                                                </div>
                                            </div>
                                        </div>

                                        <div class="prd-option">
                                        </div>
                                        <div class="prd-quantity">
                                            <div class="quantity-box v2">
                                                <a href="javascript:void(0);"
                                                    onclick="changeGoodsCnt('minus',0,'RPZ253HL', '1', 1, -1);"
                                                    class="minus"><button class="btn-minus"></button></a>
                                                <input type="number" class="qty0" id="qty0" value="1" readonly="">
                                                <a href="javascript:void(0);"
                                                    onclick="changeGoodsCnt('plus',0,'RPZ253HL', '1', 1, 1);"
                                                    class="plus"><button class="btn-plus"></button></a>
                                            </div>
                                        </div>
                                        <div class="prd-total">
                                            <em>26,900</em>원
                                        </div>
                                        <div class="prd-delete">
                                            <a href="javascript:changeGoodsCnt('delete',0,'RPZ253HL', '1', 1, 0);"
                                                class="btn-close">
                                                <span class="hidden">삭제</span>
                                            </a>
                                        </div>
                                    </li>
                                    
                                    <input type="hidden" name="quickGoodsUseYN" value="N">
                                    <li class="row" id="sold-out1">
                                        <div class="sold-out-btn" id="sold-out-btn1" style="display:none">
                                            <p>Sold Out</p>
                                            <a href="javascript:changeGoodsCnt('delete',1,'SST133A1_HP93', '1', 1, 0);"
                                                class="btn-type4-brd3">삭제</a>
                                        </div>
                                        <div class="prd-info">
                                            <div class="prd-img">
                                                <img src="https://cdn.dominos.co.kr/admin/upload/goods/goods_default.jpg"
                                                    alt="[반값] 블랙앵거스 스테이크 피자 라이스볼 반값"
                                                    onerror="this.src='https://cdn.dominos.co.kr/admin/upload/goods/goods_default.jpg'">
                                            </div>
                                            <div class="prd-cont">
                                                <div class="subject">[반값] 블랙앵거스 스테이크 피자 라이스볼 반값</div>
                                                <div class="price">
                                                    5,400원
                                                </div>
                                            </div>
                                        </div>

                                        <div class="prd-option">
                                        </div>
                                        <div class="prd-quantity">
                                            <div class="quantity-box v2">
                                                <a href="javascript:void(0);"
                                                    onclick="changeGoodsCnt('minus',1,'SST133A1_HP93', '1', 1, -1);"
                                                    class="minus"><button class="btn-minus"></button></a>
                                                <input type="number" class="qty1" id="qty1" value="1" readonly="">
                                                <a href="javascript:void(0);"
                                                    onclick="changeGoodsCnt('plus',1,'SST133A1_HP93', '1', 1, 1);"
                                                    class="plus"><button class="btn-plus"></button></a>
                                            </div>
                                        </div>
                                        <div class="prd-total">
                                            <em>5,400</em>원
                                        </div>
                                        <div class="prd-delete">
                                            <a href="javascript:changeGoodsCnt('delete',1,'SST133A1_HP93', '1', 1, 0);"
                                                class="btn-close">
                                                <span class="hidden">삭제</span>
                                            </a>
                                        </div>
                                    </li>
                                    <li class="row" id="sold-out2">
                                        <div class="sold-out-btn" id="sold-out-btn2" style="display:none">
                                            <p>Sold Out</p>
                                            <a href="javascript:changeGoodsCnt('delete',2,'RDK028L1', '1', 1, 0);"
                                                class="btn-type4-brd3">삭제</a>
                                        </div>
                                        <div class="prd-info">
                                            <div class="prd-img">
                                                <img src="https://cdn.dominos.co.kr/admin/upload/goods/20210226_6Uq69TSp.jpg"
                                                    alt="캐나다 드라이 진저 에일 250ML"
                                                    onerror="this.src='https://cdn.dominos.co.kr/admin/upload/goods/goods_default.jpg'">
                                            </div>
                                            <div class="prd-cont">
                                                <div class="subject">캐나다 드라이 진저 에일 250ML</div>
                                                <input type="hidden" name="drink" value="1">
                                                <div class="price">
                                                    1,000원
                                                </div>
                                            </div>
                                        </div>

                                        <div class="prd-option">
                                        </div>
                                        <div class="prd-quantity">
                                            <div class="quantity-box v2">
                                                <a href="javascript:void(0);"
                                                    onclick="changeGoodsCnt('minus',2,'RDK028L1', '1', 1, -1);"
                                                    class="minus"><button class="btn-minus"></button></a>
                                                <input type="number" class="qty2" id="qty2" value="1" readonly="">
                                                <a href="javascript:void(0);"
                                                    onclick="changeGoodsCnt('plus',2,'RDK028L1', '1', 1, 1);"
                                                    class="plus"><button class="btn-plus"></button></a>
                                            </div>
                                        </div>
                                        <div class="prd-total">
                                            <em>1,000</em>원
                                        </div>
                                        <div class="prd-delete">
                                            <a href="javascript:changeGoodsCnt('delete',2,'RDK028L1', '1', 1, 0);"
                                                class="btn-close">
                                                <span class="hidden">삭제</span>
                                            </a>
                                        </div>
                                    </li>
                                    <!-- 총 주문 금액 -->
                                    <li class="total-price2 side">
                                        <p>총 금액 <em>33,300</em>원</p>
                                    </li>
                                    <!-- //총 주문 금액 -->
                                </ul>
                            </div>
                        </div>
                        <!-- //주문 내역 -->

                        <!-- 주문하기 버튼 -->

                        <div class="btn-wrap cart-order">
                            <a href="../order/order.do" class="btn-type v3">주문하기</a>
                        </div>
                        <!-- //주문하기 버튼 -->
                        <div class="info-wrap">
                            <div class="title-wrap">
                                <div class="title-type2">유의사항</div>
                            </div>
                            <div class="cont-wrap">
                                <ul class="list-text-v3">
                                    <li>* 돼지가 되어갑니다 고객님.</li>
                                    <li>* 피클&amp;소스 기본 제공은 하는데 소스 찍으면 칼로리 아시죠?</li>
                                </ul>
                            </div>
                        </div>

                    </article>
                </div>
            </div>
        </div>
    </div>

    <footer id="footer">
        <%@ include file="./footer.jsp" %>
    </footer>


     <!-- script area -->
     <script src="../js/includeHTML.js"></script>
     <script>includeHTML();</script>
     
     <script src="../js/motion.js"></script>
     <script src="../js/ui.js"></script>
</body>

</html>