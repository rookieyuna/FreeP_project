<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>     
<%@ include file="./commons/header.jsp" %>
<body>
<script>
//폼값 입력 여부 체크
function validateForm(form) {
	
	if(form.order.value==""){
		alert("주문번호를 입력하세요.");
		form.order.focus();
		return false;
	}
	if(form.title.value==""){
		alert("제목을 입력하세요.");
		form.title.focus();
		return false;
	}
	if(form.writer.value==""){
		alert("작성자를 입력하세요.");
		form.writer.focus();
		return false;
	}
	if(!form.text.value){
		alert("내용 입력하세요.");
		form.text.focus();
		return false;
	}
	
}
</script>
<script>

$(function(){
	$('#deletefile1').click(function(){
		
		var value1= document.getElementById('deleteofile1');
		value1.value = "1";  /* 삭제 버튼이 눌렸으므로 flag 1로 바꿈 */
		const element1 = document.getElementById('element1');
		element1.innerHTML =
			'<label for="exampleFile" class="col-sm-2 col-form-label">이미지</label><div class="col-sm-10"><input name="file1" id="exampleFile" type="file" class="form-control-file" value="${dto.rv_ofile1 }"> <small class="form-text text-muted">포스터나, 이미지 등록</small></div>';
	}) 	
	$('#deletefile2').click(function(){
		
		var value1= document.getElementById('deleteofile2');
		value1.value = "1";
		const element1 = document.getElementById('element2');
		element1.innerHTML =
			'<label for="exampleFile" class="col-sm-2 col-form-label">이미지</label><div class="col-sm-10"><input name="file2" id="exampleFile" type="file" class="form-control-file" value="${dto.rv_ofile1 }"> <small class="form-text text-muted">포스터나, 이미지 등록</small></div>';
	}) 	
	$('#deletefile3').click(function(){
		
		var value1= document.getElementById('deleteofile3');
		value1.value = "1";
		const element1 = document.getElementById('element3');
		element1.innerHTML =
			'<label for="exampleFile" class="col-sm-2 col-form-label">이미지</label><div class="col-sm-10"><input name="file3" id="exampleFile" type="file" class="form-control-file" value="${dto.rv_ofile1 }"> <small class="form-text text-muted">포스터나, 이미지 등록</small></div>';
	}) 	
})

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
								<div>
									후기
									<div class="page-title-subheading">후기 항목 관리</div>
								</div>
							</div>						
						</div>
					</div>



					<div class="main-card mb-3 card">
						<div class="card-body">

							<h5 class="card-title">후기 수정</h5>
							<form:form name="writeFrm" method="post"
								action="./revieweditAction.do" 
								enctype="multipart/form-data" onsubmit="return validateForm(this);">
							<input type="hidden" name="pre_idx" value="${dto.rv_idx }" />
							<input type="hidden" name="pre_sfile1" value="${dto.rv_sfile1 }" />
							<input type="hidden" name="pre_sfile2" value="${dto.rv_sfile2 }" />
							<input type="hidden" name="pre_sfile3" value="${dto.rv_sfile3 }" />


								<div class="position-relative row form-group">
									<label for="exampleWriter" class="col-sm-2 col-form-label">주문번호</label>
									<div class="col-sm-10">
										<input name="order" id="exampleWriter" placeholder="주문 번호"
											class="form-control" value="${dto.or_idx }">
									</div>
								</div>
							
								<div class="position-relative row form-group">
									<label for="exampleTitle" class="col-sm-2 col-form-label">제목</label>
									<div class="col-sm-10">
										<input name="title" id="exampleTitle" placeholder="제목입력"
											class="form-control" value="${dto.title }">
									</div>
								</div>
								<div class="position-relative row form-group">
									<label for="exampleWriter" class="col-sm-2 col-form-label">작성자</label>
									<div class="col-sm-10">
										<input name="writer" id="exampleWriter" placeholder="작성자 이름"
											class="form-control" value="${dto.writer }">
									</div>
								</div>


								<div class="position-relative row form-group">
									<label for="exampleText" class="col-sm-2 col-form-label">내용</label>
									<div class="col-sm-10">
										<textarea rows="7" name="text" id="exampleText"
											class="form-control">${dto.contents }</textarea>
									</div>
								</div>
								<!-- 파일1번 -->
								<input type="hidden" name="pre_sfile1" value="${dto.rv_sfile1}"/>
									<c:set var="file1" value="${dto.rv_sfile1 }"/>	
									<!-- 첨부파일이 있는 리뷰를 수정할때, 첨부파일 삭제 버튼을 눌렀는지 안눌렀는지 알수있게 -->
									<input type="hidden" id="deleteofile1" name="deleteofile1" />	
														
									<c:if test="${not empty file1}"> <!-- 첨부파일이 존재할경우 -->
										<div class="position-relative row form-group" id="element1">
											<label for="exampleText" class="col-sm-2 col-form-label"></label>
											<div class="col-sm-10">												
												<input name="pre_file1" id="pre_file1" class="form-control"
													style="width:200px;float:left;" value="${dto.rv_ofile1 }">					
												<button type="button" class="btn btn-secondary" id="deletefile1">파일 삭제
												</button> <!-- 버튼이 눌리면 onclick이벤트 -->
											</div>
										</div>
									</c:if>
									<c:if test="${empty file1}">									
										<div class="position-relative row form-group">
											<label for="exampleFile" class="col-sm-2 col-form-label">이미지</label>
											<div class="col-sm-10">
												<input name="file1" id="exampleFile" type="file"
													class="form-control-file" value="${dto.rv_ofile1 }"> <small
													class="form-text text-muted">포스터나, 이미지 등록</small>
											</div>
										</div>
									</c:if>
								<!-- 파일2번 -->
										<%-- <input type="hidden" name="pre_file2" value="${dto.rv_ofile2 }"> --%>
										<input type="hidden" name="pre_sfile2" value="${dto.rv_sfile2}"/>
									<c:set var="file2" value="${dto.rv_sfile2 }"/>		
									<input type="hidden" id="deleteofile2" name="deleteofile2" />						
									<c:if test="${not empty file2}">
										<div class="position-relative row form-group" id="element2">
											<label for="exampleText" class="col-sm-2 col-form-label"></label>
											<div class="col-sm-10">
												
												<input name="pre_file2" id="pre_file2" class="form-control"
													style="width:200px;float:left;" value="${dto.rv_ofile2 }">	
													<%-- <input type="hidden" name="pre_sfile2" value="${dto.rv_sfile2}"/>	 --%>					
												<button type="button" class="btn btn-secondary" id="deletefile2">파일 삭제
												</button>
											</div>
										</div>
									</c:if>
									<c:if test="${empty file2}">
									
										<div class="position-relative row form-group">
											<label for="exampleFile" class="col-sm-2 col-form-label">이미지</label>
											<div class="col-sm-10">
												<input name="file2" id="exampleFile" type="file"
													class="form-control-file" value="${dto.rv_ofile1 }"> <small
													class="form-text text-muted">포스터나, 이미지 등록</small>
											</div>
										</div>
									</c:if>
								<!-- 파일3번 -->
								<%-- <input type="hidden" name="pre_file3" value="${dto.rv_ofile3 }"> --%>
								<input type="hidden" name="pre_sfile3" value="${dto.rv_sfile3}"/>
									<c:set var="file3" value="${dto.rv_sfile3 }"/>	
									<input type="hidden" id="deleteofile3" name="deleteofile3" />							
									<c:if test="${not empty file3}">
										<div class="position-relative row form-group" id="element3">
											<label for="exampleText" class="col-sm-2 col-form-label"></label>
											<div class="col-sm-10">												
												<input name="pre_file3" id="pre_file3" class="form-control"
													style="width:200px;float:left;" value="${dto.rv_ofile3 }">
												<%-- <input type="hidden" name="pre_sfile3" value="${dto.rv_sfile3}"/>	 --%>						
												<button type="button" class="btn btn-secondary" id="deletefile3">파일 삭제
												</button>
											</div>
										</div>
									</c:if>
									<c:if test="${empty file3}">
										
										<div class="position-relative row form-group">
											<label for="exampleFile" class="col-sm-2 col-form-label">이미지</label>
											<div class="col-sm-10">
												<input name="file3" id="exampleFile" type="file"
													class="form-control-file" value="${dto.rv_ofile1 }"> <small
													class="form-text text-muted">포스터나, 이미지 등록</small>
											</div>
										</div>
									</c:if>
							
								
								<div class="position-relative row form-check">
									<div class="col-sm-10 offset-sm-2">
										<button class="btn btn-primary" >수정하기</button>
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