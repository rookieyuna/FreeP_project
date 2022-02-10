$(function () {

    $(".btn-detail").click(function(){
        $(".pop-layer").show();
    });
    $(".btn-close").click(function(){
        $(".pop-layer").hide();
    });
    
    $(".btnC1").click(function(){
        if($(this).parent().hasClass("active")){

        }else{
            $(this).parent().toggleClass("active");
            $(this).parent().siblings().toggleClass("active");
    
            var checkingIndex = $(this).parent().index();
            
            $(".tab-list>div").removeClass("active");
            $(".tab-list>div:eq("+checkingIndex+")").toggleClass("active");
        }
    })

    $(".store-search li").click(function(){
        $(".store-search .tab-content").toggleClass("active");
    })

    $(".menu-cart-btn").click(function(){
        $(".DIYmenu").toggleClass("active");
        $('.menu-cart-modal').toggleClass("active");

        $(".otherMenu").toggleClass("active");
    });
    
    $(".DIY-detail-modal .tab-type li button").click(function(){
        if($(this).parent().hasClass("active")){

        }else{
            $(this).parent().toggleClass("active");
            $(this).parent().siblings().toggleClass("active");
    
            var checkingIndex = $(this).parent().index();
            
            $(".allergy-table>li").removeClass("active");
            $(".allergy-table>li:eq("+checkingIndex+")").toggleClass("active");
        }
    })

    
    $(".otherMethod-wrap").hide();
    $(".pay-div>ul>li>.chk-box").click(function(){
        if($(".btn-otherMethod").hasClass("selected")){
            $(".otherMethod-wrap").hide();
        }else if($(this).hasClass("btn-dominopay")){
            $(".otherMethod-wrap").hide();
        }else{
            $(".otherMethod-wrap").show();
        }
    });

    // 주문목록 순차적 선택
    $(".DIYmenu>.menu-depth:not(:eq(0))").hide();
    $(".DIYmenu_section_list>li").click(function(){
        var i = $(this).parents(".menu-depth").index();
        $(".menu-depth:eq("+(i+1)+")").show();
    });

    // 주문목록 선택 표시
    $(".DIYmenu_section_list>li").click(function(){
        if($(this).parents(".menu-depth").hasClass("dough") || $(this).parents(".menu-depth").hasClass("sauce")){
            $(this).siblings().removeClass("active");
            $(this).toggleClass("active");
        }else{
            if($(".topping>.active").length > 5){
                alert("최대 허용 갯수를 초과하였습니다")
            }else{
                $(this).toggleClass("active");
            }
        };
    });

    // 주문목록 상세보기(사이즈 선택)
    $(".menu-cart-modal button").click(function(){
        if($(this).parent().hasClass("active")){

        }else{
            $(this).parent().toggleClass("active");
            $(this).parent().siblings().toggleClass("active");
        }
    })

    // 커뮤니티>후기게시판>후기이미지 클릭 버튼 동작
    $(".review .img_wrap").click(function(){
        $(".review-detail-modal").css({
            "display":"block"
        })
    });

    // 마이페이지>MY리뷰>마이리뷰리스트 클릭 버튼 동작
    $(".mypage .myReview-wrap .board-list tr").click(function(){
        $(".review-detail-modal").css({
            "display":"block"
        })
    });

    // 커뮤니티>후기게시판>상세보기 이미지 조작
    $(".modal2-con .con1-top-wrap button").click(function(){
        $(".modal2-con .con1-top-wrap li").removeClass("active");
        $(this).closest("li").toggleClass("active");
    })

    // 후기페이지 > 상세보기 > 아코디언 패널
    $(".aco_top").on('click',function(e){
        $(this).children(".detail-more-btn").toggleClass('active');
        if($(this).next().css("display")=="none"){
            $(".aco_bottom").slideUp();
            $(this).next().slideDown();
        }else{
            $(".aco_bottom").slideUp();
        }
    });
    
    $(".review_to_order").click(function(e){
        e.stopPropagation();
        // 바로주문 버튼 클릭시 주문페이지 이동 구현 예정
        
    });


    // etc > FAQ 테이블 아코디언 기능
    $(".faq .faq-area .lst_faq_wrap dt").click(function (e) {
        e.stopPropagation();
        $(this).next().slideToggle(300);
        $(".faq .faq-area .lst_faq_wrap dt").not(this).next().slideUp(300);
        return false;
    });
    $(".faq .faq-area .lst_faq_wrap dt").eq(0).trigger("click");



    

   
    $(".slider").not('.slick-initialized').slick();
});

//favorite heart like/unlike
document.querySelectorAll(".material-icons")
.forEach(function(el) {  
   el.addEventListener("click",
    function() {
      if (this.classList.contains("unlike"))
        this.classList.toggle("like");
      else this.classList.toggle("unlike");
    });
});

