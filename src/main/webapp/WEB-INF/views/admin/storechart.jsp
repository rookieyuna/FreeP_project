<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="./commons/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.js"></script>
<!-- <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script> -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
</head>
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
									매출 현황
									<div class="page-title-subheading">
										매출 현황 페이지입니다.
									</div>
								</div>
							</div>
							
						</div>
					</div>

					<div class="row">
	                   <div class="col-12">
	                       <div class="card">
		                    	<div class="card-header">
						            <input type="month" id="or_date" name="or_date" >
								</div>
		                        <div class="card-body">
		                            <h4 class="card-title">월별 매출</h4>  
									<div class="container"> 
										<canvas id="myChart"></canvas>
									</div> 
		                        </div>
		                    </div>
	                   		
		                   <div class="card">
				                <div class="card-body">
				                    <h4 class="card-title">매장 목록</h4>  
				                    <table class="mb-0 table table-striped">
				                    	<thead>
					                    	<tr>
						                    	<th>지점코드</th>
						                    	<th>지점명</th>
						                    	<th>쿠폰 사용금액</th>
						                    	<th>적립금 사용금액</th>
						                    	<th>총 매출액</th>
					                    	</tr>
				                    	</thead>
				                    	<tbody>
				                    	<c:choose>
											<c:when test="${empty lists }">
					                    		<td colspan="5" align="center">등록된 매장이 없습니다.</td>
											</c:when>
											<c:otherwise> 
												<!-- 게시물이 있을때 -->
												<c:forEach items="${lists }" var="row">
													<tr>
														<td>${row.b_code }</a></td>
														<td>${row.b_name }</td>
														<td>${row.cp_price}</td>
														<td>${row.po_price }</td>
														<td>${row.total_price }</td>
													</tr>
												</c:forEach>
											</c:otherwise>
											</c:choose>
				                    	</tbody>
				                    </table>
				                </div>
		                   </div>
		                   
		                   	<script>
		                   	var ctx = document.getElementById('myChart')
		                   		
		                   	$(document).ready(function() {
		                   		init();
		                   		$("#or_date").change(function(){
		                   			getGraph($(this).val())
								})
							});
		                   	
		                   	function init() {
		                   		getGraph();
							}
		                   	
		                   	function getGraph() {
								let timeList = [];
								let posList =[];
								
								var now = new Date();
								nowYearMonth = moment().format('YYYY-MM');
								var yearData = {or_date:or_date|| nowYearMonth};
								
								$.ajax({
									url:"/admin/getDayPay.do",
									type : "get",
									data: yearData,
									dataType : "json",
									success : function(data) {
										
										for(let i=0 ; i<data.length; i++){
											timeList.push(data[i].b_name);
											posList.push(data[i].total_price);
										}
										
										new Chart(doucment.getElementById("myChart"), {
											type:'line',
											data:{
												labels:timeList,
												datasets: [{
													data:posList,
													label:"매출현황",
													borderColor:"#3e95cd",
													fill:false
												}]
											},
											options:{
												title:{
													display : true,
													text: '주간 매출현황'
												}
											}
										});
									}
								})
							}
		                   	
		                   	/* var ctx = document.getElementById('myChart').getContext('2d');
							var myChart = new Chart(ctx, {
							    type:'bar',
							    data: {
							    	labels: ['신촌점', '본점', '구로점', 'ㅇㅇ점', 'ㅇㅇ점', 'ㅇㅇ점'],
							        datasets: [{
							            label: '# of Votes',
							            data: [12, 19, 3, 5, 2, 3],
							            backgroundColor: [
							                'rgba(255, 99, 132, 0.2)',
							                'rgba(54, 162, 235, 0.2)',
							                'rgba(255, 206, 86, 0.2)',
							                'rgba(75, 192, 192, 0.2)',
							                'rgba(153, 102, 255, 0.2)',
							                'rgba(255, 159, 64, 0.2)'
							            ],
							            borderColor: [
							                'rgba(255, 99, 132, 1)',
							                'rgba(54, 162, 235, 1)',
							                'rgba(255, 206, 86, 1)',
							                'rgba(75, 192, 192, 1)',
							                'rgba(153, 102, 255, 1)',
							                'rgba(255, 159, 64, 1)'
							            ],
							            borderWidth: 1
							        }]
							    },
							    options: {
							        scales: {
							            yAxes: [{
							                ticks: {
							                    beginAtZero: true
							                }
							            }]
							        }
							    }
							}); */
							</script>
		                   	<!-- e -->
		                   
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
                <p class="mb-0">선택한 매장을 삭제하시겠습니까?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">NO</button>
                <button type="button" class="btn btn-primary" id="deletebtn">YES</button>
            </div>
        </div>
    </div>
</div>