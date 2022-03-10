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
<style>
.storelist .storeTable{
    border: 1px solid lightgray;
    border-spacing: 5px;
    width: 800px;
    margin-top: 10px;
    font-size : 16px;
    margin-bottom : 10px;
}
</style>

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
<script>
// 입력 여부 체크
function validateForm(form) {
	if(form.store.value==""){
		alert("매장을 선택하세요");
		form.store.focus();
		return false;
	}
	
	if( $('#cart-list1').html() == '' ){
		alert("장바구니가 비어있습니다.");
		return false;
	}
	
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
                        <form:form name="cart" action="../order/order.do" onsubmit="return validateForm(this);">
                    
                        <!-- 주문 내역 -->
                        <div class="step-wrap">

                            <!-- 주소 -->
                            <div class="step-wrap">
                                <div class="title-wrap">
                                    <h3 class="title-type"><strong>주문방식</strong></h3>
                                </div>
                                <div class="deli-info">
									<div class="chk-wrap" id="chk-wrap">
										<div class="chk-box selected">
											<input type="hidden" id="store" name="store" value="" />
											<input type="radio" id="order_delivery" name="order_how"
												value="D"> <label class="checkbox"
												for="order_delivery"></label> <label for="order_delivery">배달주문</label>
										</div>
										<div class="chk-box">
											<input type="radio" id="order_packaging" name="order_how"
												value="P"> <label class="checkbox"
												for="order_packaging"></label> <label for="order_packaging">포장주문</label>
										</div>
										<div id="chk-store"></div>
									</div>
								</div>
                            </div>
                            

<script>
	$(document).ready(function() {
		var latitude = 37.478714;
		var longitude = 126.87866;
		
		if (navigator.geolocation) {			
			//위치 정보를 얻기
			navigator.geolocation.getCurrentPosition(function(pos) {
				latitude = pos.coords.latitude; // 위도
				longitude = pos.coords.longitude;
				
			});
		} else {
			alert("이 브라우저에서는 현재위치가 지원되지 않습니다.")
		}
		$('#order_delivery').change(function() {
			if ($('#order_delivery').is(":checked")) {
				document.getElementById("store").value="";
				fn_storeInfo(latitude, longitude);
			} else {
				//체크박스해제이벤트
			}
		});
		$('#order_packaging').change(function() {
			if ($('#order_packaging').is(":checked")) {				
				document.getElementById("store").value="";
				fn_storeInfo(latitude, longitude);
			} else {
				//체크박스해제이벤트
			}
		});
	});

	function fn_storeInfo(latitude, longitude,flag) {

		
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");

		$.ajax({
					url : "../order/storeList.do",
					type : "POST",
					beforeSend : function(xhr) {
						xhr.setRequestHeader(header, token);
					},
					async : false,
					data : {
						"latitude" : latitude,
						"longitude" : longitude
					},
					dataType : "json",
					success : function(data) {
						var store = data.listsstore;
						var tableData = "";

						/* 버튼 비활성화 */
						
						tableData += '<div class="storelist"><table class="storeTable"><thead><tr><td style="width:30%"></td><td style="width:60%"></td><td style="width:10%"></td></tr>';
						tableData += '</thead><tbody style="display:table-row-group;">';

						$.each(store,function(key, value) {
							tableData += '<tr class="storetr" onclick="fn_selectStore('+value.b_code +',\''+value.b_name+'\');">';
							tableData += '<td>' + value.b_name+ '</td><td>'+ value.address+ '</td><td>'+ value.distance+ 'Km</td></tr>';
						});
						tableData += '</tbody></table></div>';
						fn_packInfo(tableData);

					},
					error : function(request, statue, error) {
						alert("code:" + request.status + "\n" + "message:"
								+ request.responseText + "\n" + "\n" + "error:"
								+ error)

					}
				});
	};
	
	function fn_selectStore(code, name){
		var tableData = '';
		tableData = '<label class="btn-type-brd5" id="cusStore">선택한 점포 : '+name+'</label>';
		document.getElementById("store").value=code;
		if ($('#order_packaging').is(":checked")) {		
			tableData += '<select name="more_req_box" onchange="directMessage();" style="width:400px;">';
			tableData += '<option value="11시~13시">11시~13시</option><option value="13시~15시">13시~15시</option>';
			tableData +='<option value="15시~17시">15시~17시</option><option value="17시~19시">17시~19시</option>';
			tableData +='<option value="19시~21시">19시~21시</option></select>';
	
		}
		
		$('#chk-store').html(tableData);
	}

	function fn_packInfo(data) {
		var tableData = data;
		
		$('#chk-store').html(tableData);
		/* $('#chk-date').html(tableData); */
	}
</script>
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
                        	<button type="submit" class="btn-type v3">주문하기</button>
                            <!-- <a href="../order/order.do" class="btn-type v3">주문하기</a> -->
                        </div>
                        </form:form>
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
            	tableData += ' <ul><li class="category"><div>상품정보</div><div>추가토핑</div><div>수량</div><div>금액</div><div></div></li><div id="cart-list1">';
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
                 
                    for(var i=0 ; i<value.topping_name.length ; i++){     	                   	
                    	 tableData += '	<c:set var="topping" value="'+value.topping_name[i] +'"/> ';
                         tableData += '	<c:if test="${topping ne ''}"> <div class="subject">+ '+value.topping_name[i]+', '+value.topping_price[i] +' , '+value.topping_size[i] +'</div></c:if>';
                    }
             
                    tableData +=' </div>    <div class="prd-quantity"><div class="quantity-box v2"> <a href="javascript:void(0);"onclick="fn_update('+value.ct_idx+',-1,'+value.ct_count+')"class="minus"><button class="btn-minus"></button></a>';
                    tableData +='            <input type="number" class="qty0" id="qty0" value="'+value.ct_count+'" readonly=""><a href="javascript:void(0);"';
                    tableData +='onclick="fn_update('+value.ct_idx+',1,'+value.ct_count+')"class="plus"><button class="btn-plus"></button></a></div></div>';
                    
                    tableData +='    <div class="prd-total" id="totaldiy_'+value.ct_idx +'"><em>'+value.d_price * value.ct_count +'</em></div>';
                    tableData +='    <div class="prd-delete"> <a href="javascript:void(0)" onclick="fn_delete('+value.ct_idx+');" ';
                    tableData += 'class="btn-close"><span class="hidden">삭제</span></a></div> </li>';
                    tableData +=' <script>money1('+value.ct_idx +');</'+'script>';
            		
            	});
            	
            	tableData += '</div><li class="total-price2 side" > <p>총 금액 <em id="sum">'+sum +'</em>원</p> </li> </ul> ';
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
