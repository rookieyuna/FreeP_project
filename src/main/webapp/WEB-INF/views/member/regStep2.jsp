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
    <script>
        $('input.all-check-agree').click(function(){
            var state = $('.all-check-agree').is(':checked');
            if(state){		
                $("#agree_all").parents(".agree").find("input").prop("checked",this.checked);
                $("#agree_all").parents(".agree").find(".chk-box").addClass("selected");
                $("#agree_all2").parents(".agree").find("input").prop("checked",this.checked);
                $("#agree_all2").parents(".agree").find(".chk-box").addClass("selected");
            }
            else{
                $("#agree_all").parents(".agree").find("input").prop("checked",this.checked);
                $("#agree_all").parents(".agree").find(".chk-box").removeClass("selected");
                $("#agree_all2").parents(".agree").find("input").prop("checked",this.checked);
                $("#agree_all2").parents(".agree").find(".chk-box").removeClass("selected");
            }
        });
    </script>
    <style>
        
    </style>
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
                    <h2 class="page-title">회원가입</h2>
                    <div class="depth-area">
                        <ol>
                            <li><a href="/FreeP/index.html">홈</a></li>
                            <li><strong>회원가입</strong></li>
                        </ol>
                    </div>
                </div>
                <article class="join-area">
                    <div class="join-step2">
                        <div class="step-list">
                            <ul>
                                <li>01 본인인증</li>
                                <li class="active">02 개인정보입력</li>
                                <li>03 가입완료</li>
                            </ul>
                        </div>
                        <div class="myinfo-wrap">
                            <div class="form">
                            <form name="frm" id="frm" action="https://web.dominos.co.kr/member/regStep2Proc" method="post">
                            <input type="hidden" name="parent_email" id="parent_email">
                            <input type="hidden" name="dupInfo" id="dupInfo" value="MC0GCCqGSIb3DQIJAyEAGpryv5hXuF3Mze96RapmC//9q0rovUNhxVKAfNF7lhY=">
                            <input type="hidden" name="connInfo" id="connInfo" value="csf72nHasLNu3IL4dOX9P+AXuuS5CXd0ypD3QBmw4XSrcRxhSPFi0S/Y6n/R2sr8hgZyXYU8U6rPqAoU0+yFWg==">
                            <input type="hidden" name="auth_type" id="auth_type" value="kg">
                            <input type="hidden" name="age" id="age" value="26">
                            <input type="hidden" name="vno" id="vno" value="">
                            <input type="hidden" name="birth" id="birth" value="">
                            <input type="hidden" name="job" id="job" value="">
                            <input type="hidden" name="idDupChk" id="idDupChk" value="N">
                            <input type="hidden" name="frnDupChk" id="frnDupChk" value="N">
                            <input type="hidden" name="hand_tel_agency" id="hand_tel_agency">
                            <input type="hidden" name="hand_tel1" id="hand_tel1">
                            <input type="hidden" name="email" id="email">
                            <input type="hidden" name="dm_fl" id="dm_fl" value="N">
                            <input type="hidden" name="o_dm_fl" id="o_dm_fl" value="N">
                            <input type="hidden" name="ds_fl" id="ds_fl" value="N">
                            <input type="hidden" name="hdnAuthKey" id="hdnAuthKey" value="">
                            <input type="hidden" name="hdnAuthChk" id="hdnAuthChk" value="Y">
                            <input type="hidden" name="joinptype" id="joinptype" value="D">
                            <input type="hidden" name="emailChk" id="emailChk" value="">
                            
                                <dl>
                                    <dt class="center">이름</dt>
                                    <dd>
                                        <div class="form-item name">
                                            <input type="text" placeholder="" id="name" name="name" value="" >
                                        </div>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt class="top">아이디</dt>
                                    <dd>
                                        <div class="form-item name">
                                            <input type="text" name="id" id="id" maxlength="16">
                                            <a href="javascript:idCheck($(&#39;#id&#39;));" class="btn-type v7">중복확인</a>
                                        </div>
                                        <div class="text-type4" id="id_alert" style="display:none;"></div>
                                    </dd>
                                    
                                </dl>
                                <dl>
                                    <dt class="top">비밀번호</dt>
                                    <dd class="mb">
                                        <div class="form-item number">
                                            <input type="password" name="passwd" id="passwd" maxlength="16" placeholder="8~16자 영문대소문자,숫자, 특수문자 사용가능">
                                        </div>
                                        <div class="text-type4" id="passwd_alert" style="display:none;"></div>
                                    </dd>
                                    <dt class="top">비밀번호 확인</dt>
                                    <dd>
                                        <div class="form-item number">
                                            <input type="password" name="confirmpw" id="confirmpw" maxlength="16" value="">
                                        </div>
                                        <div class="text-type4" id="confirmpw_alert" style="display:none;"></div>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt class="center">생년월일</dt>
                                    <dd>
                                        <div class="form-group v2">
                                            <div class="form-item birth">
                                                <div class="chk-wrap">
                                                    <div class="chk-box selected">
                                                        <input type="radio" name="birth_fl" id="birth_s" value="S" checked="checked">
                                                        <label class="checkbox" for="birth_s"></label>
                                                        <label for="birth_s">양력</label>
                                                    </div>
                                                    <div class="chk-box">
                                                        <input type="radio" name="birth_fl" id="birth_m" value="M">
                                                        <label class="checkbox" for="birth_m"></label>
                                                        <label for="birth_m">음력</label>
                                                    </div>
                                                </div>
                                                <div class="select-type2">
                                                    <select name="byear" id="byear" class="selected">
                                                        <option value="">년</option>
                                                        <option value="2022">2022</option>
                                                        <option value="2021">2021</option>
                                                        <option value="2020">2020</option>
                                                        <option value="2019">2019</option>
                                                        <option value="2018">2018</option>
                                                        <option value="2017">2017</option>
                                                        <option value="2016">2016</option>
                                                        <option value="2015">2015</option>
                                                        <option value="2014">2014</option>
                                                        <option value="2013">2013</option>
                                                        <option value="2012">2012</option>
                                                        <option value="2011">2011</option>
                                                        <option value="2010">2010</option>
                                                        <option value="2009">2009</option>
                                                        <option value="2008">2008</option>
                                                        <option value="2007">2007</option>
                                                        <option value="2006">2006</option>
                                                        <option value="2005">2005</option>
                                                        <option value="2004">2004</option>
                                                        <option value="2003">2003</option>
                                                        <option value="2002">2002</option>
                                                        <option value="2001">2001</option>
                                                        <option value="2000">2000</option>
                                                        <option value="1999">1999</option>
                                                        <option value="1998">1998</option>
                                                        <option value="1997">1997</option>
                                                        <option value="1996">1996</option>
                                                        <option value="1995">1995</option>
                                                        <option value="1994">1994</option>
                                                        <option value="1993">1993</option>
                                                        <option value="1992">1992</option>
                                                        <option value="1991">1991</option>
                                                        <option value="1990">1990</option>
                                                        <option value="1989">1989</option>
                                                        <option value="1988">1988</option>
                                                        <option value="1987">1987</option>
                                                        <option value="1986">1986</option>
                                                        <option value="1985">1985</option>
                                                        <option value="1984">1984</option>
                                                        <option value="1983">1983</option>
                                                        <option value="1982">1982</option>
                                                        <option value="1981">1981</option>
                                                        <option value="1980">1980</option>
                                                        <option value="1979">1979</option>
                                                        <option value="1978">1978</option>
                                                        <option value="1977">1977</option>
                                                        <option value="1976">1976</option>
                                                        <option value="1975">1975</option>
                                                        <option value="1974">1974</option>
                                                        <option value="1973">1973</option>
                                                        <option value="1972">1972</option>
                                                        <option value="1971">1971</option>
                                                        <option value="1970">1970</option>
                                                        <option value="1969">1969</option>
                                                        <option value="1968">1968</option>
                                                        <option value="1967">1967</option>
                                                        <option value="1966">1966</option>
                                                        <option value="1965">1965</option>
                                                        <option value="1964">1964</option>
                                                        <option value="1963">1963</option>
                                                        <option value="1962">1962</option>
                                                        <option value="1961">1961</option>
                                                        <option value="1960">1960</option>
                                                        <option value="1959">1959</option>
                                                        <option value="1958">1958</option>
                                                        <option value="1957">1957</option>
                                                        <option value="1956">1956</option>
                                                        <option value="1955">1955</option>
                                                        <option value="1954">1954</option>
                                                        <option value="1953">1953</option>
                                                        <option value="1952">1952</option>
                                                        <option value="1951">1951</option>
                                                        <option value="1950">1950</option>
                                                        <option value="1949">1949</option>
                                                        <option value="1948">1948</option>
                                                        <option value="1947">1947</option>
                                                        <option value="1946">1946</option>
                                                        <option value="1945">1945</option>
                                                        <option value="1944">1944</option>
                                                        <option value="1943">1943</option>
                                                        <option value="1942">1942</option>
                                                        <option value="1941">1941</option>
                                                        <option value="1940">1940</option>
                                                        <option value="1939">1939</option>
                                                        <option value="1938">1938</option>
                                                        <option value="1937">1937</option>
                                                        <option value="1936">1936</option>
                                                        <option value="1935">1935</option>
                                                        <option value="1934">1934</option>
                                                        <option value="1933">1933</option>
                                                        <option value="1932">1932</option>
                                                        <option value="1931">1931</option>
                                                        <option value="1930">1930</option>
                                                        <option value="1929">1929</option>
                                                        <option value="1928">1928</option>
                                                        <option value="1927">1927</option>
                                                        <option value="1926">1926</option>
                                                        <option value="1925">1925</option>
                                                        <option value="1924">1924</option>
                                                        <option value="1923">1923</option>
                                                        <option value="1922">1922</option>
                                                        <option value="1921">1921</option>
                                                        <option value="1920">1920</option>
                                                        </select>
                                                </div>
                                                <div class="select-type2">
                                                    <select name="bmonth" id="bmonth" class="selected">
                                                        <option>월</option>
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
                                                        </select>
                                                </div>
                                                <div class="select-type2">
                                                    <select name="bday" id="bday" class="selected" >
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
                                                        <option value="14">14</option>
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
                                                </div> <br>
                                                <div class="text-type4" id="birth_alert" style="display:none;"></div>
                                            </div>
                                        </div>

                                    </dd>
                                </dl>
                                
                                <dl>
                                    <dt class="top">휴대전화</dt>
                                    <dd>
                                        <div class="form-group v2">
                                            <div class="form-item">
                                                <div class="select-type2">
                                                <input type="hidden" name="sel_hand_tel_agency" id="sel_hand_tel_agency" value="SKT">
                                                    <select name="sel_hand_tel1" id="sel_hand_tel1" class="selected" title="휴대전화번호">
                                                        <option value="010">010</option>
                                                        <option value="011">011</option>
                                                        <option value="016">016</option>
                                                        <option value="017">017</option>
                                                        <option value="018">018</option>
                                                        <option value="019">019</option>
                                                    </select>
                                                </div>
                                                <input type="text" name="hand_tel2" id="hand_tel2" maxlength="4" value=""  class="i_text" onkeyup="checkNum($(this), '숫자만 입력해주세요.');" title="휴대전화번호">
                                                <input type="text" name="hand_tel3" id="hand_tel3" maxlength="4" value=""  class="i_text" onkeyup="checkNum($(this), '숫자만 입력해주세요.');" title="휴대전화번호">
                                                <br>
                                                
                                                <a href="javascript:void(0)" class="btn-type v7">
                                                            인증완료
                                                        </a>	
                                                    </div> <!-- //form-item -->
                                            <div class="text-type4" id="tel_alert" style="display:none;"></div>
                                        </div>
                                    </dd> 
                                </dl>
                                
                                <dl>
                                    <dt class="center">이메일</dt>
                                    <dd>
                                        <div class="form-group v2">
                                            <div class="form-item e-mail">
                                                <input type="text" name="email1" id="email1">
                                                <span>@</span>
                                                <input type="text" name="email2" id="email2">
                                                <div class="select-type2">
                                                    <select name="email3" id="email3" onchange="checkEmailState($('#email3'),$('#email2'))" class="selected">
                                                        <option value="naver.com">네이버</option>
                                                        <option value="hanmail.net">한메일</option>
                                                        <option value="gmail.com">지메일</option>
                                                        <option value="hotmail.com">핫메일</option>
                                                        <option value="nate.com">네이트</option>
                                                        <option value="WRITE" selected="">직접입력</option>
                                                    </select>
                                                </div>
                                                <a href="javaScript:doCheckEmail();" class="btn-type v7">중복확인</a>
                                            </div>
                                            <div class="text-type4" id="email_alert" style="display:none;"></div>
                                        </div>
                                    </dd>
                                </dl>
                                
                                <dl>
                                    <dt>개인정보 유효기간 선택</dt>
                                    <dd>
                                        <div class="chk-wrap">
                                            <div class="chk-box selected">
                                                <input type="radio" name="info_years" id="info_years1" value="1" checked="checked">
                                                <label class="checkbox" for="info_years1"></label>
                                                <label for="info_years1">1년</label>
                                            </div>
                                            <div class="chk-box">
                                                <input type="radio" name="info_years" id="info_years3" value="3">
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
                                            - 설정하신 기간동안 로그인/주문 등의 서비스 이용이 없을 시, 휴면계정으로 처리되어 각종 이벤트/쿠폰혜택을 받아보실 수 없습니다.
                                        </div>
                                    </dd>
                                </dl>
                                
                                <dl>
                                    <dt class="center">성별(선택)</dt>
                                    <dd>
                                        <div class="form-group v2">
                                            <div class="form-item gender">
                                                <div class="chk-wrap">
                                                    <div class="chk-box selected">
                                                        <input type="radio" name="sex" id="sex_n" value="N" checked="checked">
                                                        <label class="checkbox" for="sex_n"></label> 
                                                        <label for="sex_n">정보제공 안함</label>
                                                    </div>
                                                    <div class="chk-box">
                                                        <input type="radio" name="sex" id="sex_m" value="M">
                                                        <label class="checkbox" for="sex_m"></label>
                                                        <label for="sex_m">남성</label>
                                                    </div>
                                                    <div class="chk-box">
                                                        <input type="radio" name="sex" id="sex_f" value="F">
                                                        <label class="checkbox" for="sex_f"></label>
                                                        <label for="sex_f">여성</label>
                                                    </div>
                                                </div>
                                                <div class="text-type4" id="gender_alert" style="display:none;"></div>
                                            </div>
                                        </div>

                                    </dd>
                                </dl>
                                
                                <dl>
                                    <dt class="top">추천인 아이디</dt>
                                    <dd>
                                        <div class="form-item name">
                                            <input type="text" name="frn_id" id="frn_id" maxlength="20">
                                            <a href="javascript:frnCheck($(&#39;#frn_id&#39;));" class="btn-type v7">등록확인</a>
                                        </div>
                                        <div class="text-type4" id="frn_alert" style="display:none;"></div>
                                        <div class="text-type">
                                            - 가입 이후, 수정이 불가합니다.<br>
                                            - 대소문자 및 띄어쓰기에 유의해주세요.
                                        </div>   
                                    </dd>
                                </dl>
                                <dl>
                                    <dt>약관 및 광고성 정보 수신<br>전체 동의</dt>
                                    <dd>
                                        <div class="form agree">
                                            <div class="chk-box v4">
                                                <input type="checkbox" id="all3" name="agreeType3" class="all-check-agree">
                                                <label class="checkbox" for="all3"></label>
                                                <label for="all3">전체 동의하기</label>
                                            </div>
                                        </div>
                                        <div class="text-type">
                                            - 위 항목에는 필수 및 선택정보에 대한 동의를 모두 포함하고 있으며, 개별적으로도 동의 여부를 선택하실 수 있습니다.<br>
                                            - 선택항목에 대한 동의를 거부하시는 경우에도 서비스 이용이 가능합니다.<br>
                                            <span style="color: #ff143c;">이메일, 문자(SMS 등) 모두 수신 동의 시 피자 방문포장 40% 할인 쿠폰을 드립니다.</span>
                                        </div>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt>약관 전체동의</dt>
                                    <dd>
                                        <div class="form agree">
                                            <div class="chk-box v4">
                                                <input type="checkbox" id="agree_all" name="agree_chk" value="Y" class="all-check">
                                                <label class="checkbox" for="agree_all"></label>
                                                <label for="agree_all">전체 동의하기</label>
                                            </div>
                                            <ul>
                                                <li>
                                                    <div class="chk-box v4">
                                                        <input type="checkbox" name="agree_2" id="agree_2" value="Y">
                                                        <label class="checkbox" for="agree_2"></label>
                                                        <label for="agree_2">개인정보 수집 및 이용 동의(필수)</label>
                                                        <a href="javascript:UI.layerPopUp({selId:&#39;#pop-terms-p2&#39;})" class="btn-link">보기</a>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="chk-box v4">
                                                        <input type="checkbox" name="agree_1" id="agree_1" value="Y">
                                                        <label class="checkbox" for="agree_1"></label>
                                                        <label for="agree_1">이용약관 동의(필수)</label>
                                                        <a href="" class="btn-link">보기</a>
                                                    </div>
                                                </li>
                                                <li>
                                                        <div class="chk-box v4">
                                                            <input type="checkbox" id="location_yn" name="location_yn" value="Y">
                                                            <label class="checkbox" for="location_yn"></label>
                                                            <label for="location_yn">위치기반 서비스 약관 동의(필수)</label>
                                                            <a href="" class="btn-link">보기</a>
                                                        </div>
                                                    </li>
                                                <!-- <li>
                                                    <div class="chk-box v4">
                                                        <input type="checkbox" name="agree_3" id="agree_3" value="Y">
                                                        <label class="checkbox" for="agree_3"></label>
                                                        <label for="agree_3">개인정보 제3자 제공 동의(선택)</label>
                                                        <a href="javascript:UI.layerPopUp({selId:'#pop-terms-p3'})" class="btn-link">보기</a>
                                                    </div>
                                                </li> -->
                                            </ul>
                                        </div>

                                    </dd>
                                </dl>
                                <dl>
                                    <dt>광고성 정보 수신 전체 동의</dt>
                                    <dd>
                                        <div class="form agree">
                                            <div class="chk-box v4">
                                                <input type="checkbox" id="agree_all2" name="agreeType1" class="all-check">
                                                <label class="checkbox" for="agree_all2"></label>
                                                <label for="agree_all2">전체 동의하기</label>
                                            </div>
                                            <ul>
                                                <li>
                                                    <div class="chk-box v4">
                                                        <input type="checkbox" id="chk_ds_fl" name="chk_ds_fl" value="Y">
                                                        <label class="checkbox" for="chk_ds_fl"></label>
                                                        <label for="chk_ds_fl">문자메세지(선택)</label>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="chk-box v4">
                                                        <input type="checkbox" id="chk_dm_fl" name="chk_dm_fl" value="Y">
                                                        <label class="checkbox" for="chk_dm_fl"></label>
                                                        <label for="chk_dm_fl">이메일(선택)</label>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="chk-box v4">
                                                        <input type="checkbox" id="chk_o_dm_fl" name="chk_o_dm_fl" value="Y">
                                                        <label class="checkbox" for="chk_o_dm_fl"></label>
                                                        <label for="chk_o_dm_fl">DM 우편(최근 배달주소로 배송)(선택)</label>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>

                                    </dd>
                                </dl>
                            </form></div>
                            <div class="btn-wrap">
                                <a href="" class="btn-type v6">가입하기</a>
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