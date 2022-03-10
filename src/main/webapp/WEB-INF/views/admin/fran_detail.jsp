<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   
<%@ include file="./commons/header.jsp" %>
<body>
<script>
function deleteRow(f_code) {
	if(confirm("정말로 삭제하시겠습니까?")){
		location.href="franDelete.do?f_code="+ f_code;
	}
}
</script>
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
								<div>가맹 문의 관리
									<div class="page-title-subheading">가맹 문의 관리 페이지입니다.</div>
								</div>
							</div>						
						</div>
					</div>



					<div class="main-card mb-3 card">
						<div class="card-body"> 
							<h5 class="card-title">매장정보</h5>
							<form:form id="" action="./franEditAction.do" name="franFrm" method="post" >
								<table class="mb-0 table table-striped">
									<tr>
										<th class="text-center" style="vertical-align:middle;">번호</th>
										<td>
											<input type="text" class="form-control" name="f_code" style="width:70%;" value="${vo.f_code }" readonly/>
										</td>
									</tr>
									<tr>
										<th class="text-center" style="vertical-align:middle;">작성자</th>
										<td>
											<input type="text" class="form-control" name="f_name" style="width:70%;" value="${vo.f_name }" readonly/>
										</td>
									</tr>
									<tr>
										<th class="text-center" style="vertical-align:middle;">창업희망 지역</th>
										<td>
											<input type="text" class="form-control" name="f_address" style="width:70%;" value="${vo.f_address }" readonly/>
										</td>
									</tr>
									<tr>
										<th class="text-center" style="vertical-align:middle;">휴대전화</th>
										<td>
											<input type="text" class="form-control" name="f_phone" style="width:70%;" value="${vo.f_phone }" readonly/>
										</td>
									</tr>
									<tr>
										<th class="text-center" style="vertical-align:middle;">이메일</th>
										<td>
											<input type="text" class="form-control" name="f_email" style="width:70%;" value="${vo.f_email }" readonly/>
										</td>
									</tr>
									<tr>
										<th class="text-center" style="vertical-align:middle;">문의내용</th>
										<td>
											<textarea  class="form-control" name="f_content" style="width:70%;" readonly>${vo.f_content }</textarea>
											<%-- <input type="text" class="form-control" name="f_content" style="width:70%;" value="${vo.f_content }" readonly/> --%>
										</td>
									</tr>
									<tr>
										<th class="text-center" style="vertical-align:middle;">진행상황</th>
										<td>
											<select name="f_state" class="form-control" style="width:70%;">
                                                <option value="" selected disabled>--- 선택하세요 ---</option>
                                                <option value="1">미처리</option>
                                                <option value="2">답변완료</option>
                                            </select>
										</td>
									</tr>
								</table>
								</div>

								<div class="row mt-3 mb-3">
									<div class="col d-flex justify-content-end">
										<button type="submit" class="btn btn-primary">수정하기</button>
										<button type="button" class="btn btn-warning" onclick="location.href='franlist.do';">목록보기</button>
										<button type="button" class="btn btn-danger" onclick="javascript:deleteRow(${vo.f_code});">삭제하기</button>
									</div>
								</div>
							</form:form>
							
						</div>
					</div>
				</div>

			</div>
        </div>
    </div>
<script type="text/javascript" src="../assets/scripts/main.js"></script>
</body>
</html>