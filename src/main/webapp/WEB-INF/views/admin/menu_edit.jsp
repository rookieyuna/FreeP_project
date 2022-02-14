<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>     
<%@ include file="./commons/header.jsp" %>
<script>
//폼값 입력 여부 체크
function validateForm(form) {
	if(form.g_code.value==""){
		alert("상품구분을 선택하세요.");
		return false;
	}
	if(form.p_code.value==""){
		alert("상품코드를 입력하세요.");
		form.p_code.focus();
		return false;
	}
	if(form.p_name.value==""){
		alert("이름을 입력하세요.");
		form.p_name.focus();
		return false;
	}
	if(!form.p_price.value){
		alert("가격을 입력하세요.");
		form.p_price.focus();
		return false;
	}
	if(!form.p_size.value){
		alert("사이즈를 입력하세요.");
		form.p_size.focus();
		return false;
	}
	if(!form.p_info.value){
		alert("영양정보를 입력하세요.");
		form.p_info.focus();
		return false;
	}
}

$(function(){
	$('#deletefile').click(function(){
		
		var deleteofile= document.getElementById('deleteofile');
		deleteofile.value = "1";
		const fileinput = document.getElementById('fileinput');
		fileinput.innerHTML =
			'<input name="file" type="file" class="form-control-file" value="${vo.p_ofile }">  <small class="form-text text-muted">이미지 등록</small>';
	}) 	
})

//기본피자 외 선택시 베스트피자여부 칸 비활성화
/* $(function() {
	$("select[name=g_code]").click(function(){
		
		if($("select[name=g_code]:selected").val() == "1"){
	        $("#bestSelect").attr("readOnly",true);
	    }
		else{
			$("#bestSelect").attr("readOnly",false);
		}
    });
}); */
// 
/* function selectGcode(frm){
	var g_code = frm.g_code.value;
	if(g_code=="1"){ 
        frm.p_best_pizza.readOnly = true; //readonly속성 해제
    }
    else{
        frm.p_best_pizza.readOnly = false; //readonly속성 활성화
    }
} */
</script>
<body>
<div class="app-container app-theme-white body-tabs-shadow fixed-sidebar fixed-header">
         <%@ include file="./commons/top.jsp" %>               
         
         <div class="app-main">
                <%@ include file="./commons/left.jsp" %>      
                
                <div class="app-main__outer">
				<div class="app-main__inner">
					<div class="app-page-title">
						<div class="page-title-wrapper">
							<div class="page-title-heading">
								<div class="page-title-icon">
									<i class="pe-7s-graph text-success"> </i>
								</div>
								<div>상품 수정
									<div class="page-title-subheading">상품 수정 페이지입니다.</div>
								</div>
							</div>						
						</div>
					</div>


					<div class="row">
						<div class="col-lg-12">
							<div class="main-card mb-3 card">
								<div class="card-body">
									<div class="tab-pane tabs-animation fade show active" id="tab-content-0" role="tabpanel">
										<div class="main-card mb-3 card">
											<div class="card-body"><h5 class="card-title">선택한 상품 등록 정보</h5>
												<form:form name="menuFrm" method="post" onsubmit="return validateForm(this);" 
													action="./menuEditAction.do" enctype="multipart/form-data">
													<input type="hidden" name="pre_sfile" value="${vo.p_sfile }" />
													<input type="hidden" id="deleteofile" name="deleteofile" />
													 <div class="form-row">
		                                                <div class="col-md-6">
															<table class="mb-0 table table-striped">
																<tr>
																	<th class="text-center" style="vertical-align:middle;">상품구분</th>
																	<td>
																		<select name="g_code" class="form-control" style="width:70%;">
																			<option selected disabled>--상품 종류--</option>
																			<option value="1">기본피자</option>
																			<option value="2">도우</option>
																			<option value="3">소스</option>
																			<option value="4">토핑</option>
																			<option value="5">사이드</option>
																			<option value="6">음료</option>
																		</select> 
																	</td>
																</tr>
																<tr>
																	<th class="text-center" style="vertical-align:middle;">상품코드</th>
																	<td>
																		<input type="text" class="form-control" name="p_code" style="width:70%;" value="${vo.p_code }"/>
																	</td>
																</tr>
																<tr>
																	<th class="text-center" style="vertical-align:middle;">이름</th>
																	<td>
																		<input type="text" class="form-control" name="p_name" style="width:70%;" value="${vo.p_name }"/>
																	</td>
																</tr>
																<tr>
																	<th class="text-center" style="vertical-align:middle;">가격</th>
																	<td>
																		<input type="text" class="form-control" name="p_price" style="width:70%;" value="${vo.p_price }"/>
																	</td>
																</tr>
																<tr>
																	<th class="text-center" style="vertical-align:middle;">사이즈</th>
																	<td>
																		<select name="p_size" class="form-control" style="width:70%;">
					                                                        <option value="" selected disabled>--- 선택하세요 ---</option>
					                                                        <option value="M">M</option>
					                                                        <option value="L">L</option>
					                                                    </select>
																	</td>
																</tr>
																<tr>
																	<th class="text-center" style="vertical-align:middle;">영양정보</th>
																	<td>
																		<input type="text" class="form-control" name="p_info" style="width:70%;" value="${vo.p_info }"/>
																	</td>
																</tr>
																<c:set var="file1" value="${vo.p_sfile }"/>
																	<c:if test="${empty file1}">
																		<th class="text-center" style="vertical-align:middle;">이미지</th>
																		<td>
																			<input name="file" id="newfile" type="file" class="form-control-file">
																			<small class="form-text text-muted">이미지 등록</small>
																		</td>
																	</c:if>
																	<c:if test="${not empty file1}">
																		<th class="text-center" style="vertical-align:middle;">이미지</th>
																			<td id="fileinput">
																				<input name="pre_file" id="pre_file" class="form-control" style="width:200px;float:left;" value="${vo.p_ofile }">							
																				<button type="button" class="btn btn-secondary" id="deletefile">파일 삭제</button>
																			</td>
																	</c:if>
															</table>
														</div>
													</div>
					
													<div class="row mt-3 mb-3">
														<div class="col d-flex justify-content-end">
															<button type="reset" class="btn btn-dark">다시쓰기</button>
															<button type="button" class="btn btn-danger" onclick="location.href='menuDelete.do?g_code=${vo.g_code}&p_code=${vo.p_code}&pre_sfile=${vo.p_sfile }';">삭제하기</button>
															<button type="button" class="btn btn-warning" onclick="location.href='menu.do?g_code=${vo.g_code}';">목록보기</button>
															<button type="submit" class="btn btn-primary">등록하기</button>
														</div>
													</div>
												</form:form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
        </div>
    </div>
<script type="text/javascript" src="../assets/scripts/main.js"></script>
</body>
</html>
