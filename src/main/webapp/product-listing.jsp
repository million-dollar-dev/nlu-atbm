<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Khai báo sử dụng JSTL Core Tags -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<!--[if IE 7]>
<html class="ie ie7"><![endif]-->
<!--[if IE 8]>
<html class="ie ie8"><![endif]-->
<!--[if IE 9]>
<html class="ie ie9"><![endif]-->
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
<title>Danh sách sản phẩm</title>
<!-- Fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Archivo+Narrow:300,400,700%7CMontserrat:300,400,500,600,700,800,900"
	rel="stylesheet">
<link rel="stylesheet"
	href="plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="plugins/ps-icon/style.css">
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
<script type="module"
	src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule
	src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
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
<body class="ps-loading">
	<div class="header--sidebar"></div>
	<fmt:setLocale value="vi_VN" />
	<fmt:setBundle basename="java.text.resources.LocaleElements" />
	<!--    //HeaderForm-->
	<jsp:include page="inc/header.jsp"></jsp:include>
	<jsp:include page="inc/headerService.jsp"></jsp:include>
	<jsp:include page="inc/scrollBar.jsp"></jsp:include>
	<main class="ps-main">
		<div class="ps-products-wrap inverse pt-80 pb-80">
			<div class="ps-products" data-mh="product-listing">
				<!-- <div class="ps-product-action">
					<div class="ps-product__filter">
						<select class="ps-select selectpicker">
							<option value="1">Sắp xếp theo</option>
							<option value="2">Tên</option>
							<option value="3">Giá từ thấp đến cao</option>
							<option value="3">Giá từ cao đến thấp</option>
						</select>
					</div>
				</div> -->
				<div class="ps-section__content pb-50">
					<div class="masonry-wrapper" data-col-md="4" data-col-sm="2"
						data-col-xs="1" data-gap="30" data-radio="100%">
						<div class="ps-masonry">
							<div class="grid-sizer"></div>
							<c:forEach items="${listProduct}" var="item" varStatus="status">
								<c:if test="${item.status eq 'Đang bán'}">
									<div class="grid-item ">
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
				<div class="ps-product-action">
					<div class="ps-pagination">
						<ul class="pagination">
							<c:forEach begin="1" end="${endPage}" var="i">
								<li class="${pageTag == i ? "active" : ""}"><a
									href="${linkPage}${i}">${i}</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>

			</div>
			<div class="ps-sidebar" data-mh="product-listing">
				<aside class="ps-widget--sidebar ps-widget--category">
					<div class="ps-widget__header">
						<h3>Lọc theo hãng</h3>
					</div>
					<div class="ps-widget__content">
						<ul class="ps-list--checked">
							<li class=><a href="product-listing?id=1">Tất cả </a></li>
							<c:forEach items="${listCategory}" var="item">
								<c:if test="${tag == item.id}">
									<li class="current"><a href="category?id=${item.id}">${item.name}
								</c:if>
								<c:if test="${tag != item.id}">
									<li class=""><a href="category?id=${item.id}">${item.name}
								</c:if>
								</a>
								</li>

							</c:forEach>
						</ul>
					</div>
				</aside>
				<!-- <aside class="ps-widget--sidebar ps-widget--filter">
					<div class="ps-widget__header">
						<h3>Lọc theo giá</h3>
					</div>
					<div class="ps-widget__content">
						<ul class="ps-list--checked">
							<li class="current"><a href="">Tất cả</a></li>
							<li class=""><a href="">Dưới 1 triệu</a></li>
							<li class=""><a href="">Tầm 1 - 2 triệu</a></li>
							<li class=""><a href="">Tầm 2 - 3 triệu</a></li>
							<li class=""><a href="">Trên 3 triệu</a></li>
						</ul>
					</div>
				</aside> -->
				<!-- <div class="ps-sticky desktop">
					<aside class="ps-widget--sidebar">
						<div class="ps-widget__header">
							<h3>Lọc theo Size</h3>
						</div>
						<div class="ps-widget__content">
							<table class="table ps-table--size">
								<tbody>
									<tr>
										<td class="active">39</td>
										<td>40</td>
										<td>41</td>
										<td>42</td>
										<td>43</td>
									</tr>
								</tbody>
							</table>
						</div>
					</aside>

				</div> -->
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