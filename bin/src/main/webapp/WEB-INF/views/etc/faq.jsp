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
    <link rel="stylesheet" href="../style/layout.css">
    <link rel="stylesheet" href="../style/etc.css">
    <!-- icon영역 -->
    <link
        href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
        rel="stylesheet">
    <!-- js 라이브러리 영역 -->
    <script src="../js/jquery-3.6.0.js"></script>
    <script src="../js/includeHTML.js"></script>
    
    
    

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
       
       
        <div class="sub-type faq">
            <div class="inner-box">
                <div class="page-title-wrap">
                    <h2 class="page-title">FAQ</h2>
                    <div class="depth-area">
                        <ol>
                            <li><a href="/FreeP/index.html">홈</a></li>
                            <li><strong>FAQ</strong></li>
                    </ol>
                </div>

                <article class="menu-list-area faq-area">
                    <div class="menu-nav-wrap">
                        <div class="menu-nav">
                            <ul>
                            </ul>
                        </div>
                    </div>

                    <div class="title-wrap-center">
                        <h3 class="title-type">
                            자주하는 질문
                        </h3>
                        <p>프리피 서비스 이용에 대한 궁금증을 바로 확인하실 수 있습니다</p>
                    </div>


                    <div class="tab-content active" id="faq">
                        <form id="searchForm" name="searchForm" method="get" action="/bbs/faqList"
                            accept-charset="utf-8">
                            <input type="hidden" id="view_gubun" name="view_gubun" value="W">
                            <input type="hidden" id="pageNo" name="pageNo" value="1">
                            <input type="hidden" id="view_gubun" name="view_gubun" value="W">
                            <input type="hidden" id="bbs_cd" name="bbs_cd" value="top">



                            <div class="tab-type4 btn_tab_faq">
                                <ul class="tab-type4 col3">
                                    <li class="active"><a href="#1" onclick="callFunction(this, 1);">피자 주문하기</a></li>
                                    <li><a href="#2" onclick="callFunction(this, 2);">주문확인</a></li>
                                    <li><a href="#3" onclick="callFunction(this, 3);">포장 주문</a></li>
                                    <li><a href="#4" onclick="callFunction(this, 4);">할인/쿠폰</a></li>
                                    <li><a href="#5" onclick="callFunction(this, 5);">회원/로그인</a></li>
                                    <li><a href="#6" onclick="callFunction(this, 6);">기타</a></li>
                                </ul>
                            </div>
                            
                            
                            <div class="lst_faq_wrap">
                                <ul>
                                    <li class="">
                                        <dl id="active_262" class="classActive">
                                            <dt><a href="#none" >주문 한 메뉴를 변경하거나 취소해야 할 경우에는 어떻게 하나요?</a></dt>
                                            <dd>
                                                주문 접수 후 바로 피자 메이킹이 이루어져 주문 변경이나 취소가 어렵습니다.
                                                <br>주문변경이나 취소는 반드시 해당 매장으로 전화하셔야 가능하며, 해당매장 전화번호는 주문내역 페이지나, 매장 검색에서 가능합니다.
                                                <br>
                                                <br>매장에 전화하셔서 주문번호를 함께 말씀해 주시면 빠른 처리가 가능합니다.
                                                <br>미리 결제 하신 경우, 주문이 취소되면 최대 30분 이내에 자동으로 결제 취소 됩니다.
                                            </dd>
                                        </dl>
                                    </li>

                                    <li>
                                        <dl id="active_254" class="classActive">
                                            <dt><a href="#none" >전 매장 모두 제품 가격은 동일한가요?</a></dt>
                                            <dd>
                                                일반 매장의 경우 모두 동일 가격에 판매하고 있습니다.
                                            </dd>
                                        </dl>
                                    </li>
                                    
                                    <li>
                                        <dl id="active_251" class="classActive">
                                            <dt><a href="#none" >주문한 메뉴를 변경하고 싶을 때는 어떻게 하나요?</a></dt>
                                            <dd>
                                                미리결제를 하신 경우는 메뉴 변경이 불가능하여, 해당 매장에 전화하여 취소처리 하셔야 합니다.(결제취소 및 쿠폰 복구는 최대 30분 소요)
                                                <br>현장결제로 주문을 접수한 경우는 매장에 전화하여 메뉴 변경이 가능합니다.
                                            </dd>
                                        </dl>
                                    </li>

                                    <li>
                                        <dl id="active_249" class="classActive">
                                            <dt><a href="#none" >음료만 주문도 가능한가요?</a></dt>
                                            <dd>
                                                음료는 피자나 사이드디시와 함께 주문 시 Free P의 메뉴를 좀 더 맛있게 드실 수 있도록 제공하는 메뉴로, 음료만 단독 주문은 불가합니다.
                                            </dd>
                                        </dl>
                                    </li>

                                    <li>
                                        <dl id="active_247" class="classActive">
                                            <dt><a href="#none" >결제수단은 어떤 것들이 있나요?</a></dt>
                                            <dd>
                                                피자 결제수단은 미리결제(선결제)와 현장결제(피자 수령시 직접 결제)로 나누어집니다.
                                                <br>
                                                <br>그외, 신용카드, 휴대폰, 각종페이 등 다양한 결제수단을 제공하고 있습니다.
                                                <br>                                                        <br>
                                                <br>현장결제의 경우 신용카드 및 현금 중에 선택 가능합니다.
                                            </dd>
                                        </dl>
                                    </li>
                                
                                </ul>

                                <ul>
                                    <li class="">
                                        <dl id="active_262" class="classActive">
                                            <dt><a href="#none" onclick="fncCnt(262);">현금영수증 발급은 어떻게 할 수
                                                    있나요?</a></dt>
                                            <dd>
                                                E쿠폰, 모바일 기프트권을 사용하거나 계좌이체로 결제한 온라인 주문은 현금영수증이 자동
                                                발급됩니다.
                                                <br>단, 지류상품권 사용 또는 현장현금결제 시에는 결제가 '완료'된 후 매장에서 수동으로 현금영수증 발급
                                                처리해드립니다.
                                                <br>
                                                <br>■ 현금영수증 발급받기
                                                <br>　- 주문시점: [주문/결제 페이지 &gt; 현금영수증] 란에서 신청하여 발급 가능
                                                <br>
                                                <br>■ 현금영수증 확인하기
                                                <br> - 경로 : [나의정보 &gt; 주문내역 &gt; 주문내역상세 &gt; 현금영수증 조회 클릭]
                                                <br>
                                                <br>■ 현금영수증 신청정보 관리하기
                                                <br> ※ 주문전 [나의정보 &gt; 정보수정 &gt; 현금영수증 관리]에서 '현금영수증 신청 정보' 입력이
                                                가능합니다.
                                                <br>
                                                <br>■ 기타사항
                                                <br>- 현금영수증 발행 대상이나 미신청한 경우에는 자진발급하여 발행처리해 드립니다.
                                                <br>- 자진발급분의 경우 현금영수증 식별번호가 010-0000-1234로 기재됩니다.
                                                <br>- 발행방법이 자진발급인 경우 국세청 사이트에서 자진발급분 사용자 등록을 하셔야만 소득공제 등 혜택을 받으실
                                                수 있습니다.
                                                <br>- 현금영수증 발행내역은 국세청 사이트(http://hometax.go.kr)에서 조회가 가능합니다.
                                            </dd>
                                        </dl>
                                    </li>
                                    
                                    <li>
                                        <dl id="active_251" class="classActive">
                                            <dt><a href="#none" onclick="fncCnt(251);">주문상태는 어떻게 확인할 수 있나요?</a></dt>
                                            <dd>
                                               나의정보>주문내역에서 확인 가능합니다.
												<br>주문이 완료된 후 매장에서 주문을 접수하고 고객님께서 피자를 받으실 때까지의 단계를 표시 하고 있습니다.
												<br>
												<br>접수완료 : 매장으로 주문이 접수되었습니다.
												<br>요리중 : 매장에서 피자를 만들고 있습니다.
												<br>배달중 : 배달주문의 경우 배달원이 피자를 배달중인 상태입니다.
												<br>수령가능 : 포장주문의 경우 피자 포장이 완료되어 수령이 가능한 상태입니다.
												<br>배달완료/수령완료 : 고객님께 피자가 전달된 상태 입니다.
												<br>
												<br>주문취소 : 매장을 통해 주문을 취소하신 경우를 나타냅니다
                                            </dd>
                                        </dl>
                                    </li>
                                    <li>
                                        <dl id="active_249" class="classActive">
                                            <dt><a href="#none" onclick="fncCnt(249);">결제 승인 및 취소 현황은 어떻게 확인하나요?</a></dt>
                                            <dd>
												미리결제로 진행하신 주문의 결제 승인 및 취소 현황은 각 카드사 혹은 간편결제 사이트에서 확인 가능합니다.
												<br>
												<br>* 매장에 연락하시어 주문을 취소하시면 최대 30분 이내에 자동으로 결제 취소 됩니다.(당일 주문에 한함)
                                            </dd>
                                        </dl>
                                    </li>
                                    <li>
                                        <dl id="active_247" class="classActive">
                                            <dt><a href="#none" onclick="fncCnt(247);">결제내역 영수증을 출력하고 싶습니다.</a></dt>
                                            <dd>
												신용카드 결제의 경우는 주문내역에서 영수증 출력이 가능하나,
												<br>다른 결제수단(네이버페이, 카카오페이 등)은 해당 간편결제 사이트/앱에서 확인 가능합니다.   
                                            </dd>
                                        </dl>
                                    </li>
                                    <li class="">
                                        <dl id="active_245" class="classActive">
                                            <dt><a href="#none" onclick="fncCnt(245);">주문한 내역은 어디에서 확인할 수 있나요?</a>
                                            </dt>
                                            <dd>
												주문한 내역은 나의정보>주문내역에서 확인 가능합니다.
												<br>최근 1년 이내 주문한 내역만 확인 가능합니다.
												<br>
												<br>매장(1234-1234) 또는 콜센터(0987-0987), 다른 계정으로 주문하신 내역은 확인이 불가능 합니다.
												<br>온라인 상으로 주문한 최초의 이력만 확인하실 수 있으며, 전화를 통해 변경하신 사항은 반영되지 않습니다.
												<br>
												<br>메뉴 변경이나 주문취소를 원하실 경우, 매장에 주문번호를 알려 주셔야 합니다. (온라인으로 주문취소는 불가합니다.)
												<br>
												<br>피자주문이력은 최근 3개월 내역까지만 삭제 가능하며, 주문이 취소되는 것은 아닙니다.
                                            </dd>
                                        </dl>
                                    </li>
                                    
                                </ul>

                                <ul>
                                    <li class="">
                                        <dl id="active_262" class="classActive">
                                            <dt><a href="#none" onclick="fncCnt(262);">주문한 내역을 다시 확인하고 싶은데 어디에서 확인할 수 있나요?</a></dt>
                                            <dd>
												주문하신 내역은 나의 정보>주문내역에서 확인 가능합니다.
                                            </dd>
                                        </dl>
                                    </li>

                                    <li>
                                        <dl id="active_254" class="classActive">
                                            <dt><a href="#none" onclick="fncCnt(254);">방문포장 주문 이용시간은 어떻게 되나요?</a></dt>
                                            <dd>
												피자 수령은 매장 영업 시간 내 가능합니다.
												<br>매장이 오픈하기 전에는 예약주문으로 이용 가능하며, 주문시 수령 가능한 시간을 안내 드리고 있습니다.
												<br>매장 마감 후에는 익일 수령 예약이 가능합니다.
												<br>
												<br>※ 매장 운영시간은 매장마다 상이할 수 있으며, 평균 오픈 시각은 11시 30분입니다. (이 경우 11시 45분부터 피자 수령이 가능합니다.) 
                                            </dd>
                                        </dl>
                                    </li>
                                    <li>
                                        <dl id="active_251" class="classActive">
                                            <dt><a href="#none" onclick="fncCnt(251);">포장주문 이용은 어떻게 하나요?</a></dt>
                                            <dd>
												① 온라인 주문 시 포장 주문을 선택합니다.
												<br>② 피자를 수령하실 매장을 검색 후 매장을 선택합니다.
												<br>③ 피자 및 사이드디쉬, 음료를 선택합니다.
												<br>④ 장바구니 확인 후 주문하기를 진행해 주시고, 할인적용에서 방문포장 주문 할인을 선택하면 해당 매장의 포장할인율이 적용됩니다. (추천 할인 적용)
												<br>⑤ 도착 예정시간을 선택해 주세요.
												<br>바로주문, 오늘예약, 내일예약을 선택할 수 있습니다.
												<br>⑥ 결제수단을 선택하고 결제하기 버튼을 클릭합니다.
												<br>⑦ 미리결제를 선택하신 경우 실제 결제가 완료되면 주문이 완료됩니다.
												<br>⑧ 예약하신 시간에 피자를 수령해 주세요.
                                            </dd>
                                        </dl>
                                    </li>
                                    <li>
                                        <dl id="active_249" class="classActive">
                                            <dt><a href="#none" onclick="fncCnt(249);">온라인 방문포장 주문을 이용할 때 유의사항은 무엇인가요?</a></dt>
                                            <dd>
												① 예약하신 시간에 방문 부탁드립니다.
												<br>② 결제 완료 후 메뉴 변경 및 취소는 불가능합니다.
												<br>③ 메뉴 변경 및 주문취소는 주문하신 매장으로 직접 연락 하셔야 합니다.(온라인 취소 불가/메뉴 변경시 미리 결제 하셨다면, 주문 취소 후 매장 방문하시어 재결제 하셔야 합니다.)
												<br>④ 주문이 취소되면 미리 결제하신 결제수단의 승인도 자동으로 취소 됩니다.(최대 30분 이내)
												<br>⑤ 수령하실 매장 선택 시 반드시 매장 위치를 확인하시기 바랍니다.
												<br>⑥ 수령자 정보(이름/휴대폰)를 정확하게 입력해 주시기 바랍니다.
                                            </dd>
                                        </dl>
                                    </li>
                                    <li>
                                        <dl id="active_247" class="classActive">
                                            <dt><a href="#none" onclick="fncCnt(247);">배달주문 / 포장주문의 차이점은 무엇인가요?</a></dt>
                                            <dd>
												● 배달주문은 집, 회사 등 고객이 선택한 주소로 피자가 배달되는 것이며, 매장은 배달장소에 따라 자동적으로 선택됩니다.
												<br>
												<br>포장주문은 고객이 직접 매장에서 피자를 수령하며, 고객이 매장의 위치를 확인 후 원하는 매장으로 주문이 가능합니다.
												<br>또한, 방문포장 주문을 이용하실 경우, 각 매장 별 방문포장 할인율을 적용 받으실 수 있습니다.(각 매장 별 방문포장 할인률은 다름)
                                            </dd>
                                        </dl>
                                    </li>
                                    <li class="">
                                        <dl id="active_245" class="classActive">
                                            <dt><a href="#none" onclick="fncCnt(245);">다른 사람이 피자를 수령하고 싶습니다.</a>
                                            </dt>
                                            <dd>
												주문하는 분과 피자를 수령하실 분이 다르신 경우, 수령자 정보를 정확히 입력해 주시기 바랍니다.
												<br>
												<br>전화번호의 경우, 휴대폰 번호 입력이 가능하며,
												<br>정보의 오기재로 인해 피자를 수령하지 못하였을 경우 환불은 불가능합니다.
                                            </dd>
                                        </dl>
                                    </li>
                                    
                                </ul>

                                <ul>
                                    <li class="">
                                        <dl id="active_262" class="classActive">
                                            <dt><a href="#none" onclick="fncCnt(262);">할인쿠폰은 어떻게 사용하는 건가요?</a></dt>
                                            <dd>
												Free P 온라인 회원에게는 신규회원 가입/등급 쿠폰/생일쿠폰 등의 다양한 온라인 할인쿠폰이 제공됩니다.
												<br>
												<br>쿠폰확인은 나의정보>쿠폰함 에서 확인 가능하며, 주문 진행시 보유하신 쿠폰 중 할인예상 금액이 가장 높은 쿠폰으로 추천 할인이 적용됩니다. 원하실 경우 할인 변경이 가능합니다.
												<br>
												<br>오프라인에서 발생된 일부 쿠폰의 경우 할인선택 시 해당 쿠폰코드 입력하셔야 이용이 가능합니다.
                                            </dd>
                                        </dl>
                                    </li>
                                    
                                </ul>

                                <ul>
                                    <li class="">
                                        <dl id="active_262" class="classActive">
                                            <dt><a href="#none" onclick="fncCnt(262);">회원 가입 후 개명을 했는데 어떻게 하나요?</a></dt>
                                            <dd>
												아이디나 비밀번호를 분실 하신 경우는 개명된 정보로 찾기가 불가능 하기 때문에 고객만족팀(123-456-7890)으로 연락 부탁드립니다. 개명 전 정보 확인 후 로그인이 가능하도록 도와드립니다.
												<br>로그인 후 나의정보>정보변경 페이지에서 본인인증을 다시 하면 개명된 정보를 업데이트 할 수 있습니다.
                                            </dd>
                                        </dl>
                                    </li>
                                   
                                    <li>
                                        <dl id="active_251" class="classActive">
                                            <dt><a href="#none" onclick="fncCnt(251);">비밀번호가 기억나지 않아 로그인이 불가 합니다. 어떻게 하나요?</a></dt>
                                            <dd>
												소중한 개인정보 보호를 위해 비밀번호 찾기 시 회원인증을 받고 있습니다.
												<br>- 회원 정보로 찾기
												<br>- 본인인증으로 찾기
												<br>- 아이핀으로 찾기
												<br>
												<br>[회원인증 시 유의사항]
												<br>- 본인인증 또는 아이핀을 통해 회원가입하지 않은 고객님들께서는 회원 정보로 찾기 유형을 통해 비밀번호를 새로 설정하실 수 있습니다.
                                            </dd>
                                        </dl>
                                    </li>
                                    <li>
                                        <dl id="active_249" class="classActive">
                                            <dt><a href="#none" onclick="fncCnt(249);">휴대폰 번호가 변경되어 로그인을 할 수 없어요.</a></dt>
                                            <dd>
												휴대폰 번호가 변경되어 로그인이 불가능한 경우(아이디 찾기/비밀번호 찾기 불가)는 고객만족팀(123-456-7890)으로 연락 부탁드립니다. 정보 확인 후 로그인이 가능하도록 도와드립니다. 로그인 후 휴대폰 번호 변경 부탁드립니다.
												<br>
												<br>아이디와 비밀번호는 알고 계신 경우는 로그인 후 나의정보>정보변경 페이지에서 휴대전화를 변경하고 재인증하시면 번호 변경이 가능합니다.
                                            </dd>
                                        </dl>
                                    </li>
                                    <li>
                                        <dl id="active_247" class="classActive">
                                            <dt><a href="#none" onclick="fncCnt(247);">탈퇴하는 방법을 알려주세요</a></dt>
                                            <dd>
												탈퇴는 나의정보>정보수정> "회원탈퇴" 클릭 후 회원탈퇴 절차를 거쳐 진행합니다.
												<br>탈퇴 시에는 회원정보 중 아이디를 제외한 개인정보는 모두 삭제됩니다.
												<br>탈퇴한 회원의 아이디는 다른 회원이 사용하여 생길 수 있는 아이디 도용 문제를 차단하기 위해 재사용할 수 없도록 되어 있으니 양해 부탁드립니다.  
                                            </dd>
                                        </dl>
                                    </li>
                                    <li class="">
                                        <dl id="active_245" class="classActive">
                                            <dt><a href="#none" onclick="fncCnt(245);">가입된 것으로 나오는데 아이디를 찾고 싶어요</a>
                                            </dt>
                                            <dd>
												이미 가입된 고객님의 경우 아이디를 찾아서 로그인 하셔야 합니다.
												<br>가입시 입력했던 회원 정보로 찾거나 휴대전화 본인인증, 아이핀 인증을 통해 아이디 찾기가 가능합니다.
                                            </dd>
                                        </dl>
                                    </li>
                                    <li class="">
                                        <dl id="active_245" class="classActive">
                                            <dt><a href="#none" onclick="fncCnt(245);">온라인 회원 가입은 어떻게 해야 하나요?</a>
                                            </dt>
                                            <dd>
												Free P 온라인 회원 가입은 본인인증, 약관동의, 정보입력, 가입완료 순으로 이루어 집니다
												<br>
												<br>휴대전화나 아이핀을 통한 본인인증 후 가입 가능합니다.
												<br>
												<br>만 14세 이상만 회원 가입이 가능합니다.
                                            </dd>
                                        </dl>
                                    </li>
                                </ul>

                                <ul>
                                    <li class="">
                                        <dl id="active_262" class="classActive">
                                            <dt><a href="#none" onclick="fncCnt(262);">단체주문은 쿠폰과 함께 사용할 수 있나요?</a></dt>
                                            <dd>
												다량주문은 할인이 되기 때문에 쿠폰 중복 사용은 불가합니다.
                                            </dd>
                                        </dl>
                                    </li>
                                   
                                    <li>
                                        <dl id="active_251" class="classActive">
                                            <dt><a href="#none" onclick="fncCnt(251);">Free P 단체주문은 어떨 때 이용할 수 있나요?</a></dt>
                                            <dd>
                                       			한 번에 여러 곳으로 배송하며 한 번에 결제를 원하실 때 이용하실 수 있습니다.
                                            </dd>
                                        </dl>
                                    </li>
                                    <li>
                                        <dl id="active_249" class="classActive">
                                            <dt><a href="#none" onclick="fncCnt(249);">단체주문 결제는 어떻게 해야 하나요?</a></dt>
                                            <dd>
                                                카드 및 현금 결제 모두 가능합니다.
                                            </dd>
                                        </dl>
                                    </li>
                                    <li>
                                        <dl id="active_247" class="classActive">
                                            <dt><a href="#none" onclick="fncCnt(247);">단체주문 진행 시 세금계산서를 받을 수 있나요?</a></dt>
                                            <dd>
                                                현금으로 결제하실 경우 세금계산서 발행이 가능합니다.
												<br>(세법에 의거 2011.1.1부로 전자세금계산서 의무발행) 
                                            </dd>
                                        </dl>
                                    </li>
                                    <li class="">
                                        <dl id="active_245" class="classActive">
                                            <dt><a href="#none" onclick="fncCnt(245);">단체 주문은 어떤 업체가 의뢰하고 있나요?</a></dt>
                                            <dd>
                                                전국적인 사업장을 가지고 있는 기업, 학교, 관공서, 금융권, 제약회사 및 유통업체에서도 Free P의 다량주문을 이용하고 계십니다.   
                                            </dd>
                                        </dl>
                                    </li>
                                    <li class="">
                                        <dl id="active_245" class="classActive">
                                            <dt><a href="#none" onclick="fncCnt(245);">온라인으로 피자는 몇 판까지 주문되나요? 단체 주문을 하고 싶습니다.</a></dt>
                                            <dd>
												따뜻한 피자를 배달해 드리기 위해 홈페이지 온라인 주문으로는 최대 9판까지 주문이 가능합니다.
												<br>5판 이상 주문시 바로주문은 불가하며, 예약주문으로 이용 가능합니다.
												<br>단, 이용하는 프로모션(할인)에 따라 적용 가능 피자 판수는 차이가 있을 수 있습니다.
												<br>
												<br>그 이상의 주문을 원하시는 고객께서는 매장이나 콜센터(0987-0987)를 이용하여 주시기 바랍니다.
												<br>30판 이상의 단체주문 서비스를 이용하실 경우 02-222-3333로 연락 부탁드립니다.(2~3일전 예약 필수)
                                            </dd>
                                        </dl>
                                    </li>
                                </ul>
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
    <script>includeHTML();</script> 
    
    <script src="../js/motion.js"></script>
    <script src="../js/ui.js"></script>

</body>

</html>