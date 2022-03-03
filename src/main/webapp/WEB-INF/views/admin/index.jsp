<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   
<%@ include file="./commons/header.jsp" %>
<body>
<script type="text/javascript">
	toastr.options = {
			  "closeButton": true,
			  "debug": false,
			  "newestOnTop": false,
			  "progressBar": true,
			  "positionClass": "toast-bottom-center",
			  "preventDuplicates": false,
			  "onclick": null,
			  "showDuration": "100",
			  "hideDuration": "1000",
			  "timeOut": "1500",
			  "extendedTimeOut": "1000",
			  "showEasing": "swing",
			  "hideEasing": "linear",
			  "showMethod": "fadeIn",
			  "hideMethod": "fadeOut"
			}
</script>
<div class="app-container app-theme-white body-tabs-shadow fixed-sidebar fixed-header">
        <!-- top영역 -->
        <c:if test="${param.success != null }">
			<script type="text/javascript">
				toastr.info('관리자 페이지 로그인','로그인 성공');			
			</script>
		</c:if>
        <%@ include file="./commons/top.jsp" %>
        
        <!-- 밑에 핸드폰버튼 작은거 -->
<%--         <%@ include file="./commons/themeTool.jsp" %>
 --%>                       
        <div class="app-main">
             <!-- Left메뉴영역 -->
       		 <%@ include file="./commons/left.jsp" %>   

                <div class="app-main__outer">
                    <div class="app-main__inner">
					<div class="app-page-title">
						<div class="page-title-wrapper">
							<div class="page-title-heading">
								<div class="page-title-icon">
									<i class="pe-7s-car icon-gradient bg-mean-fruit"> </i>
								</div>
								<div>
									FreeP 관리자페이지
									<div class="page-title-subheading">level4관리자는 주문관리, 지점관리
										탭만 접근이 가능합니다.</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 col-lg-3">
							<div
								class="card-shadow-danger mb-3 widget-chart widget-chart2 text-left card">
								<div class="widget-content">
									<div class="widget-content-outer">
										<div class="widget-content-left">
											<div class="widget-heading">주문 관리</div>
											<div class="widget-subheading">주문 사항 확인, 상태 관리</div>
										</div>
										<div class="widget-content-right">
											<div class="widget-numbers text-success" onclick="location.href='orderlist.do'">
												<i class="metismenu-icon pe-7s-diamond"></i>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-3">
							<div
								class="card-shadow-success mb-3 widget-chart widget-chart2 text-left card">
								<div class="widget-content">
									<div class="widget-content-outer">
										<div class="widget-content-left">
											<div class="widget-heading">메뉴 관리</div>
											<div class="widget-subheading">메뉴 등록, 삭제, 수정</div>
										</div>
										<div class="widget-content-right">
											<div class="widget-numbers text-warning" onclick="location.href='menu.do'">
												<i class="metismenu-icon pe-7s-diamond"></i>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-3">
                                <div class="card-shadow-warning mb-3 widget-chart widget-chart2 text-left card">
                                    <div class="widget-content">
                                        <div class="widget-content-outer">
                                            <div class="widget-content-left">
											<div class="widget-heading">계정 관리</div>
											<div class="widget-subheading">전체 계정 관리</div>
										</div>
										<div class="widget-content-right">
											<div class="widget-numbers text-danger" onclick="location.href='member.do?grade=1'">
												<i class="metismenu-icon pe-7s-diamond"></i>
											</div>
										</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-3">
                                <div class="card-shadow-info mb-3 widget-chart widget-chart2 text-left card">
                                    <div class="widget-content">
                                        <div class="widget-content-outer">
                                            <div class="widget-content-left">
											<div class="widget-heading">1 : 1 관리</div>
											<div class="widget-subheading">1:1 문의 질문, 답변 관리</div>
										</div>
										<div class="widget-content-right">
											<div class="widget-numbers text-primary" onclick="location.href='question.do'">
												<i class="metismenu-icon pe-7s-diamond"></i>
											</div>
										</div>
                                        </div>
                                    </div> 
                                </div>
                            </div>
                        </div>
					<div class="row">
						<div class="col-md-6 col-xl-4">
							<div class="card mb-3 widget-content bg-midnight-bloom">
								<div class="widget-content-wrapper text-white" >
									<div class="widget-content-left">
										<div class="widget-heading">지점 관리</div>
										<div class="widget-subheading">매장 목록</div>
									</div>
									<div class="widget-content-right">
										<div class="widget-numbers text-white" onclick="location.href='storelist.do'">
											<span> <i class="metismenu-icon pe-7s-diamond"></i></span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6 col-xl-4">
							<div class="card mb-3 widget-content bg-arielle-smile">
								<div class="widget-content-wrapper text-white">
									<div class="widget-content-left">
										<div class="widget-heading">지점 관리</div>
										<div class="widget-subheading">지점별 매출</div>
									</div>
									<div class="widget-content-right">
										<div class="widget-numbers text-white" onclick="location.href='storechart.do'">
											<span><i class="metismenu-icon pe-7s-diamond"></i></span>
										</div>
									</div>
								</div>
							</div>
						</div> 
						<div class="col-md-6 col-xl-4">
							<div class="card mb-3 widget-content bg-grow-early">
								<div class="widget-content-wrapper text-white">
									<div class="widget-content-left">
										<div class="widget-heading">지점 관리</div>
										<div class="widget-subheading">가맹문의목록</div>
									</div>
									<div class="widget-content-right">
										<div class="widget-numbers text-white" onclick="location.href='franlist.do'">
											<span><i class="metismenu-icon pe-7s-diamond"></i></span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
                         
                        </div>
                        <div class="row">
						<div class="col-md-6 col-xl-4">
							<div class="card mb-3 widget-content">
								<div class="widget-content-outer">
									<div class="widget-content-wrapper">
										<div class="widget-content-left">
											<div class="widget-heading">공지사항</div>
											<div class="widget-subheading">공지사항 등록,관리</div>
										</div>
										<div class="widget-content-right">
											<div class="widget-numbers text-success" onclick="location.href='notice.do'">
												<i class="metismenu-icon pe-7s-diamond"></i>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6 col-xl-4">
							<div class="card mb-3 widget-content">
								<div class="widget-content-outer">
									<div class="widget-content-wrapper">
										<div class="widget-content-left">
											<div class="widget-heading">이벤트</div>
											<div class="widget-subheading">이벤트항목 등록,관리</div>
										</div>
										<div class="widget-content-right">
											<div class="widget-numbers text-warning" onclick="location.href='event.do'">
												<i class="metismenu-icon pe-7s-diamond"></i>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6 col-xl-4">
                                <div class="card mb-3 widget-content">
                                    <div class="widget-content-outer">
                                        <div class="widget-content-wrapper">
                                            <div class="widget-content-left">
                                                <div class="widget-heading">후기게시판</div>
                                                <div class="widget-subheading">후기게시판 관리</div>
                                            </div>
                                            <div class="widget-content-right">
                                                <div class="widget-numbers text-danger" onclick="location.href='review.do'">
                                                <i class="metismenu-icon pe-7s-diamond"></i></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                           
                        </div>
                       
                        
                    </div>
                       
                    
                   </div>
                <script src="http://maps.google.com/maps/api/js?sensor=true"></script>
        </div>
        
        
        
        
    </div>
<script type="text/javascript" src="../assets/scripts/main.js"></script>
</body>
</html>
<%@ include file="./commons/bottom.jsp" %>