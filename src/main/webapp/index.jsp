<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Khai báo sử dụng JSTL Core Tags -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="format-detection" content="telephone=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<link href="apple-touch-icon.png" rel="apple-touch-icon">
<link href="favicon.png" rel="icon">
<meta name="keywords" content="Default Description">
<meta name="description" content="Default keyword">
<title>Trang chủ</title>
<!-- Fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Archivo+Narrow:300,400,700%7CMontserrat:300,400,500,600,700,800,900"
	rel="stylesheet">
<link rel="stylesheet"
	href="plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="plugins/ps-icon/style.css">
<script type="module"
	src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule
	src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<!-- CSS Library-->
<link rel="stylesheet"
	href="plugins/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="plugins/owl-carousel/assets/owl.carousel.css">
<link rel="stylesheet"
	href="plugins/jquery-bar-rating/dist/themes/fontawesome-stars.css">
<link rel="stylesheet" href="plugins/slick/slick/slick.css">
<link rel="stylesheet"
	href="plugins/bootstrap-select/dist/css/bootstrap-select.min.css">
<link rel="stylesheet"
	href="plugins/Magnific-Popup/dist/magnific-popup.css">
<link rel="stylesheet" href="plugins/jquery-ui/jquery-ui.min.css">
<link rel="stylesheet" href="plugins/revolution/css/settings.css">
<link rel="stylesheet" href="plugins/revolution/css/layers.css">
<link rel="stylesheet" href="plugins/revolution/css/navigation.css">
<!-- Custom-->
<link rel="stylesheet" href="css/style.css">
<style>
#imageShoeMini {
	max-width: 50px;
	min-width: 50px;
	max-height: 50px;
	min-height: 50px;
	object-fit: cover;
}

