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
<title>Thông tin tài khoản</title>
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
<style>
.hidden {
	display: none;
}

.text-white-add {
	color: white;
	!
	important
}

.custom-btn {
	background-color: #28a745; /* Màu xanh lá */
	color: white;
	border-radius: 30px; /* Bo góc */
	padding: 15px 30px; /* Khoảng cách bên trong */
	border: none; /* Loại bỏ viền */
	font-weight: bold;
	display: inline-flex; /* Sắp xếp icon và chữ */
	align-items: center; /* Căn giữa */
	text-transform: uppercase; /* Chữ in hoa */
	margin-bottom: 16px;
	!
	important
}

.custom-btn-form {
	background-color: #28a745; /* Màu xanh lá */
	color: white;
	border-radius: 30px; /* Bo góc */
	padding: 8px 16px; /* Khoảng cách bên trong */
	border: none; /* Loại bỏ viền */
	font-weight: bold;
	display: inline-flex; /* Sắp xếp icon và chữ */
	align-items: center; /* Căn giữa */
	text-transform: uppercase; /* Chữ in hoa */
	margin-top: 4px;
}

.custom-btn-form:hover {
	background-color: #218838; /* Màu khi hover */
}

.custom-btn i {
	margin-left: 8px; /* Khoảng cách giữa chữ và icon */
}

.custom-btn:hover {
	background-color: #218838; /* Màu khi hover */
}

.modal-dialog {
	margin-top: 8%;
}

.modal-header {
	display: flex;
	justify-content: center;
	align-items: center;
	position: relative;
	border-bottom: 1px solid #dee2e6;
}

.modal-title {
	font-weight: 500;
	text-transform: uppercase;
}

.load-key-btn {
	position: absolute;
	right: 15px;
}

.overlay {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	z-index: 1040;
}

