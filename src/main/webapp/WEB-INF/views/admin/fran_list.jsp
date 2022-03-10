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
			$('#franlist').attr("action","./franDeleteChk.do").submit();			
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
									가맹 문의 관리
									<div class="page-title-subheading">
										가맹 문의 관리 페이지입니다. 
									</div>
								</div>
							</div>
							
						</div>
					</div>


					<div class="row">
						<div class="col-lg-12">
							<div class="main-card mb-3 card">
								<div class="card-body">
									<h5 class="card-title">가맹 문의</h5>
									<form action="" id="franlist">
									<%-- <input type="hidden" class="form-control" name="grade" style="width: 150px;" value="${grade }"/> --%>
									<table class="mb-0 table table-striped">
										<thead>
											<tr>
												<th></th>
												<th>번호</th>
												<th>제목</th>
												<th>작성자</th>
												<th>작성일</th>
												<th>진행상황</th>
											</tr>
										</thead>
										<tbody>
										<c:choose>
											<c:when test="${empty lists }">
					                    		<td colspan="6" align="center">등록된 문의가 없습니다.</td>
											</c:when>
											<c:otherwise> 
												<!-- 게시물이 있을때 -->
												<c:forEach items="${lists }" var="row">
													<tr>
														<th><input type="checkbox" value="${row.f_code }" name="chk"></th>
														<td><a href="franEdit.do?f_code=${row.f_code }">${row.f_code }</a></td>
														<td>가맹문의</td>
														<td>${row.f_name }</td>
														<td>${row.postdate }</td>
									                    <c:choose>
									                    	<c:when test="${row.f_state eq '1'}"><td>미처리</td></c:when>
									                    	<c:otherwise><td>답변완료</td></c:otherwise>
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
												<%-- <input type="hidden" class="form-control" name="grade" style="width: 150px;" value="${grade }"/> --%>
												<select name="searchField" class="form-control">
													<option value="f_name">작성자</option>
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
                <p class="mb-0">선택한 문의를 삭제하시겠습니까?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">NO</button>
                <button type="button" class="btn btn-primary" id="deletebtn">YES</button>
            </div>
        </div>
    </div>
</div>