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
    <link rel="stylesheet" href="../style/community.css">
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
		url: "reviewdetail.do",
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
	
	
	if(data.like == true){
		$(".review-detail-modal .favorite-heart i").addClass("like").attr("onclick","reviewLike('"+data.rv_idx+"')");	
	}else{
		$(".review-detail-modal .favorite-heart i").removeClass("like").attr("onclick","reviewLike('"+data.rv_idx+"')");	
	}
	
	reviewSlick();
};


function reviewLike(idx){ 
	var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    var currentIdx = idx;
    $.ajax({ 
		url: "reviewLike.do",
		type:"POST", 
		beforeSend : function(xhr){
    		xhr.setRequestHeader(header, token);
        },
		data: {"idx":idx},
		success:function(data) {
			var Len = $(".material-icons.unlike").length;
			var chkLike = $(".material-icons.unlike");
			$(".material-icons.unlike").eq(0).toggleClass("like");
			
			for(var i=1; i<Len; i++){
				var temp = chkLike.eq(i)
				var value = temp.attr("onclick").substring(temp.attr("onclick").indexOf("'")+1, temp.attr("onclick").lastIndexOf("'"));
				if(value == idx){
					if(temp.hasClass("like")){
						temp.removeClass("like");
					}else{
						temp.addClass("like");						
					}
				}
			}
		},
		error: function(data){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"
        			+"\n"+"error:"+error)
		} 
    }); 
};

