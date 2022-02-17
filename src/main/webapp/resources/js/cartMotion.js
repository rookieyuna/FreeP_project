$(function(){
    
    var flag = 0;
    var orderList = [];
    var radioFlag = 0;

    // DIY메뉴 3개이상 선택시 DIY만들기 버튼 활성화
    $(".DIYmenu .select-item").click(function(){
        var count = $(".select-item.active").length;

        if(count > 2){
            $(".DIY_make button").addClass("active");

        }else{
            $(".DIY_make button").removeClass("active");
        }
    })

    // DIY만들기 버튼 클릭시 선택목록에 담기 수행
    $(".DIY_make button").click(function(){
        var count = $(".select-item.active").length;
        
        // 3개이상 선택해야 수행
        if(count > 2){
            if(flag==0){
                $('.menu-cart-modal').addClass("active");
                $(".otherMenu").addClass("active");
    
                if($(".menu-list-area").hasClass("active")){
                    $(".menu-list-area").addClass("active");
                    
                }else{
                    $(".menu-list-area").addClass("active");
                }
                flag++;
            }


            for(var i=0; i<count; i++){
                var orderSelect = {
                    code : $(".now-product .select-item.active").eq(i).find(".prd-cont .order-code").val(),
                    name : $(".now-product .select-item.active").eq(i).find(".prd-cont .order-name").text(),
                    price1 : $(".now-product .select-item.active").eq(i).find(".prd-price .price1").text(),
                    price2 : $(".now-product .select-item.active").eq(i).find(".prd-price .price2").text(),
                };
                
                orderList.push(orderSelect);
            }
    
            $(".menu-cart-modal .cart-modal-wrap>tbody").append(
                '<tr class="set">'
                + '    <td>'
                + '        <div class="select_main_menu">'
                + '            <ul class="main_menu_size">'
                + '                <li class="selected"><input type="radio" name="sel_size'+flag+'" value="large" id="sel_size'+flag+'-1" checked><label class="sel_size_L" for="sel_size'+flag+'-1"></label></li>'
                + '                <li><input type="radio" name="sel_size'+flag+'" value="medium" id="sel_size'+flag+'-2"><label class="sel_size_M" for="sel_size'+flag+'-2"></label></li>'
                + '            </ul>'
                + '            <p class="main_menu_sel"><input type="text" value="'+orderList[0].code+'">'+orderList[0].name+'</p>'
                + '            <p class="menu_info kcal">1050</p>'
                + '            <p class="menu_info won">'+orderList[0].price1+'</p>'
                + '        </div>'
                + '        <ul class="select_main_sub">'
            );
            for(var i=1; i<orderList.length; i++){
                $(".cart-modal-wrap>tbody .set").last().find(".select_main_sub").append(
                    '<li>'
                    + '<p><input type="text" value="'+orderList[i].code+'"><span>'+orderList[i].name+'</span><span class="menu_info kcal">125</span><span class="menu_info won">'+orderList[i].price1+'</span></p>'
                    + '</li>'
                );
            }
            $(".cart-modal-wrap>tbody .set").last().find("td").after(    
                '<td><button type="button" class="set_del"><span class="material-icons-outlined">clear</span>'
            );
    
            $(".select-item").removeClass("active");
            $(".DIYmenu>.menu-depth:not(:eq(0))").hide();
            $(this).removeClass("active");
            flag++;
            orderList = [];

        }else{
            alert("도우, 소스, 토핑(최소 1개)을 모두 선택해주세요");
        }

    });




    // 일반, 사이드, 음료 선택시
    $(".NORMALmenu .select-item").click(function(){
        // 장바구니 창 첫번째 제품 클릭시 열림(flag==0)
        if(flag==0){
            $('.menu-cart-modal').addClass("active");
            $(".otherMenu").addClass("active");

            if($(".menu-list-area").hasClass("active")){
                $(".menu-list-area").addClass("active");
                
            }else{
                $(".menu-list-area").addClass("active");
            }
        }

        if($(this).hasClass("active")){
            var orderSelect = {
                code : $(this).find(".prd-cont .order-code").val(),
                name : $(this).find(".prd-cont .order-name").text(),
                price1 : $(this).find(".prd-price .price1").text(),
                price2 : $(this).find(".prd-price .price2").text()
            };
            
            orderList.push(orderSelect);
            
			flag++;
            // 선택 됫을때
            $(".menu-cart-modal .cart-modal-wrap>tbody").append(
                '<tr class="set">'
                +'    <td>'
                +'        <div class="select_main_menu">'
                +'            <ul class="main_menu_size">'
                +'            </ul>'
                +'            <p class="main_menu_sel"><input type="text" value="'+orderList[flag-1].code+'">'+orderList[flag-1].name+'</p>'
                +'            <p class="menu_info kcal">1050</p>'
                +'            <p class="menu_info won">'+orderList[flag-1].price1+'</p>'
                +'        </div>'
                +'    </td>'
                +' <td><button type="button" class="set_del"><span class="material-icons-outlined">clear</span>'
                +'</tr>'
            );

            if($(this).parent().hasClass("drink") || $(this).parent().hasClass("sidedish")){

            }else if($(this).parent().hasClass("normalPizza")){
                var codeStr = $(this).find(".prd-cont .order-code").val();
                radioFlag++;
                for(var key in orderList){
                    if(orderList[key].code == codeStr){
                        $(".main_menu_sel input[value="+codeStr+"]").parents(".set").find(".main_menu_size").append(
                            '                <li class="selected"><input type="radio" name="sel_size'+(radioFlag)+'" value="large" id="sel_size'+(radioFlag)+'-1" checked><label class="sel_size_L" for="sel_size'+(radioFlag)+'-1"></label></li>'
                            + '                <li><input type="radio" name="sel_size'+(radioFlag)+'" value="medium" id="sel_size'+(radioFlag)+'-2"><label class="sel_size_M" for="sel_size'+(radioFlag)+'-2"></label></li>'    
                        );
                    }
                }
            }
            
            

        }else{
            // 선택 취소 됫을때
            
            var codeStr = $(this).find(".prd-cont .order-code").val();
            
            for(var key in orderList){
                if(orderList[key].code == codeStr){
                    orderList.splice(key, 1);
                    $(".set").eq(key).remove();
                }
            }
			flag--;
        }

    });



    // 동적으로 추가된 radio버튼 조작
    $(document).on('click','input[id^=sel_size]', function () {
        $('input:radio[name=' + $(this).attr('name') + ']').parent().removeClass('selected');
        $(this).parent().addClass('selected');

        var sizeVal = $(this).parent("li").index()+1;
        var codeStr = $(this).parents(".set").find(".main_menu_sel input").val();
        var cutStr = codeStr.substring(0, 4);

        if(cutStr == 1111 || cutStr == 5555 || cutStr == 6666){
            for(var key in orderList){
                if(orderList[key].code == codeStr){
    
                    if(sizeVal==1){
                        $(this).parents(".set").find(".select_main_menu .menu_info.won").text(orderList[key].price1);
                    }else if(sizeVal==2){
                        $(this).parents(".set").find(".select_main_menu .menu_info.won").text(orderList[key].price2);
                    }
                }
            }
        }else{
            var doughPrice = $(".select-item .prd-cont input[value="+codeStr+"]").parents(".select-item");
            if(sizeVal==1){
                $(this).parents(".set").find(".select_main_menu .menu_info.won").text(doughPrice.find(".prd-price .price1").text());
            }else if(sizeVal==2){
                $(this).parents(".set").find(".select_main_menu .menu_info.won").text(doughPrice.find(".prd-price .price2").text());
            }
        }

    });


    // 동적으로 추가된 선택품목 지우기 버튼 조작
    $(document).on('click','.set_del', function () {

        var codeStr = $(this).parents(".set").find(".main_menu_sel input").val();
        var cutStr = codeStr.substring(0, 4);
        if(cutStr == 1111 || cutStr == 5555 || cutStr == 6666){
            $(".order-code[value="+codeStr+"]").parents(".select-item").removeClass("active");
        
            for(var key in orderList){
                if(orderList[key].code == codeStr){
                    orderList.splice(key, 1);
                    $(".set").eq(key).remove();
                }
            }
            flag--;
        }else{
            $(this).parents(".set").remove();
        }

    });

	
    
});