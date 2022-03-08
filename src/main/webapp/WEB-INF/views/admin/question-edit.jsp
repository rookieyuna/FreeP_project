<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>      
<%@ include file="./commons/header.jsp" %>
<body>
<script>

$(function(){
	$('#deletefile').click(function(){
		
		var value1= document.getElementById('deleteofile');
		value1.value = "1";
		const element1 = document.getElementById('element');
		element1.innerHTML =
			'<label for="exampleFile" class="col-sm-2 col-form-label">이미지</label><div class="col-sm-10"><input name="file" id="exampleFile" type="file" class="form-control-file" value="${dto.ofile }"> <small class="form-text text-muted">포스터나, 이미지 등록</small></div>';
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
									1:1문의
									<div class="page-title-subheading">1:1 문의 답변</div>
								</div>
							</div>						
						</div>
					</div>



					<div class="main-card mb-3 card">
						<div class="card-body">

							<h5 class="card-title">1:1 문의 답변</h5>
							<form:form name="writeFrm" method="post"
								action="./questioneditAction.do" 
								enctype="multipart/form-data">
							<input type="hidden" name="pre_idx" value="${dto.b_idx }" />
							<input type="hidden" name="pre_sfile" value="${dto.sfile }" />

								<!-- validate 하는거 type넣는거 찾아본담에 넣어야될거같아여어 -->
								<div class="position-relative row form-group">
									<label for="exampleWriter" class="col-sm-2 col-form-label">문의유형</label>
									<div class="col-sm-10">
										<c:if test="${dto.q_category  eq '1'}">
													<c:set var="qcateString" value="제품관련"/>
												</c:if>
												
												<c:if test="${dto.q_category  eq '2'}">
													<c:set var="qcateString" value="배달 서비스 관련"/>
												</c:if>
												
												<c:if test="${dto.q_category  eq '3'}">
													<c:set var="qcateString" value="직원 서비스 관련"/>
												</c:if>
												
												<c:if test="${dto.q_category  eq '4'}">
													<c:set var="qcateString" value="칭찬"/>
												</c:if>
												
												<c:if test="${dto.q_category  eq '5'}">
													<c:set var="qcateString" value="제안"/>
												</c:if>
												
												<c:if test="${dto.q_category  eq '6'}">
													<c:set var="qcateString" value="기타"/>
												</c:if>
												
										<input name="writer" id="exampleWriter" placeholder="문의유형"
											class="form-control" value="${qcateString }" readonly>
									</div>
								</div>
								
								
								
								<div class="position-relative row form-group">	
									<label for="exampleTitle" class="col-sm-2 col-form-label">제목</label>
									<div class="col-sm-10">
										<input name="title" id="exampleTitle" placeholder="제목입력"
											class="form-control" value="[답변완료] ${dto.title }" readonly>
									</div>
								</div>
								
								
								
								<div class="position-relative row form-grooup">
									<label for="exampleWriter" class="col-sm-2 col-form-label">작성자</label>
									<div class="col-sm-10">
										<input name="writer" id="exampleWriter" placeholder="작성자 이름"
											class="form-control" value="${dto.writer }" readonly>
									</div>
								</div>


								<div class="position-relative row form-group">
									<label for="exampleText" class="col-sm-2 col-form-label">내용</label>
									<div class="col-sm-10">
										<textarea rows="7" name="text" id="exampleText"
											class="form-control">${dto.contents }
====================================================================	
										</textarea>
									</div>
								</div>
								<c:set var="file1" value="${dto.sfile }"/>
									<input type="hidden" id="deleteofile" name="deleteofile" />
									<c:if test="${empty file1}">
										<div class="position-relative row form-group">
											<label for="exampleFile" class="col-sm-2 col-form-label">이미지</label>
											<div class="col-sm-10">
												<input name="file" id="exampleFile" type="file"
													class="form-control-file" value="${dto.ofile }"> <small
													class="form-text text-muted">포스터나, 이미지 등록</small>
											</div>
										</div>
									</c:if>
									<c:if test="${not empty file1}">
										<div class="position-relative row form-group" id="element">
											<label for="exampleText" class="col-sm-2 col-form-label"></label>
											<div class="col-sm-10">
												
												<input name="pre_file" id="pre_file" class="form-control"
													style="width:200px;float:left;" value="${dto.ofile }">							
												<button type="button" class="btn btn-secondary" id="deletefile">파일 삭제
												</button>
											</div>
										</div>
									</c:if>


								<div class="position-relative row form-check">
									<div class="col-sm-10 offset-sm-2">
										<button class="btn btn-primary" >답변완료</button>
									</div>
								</div>
							</form:form>

						</div>
					</div>
				</div>

			</div>
        </div>
    </div>
<script type="text/javascript" src="./assets/scripts/main.js"></script>
<script>
	
		//답변하기
			var send = false;
		function textarea(){
			
			if(${dto.contents }.val() == ${dto.contents }) { 
				alert('문의내용을 입력하세요.'); 
				$("#content").focus(); event.preventDefault(); 
				return;}	
			
			alert('등록중 입니다.');
				return true;
			
		}
		</script>
</body>
</html>