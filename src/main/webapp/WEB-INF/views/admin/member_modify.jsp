<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   
<%@ include file="./commons/header.jsp" %>
<script>
//폼값 입력 여부 체크
function validateForm(form) {
	if(form.id.value==""){
		alert("아이디를 입력하세요.");
		form.id.focus();
		return false;
	}
	if(form.name.value==""){
		alert("이름을 입력하세요.");
		form.name.focus();
		return false;
	}
	if(!form.pass.value){
		alert("비밀번호를 입력하세요.");
		form.pass.focus();
		return false;
	}
	if(!form.phone.value){
		alert("핸드폰번호를 입력하세요.");
		form.phone.focus();
		return false;
	}
	if(!form.email1.value){
		alert("이메일을 입력하세요.");
		form.email1.focus();
		return false;
	}
	if(!form.grade.value){
		alert("회원 구분을 선택하세요.");
		return false;
	}
	if(!form.active.value){
		alert("계정활성화 여부을 입력하세요.");
		form.active.focus();
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
								<div>계정 정보
									<div class="page-title-subheading">계정 정보 페이지입니다.</div>
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
		                                    <div class="card-body"><h5 class="card-title">등록된 계정 정보</h5>
		                                        <form:form name="memFrm" method="post" onsubmit="return validateForm(this);" action="./memModify.do">
		                                            <div class="form-row">
		                                                <div class="col-md-6"> 
		                                                    
	                                                    	<table class="mb-0 table table-striped">
																<tr>
																	<th class="text-center" style="vertical-align:middle;">회원코드</th>
																	<td>
																		<input type="text" class="form-control" name="m_code" style="width:70%;" value="${vo.m_code }" readonly/>
																	</td>
																</tr>
																<tr>
																	<th class="text-center" style="vertical-align:middle;">아이디</th>
																	<td>
																		<input type="text" class="form-control" name="id" style="width:70%;" value="${vo.id }"/>
																	</td>
																</tr>
																<tr>
																	<th class="text-center" style="vertical-align:middle;">이름</th>
																	<td>
																		<input type="text" class="form-control" name="name" style="width:70%;" value="${vo.name }"/>
																	</td>
																</tr>
																<tr>
																	<th class="text-center" style="vertical-align:middle;">비밀번호</th>
																	<td>
																		<input type="text" class="form-control" name="pass" style="width:70%;" value="${vo.pass }"/>
																	</td>
																</tr>
																<tr>
																	<th class="text-center" style="vertical-align:middle;">핸드폰번호</th>
																	<td>
																		<input type="text" class="form-control" name="phone" style="width:70%;" value="${vo.phone }"/>
																	</td>
																</tr>
																<tr>
																	<th class="text-center" style="vertical-align:middle;">이메일</th>
																	<td>
																		<input type="email" class="form-control" name="email" style="width:70%;" value="${vo.email }"/>
																	</td>
																</tr>
																<tr>
																	<th class="text-center" style="vertical-align:middle;">우편번호</th>
																	<td>
																		<input type="text" class="form-control" name="zipcode" style="width:70%;" value="${vo.zipcode }"/>
																	</td>
																</tr>
																<tr>
																	<th class="text-center" style="vertical-align:middle;">주소</th>
																	<td>
																		<input type="text" class="form-control" name="address" style="width:70%;" value="${vo.address }"/>
																	</td>
																</tr>
																<tr>
																	<th class="text-center" style="vertical-align:middle;">회원등록일</th>
																	<td>
																		<input type="text" class="form-control" name="regidate" style="width:70%;" value="${vo.regidate }" readonly/>
																	</td>
																</tr>
																<tr>
																	<th class="text-center" style="vertical-align:middle;">회원구분</th>
																	<td>
																		<select name="grade" class="form-control" style="width:70%;">
					                                                        <option selected disabled>--- 선택하세요 ---</option>
					                                                        <option value="1">고객</option>
					                                                        <option value="2">배달원</option>
					                                                        <option value="3">총괄관리자</option>
					                                                        <option value="4">지점관리자</option>
					                                                        <option value="5">소셜가입고객</option>
					                                                    </select>
																	</td>
																</tr>
																<tr>
																	<th class="text-center" style="vertical-align:middle;">적립금</th>
																	<td>
																		<input type="text" class="form-control" name="point" style="width:70%;" value="${vo.point }"/>
																	</td>
																</tr>
																<tr>
																	<th class="text-center" style="vertical-align:middle;">계정활성화구분</th>
																	<td>
																		<select name="active" class="form-control" style="width:70%;">
					                                                        <option selected disabled>--- 선택하세요 ---</option>
					                                                        <option value="1">활성화</option>
					                                                        <option value="0">비활성화</option>
					                                                    </select>
																		<%-- <input type="text" class="form-control" name="active" style="width:70%;" value="${vo.active }"/> --%>
																	</td>
																</tr>
															</table>
														</div>
													</div>
		                                                    
		                                            <div class="row mt-3">
														<div class="col d-flex justify-content-end">
															<button type="reset" class="btn btn-dark">다시쓰기</button>
															<button type="button" class="btn btn-danger" onclick="location.href='memDelete.do?m_code=${vo.m_code }&grade=${vo.grade }';">삭제하기</button>
															<button type="button" class="btn btn-warning" onclick="location.href='member.do?grade=${vo.grade }';">목록보기</button>
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
                <p class="mb-0">선택한 공지사항 삭제하시겠습니까?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">아뇨</button>
                <button type="button" class="btn btn-primary">넴</button>
            </div>
        </div>
    </div>
</div>