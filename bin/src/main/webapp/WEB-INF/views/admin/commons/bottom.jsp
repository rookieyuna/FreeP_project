<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" 
	uri="http://www.springframework.org/tags/form" %>      
    
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">로그아웃</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p class="mb-0">로그아웃 하시겠습니까?</p>
            </div>
            <form:form method="post" 
				action="${pageContext.request.contextPath }/admin/logout">
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">아뇨</button>
                <button type="submit" class="btn btn-danger">넴</button>
            </div>
            </form:form>	
        </div>
    </div>
</div>