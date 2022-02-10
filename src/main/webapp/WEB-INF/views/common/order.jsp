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
    <link rel="stylesheet" href="../style/order.css">
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
        <%@ include file="./header.jsp" %>
    </header>

    <div id="container">
        <div class="cont-wrap">
            <div class="sub-type order">
                <div class="inner-box">
                    <!-- 1depth 메뉴명 & 네비게이션 -->
                    <div class="page-title-wrap">
                        <h2 class="page-title">결제하기</h2>
                        <div class="depth-area">
                            <ol>
                                <li><a href="https://web.dominos.co.kr/main">홈</a></li>
                                <li><a href="https://web.dominos.co.kr/basket/detail">장바구니</a></li>
                                <li><strong>결제하기</strong></li>
                            </ol>
                        </div>
                    </div>
                    <!-- //1depth 메뉴명 & 네비게이션 -->

                    <article class="pay">
                        

                        <!-- 배송정보 -->
                        <div class="step-wrap">
                            <div class="order_DorP">

                                <!-- 지점정보 -->
                                <div>
                                    <div class="title-wrap __border">
                                        <h3 class="title-type"><strong>지점 정보</strong></h3>
                                    </div>

                                    <div class="deli-info">
                                        <div class="address">
                                            서울특별시 금천구 가산동 426-5 월드 메르디앙 벤처 센터 2 차 410 호</div>
                                        <div class="store">
                                            <span>금천가산점</span> 02-000-0000</div>
                                    </div>
                                </div>

                                <!-- 수령인정보 -->
                                <div>
                                    <div class="title-wrap __border">
                                        <h3 class="title-type"><strong>수령인 정보</strong></h3>
                                    </div>

                                    <div class="deli-info form">
                                        <dl class="chk-wrap">
                                            <dt></dt>
                                            <dd>
                                                <div class="form-group">
                                                    <div class="form-item">
                                                        <div class="chk-box v3">
                                                            <input type="checkbox" name="order_type" id="recipient" onchange="recipientChange()">
                                                            <label class="checkbox" for="recipient"></label>
                                                            <label for="recipient">주문자와 동일</label>
                                                        </div>
                                                    </div>
                                                    
                                                    </div>
                                            </dd>
                                        </dl>
                                        
                                        <dl>
                                            <dl>
                                                <dt>이름</dt>
                                                <dd>
                                                    <div class="form-item">
                                                        <input type="text" id="customerName" name="customerName" value="" maxlength="30">
                                                    </div>
                                                </dd>
                                            </dl>
                                        </dl>
                                        
                                        <dl>
                                            <dt>연락처</dt>
                                            <dd>
                                                <div class="form">
                                                    <div class="form-group2 select-group">
                                                        <div class="form-item">
                                                            <div class="select-type2">
                                                                <select id="tel1" name="tel1" title="휴대전화번호">
                                                                    <option value="010">010</option>
                                                                    <option value="011">011</option>
                                                                    <option value="016">016</option>
                                                                    <option value="017">017</option>
                                                                    <option value="018">018</option>
                                                                    <option value="019">019</option>
                                                                </select>
                                                            </div>
                                                            <input type="text" id="tel2" name="tel2" maxlength="4" class="i_text" title="휴대전화번호">
                                                            <input type="text" id="tel3" name="tel3" maxlength="4" class="i_text" title="휴대전화번호">
                                                        </div>
                                                    </div>
                                                    
                                                    </div>
                                            </dd>
                                        </dl>
                                        
                                        <!-- <div class="form-item tel">
                                            <input type="text"  id="customerName" name="customerName" value="" maxlength="30">
                                            <input type="text" id="tel1" name="tel1" value="" />
                                            <input type="hidden" id="tel2" name="tel2" value="" />
                                            <input type="hidden" id="tel3" name="tel3" value="" />
                                        </div> -->
                                        
                                        <dl>
                                            <dt>요청사항</dt>
                                            <dd>
                                                <div class="form">
                                                    <div class="form-item">
                                                        <div class="select-type2">
                                                            <select name="more_req_box" onchange="directMessage();">
                                                                <option value="">요청사항을 선택하세요.</option>
                                                                <option value="문 앞에 놓아 주세요.">문 앞에 놓아 주세요.</option><option value="벨은 누르지 말아주세요.">벨은 누르지 말아주세요.</option>
                                                                <option value="direct">직접 입력</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <!-- 직접 입력 -->
                                                    <div class="form-item form-text">
                                                        <input style="display:none;" name="more_req" id="more_req" type="text" onkeyup="checkByte(this, 50)" placeholder="주문시 요청사항을 입력하세요. (최대 25자까지 입력가능)">
                                                    </div>
                                                </div>
                                            </dd>
                                        </dl>
                                        
                                    </div>
                                </div>
                            </div>

                            






                        </div><!-- //step-wrap -->

                        <!-- 주문내역 -->
                        <div class="step-wrap">
                            <div class="title-wrap">
                                <div class="title-type"><strong>주문내역</strong></div>
                            </div>
                            <div class="order-step">
                                <ul>
                                    <li>
                                        <div class="menu">
                                            <!-- 피자 명  -->
                                            <strong class="goods_name">마스터 트리플 피자L</strong>
                                            <!-- //피자 명  -->
                                        </div>
                                        <div class="topping">
                                            <div class="item">
                                                <span>양파 x 2</span> / <span>10,000</span>원
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- //주문내역 -->

                        <!-- 할인 적용 -->
                        <div class="step-wrap" id="dc_info">
                            <div class="title-wrap">
                                <h3 class="title-type"><strong>할인 적용</strong></h3>
                            </div>
                            <div class="discount-step">
                                <ul>
                                    <li id="myCoupon"><a href="#"
                                            class="btn-type-brd5">프리피 온라인 쿠폰 선택</a></li>
                                    <li id="voucher"><a href="#"
                                            class="btn-type-brd5 ">포인트 사용하기</a></li>
                                </ul>
                            </div> <!-- //discount-step -->


                        </div>
                        <!-- //할인 적용 -->



                        <!-- 결제방법 -->
                        <div class="step-wrap pay-step" id="pay_info">
                            <input type="hidden" id="userInfo" value="">
                            <input type="hidden" id="flagPin" value="">
                            <script>
                                $(document).ready(function () {

                                    $("#dc_info .discount-step ul li").on("click", function () {
                                        if ($('#reserve_gubun').val() == "TD" || $('#reserve_gubun')
                                            .val() == "TM") {
                                            alert(
                                                "할인 설정을 변경하면 예약 시간 설정이 초기화됩니다. 할인 선택 후 예약 시간을 다시 선택해 주세요.");
                                        }
                                    });

                                    //if("18" == "1259"){
                                    //	$('.dominopay-div').hide();
                                    //}else {
                                    //	$('.dominopay-div').show();
                                    //}

                                    if ("" != "Y") {
                                        var item = "input[name=itemCHK]";
                                        $("input:checkbox[name=itemCHK]").prop("checked", false);
                                    }

                                    // checkbox
                                    $("input[type='checkbox']").change(function () {
                                        if ($(this).is(':checked')) {
                                            $(this).parent().addClass('selected');
                                            $(this).attr('checked', true);
                                        } else {
                                            $(this).parent().removeClass('selected');
                                            $(this).attr('checked', false);
                                        }
                                    });

                                    // S: 200818 도미노페이 고도화

                                    // 결제수단
                                    // $(".hide-box").hide();
                                    // $("input:radio[name=pay]").click(function () {
                                    //     if ($("input[name=pay]:checked").val() == "card") {
                                    //         $("#pay-card").show();
                                    //         $("#pay-cash").hide();
                                    //     } else if ($("input[name=pay]:checked").val() == "cash") {
                                    //         {
                                    //             $("#pay-card").hide();
                                    //             $("#pay-cash").show();
                                    //         }
                                    //     } else {
                                    //         $("#pay-card").hide();
                                    //         $("#pay-cash").hide();
                                    //     }
                                    // });



                                    $('.dominoPay-slider').slick({
                                        slide: '.dominoPay-item',
                                        infinite: false,
                                        draggable: true,
                                        slidesToShow: 1,
                                        slidesToScroll: 1,
                                        centerMode: true,
                                        centerPadding: '20px',
                                        variableWidth: true,
                                        arrows: true,
                                        cssEase: 'ease',
                                        dots: false,

                                    });

                                    $('.dominoPay-slider .dominoPay-item').on('click', function () {
                                        actIndex = $(this).attr('data-slick-index');
                                        var slider = $('.dominoPay-slider');
                                        slider[0].slick.slickGoTo(actIndex);
                                    });

                                    $('.dominoPay-slider').on('afterChange', function () {
                                        $(".dominoPay-item").removeClass('__selected');
                                        $('.slick-current').addClass('__selected');
                                    });

                                    $('.slick-current').addClass('__selected');
                                    $('.dominoPay-slider').on('init reInit afterChange', function (event, slick,
                                        currentSlide, nextSlide) {
                                        $('.dominoPay-item').removeClass('__selected');
                                        $('.slick-current').addClass('__selected');


                                        if ("28720" < 50000) {
                                            $('.dc_month').attr('disabled', 'true');
                                        }
                                        // 현금영수증 영역 초기화
                                        initCashReceipt($("#prmt_idx").val());
                                    });

                                    //도미노페이 회원이지만 최종결제방법값이 null인 경우 예외처리
                                    if ("" == "Y" && "" == "") {
                                        $("#settlement_method").val("D");
                                        $('#pay_method').val("2");
                                    }

                                    $('input[name="select-payMethod"]').change(function () {
                                        var selectMethod = $(this).attr('id');

                                        if (selectMethod === 'sel-dominopay') {
                                            //$('.dominopay-wrap').addClass('__active');
                                            $('.btn-dominopay').addClass('selected');
                                            //$('.otherMethod-wrap').removeClass('__active');
                                            $('.otherMethod-wrap').addClass('__active');
                                            $('.btn-changeMethod').removeClass('__active');
                                            $('.btn-otherMethod').removeClass('selected');
                                            $('.btn-changeMethod').attr('style', 'display:block;');
                                        } else if (selectMethod === 'sel-otherMethod') {
                                            //$('.dominopay-wrap').removeClass('__active');
                                            //$('.otherMethod-wrap').addClass('__active');
                                            $('.btn-changeMethod').addClass('__active');
                                            $('.btn-otherMethod').addClass('selected');
                                            $('.btn-dominopay').removeClass('selected');

                                            // 다른 결제 선택시 직전 결제 값 세팅 Start
                                            if ("" != "") { //최종결제 수단 저장 방식이면
                                                //$("#pay_info").html($(data).find("#pay_info_final_payment").html());

                                                //var dataValue = $("#finalPayMent .payTxt").data('value').split('|');
                                                var dataValue = "";
                                                var mid = "";

                                                $('.btn-otherMethod').addClass('selected');
                                                $('#sel-otherMethod').prop('checked', true);

                                                if ("" == "K" && $("#pay_method_5").length != 0) {
                                                    mid = $("#pay_method_5").data("mid");
                                                    $("#pay_method_5").addClass("selected").find(
                                                        "input:radio").prop("checked", true);
                                                    dataValue = $("#pay_method_5").data('value').split(
                                                        '|');

                                                } else if ("" == 'P' && $("#pay_method_7").length !=
                                                    0) {
                                                    mid = $("#pay_method_7").data("mid");
                                                    $("#pay_method_7").addClass("selected").find(
                                                        "input:radio").prop("checked", true);
                                                    dataValue = $("#pay_method_7").data('value').split(
                                                        '|');

                                                } else if ("" == 'N' && $("#pay_method_8").length !=
                                                    0) {
                                                    mid = $("#pay_method_8").data("mid");
                                                    $("#pay_method_8").addClass("selected").find(
                                                        "input:radio").prop("checked", true);
                                                    dataValue = $("#pay_method_8").data('value').split(
                                                        '|');

                                                } else if ("" == 'I' && $("#pay_method_9").length !=
                                                    0) {
                                                    mid = $("#pay_method_9").data("mid");
                                                    $("#pay_method_9").addClass("selected").find(
                                                        "input:radio").prop("checked", true);
                                                    dataValue = $("#pay_method_9").data('value').split(
                                                        '|');

                                                } else if ("" == 'F' && $("#pay_method_A").length !=
                                                    0) {
                                                    mid = $("#pay_method_A").data("mid");
                                                    $("#pay_method_A").addClass("selected").find(
                                                        "input:radio").prop("checked", true);
                                                    dataValue = $("#pay_method_A").data('value').split(
                                                        '|');

                                                } else if ("" == 'A' && $("#pay_method_6").length !=
                                                    0) {
                                                    mid = "ok";
                                                    $("#pay_method_6").addClass("selected").find(
                                                        "input:radio").prop("checked", true);
                                                    dataValue = $("#pay_method_6").data('value').split(
                                                        '|');

                                                } else if ("" == '9' && $("#pay_method_4").length !=
                                                    0) {
                                                    mid = "ok";
                                                    $("#pay_method_4").addClass("selected").find(
                                                        "input:radio").prop("checked", true);
                                                    dataValue = $("#pay_method_4").data('value').split(
                                                        '|');

                                                } else if ("" == 'D' && $("#pay_method_2").length !=
                                                    0) {
                                                    mid = "ok";
                                                    $("#pay_method_2").addClass("selected").find(
                                                        "input:radio").prop("checked", true);
                                                    dataValue = $("#pay_method_2").data('value').split(
                                                        '|');

                                                    $('.btn-dominopay').removeClass('selected');
                                                    $('#sel-dominopay').prop('checked', false);

                                                    $('.btn-otherMethod').addClass('selected');
                                                    $('#sel-otherMethod').prop('checked', true);

                                                } else if ("" == '2' && $("#pay_method_3").length !=
                                                    0) {
                                                    mid = "ok";
                                                    $("#pay_method_3").addClass("selected").find(
                                                        "input:radio").prop("checked", true);
                                                    dataValue = $("#pay_method_3").data('value').split(
                                                        '|');

                                                } else if ("" == '1' && $("#pay_method_1").length !=
                                                    0) {
                                                    mid = "ok";
                                                    $("#pay_method_1").addClass("selected").find(
                                                        "input:radio").prop("checked", true);
                                                    dataValue = $("#pay_method_1").data('value').split(
                                                        '|');
                                                    $('#pay_method_sub_1').addClass("__active");
                                                } else {
                                                    mid = "ok";
                                                }

                                                $("#settlement_method").val(dataValue[0]);
                                                $("#pay_method").val(dataValue[1]);
                                                $("#pay_method_chk").val(dataValue[2]);
                                                $("#payment_save").val("Y");

                                                if ($("#pay_method").val() == '1') {
                                                    $("#pay_method_sub_1").show();
                                                }
                                                //현재 결제수단을 미리 저장해 놈.
                                                settlement_method = $("#settlement_method").val();
                                                pay_method = $("#pay_method").val();
                                                pay_method_chk = $("#pay_method_chk").val();

                                                //드라이브픽업, 상품권 , 해당 결제수단 결재 불가 매장 일 때
                                                if (typeof mid == "undefined" || mid == null || mid ==
                                                    '' || mid == "undefined") {
                                                    $("#pay_info").html($(data).find("#basicPayInfo")
                                                        .html());

                                                    //$('.after_pay .title-type6').removeClass();
                                                    //$(".final_payment_box").css("display","none");//결제수단 저장 버튼 제거
                                                    //$('.after_pay').css('display', 'none'); //현장결제 비노출
                                                    $("#payment_save").val('N');
                                                }
                                                if ($("#drive_yn").val() == 'Y') {
                                                    //드라이빙 픽업 서비스는 선결제만 가능, 최종결제 수단이 선결제라면 결제수단 저장 폼으로 노출
                                                    if (settlement_method == 1 || settlement_method ==
                                                        2) { //최종결제 수단이 후불이라면
                                                        $("#pay_info").html($(data).find(
                                                            "#basicPayInfo").html());
                                                        $(".final_payment_box").css("display",
                                                        "none"); //결제수단 저장 버튼 제거
                                                        //$('.after_pay').css('display', 'none'); //현장결제 비노출

                                                    }
                                                }
                                            }
                                            // 다른 결제 선택시 직전 결제 값 세팅 end
                                        }

                                        // 현금영수증 영역 초기화
                                        initCashReceipt($("#prmt_idx").val());
                                    });

                                    $('.btn-dominopay').on('click', function () {
                                        //$('.dominopay-wrap').addClass('__active');
                                        //$('.otherMethod-wrap').removeClass('__active');
                                        $('.btn-changeMethod').removeClass('__active');
                                        $('.btn-changeMethod').attr('style', 'display:block;');
                                    });

                                    $('.btn-changeMethod').on('click', function () {
                                        event.preventDefault();
                                        $('#sel-dominopay').prop('checked', false);
                                        $('#sel-otherMethod').prop('checked', true);
                                        $('.btn-dominopay').removeClass('selected');
                                        $('#sel-otherMethod').closest('.chk-box').addClass('selected');

                                        //$('.otherMethod-wrap').addClass('__active');
                                        //$('.dominopay-wrap').removeClass('__active');
                                        $('.btn-changeMethod').attr('style', 'display:none;');
                                    });

                                    /* $('.btn-favor').on('click', function () {
                                        event.preventDefault();
                                        $(this).find('i').toggleClass('__selected');
                                    }); */
                                    // E: 200818 도미노페이 고도화

                                    // 현금영수증 영역 초기화
                                    initCashReceipt($("#prmt_idx").val());
                                });


                                if ("" == "Y") {
                                    var item = "input[name=itemCHK]";
                                    $("input:checkbox[name=itemCHK]").prop("checked", false);
                                } else {
                                    var item = "input[name=itemCHK]";
                                    $("input:checkbox[name=itemCHK]").prop("checked", true);
                                }

                                if ("28720" < 50000) {
                                    $('.dc_month').attr('disabled', 'true');
                                }
                            </script>
                            <div class="title-wrap">
                                <h3 class="title-type"><strong>결제수단 선택</strong></h3>
                            </div>
                            
                            <div class="pay-div">
                                <ul>
                                    <li>
                                        <div class="chk-box btn-dominopay selected" id="pay_method_2"
                                            data-mid="dopaytestP" data-value="D|2|Y"
                                            onclick="clickPayType('radio', this);">
                                            <input type="radio" id="sel-dominopay" name="select-payMethod">
                                            <label class="checkbox" for="sel-dominopay"></label>
                                            <label for="sel-dominopay">카드결제</label>
                                        </div>
                                    </li>
                                    
                                    <li>
                                        <div class="chk-box btn-otherMethod"
                                            onmousedown="eval('try{ _trk_clickTrace( \'EVT\', \'결제하기 >다른 결제수단 선택하기\'); }catch(_e){ }');">
                                            <input type="radio" id="sel-otherMethod" name="select-payMethod">
                                            <label class="checkbox" for="sel-otherMethod"></label>
                                            <label for="sel-otherMethod">만나서 결제</label>
                                        </div>
                                        <div class="otherMethod-wrap">
                                            <ul class="pay-info">
                                                <li class="list-chk">
                                                    <div class="chk-box btn-payMethod" id="pay_method_4" data-hidedefault=""
                                                        data-value="9|4|Y" onclick="clickPayType('radio', this);">
                                                        <input type="radio" id="pay1" name="pay"
                                                            onclick="event.stopPropagation()">
                                                        <label class="paynm" for="pay1">만나서 카드결제</label>
                                                    </div>
                                                </li>
                                                <li class="list-chk">
                                                    <div class="chk-box btn-payMethod" id="pay_method_4" data-hidedefault=""
                                                        data-value="9|4|Y" onclick="clickPayType('radio', this);">
                                                        <input type="radio" id="pay2" name="pay"
                                                            onclick="event.stopPropagation()">
                                                        <label class="paynm" for="pay2">현금결제</label>
                                                    </div>
                                                    <div class="chk-box v3 pay2_bill">
                                                        <input type="checkbox" id="pay2_bill_check">
                                                        <label class="checkbox" for="pay2_bill_check"></label>
                                                        <label for="pay2_bill_check">현금영수증 발급받기</label>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>

                                    </li>
                                </ul>
                            
                            </div>
                            
                            <div class="pay-info pay-info3">
                                <ul class="list-text-v2 pay_guide">
                                    <li class="strong">
                                        코로나바이러스 확산에 따라 고객님과 매장 근무자의 안전과 건강을 고려하여 주문시 미리결제를 사용하시면 보다 편하게 이용하실 수 있습니다.
                                    </li>
                                    <li>
                                        일부 카드사 이용제한(BC, 국민, 농협 등)
                                    </li>
                                    <li>
                                        현금결제 시 현금영수증 체크를 확인해주세요
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- // 결제방법 -->



                        <!-- 결제 금액, 퀵 오더로 설정, 결제 및 주문완료 -->
                        <div class="step-wrap" id="final_pay_info">
                            <div class="step-wrap">
                                <div class="title-wrap">
                                    <h3 class="title-type"><strong>최종결제금액</strong></h3>
                                </div>

                                <div class="total-step">
                                    <ul>
                                        <li>
                                            <p class="tit">총 상품 금액</p>
                                            <p class="price"><em>35,900</em>원</p>
                                        </li>
                                        <li class="discount">
                                            <p class="tit">총 할인 금액</p>
                                            <p class="price"><em>7,180</em>원</p>
                                        </li>
                                        <li class="total">
                                            <p class="tit">총 결제 금액</p>
                                            <p class="price"><em>28,720</em>원</p>
                                        </li>
                                    </ul>
                                    
                                </div>
                            </div>
                        </div>
                        <!-- // 결제 금액, 퀵 오더로 설정, 결제 및 주문완료 -->

                        <!-- 주문하기 버튼 -->
                        <div class="btn-wrap">
                            <a href="#" class="btn-type">결제하기</a>
                        </div>
                        <!-- //주문하기 버튼 -->

                    </article>
                </div><!-- //inner-box -->
            </div>
        </div>
    </div>

    <footer id="footer">
        <%@ include file="./footer.jsp" %>
    </footer>


    <!-- script area -->
    <script src="../js/includeHTML.js"></script>
    <script>includeHTML();</script>
    
    <script src="../js/motion.js"></script>
    <script src="../js/ui.js"></script>
</body>

</html>