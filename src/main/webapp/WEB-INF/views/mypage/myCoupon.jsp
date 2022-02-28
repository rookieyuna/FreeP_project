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
                                    <li><a href="../mypage/myMain.do">MY프리피</a></li>
                                    <li><a href="../mypage/myOrder.do">주문내역</a></li>
                                    <li class="active"><a href="../mypage/myCoupon.do">쿠폰/적립금</a></li>
                                    <li><a href="../mypage/myReview.do">MY리뷰</a></li>
                                    <li><a href="../mypage/myQuestion.do">1:1문의</a></li>
                                    <li><a href="../mypage/myUserinfo.do">정보수정</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="title-wrap-center">
                            <h3 class="title-type">
                                쿠폰/적립금
                            </h3>
                            <p>보유하신 쿠폰 및 적립금 내역을 확인해보세요</p>
                        </div>

                        <div class="CP-wrap">
                            <div class="tab-type6"><!--2020-01-03 클래스명수정-->
                                <ul class="tabTab">
                                    <li class="active"><button class="btnC1">내 쿠폰</button></li>
                                    <li><button class="btnC1" onclick="location.href='myPoint.do?';">내 적립금</button></li>
                                </ul>
                            </div>

                            <div class="tab-list">
                                <div class="coupon-area active">
                                    <div class="myCoup_lsit table-type4">
                                        <table class="myCP_list">
                                            <caption>내 쿠폰 목록</caption>
                                            <colgroup>
                                                <col style="width:50%">
                                                <col style="width:50%">
                                            </colgroup>
                                            <thead>
                                            <tr>
                                                <th>쿠폰명</th>
                                                <th>유효기간</th>
                                            </tr>
                                            </thead>
                                            
                                            <c:choose>
												<c:when test="${empty couponlist }">
						                    		<tbody class="board-list empty hide">
		                                                <tr>
		                                                    <td colspan="2">보유하신 쿠폰이 없습니다.</td>
		                                                </tr>
		                                            </tbody>
												</c:when>
												<c:otherwise>
													<tbody class="board-list fill">
														<c:forEach items="${couponlist }" var="row">
															<tr>
			                                                    <td>[${row.cp_name }] ${row.cp_cate }</td>
			                                                    <c:set var="issue_date" value="${row.issue_date }" />
			                                                    <c:set var="expire_date" value="${row.expire_date }" />
			                                                    <td>${fn:substring(issue_date, 0, 10)} ~ ${fn:substring(expire_date, 0, 10)}</td>
			                                                </tr>
														</c:forEach>
													</tbody>
												</c:otherwise>
                                            </c:choose>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- 페이지 번호 -->
							<div class="pagingArea">
								<div class="common-pagingType-1">
									<ul class="pagination">
										${pagingImg }
									</ul>
								</div>
							</div>

                            <!-- 적립금 -->
                            <div class="btn-wrap">
                                <a href="../order/orderNormal.do" class="btn-type v4">주문 바로가기</a>
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


    <script src="../js/includeHTML.js"></script>
    <script>includeHTML();</script>

    <script src="../js/motion.js"></script>
    <script src="../js/ui.js"></script>
    
</body>

</html>