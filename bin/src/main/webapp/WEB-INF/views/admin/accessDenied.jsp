<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" 
	uri="http://www.springframework.org/tags/form" %>  
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>  
<%@ include file="./commons/header.jsp" %>
<body>
<%
    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    Object principal = auth.getPrincipal();
 
    String name = "";
    if(principal != null) {
        name = auth.getName();
    }
%>
	<div
		class="app-container app-theme-white body-tabs-shadow fixed-sidebar fixed-header">
		<div class="app-main">
			<!-- <div class="app-main__outer"> -->
			<div class="app-main__inner">
				<div class="app-page-title">
					<div class="page-title-wrapper">
						<div class="page-title-heading">
							<div class="page-title-icon">
								<i class="pe-7s-graph text-success"> </i>
							</div>
							<div>
								접근제한
								<div class="page-title-subheading">권한이 없습니다.</div>
							</div>
						</div>
					</div>
				</div>

				<div class="main-card mb-3 card">
					<div class="card-body">
						<h5 class="card-title">권한있는 계정으로 로그인</h5>
						
						<%= name %>님
						<form:form method="post"
							action="${pageContext.request.contextPath }/admin/logout">

							<div class="position-relative row form-check">
								<div class="col-sm-10 offset-sm-2">
									<button type="submit" class="btn btn-primary">Logout</button>
								</div>
							</div>
						</form:form>
						<h5 class="card-title">메인페이지로 돌아가기</h5>
							<form:form method="post"
							action="${pageContext.request.contextPath }/admin/index.do">

							<div class="position-relative row form-check">
								<div class="col-sm-10 offset-sm-2">
									<button type="submit" class="btn btn-primary">Main</button>
								</div>
							</div>
						</form:form>
						<%-- 	</form> --%>
					</div>
				</div>
				<!--      </div> -->
			</div>
		</div>
	</div>

	<script type="text/javascript" src="../assets/scripts/main.js"></script>
</body>
</html>



