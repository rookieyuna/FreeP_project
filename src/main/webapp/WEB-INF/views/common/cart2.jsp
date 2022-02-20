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
	            	viewlists();
	            },
	            error : function(request,statue,error){
	            	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"
	            			+"\n"+"error:"+error)
	            	
	            }
	            });
	            
	}
</script>
<script>
	function fn_deleteall(){
	    if(!confirm("삭제를 하시겠습니까?"))
	    return false;
	    	    
	    var token = $("meta[name='_csrf']").attr("content");
	    var header = $("meta[name='_csrf_header']").attr("content");
	 
	     $.ajax({ 
	            url: "../order/deleteall_action.do", 
	            type: "POST", 
	            beforeSend : function(xhr){
	        		xhr.setRequestHeader(header, token);
	            },
	            async:false,
	            dataType : "text",
	            success : function(){      	
	            	viewlists();
	            },
	            error : function(request,statue,error){
	            	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"
	            			+"\n"+"error:"+error)
	            	
	            }
	            });
	            
	}
</script>
<script>
function fn_update(idx, num, org){
	if((org+num) < 1){
		return false;
	}
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    
 
     $.ajax({ 
            url: "../order/update_action.do", 
            type: "POST", 
            beforeSend : function(xhr){
        		xhr.setRequestHeader(header, token);
            },
            async:false,
            data: {"idx":idx,
            	"num" : num,
            	"org" : org},
            dataType : "text",
            success : function(){
      	
            	viewlists();
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
                                    <a href="javascript:fn_deleteall();">전체 삭제</a>
                                </span>
                            </div>
                             <div class="cart-list" id="cart-list">                                   
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
<script>
 $(document).ready(function() {
	viewlists();
}); 
	function viewlists(){
	
		
		var token = $("meta[name='_csrf']").attr("content");
	    var header = $("meta[name='_csrf_header']").attr("content");
	    
		$.ajax({
			url: "cart1.do", 
            type: "POST", 
            beforeSend : function(xhr){
        		xhr.setRequestHeader(header, token);
            },
            async:false,
            dataType : "json",
            success : function(data){
            	
            	
            	var listsdiy = data.listsdiy;
            	var lists = data.lists;
            	var sum = data.sum;
            	var tableData="";
            	tableData += ' <ul><li class="category"><div>상품정보</div><div>추가토핑</div><div>수량</div><div>금액</div><div></div></li>';
            	$.each(lists,function(key, value){
            		
            		tableData += '<input type="hidden" id="Oprice_'+value.ct_idx+'" value="'+value.p_price +'" />  ';		            
                    tableData += '<li class="row" id="sold-out0"><div class="sold-out-btn" id="sold-out-btn0" style="display:none"><p>Sold Out</p><a href=""class="btn-type4-brd3">삭제</a>';     
                    tableData +='     </div> <div class="prd-info"> <div class="prd-img">';
                    tableData +='            <img src="../uploads/'+value.p_sfile +'"  alt="'+value.ct_name +'" ';
                    tableData +='  onerror="this.src='+"'https://cdn.dominos.co.kr/admin/upload/goods/goods_default.jpg'"+'">';
                    tableData +=' </div><div class="prd-cont"><div class="subject">'+value.ct_name +'</div> <div class="option">';
                    tableData +=' <input type="hidden" name="pizza" value="1">'+ '</div><div class="price" id="price_'+value.ct_idx +'">';
                    tableData += value.p_price +'</div> </div></div> <div class="prd-option"></div>';
                    
                    tableData +='    <div class="prd-quantity"><div class="quantity-box v2"> <a href="javascript:void(0);"onclick="fn_update('+value.ct_idx+',-1,'+value.ct_count+')"class="minus"><button class="btn-minus"></button></a>';
                    tableData +='            <input type="number" class="qty0" id="qty0" value="'+value.ct_count+'" readonly=""><a href="javascript:void(0);"';
                    tableData +='onclick="fn_update('+value.ct_idx+',1,'+value.ct_count+')"class="plus"><button class="btn-plus"></button></a></div></div>';
                    
                    tableData +='    <div class="prd-total" id="total_'+value.ct_idx +'"><em>'+value.p_price * value.ct_count +'</em></div>';
                    tableData +='    <div class="prd-delete"> <a href="javascript:void(0)" onclick="fn_delete('+value.ct_idx+');" ';
                    tableData += 'class="btn-close"><span class="hidden">삭제</span></a></div> </li>';
                    tableData +=' <script>money('+value.ct_idx +');</'+'script>';
            	});
            	
            	$.each(listsdiy,function(key, value){
            	
            		tableData += '<input type="hidden" id="Oprice_'+value.ct_idx+'" value="'+value.d_price +'" />  ';		            
                    tableData += '<li class="row" id="sold-out0"><div class="sold-out-btn" id="sold-out-btn0" style="display:none"><p>Sold Out</p><a href=""class="btn-type4-brd3">삭제</a>';     
                    tableData +='     </div> <div class="prd-info"> <div class="prd-img">';
                    tableData +='            <img src="../uploads/'+value.p_sfile +'"  alt="'+value.ct_name +'" ';
                    tableData +='  onerror="this.src='+"'https://cdn.dominos.co.kr/admin/upload/goods/goods_default.jpg'"+'">';
                    tableData +=' </div><div class="prd-cont"><div class="subject">'+value.ct_name +'</div> <div class="option">';
                    tableData +=' <input type="hidden" name="pizza" value="1">'+'</div><div class="price" id="pricediy_'+value.ct_idx +'">';
                    tableData += value.d_price +'</div> </div></div> <div class="prd-option">'
                    tableData += '<div class="subject">+ '+value.dough_name +', '+value.dough_price +', '+value.dough_size +'</div> ';
                    tableData += '	<div class="subject">+ '+value.sauce_name  +', '+ value.sauce_price +', '+value.sauce_size +'</div>';
                    tableData += '	<div class="subject">+ '+value.topping1_name +' ,'+ value.topping1_price +', '+value.topping1_size +'</div>';
                    tableData += '	<c:set var="topping" value="'+value.topping2 +'"/> ';
                    tableData += '	<c:if test="'+'${topping}'+'">+ '+value.topping2_name +', '+value.topping2_price +' , '+value.topping2_size +'</c:if> </div>';
                    
                    tableData +='    <div class="prd-quantity"><div class="quantity-box v2"> <a href="javascript:void(0);"onclick="fn_update('+value.ct_idx+',-1,'+value.ct_count+')"class="minus"><button class="btn-minus"></button></a>';
                    tableData +='            <input type="number" class="qty0" id="qty0" value="'+value.ct_count+'" readonly=""><a href="javascript:void(0);"';
                    tableData +='onclick="fn_update('+value.ct_idx+',1,'+value.ct_count+')"class="plus"><button class="btn-plus"></button></a></div></div>';
                    
                    tableData +='    <div class="prd-total" id="totaldiy_'+value.ct_idx +'"><em>'+value.d_price * value.ct_count +'</em></div>';
                    tableData +='    <div class="prd-delete"> <a href="javascript:void(0)" onclick="fn_delete('+value.ct_idx+');" ';
                    tableData += 'class="btn-close"><span class="hidden">삭제</span></a></div> </li>';
                    tableData +=' <script>money1('+value.ct_idx +');</'+'script>';
            		
            	});
            	
            	tableData += '<li class="total-price2 side" > <p>총 금액 <em id="sum">'+sum +'</em>원</p> </li> </ul> ';
            	tableData += "<script>sum();"+'</'+'script>';
            	  $('#cart-list').html(tableData);  
            },
            error : function(request,statue,error){
            	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"
            			+"\n"+"error:"+error)            	
            }
            });
		};
	
</script>
</html>
