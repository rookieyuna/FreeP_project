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
	if(form.p_best_pizza.value==""){
		alert("베스트 피자 여부를 선택하세요.");
		return false;
	}
	/* if(!form.newfile.value){
		alert("이미지를 첨부하세요.");
		return false;
	} */
}
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
													 <div class="form-row">
		                                                <div class="col-md-6">
															<table class="mb-0 table table-striped">
																<tr>
																	<th class="text-center" style="vertical-align:middle;">상품구분</th>
																	<td>
																		<select name="g_code" class="form-control" style="width:70%;" >
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
																		<input type="text" class="form-control" name="p_size" style="width:70%;" value="${vo.p_size }"/>
																	</td>
																</tr>
																<tr>
																	<th class="text-center" style="vertical-align:middle;">영양정보</th>
																	<td>
																		<input type="text" class="form-control" name="p_info" style="width:70%;" value="${vo.p_info }"/>
																	</td>
																</tr>
																<tr>
																	<th class="text-center" style="vertical-align:middle;">베스트피자구분</th>
																	<td>
																		<select name="p_best_pizza" class="form-control" style="width:70%;">
							                                                <option selected disabled>--- 선택하세요 ---</option>
							                                                <option value="0">베스트O</option>
							                                                <option value="1">베스트X</option>
							                                            </select>
																	</td>
																</tr>
																<tr>
																	<th class="text-center" style="vertical-align:middle;">이미지</th>
																	<td>
																		<input name="file" id="newfile" type="file" class="form-control-file" value="${vo.p_ofile }">
																		<small class="form-text text-muted">이미지 등록</small>
																	</td>
																</tr>
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
