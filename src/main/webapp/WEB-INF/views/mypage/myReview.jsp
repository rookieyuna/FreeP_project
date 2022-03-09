<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
    <link rel="stylesheet" href="../style/mypage.css">
    <link rel="stylesheet" href="../style/layout.css">
    <!-- slick style -->
	<link rel="stylesheet" type="text/css" href="../style/slick/slick-theme.css" />
	<link rel="stylesheet" type="text/css" href="../style/slick/slick.css" />    
    
    <!-- icon영역 -->
    <link
        href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
        rel="stylesheet">
    <!-- js 라이브러리 영역 -->
    <script src="../js/jquery-3.6.0.js"></script>
	
	<script type="text/javascript">
		function reviewDetailOpen(idx){ 
			var token = $("meta[name='_csrf']").attr("content");
		    var header = $("meta[name='_csrf_header']").attr("content");
			
		 	// 이미지 공간 초기화
		    $(".review-image-wrap").empty().removeClass("slick-initialized slick-slider slick-dotted");
		    
			$.ajax({ 
				url: "/freepproject/community/reviewdetail.do",
				type:"POST", 
				beforeSend : function(xhr){
		    		xhr.setRequestHeader(header, token);
		        },
		        async:false,
				data: {"idx":idx},
				dataType:'json', 
				success:function(res) {
				
					console.log(res);
					var recipe = {};
					var data = {};
					var p_name = {};
					var flag = 1;
					var i=0;
					console.log(flag);
		
					$(".review-detail-modal .order_list").html("");
					
					for(var goldKey in res){
						if(Object.keys(res[goldKey]).length>0){
							if(res[goldKey]["D_NAME"]){
								recipe = {};
							// DIY피자일떄
								console.log("DIY피자입니다.");
							
								$(".review-detail-modal .order_list").prepend(
									'<li class="set'+flag+'">'
									+'<div class="order_list_wrap">'
									+'<div class="aco_top">'
									+'<h6 class="detail_title">'+res[goldKey]["D_NAME"]+'</h6>'
									+'<button class="detail-more-btn"></button>'
									+'<button class="review_to_order" onclick="reviewToCart('+res[goldKey]["DIY_IDX"]+'); event.stopPropagation();">카트담기</button>'
									+'</div>'
									+'<div class="aco_bottom">'
									+'<ul class="detail_list">'
		
									+'</ul>'
									+'</div>'
									+'</div>'
									+'</li>'
								);	
								
								if(res[goldKey]["recipe0"]) recipe.recipe0 = res[goldKey]["recipe0"];
								if(res[goldKey]["recipe1"]) recipe.recipe1 = res[goldKey]["recipe1"];
								if(res[goldKey]["recipe2"]) recipe.recipe2 = res[goldKey]["recipe2"];
								if(res[goldKey]["recipe3"]) recipe.recipe3 = res[goldKey]["recipe3"];
								if(res[goldKey]["recipe4"]) recipe.recipe4 = res[goldKey]["recipe4"];
								if(res[goldKey]["recipe5"]) recipe.recipe5 = res[goldKey]["recipe5"];
								if(res[goldKey]["recipe6"]) recipe.recipe6 = res[goldKey]["recipe6"];
								
								for(var i in recipe){
									if(recipe.length<0){
										$(".review-detail-modal .detail_list").append(
												'<li>재료가 없습니다.</li>'
										);
									}else{
										$(".review-detail-modal .order_list>.set"+flag+" .detail_list").append(
												'<li>'+recipe[i]+'</li>'
										);	
									}
								}
								flag++;
							}else if(res[goldKey]["P_CODE"]){
							// 일반피자, 사이드, 음료일떄
								var t = res[goldKey]["P_CODE"].toString();
								if(t.includes("1111")){
									$(".review-detail-modal .order_list").append(
											'<li>'
											+'<div class="order_list_wrap">'
											+'<div class="aco_top">'
											+'<h6 class="detail_title">'+res[goldKey]["P_NAME"].toString()+'</h6>'
											+'<button class="review_to_order" onclick="reviewToCart('+res[goldKey]["P_CODE"]+')">카트담기</button>'
											+'</div>'
											+'</div>'
											+'</li>'
										);	
								}else if(t.includes("5555") || t.includes("6666")){
									$(".review-detail-modal .order_list").append(
											'<li>'
											+'<div class="order_list_wrap">'
											+'<div class="aco_top">'
											+'<h6 class="detail_title">'+res[goldKey]["P_NAME"].toString()+'</h6>'
											+'<button class="review_to_order" onclick="reviewToCart('+res[goldKey]["P_CODE"]+')">카트담기</button>'
											+'</div>'
											+'</div>'
											+'</li>'
										);	
								}
							}else{
								
							}
							
							
							if(res[goldKey]["P_NAME"]) p_name = res[goldKey]["P_NAME"];
		
							if(res[goldKey]["D_NAME"]) var d_name = res[goldKey]["D_NAME"];
		
							
							if(res[goldKey].hasOwnProperty('dto')){
								data.rv_idx = res[goldKey].dto["rv_idx"];
								data.writer = res[goldKey].dto["writer"];
								data.title = res[goldKey].dto["title"];
								data.postdate = res[goldKey].dto["postdate"];
								data.contents = res[goldKey].dto["contents"];
								data.rv_sfile1 = res[goldKey].dto["rv_sfile1"];
								data.rv_sfile2 = res[goldKey].dto["rv_sfile2"];
								data.rv_sfile3 = res[goldKey].dto["rv_sfile3"];
								data.like = res[goldKey].dto["like"];
								data.likeCount = res[goldKey].dto["likeCount"];
								data.or_idx = res[goldKey].dto["or_idx"];
							}
						}
					}
					
					
					
					reviewDetail(data, d_name, p_name ,recipe);
						
				}, 
				error: function(data){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"
		        			+"\n"+"error:"+error)
				} 
			}); 
		}; 
		
		function reviewDetail(data, d_name, p_name ,recipe){ 
		 	document.getElementById("writer").innerText=data.writer;
			document.getElementById("title").innerText=data.title;
			document.getElementById("postdate").innerText=data.postdate;
			document.getElementById("contents").innerText=data.contents;
			

			if(data.rv_sfile1){
				$(".review-image-wrap").append(
					'<div><img id="reviewImg1" src="" alt=""></div>' 
				);
				document.getElementById("reviewImg1").src="/freepproject/uploads/"+data.rv_sfile1;
			}
			if(data.rv_sfile2){
				$(".review-image-wrap").append(
					'<div><img id="reviewImg2" src="" alt=""></div>' 
				);
				document.getElementById("reviewImg2").src="/freepproject/uploads/"+data.rv_sfile2;
			}
			if(data.rv_sfile3){
				$(".review-image-wrap").append(
					'<div><img id="reviewImg3" src="" alt=""></div>' 
				);
				document.getElementById("reviewImg3").src="/freepproject/uploads/"+data.rv_sfile3;
			}
			
			$(".modal2-layer-btn li a").attr("href", "./myReviewEdit.do?or_idx="+data.or_idx);
			$(".modal2-layer-btn li button").attr("onclick", "feviewDel("+data.rv_idx+")");
			
			if(data.like == true){
				$(".review-detail-modal .favorite-heart i").addClass("like").after("<span class='likeCount'>"+data.likeCount+"<span>");	
			}else{
				$(".review-detail-modal .favorite-heart i").removeClass("like");	
			}
			
			reviewSlick();
			
		};
		
		function reviewToCart(code){
			var token = $("meta[name='_csrf']").attr("content");
		    var header = $("meta[name='_csrf_header']").attr("content");
		    $.ajax({ 
				url: "/freepproject/community/reviewToCart.do",
				type:"POST", 
				beforeSend : function(xhr){
		    		xhr.setRequestHeader(header, token);
		        },
				data: {"code":code},
				success:function() {
					alert("상품이 장바구니에 담겼습니다");
					
				},
				error: function(data){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"
		        			+"\n"+"error:"+error)
				} 
		    }); 
		}
		
		
		function feviewDel(rv_idx){
			if(confirm("정말로 삭제하시겠습니까?")){
				location.href="reviewremove.do?rv_idx="+rv_idx;
			}else{
				alert("취소되었습니다")
			}
		}
	</script>
	
