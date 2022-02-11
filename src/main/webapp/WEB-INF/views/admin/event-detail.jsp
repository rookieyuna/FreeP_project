<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>     
<%@ include file="./commons/header.jsp" %>
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
									<i class="pe-7s-graph text-success"> </i>
								</div>
								<div>
									이벤트
									<div class="page-title-subheading">이벤트 항목 관리</div>
								</div>
							</div>						
						</div>
					</div>



					<div class="main-card mb-3 card">
						<div class="card-body">

							<h5 class="card-title">이벤트 상세보기페이지</h5>
							<form:form name="writeFrm" method="post"
								enctype="multipart/form-data">


								<!-- validate 하는거 type넣는거 찾아본담에 넣어야될거같아여어 -->
								<div class="position-relative row form-group">
									<label for="exampleTitle" class="col-sm-2 col-form-label">제목</label>
									<div class="col-sm-10">
										<input name="title" id="exampleTitle" placeholder="제목입력"
											class="form-control" value="${dto.title }" readonly>
									</div>
								</div>
								<div class="position-relative row form-group">
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
											class="form-control" readonly>${dto.contents }</textarea>
									</div>
								</div>
								<c:set var="file" value="${dto.sfile }" />
								<c:if test="${not empty file }">								
									<div class="position-relative row form-group">
										<label for="exampleFile" class="col-sm-2 col-form-label">이미지</label>
										<a
											href="download.do?fileName=${dto.sfile }&oriFileName=${dto.ofile }">
											[다운로드] </a>
	
										
									</div>
									
									<div class="position-relative row form-group">
										<label for="exampleFile" class="col-sm-2 col-form-label"></label>
										<img src="../uploads/${dto.sfile }" alt="" width="200px" height="100px"/>
										
										
									</div>								
								</c:if>
								</form:form>

								<div class="position-relative row form-check">
									<div class="col-sm-10 offset-sm-2">
										<button class="btn btn-primary" onclick="location.href='./eventedit.do?idx=${dto.b_idx}';">수정하기</button>
										<button class="btn btn-success" onclick="location.href='./eventremove.do?idx=${dto.b_idx}&pre_sfile=${dto.sfile }';">삭제하기</button>
										
									</div>
								</div>
							

						</div>
					</div>
				</div>

			</div>
        </div>
    </div>
<script type="text/javascript" src="./assets/scripts/main.js"></script>
</body>
</html>