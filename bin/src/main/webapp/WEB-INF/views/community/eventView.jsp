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
    <link rel="stylesheet" href="../style/community.css">
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
                <div class="sub-type event">
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

                        <article class="view-area">
                            <!-- menu-list -->
                            <div class="menu-nav-wrap">
                                <div class="menu-nav">
                                    <ul>
                                        <li><a href="../community/review.do">고객후기</a></li>
	                                    <li class="active"><a href="../community/event.do">이벤트</a></li>
	                                    <li><a href="../community/question.do">1:1문의</a></li>
                                    </ul>
                                </div>
                            </div>

                            <div class="board-view sp_play">
                                <div class="freep_community">
                                    <form class="" id="eventForm" name="newsForm" method="post">
                                        <dl class="board-content">
                                            <input type="hidden" id="type" name="type" value="N">
                                            <input type="hidden" id="pageNo" name="pageNo" value="1">
                                            <input type="hidden" id="search" name="search" value="subject">
                                            <input type="hidden" id="condition" name="condition" value="">
                                            
                                                            
                                            <dt><strong>${dto.title}</strong>
                                                <ul>
                                                    <li>${dto.postdate }</li>
                                                    <li>조회
                                                        <span>${dto.hits }</span>
                                                    </li>
                                                </ul>
                                            </dt>
                                            
                                            
                                            <dd>
                                                <img src="../uploads/${dto.sfile2}" alt="">

                                                <div class="event_res">
                                                    <h6>주의사항</h6>
                                                    <ul>
                                                        <li>상기 이벤트는 내부사정에 의해 조기 종료될 수 있습니다.</li>
                                                        <li>쿠폰 지급은 다음날 오전 9시 이후 순차적으로 진행되며, 마이 페이지 내 "쿠폰/적립금" 페이지에서 확인 가능합니다.</li>
                                                        <li>2022년 2월 16일(수) 오전 8:59 전에 가입이 완료된 대상에 대해서만 쿠폰이 발급됩니다.</li>
                                                        <li>본 이벤트는 본사에서 진행하는 프로모션으로 가맹점에서 사용가능한 포인트입니다.</li>
                                                        <li>대한민국 계정을 보유한 만 12세 이상의 사용자만 참여할 수 있습니다.</li>
                                                        <li>쿠폰 지급을 위해 사용자 정보를 입력해 주세요. 잘못된 정보로 인해 지급 누락 또는 수령 불가인 경우 보상하지 않습니다.</li>
                                                        <li>그 외 자세한 내용은 공지사항의 이벤트 공식 규정을 참고해 주시기 바랍니다.</li>
                                                        <li>이벤트에 대한 자세한 문의사항은 커뮤니티의 1:1문의로 문의해 주시기 바랍니다.</li>
                                                    </ul>
                                                </div>
                                            </dd>
                                        </dl>
                                        <ul class="board-button">
                                            <li>
                                                <span>이전</span>
                                                <a href="./eventView.do?idx=${pre.b_idx }">${pre.title }
                                                </a>
                                            </li>
                                            <li>
                                                <span>다음</span>
                                                <a href="./eventView.do?idx=${next.b_idx }">${next.title }
                                                </a>
                                            </li>
                                        </ul>
                                    </form>
                                </div>
                                <div class="btn-wrap">
                                    <a href="http://localhost:8081/freepproject/community/event.do"  class="btn-type v2">목록</a>
                                </div>
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
    <script>
        includeHTML();
    </script>

    <script src="../js/motion.js"></script>
    <script src="../js/ui.js"></script>
</body>

</html>