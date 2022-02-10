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
=                            </div>
                        </div>

                        <article class="view-area">
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

                            <div class="board-view">
                                <form id="newsForm" name="newsForm" method="post">
                                    <dl class="board-content">
                                        <input type="hidden" id="type" name="type" value="N">
                                        <input type="hidden" id="pageNo" name="pageNo" value="1">
                                        <input type="hidden" id="search" name="search" value="subject">
                                        <input type="hidden" id="condition" name="condition" value="">
                                        <dt><strong>피자 가격 인상 안내</strong>
                                            <ul>
                                                <li>2022-01-27</li>
                                                <li>조회
                                                    <span>375</span>
                                                </li>
                                            </ul>
                                        </dt>
                                        <dd>
                                            <p>
                                                세계 배달 피자 리더 도미노피자를 사랑해주시는고객님들께 진심으로 감사드립니다.
                                                <br>
                                                한국 도미노피자는 최고 품질의 피자를 최상의 서비스로 제공해 드리기 위해 항상 최선을 다해왔습니다.<br>
                                                하지만 지속적인 원가 상승으로 인해 2022년 1월 27일(목)부터 부득이하게
                                                피자 10종의 가격을 인상하게 되었습니다.
                                                <br>
                                                (자세한 내용은 홈페이지 내 메뉴에서 확인 가능합니다.)
                                            </p>
                                            <p>&nbsp;</p>
                                            <p>
                                                고객 여러분의 넓은 이해와 양해를 부탁드리며
                                                <br>
                                                최고의 서비스와 최고의 메뉴로 고객님의 사랑과 관심에
                                                <br>보답할 수 있도록 최선을 다 하겠습니다.
                                            </p>
                                            <p>감사합니다.</p>
                                        </dd>
                                    </dl>
                                    <ul class="board-button">
                                        <li>
                                            <span>이전</span>
                                            <a href="https://web.dominos.co.kr/bbs/newsView?idx=2643#none"
                                                onclick="goView('2645', 'view'); return false;">설 연휴(2월 1일) 영업매장 안내
                                            </a>
                                        </li>
                                        <li>
                                            <span>다음</span>
                                            <a href="https://web.dominos.co.kr/bbs/newsView?idx=2643#none"
                                                onclick="goView('2642', 'view'); return false;">도미챗/마이키친 APP 서비스 종료 안내
                                            </a>
                                        </li>
                                    </ul>
                                </form>
                            </div>
                            <div class="btn-wrap">
                                <a href="" class="btn-type v2">목록</a>
                            </div>
                        </article>
                    </div>
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
    <script>includeHTML();</script>
    
    <script src="../js/motion.js"></script>
    <script src="../js/ui.js"></script>
</body>
</html>