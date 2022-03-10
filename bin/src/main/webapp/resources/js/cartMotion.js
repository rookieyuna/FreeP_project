$(function(){
    
    var flag = 0;
    var orderList = [];
    var radioFlag = 0;
	var toppingNumFlag = 1;

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
				var temp = $(".now-product .select-item.active").eq(i).find(".prd-cont .order-code").val();
                var orderSelect = {
					code : (parseInt(temp)+1).toString(),
                    name : $(".now-product .select-item.active").eq(i).find(".prd-cont .order-name").text(),
                    kcal1 : $(".now-product .select-item.active").eq(i).find(".prd-cont .info1").text(),
                    kcal2 : $(".now-product .select-item.active").eq(i).find(".prd-cont .info2").text(),
                    size1 : $(".now-product .select-item.active").eq(i).find(".prd-price .size_l").text(),
                    size2 : $(".now-product .select-item.active").eq(i).find(".prd-price .size_m").text(),
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
                + '                <li class="selected"><input type="radio" name="sel_size'+flag+'" value="'+orderList[0].size1+'" id="sel_size'+flag+'-1"  checked disabled="disabled"><label class="sel_size_L" for="sel_size'+flag+'-1"></label></li>'
                + '                <li><input type="radio" name="sel_size'+flag+'" value="'+orderList[0].size2+'" id="sel_size'+flag+'-2"><label class="sel_size_M" for="sel_size'+flag+'-2"></label></li>'
                + '            </ul>'
                + '            <p class="main_menu_sel"><input type="text" name="DOUGH" value="'+orderList[0].code+'">'+orderList[0].name+'</p>'
                + '            <p class="menu_info kcal">'+orderList[0].kcal1+'</p>'
                + '            <p class="menu_info won">'+orderList[0].price1+'</p>'
                + '        </div>'
                + '        <ul class="select_main_sub">'
            );

			for(var i=1; i<orderList.length; i++){
				if(orderList[i].code.includes("4444")){
					var subMenuStr = 
						'<li>'
						+ '<ul class="sub_menu_lay2"><li><input type="text" name="TOPPING'+toppingNumFlag+'" value="'+orderList[i].code+'"><span>'+orderList[i].name+'</span></li>'
						+ '<li>'
						+ '	   <ul class="sub_menu_size">'
	               		+ '        <li class="selected"><input type="radio" name="sub_sel_size'+radioFlag+'" value="'+orderList[i].size1+'" id="sub_sel_size'+radioFlag+'-'+i+'"  checked disabled="disabled"><label class="sub_sel_size_L" for="sub_sel_size'+radioFlag+'-'+i+'"></label></li>'
	               		+ '        <li><input type="radio" name="sub_sel_size'+radioFlag+'" value="'+orderList[i].size2+'" id="sub_sel_size'+radioFlag+'-'+(i+1)+'"><label class="sub_sel_size_M" for="sub_sel_size'+radioFlag+'-'+(i+1)+'"></label></li>'
	                	+ '    </ul>'
						+ '</li>'
						+ '<li><span class="menu_info kcal">'+orderList[i].kcal1+'</span></li>'
						+ '<li><span class="menu_info won">'+orderList[i].price1+'</span></li>'
						+'</li></ul>'
					$(".cart-modal-wrap>tbody .set").last().find(".select_main_sub").append(
	                    subMenuStr
	                );
					toppingNumFlag++;
				}else{
					$(".cart-modal-wrap>tbody .set").last().find(".select_main_sub").append(

						'<li>'
	                    + '<p><input type="text" name="SAUCE" value="'+orderList[i].code+'"><span>'+orderList[i].name+'</span><span class="menu_info kcal">125</span><span class="menu_info won">'+orderList[i].price1+'</span></p>'
						+ '</li>'

	                );
				}
				
                radioFlag++;
            }
            
            $(".cart-modal-wrap>tbody .set").last().find("td").after(    
                '<td><button type="button" class="set_del"><span class="material-icons-outlined">clear</span>'
            );
    
            $(".select-item").removeClass("active");
            $(".DIYmenu>.menu-depth:not(:eq(0))").hide();
            $(this).removeClass("active");
	
			
		
			// 초기화
			toppingNumFlag = 1;
            flag++;
            orderList = [];

		// 총 선택정보
		totalCart();

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
				kcal1 : $(this).find(".prd-cont .info1").text(),
                kcal2 : $(this).find(".prd-cont .info2").text(),
                size1 : $(this).find(".prd-price .size_l").text(),
                size2 : $(this).find(".prd-price .size_m").text(),
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
                +'            <p class="main_menu_sel"><input type="text" name="ct_code" value="'+orderList[flag-1].code+'">'+orderList[flag-1].name+'</p>'
                +'            <p class="menu_info kcal">'+orderList[flag-1].kcal1+'</p>'
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
                            '                <li class="selected"><input type="radio" name="sel_size'+(radioFlag)+'" value="'+orderList[flag-1].size1+'" id="sel_size'+(radioFlag)+'-1" checked disabled="disabled"><label class="sel_size_L" for="sel_size'+(radioFlag)+'-1"></label></li>'
                            + '                <li><input type="radio" name="sel_size'+(radioFlag)+'" value="'+orderList[flag-1].size2+'" id="sel_size'+(radioFlag)+'-2"><label class="sel_size_M" for="sel_size'+(radioFlag)+'-2"></label></li>'    
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

		// 총 선택정보
		totalCart();

    });



    // 동적으로 추가된 radio버튼 조작
    $(document).on('click','input[id*=sel_size]', function () {
        $('input:radio[name=' + $(this).attr('name') + ']').parent().removeClass('selected');
        $(this).parent().addClass('selected');
		$('input:radio[name=' + $(this).attr('name') + ']').removeClass('selected').attr("disabled", false);
		$(this).attr("disabled", true);

        var sizeVal = $(this).parent("li").index()+1;
        var mainCodeStr = $(this).parents(".set").find(".main_menu_sel input").val();
        var mainCutStr = mainCodeStr.substring(0, 4);
		var subCodeStr = $(this).parents(".sub_menu_lay2").find("li:eq(0) input").val();

        if(mainCutStr == 1111 || mainCutStr == 5555 || mainCutStr == 6666){
            for(var key in orderList){
                if(orderList[key].code == mainCodeStr || orderList[key].code == parseInt(mainCodeStr)-1){
    				
                    if(sizeVal==1){
						$(this).parents(".set").find(".select_main_menu .main_menu_sel input[type=text][name=ct_code]").attr("value", Number(mainCodeStr)-1);
                        $(this).parents(".set").find(".select_main_menu .menu_info.won").text(orderList[key].price1);
                        $(this).parents(".set").find(".select_main_menu .menu_info.kcal").text(orderList[key].kcal1);
                    }else if(sizeVal==2){
						$(this).parents(".set").find(".select_main_menu .main_menu_sel input[type=text][name=ct_code]").attr("value", Number(mainCodeStr)+1);
						$(this).parents(".set").find(".select_main_menu .menu_info.won").text(orderList[key].price2);
                        $(this).parents(".set").find(".select_main_menu .menu_info.kcal").text(orderList[key].kcal2);
                    }
                }
            }
        }else{
            var doughSel = $(".select-item .prd-cont input[value="+mainCodeStr+"]").parents(".select-item");
            var toppingSel = $(".select-item .prd-cont input[value="+subCodeStr+"]").parents(".select-item");
			
				if($(this).parents().hasClass("select_main_menu")){
					if(sizeVal==1){
						$(this).parents(".select_main_menu").find(".main_menu_sel input[type=text][name=DOUGH]").attr("value", Number(mainCodeStr)+1);
						mainCodeStr = $(this).parents(".set").find(".main_menu_sel input").val();
						var temp = (parseInt(mainCodeStr)-1).toString();
						doughSel = $(".select-item .prd-cont input[value="+temp+"]").parents(".select-item");
		                $(this).parents(".select_main_menu").find(".menu_info.won").text(doughSel.find(".prd-price .price1").text());
		                $(this).parents(".select_main_menu").find(".menu_info.kcal").text(doughSel.find(".prd-origin .info1").text());
		            }else if(sizeVal==2){
						$(this).parents(".select_main_menu").find(".main_menu_sel input[type=text][name=DOUGH]").attr("value", Number(mainCodeStr)-1);
						mainCodeStr = $(this).parents(".set").find(".main_menu_sel input").val();
						var temp = mainCodeStr;
						doughSel = $(".select-item .prd-cont input[value="+temp+"]").parents(".select-item");
		                $(this).parents(".select_main_menu").find(".menu_info.won").text(doughSel.find(".prd-price .price2").text());
						$(this).parents(".select_main_menu").find(".menu_info.kcal").text(doughSel.find(".prd-origin .info2").text());
		            }	
				}else if($(this).parents().hasClass("select_main_sub")){
					var subCodeTemp = $(this).parents(".sub_menu_lay2").find("li").eq(0).find("input[type=text][name^=TOPPING]").val();
					if(sizeVal==1){
						$(this).parents(".sub_menu_lay2").find("li").eq(0).find("input[type=text][name^=TOPPING]").attr("value", Number(subCodeTemp)+1);
						
						subCodeStr = $(this).parents(".sub_menu_lay2").find("li:eq(0) input").val();
						var temp = (parseInt(subCodeStr)-1).toString();
						toppingSel = $(".select-item .prd-cont input[value="+temp+"]").parents(".select-item");
		                $(this).parents(".sub_menu_lay2").find(".menu_info.won").text(toppingSel.find(".prd-price .price1").text());
		                $(this).parents(".sub_menu_lay2").find(".menu_info.kcal").text(toppingSel.find(".prd-origin .info1").text());
		            }else if(sizeVal==2){
						$(this).parents(".sub_menu_lay2").find("li").eq(0).find("input[type=text][name^=TOPPING]").attr("value", Number(subCodeTemp)-1);
						
						subCodeStr = $(this).parents(".sub_menu_lay2").find("li:eq(0) input").val();
						var temp = subCodeStr;
						toppingSel = $(".select-item .prd-cont input[value="+temp+"]").parents(".select-item");
		                $(this).parents(".sub_menu_lay2").find(".menu_info.won").text(toppingSel.find(".prd-price .price2").text());
						$(this).parents(".sub_menu_lay2").find(".menu_info.kcal").text(toppingSel.find(".prd-origin .info2").text());
		            }
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
		totalCart();
    });

	
    $(document).on('change','input[id*=sel_size]', function () {
		totalCart();
    });
});

