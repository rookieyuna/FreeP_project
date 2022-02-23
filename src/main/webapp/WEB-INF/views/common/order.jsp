<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
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
<style>
	.store .point{
		width: 170px;
	    font-size: 18px;
	}
	.store .point1{
		width: 60px;
	    margin-top: auto;
	    margin-left: 10px;
	    height: 42px;
	    background-color: #ff6510;
	    color: white;
	}
	.store{
	    display: flex;
	    align-items: center;
	}
	.couponlist{
	font-size: 15px;
    /* border: 1px; */
    overflow: auto;
    width: 800px;
    height: 150px;
	}
	.couponlist .couponTable{
	    width: 799px;
    border-spacing: 5px;
    border-collapse: separate;
    border: 1px solid lightgray;
	}
	.couponlist .coupontr{
		height: 30px;
	}
	.couponlist td{
		font-weight: 500;
	    display: table-cell;
	    vertical-align: middle;
	}
	
</style>
<script>
$(document).ready(function(){
	$('#recipient').change(function(){
		if($('#recipient').is(":checked")){
			fn_custInfo();
		}else{
			//체크박스해제이벤트
			document.getElementById("customerName").value = "";
			$("#customerName").removeAttr("disabled");
			document.getElementById("tel2").value = "";
			$("#tel2").removeAttr("disabled");
			document.getElementById("tel3").value = "";
			$("#tel3").removeAttr("disabled");
			$("#tel1").removeAttr("disabled");
			 $("#tel1").val("010").prop("selected", true);
		}
	});
	
	
});
	function sum(){		
		var sum = document.getElementById("sum").innerText;
		document.getElementById("sum").innerText = (sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	}
	function sum_discount(){		
		var sum = document.getElementById("sum1").value;
		document.getElementById("sum1_1").innerText = (sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	}
	function total(){		
		var sum = document.getElementById("total").value;
		document.getElementById("total_1").innerText = (sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	}
</script>
<script>
function fn_custInfo(){

    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
 
     $.ajax({ 
            url: "cusInfo.do", 
            type: "POST", 
            beforeSend : function(xhr){
        		xhr.setRequestHeader(header, token);
            },
            async:false,
            dataType : "json",
            success : function(data){      	
            	var tableData="";
            	var cus = data.lists;
            	var tel1 = data.tel1;
            	var tel2 = data.tel2;
            	
            	tableData += ' <dl><dt>이름</dt><dd><div class="form-item"><input type="text" id="customerName" name="customerName" value="'+cus.name+'" maxlength="30" disabled>';
            	tableData += '</div></dd></dl>';
            	
            	$('#cusName').html(tableData);           
            	
            	tableData = ' <dt>연락처</dt><dd><div class="form"><div class="form-group2 select-group">';
            	tableData += '<div class="form-item"><div class="select-type2">';
            	tableData += '<select id="tel1" name="tel1" title="휴대전화번호" value="'+tel1 +'" disabled>';
            	tableData += '<option value="010">010</option><option value="011">011</option><option value="016">016</option>';
                tableData += '<option value="017">017</option> <option value="018">018</option> <option value="019">019</option>'; 
                tableData += ' </select></div><input type="text" id="tel2" name="tel2" maxlength="4" class="i_text" title="휴대전화번호" value="'+tel2+'" disabled>';
                tableData += '<input type="text" id="tel3" name="tel3" maxlength="4" class="i_text" title="휴대전화번호" value="'+data.tel3+'" disabled>';
                tableData += ' </div></div></div></dd>';
            	
                $('#cusPhone').html(tableData);   
                
                $("#tel1").val(tel1).prop("selected", true);
            },
            error : function(request,statue,error){
            	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"
            			+"\n"+"error:"+error)
            	
            }
            });
            
}

</script>
<body id="body">
    <header id="header">
        <%@ include file="./header.jsp" %>
    </header>

    <div id="container">
        <div class="cont-wrap">
            <div class="sub-type order">
                <div class="inner-box">
                    <!-- 1depth 메뉴명 & 네비게이션 -->
                    <div class="page-title-wrap">
                        <h2 class="page-title">결제하기</h2>
                        <div class="depth-area">
                            <ol>
                                <li><a href="../">홈</a></li>
                                <li><a href="../order/cart.do">장바구니</a></li>
                                <li><strong>결제하기</strong></li>
                            </ol>
                        </div>
                    </div>
                    <!-- //1depth 메뉴명 & 네비게이션 -->

                    <article class="pay">
                        

                        <!-- 배송정보 -->
                        <div class="step-wrap">
                            <div class="order_DorP">

                                <!-- 지점정보 -->
                                <div>
                                    <div class="title-wrap __border">
                                        <h3 class="title-type"><strong>지점 정보</strong></h3>
                                    </div>

                                    <div class="deli-info">
                                        <div class="address">
                                            서울특별시 금천구 가산동 426-5 월드 메르디앙 벤처 센터 2 차 410 호</div>
                                        <div class="store">
                                            <span>금천가산점</span> 02-000-0000</div>
                                    </div>
                                </div>

                                <!-- 수령인정보 -->
                                <div>
                                    <div class="title-wrap __border">
                                        <h3 class="title-type"><strong>수령인 정보</strong></h3>
                                    </div>

                                    <div class="deli-info form">
                                        <dl class="chk-wrap">
                                            <dt></dt>
                                            <dd>
                                                <div class="form-group">
                                                    <div class="form-item">
                                                        <div class="chk-box v3">
                                                            <input type="checkbox" name="order_type" id="recipient">
                                                            <label class="checkbox" for="recipient" id="checkbox"></label>
                                                            <label for="recipient">주문자와 동일</label>
                                                        </div>
                                                    </div>
                                                    
                                                 </div>
                                            </dd>
                                        </dl>
                                     
                                        <dl id="cusName">
                                             <dl>
                                                <dt>이름</dt>
                                                <dd>
                                                    <div class="form-item">
                                                        <input type="text" id="customerName" name="customerName" value="" maxlength="30">
                                                    </div>
                                                </dd>
                                            </dl>
                                        </dl>
                                        
                                        <dl id="cusPhone">
                                            <dt>연락처</dt>
                                            <dd>
                                                <div class="form">
                                                    <div class="form-group2 select-group">
                                                        <div class="form-item">
                                                            <div class="select-type2">
                                                                <select id="tel1" name="tel1" title="휴대전화번호">
                                                                    <option value="010">010</option>
                                                                    <option value="011">011</option>
                                                                    <option value="016">016</option>
                                                                    <option value="017">017</option>
                                                                    <option value="018">018</option>
                                                                    <option value="019">019</option>
                                                                </select>
                                                            </div>
                                                            <input type="text" id="tel2" name="tel2" maxlength="4" class="i_text" title="휴대전화번호">
                                                            <input type="text" id="tel3" name="tel3" maxlength="4" class="i_text" title="휴대전화번호">
                                                        </div>
                                                    </div>
                                                    
                                                    </div>
                                            </dd>
                                        </dl>
                              
                                        <dl>
                                            <dt>요청사항</dt>
                                            <dd>
                                                <div class="form">
                                                    <div class="form-item">
                                                        <div class="select-type2">
                                                            <select name="more_req_box" onchange="directMessage();">
                                                                <option value="">요청사항을 선택하세요.</option>
                                                                <option value="문 앞에 놓아 주세요.">문 앞에 놓아 주세요.</option>
                                                                <option value="벨은 누르지 말아주세요.">벨은 누르지 말아주세요.</option>
                                                                <option value="direct">직접 입력</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <!-- 직접 입력 -->
                                                    <div class="form-item form-text">
                                                        <input style="display:none;" name="more_req" id="more_req" type="text" onkeyup="checkByte(this, 50)" placeholder="주문시 요청사항을 입력하세요. (최대 25자까지 입력가능)">
                                                    </div>
                                                </div>
                                            </dd>
                                        </dl>
                                        
                                    </div>
                                </div>
                            </div>

                        </div><!-- //step-wrap -->

                        <!-- 주문내역 -->
                        <div class="step-wrap">
                            <div class="title-wrap">
                                <div class="title-type"><strong>주문내역</strong></div>
                            </div>
                            <div class="order-step">
                                <ul>
                                    <li>
                                    	<c:forEach items="${lists }" var="row">   
                                        <div class="menu">
                                            <!-- 피자 명  -->
                                            <strong class="goods_name">${row.ct_name }</strong>                                            
                                            <c:if test="${row.ct_count  ne '1'}">
                                            	<strong class="goods_name"> x ${row.ct_count }</strong>
                                            </c:if>
                                            <!-- //피자 명  -->
                                        </div>
                                        </c:forEach>
                                       <!--  <div class="topping">
                                            <div class="item">
                                                <span>양파 x 2</span> / <span>10,000</span>원
                                            </div>
                                        </div> -->
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- //주문내역 -->

                        <!-- 할인 적용 -->
                        <div class="step-wrap" id="dc_info">
                            <div class="title-wrap">
                                <h3 class="title-type"><strong>할인 적용</strong></h3>
                            </div>
                            <div class="discount-step">
                                <ul>
                                    <li id="myCoupon">
                                    	<label class="btn-type-brd5">프리피 온라인 쿠폰 선택</label>
                                    	<div class="couponlist">
											<table class="couponTable">
												<thead>
													<tr>
														<td style="width:30%"></td>
														<td style="width:60%"></td>
														<td style="width:10%"></td>
													</tr>
												</thead>
												<tbody style="display:table-row-group;">
													<tr class="coupontr">
														<td>쿠폰이름</td>
														<td>쿠폰내용</td>
														<td>~ 만료일</td>
													</tr>
													<tr class="coupontr">
														<td>쿠폰이름</td>
														<td>쿠폰내용</td>
														<td>~ 만료일</td>
													</tr>
													<tr class="coupontr">
														<td>쿠폰이름</td>
														<td>쿠폰내용</td>
														<td>~ 만료일</td>
													</tr>
												</tbody>
											</table>
										</div>
									</li>
                                </ul>
                                <ul > 
                                    <li id="voucher">
                                    	<label class="btn-type-brd5" onclick="fn_voucher(0);">포인트 사용하기</label>
                                        <div class="store">
                                            <!-- <input type="text" id="customerName" class="point" placeholder="사용할 포인트 입력" value="" maxlength="10"/>
                                           	<button type="button" class="point1">사용</button>
                                            <label class="point2">사용가능포인트 : </label> -->
                                        </div>
                                     </li>                           
                                </ul>
                            </div> <!-- //discount-step -->
                        </div>
                        <!-- //할인 적용 -->
                        <script>
                        function fn_voucher(discount){                       	
                        	var token = $("meta[name='_csrf']").attr("content");
                            var header = $("meta[name='_csrf_header']").attr("content");
                            
                            if(discount != 0){
                            	
                            	var example = document.getElementById("sum1").value ;
                            	if(( parseInt(example) - parseInt(discount)) < 0 ){
                            		document.getElementById("sum1").value = 0;
                            		}
                            	document.getElementById("sum1").value = parseInt(example) - parseInt(discount);
                            	var example = document.getElementById("total").value ;
                            	document.getElementById("total").value = parseInt(example) + parseInt(discount);
                            	sum_discount();
                            	total();
                            }
                         
                             $.ajax({ 
                                    url: "../order/cusPoint.do", 
                                    type: "POST", 
                                    beforeSend : function(xhr){
                                		xhr.setRequestHeader(header, token);
                                    },
                                    async:false,
                                    dataType : "json",
                                    success : function(data){
                                    	
                              			var tableData = "";
              								//form으로 하면 안될거같음. submit되면 새로고침처럼 화면이 맨 위로 가버려서.. validate따로 함수 만들어야할듯 버튼 onclick해서.. 
                              			tableData += '<div class="store"><input type="number" id="usePoint" class="point" placeholder="사용할 포인트 입력" value="" maxlength="10"';
                              			tableData += 'min="'+1000+'" max="'+data.point+'" step="100"/>';
                              			tableData +='<button type="button" class="point1" onclick="fn_point('+data.point+');">사용</button><span class="point2" style="font-size:14px";> 사용가능포인트 :'+data.point+' </span>';
                              			tableData += '</div><span style="color:gray; font-size:13px;">* 포인트는 1000이상부터 100단위로 사용 가능합니다.</span>';
                              			
                                    	$('#voucher').html(tableData);   
           	
                                    },
                                    error : function(request,statue,error){
                                    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"
                                    			+"\n"+"error:"+error)
                                    	
                                    }
                                    });      
                        }
                        
                        function fn_point(data){
                        	//포인트사용 버튼을 눌렀을때
                        	//1. 값 Validate
                        	var point = document.getElementById("usePoint").value;
                        	
                        	if(point < 1000 || point > data || (point % 100 != 0)){
                        		alert("error");
                        		return false;
                        		
                        	}
                        	//validate를 통과했다면 
                        	var tableData = "";
                        	tableData += '<div class="store"><label class="btn-type-brd5" id="cuspoint">사용할 포인트 : '+point+'점</label>';
                        	tableData += '<button type="button" class="point1" onclick="fn_voucher('+point+');">수정</button></div>';
                        	$('#voucher').html(tableData); 
                        	
                        	var sum1 = document.getElementById("sum1_1").innerText; // -> 7180 제대로 읽어옴
                        	//근데 parseInt()로 감싸면// 7180 그대로 나와야하는데 7이 나옵니다...
                        	var sum2 = parseInt(sum1) + parseInt(point);
                        	document.getElementById("sum1").value = sum2;
                        	var example = document.getElementById("total").value ;
                        	document.getElementById("total").value = example - sum2;
                        	sum_discount();
                        	total();
                        }
                        </script>


                        <!-- 결제방법 -->
                        <div class="step-wrap pay-step" id="pay_info">
                            <input type="hidden" id="userInfo" value="">
                            <input type="hidden" id="flagPin" value="">
                            
                            <div class="title-wrap">
                                <h3 class="title-type"><strong>결제수단 선택</strong></h3>
                            </div>
                            
                            <div class="pay-div">
                                <ul>
                                    <li>
                                        <div class="chk-box btn-dominopay selected" id="pay_method_2"
                                            data-mid="dopaytestP" data-value="D|2|Y"
                                            onclick="clickPayType('radio', this);">
                                            <input type="radio" id="sel-dominopay" name="select-payMethod">
                                            <label class="checkbox" for="sel-dominopay"></label>
                                            <label for="sel-dominopay">카드결제</label>
                                        </div>
                                    </li>
                                    
                                    <li>
                                        <div class="chk-box btn-otherMethod"
                                            onmousedown="eval('try{ _trk_clickTrace( \'EVT\', \'결제하기 >다른 결제수단 선택하기\'); }catch(_e){ }');">
                                            <input type="radio" id="sel-otherMethod" name="select-payMethod">
                                            <label class="checkbox" for="sel-otherMethod"></label>
                                            <label for="sel-otherMethod">만나서 결제</label>
                                        </div>
                                        <div class="otherMethod-wrap">
                                            <ul class="pay-info">
                                                <li class="list-chk">
                                                    <div class="chk-box btn-payMethod" id="pay_method_4" data-hidedefault=""
                                                        data-value="9|4|Y" onclick="clickPayType('radio', this);">
                                                        <input type="radio" id="pay1" name="pay"
                                                            onclick="event.stopPropagation()">
                                                        <label class="paynm" for="pay1">만나서 카드결제</label>
                                                    </div>
                                                </li>
                                                <li class="list-chk">
                                                    <div class="chk-box btn-payMethod" id="pay_method_4" data-hidedefault=""
                                                        data-value="9|4|Y" onclick="clickPayType('radio', this);">
                                                        <input type="radio" id="pay2" name="pay"
                                                            onclick="event.stopPropagation()">
                                                        <label class="paynm" for="pay2">현금결제</label>
                                                    </div>
                                                    <div class="chk-box v3 pay2_bill">
                                                        <input type="checkbox" id="pay2_bill_check">
                                                        <label class="checkbox" for="pay2_bill_check"></label>
                                                        <label for="pay2_bill_check">현금영수증 발급받기</label>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>

                                    </li>
                                </ul>
                            
                            </div>
                            
                            <div class="pay-info pay-info3">
                                <ul class="list-text-v2 pay_guide">
                                    <li class="strong">
                                        코로나바이러스 확산에 따라 고객님과 매장 근무자의 안전과 건강을 고려하여 주문시 미리결제를 사용하시면 보다 편하게 이용하실 수 있습니다.
                                    </li>
                                    <li>
                                        일부 카드사 이용제한(BC, 국민, 농협 등)
                                    </li>
                                    <li>
                                        현금결제 시 현금영수증 체크를 확인해주세요
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- // 결제방법 -->



                        <!-- 결제 금액, 퀵 오더로 설정, 결제 및 주문완료 -->
                        <div class="step-wrap" id="final_pay_info">
                            <div class="step-wrap">
                                <div class="title-wrap">
                                    <h3 class="title-type"><strong>최종결제금액</strong></h3>
                                </div>

                                <div class="total-step">
                                    <ul>
                                        <li>
                                            <p class="tit">총 상품 금액</p>
                                            <p class="price"><em id="sum">${sum }</em>원</p>
                                        </li>
                                        <li class="discount">
                                            <p class="tit">총 할인 금액</p>
                                            <input type="hidden" id="sum1" value="0"/>
                                            <p class="price"><em id="sum1_1">0</em>원</p>
                                        </li>
                                        <li class="total">
                                            <p class="tit">총 결제 금액</p>
                                            <input type="hidden" id="total" value="${sum }" />
                                            <p class="price"><em id="total_1">${sum }</em>원</p>
                                        </li>
                                    </ul>
                                    
                                </div>
                                <script>sum();
                                sum_discount();total();</script>
                            </div>
                        </div>
                        <!-- // 결제 금액, 퀵 오더로 설정, 결제 및 주문완료 -->

                        <!-- 주문하기 버튼 -->
                        <div class="btn-wrap">
                            <a href="#" class="btn-type">결제하기</a>
                        </div>
                        <!-- //주문하기 버튼 -->

                    </article>
                </div><!-- //inner-box -->
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