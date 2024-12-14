<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required Meta Tags Always Come First -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Title -->
<title>Đăng nhập</title>

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
			<a class="d-flex justify-content-center mb-5" href="index">
				<img class="z-index-2"
				src="https://upload.wikimedia.org/wikipedia/commons/1/1c/Logo_SAPO.png"
				alt="Image Description" style="width: 8rem;">
			</a>

			<div class="row justify-content-center">
				<div class="col-md-7 col-lg-5">
					<!-- Card -->
					<div class="card card-lg mb-5">
						<div class="card-body">
							<!-- Form -->
							<form action="login" method="POST" class="js-validate">
								<div class="text-center">
									<div class="mb-5">
										<h1 class="display-4">Đăng nhập</h1>
										<p>
											Bạn chưa có tài khoản? <a
												href="register.jsp"
												style="color: #2AC37D !important">Đăng ký ngay</a>
										</p>
									</div>
									<c:if test="${mess != null}">
										<script>
											alert('Tài khoản hoặc mật khẩu không chính xác');
											window.location.href = 'login.jsp';
										</script>
									</c:if>


									<span class="divider text-muted mb-4">OR</span>
								</div>

								<!-- Form Group -->
								<div class="js-form-message form-group">
									<label class="input-label" for="signinSrEmail">Tên đăng
										nhập</label> <input type="text" class="form-control form-control-lg"
										name="username" id="signinSrEmail" tabindex="1" placeholder=""
										aria-label="" required="required">
								</div>
								<!-- End Form Group -->

								<!-- Form Group -->
								<div class="js-form-message form-group">
									<label class="input-label" for="signupSrPassword" tabindex="0">
										<span
										class="d-flex justify-content-between align-items-center">
											Mật khẩu <a class="input-label-secondary"
											href="forgot-password.jsp">Quên mật
												khẩu?</a>
									</span>
									</label>

									<div class="input-group input-group-merge">
										<input type="password"
											class="js-toggle-password form-control form-control-lg"
											name="password" id="signupSrPassword" required="required"
											data-msg="Your password is invalid. Please try again."
											data-hs-toggle-password-options='{
                                 "target": "#changePassTarget",
                                 "defaultClass": "tio-hidden-outlined",
                                 "showClass": "tio-visible-outlined",
                                 "classChangeTarget": "#changePassIcon"
                               }'>
										<div id="changePassTarget" class="input-group-append">
											<a class="input-group-text" href="javascript:;"> <i
												id="changePassIcon" class="tio-visible-outlined"></i>
											</a>
										</div>
									</div>
								</div>
								<!-- End Form Group -->

								<!-- Checkbox -->
								<div class="form-group">
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input"
											id="termsCheckbox" name="termsCheckbox"> <label
											class="custom-control-label text-muted" for="termsCheckbox">
											Ghi nhớ đăng nhập</label>
									</div>
								</div>
								<!-- End Checkbox -->

								<button type="submit" class="btn btn-lg btn-block btn-primary">Đăng
									nhập</button>
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
			// INITIALIZATION OF SHOW PASSWORD
			// =======================================================
			$('.js-toggle-password').each(function() {
				new HSTogglePassword(this).init()
			});

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