function reviewToCart(code){
	
	var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $.ajax({ 
		url: "reviewToCart.do",
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

</script>
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
                        <h2 class="page-title">커뮤니티</h2>
                        <div class="depth-area">
                            <ol>
                                <li><a href="/main">홈</a></li>
                                <li><strong>커뮤니티</strong></li>
                            </ol>
                        </div>
                    </div>
                    <!-- //1depth 메뉴명 & 네비게이션 -->

                    <article class="menu-list-area">
                        <!-- menu-list -->
                        <div class="menu-nav-wrap">
                            <div class="menu-nav">
                                <ul>
                                    <li class="active"><a href="../community/review.do">고객후기</a></li>
                                    <li><a href="../community/event.do">이벤트</a></li>
                                    <li><a href="../community/question.do">1:1문의</a></li>
                                </ul>
                            </div>
                        </div>

                        <!-- 게시판 영역 -->
                        <div class="title-wrap-center">
                            <h3 class="title-type">
                                고객후기
                            </h3>
                            <p>프리피 고객님들께서 남겨주신 소중한 후기를 확인해보세요!</p>
                        </div>

                        <div class="sp_play">
                            <div class="sp_play_wrap freep_community">

                                <div class="con_inner_mid review_list">
                                    <div class="review best">
                                        
                                        
                                        <!-- 리뷰클릭시 나오는 상세모달창 (motion.js line.110) -->
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
                                                                        <i class="material-icons unlike" onclick="reviewLike('9999')">favorite</i>
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
                                                    
                                                </div>
                                            </div>
                                        </div> <!-- end of 상세모달창 -->
		
		
                                        <h2>베스트 리뷰</h2>
                                        <ul>
                                        	<c:forEach items="${listsBest }" var="row"> 
                                            <li>
                                                <div class="img_wrap" onclick="reviewDetailOpen('${row.rv_idx}');">
                                                    <a href="#best"><img src="../uploads/${row.rv_sfile1 }"></a>
                                                </div>
                                                <div class="text_wrap">
                                                    <div class="review_text">
                                                        <div class="review_icon diy"></div>
                                                        <div class="review_name">${row.writer}</div>
                                                        <div class="review_like">
                                                            <div class="favorite-heart">
                                                               <sec:authorize access="isAnonymous()">
                                                                	<i class="login-request material-icons unlike">favorite</i>
                                                                </sec:authorize>
																<sec:authorize access="isAuthenticated()">
																	<c:choose>
																	   <c:when test="${row.like eq true}">
																	  	<i class="material-icons unlike like" onclick="reviewLike('${row.rv_idx}')">favorite</i>
																	  </c:when>
																	  <c:otherwise>
																	    <i class="material-icons unlike" onclick="reviewLike('${row.rv_idx}')">favorite</i>
																	  </c:otherwise>
																	</c:choose>
																</sec:authorize>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="review_cont">
                                                        <p>
                                                            ${row.title}
                                                        </p>
                                                    </div>
                                                </div>
                                            </li>
                                            </c:forEach>
                                            <!-- <li>
                                                <div class="img_wrap">
                                                    <a href="#best"><img src="../images/05community/ecfec5c38e6d033c7f01b77eecc1bf8a.jpg"></a>
                                                </div>
                                                <div class="text_wrap">
                                                    <div class="review_text">
                                                        <div class="review_icon best diy"></div>
                                                        <div class="review_name">Wozniak</div>
                                                        <div class="review_like">
                                                            <div class="favorite-heart">
                                                                <i class="material-icons unlike">favorite</i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="review_cont">
                                                        <p>
                                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id augue arcu vulputate phasellus pharetra. Nunc eget ut neque risus adipiscing nibh ac. In eget diam convallis leo.
                                                        </p>
                                                    </div>
                                                </div>
                                            </li> -->
                                        </ul>
                                    </div>

                                    <div class="review normal">
                                        <h2>일반 리뷰</h2>
                                        <ul>
                                        	<c:forEach items="${lists }" var="row">
                                            <li>
                                            	<c:set var="file" value="${row.rv_sfile1 }" />
                                                <div class="img_wrap" onclick="reviewDetailOpen('${row.rv_idx}');">
	                                                <c:if test="${file != null }">
	                                                    <a href="#normal"><img src="../uploads/${row.rv_sfile1 }"></a>
	                                                </c:if>
	                                                <c:if test="${file == null }">
	                                                    <a href="#normal"><img src="../uploads/normal_11110001"></a>
	                                                </c:if>
                                                </div>
                                                <div class="text_wrap">
                                                    <div class="review_text">
                                                        <div class="review_icon normal"></div>
                                                        <div class="review_name">${row.writer}</div>
                                                        <div class="review_like">
                                                        
                                                            <div class="favorite-heart">
                                                            	<!-- 미로그인 상태에서 클릭시 로그인하도록 하기 위해 나눠놓음 -->
                                                            	<sec:authorize access="isAnonymous()">
                                                                	<i class="login-request material-icons unlike">favorite</i>
                                                                </sec:authorize>
																<sec:authorize access="isAuthenticated()">
																	<c:choose>
																	   <c:when test="${row.like eq true}">
																	  	<i class="material-icons unlike like" onclick="reviewLike('${row.rv_idx}')">favorite</i>
																	  </c:when>
																	  <c:otherwise>
																	    <i class="material-icons unlike" onclick="reviewLike('${row.rv_idx}')">favorite</i>
																	  </c:otherwise>
																	</c:choose>
																</sec:authorize>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="review_cont">
                                                        <p>
                                                            ${row.title}
                                                        </p>
                                                    </div>
                                                </div>
                                            </li>

                                            </c:forEach>
                                            <!-- <li>
                                                <div class="img_wrap">
                                                    <a href="#normal"><img src="../images/04product/01pizza/maru/0120200821213326.jpg"></a>
                                                </div>
                                                <div class="text_wrap">
                                                    <div class="review_text">
                                                        <div class="review_icon normal"></div>
                                                        <div class="review_name">Wozniak</div>
                                                        <div class="review_like">
                                                            <div class="favorite-heart">
                                                                <i class="material-icons unlike">favorite</i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="review_cont">
                                                        <p>
                                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id augue arcu vulputate phasellus pharetra. Nunc eget ut neque risus adipiscing nibh ac. In eget diam convallis leo.
                                                        </p>
                                                    </div>
                                                </div>
                                            </li> -->
                                        </ul>
                                    </div>
                                    <div class="pagingArea">
                                        <div class="common-pagingType-1">
                                             ${pagingImg } 
                                        </div>
                                    </div>
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
    
	<!-- slick area -->
	<script src="../js/slick/slick.js"></script>
	<script src="../js/slick/slick.min.js"></script>
	
	
<script type="text/javascript">
$(function(){

})
</script>


   
</body>

</html>