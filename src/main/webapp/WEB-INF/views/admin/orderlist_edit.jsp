<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="./commons/header.jsp" %>
<script>
//폼값 입력 여부 체크
function validateForm(form) {
	if(form.m_code.value==""){
		alert("회원 코드를 입력하세요.");
		form.m_code.focus();
		return false;
	}
	if(form.b_code.value==""){
		alert("지점 코드를 입력하세요.");
		form.b_code.focus();
		return false;
	}
	if(!form.or_date.value){
		alert("주문 일자를 입력하세요.");
		form.or_date.focus();
		return false;
	}
	if(!form.origin_price.value){
		alert("할인 전 금액을 입력하세요.");
		form.origin_price.focus();
		return false;
	}
	if(!form.cp_price.value){
		alert("쿠폰 사용 금액을 0원 이상 입력하세요.");
		form.cp_price.focus();
		return false;
	}
	if(!form.po_price.value){
		alert("적립금 사용 금액을 0원 이상 입력하세요.");
		form.po_price.focus();
		return false;
	}
	if(!form.total_price.value){
		alert("최종 결제 금액을 입력하세요.");
		form.total_price.focus();
		return false;
	}
	if(form.credit.value==""){
		alert("결제수단을 선택하세요.");
		return false;
	}
	if(form.state.value==""){
		alert("주문상태를 선택하세요.");
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
								<div>주문 정보
									<div class="page-title-subheading">주문 정보 페이지입니다.</div>
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
		                                    <div class="card-body"><h5 class="card-title">주문 완료 정보</h5>
		                                        <form:form name="memFrm" method="post" onsubmit="return validateForm(this);" action="./orderlistEdit.do">
		                                            <div class="form-row">
		                                                <div class="col-md-6"> 
		                                                    
	                                                    	<table class="mb-0 table table-striped">
																<tr>
																	<th class="text-center" style="vertical-align:middle;">주문번호</th>
																	<td>
																		<input type="text" class="form-control" name="or_idx" style="width:70%;" value="${vo.or_idx }" readonly/>
																	</td>
																</tr>
																<tr>
																	<th class="text-center" style="vertical-align:middle;">회원코드</th>
																	<td>
																		<input type="text" class="form-control" name="m_code" style="width:70%;" value="${vo.m_code }"/>
																	</td>
																</tr>
																<tr>
																	<th class="text-center" style="vertical-align:middle;">지점코드</th>
																	<td>
																		<input type="text" class="form-control" name="b_code" style="width:70%;" value="${vo.b_code }"/>
																	</td>
																</tr>
																<tr>
																	<th class="text-center" style="vertical-align:middle;">주문일자</th>
																	<td>
																	<c:set var="date" value="${vo.or_date }" />
																		<input type="text" class="form-control" name="or_date" style="width:70%;" value="${fn:split(date, ' ')[0] }"/>
																	</td>
																</tr>
																<tr>
																	<th class="text-center" style="vertical-align:middle;">할인 전 금액</th>
																	<td>
																		<input type="text" class="form-control" name="origin_price" style="width:70%;" value="${vo.origin_price }"/>
																	</td>
																</tr>
																<tr>
																	<th class="text-center" style="vertical-align:middle;">쿠폰 사용액</th>
																	<td>
																		<input type="text" class="form-control" name="cp_price" style="width:70%;" value="${vo.cp_price }"/>
																	</td>
																</tr>
																<tr>
																	<th class="text-center" style="vertical-align:middle;">적립금 사용액</th>
																	<td>
																		<input type="text" class="form-control" name="po_price" style="width:70%;" value="${vo.po_price }"/>
																	</td>
																</tr>
																<tr>
																	<th class="text-center" style="vertical-align:middle;">총 결제금액</th>
																	<td>
																		<input type="text" class="form-control" name="total_price" style="width:70%;" value="${vo.total_price }"/>
																	</td>
																</tr>
																<tr>
																	<th class="text-center" style="vertical-align:middle;">결제수단</th>
																	<td>
											                    		<input type="hidden" class="form-control" name="credit" style="width:70%;" value="${vo.credit }"/>
																	<c:choose>
												                    	<c:when test="${vo.credit eq '1'}">
												                    		<input type="text" class="form-control" name="credit2" style="width:70%;" value="카드" readonly/>
												                    	</c:when>
												                    	<c:when test="${vo.credit eq '21'}">
												                    		<input type="text" class="form-control" name="credit2" style="width:70%;" value="만나서 카드" readonly/>
												                    	</c:when>
												                    	<c:when test="${vo.credit eq '22'}">
												                    		<input type="text" class="form-control" name="credit2" style="width:70%;" value="현금" readonly/>
												                    	</c:when>
												                    </c:choose>
																	</td>
																</tr>
																<tr>
																	<th class="text-center" style="vertical-align:middle;">주문상태</th>
																	<td>
																		<select name="state" class="form-control" style="width:70%;">
					                                                        <option value="" selected disabled>--- 선택하세요 ---</option>
					                                                        <option value="1">주문완료</option>
					                                                        <option value="2">주문접수</option>
					                                                        <option value="3">조리중</option>
					                                                        <option value="4">배달시작</option>
					                                                        <option value="5">배달완료</option>
					                                                    </select>
																	</td>
																</tr>
															</table>
														</div>
													</div>
		                                                    
		                                            <div class="row mt-3">
														<div class="col d-flex justify-content-end">
															<button type="reset" class="btn btn-dark">다시쓰기</button>
															<button type="button" class="btn btn-danger" onclick="location.href='orderlistDelete.do?or_idx=${vo.or_idx }';">삭제하기</button>
															<button type="button" class="btn btn-warning" onclick="location.href='orderlist.do?';">목록보기</button>
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
                <p class="mb-0">선택한 주문내역을 삭제하시겠습니까?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                <button type="button" class="btn btn-primary">Yes</button>
            </div>
        </div>
    </div>
</div>