#imageShoeBanner {
	max-width: 98%;
	min-width: 98%;
	max-height: 400px;
	min-height: 400px;
	object-fit: cover;
}
</style>
<body class="ps-loading">

	<div class="header--sidebar"></div>
	<!--    //HeaderForm-->
	<jsp:include page="inc/header.jsp"></jsp:include>
	<jsp:include page="inc/headerService.jsp"></jsp:include>
	<jsp:include page="inc/scrollBar.jsp"></jsp:include>
	<fmt:setLocale value="vi_VN" />
	<fmt:setBundle basename="java.text.resources.LocaleElements" />
	<main class="ps-main">
		<jsp:include page="inc/banner.jsp"></jsp:include>
		<div class="ps-section ps-section--hotdeal-3 pt-80 pb-40">
			<div class="ps-container">
				<div class="ps-section__header mb-50">
					<h3 class="ps-section__title" data-mask="ƯU ĐÃI">- Hàng mới về</h3>
				</div>
				<div class="ps-section__content">
					<div class="row">
						<div class="col-lg-6 col-md-12 col-sm-12 col-xs-12 ">
							<div class="ps-product--hotdeal reverse">
								<div class="ps-product__thumbnail">
									<a class="ps-product__overlay"
										href="product-detail?id=${lastItem.id}"></a> <img
										src="imageShoe/${lastItem.images[0].path}" alt="">
								</div>
								<div class="ps-product__content">
									<a class="ps-product__title"
										href="product-detail?id=${lastItem.id}">${lastItem.name}</a>
									<p class="ps-product__price">
										Chỉ: <span> <fmt:formatNumber type="currency"
												value="${lastItem.price / 100 * (100 - lastItem.sale)}"
												currencyCode="VND" />

										</span>
									</p>
									<div class="ps-product__status">
										<div class="sold">
											Đã bán: <span>10</span>
										</div>
										<div class="avaiable">
											Còn: <span>30</span>
										</div>
									</div>
									<div class="progress">
										<div class="progress-bar" role="progressbar"
											aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
											style="width: 60%;"></div>
									</div>

									<a class="ps-btn" href="product-detail?id=${lastItem.id}">Xem
										thông tin<i class="ps-icon-next"></i>
									</a>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 ">
							<a class="ps-offer mb-30" href="product-detail?id=${lastItem.id}"><img
								src="imageShoe/${lastItem.images[1].path}" alt=""></a>
						</div>
						<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 ">
							<a class="ps-offer" href="product-detail?id=${lastItem.id}"><img
								src="imageShoe/${lastItem.images[2].path}" alt=""></a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Banner -->
		<div class="ps-section--offer">
			<div class="ps-column">
				<a class="ps-offer" href=""><img id="imageShoeBanner"
					src="images/banner/banner-1.jpg" alt=""></a>
			</div>
			<div class="ps-column">
				<a class="ps-offer" href=""><img id="imageShoeBanner"
					src="images/banner/banner-2.jpg" alt=""></a>
			</div>
		</div>
		<!-- Top bán chạy -->
		<div class="ps-section ps-section--top-sales ps-owl-root pt-80 pb-80">
			<div class="ps-container">
				<div class="ps-section__header mb-50">
					<div class="row">

						<div class="col-lg-9 col-md-9 col-sm-12 col-xs-12 ">
							<h3 class="ps-section__title" data-mask="BÁN CHẠY">- Top bán
								chạy</h3>


						</div>
						<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 ">
							<div class="ps-owl-actions">
								<a class="ps-prev" href="#"><i class="ps-icon-arrow-right"></i>Trước</a>
								<a class="ps-next" href="#">Sau<i class="ps-icon-arrow-left"></i></a>
							</div>
						</div>
					</div>
				</div>
				<div class="ps-section__content">
					<div class="ps-owl--colection owl-slider" data-owl-auto="true"
						data-owl-loop="true" data-owl-speed="5000" data-owl-gap="30"
						data-owl-nav="false" data-owl-dots="false" data-owl-item="4"
						data-owl-item-xs="1" data-owl-item-sm="2" data-owl-item-md="3"
						data-owl-item-lg="4" data-owl-duration="1000"
						data-owl-mousedrag="on">

						<c:forEach items="${listTopSeller}" var="item">
							<c:if test="${item.status eq 'Đang bán'}">
								<div class="ps-shoes--carousel">
									<div class="ps-shoe">
										<div class="ps-shoe__thumbnail">
											<div class="ps-badge">
												<span>New</span>
											</div>

											<c:if test="${item.sale > 0}">
												<div class="ps-badge ps-badge--sale ps-badge--2nd">
													<span>${item.sale}%</span>
												</div>
											</c:if>

											<img src="imageShoe/${item.images[0].path}" alt=""> <a
												class="ps-shoe__overlay" href="product-detail?id=${item.id}"></a>

										</div>
										<div class="ps-shoe__content">
											<div class="ps-shoe__variants">
												<div class="ps-shoe__variant normal">
													<c:forEach items="${item.images}" var="img">
														<img id="imageShoeMini" src="imageShoe/${img.path}" alt="">
													</c:forEach>

												</div>

											</div>
											<div class="ps-shoe__detail">
												<a class="ps-shoe__name" href="product-detai?=${item.id}">${item.name }
												</a>
												<p class="ps-shoe__categories">
													<a href="category?id=${item.category.id}">${item.category.name}
													</a>
												</p>
												<span class="ps-shoe__price pt-15" style="color: red">
													<c:if test="${item.sale > 0}">
														<del>
															<fmt:formatNumber type="currency" value="${item.price}"
																currencyCode="VND" />
														</del>
													</c:if> <fmt:formatNumber type="currency"
														value="${item.price /100 * (100 - item.sale)}"
														currencyCode="VND" />
												</span>
											</div>
										</div>
									</div>
								</div>

							</c:if>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<!-- Reviews -->
		<div class="ps-home-testimonial bg--parallax pb-80"
			data-background="images/banner/banner-3.jpg">
			<div class="container">
				<div class="owl-slider" data-owl-auto="true" data-owl-loop="true"
					data-owl-speed="5000" data-owl-gap="0" data-owl-nav="false"
					data-owl-dots="true" data-owl-item="1" data-owl-item-xs="1"
					data-owl-item-sm="1" data-owl-item-md="1" data-owl-item-lg="1"
					data-owl-duration="1000" data-owl-mousedrag="on"
					data-owl-animate-in="fadeIn" data-owl-animate-out="fadeOut">
					<div class="ps-testimonial">
						<div class="ps-testimonial__thumbnail">
							<img
								src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/Messi_vs_Nigeria_2018.jpg/640px-Messi_vs_Nigeria_2018.jpg"
								alt=""><i class="fa fa-quote-left"></i>
						</div>
						<header>
							<p>Lionel Messi</p>
						</header>
						<footer>
							<p>"Đôi giày bóng đá là một phần không thể thiếu của cuộc
								hành trình. Chúng không chỉ đưa tôi đến nơi tôi muốn đến, mà còn
								giúp tôi thể hiện chính mình."</p>
						</footer>
					</div>
					<div class="ps-testimonial">
						<div class="ps-testimonial__thumbnail">
							<img
								src="https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Cristiano_Ronaldo%2C_2012_2.JPG/640px-Cristiano_Ronaldo%2C_2012_2.JPG"
								alt=""><i class="fa fa-quote-left"></i>
						</div>
						<header>

							<p>Cristiano Ronaldo</p>
						</header>
						<footer>
							<p>"Chúng ta không chỉ là những người chơi bóng, chúng ta là
								những nghệ sĩ với bàn chân, và giày là bút vẽ của chúng ta trên
								sân cỏ."</p>
						</footer>
					</div>
					<div class="ps-testimonial">
						<div class="ps-testimonial__thumbnail">
							<img
								src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/Neymar_Junior_Brazil_Austria_June_2018.jpg/640px-Neymar_Junior_Brazil_Austria_June_2018.jpg"
								alt=""><i class="fa fa-quote-left"></i>
						</div>
						<header>

							<p>Neymar Jr</p>
						</header>
						<footer>
							<p>"Khi tôi diện đôi giày đó, nó không chỉ là về việc chơi
								bóng, mà là về việc tạo ra những khoảnh khắc đặc biệt và ghi dấu
								ấn trong lịch sử."</p>
						</footer>
					</div>
				</div>
			</div>
		</div>
		<!-- Sản phẩm -->
		<div
			class="ps-section--features-product ps-section masonry-root pt-100 pb-100">
			<div class="ps-container">
				<div class="ps-section__header mb-50">
					<h3 class="ps-section__title" data-mask="SẢN PHẨM">- Sản phẩm</h3>

				</div>
				<div class="ps-section__content pb-50">
					<div class="masonry-wrapper" data-col-md="4" data-col-sm="2"
						data-col-xs="1" data-gap="30" data-radio="100%">
						<div class="ps-masonry">
							<div class="grid-sizer"></div>

							<c:forEach items="${listProduct}" var="item" varStatus="status">
								<c:if test="${item.status eq 'Đang bán'}">
									<div class="grid-item <?php echo $shoe['name'] ?>">
										<div class="grid-item__content-wrapper">
											<div class="ps-shoe mb-30">
												<div class="ps-shoe__thumbnail">
													<c:if test="${status.index == 0}">
														<div class="ps-badge">
															<span>New</span>
														</div>
													</c:if>
													<c:if test="${item.sale > 0}">
														<div class="ps-badge ps-badge--sale ps-badge--2nd">
															<span>${item.sale}%</span>
														</div>
													</c:if>


													<img id="imageShoe" src="imageShoe/${item.images[0].path}"
														alt=""> <a class="ps-shoe__overlay"
														href="product-detail?id=${item.id}"></a>
												</div>
												<div class="ps-shoe__content">
													<div class="ps-shoe__variants">
														<div class="ps-shoe__variant normal">
															<c:forEach items="${item.images}" var="img">
																<img id="imageShoeMini" src="imageShoe/${img.path}"
																	alt="">
															</c:forEach>
														</div>

													</div>
													<div class="ps-shoe__detail">
														<a class="ps-shoe__name"
															href="product-detail?id=${item.id}"> ${item.name} </a>
														<p class="ps-shoe__categories">
															<a href="category?id=${item.category.id}">${item.category.name}
															</a>
														</p>
														<span class="ps-shoe__price pt-15" style="color: red">
															<c:if test="${item.sale > 0}">
																<del>
																	<fmt:formatNumber type="currency" value="${item.price}"
																		currencyCode="VND" />
																</del>
															</c:if> <fmt:formatNumber type="currency"
																value="${item.price /100 * (100 - item.sale)}"
																currencyCode="VND" />
														</span>
													</div>
												</div>
											</div>
										</div>
									</div>

								</c:if>
							</c:forEach>

						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- //FooterForm-->
		<jsp:include page="inc/sponsor.jsp"></jsp:include>
		<jsp:include page="inc/formSub.jsp"></jsp:include>
		<jsp:include page="inc/footer.jsp"></jsp:include>
		<jsp:include page="inc/scrollToTop.jsp"></jsp:include>
	</main>
	<!-- JS Library-->
	<script type="text/javascript" src="plugins/jquery/dist/jquery.min.js"></script>
	<script type="text/javascript"
		src="plugins/bootstrap/dist/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="plugins/jquery-bar-rating/dist/jquery.barrating.min.js"></script>
	<script type="text/javascript"
		src="plugins/owl-carousel/owl.carousel.min.js"></script>
	<script type="text/javascript" src="plugins/gmap3.min.js"></script>
	<script type="text/javascript" src="plugins/imagesloaded.pkgd.js"></script>
	<script type="text/javascript" src="plugins/isotope.pkgd.min.js"></script>
	<script type="text/javascript"
		src="plugins/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
	<script type="text/javascript" src="plugins/jquery.matchHeight-min.js"></script>
	<script type="text/javascript" src="plugins/slick/slick/slick.min.js"></script>
	<script type="text/javascript"
		src="plugins/elevatezoom/jquery.elevatezoom.js"></script>
	<script type="text/javascript"
		src="plugins/Magnific-Popup/dist/jquery.magnific-popup.min.js"></script>
	<script type="text/javascript" src="plugins/jquery-ui/jquery-ui.min.js"></script>
	<script type="text/javascript"
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAx39JFH5nhxze1ZydH-Kl8xXM3OK4fvcg&amp;region=GB"></script>
	<script type="text/javascript"
		src="plugins/revolution/js/jquery.themepunch.tools.min.js"></script>
	<script type="text/javascript"
		src="plugins/revolution/js/jquery.themepunch.revolution.min.js"></script>
	<script type="text/javascript"
		src="plugins/revolution/js/extensions/revolution.extension.video.min.js"></script>
	<script type="text/javascript"
		src="plugins/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
	<script type="text/javascript"
		src="plugins/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
	<script type="text/javascript"
		src="plugins/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
	<script type="text/javascript"
		src="plugins/revolution/js/extensions/revolution.extension.parallax.min.js"></script>
	<script type="text/javascript"
		src="plugins/revolution/js/extensions/revolution.extension.actions.min.js"></script>
	<!-- Custom scripts-->
	<script type="text/javascript" src="js/main.js"></script>
</body>
</html>