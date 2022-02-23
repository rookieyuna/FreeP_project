<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%
    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    Object principal = auth.getPrincipal();
 
    String name = "";
    if(principal != null) {
        name = auth.getName();
    }
%>
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
    <link rel="stylesheet" href="../style/community.css">
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
                    <div class="page-title-wrap">
                        <h2 class="page-title">커뮤니티</h2>
                        <div class="depth-area">
                            <ol>
                                <li><a href="/main">홈</a></li>
                                <li><strong>커뮤니티</strong></li>
                            </ol>
                        </div>
                    </div>
                    <article class="menu-list-area">
                        <div class="menu-nav-wrap">
                            <div class="menu-nav">
                                <ul>
                                    <li><a href="../community/review.do">고객후기</a></li>
                                    <li><a href="../community/event.do">이벤트</a></li>
                                    <li class="active"><a href="../community/question.do">1:1문의</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="title-wrap-center">
                            <h3 class="title-type">
                                1:1문의
                            </h3>
                            <p>프리피 서비스 이용에 궁금한 점이 있으면 문의해주세요</p>
                        </div>


                        <div class="sp_play">
                            <div class="sp_play_wrap freep_community">

								<form:form commandName="writeFrm" method="post"
									action="./questionWriteAction.do" enctype="multipart/form-data" onsubmit="questionSubmit();">
								<input type="hidden" name="cate" value="3" />
								<input type="hidden" name="id" value="<%= name %>" />
									<div class="question-layer" id="pop-write">
										<div class="question-wrap">
											<div class="question-content">
												<div class="guide-box3">
													주문 취소 / 변경과 같은 긴급한 요청은 매장으로 연락 부탁드립니다.
												</div>

												<div class="question-area">
													<div class="step-wrap">
														<div class="form">
															<dl>
																<dt>문의유형</dt>
																<dd>
																	<div class="form-item">
																		<div class="select-type2">
																			<select id="sel" name="qcate">
																				<option value="">선택</option>
																				<option value="1">제품관련</option>
																				<option value="2">배달 서비스 관련</option>
																				<option value="3">직원 서비스 관련</option>
																				<option value="4">칭찬</option>
																				<option value="5">제안</option>
																				<option value="6">기타</option>
																			</select>
																		</div>
																	</div>
																</dd>
															</dl>
															<dl>
																<dt>제목</dt>
																<dd>
																	<div class="form-item">
																		<input type="text" id="subject" name="title" />
																	</div>
																</dd>
															</dl>
															<dl>
																<dt class="top">문의내용</dt>
																<dd>
																	<div class="form-item">
																		<textarea name="contents" id="content" cols="30" rows="10"></textarea>
																	</div>
																</dd>
															</dl>
															<dl>
																<dt>첨부파일</dt>
																<dd>
																	<div class="form-item">
																		<input type="file" id="subject" name="file" />
																	</div>
																</dd>
															</dl>
														</div>
													</div>

													<div class="btn-wrap">
														<button type="reset" class="btn-type v5">다시입력</button>
														<button class="btn-type v4">문의하기</button>
													</div>

												</div>

												<div class="bottom-guide-area">
													<div class="box">
														<div class="list-text">
															<dt>※ 유의사항</dt>
															<dd>
																<ul>
																	<li>문의에 대한 답변은 마이페이지>1:1문의 페이지에 등록됩니다.</li>
																	<li>직접 상담이 필요하신 경우 오픈챗 또는 1800-0000로 문의해주세요.</li>
																	<li>상담 운영시간 : 월~금 09:00~18:00 / 주말 및 공휴일 휴무.</li>
																</ul>
															</dd>
														</div>
													</div>
													<div class="box">
														<p class="text-type">아래 링크를 클릭하시면 마이페이지로 이동됩니다.</p>
														<div class="btn-wrap2">
															<a href="/FreeP/mypage/myQuestion.html" class="btn-type-left">답변확인 바로가기</a>
														</div>
							
													</div>
												</div>
												
											</div>
										</div>
									</div>
								</form:form>
                            </div>
                        </div>
                    </article>
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

	<script>
		//다시입력
		function doReset(){
			if(confirm("입력한 내용을 모두 지우고 다시 입력하시겠습니까?")){
				document.q.reset();
				$("#type_div1").focus();
			}
		}
		
		//문의하기
			var send = false;
		function questionSubmit(){
			/*
			if(send){
				alert('등록중 입니다.');
			
			}else{
				if($('#sel').val() == '') { alert('문의유형을 선택해주세요'); $("#sel").focus(); event.preventDefault(); return;}
				if($('#subject').val() == '') { alert('제목을 입력하세요'); $("#subject").focus(); event.preventDefault(); return;}
				if($('#content').val() == '') { alert('문의내용을 입력하세요.'); $("#content").focus(); event.preventDefault(); return;}	
				
			}	*/
			
			if($('#sel').val() == '') {
				alert('문의유형을 선택해주세요'); 
				$("#sel").focus(); event.preventDefault(); 
				return;}
			if($('#subject').val() == '') { 
				alert('제목을 입력하세요'); 
				$("#subject").focus(); event.preventDefault(); 
				return;}
			if($('#content').val() == '') { 
				alert('문의내용을 입력하세요.'); 
				$("#content").focus(); event.preventDefault(); 
				return;}	
			
			alert('1:1문의 완료(답변까지 1~3소요됩니다.)');
				return true;
			
		}
		</script>
</body>
</html>