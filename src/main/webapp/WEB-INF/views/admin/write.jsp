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
									<i class="pe-7s-graph text-success"> </i>
								</div>
								<div>
									공지사항 작성
									<div class="page-title-subheading">홈페이지 공지사항탭에 올라갈</div>
								</div>
							</div>
							<div class="page-title-actions">
								<button type="button" data-toggle="tooltip"
									title="Example Tooltip" data-placement="bottom"
									class="btn-shadow mr-3 btn btn-dark">
									<i class="fa fa-star"></i>
								</button>
								<div class="d-inline-block dropdown">
									<button type="button" data-toggle="dropdown"
										aria-haspopup="true" aria-expanded="false"
										class="btn-shadow dropdown-toggle btn btn-info">
										<span class="btn-icon-wrapper pr-2 opacity-7"> <i
											class="fa fa-business-time fa-w-20"></i>
										</span> Buttons
									</button>
									<div tabindex="-1" role="menu" aria-hidden="true"
										class="dropdown-menu dropdown-menu-right">
										<ul class="nav flex-column">
											<li class="nav-item"><a href="javascript:void(0);"
												class="nav-link"> <i class="nav-link-icon lnr-inbox"></i>
													<span> Inbox </span>
													<div class="ml-auto badge badge-pill badge-secondary">86</div>
											</a></li>
											<li class="nav-item"><a href="javascript:void(0);"
												class="nav-link"> <i class="nav-link-icon lnr-book"></i>
	 관리												<span> Book </span>
													<div class="ml-auto badge badge-pill badge-danger">5</div>
											</a></li>
											<li class="nav-item"><a href="javascript:void(0);"
												class="nav-link"> <i class="nav-link-icon lnr-picture"></i>
													<span> Picture </span>
											</a></li>
											<li class="nav-item"><a disabled
												href="javascript:void(0);" class="nav-link disabled"> <i
													class="nav-link-icon lnr-file-empty"></i> <span>
														File Disabled </span>
											</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>



					<div class="main-card mb-3 card">
						<div class="card-body">

							<h5 class="card-title">공지사항 등록</h5>
							<form class="">
							
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
								<!-- 필요할라나 싶지만 혹시몰라 냅듐 -->
								<div class="position-relative row form-group">
									<label for="examplePassword" class="col-sm-2 col-form-label">Password</label>
									<div class="col-sm-10">
										<input name="password" id="examplePassword"
											placeholder="password placeholder" type="password"
											class="form-control">
									</div>
								</div>
								<!-- 데이트피커 쓰고싶은데 구현...을 전 못하겠어요 -->
								<div class="position-relative row form-group">
									<label for="examplePassword" class="col-sm-2 col-form-label">작성일</label>
									<div class="col-sm-10 input-group date" id="datepicker">
										 <input type="text" class="form-control" id="date"/>
										<span class="input-group-append"> 
											<span class="input-group-text bg-light d-block"> 
												<i class="icon-calendar"></i>
											</span>
										</span>
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
										<input name="file" id="exampleFile" type="file"
											class="form-control-file"> <small
											class="form-text text-muted">포스터나, 이미지 등록</small>
									</div>
								</div>

								<div class="position-relative row form-group">
									<label for="checkbox2" class="col-sm-2 col-form-label">체크?</label>
									<div class="col-sm-10">
										<div class="position-relative form-check">
											<label class="form-check-label"><input id="checkbox2"
												type="checkbox" class="form-check-input"> Check me
												out</label>
										</div>
									</div>
								</div>
								<div class="position-relative row form-check">
									<div class="col-sm-10 offset-sm-2">
										<button class="btn btn-primary">등록하기</button>
									</div>
								</div>
							</form>

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
<script type="text/javascript" src="./assets/scripts/main.js"></script>
</body>
</html>