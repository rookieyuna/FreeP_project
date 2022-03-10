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
									<div class="page-title-subheading">후기 관리</div>
								</div>
							</div>						
						</div>
					</div>



					<div class="main-card mb-3 card">
						<div class="card-body">

							<h5 class="card-title">후기 등록</h5>
							<form:form commandName="writeFrm" method="post"
								action="./reviewwriteAction.do"
								 enctype="multipart/form-data" onsubmit="return validateForm(this);">
								 <!-- 회원 아이디 가져오는거 해당코드 admin/common/top.jsp에 있어요 -->
								<input type="hidden" name="id" value="<%= name %>" />
								
								<div class="position-relative row form-group">
									<label for="exampleWriter" class="col-sm-2 col-form-label">주문번호</label>
									<div class="col-sm-10">
										<input name="order" id="exampleWriter" placeholder="주문 번호"
											class="form-control">
									</div>
								</div>	
								<!-- validate 하는거 type넣는거 찾아본담에 넣어야될거같아여어 -->
								<div class="position-relative row form-group">
									<label for="exampleTitle" class="col-sm-2 col-form-label">제목</label>
									<div class="col-sm-10">
										<input name="title" id="exampleTitle" placeholder="제목입력"
											class="form-control">
									</div>
								</div>
								<div class="position-relative row form-group">
									<label for="exampleWriter" class="col-sm-2 col-form-label">작성자</label>
									<div class="col-sm-10">
										<input name="writer" id="exampleWriter" placeholder="작성자 이름"
											class="form-control">
									</div>
								</div>


								<div class="position-relative row form-group">
									<label for="exampleText" class="col-sm-2 col-form-label">내용</label>
									<div class="col-sm-10">
										<textarea rows="7" name="text" id="exampleText"
											class="form-control"></textarea>
									</div>
								</div>
								<div class="position-relative row form-group">
									<label for="exampleFile" class="col-sm-2 col-form-label">이미지</label>
									<div class="col-sm-10">
										<input name="file1" id="exampleFile" type="file"
											class="form-control-file"> <small
											class="form-text text-muted">포스터나, 이미지 등록</small>
									</div>
								</div>
								<div class="position-relative row form-group">
									<label for="exampleFile" class="col-sm-2 col-form-label">이미지</label>
									<div class="col-sm-10">
										<input name="file2" id="exampleFile" type="file"
											class="form-control-file"> <small
											class="form-text text-muted">포스터나, 이미지 등록</small>
									</div>
								</div>
								<div class="position-relative row form-group">
									<label for="exampleFile" class="col-sm-2 col-form-label">이미지</label>
									<div class="col-sm-10">
										<input name="file3" id="exampleFile" type="file"
											class="form-control-file"> <small
											class="form-text text-muted">포스터나, 이미지 등록</small>
									</div>
								</div>
								

								<div class="position-relative row form-check">
									<div class="col-sm-10 offset-sm-2">
										<button class="btn btn-primary">등록하기</button>
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