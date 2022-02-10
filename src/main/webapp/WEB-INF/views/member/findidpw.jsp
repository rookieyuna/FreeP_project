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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

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
                    <div class="page-title-wrap">
                        <h2 class="page-title">아이디/비밀번호 찾기</h2>
                        <div class="depth-area">
                            <ol>
                                <li><a href="../main.html">홈</a></li>
                                <li><strong>아이디/비밀번호 찾기</strong></li>
                            </ol>
                        </div>
                    </div>
                    <article class="srch-member">
                        <div class="menu-nav-wrap">
                            <div class="menu-nav js_tab">
                                <ul>
                                    <li class="srchId active"><a href="#srchId">아이디찾기</a></li>
                                    <li class="srchPw"><a href="#srchPw">비밀번호찾기</a></li>
                                 </ul>
                            </div>
                        </div>
                        
                        <div class="tab-content active" id="srchId">
                            <div class="login-type">
                                <ul>
                                    <li>
                                        <div>
                                            <i class="ico-login1"></i>
                                            <p class="title-type4">회원 정보로 찾기</p>
                                            <div class="btn-wrap">
                                                <a href="javascript:openIdByInside('srchId');" class="btn-type v4">회원정보 인증</a>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <i class="ico-login2"></i>
                                            <p class="title-type4">본인인증(휴대전화)으로 찾기</p>
                                            <div class="btn-wrap">
                                                <a href="javascript:findIdByKG();" class="btn-type v4">본인 인증</a>
                                            </div>
                                        </div>
                                    </li>
                                    <!-- <li>
                                        <div>
                                            <i class="ico-login3"></i>
                                            <p class="title-type4">아이핀(I-pin)으로 찾기</p>
                                            <div class="btn-wrap">
                                                <a href="javascript:findIdByIpin();" class="btn-type v4">아이핀 인증</a>
                                            </div>
                                        </div>
                                    </li> -->
                                </ul>
                            </div>
                            
                            <!-- 아이디찾기 결과-->
                            <div class="result-box v2" id="result_id" style="display:none;">
                                <div class="result-list">
                                    <p class="sub-tit">고객님의 정보와 일치하는 아이디 목록입니다.</p>
                                    
                                </div>
                                     
                                <div class="btn-wrap">
                                    <a href="javascript:findLogin();" class="btn-type v6">로그인</a>
                                    <a href="javascript:srchPw()" class="btn-type v4">비밀번호 찾기</a>
                                </div>
                            </div>
                            <!-- //아이디찾기 결과-->
                            
                            <!-- 아이디 찾기 결과: 휴면계정일 경우 -->
                            <div class="result-box" id="result_dormancy" style="display:none;">
                                <div class="title-wrap">
                                    <p class="title-type user_info">
                                    </p>
                                    
                                   <!--  <div class="title-type user_info">
                                        <div class="title"></div>
                                        <style>
                                            #id_list{margin-top:40px;overflow:hidden;width:400px;}
                                            #id_list li {overflow:hidden;font-size:22px;}
                                            #id_list li em{float:left;}
                                            #id_list li span{float:right;}
                                        </style>
                                        <ul id="id_list" >
                                           </ul>
                                    </div> -->
                                    
                                </div>
                                <p class="sub-text"> 회원님의 ID는 휴면계정으로 관리 중 입니다. <br>기존 ID 및 정보는 휴면계정 해제 후 재이용이 가능합니다.<br>휴면계정을 해제하시겠습니까?</p>
                                <p class="sub-text"> 신용평가기관을 통해 실명 인증된 프리피 아이디입니다.</p>
                                <div class="btn-wrap">
                                    <a href="javascript:clearDormancy();" class="btn-type v6">확인</a>
                                    <a href="../main.html" class="btn-type v4">취소</a>
                                </div>
                            </div>
                            <!-- //아이디 찾기 결과: 휴면계정일 경우 -->
                            
                        </div>
                        
                        <!-- 비밀번호 찾기 -->
                        <div class="tab-content" id="srchPw">
                            <div class="login-type">
                                <ul>
                                    <li>
                                        <div>
                                            <i class="ico-login1"></i>
                                            <p class="title-type4">회원 정보로 찾기</p>
                                            <div class="form-item">
                                                <input type="text" id="info_id" placeholder="아이디">
                                            </div>
                                            <div class="btn-wrap">
                                                <a href="javascript:openIdByInside('srchPw');" class="btn-type v4">회원정보 인증</a>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <i class="ico-login2"></i>
                                            <p class="title-type4">본인인증(휴대전화)으로 찾기</p>
                                            <div class="form-item">
                                                <input type="text" id="kg_id" placeholder="아이디">
                                            </div>
                                            <div class="btn-wrap">
                                                <a href="javascript:findPwdByKG();" class="btn-type v4">본인 인증</a>
                                            </div>
                                        </div>
                                    </li>
                                    <!-- <li>
                                        <div>
                                            <i class="ico-login3"></i>
                                            <p class="title-type4">아이핀(I-pin)으로 찾기</p>
                                            <div class="form-item">
                                                <input type="text" id="ipin_id" placeholder="아이디">
                                            </div>
                                            <div class="btn-wrap">
                                                <a href="javascript:findPwdByIpin();" class="btn-type v4">아이핀 인증</a>
                                            </div>
                                        </div>
                                    </li> -->
                                </ul>
                            </div>
                            
                            <!--비밀번호 변경-->
                            <div class="change-box" style="display:none;">
                                <div class="title-wrap">
                                    <p class="title-type">비밀번호 변경</p>
                                </div>
                                <p class="sub-text">새로 사용할 비밀번호를 입력하세요.</p>
                                <div class="form">
                                    <dl>
                                        <dt>새 비밀번호</dt>
                                        <dd><input type="password" id="passwd" value=""placeholder="8~16자 영문대소문자,숫자, 특수문자 사용가능">
                                            <div class="text-type4" style="display:none;" id="passwd_alert">비밀번호는 8~16자로 입력해주세요.</div>
                                        </dd>
                                    </dl>
                                    <dl>
                                        <dt>새 비밀번호 확인</dt>
                                        <dd><input type="password" id="confirmpw" value="" placeholder="">
                                            <div class="text-type4" style="display:none;" id="confirmpw_alert">비밀번호가 일치하지 않습니다.</div>
                                        </dd>
                                    </dl>
                                </div>
                                <div class="btn-wrap">
                                    <a href="javascript:updateChangePasswd();" class="btn-type v4">비밀번호 변경</a>
                                </div>
                            </div>
                            <!--//비밀번호 변경-->
                        </div>
                        <div class="info-guide">
                            <ul class="list-text-v2">
                                <li>신용평가기관을 통해 프리피에 가입하신 아이디,비밀번호 찾기를 진행하며, 당사는 고객의 주민등록번호를 저장하지 않습니다.</li>
                            </ul>
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