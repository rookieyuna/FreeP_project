<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="./commons/header.jsp" %>
<script>
//폼값 입력 여부 체크
function validateForm(form) {
	if(form.g_code.value==""){
		alert("상품구분을 입력하세요.");
		form.g_code.focus();
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
	if(form.p_size.value==""){
		alert("사이즈를 선택하세요.");
		return false;
	}
	if(!form.p_info.value){
		alert("영양정보를 입력하세요.");
		form.p_info.focus();
		return false;
	}
}
</script>
<body>
<div class="app-container app-theme-white body-tabs-shadow fixed-sidebar fixed-header">
        <%@ include file="./commons/top.jsp" %>        
        
        <%@ include file="./commons/themeTool.jsp" %>
         <div class="app-main">
         
          <%@ include file="./commons/left.jsp" %>  
                 <div class="app-main__outer">
				<div class="app-main__inner">
					<div class="app-page-title">
						<div class="page-title-wrapper">
							<div class="page-title-heading">
								<div class="page-title-icon">
									<i class="pe-7s-drawer icon-gradient bg-happy-itmeo"> </i>
								</div>
								<div>상품/메뉴 등록
									<div class="page-title-subheading">상품/메뉴 등록 페이지입니다.</div>
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
		                                    <div class="card-body"><h5 class="card-title">등록할 상품/메뉴 정보</h5>
		                                        <form:form name="memFrm" method="post" onsubmit="return validateForm(this);" action="./menuRegist.do" enctype="multipart/form-data">
		                                            <div class="form-row">
		                                                <div class="col-md-6">
	                                                    	<table class="mb-0 table table-striped">
																<tr>
																	<th class="text-center" style="vertical-align:middle;">상품구분</th>
																	<td>
																		<select name="g_code" class="form-control" style="width:70%;">
					                                                        <option selected disabled>--- 선택하세요 ---</option>
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
																	<th class="text-center" style="vertical-align:middle;">이름</th>
																	<td>
																		<input type="text" class="form-control" name="p_name" style="width:70%;"/>
																	</td>
																</tr>
																<tr>
																	<th class="text-center" style="vertical-align:middle;">가격</th>
																	<td>
																		<input type="text" class="form-control" name="p_price" style="width:70%;"/>
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
																		<input type="text" class="form-control" name="p_info" style="width:70%;"/>
																	</td>
																</tr>
																<tr>
																	<th class="text-center" style="vertical-align:middle;">이미지</th>
																	<td>
																		<input name="file" type="file" class="form-control-file"> 
																		<small class="form-text text-muted">이미지 등록</small>
																	</td>
																</tr>
															</table>
														</div>
													</div>
		                                                    
		                                            <div class="row mt-3">
														<div class="col d-flex justify-content-end">
															<button type="reset" class="btn btn-dark">다시쓰기</button>
															<button type="button" class="btn btn-warning" onclick="location.href='menu.do?g_code=1';">목록보기</button>
															<button type="submit" class="btn btn-primary">등록하기</button>
														</div>
													</div>
		                                        </form:form>
		                                    </div>
		                                </div>
		                            </div>

									<!-- 페이지 번호 -->
									<div class="mt-5"
										style="display: flex; justify-content: center;">
										<ul class="pagination">
											${pagingImg }
										</ul>
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

<%@ include file="./commons/bottom.jsp" %>

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">삭제</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p class="mb-0">선택한 메뉴/상품을 삭제하시겠습니까?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                <button type="button" class="btn btn-primary">Yes</button>
            </div>
        </div>
    </div>
</div>