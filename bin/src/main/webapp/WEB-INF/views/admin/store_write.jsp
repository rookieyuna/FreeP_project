<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ include file="./commons/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
//폼값 입력 여부 체크
function validateForm(form) {
	if(form.b_name.value==""){
		alert("지점명을 입력하세요.");
		form.b_name.focus();
		return false;
	}
	if(form.address.value==""){
		alert("주소를 입력하세요.");
		form.address.focus();
		return false;
	}
	if(!form.latitude.value){
		alert("경도를 입력하세요.");
		form.latitude.focus();
		return false;
	}
	if(form.longitude.value==""){
		alert("위도를 입력하세요.");
		form.longitude.focus();
		return false;
	}
	if(!form.phone.value){
		alert("매장번호를 입력하세요.");
		form.phone.focus();
		return false;
	}
}
</script>
</head>
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
								<div>지점 관리
									<div class="page-title-subheading">지점 관리 페이지입니다.</div>
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
		                                    <div class="card-body"><h5 class="card-title">지점 정보</h5>
		                                        <form:form name="storeFrm" method="post" onsubmit="return validateForm(this);" action="./storeWrite.do">
		                                            <div class="form-row">
		                                                <div class="col-md-6"> 
		                                                    
	                                                    	<table class="mb-0 table table-striped">
																
																<tr>
																	<th class="text-center" style="vertical-align:middle;">지점명</th>
																	<td>
																		<input type="text" class="form-control" name="b_name" style="width:70%;" />
																	</td>
																</tr>
																<tr>
																	<th class="text-center" style="vertical-align:middle;">지점주소</th>
																	<td>
																		<input type="text" class="form-control" name="address" style="width:70%;"/>
																	</td>
																</tr>
																<tr>
																	<th class="text-center" style="vertical-align:middle;">경도</th>
																	<td>
																		<input type="text" class="form-control" name="latitude" style="width:70%;" />
																	</td>
																</tr>
																<tr>
																	<th class="text-center" style="vertical-align:middle;">위도</th>
																	<td>
																		<input type="text" class="form-control" name="longitude" style="width:70%;"/>
																	</td>
																</tr>
																<tr>
																	<th class="text-center" style="vertical-align:middle;">매장번호</th>
																	<td>
																		<input type="text" class="form-control" name="phone" style="width:70%;"/>
																	</td>
																</tr>
															</table>
														</div>
													</div>
		                                                    
		                                            <div class="row mt-3">
														<div class="col d-flex justify-content-end">
															<button type="reset" class="btn btn-dark">다시쓰기</button>
															<button type="button" class="btn btn-danger" onclick="location.href='storeDelete.do?b_code=${vo.b_code }';">삭제하기</button>
															<button type="button" class="btn btn-warning" onclick="location.href='storelist.do?';">목록보기</button>
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




				<div class="app-wrapper-footer">
					<div class="app-footer">
						<div class="app-footer__inner">
							<div class="app-footer-left">
								<ul class="nav">
									<li class="nav-item"><a href="javascript:void(0);"
										class="nav-link"> Footer Link 1 </a></li>
									<li class="nav-item"><a href="javascript:void(0);"
										class="nav-link"> Footer Link 2 </a></li>
								</ul>
							</div>
							<div class="app-footer-right">
								<ul class="nav">
									<li class="nav-item"><a href="javascript:void(0);"
										class="nav-link"> Footer Link 3 </a></li>
									<li class="nav-item"><a href="javascript:void(0);"
										class="nav-link">
											<div class="badge badge-success mr-1 ml-0">
												<small>NEW</small>
											</div> Footer Link 4
									</a></li>
								</ul>
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
                <p class="mb-0">선택한 매장목록을 삭제하시겠습니까?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                <button type="button" class="btn btn-primary">Yes</button>
            </div>
        </div>
    </div>
</div>