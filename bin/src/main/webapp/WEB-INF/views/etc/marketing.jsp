<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        /*
        아직 확실히 정해진게 아니라 그냥 기본 틀만 맞춰놓음
        */
        /*********** 기본틀 ***********/
         #container {
            padding-top: 140px;
        }
        * {
            margin: 0;
            padding: 0;
            vertical-align: baseline;
            -webkit-text-size-adjust: 100%;
            /* -webkit-box-sizing: border-box; */
            box-sizing: border-box;
            letter-spacing: -0.75px;
        }
        user agent stylesheet
        div {
            display: block;
        }
        body {
            overflow-x: hidden;
            line-height: 1;
            font-family: "Roboto","Noto",sans-serif;
            font-weight: 500;
            font-size: 14px;
            /* letter-spacing: -1px; */
            /* color: #ff143c; */
        }

        /*********** 푸터와의 간격 ***********/
        [class^='sub-type'] {
            padding-bottom: 100px;
        }

        /*********** 컨텐츠(내용)부분 ***********/
        .inner-box, #gnb .gnb-inner {
            position: relative;
            width: 1200px;
            margin: 0 auto;
        }

        /*********** 공지사항 타이틀 부분 ***********/
        [class^='sub-type'] .page-title-wrap {
            position: relative;
            margin-top: 50px;
        }
        [class^='sub-type'] .page-title {
            font-size: 32px;
            color: #111;
            font-weight: 400;
        }
        [class^='sub-type'] .page-title-wrap .depth-area {
            position: absolute;
            right: 0;
            top: 16px;
        }
        [class^='sub-type'] .page-title-wrap .depth-area ol {
            font-size: 0;
        }
        ol, ul {
            list-style: none;
        }
        ol {
            display: block;
            /*list-style-type: decimal;*/
            margin-block-start: 1em;
            margin-block-end: 1em;
            margin-inline-start: 0px;
            margin-inline-end: 0px;
            padding-inline-start: 40px;
        }

        /*********** 홈>공지사항 부분 ***********/
        [class^='sub-type'] .page-title-wrap .depth-area ol li {
            display: inline-block;
            font-size: 13px;
            color: #888888;
        }
        [class^='sub-type'] .page-title-wrap .depth-area ol li strong:before {
            /* display: inline-block; */
            content: '';
            margin: 3px 8px 2px 6px;
            display: inline-block;
            width: 6px;
            height: 6px;
            border-style: solid;
            border-color: transparent #888888 #888888 transparent;
            border-width: 0 1px 1px 0;
            /* -webkit-transform: rotate(-45deg); */
            transform: rotate(-45deg);
        }
        [class^='sub-type'] .page-title-wrap .depth-area ol li a, [class^='sub-type'] 
            .page-title-wrap .depth-area ol li strong {
            font-size: inherit;
            font-weight: inherit;
            color: #888888;
        }
        a {
            color: #333;
            text-decoration: none;
        }

        [class^='sub-type'] .menu-nav-wrap {
            position: relative;
            margin-top: 28px;
            padding-bottom: 15px;
            border-bottom: 2px solid #111;
        }
    </style>
</head>
<body>
    <div id="wrap">
        <!-- header s -->
        <!-- header e -->
        
        <!-- content s -->
        <div id="container">
                <section id="content">
                    <div class="sub-type notice">
                        <div class="inner-box">
                            <div class="page-title-wrap">
                                <h2 class="page-title">마케팅/홍보</h2>
                                <div class="depth-area">
                                    <ol>
                                        <li><a href="https://web.dominos.co.kr/bbs/newsList?type=N#">홈</a></li>
                                        <li><strong>마케팅/홍보</strong></li>
                                </ol>
                            </div>
                        </div>
                        <article class="notice-area">
                            <div class="menu-nav-wrap"></div>
                        </article>
                    </div> 
                </div>
            </section>
        </div>
        <!-- content e -->
        
        <!-- footer s -->
        <!-- footer e -->
        
        </div>
        <!-- wrap e -->
</body>
</html>