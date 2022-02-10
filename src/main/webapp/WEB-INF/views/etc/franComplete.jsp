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
    <link rel="stylesheet" href="../style/regist.css">
    <link rel="stylesheet" href="../style/layout.css">
    <!-- icon영역 -->
    <link
        href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
        rel="stylesheet">
    <!-- js 라이브러리 영역 -->
    <script src="../js/jquery-3.6.0.js"></script>
</head>
<body>
    <!-- header s -->
    <header id="header">
        <%@ include file="../common/header.jsp" %>
    </header>
    <!-- header e -->

    <!-- content s -->
    <div id="container">
        <section id="content">
            <div class="sub-type member">
                <div class="inner-box">
                    <div class="page-title-wrap v2">
                        <h2 class="page-title">가맹문의</h2>
                        <div class="depth-area">
                            <ol>
                                <li><a href="/FreeP/index.html">홈</a></li>
                                <li><strong>가맹문의</strong></li>
                            </ol>
                        </div>
                    </div>
                    <article class="join-area">
                        <div class="join-step3">
                            <div class="info-text-wrap">
                                <strong class="title">
                                    WELCOME TO
                                    <br>
                                    FREEP’S PIZZA!
                                </strong>
                                <p class="sub-txt">
                                    문의하신 내용이 정상적으로 접수되었습니다.
                                </p>
                                <div class="btn-wrap">
                                    <a href="../index.do" class="btn-type v4">HOME</a>
                                </div>
                            </div>
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
    <script>includeHTML();</script>
    
    <script src="../js/motion.js"></script>
    <script src="../js/ui.js"></script>
</body>
</html>