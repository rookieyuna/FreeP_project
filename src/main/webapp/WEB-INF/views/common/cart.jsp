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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body id="body">
<script>
	function money(idx){		
		var price = document.getElementById("price_"+idx).innerHTML;
		document.getElementById("price_"+idx).innerHTML = (price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+ "원");			
		var total = document.getElementById("total_"+idx).innerHTML;
		document.getElementById("total_"+idx).innerHTML = (total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원");
	}
	function money1(idx){		
		var price = document.getElementById("pricediy_"+idx).innerHTML;
		document.getElementById("pricediy_"+idx).innerHTML = (price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+ "원");
		var total = document.getElementById("totaldiy_"+idx).innerHTML;
		document.getElementById("totaldiy_"+idx).innerHTML = (total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원");
	}
	function sum(){		
		var sum = document.getElementById("sum").innerText;
		document.getElementById("sum").innerText = (sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	}
	
$(function(){
		//해당 버튼을 눌렀을때 ajax메서드를 호출한다. 
		$('#btnBoard').click(function(){
			
			//리스트를 요청했을때 loading이미지를 보임처리한다. 
			$('#loading').show();		
			
			$.ajax({
				type : 'get', //전송방식
				url : '../restapi/boardList.do', //요청URL 
				data : {nowPage : $('#nowPage').val()}, //파라미터
				contentType : "text/html;charset:utf-8", 
				dataType : "json", //콜백 데이터 타입
				success : sucCallBack, //요청에 성공했을때 호출되는 콜백 함수
				error : errCallBack //실패했을때의 콜백 함수
			});
		});
		/*
		trigger() 함수는 특정 이벤트를 자동으로 발생시켜준다. 
		아래의경우 페이지가 로드되면 해당 버튼을 클릭해준다. 
		*/
		$('#btnBoard').trigger('click');
});	
	

</script>
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
                                    <c:forEach items="${lists }" var="row"> 
                                    <input type="hidden" id="Oprice_${row.ct_idx}" value="${row.p_price }" />  
                                    <!-- 일반제품일경우 -->
                                    <li class="row" id="sold-out0">
                                        <div class="sold-out-btn" id="sold-out-btn0" style="display:none">
                                            <p>Sold Out</p>
                                            <a href="javascript:changeGoodsCnt('delete',0,'RPZ253HL', '1', 1, 0);"
                                                class="btn-type4-brd3">삭제</a>
                                        </div>
                                        <div class="prd-info">
                                            <div class="prd-img">
                                                <img src="../uploads/${row.p_sfile }"
                                                    alt="${row.ct_name }"
                                                    onerror="this.src='https://cdn.dominos.co.kr/admin/upload/goods/goods_default.jpg'">
                                            </div>
                                            <div class="prd-cont">
                                                <div class="subject">${row.ct_name }</div>
                                                <div class="option">
                                                    <input type="hidden" name="pizza" value="1">
                                                    ${row.p_size}</div>
                                                <div class="price" id="price_${row.ct_idx }">
                                                  ${row.p_price }
                                                </div>
                                            </div>
                                        </div>

                                        <div class="prd-option">
                                        <!-- 토핑옵션 -->
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
                                        <div class="prd-total" id="total_${row.ct_idx }">
                                            <em>${row.p_price }</em>
                                        </div>
                                        <div class="prd-delete">
                                            <a href="javascript:changeGoodsCnt('delete',0,'RPZ253HL', '1', 1, 0);"
                                                class="btn-close">
                                                <span class="hidden">삭제</span>
                                            </a>
                                        </div>
                                    </li>
                                    <script>money(${row.ct_idx });</script>
                                    </c:forEach>
                                    
                                    <c:forEach items="${listsdiy }" var="row" varStatus="status">   
                                    <!-- diy피자 -->
                                    <li class="row" id="sold-out0">
                                        <div class="sold-out-btn" id="sold-out-btn0" style="display:none">
                                            <p>Sold Out</p>
                                            <a href="javascript:changeGoodsCnt('delete',0,'RPZ253HL', '1', 1, 0);"
                                                class="btn-type4-brd3">삭제</a>
                                        </div>
                                        <div class="prd-info">
                                            <div class="prd-img">
                                                <img src="../uploads/${row.p_sfile }"
                                                    alt="${row.ct_name }"
                                                    onerror="this.src='https://cdn.dominos.co.kr/admin/upload/goods/goods_default.jpg'">
                                            </div>
                                            <div class="prd-cont">
                                                <div class="subject">${row.ct_name }</div>
                                                <div class="option">
                                                    <input type="hidden" name="pizza" value="1">
                                                   </div>
                                                <div class="price" id="pricediy_${row.ct_idx }">
                                                ${row.d_price }
                                                </div>
                                            </div>
                                        </div>

                                        <div class="prd-option">
                                        	<div class="subject">+ ${row.dough_name } , ${row.dough_price }, ${row.dough_size }</div>
                                       		<div class="subject">+ ${row.sauce_name } , ${row.sauce_price }, ${row.sauce_size }</div>
                                       		<div class="subject">+ ${row.topping1_name } , ${row.topping1_price }, ${row.topping1_size }</div>
                                        	<c:set var="topping" value="${row.topping2} "/>
                                        	<c:if test="${topping}">
                                         	+ ${row.topping2_name } , ${row.topping2_price }, ${row.topping2_size }
                                        	</c:if>
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
                                        <div class="prd-total" id="totaldiy_${row.ct_idx }" >
                                            <em>${row.d_price }</em>
                                        </div>
                                        <div class="prd-delete">
                                            <a href="javascript:changeGoodsCnt('delete',0,'RPZ253HL', '1', 1, 0);"
                                                class="btn-close">
                                                <span class="hidden">삭제</span>
                                            </a>
                                        </div>
                                    </li>
                                    <script>money1(${row.ct_idx });</script>
                                    </c:forEach> 
                                    <!-- 총 주문 금액 -->
                                    <li class="total-price2 side" >
                                        <p>총 금액 <em id="sum">${sum }</em>원</p>
                                    </li>
                                    
                                    <!-- //총 주문 금액 -->
                                </ul>
                                <script>sum();</script>
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