jQuery(function () {

    jQuery(".btn-detail").click(function(e){
		e.stopPropagation();
        $(".pop-layer").show();
    });
   jQuery(".btn-close").click(function(){
        $(".pop-layer").hide();
    });
    
    jQuery(".btnC1").click(function(){
        if($(this).parent().hasClass("active")){

        }else{
            $(this).parent().toggleClass("active");
            $(this).parent().siblings().toggleClass("active");
    
            var checkingIndex = $(this).parent().index();
            
            $(".tab-list>div").removeClass("active");
            $(".tab-list>div:eq("+checkingIndex+")").toggleClass("active");
        }
    })

<<<<<<< HEAD
    jQuery(".store-search li").click(function(){
=======
    $(".store-search #tabs").click(function(){
>>>>>>> 189c96e6999f4f0799ee99fb0b8b1fc11e240d8b
        $(".store-search .tab-content").toggleClass("active");
    })

    
    jQuery(".DIY-detail-modal .tab-type li button").click(function(){
        if($(this).parent().hasClass("active")){

        }else{
            $(this).parent().toggleClass("active");
            $(this).parent().siblings().toggleClass("active");
    
            var checkingIndex = $(this).parent().index();
            
            $(".allergy-table>li").removeClass("active");
            $(".allergy-table>li:eq("+checkingIndex+")").toggleClass("active");
        }
    })

    
    jQuery(".otherMethod-wrap").hide();
    jQuery(".pay-div>ul>li>.chk-box").click(function(){
        if($(".btn-otherMethod").hasClass("selected")){
            $(".otherMethod-wrap").hide();
        }else if($(this).hasClass("btn-dominopay")){
            $(".otherMethod-wrap").hide();
        }else{
            $(".otherMethod-wrap").show();
        }
    });

    // 주문목록 선택 표시
    jQuery(".now-product>li").click(function(){
        if($(this).parents(".menu-depth").hasClass("dough") || $(this).parents(".menu-depth").hasClass("sauce")){
            $(this).siblings().removeClass("active");
            $(this).toggleClass("active");

        }else if($(this).parent(".now-product").hasClass("DIYmenu_section_list")){
            if($(this).hasClass("active")){
                $(this).removeClass("active");
            }else{
                if($(".topping .select-item.active").length > 4){
                    alert("최대 허용 갯수를 초과하였습니다")
                }else{
                    $(this).toggleClass("active");
                    $(".DIY_make button").addClass("active");
                }
            }
        }else{
            $(this).toggleClass("active");
        };
    });

    // 주문목록 순차적 선택
    jQuery(".DIYmenu>.menu-depth:not(:eq(0))").hide();
    jQuery(".DIYmenu_section_list>li").click(function(){
        var i = $(this).parents(".menu-depth").index();

        if($(this).hasClass("active")){
            $(".menu-depth:eq("+(i+1)+")").show();
        }else{
            $(".menu-depth:eq("+(i+1)+")").hide();
        }
    });

    // 선택품목 보기
    jQuery(".menu-cart-btn").click(function(){
        $(".DIYmenu").toggleClass("active");
        $('.menu-cart-modal').toggleClass("active");

        $(".otherMenu").toggleClass("active");

        if($(".menu-list-area").hasClass("active")){
            $(".menu-list-area").toggleClass("active");
            
        }else{
            $(".menu-list-area").toggleClass("active");
        }
    });

    

    


    // 커뮤니티>후기게시판>후기이미지 클릭 버튼 동작
    jQuery(".review .img_wrap").click(function(){
        $(".review-detail-modal").css({
            "display":"block"
        })
    });

    // 마이페이지>MY리뷰>마이리뷰리스트 클릭 버튼 동작
    jQuery(".mypage .myReview-wrap .board-list tr").click(function(){
        $(".review-detail-modal").css({
            "display":"block"
        })
    });
     
    // 컴패니>매장찾기>상세보기 클릭 버튼 동작
    $(".store-search .store-info-box").click(function(){
        $(".store-detail-modal").css({
            "display":"block",
        })
    });
    
    // 컴패니>매장찾기>전체매장보기 클릭 버튼 동작
    $(".detail-map").click(function(){
        $(".map-detail-modal").css({
            "display":"block",
        })
    });

    // 커뮤니티>후기게시판>상세보기 이미지 조작
    jQuery(".modal2-con .con1-top-wrap button").click(function(){
        $(".modal2-con .con1-top-wrap li").removeClass("active");
        $(this).closest("li").toggleClass("active");
    })

    // 후기페이지 > 상세보기 > 아코디언 패널
    jQuery(".aco_top").on('click',function(e){
        $(this).children(".detail-more-btn").toggleClass('active');
        if($(this).next().css("display")=="none"){
            $(".aco_bottom").slideUp();
            $(this).next().slideDown();
        }else{
            $(".aco_bottom").slideUp();
        }
    });
    
    jQuery(".review_to_order").click(function(e){
        e.stopPropagation();
        // 바로주문 버튼 클릭시 주문페이지 이동 구현 예정
        
    });


    // etc > FAQ 테이블 아코디언 기능
    jQuery(".faq .faq-area .lst_faq_wrap dt").click(function (e) {
        e.stopPropagation();
        $(this).next().slideToggle(300);
        $(".faq .faq-area .lst_faq_wrap dt").not(this).next().slideUp(300);
        return false;
    });
    jQuery(".faq .faq-area .lst_faq_wrap dt").eq(0).trigger("click");



    

   
    jQuery(".slider").not('.slick-initialized').slick();
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
    jQuery(".btn_tab_faq li").removeClass("active");
    jQuery(e).parent().addClass("active");
    jQuery(".lst_faq_wrap").children("ul").hide();
    jQuery(".lst_faq_wrap").children("ul").eq(num-1).show();
    jQuery(".lst_faq_wrap").children("ul").eq(num-1).children("li").eq(0).find("dd").show();
}


var slideCount = document.getElementById("slide-count");
jQuery(function(){
    jQuery('.visual-slider').on('init reInit afterChange', function (event, slick, currentSlide, nextSlide) {
        var i = (currentSlide ? currentSlide : 0) + 1;
        $(this).find('.slide-count').html('<span class="current">' + i + '</span> ' + '/' + ' <span class="total">' + slick.slideCount + '</span>');
    });

    // play button
	jQuery('.visual-area .btn-play').click(function() {
        $(this).toggleClass("on");
        if($(this).hasClass("on")){
            $('.slick-track').slick('slickPause');
        }else{
            $('.slick-track').slick('slickPlay');
        }
    });
})
jQuery(document).ready(function(){
    jQuery('.slick-track').slick({

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

jQuery(document).on('change', '#test', function () {
    $('#test').removeClass('selected');
});


// 리뷰페이지 modal 이미지 조작
function reviewSlick(){
	$('.review-detail-modal .review-image-wrap').slick({

        dots: true, //페이지 네비게이션 
        //arrows:true, // next, prev 이동 버튼 
		infinite: true,
        //autoplay: true, // 자동 넘김 여부 
        speed: 300, //슬라이드 속도 
        //autoplaySpeed : 3000, // 자동 넘김시 슬라이드 시간 
        //pauseOnHover : true,// 마우스 hover시 슬라이드 멈춤 
        vertical : false, // 세로 방향 슬라이드 옵션
        prevArrow : "<button type='button' class='slick-prev'>Previous</button>", nextArrow : "<button type='button' class='slick-next'>Next</button>", //화살표 커스텀 
        slidesToShow: 1, //보여질 슬라이드 수 
        slidesToScroll: 1, //넘겨질 슬라이드 수
		variableWidth:true,
		adaptiveHeigh: true,
		//centerMode: true,
		lazyLoad: 'progressive',
    });	
}
    


$(function(){
	$(".review-img-pre").click(function(){
		
	});
	
});

