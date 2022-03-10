<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="./commons/header.jsp" %>
<script>
$(function(){
	$('#deletebtn').click(function(){
		if($("input:checkbox[name=chk]:checked").length == 0){
			alert("삭제할 항목을 체크해주세요");
		}else{
			$('#menulist').attr("action","./menuDeleteChk.do").submit();			
		}
	}) 	
})
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
								<div>
									메뉴 관리
									<div class="page-title-subheading">
									상품/메뉴 관리 페이지입니다.
									</div>
								</div>
							</div>
							
						</div>
					</div>


					<div class="row">
						<div class="col-lg-12">
							<div class="main-card mb-3 card">
								<div class="card-body">
									<h5 class="card-title">
									<c:choose>
				                    	<c:when test="${g_code eq '1'}">기본피자 리스트</c:when>
				                    	<c:when test="${g_code eq '2'}">도우 리스트</c:when>
				                    	<c:when test="${g_code eq '3'}">소스 리스트</c:when>
				                    	<c:when test="${g_code eq '4'}">토핑 리스트</c:when>
				                    	<c:when test="${g_code eq '5'}">사이드 리스트</c:when>
				                    	<c:when test="${g_code eq '6'}">음료 리스트</c:when>
				                    </c:choose>
									</h5>
									<div class="row mr-3 mb-3 ml-1"  style="display: flex; justify-content: left;'">
										<form method="get">
											<div class="input-group ms-auto" style="width: 200px;">
												<select name="g_code" class="form-control">
													<option selected disabled>--상품 종류--</option>
													<option value="1">기본피자</option>
													<option value="2">도우</option>
													<option value="3">소스</option>
													<option value="4">토핑</option>
													<option value="5">사이드</option>
													<option value="6">음료</option>
												</select> 
												<button class="btn btn-primary" type="submit">
													<i class="bi-search" style="font-size: 1rem; color: white;"></i>
												</button>
											</div>
										</form>
									</div>
									<form action="" id="menulist">
									<input type="hidden" class="form-control" name="g_code" style="width: 150px;" value="${g_code }"/>
									<table class="mb-0 table table-striped">
										<thead>
											<tr>
												<th></th>
												<th>상품구분</th>
												<th>상품코드</th>
												<th>이름</th>
												<th>가격</th>
												<th>사이즈</th>
												<th>영양정보</th>
												<th>상품이미지</th>
											</tr>
										</thead>
										<tbody>
										<c:choose>
											<c:when test="${empty lists }">
					                    		<td colspan="9" align="center">등록된 상품이 없습니다.</td>
											</c:when>
											<c:otherwise> 
												<!-- 게시물이 있을때 -->
												<c:forEach items="${lists }" var="row">
													<tr>
														<th><input type="checkbox" value="${row.p_code }" name="chk"></th>
														<td>${row.g_code }</td>
														<td><a href="menuView.do?p_code=${row.p_code }">${row.p_code }</a></td>
														<td>${row.p_name }</td>
														<td>${row.p_price }</td>
														<td>${row.p_size }</td>
														<td>${row.p_info }</td>
									            		<c:choose>
									                    	<c:when test="${empty row.p_sfile}">
									                    		<td>이미지없음</td>
									                    	</c:when>
									                    	<c:otherwise>
																<td>
				                                                <img src="../uploads/${row.p_sfile}" width="100px" height="80px"/></td>
									                    	</c:otherwise>
									                    </c:choose>
													</tr>
												</c:forEach>
											</c:otherwise>
										</c:choose>
										</tbody>
									</table>
									</form>

									<!-- 페이지 번호 -->
									<div class="mt-5"
										style="display: flex; justify-content: center;">
										<ul class="pagination">
											${pagingImg }
										</ul>
									</div>


									<div class="row mr-3" style="display: flex; justify-content: right;'">
										<form method="get">
											<div class="input-group ms-auto" style="width: 350px;">
											<c:choose>
												<c:when test="${not empty g_code }">
						                    		<input type="hidden" class="form-control" name="g_code" style="width: 150px;" value="${g_code }"/>
												</c:when>
											</c:choose>
												<select name="searchField" class="form-control">
													<option value="p_code">상품코드</option>
													<option value="p_name">상품이름</option>
												</select> 
												<input type="text" class="form-control" name="searchTxt" 
													placeholder="Search" style="width: 150px;">

												<button class="btn btn-primary" type="submit">
													<i class="bi-search" style="font-size: 1rem; color: white;"></i>
												</button>
											</div>
										</form>
									</div>
									<div class="row mt-3">
										<div class="col d-flex justify-content-end">
											<button type="button" class="btn btn-primary"
												onclick="location.href='menu_regist';">상품등록</button>
											<button type="button" class="btn btn-success" data-toggle="modal" data-target="#exampleModal">
												삭제하기</button>
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
                <p class="mb-0">선택한 메뉴를 삭제하시겠습니까?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">NO</button>
                <button type="button" class="btn btn-primary" id="deletebtn">YES</button>
            </div>
        </div>
    </div>
</div>