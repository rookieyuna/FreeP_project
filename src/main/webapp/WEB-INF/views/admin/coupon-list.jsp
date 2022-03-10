<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   
<%@ include file="./commons/header.jsp" %>
<script>

$(function(){
	$('#deletebtn').click(function(){
		if($("input:checkbox[name=chk]:checked").length == 0){
			alert("삭제할 항목을 체크해주세요");
		}else{
			$('#boardlist').attr("action","./couponremovechk.do").submit();			
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
									쿠폰 등록
									<div class="page-title-subheading">FreeP 온라인 쿠폰 등록</div>
								</div>
							</div>
							
						</div>
					</div>



					<div class="row">

						<div class="col-lg-12">
							<div class="main-card mb-3 card">
								<div class="card-body">
									<h5 class="card-title">쿠폰</h5>
									<form:form action="" id="boardlist">
									<table class="mb-0 table table-striped" style="table-layout: fixed">
										<colgroup>
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
												<th>쿠폰번호</th>
												<th>쿠폰이름</th>
												<th>쿠폰내용</th>
												<th>유효기간(시작)</th>
												<th>유효기간(만료)</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${lists }" var="row">   
											 
											<tr>
												<th><input type="checkbox" name="chk" value="${row.cp_idx }"></th>
												<td >${row.cp_idx }</td>
												<td>${row.cp_name }</td>
												<td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;" ><nobr>${row.cp_cate}</nobr></td>
												<td>${row.issue_date }</td>
												<td>${row.expire_date }</td>
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

									<div class="row mt-3">
										<div class="col d-flex justify-content-end">
											<button type="button" class="btn btn-primary"
												onclick="location.href='coupon-write';">추가하기</button>
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
                <p class="mb-0">선택한 쿠폰 삭제하시겠습니까?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">아뇨</button>
                <button type="button" class="btn btn-primary" id="deletebtn">넴</button>
            </div>
        </div>
    </div>
</div>