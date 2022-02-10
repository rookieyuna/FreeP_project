<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>나만의 맞춤 피자 Free</title>

	<!-- font 영역 -->
	<link rel="stylesheet" href="./font/font.css">
	<!-- style 영역 -->
	<link rel="stylesheet" href="./style/common.css">
	<link rel="stylesheet" href="./style/sub.css">
	<link rel="stylesheet" href="./style/mainpage.css">
	<!-- slick style -->
	<link rel="stylesheet" type="text/css" href="./style/slick/slick-theme.css" />
	<link rel="stylesheet" type="text/css" href="./style/slick/slick.css" />

	<!-- icon영역 -->
	<link
		href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
		rel="stylesheet">
	<!-- js 라이브러리 영역 -->
	<script src="./js/jquery-3.6.0.js"></script>
	<script src="./js/includeHTML.js"></script>

</head>

<body id="body">
	<header id="header">
		<%@ include file="./common/header.jsp" %>
	</header>

	<div id="container">
		<section id="content">
			<div class="main">
				<!-- visual -->
				<article class="article visual-area ">
					<div class="visual-slider slick-initialized slick-slider ">

						<div aria-live="polite" class="slick-list draggable ">
							<div class="slick-track">
								<div class="slider-item">
									<a href="#"
										style="background-image: url('https://cdn.dominos.co.kr/admin/upload/banner/20220203_82Vt8VpA.jpg')"
										alt="1" >
									</a>
								</div>
								<div class="slider-item">
									<a href="#"
										style="background-image: url('https://cdn.dominos.co.kr/admin/upload/banner/20210901_3VJffg9G.jpg')"
										alt="2" >
									</a>
								</div>
								<div class="slider-item">
									<a href="#"
										style="background-image: url('https://cdn.dominos.co.kr/admin/upload/banner/20220204_Logha94G.jpg')"
										alt="3" >
									</a>
								</div>
								<div class="slider-item">
									<a href="#"
										style="background-image: url('https://cdn.dominos.co.kr/admin/upload/banner/20220126_81158f06.jpg')"
										alt="4" >
									</a>
								</div>
							
							</div>
						</div>

						<div class="slide-count-wrap">
							<span class="slide-count" id="slide-count"></span>
							<a href="javascript:;" class="btn-play" style="cursor: pointer;">btnPlay</a>
						</div>
						
						
					</div>
				</article>
				<!-- //visual -->

				<!-- delivery -->
				<article class="article delivery-area">
					<section data-v-65bbb0ce="" class="main-favorite">
						<div class="main-favorite-header">
							<h2>즐겨찾는 <span>FreeP</span></h2>
							<p>고객님들께서 자주찾는 서비스 바로가기</p>
						</div>
						<div class="swiper-container swiper-container-initialized swiper-container-horizontal">
							<div class="swiper-wrapper"
								style="transition-duration: 0ms; transform: translate3d(0px, 0px, 0px);">
								<div class="swiper-slide main-favorite-slide-check swiper-slide-active">
									<img src="./images/03visual/pizzadiy.png" alt=""
										style="width: 100px; margin-bottom: 20px;">
									<h3>DIY피자 주문</h3>
									<p>나만의 피자를 만들어서<br>
										지금 바로 주문하세요</p>
									<a href="#">link</a>
								</div>
								<div class="swiper-slide main-favorite-slide-event swiper-slide-next">
									<img src="./images/03visual/pizzabasic.png" alt=""
										style="width: 100px; margin-bottom: 20px;">
									<h3>일반피자 주문</h3>
									<p>FreeP만의 프리미엄 피자<br>
										지금 바로 주문하세요</p>
									<a href="#" class="">link</a>
								</div>
								<div class="swiper-slide main-favorite-slide-station">
									<img src="./images/03visual/restaurant.png" alt=""
										style="width: 100px; margin-bottom: 20px;">
									<h3>매장찾기</h3>
									<p>우리집 가까이 있는 FreeP를<br>
										검색해 보세요</p>
									<a href="#" class="">link</a>
								</div>
							</div>
							<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
						</div>
					</section>
				</article>
				<!-- //delivery -->

				<!-- 베스트 리뷰 -->
				<article class="article grade-area">
					<section data-v-65bbb0ce="" class="main-product">
						<div class="main-product-header">
							<h3>BEST REVIEW</h3>
							<p>다른 고객님들이 선택한 인기 피자를 바로 주문하세요!</p>
						</div>
						<div id="main-product-contents-link" class="main-product-contents">
							<div class="swiper-container swiper-container-initialized swiper-container-horizontal">
								<div class="swiper-wrapper" style="transform: translate3d(0px, 0px, 0px);">
									<div class="swiper-slide swiper-slide-active" style="margin-right: 30px;">
										<a target="_blank" style="cursor: pointer;">
											<div class="main-product-badge main-product-badge-point">BEST 1</div>
											<figure><img src="./images/03visual/pizzaReviewex.png">
											</figure>
											<h3>피자는 역시 프리피</h3>
											<p>고기가 많이 올라가 있어서 맛있어요~</p>
											<div class="main-product-point-wrap">
												<div title="정상가" class="main-product-point-original">루키 님</div>
												<div title="10% 할인가" class="main-product-point"><em>31,800</em>원</div>
											</div>
										</a>
									</div>
									<div class="swiper-slide swiper-slide-active" style="margin-right: 30px;">
										<a target="_blank" style="cursor: pointer;">
											<div class="main-product-badge main-product-badge-point">BEST 2</div>
											<figure><img src="./images/03visual/pizzaReviewex.png">
											</figure>
											<h3>내피자 만들기 꿀잼</h3>
											<p>올리브+양파+리코타치즈로 피자만드세요 초대박</p>
											<div class="main-product-point-wrap">
												<div title="정상가" class="main-product-point-original">루키 님</div>
												<div title="10% 할인가" class="main-product-point"><em>31,800</em>원</div>
											</div>
										</a>
									</div>
									<div class="swiper-slide swiper-slide-active" style="margin-right: 30px;">
										<a target="_blank" style="cursor: pointer;">
											<div class="main-product-badge main-product-badge-point">BEST 3</div>
											<figure><img src="./images/03visual/pizzaReviewex.png">
											</figure>
											<h3>피자는 역시 프리피</h3>
											<p>고기가 많이 올라가 있어서 맛있어요~</p>
											<div class="main-product-point-wrap">
												<div title="정상가" class="main-product-point-original">루키 님</div>
												<div title="10% 할인가" class="main-product-point"><em>31,800</em>원</div>
											</div>
										</a>
									</div>
									<div class="swiper-slide swiper-slide-active" style="margin-right: 30px;">
										<a target="_blank" style="cursor: pointer;">
											<div class="main-product-badge main-product-badge-point">BEST 4</div>
											<figure><img src="./images/03visual/pizzaReviewex.png">
											</figure>
											<h3>내피자 만들기 꿀잼</h3>
											<p>올리브+양파+리코타치즈로 피자만드세요 초대박</p>
											<div class="main-product-point-wrap">
												<div title="정상가" class="main-product-point-original">루키 님</div>
												<div title="10% 할인가" class="main-product-point"><em>31,800</em>원</div>
											</div>
										</a>
									</div>
								</div>
							</div>
						</div>
					</section>
				</article>
				<!-- //베스트 리뷰 -->


				<!-- 게시판 미리보기 -->
				<article class="article grade-area">

					<section data-v-65bbb0ce="" class="main-board">
						<div data-v-65bbb0ce="" class="main-board-wrap">
							<div data-v-65bbb0ce="" class="main-board-item main-board-item-notice">
								<div class="main-board-item-header">
									<h3>공지사항</h3>
									<a href="/notice" class="main-board-open-btn">open</a>
								</div>
								<div
									class="main-board-item-contents swiper-container swiper-container-initialized swiper-container-vertical">
									<div class="swiper-wrapper"
										style="transition-duration: 0ms; transform: translate3d(0px, 0px, 0px);">
										<a href="#" class="">
											<h4>포인트몰, GS&amp;쿠폰 개인정보 처리방침 </h4> <time>2022.01.21</time>
										</a>
										<a href="#" class="">
											<h4>포인트몰, GS&amp;쿠폰 개인정보 처리방침 </h4> <time>2022.01.21</time>
										</a>
									</div>
									<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
								</div>
							</div>
							<div data-v-65bbb0ce="" class="main-board-item main-board-item-event">
								<div class="main-board-item-header">
									<h3>이벤트</h3>
									<a href="#" class="main-board-open-btn">open</a>
								</div>
								<div
									class="main-board-item-contents swiper-container swiper-container-initialized swiper-container-vertical">
									<div class="swiper-wrapper"
										style="transition-duration: 0ms; transform: translate3d(0px, 0px, 0px);">
										<a href="#">
											<h4>wavve 이용권 제공 이벤트</h4> <time>2022.01.05</time>
										</a>
										<a href="#">
											<h4>wavve 이용권 제공 이벤트</h4> <time>2022.01.05</time>
										</a>
									</div>
									<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
								</div>
							</div>
						</div>
					</section>
				</article><!-- //게시판 미리보기 -->
			</div><!-- //main -->
		</section>
	</div>

	<footer id="footer">
		<%@ include file="./common/footer.jsp" %>
	</footer>

	<!-- script area -->
	<script src="./js/motion.js"></script>
	<script>
		includeHTML();
	</script>
	<script src="./js/ui.js"></script>
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

	<!-- slick area -->
	<script src="./js/slick/slick.js"></script>
	<script src="./js/slick/slick.min.js"></script>

	<script>
		
	</script>

</body>

</html>