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
            <div class="sub-type menu">
                <div class="inner-box">
                    <div class="page-title-wrap">
                        <h2 class="page-title">커뮤니티</h2>
                        <div class="depth-area">
                            <ol>
                                <li><a href="/FreeP/index.html">홈</a></li>
                                <li><strong>마이페이지</strong></li>
                            </ol>
                        </div>
                    </div>
                    <article class="menu-list-area">
                        <div class="menu-nav-wrap">
                            <div class="menu-nav">
                                <ul>
                                    <li><a href="../mypage/myMain.do">MY프리피</a></li>
                                    <li><a href="../mypage/myOrder.do">주문내역</a></li>
                                    <li><a href="../mypage/myCoupon.do">쿠폰/적립금</a></li>
                                    <li><a href="../mypage/myReview.do">MY리뷰</a></li>
                                    <li class="active"><a href="../mypage/myQuestion.do">1:1문의</a></li>
                                    <li><a href="../mypage/myUserinfo.do">정보수정</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="title-wrap-center">
                            <h3 class="title-type">
                                1:1문의
                            </h3>
                            <p>1:1 문의 내용을 확인하세요</p>
                        </div>


                        <div class="sp_play">
                            <div class="sp_play_wrap freep_community">

                                <div class="counsil-wrap">
                                    <div class="table-type4">
                                        <table>
                                            <caption>나의 1:1 문의 내역</caption>
                                            <colgroup>
                                                <col style="width:140px">
                                                <col>
                                                <col style="width:180px">
                                                <col style="width:180px">
                                            </colgroup>
                                            <thead>
                                                <tr>
                                                    <th>번호</th>
                                                    <th>제목</th>
                                                    <th>문의유형</th>
                                                    <th>등록일</th>
                                                </tr>
                                            </thead>
                                            
                                            <c:choose>
			                                    <c:when test="${empty lists}">
		                                            <tbody class="board-list empty hide">
		                                                <tr>
		                                                    <td colspan="4">문의하신 내용이 없습니다.</td>
		                                                </tr>
		                                            </tbody> 
						                    	</c:when>
						                    	<c:otherwise>
							                    	<!-- 가상번호 수정해야함 -->
				                                    <tbody class="board-list fill">
					                                    <c:forEach items="${lists }" var="row" varStatus="loop">
															<tr onClick="location.href='./myQuView.do?b_idx=${row.b_idx}';">
																<td>${totalQuCount - (((nowPage-1) * pageSize) + loop.index)}</td>
																<td>${row.title }</td>
																<c:choose>
											                    	<c:when test="${row.q_category eq '1'}"><td>배달문의</td></c:when>
											                    	<c:when test="${row.q_category eq '2'}"><td>예약문의</td></c:when>
											                    	<c:when test="${row.q_category eq '3'}"><td>CS</td></c:when>
											                    	<c:otherwise><td>기타</td></c:otherwise>
											                    </c:choose>
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
</body>

</html>