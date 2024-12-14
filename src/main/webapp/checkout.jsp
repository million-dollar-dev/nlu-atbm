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
<title>Thanh Toán</title>
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
<script type="module"
	src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule
	src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
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
<body class="ps-loading">
	<div class="header--sidebar"></div>
	<!--    //HeaderForm-->
	<jsp:include page="inc/header.jsp"></jsp:include>
	<jsp:include page="inc/headerService.jsp"></jsp:include>
	<jsp:include page="inc/scrollBar.jsp"></jsp:include>
	<fmt:setLocale value="vi_VN" />
	<fmt:setBundle basename="java.text.resources.LocaleElements" />
	<main class="ps-main">
		<div class="ps-checkout pt-80 pb-80">
			<div class="ps-container">
				<form class="ps-checkout__form" action="checkoutDone" method="post">
					<div class="row">
						<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 ">
							<div class="ps-checkout__billing">
								<h3>Thông tin thanh toán</h3>
								<div class="form-group form-group--inline">
									<label>Họ và tên<span>*</span>
									</label> <input required value="" class="form-control" type="text" placeholder="Nhập tên">
								</div>
								<div class="form-group form-group--inline">
									<label>Email<span>*</span>
									</label> <input name="email" required value="${user.email}" 
										class="form-control" type="email">
								</div>
								<div class="form-group form-group--inline">
									<label>Số điện thoại<span>*</span>
									</label> <input required value="${user.phoneNumber}"
										class="form-control" type="text">
								</div>
								<div class="form-group form-group--inline">
									<label>Địa chỉ nhận hàng<span>*</span>
									</label> <select class="ps-select" id="city"
										aria-label=".form-select-sm"
										style="padding: 0 20px; height: 50px; font-size: 16px; line-height: 1.4rem; border: none; background-color: #e4e4e4 !important; outline: none; border-radius: 3px; width: 30%; margin-right: 2rem;"
										required>
										<option value="" selected>Chọn tỉnh / thành</option>
									</select> <select class="form-select" id="district" required
										style="padding: 0 20px; height: 50px; font-size: 16px; line-height: 1.4rem; border: none; background-color: #e4e4e4 !important; outline: none; border-radius: 3px; width: 30%; margin-right: 2rem;"
										aria-label=".form-select-sm">
										<option value="" selected>Chọn quận / huyện</option>
									</select> <select class="form-select" id="ward"
										aria-label=".form-select-sm" required
										style="padding: 0 20px; height: 50px; font-size: 16px; line-height: 1.4rem; border: none; background-color: #e4e4e4 !important; outline: none; border-radius: 3px; width: 30%;">
										<option value="" selected>Chọn phường / xã</option>
									</select>
								</div>
								<div class="form-group form-group--inline">
									<label>Địa chỉ<span>*</span>
									</label> <input class="form-control" type="text" required value="${user.address }"
										placeholder="Nhập địa chỉ">
								</div>
								<div class="form-group form-group--inline">
									<label>Mã giảm giá<span></span>
									</label> <input class="form-control" type="text"
										placeholder="Nhập mã giảm giá">
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 ">
							<div class="ps-checkout__order">
								<header>
									<h3>Đơn hàng của bạn</h3>
								</header>
								<div class="content">
									<table class="table ps-checkout__products">
										<thead>
											<tr>
												<th class="text-uppercase">Sản phẩm</th>
												<th class="text-uppercase">Tổng cộng</th>
											</tr>
										</thead>
										<tbody>

											<c:forEach items="${cart.items}" var="item">
												<tr>
													<td>${item.product.name}</td>
													<td><fmt:formatNumber type="currency"
															value="${(item.product.price / 100 * (100 - item.product.sale)) * item.quantity}"
															currencyCode="VND" /></td>
												</tr>

											</c:forEach>

										</tbody>
									</table>
								</div>

								<footer>
									<h3>Phương thức thanh toán</h3>
									<div class="form-group cheque">
										<div class="ps-radio">
											<input class="form-control" type="radio" id="rdo01"
												name="payment" checked> <label for="rdo01">Thanh
												toán khi nhận hàng</label>
											<p>Nhân viên sẽ liên hệ bạn qua số điện thoại để xác nhận
												địa chỉ chính xác</p>
										</div>
									</div>
									<div class="form-group paypal">
										<div class="ps-radio ps-radio--inline">
											<input class="form-control" type="radio" name="payment"
												id="rdo02"> <label for="rdo02">Chuyển khoản</label>
										</div>
										<ul class="ps-payment-method">
											<li><a href="#"><img src="images/payment/1.png"
													alt=""></a></li>
											<li><a href="#"><img src="images/payment/2.png"
													alt=""></a></li>
										</ul>
										<button name="submit_payment" class="ps-btn ps-btn--fullwidth">
											Hoàn tất đơn hàng<i class="ps-icon-next"></i>
										</button>
									</div>
								</footer>
							</div>
							<div class="ps-shipping">
								<h3>MIỄN PHÍ GIAO HÀNG</h3>
								<p>
									ĐƠN HÀNG CỦA BẠN ĐƯỢC MIỀN PHÍ VẬN CHUYỂN.<br> <a href="login.jsp">
										Đăng nhập </a> để miễn phí giao hàng.
								</p>
							</div>
						</div>
					</div>
				</form>
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
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
	<script>
    var citis = document.getElementById("city");
    var districts = document.getElementById("district");
    var wards = document.getElementById("ward");
    var Parameter = {
        url: "https://raw.githubusercontent.com/kenzouno1/DiaGioiHanhChinhVN/master/data.json",
        method: "GET",
        responseType: "application/json",
    };
    var promise = axios(Parameter);
    promise.then(function (result) {
        renderCity(result.data);
    });

    function renderCity(data) {
        for (const x of data) {
            citis.options[citis.options.length] = new Option(x.Name, x.Id);
        }
        citis.onchange = function () {
            district.length = 1;
            ward.length = 1;
            if (this.value != "") {
                const result = data.filter(n => n.Id === this.value);

                for (const k of result[0].Districts) {
                    district.options[district.options.length] = new Option(k.Name, k.Id);
                }
            }
        };
        district.onchange = function () {
            ward.length = 1;
            const dataCity = data.filter((n) => n.Id === citis.value);
            if (this.value != "") {
                const dataWards = dataCity[0].Districts.filter(n => n.Id === this.value)[0].Wards;

                for (const w of dataWards) {
                    wards.options[wards.options.length] = new Option(w.Name, w.Id);
                }
            }
        };
    }
</script>
</body>
</html>