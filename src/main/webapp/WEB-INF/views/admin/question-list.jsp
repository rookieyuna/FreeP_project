<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="./commons/header.jsp" %>
<script>

$(function(){
	$('#deletebtn').click(function(){
		if($("input:checkbox[name=chk]:checked").length == 0){
			alert("삭제할 항목을 체크해주세요.");
		}else{
			$('#boardlist').attr("action","./removechk.do").submit();			
		}
	}) 	
})


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
									<i class="pe-7s-drawer icon-gradient bg-happy-itmeo"> </i>
								</div>
								<div>
									1:1문의
									<div class="page-title-subheading">1:1 문의 목록</div>
								</div>
							</div>
							
						</div>
					</div>



					<div class="row">

						<div class="col-lg-12">
							<div class="main-card mb-3 card">
								<div class="card-body">
									<h5 class="card-title">1:1문의 목록</h5>
									<form:form action="" id="boardlist">
									<table class="mb-0 table table-striped" style="table-layout: fixed">
										<colgroup>
											<col width="10%"/>
											<col width="10%"/>
											<col width="10%"/>
											<col width="15%"/>
											<col width="45%"/>
											<col width="10%"/>
											<col width="10%"/>
										</colgroup>
										<thead>
											<tr>
												<th>#</th>
												<th>문의유형</th>
												<th>작성자</th>
												<th>제목</th>
												<th>내용</th>
												<th>작성일</th>
												<th>첨부파일</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${lists }" var="row">   
											
											
											<tr>
												<th><input type="checkbox" name="chk" value="${row.b_idx }"></th>
												
												<c:if test="${row.q_category  eq '1'}">
													<td>제품관련</td>
												</c:if>
												
												<c:if test="${row.q_category  eq '2'}">
													<td>배달 서비스 관련</td>
												</c:if>
												
												<c:if test="${row.q_category  eq '3'}">
													<td>직원 서비스 관련</td>
												</c:if>
												
												<c:if test="${row.q_category  eq '4'}">
													<td>칭찬</td>
												</c:if>
												
												<c:if test="${row.q_category  eq '5'}">
													<td>제안</td>
												</c:if>
												
												<c:if test="${row.q_category  eq '6'}">
													<td>기타</td>
												</c:if>
												
												<td>${row.writer }</td>
												<td><a href="./question-detail.do?idx=${row.b_idx}">${row.title }</a></td>
												<td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;" ><nobr>${row.contents}</nobr></td>
												<td>${row.postdate }</td>
												<td>
												<c:set var="file" value="${row.sfile }" />
												<c:if test="${file != null }">
													<i class="bi-pin-angle-fill" style="font-size: 1rem;"></i>
												</c:if>
												</td>
											</tr>
											
											</c:forEach>
										</tbody>
									</table>
									</form:form>

									<div class="mt-5"
										style="display: flex; justify-content: center;">
										<ul class="pagination">
											${pagingImg }
										</ul>
									</div>



									<div class="row mr-3"
										style="display: flex; justify-content: right;'">
										<form:form action="./noticeSearch.do" method="get">										
											<div class="input-group ms-auto" style="width: 350px;">
												<select name="searchField" class="form-control">
													<option value="title">제목</option>
													<option value="contents">내용</option>
													<option value="writer">작성자</option>
												</select> <input type="text" class="form-control" name="searchtxt"
													placeholder="Search" style="width: 150px;">

												<button class="btn btn-primary" type="submit">
													<i class="bi-search" style="font-size: 1rem; color: white;"></i>
												</button>
											</div>
										</form:form>
									</div>
									<div class="row mt-3">
										<div class="col d-flex justify-content-end">
											
											<button type="button" class="btn btn-success" data-toggle="modal" data-target="#exampleModal">
												삭제하기
                                        	</button>

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
                <p class="mb-0">선택한 공지사항 삭제하시겠습니까?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">아뇨</button>
                <button type="button" class="btn btn-primary" id="deletebtn">넴</button>
            </div>
        </div>
    </div>
</div>