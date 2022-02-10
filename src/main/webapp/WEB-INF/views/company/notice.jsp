<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                                        <p class="side">총 35건</p>
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
                                                <tr>
                                                    <td>402</td>
                                                    <td><a href="./noticeView.html">
                                                            <p>설날맞이 도미노콘 이벤트 당첨자 안내</p>
                                                        </a></td>
                                                    <td>2022-02-04</td>
                                                    <td>21</td>
                                                </tr>
                                                <tr>
                                                    <td>401</td>
                                                    <td>
                                                        <a href="#">
                                                            <p>설 연휴(2월 1일) 영업매장 안내</p>
                                                        </a></td>
                                                    <td>2022-01-28</td>
                                                    <td>8715</td>
                                                </tr>
                                                <tr>
                                                    <td>400</td>
                                                    <td>
                                                        <a href="#">
                                                            <p>피자 가격 인상 안내</p>
                                                        </a></td>
                                                    <td>2022-01-27</td>
                                                    <td>372</td>
                                                </tr>
                                                <tr>
                                                    <td>399</td>
                                                    <td>
                                                        <a href="#">
                                                            <p>도미챗/마이키친 APP 서비스 종료 안내</p>
                                                        </a></td>
                                                    <td>2022-01-26</td>
                                                    <td>61</td>
                                                </tr>
                                                <tr>
                                                    <td>398</td>
                                                    <td><a href="#">
                                                            <p>음료(2종) 가격 인상 안내</p>
                                                        </a></td>
                                                    <td>2022-01-14</td>
                                                    <td>255</td>
                                                </tr>
                                                <tr>
                                                    <td>397</td>
                                                    <td><a href="#">
                                                            <p>12월 31일(금) 연장 영업 안내</p>
                                                        </a></td>
                                                    <td>2021-12-30</td>
                                                    <td>396</td>
                                                </tr>
                                                <tr>
                                                    <td>396</td>
                                                    <td><a href="#">
                                                            <p>크리스마스 이브(24일) 연장영업 안내</p>
                                                        </a></td>
                                                    <td>2021-12-23</td>
                                                    <td>384</td>
                                                </tr>
                                                <tr>
                                                    <td>395</td>
                                                    <td><a href="#">
                                                            <p>날씨로 인한 배달 지연 안내</p>
                                                        </a></td>
                                                    <td>2021-12-17</td>
                                                    <td>239</td>
                                                </tr>
                                                <tr>
                                                    <td>394</td>
                                                    <td><a href="#">
                                                            <p>'고스트버스터즈: 라이즈' 영화예매권 증정 이벤트</p>
                                                        </a></td>
                                                    <td>2021-12-08</td>
                                                    <td>196</td>
                                                </tr>
                                                <tr>
                                                    <td>393</td>
                                                    <td><a href="#">
                                                            <p>음료(6종) 가격 인상 안내</p>
                                                        </a></td>
                                                    <td>2021-12-03</td>
                                                    <td>281</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="pagingArea">
                                        <div class="common-pagingType-1">
                                            <a href="#" class="btn-prev" title="이전 페이지로 이동"><span class="hidden">이전 페이지로 이동</span></a>
                                            <a href="#none" title="현재 페이지" class="sel"><span>1</span></a>
                                            <a href="#"><span>2</span></a>
                                            <a href="#"><span>3</span></a>
                                            <a href="#"><span>4</span></a>
                                            <a href="#"><span>5</span></a>
                                            <a href="#"><span>6</span></a>
                                            <a href="#"><span>7</span></a>
                                            <a href="#"><span>8</span></a>
                                            <a href="#"><span>9</span></a>
                                            <a href="#"><span>10</span></a>
                                            <a href="#" class="btn-next" title="다음 페이지로 이동"><span class="hidden">다음 페이지로 이동</span></a>
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