</head>

<body id="body">
    <header id="header">
       <%@ include file="../common/header.jsp" %>
    </header>

    <div id="container">
        <div class="cont-wrap">
            <div class="sub-type mypage">
                <div class="inner-box">
                    <div class="page-title-wrap">
                        <h2 class="page-title">마이페이지</h2>
                        <div class="depth-area">
                            <ol>
                                <li><a href="/FreeP/index.html">홈</a></li>
                                <li><strong>마이페이지</strong></li>
                            </ol>
                        </div>
                    </div>
                    <article class="mypage-wrap mypage-grade">
                        <div class="menu-nav-wrap">
                            <div class="menu-nav">
                                <ul>
                                    <li><a href="../mypage/myMain.do">MY프리피</a></li>
                                    <li><a href="../mypage/myOrder.do">주문내역</a></li>
                                    <li><a href="../mypage/myCoupon.do">쿠폰/적립금</a></li>
                                    <li class="active"><a href="../mypage/myReview.do">MY리뷰</a></li>
                                    <li><a href="../mypage/myQuestion.do">1:1문의</a></li>
                                    <li><a href="../mypage/myUserinfo.do">정보수정</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="title-wrap-center">
                            <h3 class="title-type">
                                MY리뷰
                            </h3>
                            <p>작성하신 리뷰와 좋아요한 다른사람의 리뷰를 확인해보세요</p>
                        </div>

                        <div class="CP-wrap myWriteRev">
                            <div class="tab-type6"><!--2020-01-03 클래스명수정-->
                                <ul class="tabTab">
                                    <li class="active"><button class="btnC1">내가쓴리뷰</button></li>
                                    <li><button class="btnC1" onclick="location.href='myFavReview.do?';">좋아요리뷰</button></li>
                                </ul>
                            </div>

                            <div class="myReview-wrap">
                            <div class="table-type4">
                                <table>
                                    <colgroup>
                                        <col style="width:10%">
                                        <col style="width:230px">
                                        <col style="width:100%">
                                        <col style="width:15%">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>번호</th>
                                            <th>사진</th>
                                            <th>리뷰내용</th>
                                            <th>등록날짜</th>
                                        </tr>
                                    </thead>
                                    <!-- 리뷰 없음 -->
                                    <c:choose>
	                                    <c:when test="${empty lists}">
		                                    <tbody class="board-list empty hide">
					                    		<tr><td colspan="4">남긴 리뷰가 없습니다.</td></tr>
		                                    </tbody>
				                    	</c:when>
				                    	<c:otherwise>
					                    	<!-- 리뷰 있음/ 가상번호 수정해야함 -->
		                                    <tbody class="board-list fill">
			                                    <c:forEach items="${lists }" var="row" varStatus="loop">
													<tr onclick="reviewDetailOpen('${row.rv_idx}');">
														<td>${totalreviewCount - (((nowPage-1) * pageSize) + loop.index)}</td>
														<c:choose>
									                    	<c:when test="${empty row.rv_sfile1 }">
									                    		<td>등록된 사진 없음</td>
									                    	</c:when>
									                    	<c:otherwise>
									                    		<!-- <span><img src="../images/05community/1b6078b5bd51521860a43103b0a6cae5.jpg"></span> -->
									                    		<td><span><img src="../uploads/${row.rv_sfile1}"/></span></td>
									                    	</c:otherwise>
									                    </c:choose>
														<td>${row.contents }</td>
														<td>${row.postdate }</td>
													</tr>
												</c:forEach>
					                    	</tbody>
				                    	</c:otherwise>
	                                </c:choose>
                                </table>
                            </div>
                            <!-- 페이지 번호 -->
							<div class="pagingArea">
								<div class="common-pagingType-1">
									${pagingImg }
								</div>
							</div>
                        </div>

 						<div class="review-detail-modal pop-layer pop-menu" id="pop-menu-detail" style="display: none;">
                            <div class="dim"></div>
                            <div class="pop-wrap">
                                
                                <div class="pop-modal2">
                                    <a href="javascript:UI.layerPopUp({selId:'#pop-allergy', st:'close'});" class="btn-close"></a>
                                    <div class="modal2-con">
                                        <div class="con1-top-wrap">
                                            <!-- 이미지 -->
                                            <div class="img-wrap">
                                            	<div class="review-image-wrap">
                                                        	
                                            	</div>
                                               
                                                <!-- <ul class="review-modal-cicleBtn">
                                                    <li class="review-img-cicle active"><button></button></li>
                                                    <li class="review-img-cicle"><button></button></li>
                                                    <li class="review-img-cicle"><button></button></li>
                                                </ul> -->
                                            </div>
                                        </div>

                                        <div class="con1-con-wrap">
                                            <div class="con-top">
                                                <!-- 아이디 -->
                                                <div class="review_user">
                                                    <p class="review_name"><span id="writer">Wozniak</span> 님의 리뷰입니다</p>
                                                    <p class="review_pdate" id="postdate">2022-02-02</p>
                                                </div>

                                                <!-- 제목 -->
                                                <p class="review_title" id="title">입에서 새우랑 치즈가 춤춰요!</p>
                                                <div class="favorite-heart">
                                                    <div class="favorite-heart">
                                                        <i class="material-icons unlike">favorite</i>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- 내용 -->
                                            <div class="con-mid">
                                                <p class="review_text" id="contents">
                                                    치즈크러스트에 갈릭디핑 찍어 먹으면 진짜 엄청 맛있어요ㅜㅜㅜㅜ♡
                                                </p>

                                                <div class="review_order">
                                                    <ul class="order_list">
                                                        <!-- 리뷰 > 주문 목록 -->
                                                        
                                                        

                                                       
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    
                                    <!-- 상세모달창 btn -->
									<div class="modal2-layer-btn">
			                            <ul>
			                                <li><a href="./myReviewEdit.do">수정하기</a></li>
			                                <li><button onclick="feviewDel()">삭제하기</button></li>
			                            </ul>
			                        </div>
                                </div>
                            </div>
                        </div> <!-- end of 상세모달창 -->
		
						

                    </article>
                </div>
            </div>
        </div>
    </div>

    <footer id="footer">
        <%@ include file="../common/footer.jsp" %>
    </footer>


    <script src="../js/includeHTML.js"></script>
    <script>includeHTML();</script>

    <script src="../js/motion.js"></script>
    <script src="../js/ui.js"></script>
    
    
	<!-- slick area -->
	<script src="../js/slick/slick.js"></script>
	<script src="../js/slick/slick.min.js"></script>
	
</body>

</html>