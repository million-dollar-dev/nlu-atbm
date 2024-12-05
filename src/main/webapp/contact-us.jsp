<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Khai báo sử dụng JSTL Core Tags -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<title>Liên hệ</title>
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
<body class="ps-loading">
	<div class="header--sidebar"></div>
	<!--    //HeaderForm-->
	<jsp:include page="inc/header.jsp"></jsp:include>
	<jsp:include page="inc/headerService.jsp"></jsp:include>
	<jsp:include page="inc/scrollBar.jsp"></jsp:include>
	<main class="ps-main">
		<jsp:include page="inc/banner.jsp"></jsp:include>
		<div class="ps-contact ps-section pb-80 pt-80">

			<div class="ps-container">
				<div class="row">
					<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 ">
						<div class="ps-section__header mb-50">
							<h2 class="ps-section__title" data-mask="Liên hệ">- Liên hệ</h2>
							<form class="ps-contact__form" action="" method="post">
								<div class="row">
									<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 ">
										<div class="form-group">
											<label>Tên <sub>*</sub></label> <input name="name"
												class="form-control" type="text" placeholder="">
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 ">
										<div class="form-group">
											<label>Email <sub>*</sub></label> <input name="email"
												class="form-control" type="email" placeholder="">
										</div>
									</div>
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
										<div class="form-group mb-25">
											<label>Góp ý của bạn <sub>*</sub></label>
											<textarea name="content" class="form-control" rows="6"></textarea>
										</div>
										<div class="form-group">
											<button name="send_email" class="ps-btn">
												Gửi góp ý<i class="ps-icon-next"></i>
											</button>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 ">
						<div class="ps-section__content">
							<div class="row">
								<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 ">
									<div class="ps-contact__block" data-mh="contact-block">
										<header>
											<h3>
												SAPO <span> Shop giày bóng đá</span>
											</h3>
										</header>
										<footer>
											<p>
												<i class="fa fa-check"></i> Cam kết chính hãng
											</p>
											<p>
												<i class="fa fa-shield"></i> Chính sách chăm sóc khách hàng
											</p>
											<p>
												<i class="fa fa-truck"></i> Giao hàng toàn quốc
											</p>
										</footer>
									</div>
								</div>
								<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 ">
									<div class="ps-contact__block" data-mh="contact-block">
										<header>
											<h3>
												HỖ TRỢ <span> tư vấn và đặt hàng</span>
											</h3>
										</header>
										<footer>
											<p>
												<i class="fa fa-phone"></i>011 111 1234
											</p>
											<p>Tất cả ngày trong tuần (Trừ tết Âm lịch)</p>
											<p>
												<i class="fa fa-envelope-o"></i><a
													href="123@gmail.com">sapo123@gmail.com</a>
											</p>

										</footer>
									</div>
								</div>
								<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 ">
									<div class="ps-contact__block" data-mh="contact-block">
										<header>
											<h3>
												CHI NHÁNH 1 <span> Chính</span>
											</h3>
										</header>
										<footer>
											<p>
												<i class="fa fa-map-marker"></i> 87-89 Hồ Văn Huê, P9, Q.Phú
												Nhuận, TP.HCM
											</p>
											<p>
												<i class="fa fa-envelope-o"></i><a
													href="cskh1@padostore.com">cskh1@padostore.com</a>
											</p>
											<p>
												<i class="fa fa-phone"></i> ( +84 ) 9892 2324 - 9401 123 003
											</p>
										</footer>
									</div>
								</div>
								<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 ">
									<div class="ps-contact__block" data-mh="contact-block">
										<header>
											<h3>
												CHI NHÁNH 2 <span> Phụ</span>
											</h3>
										</header>
										<footer>
											<p>
												<i class="fa fa-map-marker"></i> 415 An Dương Vương, P10,
												Q.6., TP.HCM
											</p>
											<p>
												<i class="fa fa-envelope-o"></i><a
													href="cskh2@padostore.com">cskh2@padostore.com</a>
											</p>
											<p>
												<i class="fa fa-phone"></i> 09892 2324
											</p>
										</footer>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
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