.create-suc {
	background-color: #d4edda;
	!
	important
}
</style>
<body class="ps-loading">
	<div class="overlay" id="pageOverlay" style="display: none;"></div>
	<div class="header--sidebar"></div>
	<!--    //HeaderForm-->
	<jsp:include page="inc/header.jsp"></jsp:include>
	<jsp:include page="inc/headerService.jsp"></jsp:include>
	<jsp:include page="inc/scrollBar.jsp"></jsp:include>
	<main class="ps-main">
		<div class="ps-checkout pt-80 pb-80">
			<div class="ps-container">
				<div class="ps-checkout__form">
					<div class="row">
						<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 ">
							<div class="ps-checkout__billing">
								<h3>Thông tin tài khoản</h3>
								<form action="updateInfoUser" method="post">
									<div class="form-group form-group--inline">
										<label>Email<span></span>
										</label> <input id="emailInput" name="email" required
											value="${user.email}" class="form-control" type="email">
									</div>
									<div class="form-group form-group--inline">
										<label>Số điện thoại<span></span>
										</label> <input id="phoneInput" name="phone" required
											value="${user.phoneNumber}" class="form-control" type="text">
									</div>
									<div class="form-group form-group--inline">
										<label>Địa chỉ<span></span>
										</label> <input id="addressInput" name="address" required
											value="${user.address }" class="form-control" type="text">
									</div>
									<input type="hidden" name="id" value="${user.userId}">
									<button type="submit" id="updateBtn" name=""
										class="ps-btn hidden">Cập nhật</button>

								</form>
								<h3>Application Keys</h3>
								<div class="ps-contact__block" data-mh="contact-block">
									<header>
										<h3>
											Master key <span> Chính</span>
										</h3>
									</header>
									<footer>
										<p>
											<i class="fa fa-info"></i> <label>Key ID: </label> 123
										</p>
										<p>
											<i class="fa fa-key"></i><label>Public key: </label>
											123321312321
										</p>
										<p>
											<i class="fa fa-clock-o"></i><label>Expiration: </label>
											12-12-1999
										</p>

										<button type="submit" class="custom-btn" id="showPopupBtn">
											Tạo master key mới <i class="ps-icon-next"></i>
										</button>
										<div class="alert alert-warning mt-8">
											<strong>Lưu ý:</strong> Tạo key mới sẽ sẽ hủy key cũ ngay lập
											tức.
										</div>
									</footer>
								</div>
								<div class="ps-contact__block create-suc"
									data-mh="contact-block">
									<header>
										<div class="alert alert-info" role="alert">
											<strong>Thành công!</strong> Application key của bạn đã được
											tạo.<strong>Nó chỉ xuất hiện ở đây 1 lần</strong>
										</div>
									</header>
									<footer>
										<p>
											<i class="fa fa-info"></i> <label>Key ID: </label> 123
										</p>
										<p>
											<i class="fa fa-key"></i><label>Public key: </label>
											123321312321
										</p>
										<p>
											<i class="fa fa-key"></i><label>Secret key: </label>
											123321312321
										</p>
										<p>
											<i class="fa fa-clock-o"></i><label>Expiration: </label>
											12-12-1999
										</p>

										<div class=""
											style="display: flex; justify-content: space-between; align-items: center;">
											<button type="submit" class="custom-btn" id="copyKey">
												Copy to clipboard <i class="fa fa-clone"> </i> 
											</button>
											<button type="submit" class="custom-btn" id="downKey">
												Tải xuống file <i class="fa fa-download"></i>
											</button>
										</div>

									</footer>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 ">
							<div class="ps-checkout__order">
								<header>
									<h3>Quy định về an toàn bảo mật</h3>
								</header>
								<div class="content">
									<h3 class="mb-4">Public Key và Secret Key</h3>
									<p class="mb-4 text-white-add">Được lưu theo cặp public và
										secret key, sử dụng để xác nhận quyền truy cập của hệ thống.</p>
									<div class="mb-4 text-white-add">
										<p class="text-white-add">Public Key:</p>
										<p class="text-white-add">- Công khai, dùng để xác định và
											chia sẻ thông tin đơn hàng, xác thực chữ ký một cách an toàn.</p>
									</div>

									<div class="mb-4">
										<p>Secret Key:</p>
										<p class="text-white-add">- Riêng tư, dùng để xác nhận đơn
											hàng và tạo chữ ký điện tử một cách an toàn.</p>
										<p class="text-white-add">- Chỉ hiển thị một lần khi tạo,
											cần lưu trữ an toàn.</p>
										<p class="text-white-add">- Khi tạo Secret Key mới, các
											key cũ sẽ bị vô hiệu hóa..</p>
									</div>

									<div class="mb-4">
										<h3>Khi nào sử dụng Public Key và Secret Key</h3>
										<div class="mb-4">
											<p>- Public key: dùng để xác định và chia sẻ thông tin
												một cách an toàn.</p>
											<p>- Secret key: cho các yêu cầu không nhạy cảm hoặc cần
												xác minh danh tính.</p>
										</div>
									</div>

									<div class="mb-4">
										<h3>Cách tạo và sử dụng key</h3>
										<div class="mb-4">
											<p>Public Key:</p>
											<p>- Công khai, dùng để xác định và chia sẻ thông tin một
												cách an toàn.</p>
											<p>- Thích hợp cho các yêu cầu không nhạy cảm hoặc cần
												xác minh danh tính.</p>
										</div>
									</div>

									<div class="alert alert-warning">
										<strong>Lưu ý:</strong> Khi sao chép các key, kiểm tra để đảm
										bảo không có ký tự ẩn gây lỗi. Nếu phát hiện lộ secret có thể report phía dưới.
									</div>

									<p class="mt-4">Nếu cần hỗ trợ hoặc hướng dẫn thêm, vui
										lòng liên hệ đội ngũ kỹ thuật của bạn.</p>
								</div>
							</div>
							<div class="ps-shipping">
								<h3>HỖ TRỢ KHI LỘ SECRET KEY</h3>
								<p >
									VUI LÒNG ẤN LINK SAO ĐỂ NHẬN ĐƯỢC MAIL HỖ TRỢ<br> <a
										href="login.jsp"><i class="fa fa-headphones" aria-hidden="true"></i> <strong>Nhận hộ trợ</strong> </a><br> 
								</p>
								<div class="alert alert-warning">
										<strong>Lưu ý:</strong> Nếu không thấy mail có thể kiểm tra mục spam. Hãy đọc kỹ mail để được hướng dẫn.
									</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="modal d-block" tabindex="1" style="display: none;"
			id="popupModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header form-header">
						<h3 class="modal-title">Thêm Application Key</h3>
						<button class="custom-btn-form load-key-btn">Load Key từ
							file</button>
					</div>
					<div class="modal-body">
						<form>
							<div class="mb-3">
								<label class="form-label">Thuật toán tạo key:</label>
								<div>
									<div class="form-check">
										<input class="form-check-input" type="radio" name="accessType"
											id="rsa" value="RSA" checked> <label
											class="form-check-label" for="rsa">RSA</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="radio" name="accessType"
											id="dsa" value="DSA"> <label class="form-check-label"
											for="dsa">DSA</label>
									</div>
								</div>
							</div>
							<div class="mb-3">
								<label for="keySize" class="form-label">Kích thước key:</label>
								<select class="form-select" id="keySize">

								</select>
							</div>
							<div class="mb-3">
								<label for="validDuration" class="form-label">Duration
									(seconds): (optional)</label> <input type="number" class="form-control"
									id="validDuration"
									placeholder="Positive integer less than 1000 days (in seconds)">
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="custom-btn-form">Tạo key mới</button>
						<button type="button" class="custom-btn-form btn-danger bg-danger"
							id="cancelBtn">Hủy</button>
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
	<script>
		const emailInput = document.getElementById("emailInput");
		const phoneInput = document.getElementById("phoneInput");
		const addressInput = document.getElementById("addressInput");

		const updateBtn = document.getElementById("updateBtn");

		const initialEmail = emailInput.value;
		const initialPhone = phoneInput.value;
		const initialAddress = addressInput.value;

		function checkForChanges() {
			if (emailInput.value !== initialEmail
					|| phoneInput.value !== initialPhone
					|| addressInput !== initialAddress) {
				updateBtn.classList.remove("hidden");

			} else {
				updateBtn.classList.add("hidden");
			}
		}
		emailInput.addEventListener("input", checkForChanges);
		phoneInput.addEventListener("input", checkForChanges);
		addressInput.addEventListener("input", checkForChanges);
		
		
		// Mapping for dropdown options based on selected algorithm
	    const keySizes = {
	        RSA: ["2048", "3072", "4096"],
	        DSA: ["1024", "2048", "3072"]
	    };

	    // Elements
	    const rsaRadio = document.getElementById("rsa");
	    const dsaRadio = document.getElementById("dsa");
	    const keySizeDropdown = document.getElementById("keySize");

	    // Function to update dropdown options
	    function updateDropdownOptions(algorithm) {
	        // Clear existing options
	        keySizeDropdown.innerHTML = "";

	        // Populate new options based on selected algorithm
	        keySizes[algorithm].forEach(size => {
	            const option = document.createElement("option");
	            option.value = size;
	            option.textContent = size;
	            keySizeDropdown.appendChild(option);
	        });
	    }

	    // Event listeners for radio buttons
	    rsaRadio.addEventListener("change", () => updateDropdownOptions("RSA"));
	    dsaRadio.addEventListener("change", () => updateDropdownOptions("DSA"));

	    // Initialize dropdown with default selection
	    updateDropdownOptions("RSA");
	    
	    const popupModal = document.getElementById("popupModal");
	    const showPopupBtn = document.getElementById("showPopupBtn");
	    const cancelBtn = document.getElementById("cancelBtn");
	    const pageOverlay = document.getElementById("pageOverlay");
	    
	 // Show popup
	    showPopupBtn.addEventListener("click", () => {
	    	popupModal.style.display = "block";
	        pageOverlay.style.display = "block";
	    });

	    // Hide popup
	    cancelBtn.addEventListener("click", () => {
	    	popupModal.style.display = "none";
	        pageOverlay.style.display = "none";
	    });
	</script>
</body>
</html>