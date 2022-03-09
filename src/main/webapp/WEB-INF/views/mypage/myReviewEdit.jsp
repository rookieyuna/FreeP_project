<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    <link rel="stylesheet" href="../style/mypage.css">
    <link rel="stylesheet" href="../style/layout.css">
    <!-- icon영역 -->
    <link
        href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
        rel="stylesheet">
    <!-- js 라이브러리 영역 -->
    <script src="../js/jquery-3.6.0.js"></script>

</head>

<script type="text/javascript">
function checkValidate(f){
	if(f.title.value==""){
		alert("제목을 입력하세요");
		f.title.focus();
		return false;
	}
	if(f.contents.value==""){
		alert("내용을 입력하세요");
		f.contents.focus();
		return false;
	}
	if(f.writer.value==""){
		alert("닉네임을 입력하세요");
		f.contents.focus();
		return false;
	}
	if(f.file1Txt.value==""){
		alert("첫번째 첨부파일은 필수입력 사항입니다.");
		return false;
	}
}


</script>
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
                                MY리뷰 작성하기
                            </h3>
                            <p>맛있게 드셨나요? 프리피가 어떠셨는지 알려주세요!</p>
                        </div>
                        <div class="faq">
                        	<form:form id="reviewForm" commandName="reviewForm" method="post" onsubmit="return checkValidate(this);"
                        		action="./myReviewWriteAction.do" enctype="multipart/form-data">
                        	<input type="hidden" name="id" value="<%= name %>" />
                        	<input type="hidden" name="rv_idx" value="${data.rv_idx }" />
							<div class="tab-content active" id="online">
								<div class="online_form">
									<ul>
										<li class="form_order_num">
											<label for="order_no">주문번호</label>
											<div class="form_group">
												<div class="form_field">
													<div class="form_item">
														<span class="i_label" style="position: absolute;"></span>
														<input type="text" name="or_idx" id="order_no" class="i_text"
																maxlength="20" value="${data.or_idx}" readonly
																style="width:650px">
													</div>
												</div>
											</div>
										</li>
										<li class="form_title">
											<label for="subject">제목<span>*</span></label>
											<div class="form_group">
												<div class="form_field">
													<div class="form_item">
														<span class="i_label" style="position: absolute;"></span>
														<input type="text" name="title" id="subject" class="i_text"
																maxlength="50" style="width:650px" value="${data.title }">
													</div>
												</div>
												<span class="i_error">제목을 입력하세요</span>
											</div>
										</li>
										<li class="form_title">
											<label for="subject">닉네임<span>*</span></label>
											<div class="form_group">
												<div class="form_field">
													<div class="form_item">
														<span class="i_label" style="position: absolute;"></span>
														<input type="text" name="writer" id="subject" class="i_text"
																maxlength="50" style="width:650px" value="${data.writer }" readonly="readonly">
													</div>
												</div>
												<span class="i_error">닉네임을 입력하세요</span>
											</div>
										</li>
										<!-- 주문목록에 DIY피자가 있을 경우에만 노출, 유효성 조건 필수(입력, 글자수제한) -->
										<!-- <li class="form_title">
											<label for="subject">나만의 DIY피자명<span>*</span></label>
											<div class="form_group">
												<div class="form_field">
													<div class="form_item">
														<span class="i_label" style="position: absolute;"></span>
														<input type="text" name="myPizzaName" id="subject" class="i_text"
																maxlength="50" style="width:650px">
													</div>
												</div>
												<p>※나만의 피자 이름을 만들어주세요! 한글로 3~10글자 입력 가능합니다.</p>
											</div>
										</li> -->
										<li class="form_write">
											<label for="qanContent">내용<span>*</span></label>
											<div class="form_group">
												<div class="form_field">
													<div class="form_item">
														<span class="i_label" style="position: absolute;"></span>
														<textarea name="contents" id="qanContent" class="i_text">${data.contents }</textarea>
													</div>
												</div>
												<span class="i_error">내용을 입력하세요</span>
											</div>
										</li>
										<li class="form_add_file">
											<label for="">이미지첨부<span>*</span></label>
											<div class="form_group">
												<div class="form_field">
													<div class="form_file">
														<input type="hidden" id="deleteofile1" name="deleteofile1">
													
														<div class="form_item">
															<input type="hidden" name="pre_sfile1" value="${data.rv_sfile1 }">
															<input type="text" name="file1Txt" id="file1Txt" class="i_text" value="${data.rv_ofile1 }" placeholder="필수입력">
														</div>
														<label for="file1" class="ip_file btn_srch" style="cursor:pointer"><input type="file"
																id="file1"
																name="file1"
																onchange="document.getElementById('file1Txt').value=this.value;">파일선택</label>
																<button type="button" class="ip_file btn_srch" id="deletefile1"
																	style="background: #fff;
																		    border: 1px solid #ddd;
																		    color: #999;
																		    position: relative;
																		    top: 2px;">파일 삭제
																</button>
													</div>
													<div class="form_file">
														<input type="hidden" id="deleteofile2" name="deleteofile2">
													
														<div class="form_item">
															<input type="hidden" name="pre_sfile2" value="${data.rv_sfile2 }">
															<input type="text" name="file2Txt" id="file2Txt" class="i_text" value="${data.rv_ofile2 }">
														</div>
														<label for="file2" class="ip_file btn_srch" style="cursor:pointer"><input type="file"
																id="file2"
																name="file2"
																onchange="document.getElementById('file2Txt').value=this.value;">파일선택</label>
																<button type="button" class="ip_file btn_srch" id="deletefile2" 
																	style="background: #fff;
																	    border: 1px solid #ddd;
																	    color: #999;
																	    position: relative;
																	    top: 2px;">파일 삭제
																</button>
													</div>
													<div class="form_file">
														<input type="hidden" id="deleteofile3" name="deleteofile3">
													
														<div class="form_item">
															<input type="hidden" name="pre_sfile3" value="${data.rv_sfile3 }">
															<input type="text" name="file3Txt" id="file3Txt" class="i_text" value="${data.rv_ofile3 }">
														</div>
														<label for="file3" class="ip_file btn_srch" style="cursor:pointer"><input type="file"
																id="file3"
																name="file3"
																onchange="document.getElementById('file3Txt').value=this.value;">파일선택</label>
																<button type="button" class="ip_file btn_srch" id="deletefile3"
																	style="background: #fff;
																			    border: 1px solid #ddd;
																			    color: #999;
																			    position: relative;
																			    top: 2px;">파일 삭제
																</button>
													</div>
												</div>
												<p>※파일 총 용량이 10MB 미만인 경우만 등록 가능합니다(등록가능파일: jpg, gif, bmp)</p>
											</div>
										</li>
									</ul>
								</div>
								<div class="btn-wrap">
									<button class="btn-type v4" onclick="location.href='myReview.do'">돌아가기</button>
									<button class="btn-type v6">작성완료</button>
								</div>
							</div>
							</form:form>
                        </div>
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
    
    <script type="text/javascript">
    


    $(function(){
    	$('#deletefile1').click(function(){
    		
    		var value1= document.getElementById('deleteofile1');
    		value1.value = "1";  /* 삭제 버튼이 눌렸으므로 flag 1로 바꿈 */
    		const element1 = document.getElementById('file1Txt');
    		element1.value = "";
    	}) 	
    	$('#deletefile2').click(function(){
    		
    		var value1= document.getElementById('deleteofile2');
    		value1.value = "1";
    		const element1 = document.getElementById('file2Txt');
    		element1.value = "";
    	}) 	
    	$('#deletefile3').click(function(){
    		
    		var value1= document.getElementById('deleteofile3');
    		value1.value = "1";
    		const element1 = document.getElementById('file3Txt');
    		element1.value = "";
    	}) 	
    })

	
    $("#file1").change(function() { 
    	$("#file1Txt").val(this.files && this.files.length ? this.files[0].name : this.value.replace(/^C:\\fakepath\\/i, '')); 
    })

     $("#file2").change(function() { 
    	$("#file2Txt").val(this.files && this.files.length ? this.files[0].name : this.value.replace(/^C:\\fakepath\\/i, '')); 
    })
    
     $("#file3").change(function() { 
    	$("#file3Txt").val(this.files && this.files.length ? this.files[0].name : this.value.replace(/^C:\\fakepath\\/i, '')); 
    })
    </script>
    
</body>

</html>