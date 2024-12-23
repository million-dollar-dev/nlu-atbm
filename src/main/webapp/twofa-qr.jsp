<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required Meta Tags Always Come First -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Title -->
<title>Kích hoạt xác thực 2 bước</title>

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

.otp-field {
	flex-direction: row;
	column-gap: 10px;
	display: flex;
	align-items: center;
	justify-content: center;
}

.otp-field input {
	height: 45px;
	width: 42px;
	border-radius: 6px;
	outline: none;
	font-size: 1.125rem;
	text-align: center;
	border: 1px solid #ddd;
}

.otp-field input:focus {
	box-shadow: 0 1px 0 rgba(0, 0, 0, 0.1);
}

.otp-field input::-webkit-inner-spin-button, .otp-field input::-webkit-outer-spin-button
	{
	display: none;
}
</style>
</head>

<body>
	<!-- ========== MAIN CONTENT ========== -->
	<main id="content" role="main" class="main">
		<!-- Content -->
		<div class="container">
			<a class="position-absolute top-0 left-0 right-0" href="index"> <img
				class="avatar avatar-xl avatar-4by3 avatar-centered"
				src="https://www.sapo.pt/assets/img/homepage-sapo/facebook.jpg"
				alt="Image Description">
			</a>

			<div
				class="footer-height-offset d-flex justify-content-center align-items-center flex-column">
				<div class="row align-items-sm-center w-100">
					<div class="col-sm-6">
						<div class="text-center text-sm-right mr-sm-4 mb-5 mb-sm-0">
							<img class="w-60 w-sm-100 mx-auto"
								src="assets\svg\illustrations\unlock.svg"
								alt="Image Description" style="max-width: 15rem;">
						</div>
					</div>

					<form action="verifyOTP" method="post" id="verifyForm"
						class="col-sm-6 col-md-4 text-center text-sm-left rounded border mt-8">
						<div class="d-flex justify-content-center mt-4 mb-4">
							<h3 class="display-4 mb-0">Kích hoạt 2FA</h3>
						</div>

						<p class="">Quét QR Code sau với các ứng dụng
							Authenticator(Google Authenticator, Microsoft Authenticator,...)
							và điền mã 6 chữ số nhận được để kích hoạt xác thực 2 bước.</p>
						<div class="d-flex justify-content-center">
							<img src="data:image/png;base64,${qrCodeBase64}" alt="QR Code" />
						</div>
						<div class="otp-field mb-4">
							<input type="number" /> <input type="number" maxlength="1"
								disabled /> <input type="number" maxlength="1" disabled /> <input
								type="number" maxlength="1" disabled /> <input type="number"
								maxlength="1" disabled /> <input type="number" maxlength="1"
								disabled />
						</div>
						<input type="hidden" id="otp-value" name="otp" value="" /> <input
							type="hidden" id="otp-type" name="otp-type" value="enable2FA" />
						<input type="hidden" id="userId" name="userId" value="${userId}" />
						<div id="responseMessage" class="alert alert-danger" role="alert" style="display: none;"></div>
						<div class="d-flex justify-content-center">
							<button class="btn btn-primary mb-3">Xác thực</button>
						</div>
					</form>

				</div>
				<!-- End Row -->
			</div>
		</div>
		<!-- End Content -->

		<!-- Footer -->

		<!-- End Footer -->
	</main>
	<!-- ========== END MAIN CONTENT ========== -->


	<!-- JS Front -->
	<script src="assets\js\theme.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<!-- IE Support -->

	<script>
		if (/MSIE \d|Trident.*rv:/.test(navigator.userAgent))
			document
					.write('<script src="./assets/vendor/babel-polyfill/polyfill.min.js"><\/script>');
		
		document.addEventListener("DOMContentLoaded", () => {
		    const inputs = document.querySelectorAll(".otp-field input");
		    const hiddenInput = document.getElementById("otp-value");
		    inputs.forEach((input, index) => {
		        input.addEventListener("input", (e) => {
		            const value = e.target.value;
		            // Chỉ cho phép 1 ký tự và chuyển sang ô tiếp theo
		            if (value.length > 1) {
		                e.target.value = value[0]; // Lấy ký tự đầu tiên nếu người dùng nhập nhiều ký tự
		            }
		            if (value !== "" && index < inputs.length - 1) {
		                inputs[index + 1].disabled = false;
		                inputs[index + 1].focus(); // Chuyển sang ô tiếp theo
		            }
		            
		            updateHiddenInput();
		        });

		        // Khi bấm phím Backspace, quay lại ô trước
		        input.addEventListener("keydown", (e) => {
		            if (e.key === "Backspace" && input.value === "" && index > 0) {
		                inputs[index - 1].disabled = false;
		                inputs[index - 1].focus(); // Quay lại ô trước
		            }
		        });
		        
		        function updateHiddenInput() {
		            let otp = "";
		            inputs.forEach((input) => {
		                otp += input.value || ""; // Ghép giá trị của các ô input
		            });
		            hiddenInput.value = otp; // Gán giá trị vào input hidden
		        }
		    });

		    // Kích hoạt ô đầu tiên
		    inputs[0].disabled = false;
		    inputs[0].focus();
		});
	</script>

	<script>
	
    $(document).ready(function () {
        $("#verifyForm").submit(function (event) {
            event.preventDefault(); // Ngăn biểu mẫu gửi trực tiếp

            const otp = $("#otp-value").val();
            const userId = $("#userId").val();
            $.ajax({
                url: "verifyOTP", // Servlet VerifyServlet
                type: "POST",
                data: { otp: otp, userId: userId},
                success: function (response) {
                    if (response === "success") {
                    	alert('Tài khoản hoặc mật khẩu không chính xác');
                        window.location.href = "yourInfo.jsp";
                    } else {
                        $("#responseMessage").text(response).show();
                    }
                },
                error: function () {
                    $("#responseMessage").text("Đã xảy ra lỗi khi gửi yêu cầu xác thực.").show();
                }
            });
        });
    });

	</script>
</body>
</html>