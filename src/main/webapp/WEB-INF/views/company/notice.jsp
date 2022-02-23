<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  
<!DOCTYPE html>
<html lang="en">

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
    <link rel="stylesheet" href="../style/company.css">
    <link rel="stylesheet" href="../style/layout.css">
    <!-- icon영역 -->
    <link
        href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
        rel="stylesheet">
    <!-- js 라이브러리 영역 -->
    <script src="../js/jquery-3.6.0.js"></script>
</head>

<body>
    <div id="wrap">
        <!-- header s -->
        <header id="header">
            <%@ include file="../common/header.jsp" %>
        </header>
        <!-- header e -->

        <!-- content s -->
        <div id="container">
            <section id="content">
                <div class="sub-type notice">
                    <div class="inner-box">
                        <div class="page-title-wrap">
                            <h2 class="page-title">공지사항</h2>
                            <div class="depth-area">
                                <ol>
                                    <li><a href="/FreeP/index.html">홈</a></li>
                                    <li><strong>공지사항</strong></li>
                                </ol>
                            </div>
                        </div>
                        <article class="notice-area">
                            <!-- menu-list -->
                            <div class="menu-nav-wrap">
                                <div class="menu-nav">
                                    <ul>
                                        <li><a href="../company/intro.do">회사소개</a></li>
                                        <li class="active"><a href="../company/notice.do">공지사항</a></li>
                                        <li><a href="../company/searchStore.do">매장찾기</a></li>
                                    </ul>
                                </div>
                            </div>

                            <div class="title-wrap-center">
                                <h3 class="title-type">
                                    공지사항
                                </h3>
                                <p>다양한 프리피의 소식을 빠르고 정확하게 확인하세요</p>
                            </div>

                            <div class="notice-wrap">
                                <form id="searchForm" name="searchForm" action="https://web.dominos.co.kr/bbs/newsList"
                                    method="post">
                                    <input type="hidden" id="type" name="type" value="N">
                                    <input type="hidden" id="pageNo" name="pageNo" value="1">
                                    <div class="form-group srch-type">
                                        <div class="form-item">
                                            <div class="select-type2">
                                                <select id="search" name="search">
                                                    <option value="subject">제목</option>
                                                    <option value="content">내용</option>
                                                    <option value="all">제목+내용</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-item">
                                            <input type="text" id="conditionTemp" name="conditionTemp" placeholder="">
                                            <input type="hidden" id="condition" name="condition" class="i_text"
                                                value="">
                                        </div>
                                        <div class="form-item">
                                            <button type="button" class="btn-search" onclick="fncSearch();">
                                                <span class="material-icons-outlined">search</span>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="table-type3">
                                    
                                        <p class="side">총 ${totalRecordCount }건</p>
                                        <table>
                                            <caption>news</caption>
                                            <colgroup>
                                                <col style="width:106px">
                                                <col>
                                                <col style="width:333px">
                                                <col style="width:110px">
                                            </colgroup>
                                            <thead>
                                                <tr>
                                                    <th>번호</th>
                                                    <th>제목</th>
                                                    <th>등록일</th>
                                                    <th>조회</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                           	<c:choose>
											<c:when test="${empty lists }">
												<tr>
													<td colspan="4">
														등록된 공지사항이 없습니다.
													</td>
												</tr>
											</c:when>
											
											<c:otherwise>
												<c:forEach items="${lists }" var="row" ><!-- 리스트반복시작 -->
												<tr>
												<!-- start, end값 설정 확인 후 변수명 수정dto.b_idx  -->
													<td>${row.b_idx }</td>
													<td>
														<a href="./noticeView.do?idx=${row.b_idx}&nowPage=${nowPage}">${row.title}</a>
													</td>
													<td>${row.postdate }</td>
													<td>${row.hits }</td>
												<!-- <td class="text-center">--</td> -->
												</tr><!-- 리스트반복끝 -->
												</c:forEach>
											</c:otherwise>
											</c:choose>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="pagingArea">
                                    	<div class="common-pagingType-1">
                                    		${ pagingStr }
                                        </div>	
                                    </div>
                                </form>
                            </div>
                        </article>
                    </div>
                </div>
            </section>
        </div>
        <!-- content e -->

        <!-- footer s -->
        <footer id="footer">
            <%@ include file="../common/footer.jsp" %>
        </footer>
        <!-- footer e -->


        <!-- script area -->
        <script src="../js/includeHTML.js"></script>
        <script>
            includeHTML();
        </script>

        <script src="../js/motion.js"></script>
        <script src="../js/ui.js"></script>
</body>

</html>