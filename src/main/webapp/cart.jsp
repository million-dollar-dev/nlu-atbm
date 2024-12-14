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
<title>Giỏ Hàng</title>
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
<!-- Custom-->
<link rel="stylesheet" href="css/style.css">
<style>
.styled-button {
	display: inline-block;
	display: inline-block;
	padding: 10px;
	text-align: center;
	text-decoration: none;
	font-size: 16px;
	font-weight: bold;
	cursor: pointer;
	transition: background-color 0.3s ease;
	border: none;
	color: white;
	background-color: #2AC37D;
	border-radius: 50%; /* Bo tròn góc để tạo hình tròn */
	width: 30px;
	height: 30px;
	line-height: 10px;
}

.styled-button:hover {
	background-color: #2AC37D;
	color: white;
}
</style>
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
	<!--    //HeaderForm-->
	<jsp:include page="inc/header.jsp"></jsp:include>
	<jsp:include page="inc/headerService.jsp"></jsp:include>
	<jsp:include page="inc/scrollBar.jsp"></jsp:include>
	<main class="ps-main">
		<div class="ps-content pt-80 pb-80">
			<div class="ps-container">
				<div class="ps-cart-listing">
					
						<table class="table ps-cart__table">
							<thead>
								<tr>
									<th>Sản phẩm</th>
									<th>Giá</th>
									<th></th>
									<th>Giảm giá</th>
									<th></th>
									<th>Size</th>
									<th></th>
									<th>Số lượng</th>
									<th></th>
									<!-- <th>Quantity</th> -->
									<th>Tổng</th>
								</tr>
							</thead>
							<tbody>
								<fmt:setLocale value="vi_VN" />
								<fmt:setBundle basename="java.text.resources.LocaleElements" />
								<c:set var="data" value="${requestScope.cart}"></c:set>
								<c:forEach items="${data.items}" var="item">
									<tr>
										<td><a class="ps-product__preview"
											href="product-detail?id=${item.product.id}"><img
												width="100" class="mr-15"
												src="imageShoe/${item.product.images[0].path}" alt="">${item.product.name}</a></td>
										<td><span> </span><span id=""><fmt:formatNumber
													type="currency" value="${item.product.price}"
													currencyCode="VND" /></td>
										<td></td>
										<td style="color: red"><span id=""> </span><span>
												-${item.product.sale}%</span></td>
										<td></td>
										<td><span>${item.size}</span></td>
										<td></td>
										<td><span> <a class="styled-button"
												href="cartProcess?num=-1&id=${item.product.id}&size=${item.size}">-</a>
												${item.quantity} <a class="styled-button"
												href="cartProcess?num=1&id=${item.product.id}&size=${item.size}">+</a>
										</span></td>
										<td></td>
										<td><span id=""><fmt:formatNumber type="currency"
													value="${(item.product.price / 100 * (100 - item.product.sale)) * item.quantity}"
													currencyCode="VND" /></span></td>
										<td></td>
										
										<td>
										<form action="cartProcess" method="POST">
												<input type="hidden" name="id" value="${item.product.id}" />
												<input type="hidden" name="size" value="${item.size}" />
												<input type="hidden" name="quantity" value="${item.quantity}" />
												<input style="border: none" class="ps-remove" type="submit"
													value="x" />
											</form>
										</td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
						<div class="ps-cart__actions">
							<div class="ps-cart__promotion"></div>
							<div class="ps-cart__total">
								<h3>
									Tổng tiền: <span id="totalPrice"><fmt:formatNumber
											type="currency" value="${cart.totalAmount}"
											currencyCode="VND" /></span>
								</h3>
								<a href="checkout" class="ps-btn">Thanh toán<i
									class="ps-icon-next"></i></a>
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