// etc > FAQ 상단 질문유형 클릭시 기능
function callFunction(e, num){
    $(".btn_tab_faq li").removeClass("active");
    $(e).parent().addClass("active");
    $(".lst_faq_wrap").children("ul").hide();
    $(".lst_faq_wrap").children("ul").eq(num-1).show();
    $(".lst_faq_wrap").children("ul").eq(num-1).children("li").eq(0).find("dd").show();
}


var slideCount = document.getElementById("slide-count");
$(function(){
    $('.visual-slider').on('init reInit afterChange', function (event, slick, currentSlide, nextSlide) {
        var i = (currentSlide ? currentSlide : 0) + 1;
        $(this).find('.slide-count').html('<span class="current">' + i + '</span> ' + '/' + ' <span class="total">' + slick.slideCount + '</span>');
    });

    // play button
	$('.visual-area .btn-play').click(function() {
        $(this).toggleClass("on");
        if($(this).hasClass("on")){
            $('.slick-track').slick('slickPause');
        }else{
            $('.slick-track').slick('slickPlay');
        }
    });
})
$(document).ready(function(){
    $('.slick-track').slick({

        dots: true, //페이지 네비게이션 
        arrows:true, // next, prev 이동 버튼 
        autoplay: true, // 자동 넘김 여부 
        speed: 300, //슬라이드 속도 
        autoplaySpeed : 3000, // 자동 넘김시 슬라이드 시간 
        pauseOnHover : true,// 마우스 hover시 슬라이드 멈춤 
        vertical : false, // 세로 방향 슬라이드 옵션
        prevArrow : "<button type='button' class='slick-prev'>Previous</button>", nextArrow : "<button type='button' class='slick-next'>Next</button>", //화살표 커스텀 
        slidesToShow: 1, //보여질 슬라이드 수 
        slidesToScroll: 1, //넘겨질 슬라이드 수
    });
});


//etc > franInquiry 거주지역 셀렉트문
function LocationChange(e) {
    const state = document.getElementById("region_code_2");

    const seoul = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
    const incheon = ["계양구","남동구","미추홀구","부평구","서구","연수구","중구","강화군","옹진군"];
    const gyeonggi = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","양평군","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","여주군",];
    const gangwon = ["강릉시","동해시","삼척시","속초시","영월군","원주시","인제군","정선군","철원군","춘천시","태백시","평창군","홍천군","횡성군"];
    const chungnam = ["계룡시","공주시","논산시","당진시","보령시","부여군","서산시","아산시","천안시","태안군","홍성군"];
    const chungbuk = ["제천시","음성군","증평군","진천군","청주시","충주시"];
    const daejeon = ["대덕구", "동구", "서구", "유성구", "중구"];
    const gyeongsangnam = ["거제시", "거창군", "김해시", "밀양시", "사천시", "양산시", "진주시", "창원시", "통영시"];
    const gyeongsangbuk = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","예천군","칠곡군","포항시"];
    const daegu = ["남구", "달서구", "동구", "북구", "서구", "수성구", "중구", "달성군"];
    const jeonnam = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
    const jeonbuk = ["군산시", "김제시", "남원시", "익산시", "전주시", "정읍시", "고창군", "무주군", "부안군", "순창군", "완주군", "임실군", "장수군", "진안군"];
    const gwangju = ["광산구", "남구", "동구", "북구", "서구"];
    const ulsan = ["남구","동구","북구","중구","울주군"];
    const busan = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
    const jeju = ["서귀포시","제주시","남제주군","북제주군"];
    const sejong = ["세종시"];
    

    if (e.value == "01") {
        add = seoul;
    } else if (e.value == "02") {
        add = incheon;
    } else if (e.value == "03") {
        add = gyeonggi;
    } else if (e.value == "04") {
        add = gangwon;
    } else if (e.value == "05") {
        add = gwangju;
    } else if (e.value == "06") {
        add = chungbuk;
    } else if (e.value == "07") {
        add = daejeon;
    } else if (e.value == "08") {
        add = gyeongsangnam;
    } else if (e.value == "09") {
        add = gyeongsangbuk;
    } else if (e.value == "10") {
        add = daegu;
    } else if (e.value == "11") {
        add = jeonnam;
    } else if (e.value == "12") {
        add = jeonbuk;
    } else if (e.value == "13") {
        add = gwangju;
    } else if (e.value == "14") {
        add = ulsan;
    } else if (e.value == "15") {
        add = busan;
    } else if (e.value == "16") {
        add = sejong;
    } else if (e.value == "17") {
        add = jeju;
    }

    //초기화 
    state.options.length = 1;

    for (property in add) {
        let opt = document.createElement("option");
        opt.value = add[property];
        opt.innerHTML = add[property];
        state.appendChild(opt);
    }
}
