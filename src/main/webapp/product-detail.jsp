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
<title>${product.name}</title>
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
<!--HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries-->
<!--WARNING: Respond.js doesn't work if you view the page via file://-->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script><![endif]-->
</head>
<!--[if IE 7]>
<body class="ie7 lt-ie8 lt-ie9 lt-ie10"><![endif]-->
<!--[if IE 8]>
<body class="ie8 lt-ie9 lt-ie10"><![endif]-->
<!--[if IE 9]>
<body class="ie9 lt-ie10"><![endif]-->
<style>
#imageShoeMini {
	width: 50px;
	height: 50px;
	object-fit: cover;
}

#shoeImageZoom {
	width: 620px;
	height: 620px;
	object-fit: cover;
}

#imageShoe2 {
	max-width: 100%;
	max-height: 310px;
	min-height: 310px;
	object-fit: cover;
}
</style>
<body class="ps-loading">
	<div class="header--sidebar"></div>
	<fmt:setLocale value="vi_VN" />
	<fmt:setBundle basename="java.text.resources.LocaleElements" />

	<!--    //HeaderForm-->
	<jsp:include page="inc/header.jsp"></jsp:include>
	<jsp:include page="inc/headerService.jsp"></jsp:include>
	<jsp:include page="inc/scrollBar.jsp"></jsp:include>
	<main class="ps-main">
		<div class="test">
			<div class="container">
				<div class="row">
					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 "></div>
				</div>
			</div>
		</div>
		<div class="ps-product--detail pt-60">
			<div class="ps-container">
				<div class="row">
					<div class="col-lg-10 col-md-12 col-lg-offset-1">
						<div class="ps-product__thumbnail">
							<div class="ps-product__preview">
								<div class="ps-product__variants">
									<c:forEach items="${product.images}" var="img">
										<div class="item">
											<img id="imageShoeMini" src="imageShoe/${img.path}" alt="">
										</div>

									</c:forEach>
								</div>
							</div>
							<div class="ps-product__image">
								<c:forEach items="${product.images}" var="img">
									<div class="item">
										<img id="" class="zoom" src="imageShoe/${img.path}" alt=""
											data-zoom-image="imageShoe/${img.path}">
									</div>
								</c:forEach>
							</div>
						</div>
						<div class="ps-product__thumbnail--mobile">
							<div class="ps-product__main-img">
								<img id="imageShoeMini"
									src="imageShoe/${product.images[0].path}" alt="">
							</div>
							<div class="ps-product__preview owl-slider" data-owl-auto="true"
								data-owl-loop="true" data-owl-speed="5000" data-owl-gap="20"
								data-owl-nav="true" data-owl-dots="false" data-owl-item="3"
								data-owl-item-xs="3" data-owl-item-sm="3" data-owl-item-md="3"
								data-owl-item-lg="3" data-owl-duration="1000"
								data-owl-mousedrag="on">

								<c:forEach items="${product.images}" var="img">
									<img id="imageShoeMini" src="imageShoe/${img.path}" alt=""
										data-zoom-image="imageShoe/${img.path}">
								</c:forEach>
							</div>
						</div>
						<div class="ps-product__info">
							<h1>${product.name}</h1>
							<p class="ps-product__category">
								Hãng: <a href="category?id=${product.category.id}">${product.category.name}
								</a>
							</p>
							<h3 class="" style="color: red">CAM KẾT SẢN PHẨM CHÍNH HÃNG
								100%. ĐƯỢC BỒI HOÀN GẤP 10 LẦN NẾU KHÔNG PHẢI CHÍNH HÃNG</h3>
							<h3 class="ps-product__price" style="color: red">
								<fmt:formatNumber type="currency"
									value="${product.price /100 * (100 - product.sale)}"
									currencyCode="VND" />
								<c:if test="${product.sale > 0}">
									<del>
										<br>
										<fmt:formatNumber type="currency" value="${product.price}"
											currencyCode="VND" />
									</del>
								</c:if>
							</h3>

							<form name="form" method="POST">

								<div class="ps-product__block ps-product__size">
									<h4>
										Lựa chọn size <a href="blog-detail.jsp">(Hướng dẫn chọn
											size giày)</a>
									</h4>
									<select name="chooseSize" class="ps-select selectpicker">
										<c:forEach items="${listSize}" var="size">
											<option value="${size}">${size}</option>

										</c:forEach>

									</select>
								</div>
								<div class="ps-product__shopping">
									<!-- <a class="ps-btn mb-10" href="cart.php?id=">Add to cart<i class="ps-icon-next"></i></a> -->
									<button onclick="buy(${product.id})" class="ps-btn mb-10">
										Thêm vào giỏ hàng<i class="ps-icon-next"></i>
									</button>

								</div>
							</form>
						</div>
						<div class="clearfix"></div>
						<div class="ps-product__content mt-50">
							<ul class="tab-list" role="tablist">
								<li class="active"><a href="#tab_01" aria-controls="tab_01"
									role="tab" data-toggle="tab">Mô tả sản phẩm</a></li>
								<li><a href="#tab_02" aria-controls="tab_02" role="tab"
									data-toggle="tab">Đánh giá</a></li>
							</ul>
						</div>
						<div class="tab-content mb-60">
							<div class="tab-pane active" role="tabpanel" id="tab_01">
								<strong>${product.name}</strong>
								<p>${product.description}</p>
							</div>
							<div class="tab-pane" role="tabpanel" id="tab_02">
								<p class="mb-20">
									${reviewCount} bình luận <strong> ${product.name} </strong>
								</p>
								<c:forEach items="${listReview}" var="review">
									<div class="ps-review">
										<div class="ps-review__thumbnail">
											<img src="images/banner/user.png" alt="">
										</div>
										<div class="ps-review__content">
											<header>
												<select class="ps-rating">
													<option value="${review.rating}">${review.rating}</option>
													<c:forEach begin="1" end="${review.rating}" step="1">
														<option value="${review.rating}">${review.rating}</option>
													</c:forEach>
												</select>
												<p>
													Bởi <a href="">${review.user.username}</a> -
													${review.reviewDate}
												</p>
											</header>
											<p>${review.comment}</p>
										</div>
									</div>


								</c:forEach>
								<form class="ps-product__review" action="postReview"
									method="post" id="reviewForm">
									<h4>Viết bình luận</h4>
									<div class="row">
										<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 ">
											<div class="form-group">
												<label>Tên:<span>*</span></label> <input name="username";
													class="form-control" type="text" placeholder="" value="${sessionScope.user.username}">
											</div>

											<div class="form-group">
												<label>Đánh giá của bạn<span></span></label> <select value="rating"
													class="ps-rating">
													<option value="1">1</option>
													<option value="1">2</option>
													<option value="1">3</option>
													<option value="1">4</option>
													<option value="5">5</option>
												</select>
											</div>
										</div>
										<div class="col-lg-8 col-md-8 col-sm-6 col-xs-12 ">
											<div class="form-group">
												<label>Đánh giá của bạn</label>
												<textarea name="comment" class="form-control" rows="6"></textarea>
											</div>
											<div class="form-group">
												<input type="hidden" name="id" value="${product.id}"/>
												<button class="ps-btn ps-btn--sm">
													Gửi đánh giá<i class="ps-icon-next"></i>
												</button>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="ps-section ps-section--top-sales ps-owl-root pt-80 pb-80">
			<div class="ps-container">
				<div class="ps-section__header mb-50">
					<div class="row">
						<div class="col-lg-9 col-md-9 col-sm-12 col-xs-12 ">
							<h3 class="ps-section__title" data-mask="LIÊN QUAN">- Có thể
								bạn quan tâm</h3>
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

						<c:forEach items="${listRec}" var="item" varStatus="status">
							<div class="ps-shoes--carousel">
								<div class="ps-shoe">
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
						</c:forEach>
					</div>
				</div>
			</div>
		</div>

		<!--        //FooterForm-->
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

	<script type="text/javascript">
	function buy(id) {
		var size = document.form.chooseSize.value;
		document.form.action="addToCart?id=" + id + "&size=" + size;
		document.form.submit;
	}
	
	
	
	</script>
</body>
</html>