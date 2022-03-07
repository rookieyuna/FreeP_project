<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

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
    <link rel="stylesheet" href="../style/order.css">
    <link rel="stylesheet" href="../style/layout.css">
    <link rel="stylesheet" href="../style/responsive.css">
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
</script>
<script>
	


	function fn_delete(idx){
	    if(!confirm("삭제를 하시겠습니까?"))
	    return false;
	    	    
	    var token = $("meta[name='_csrf']").attr("content");
	    var header = $("meta[name='_csrf_header']").attr("content");
	 
	     $.ajax({ 
	            url: "../order/delete_action.do", 
	            type: "POST", 
	            beforeSend : function(xhr){
	        		xhr.setRequestHeader(header, token);
	            },
	            async:false,
	            data: {"idx":idx},
	            dataType : "text",
	            success : function(){
	            	//이거 수정해야댐.. 새로고침되버려서
	            	/* document.location.reload(true);   */        	
	            	$("#cart-list").load(window.location.href + "#cart-list"); 
	            },
	            error : function(request,statue,error){
	            	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"
	            			+"\n"+"error:"+error)
	            	
	            }
	            });
	            
	}
	 

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
                                            <a href="javascript:void(0)" onclick="fn_delete(${row.ct_idx});"
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
                                            <a href="javascript:void(0)" onclick="fn_delete('${row.ct_idx}');"
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