function totalCart(){
	var key=0;
	const totalKcal = [];
	const selKcal = $(".menu_info.kcal");
	for(key=0; key<selKcal.length; key++){ 
		totalKcal.push(parseInt(selKcal.eq(key).text().replace(",", "")));
	}		
	const kcalResult = totalKcal.reduce(function add(sum, currValue) {
	  return sum + currValue;
	}, 0);
	
	
	const totalPrice = [];
	const selPrice = $(".menu_info.won");
	for(key=0; key<selPrice.length; key++){ 
		totalPrice.push(parseInt(selPrice.eq(key).text().replace(",", "")));
	}		
	const priceResult = totalPrice.reduce(function add(sum, currValue) {
	  return sum + currValue;
	}, 0);


	$(".menu-cart-modal .kcal.total").text(kcalResult.toLocaleString('ko-KR'));
	$(".menu-cart-modal .won.total").text(priceResult.toLocaleString('ko-KR'));

}




$(document).ready(function() {
	
	$("#insertCartDIYbtn").click(function(e){
		if(document.getElementById("cusid").value==""){
			alert("로그인하세요.");
			return false;
		}
		
		e.stopPropagation();
		var totalArr = [];
		var jsonData = $("#insertCart").serializeArray();
		var flag = $("#insertCart .set").length;
				
		if(jsonData.name=="_csrf"){
			
		}else{
			for(var j=1; j<flag+1; j++){
				eval("var set"+j+"={}");
			}
			
			let i=0;
			while(i<flag){
				for(var key in jsonData){
					
					if(jsonData[key].name=="DOUGH"){
						++i;
						eval("set"+i).dough = jsonData[key].value;
					}else if(jsonData[key].name=="SAUCE"){
						eval("set"+i).sauce = jsonData[key].value;
					}else if(jsonData[key].name=="TOPPING1"){
						eval("set"+i).topping1 = jsonData[key].value;
					}else if(jsonData[key].name=="TOPPING2"){
						eval("set"+i).topping2 = jsonData[key].value;
					}else if(jsonData[key].name=="TOPPING3"){
						eval("set"+i).topping3 = jsonData[key].value;
					}else if(jsonData[key].name=="TOPPING4"){
						eval("set"+i).topping4 = jsonData[key].value;
					}else if(jsonData[key].name=="TOPPING5"){
						eval("set"+i).topping5 = jsonData[key].value;
					}else{
						console.log(error);
					}
				}
			}
			for(var z=1; z<flag+1; z++){
				totalArr.push(eval("set"+z));
			}
		}
		reqAjaxCartDiy(totalArr);
	});
	
	function reqAjaxCartDiy(sendData) {
		$.ajax({
			headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')}
		    , url:'./insertCartDiy.do'
		    , method : 'POST'
			, traditional: true
		    , data: {
				data: JSON.stringify(sendData)
			}
		    , dataType: 'json'
			, success: function(){
				alert("상품이 장바구니에 담겼습니다");
				window.location.reload();
		    }
			, error: function(data){
				for(var i in data){
					alert(data[i]);
				}
			}
		})	
	}
});		

	
