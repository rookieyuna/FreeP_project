<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 시큐리티랑 ajax같이 쓰려면 이걸 써야 함. -->
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
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


//아이디 찾기.
	function id_find() {
	
	var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
	
    
    
    if($("#phone").val() == ""){
    	alert("전화번호를 입력해주세요.");
    }
    else{
		$.ajax({  
			 url : './search_id.do?phone='+$("#phone").val(),               
			 type : 'get',
			 beforeSend : function(xhr){
	        		xhr.setRequestHeader(header, token);
	            },
			 dataType : "json",
			 success : function(data){
				 var id = data.id;
				 
				 if(id == null){
					 alert("해당 휴대폰으로 가입된 아이디가 없습니다.\n회원가입을 진행해주세요.")
				 }
				 else{
				 	alert("귀하의 아이디는"+id+"입니다.\n로그인 페이지로 이동합니다.");
				 	location.href = "./login.do";
				 }
				  
			 },
			 error : function(request,statue,error){
	            	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"
	            			+"\n"+"error:"+error)
	            	
	         }
		}); 
    }
}



</script>

<style>
     #phone2, #phoneChk2{
	  margin-top: 30px;
	} 
	#phone3{
		vertical-align: middle;
		padding-top: 17px
	}
    
	#passwd, #confirmpw {
	  padding-left: 20px;
	}
	#zipcode2{
	  padding-left: 10px;
	}
	
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
                    <h2 class="page-title">아이디 찾기</h2>
                    <div class="depth-area">
                        <ol>
                            <li><a href="/FreeP/index.html">홈</a></li>
                            <li><strong>아이디 찾기</strong></li>
                        </ol>
                    </div>
                </div>
                <article class="join-area">
                    <div class="join-step2">
                        <div class="step-list">
                        
                        </div>
                        <div class="myinfo-wrap">
                            <div class="form">
                                <dl>
                                    <dt class="top">가입 시 입력한 휴대전화</dt>
                                    <dd>
                                        <div class="form-item name">
                                            
                                            <input type="text" name="phone" id="phone" maxlength="16" value="" placeholder="- 을 제외한 휴대폰 번호 입력"  onKeyPress="if( event.keyCode==13 ){id_find();}"/>
                                            <br>
                                        </div>
                                    </dd>
                                </dl>
                                <div class="btn-wrap"  id="passChage">
                                	<button type="button" class="btn-type v6" onclick="id_find();" onKeyPress="if( event.keyCode==13 ){id_find();}">아이디 찾기</button>
                            	</div>
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