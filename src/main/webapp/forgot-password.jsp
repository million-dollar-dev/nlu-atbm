<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<html lang="en">
<head>
<!-- Required Meta Tags Always Come First -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Title -->
<title>Quên mật khẩu</title>

<!-- Favicon -->
<link rel="shortcut icon" href="favicon.png">

<!-- Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&display=swap"
	rel="stylesheet">

<!-- CSS Implementing Plugins -->
<link rel="stylesheet" href="assets\css\vendor.min.css">
<link rel="stylesheet" href="assets\vendor\icon-set\style.css">

<!-- CSS Front Template -->
<link rel="stylesheet" href="assets\css\theme.min.css?v=1.0">
<style type="text/css">
a:hover {
	color: #2AC37D !important;
	text-decoration: none;
}

.btn-primary {
	color: #fff;
	background-color: #2AC37D !important;
	border-color: #2AC37D !important;
}

.btn-primary:hover {
	color: #fff;
	background-color: #31E693 !important;
	border-color: #31E693 !important;
}

.custom-control-input:checked ~.custom-control-label::before {
	color: #fff;
	border-color: #2AC37D !important;
	background-color: #2AC37D !important;
}
</style>
</head>

<body>
	<!-- ========== MAIN CONTENT ========== -->
	<main id="content" role="main" class="main">
		<div class="position-fixed top-0 right-0 left-0 bg-img-hero"
			style="height: 32rem; background-image: url(assets/svg/components/abstract-bg-4.png);">
			<!-- SVG Bottom Shape -->
			<figure class="position-absolute right-0 bottom-0 left-0">
				<svg preserveaspectratio="none" xmlns="http://www.w3.org/2000/svg"
					x="0px" y="0px" viewbox="0 0 1921 273">
            <polygon fill="#fff" points="0,273 1921,273 1921,0 "></polygon>
          </svg>
			</figure>
			<!-- End SVG Bottom Shape -->
		</div>

		<!-- Content -->
		<div class="container py-5 py-sm-7">
			<a class="d-flex justify-content-center mb-5" href="index"> <img
				class="z-index-2"
				src="https://upload.wikimedia.org/wikipedia/commons/1/1c/Logo_SAPO.png"
				alt="Image Description" style="width: 8rem;">
			</a>

			<div class="row justify-content-center">
				<div class="col-md-7 col-lg-5">
					<!-- Card -->
					<div class="card card-lg mb-5">
						<div class="card-body">
							<!-- Form -->
							<form action="forgotPassword" method="POST" class="js-validate">
								<div class="text-center">
									<div class="mb-5">
										<h1 class="display-4">Quên mật khẩu?</h1>
										<p>Nhập địa chỉ email bạn đã sử dụng khi đăng ký và chúng
											tôi sẽ gửi cho bạn hướng dẫn để đặt lại mật khẩu.</p>
									</div>
								</div>

								<!-- Form Group -->
								<div class="js-form-message form-group">
									<label class="input-label" for="resetPasswordSrEmail"
										tabindex="0">Email</label> <input type="email"
										class="form-control form-control-lg" name="email"
										id="resetPasswordSrEmail" tabindex="1"
										placeholder="Enter your email address"
										aria-label="Enter your email address" required=""
										data-msg="Please enter a valid email address.">
								</div>
								<!-- End Form Group -->

								<button type="submit" class="btn btn-lg btn-block btn-primary" onclick="return alert('Gửi thành công, kiểm tra email của bạn');">Gửi</button>

								<div class="text-center mt-2">
									<a style="color: #2AC37D !important" class="btn btn-link" href="login.jsp"> <i
										class="tio-chevron-left"></i> Trở về đăng nhập
									</a>
								</div>
							</form>
							<!-- End Form -->
						</div>
					</div>
					<!-- End Card -->


				</div>
			</div>
		</div>
		<!-- End Content -->
	</main>
	<!-- ========== END MAIN CONTENT ========== -->


	<!-- JS Implementing Plugins -->
	<script src="assets\js\vendor.min.js"></script>

	<!-- JS Front -->
	<script src="assets\js\theme.min.js"></script>

	<!-- JS Plugins Init. -->
	<script>
		$(document).on('ready', function() {
			// INITIALIZATION OF FORM VALIDATION
			// =======================================================
			$('.js-validate').each(function() {
				$.HSCore.components.HSValidation.init($(this));
			});
		});
	</script>

	<!-- IE Support -->
	<script>
		if (/MSIE \d|Trident.*rv:/.test(navigator.userAgent))
			document
					.write('<script src="./assets/vendor/babel-polyfill/polyfill.min.js"><\/script>');
	</script>
</body>
</html>