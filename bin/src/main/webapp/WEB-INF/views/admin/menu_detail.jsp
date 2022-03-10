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
								<div>상품 정보
									<div class="page-title-subheading">상품 정보 페이지입니다.</div>
								</div>
							</div>						
						</div>
					</div>



					<div class="main-card mb-3 card">
						<div class="card-body"> 
							<h5 class="card-title">등록된 상품 정보</h5>
							<form:form id="" action=" " name="menuFrm" method="post" enctype="multipart/form-data">
								<table class="mb-0 table table-striped">
									<tr>
										<th class="text-center" style="vertical-align:middle;">상품구분</th>
										<td>
											<input type="text" class="form-control" name="g_code" style="width:70%;" value="${vo.g_code }" readonly/>
										</td>
									</tr>
									<tr>
										<th class="text-center" style="vertical-align:middle;">상품코드</th>
										<td>
											<input type="text" class="form-control" name="p_code" style="width:70%;" value="${vo.p_code }" readonly/>
										</td>
									</tr>
									<tr>
										<th class="text-center" style="vertical-align:middle;">이름</th>
										<td>
											<input type="text" class="form-control" name="p_name" style="width:70%;" value="${vo.p_name }" readonly/>
										</td>
									</tr>
									<tr>
										<th class="text-center" style="vertical-align:middle;">가격</th>
										<td>
											<input type="text" class="form-control" name="p_price" style="width:70%;" value="${vo.p_price }" readonly/>
										</td>
									</tr>
									<tr>
										<th class="text-center" style="vertical-align:middle;">사이즈</th>
										<td>
											<input type="text" class="form-control" name="p_size" style="width:70%;" value="${vo.p_size }" readonly/>
										</td>
									</tr>
									<tr>
										<th class="text-center" style="vertical-align:middle;">영양정보</th>
										<td>
											<input type="text" class="form-control" name="p_info" style="width:70%;" value="${vo.p_info }" readonly/>
										</td>
									</tr>
									<tr>
										<th class="text-center" style="vertical-align:middle;">이미지</th>
										<c:choose>
					                    	<c:when test="${empty vo.p_sfile}">
					                    		<td>등록된 이미지가 없습니다.</td>
					                    	</c:when>
					                    	<c:otherwise>
												<td><a href="download.do?fileName=${vo.p_sfile }&oriFileName=${vo.p_ofile }">[다운로드] </a></td>
					                    	</c:otherwise>
					                    </c:choose>
									</tr>
								</table>
								</div>

								<div class="row mt-3 mb-3">
									<div class="col d-flex justify-content-end">
										<button type="button" class="btn btn-primary" onclick="location.href='menuEdit.do?p_code=${vo.p_code}';">수정하기</button>
										<button type="button" class="btn btn-warning" onclick="location.href='menu.do?g_code=${vo.g_code}';">목록보기</button>
										<button type="button" class="btn btn-danger" onclick="location.href='menuDelete.do?g_code=${vo.g_code}&p_code=${vo.p_code}&pre_sfile=${vo.p_sfile }';">삭제하기</button>
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