<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./commons/header.jsp" %>
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
									공지사항
									<div class="page-title-subheading">손님에게 전달할거 공지사항</div>
								</div>
							</div>
							
						</div>
					</div>



					<div class="row">

						<div class="col-lg-12">
							<div class="main-card mb-3 card">
								<div class="card-body">
									<h5 class="card-title">공지사항</h5>
									<table class="mb-0 table table-striped">
										<thead>
											<tr>
												<th>#</th>
												<th>idx</th>
												<th>제목</th>
												<th>내용</th>
												<th>작성일</th>
												<th>첨부파일</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th><input type="checkbox"></th>
												<td >1</td>
												<td><a href="">Mark</a></td>
												<td>Otto</td>
												<td>@mdo</td>
												<td><i class="bi-pin-angle-fill" style="font-size: 1rem;"></i></td>
											</tr>
											<tr>
												<th><input type="checkbox"></th>
												<td >2</td>
												<td>Jacob</td>
												<td>Thornton</td>
												<td>@fat</td>
												<td>@mdo</td>
											</tr>
											<tr>
												<th><input type="checkbox"></th>
												<td >3</td>
												<td>Larry</td>
												<td>the Bird</td>
												<td>@twitter</td>
												<td>@mdo</td>
											</tr>
										</tbody>
									</table>

									<div class="mt-5"
										style="display: flex; justify-content: center;">
										<ul class="pagination">
											<li class="page-item"><a href="javascript:void(0);"
												class="page-link" aria-label="Previous"><span
													aria-hidden="true">«</span><span class="sr-only">Previous</span></a></li>
											<li class="page-item"><a href="javascript:void(0);"
												class="page-link">1</a></li>
											<li class="page-item active"><a
												href="javascript:void(0);" class="page-link">2</a></li>
											<li class="page-item"><a href="javascript:void(0);"
												class="page-link">3</a></li>
											<li class="page-item"><a href="javascript:void(0);"
												class="page-link">4</a></li>
											<li class="page-item"><a href="javascript:void(0);"
												class="page-link">5</a></li>
											<li class="page-item"><a href="javascript:void(0);"
												class="page-link" aria-label="Next"><span
													aria-hidden="true">»</span><span class="sr-only">Next</span></a></li>
										</ul>
									</div>



									<div class="row mr-3"
										style="display: flex; justify-content: right;'">
										<form action="">
											<div class="input-group ms-auto" style="width: 350px;">
												<select name="" class="form-control">
													<option value="">제목</option>
													<option value="">내용</option>
													<option value="">작성자</option>
												</select> <input type="text" class="form-control"
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
												onclick="location.href='write';">추가하기</button>
											<button type="button" class="btn btn-success" data-toggle="modal" data-target="#exampleModal">
												삭제하기
                                        	</button>

										</div>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>




				<div class="app-wrapper-footer">
					<div class="app-footer">
						<div class="app-footer__inner">
							<div class="app-footer-left">
								<ul class="nav">
									<li class="nav-item"><a href="javascript:void(0);"
										class="nav-link"> Footer Link 1 </a></li>
									<li class="nav-item"><a href="javascript:void(0);"
										class="nav-link"> Footer Link 2 </a></li>
								</ul>
							</div>
							<div class="app-footer-right">
								<ul class="nav">
									<li class="nav-item"><a href="javascript:void(0);"
										class="nav-link"> Footer Link 3 </a></li>
									<li class="nav-item"><a href="javascript:void(0);"
										class="nav-link">
											<div class="badge badge-success mr-1 ml-0">
												<small>NEW</small>
											</div> Footer Link 4
									</a></li>
								</ul>
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
                <p class="mb-0">선택한 공지사항 삭제하시겠습니까?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">아뇨</button>
                <button type="button" class="btn btn-primary">넴</button>
            </div>
        </div>
    </div>
</div>