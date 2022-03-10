<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   
<%@ include file="./commons/header.jsp" %>
<body>
<script>
function deleteRow(b_code) {
	if(confirm("정말로 삭제하시겠습니까?")){
		location.href="storeDelete.do?b_code="+ b_code;
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
								<div>지점 관리
									<div class="page-title-subheading">지점 관리 페이지입니다.</div>
								</div>
							</div>						
						</div>
					</div>



					<div class="main-card mb-3 card">
						<div class="card-body"> 
							<h5 class="card-title">매장정보</h5>
							<form:form id="" action=" " name="menuFrm" method="post" enctype="multipart/form-data">
								<table class="mb-0 table table-striped">
									<tr>
										<th class="text-center" style="vertical-align:middle;">지점코드</th>
										<td>
											<input type="text" class="form-control" name="b_code" style="width:70%;" value="${vo.b_code }" readonly/>
										</td>
									</tr>
									<tr>
										<th class="text-center" style="vertical-align:middle;">지점명</th>
										<td>
											<input type="text" class="form-control" name="b_name" style="width:70%;" value="${vo.b_name }" readonly/>
										</td>
									</tr>
									<tr>
										<th class="text-center" style="vertical-align:middle;">지점주소</th>
										<td>
											<input type="text" class="form-control" name="address" style="width:70%;" value="${vo.address }" readonly/>
										</td>
									</tr>
									<tr>
										<th class="text-center" style="vertical-align:middle;">경도</th>
										<td>
											<input type="text" class="form-control" name="latitude" style="width:70%;" value="${vo.latitude }" readonly/>
										</td>
									</tr>
									<tr>
										<th class="text-center" style="vertical-align:middle;">위도</th>
										<td>
											<input type="text" class="form-control" name="longitude" style="width:70%;" value="${vo.longitude }" readonly/>
										</td>
									</tr>
									<tr>
										<th class="text-center" style="vertical-align:middle;">매장번호</th>
										<td>
											<input type="text" class="form-control" name="phone" style="width:70%;" value="${vo.phone }" readonly/>
										</td>
									</tr>
								</table>
								</div>

								<div class="row mt-3 mb-3">
									<div class="col d-flex justify-content-end">
										<button type="button" class="btn btn-primary" onclick="location.href='storeEdit.do?b_code=${vo.b_code}';">수정하기</button>
										<button type="button" class="btn btn-warning" onclick="location.href='storelist.do';">목록보기</button>
										<%-- <button type="button" class="btn btn-danger" onclick="location.href='storeDelete.do?b_code=${vo.b_code}';">삭제하기</button> --%>
										<button type="button" class="btn btn-danger" onclick="javascript:deleteRow(${vo.b_code});">삭제하기</button>
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