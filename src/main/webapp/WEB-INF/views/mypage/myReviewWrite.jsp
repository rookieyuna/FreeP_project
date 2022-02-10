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
    <link rel="stylesheet" href="../style/mypage.css">
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
                                    <li><a href="./myMain.html">MY프리피</a></li>
                                    <li class="active"><a href="./myOrder.html">주문내역</a></li>
                                    <li><a href="./myCoupon.html">쿠폰/적립금</a></li>
                                    <li><a href="./myReview.html">MY리뷰</a></li>
                                    <li><a href="./myFavorite.html">나만의피자</a></li>
                                    <li><a href="./myQuestion.html">1:1문의</a></li>
                                    <li><a href="./myUserinfo.html">정보수정</a></li>
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
                            <form id="reviewForm" name="reviewForm" method="post" action="#" enctype="multipart/form-data">
								<input type="hidden" id="email" name="email" value="" />
							<div class="tab-content active" id="online">
								<div class="online_form">
									<ul>
										<li class="form_order_num">
											<label for="order_no">주문번호</label>
											<div class="form_group">
												<div class="form_field">
													<div class="form_item">
														<span class="i_label" style="position: absolute;"></span>
														<input type="text" name="order_no" id="order_no" class="i_text"
																maxlength="20" value="order-12345" readonly
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
														<input type="text" name="subject" id="subject" class="i_text"
																maxlength="50" style="width:650px">
													</div>
												</div>
												<span class="i_error">제목을 입력하세요</span>
											</div>
										</li>
										<!-- 주문목록에 DIY피자가 있을 경우에만 노출, 유효성 조건 필수(입력, 글자수제한) -->
										<li class="form_title">
											<label for="subject">나만의 DIY피자명<span>*</span></label>
											<div class="form_group">
												<div class="form_field">
													<div class="form_item">
														<span class="i_label" style="position: absolute;"></span>
														<input type="text" name="subject" id="subject" class="i_text"
																maxlength="50" style="width:650px">
													</div>
												</div>
												<p>※나만의 피자 이름을 만들어주세요! 한글로 3~10글자 입력 가능합니다.</p>
											</div>
										</li>
										<li class="form_write">
											<label for="qanContent">내용<span>*</span></label>
											<div class="form_group">
												<div class="form_field">
													<div class="form_item">
														<span class="i_label" style="position: absolute;"></span>
														<textarea name="content" id="qanContent" class="i_text"></textarea>
													</div>
												</div>
												<span class="i_error">내용을 입력하세요</span>
											</div>
										</li>
										<li class="form_add_file">
											<label for="">이미지첨부</label>
											<div class="form_group">
												<div class="form_field">
													<div class="form_file">
														<div class="form_item">
															<input type="text" name="file1Txt" id="file1Txt" class="i_text">
														</div>
														<label for="file1" class="ip_file btn_srch"><input type="file"
																id="file1"
																name="file1"
																onchange="document.getElementById('file1Txt').value=this.value;">파일선택</label>
													</div>
													<div class="form_file">
														<div class="form_item">
															<input type="text" name="file2Txt" id="file2Txt" class="i_text">
														</div>
														<label for="file2" class="ip_file btn_srch"><input type="file"
																id="file2"
																name="file2"
																onchange="document.getElementById('file2Txt').value=this.value;">파일선택</label>
													</div>
													<div class="form_file">
														<div class="form_item">
															<input type="text" name="file3Txt" id="file3Txt" class="i_text">
														</div>
														<label for="file3" class="ip_file btn_srch"><input type="file"
																id="file3"
																name="file3"
																onchange="document.getElementById('file3Txt').value=this.value;">파일선택</label>
													</div>
												</div>
												<p>※파일 총 용량이 10MB 미만인 경우만 등록 가능합니다(등록가능파일: jpg, gif, bmp)</p>
											</div>
										</li>
									</ul>
								</div>
								<div class="btn-wrap">
									<a href="javascript:doReset();" class="btn-type v4">다시입력</a>
									<a href="javascript:proc();" class="btn-type v6">작성완료</a>
								</div>
							</div>
							</form>
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
    
</body>

</html>