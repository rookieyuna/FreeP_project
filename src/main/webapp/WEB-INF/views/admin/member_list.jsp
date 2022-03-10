<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="./commons/header.jsp" %>
<script>
/* $(function(){
	var chkObj = document.getElementsByName("rowCheck");
	var rowCnt = chkObj.length;
	
	$("input[name='allCheck']").click(function(){
		var chk_listArr = $("input[name='rowCheck']");
		for(var i=0; i<chk_listArr.length; i++){
			chk_listArr[i].checked = this.checked;
		}
	});
	$("input[name='rowCheck']").click(function(){
		if($("input[name='rowCheck']:checked").length == rowCnt){
			$("input[name='allCheck']")[0].checked= true;
		}
		else{
			$("input[name='allCheck']")[0].checked= false;
		}
	});
});
function deleteValue(){
	var checkArr = [];
	var list = $("input[name='rowCheck']");
	for(var i=0; i<list.length; i++){
		if(list[i].checked){ //선택되어있으면 배열에 값을 저장함
			checkArr.push(list[i].value);
		}
	}
	if(checkArr.length ==0){
		alert("선택항목이 없습니다.");
	}
	else{
		var chk = confirm("정말 삭제하시겠습니까?");
		$.ajax({
			url: "<c:url value='/admin/delete.do'/>",// 컨트롤러로 보내고자 하는 url 
			type: 'POST';
			data:{
				checkArr: checkArr //보내고자 하는 data 변수 설정
			},
			success: function(result){
				if(result){
					alert("삭제 성공");
					//location.replace("list") //list로 페이지 새로고침
				}
				else{
					alert("삭제 실패")
				}
			}
		});
	}
} */
$(function(){
	$('#deletebtn').click(function(){
		if($("input:checkbox[name=chk]:checked").length == 0){
			alert("삭제할 항목을 체크해주세요");
		}else{
			$('#memlist').attr("action","./memDeleteChk.do").submit();			
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
									계정 관리
									<div class="page-title-subheading">
									<c:choose>
				                    	<c:when test="${grade eq '1'}">고객 계정 관리 페이지입니다.</c:when>
				                    	<c:when test="${grade eq '2'}">배달원 계정 관리 페이지입니다.</c:when>
				                    	<c:otherwise>관리자 계정 관리 페이지입니다.</c:otherwise>
				                    </c:choose>
									</div>
								</div>
							</div>
							
						</div>
					</div>


					<div class="row">
						<div class="col-lg-12">
							<div class="main-card mb-3 card">
								<div class="card-body">
									<h5 class="card-title">회원리스트</h5>
									<form action="" id="memlist">
									<input type="hidden" class="form-control" name="grade" style="width: 150px;" value="${grade }"/>
									<table class="mb-0 table table-striped">
										<thead>
											<tr>
												<th></th>
												<th>회원코드</th>
												<th>아이디</th>
												<th>이름</th>
												<th>전화번호</th>
												<th>이메일</th>
												<th>회원등록일</th>
												<c:choose>
							                    	<c:when test="${grade eq '1'}">
							                    		<th>적립금</th>
							                    	</c:when>
							                    </c:choose>
												<th>회원등급</th>
												<th>활성화</th>
											</tr>
										</thead>
										<tbody>
										<c:choose>
											<c:when test="${empty lists }">
												<c:choose>
							                    	<c:when test="${grade eq '1'}">
							                    		<td colspan="10" align="center">등록된 계정이 없습니다.</td>
							                    	</c:when>
							                    	<c:otherwise>
							                    		<td colspan="9" align="center">등록된 계정이 없습니다.</td>
							                    	</c:otherwise>
							                    </c:choose>
											</c:when>
											<c:otherwise> 
												<!-- 게시물이 있을때 -->
												<c:forEach items="${lists }" var="row">
													<tr>
														<th><input type="checkbox" value="${row.m_code }" name="chk"></th>
														<td >${row.m_code }</td>
														<td><a href="memView.do?m_code=${row.m_code }">${row.id }</a></td>
														<td>${row.name }</td>
														<td>${row.phone }</td>
														<td>${row.email }</td>
														<td>${row.regidate }</td>
														<c:choose>
									                    	<c:when test="${grade eq '1'}">
									                    		<td>${row.point }</td>
									                    	</c:when>
									                    </c:choose>
									                    <c:choose>
									                    	<c:when test="${row.grade eq '1'}"><td>고객</td></c:when>
									                    	<c:when test="${row.grade eq '2'}"><td>배달원</td></c:when>
									                    	<c:when test="${row.grade eq '3'}"><td>총괄관리자</td></c:when>
									                    	<c:when test="${row.grade eq '4'}"><td>지점관리자</td></c:when>
									                    	<c:when test="${row.grade eq '5'}"><td>소셜가입고객</td></c:when>
									                    </c:choose>
									                    <c:choose>
									                    	<c:when test="${row.active eq '0'}"><td>비활성화</td></c:when>
									                    	<c:otherwise><td>활성화</td></c:otherwise>
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
												<input type="hidden" class="form-control" name="grade" style="width: 150px;" value="${grade }"/>
												<select name="searchField" class="form-control">
													<option value="m_code">회원코드</option>
													<option value="id">아이디</option>
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
												onclick="location.href='member_regist';">계정등록</button>
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
                <p class="mb-0">선택한 회원을 삭제하시겠습니까?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">NO</button>
                <button type="button" class="btn btn-primary" id="deletebtn">YES</button>
            </div>
        </div>
    </div>
</div>