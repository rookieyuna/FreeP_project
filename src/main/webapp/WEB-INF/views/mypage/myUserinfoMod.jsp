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
                                    <li><a href="./myOrder.html">주문내역</a></li>
                                    <li><a href="./myCoupon.html">쿠폰/적립금</a></li>
                                    <li><a href="./myReview.html">MY리뷰</a></li>
                                    <li><a href="./myFavorite.html">나만의피자</a></li>
                                    <li><a href="./myQuestion.html">1:1문의</a></li>
                                    <li class="active"><a href="./myUserinfo.html">정보수정</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="title-wrap-center">
                            <h3 class="title-type">
                                개인정보 수정
                            </h3>
                            <p>회원님의 정보를 수정하세요</p>
                        </div>

                        <form name="frm" id="frm" action="https://web.dominos.co.kr/member/modMemberProc" method="post">
                            <div class="myinfo-wrap">
                                <div class="form">
                                    <dl>
                                        <dt>이름</dt>
                                        <dd>
                                            <span id="name_area">UserName</span>
                                        </dd>

                                    </dl>
                                    <dl>
                                        <dt class="center">아이디</dt>
                                        <dd>UserID</dd>
                                    </dl>
                                    <dl class="pw" style="display: none;">
                                        <dt>현재 비밀번호</dt>
                                        <dd>
                                            <div class="form-item number">
                                                <input type="password" name="old_passwd" id="old_passwd" maxlength="16"
                                                    value="">
                                            </div>
                                            <div class="text-type4" id="old_passwd_alert" style="display:none;"></div>
                                        </dd>
                                        <dt>새 비밀번호</dt>
                                        <dd>
                                            <div class="form-item number">
                                                <input type="password" name="passwd" id="passwd" maxlength="16" value=""
                                                    placeholder="8~16자 영문대소문자,숫자,특수문자 사용가능">
                                            </div>
                                            <div class="text-type4" id="passwd_alert" style="display:none;"></div>
                                        </dd>
                                        <dt>새 비밀번호 확인</dt>
                                        <dd>
                                            <div class="form-item number">
                                                <input type="password" name="confirmpw" id="confirmpw" maxlength="16"
                                                    value="" placeholder="8~16자 영문대소문자,숫자,특수문자 사용가능">
                                                <a href="javascript:updateChangePasswd();" class="btn-type v4">수정하기</a>
                                            </div>
                                            <div class="text-type4" id="confirmpw_alert" style="display:none;"></div>
                                        </dd>
                                    </dl>
                                    <dl class="non-pw">
                                        <dt class="center">비밀번호</dt>
                                        <dd>
                                            <a href="javascript:openPasswordChange();" class="btn-type4 v2">비밀번호 변경</a>
                                        </dd>
                                    </dl>
                                    <dl>
                                        <dt class="center">생년월일</dt>
                                        <dd>
                                            <div class="form-group v2">
                                                <div class="form-item birth">
                                                    <div class="chk-wrap">
                                                        <div class="chk-box selected">
                                                            <input type="radio" name="birth_fl" id="birth_s" value="S"
                                                                checked="" disabled="">
                                                            <label class="checkbox" for="birth_s"></label>
                                                            <label for="birth_s">양력</label>
                                                        </div>
                                                        <div class="chk-box disabled">
                                                            <input type="radio" name="birth_fl" id="birth_m" value="M"
                                                                disabled="">
                                                            <label class="checkbox" for="birth_m"></label>
                                                            <label for="birth_m">음력</label>
                                                        </div>
                                                    </div>
                                                    <div class="select-type2">
                                                        <select name="byear" id="byear" class="selected" disabled="">
                                                            <option>년</option>
                                                            <option value="1900">1900</option>
                                                            <option value="1901">1901</option>
                                                            <option value="1902">1902</option>
                                                            <option value="1903">1903</option>
                                                            <option value="1904">1904</option>
                                                            <option value="1905">1905</option>
                                                            <option value="1906">1906</option>
                                                            <option value="1907">1907</option>
                                                            <option value="1908">1908</option>
                                                            <option value="1909">1909</option>
                                                            <option value="1910">1910</option>
                                                            <option value="1911">1911</option>
                                                            <option value="1912">1912</option>
                                                            <option value="1913">1913</option>
                                                            <option value="1914">1914</option>
                                                            <option value="1915">1915</option>
                                                            <option value="1916">1916</option>
                                                            <option value="1917">1917</option>
                                                            <option value="1918">1918</option>
                                                            <option value="1919">1919</option>
                                                            <option value="1920">1920</option>
                                                            <option value="1921">1921</option>
                                                            <option value="1922">1922</option>
                                                            <option value="1923">1923</option>
                                                            <option value="1924">1924</option>
                                                            <option value="1925">1925</option>
                                                            <option value="1926">1926</option>
                                                            <option value="1927">1927</option>
                                                            <option value="1928">1928</option>
                                                            <option value="1929">1929</option>
                                                            <option value="1930">1930</option>
                                                            <option value="1931">1931</option>
                                                            <option value="1932">1932</option>
                                                            <option value="1933">1933</option>
                                                            <option value="1934">1934</option>
                                                            <option value="1935">1935</option>
                                                            <option value="1936">1936</option>
                                                            <option value="1937">1937</option>
                                                            <option value="1938">1938</option>
                                                            <option value="1939">1939</option>
                                                            <option value="1940">1940</option>
                                                            <option value="1941">1941</option>
                                                            <option value="1942">1942</option>
                                                            <option value="1943">1943</option>
                                                            <option value="1944">1944</option>
                                                            <option value="1945">1945</option>
                                                            <option value="1946">1946</option>
                                                            <option value="1947">1947</option>
                                                            <option value="1948">1948</option>
                                                            <option value="1949">1949</option>
                                                            <option value="1950">1950</option>
                                                            <option value="1951">1951</option>
                                                            <option value="1952">1952</option>
                                                            <option value="1953">1953</option>
                                                            <option value="1954">1954</option>
                                                            <option value="1955">1955</option>
                                                            <option value="1956">1956</option>
                                                            <option value="1957">1957</option>
                                                            <option value="1958">1958</option>
                                                            <option value="1959">1959</option>
                                                            <option value="1960">1960</option>
                                                            <option value="1961">1961</option>
                                                            <option value="1962">1962</option>
                                                            <option value="1963">1963</option>
                                                            <option value="1964">1964</option>
                                                            <option value="1965">1965</option>
                                                            <option value="1966">1966</option>
                                                            <option value="1967">1967</option>
                                                            <option value="1968">1968</option>
                                                            <option value="1969">1969</option>
                                                            <option value="1970">1970</option>
                                                            <option value="1971">1971</option>
                                                            <option value="1972">1972</option>
                                                            <option value="1973">1973</option>
                                                            <option value="1974">1974</option>
                                                            <option value="1975">1975</option>
                                                            <option value="1976">1976</option>
                                                            <option value="1977">1977</option>
                                                            <option value="1978">1978</option>
                                                            <option value="1979">1979</option>
                                                            <option value="1980">1980</option>
                                                            <option value="1981">1981</option>
                                                            <option value="1982">1982</option>
                                                            <option value="1983">1983</option>
                                                            <option value="1984">1984</option>
                                                            <option value="1985">1985</option>
                                                            <option value="1986">1986</option>
                                                            <option value="1987">1987</option>
                                                            <option value="1988">1988</option>
                                                            <option value="1989">1989</option>
                                                            <option value="1990">1990</option>
                                                            <option value="1991">1991</option>
                                                            <option value="1992">1992</option>
                                                            <option value="1993" selected="selected">1993</option>
                                                            <option value="1994">1994</option>
                                                            <option value="1995">1995</option>
                                                            <option value="1996">1996</option>
                                                            <option value="1997">1997</option>
                                                            <option value="1998">1998</option>
                                                            <option value="1999">1999</option>
                                                            <option value="2000">2000</option>
                                                            <option value="2001">2001</option>
                                                            <option value="2002">2002</option>
                                                            <option value="2003">2003</option>
                                                            <option value="2004">2004</option>
                                                            <option value="2005">2005</option>
                                                            <option value="2006">2006</option>
                                                            <option value="2007">2007</option>
                                                            <option value="2008">2008</option>
                                                            <option value="2009">2009</option>
                                                            <option value="2010">2010</option>
                                                            <option value="2011">2011</option>
                                                            <option value="2012">2012</option>
                                                            <option value="2013">2013</option>
                                                            <option value="2014">2014</option>
                                                            <option value="2015">2015</option>
                                                            <option value="2016">2016</option>
                                                            <option value="2017">2017</option>
                                                            <option value="2018">2018</option>
                                                            <option value="2019">2019</option>
                                                            <option value="2020">2020</option>
                                                            <option value="2021">2021</option>
                                                            <option value="2022">2022</option>
                                                        </select>
                                                    </div>
                                                    <div class="select-type2">
                                                        <select name="bmonth" id="bmonth" class="selected" disabled="">
                                                            <option>월</option>
                                                            <option value="1">1</option>
                                                            <option value="2" selected="">2</option>
                                                            <option value="3">3</option>
                                                            <option value="4">4</option>
                                                            <option value="5">5</option>
                                                            <option value="6">6</option>
                                                            <option value="7">7</option>
                                                            <option value="8">8</option>
                                                            <option value="9">9</option>
                                                            <option value="10">10</option>
                                                            <option value="11">11</option>
                                                            <option value="12">12</option>
                                                        </select>
                                                    </div>
                                                    <div class="select-type2">
                                                        <select name="bday" id="bday" class="selected" disabled="">
                                                            <option>일</option>
                                                            <option value="1">1</option>
                                                            <option value="2">2</option>
                                                            <option value="3">3</option>
                                                            <option value="4">4</option>
                                                            <option value="5">5</option>
                                                            <option value="6">6</option>
                                                            <option value="7">7</option>
                                                            <option value="8">8</option>
                                                            <option value="9">9</option>
                                                            <option value="10">10</option>
                                                            <option value="11">11</option>
                                                            <option value="12">12</option>
                                                            <option value="13">13</option>
                                                            <option value="14" selected="">14</option>
                                                            <option value="15">15</option>
                                                            <option value="16">16</option>
                                                            <option value="17">17</option>
                                                            <option value="18">18</option>
                                                            <option value="19">19</option>
                                                            <option value="20">20</option>
                                                            <option value="21">21</option>
                                                            <option value="22">22</option>
                                                            <option value="23">23</option>
                                                            <option value="24">24</option>
                                                            <option value="25">25</option>
                                                            <option value="26">26</option>
                                                            <option value="27">27</option>
                                                            <option value="28">28</option>
                                                            <option value="29">29</option>
                                                            <option value="30">30</option>
                                                            <option value="31">31</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </dd>
                                    </dl>
                                    <dl>
                                        <dt class="center">휴대전화</dt>
                                        <dd>
                                            <div class="form-group v2">
                                                <div class="form-item">
                                                    <div class="select-type2">
                                                        <select name="sel_hand_tel1" id="sel_hand_tel1"
                                                            class="selected">
                                                            <option value="010" selected="">010</option>
                                                            <option value="011">011</option>
                                                            <option value="016">016</option>
                                                            <option value="017">017</option>
                                                            <option value="018">018</option>
                                                            <option value="019">019</option>
                                                        </select>
                                                    </div>
                                                    <input type="text" name="hand_tel2" id="hand_tel2" maxlength="4"
                                                        value="">
                                                    <input type="text" name="hand_tel3" id="hand_tel3" maxlength="4"
                                                        value="">
                                                    <a href="javascript:doUpdatePhone();" id="updatePhoneBtn"
                                                        class="btn-type v7">변경/확인</a>
                                                    <a href="javascript:doSendAuthKey();" id="sendAuthBtn"
                                                        class="btn-type v7" style="display:none;">인증요청</a>
                                                    <a href="javascript:void(0);" id="successAuthBtn"
                                                        class="btn-type v7" style="display:none;">인증완료</a>
                                                </div>
                                                <div class="text-type4" id="tel_alert" style="display:none;"></div>
                                            </div>
                                        </dd>
                                    </dl>
                                    <dl id="securityAuth" style="display:none;">
                                        <dt class="center">인증번호 입력</dt>
                                        <dd>
                                            <div class="form-group2">
                                                <div class="form-item number">
                                                    <input type="text" name="security_no" id="security_no"
                                                        disabled="disabled" maxlength="4">
                                                    <a href="javascript:doAuthKeyChk();" class="btn-type v4">인증하기</a>
                                                </div>
                                                <div class="text-type4" id="security_aleart" style="display:none;">
                                                </div>
                                            </div>
                                        </dd>
                                    </dl>

                                    <dl>
                                        <dt class="center">이메일</dt>
                                        <dd>
                                            <div class="form-group v2">
                                                <div class="form-item e-mail">
                                                    <input type="text" name="email1" id="email1" value="">
                                                    <span>@</span>
                                                    <input type="text" name="email2" id="email2" value="">
                                                    <div class="select-type2">
                                                        <select name="email3" id="email3" onchange="">
                                                            <option>선택</option>
                                                            <option value="naver.com">네이버</option>
                                                            <option value="hanmail.net" selected="">한메일</option>
                                                            <option value="gmail.com">지메일</option>
                                                            <option value="hotmail.com">핫메일</option>
                                                            <option value="nate.com">네이트</option>
                                                            <option value="WRITE">직접입력</option>
                                                        </select>
                                                    </div>
                                                    <a href="javascript:doCheckEmail();" class="btn-type v7">변경/확인</a>
                                                </div>
                                                <div class="text-type4" id="email_alert" style="display:none;"></div>
                                            </div>
                                        </dd>
                                    </dl>
                                    <dl>
                                        <dt>정보 수신동의</dt>
                                        <dd>
                                            <div class="form agree">
                                                <div class="chk-box v4">
                                                    <input type="checkbox" id="all" name="agreeType" class="all-check">
                                                    <label class="checkbox" for="all"></label>
                                                    <label for="all">전체 동의하기</label>
                                                </div>
                                                <ul>
                                                    <li>
                                                        <div class="chk-box agree-children">
                                                            <input type="checkbox" id="chk_dm_fl" name="chk_dm_fl"
                                                                value="Y">
                                                            <label class="checkbox" for="chk_dm_fl"></label>
                                                            <label for="chk_dm_fl">이메일을 통한 제품 및 이벤트 정보수신에
                                                                동의합니다.(선택)</label>
                                                        </div>
                                                        <div class="chk-box agree-children">
                                                            <input type="checkbox" id="chk_ds_fl" name="chk_ds_fl"
                                                                value="Y">
                                                            <label class="checkbox" for="chk_ds_fl"></label>
                                                            <label for="chk_ds_fl">문자(SMS,MMS 등)를 통한 제품 및 이벤트 정보수신에
                                                                동의합니다.(선택)</label>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="text-type">
                                                - 정보수신 미 동의 시 이벤트 / 할인쿠폰 / 신제품 등의 안내를 받으실 수 없습니다.<br>
                                                - 회원정보, 서비스 주요정책 관련 메시지는 수신동의 여부와 관계없이 발송됩니다.<br>
                                                ※ 동의를 거부하시는 경우에도 프리피 서비스는 이용하실 수 있습니다.<br>
                                            </div>
                                        </dd>
                                    </dl>
                                    <dl>
                                        <dt>개인정보 유효기간 선택</dt>
                                        <dd>
                                            <div class="chk-wrap">
                                                <div class="chk-box">
                                                    <input type="radio" name="info_years" id="info_years1" value="1">
                                                    <label class="checkbox" for="info_years1"></label>
                                                    <label for="info_years1">1년</label>
                                                </div>
                                                <div class="chk-box selected">
                                                    <input type="radio" name="info_years" id="info_years3" value="3"
                                                        checked="">
                                                    <label class="checkbox" for="info_years3"></label>
                                                    <label for="info_years3">3년</label>
                                                </div>
                                                <div class="chk-box">
                                                    <input type="radio" name="info_years" id="info_years5" value="5">
                                                    <label class="checkbox" for="info_years5"></label>
                                                    <label for="info_years5">5년</label>
                                                </div>
                                            </div>
                                            <div class="text-type">
                                                - 설정하신 기간동안 로그인/주문 등의 서비스 이용이 없을 시, 휴면계정으로 처리되어 각종 이벤트/쿠폰혜택을 받아보실 수
                                                없습니다.
                                            </div>
                                        </dd>
                                    </dl>
                                    <dl>
                                </div>
                                <div class="btn-wrap">
                                    <a href="javascript:location.reload();" class="btn-type v4">초기화</a>
                                    <a href="javascript:goUpdte();" class="btn-type v6">수정하기</a>
                                    <p class="desc">프리피를 더 이상 이용하지 않는다면<a href="#" class="btn-link"><span>회원탈퇴
                                                바로가기</span></a></p>
                                </div>
                            </div>
                        </form>



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