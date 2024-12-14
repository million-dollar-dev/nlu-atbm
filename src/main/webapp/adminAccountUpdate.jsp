<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Khai báo sử dụng JSTL Core Tags -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="admin/favicon.png" type="image/ico" />

<title>${sessionScope.user.role}| Cập nhật tài khoản</title>
<link
	href="https://fonts.googleapis.com/css?family=Archivo+Narrow:300,400,700%7CMontserrat:300,400,500,600,700,800,900"
	rel="stylesheet">
<!-- Bootstrap -->
<link href="admin/vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link href="admin/vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- NProgress -->
<link href="admin/vendors/nprogress/nprogress.css" rel="stylesheet">
<!-- iCheck -->
<link href="admin/vendors/iCheck/skins/flat/green.css" rel="stylesheet">

<!-- bootstrap-progressbar -->
<link
	href="admin/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css"
	rel="stylesheet">
<!-- JQVMap -->
<link href="admin/vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet" />
<!-- bootstrap-daterangepicker -->
<link href="admin/vendors/bootstrap-daterangepicker/daterangepicker.css"
	rel="stylesheet">

<!-- Custom Theme Style -->
<link href="admin/build/css/custom.min.css" rel="stylesheet">
<link href="css/shoe.css" rel="stylesheet">
<script
	src="https://cdn.ckeditor.com/ckeditor5/35.3.2/classic/ckeditor.js"></script>

<style>
.button-primary {
	-webkit-border-radius: 40px;
	-moz-border-radius: 40px;
	-ms-border-radius: 40px;
	border-radius: 40px;
	border: none;
	font-family: "Archivo Narrow", sans-serif;
	font-weight: 400;
	font-size: 16px;
	padding: 10px 40px;
	letter-spacing: .05em;
	background-color: #2AC37D;
	color: #fff;
	-webkit-transition: all 0.4s ease;
	-moz-transition: all 0.4s ease;
	transition: all 0.4s ease;
}

.button-primary:hover {
	background-color: #2AC37D;
	opacity: 0.75;
}
</style>

</head>

<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col">
				<jsp:include page="inc/adminScroll-view.jsp"></jsp:include>
			</div>

			<!-- top navigation -->
			<jsp:include page="inc/adminNav.jsp"></jsp:include>
			<div class="right_col" role="main">
				<a class="button-primary btn btn-primary" href="readUser"
					role="button">Trở về</a>
				<div class="col-md-12 col-sm-12">
					<div class="x_panel">
						<div class="x_content">
							<form action="updateUserDone" method="post">

								<span class="section">Thông tin tài khoản</span>
								<div class="field item form-group">
									<label class="col-form-label col-md-3 col-sm-3  label-align">Tên
										đăng nhập<span class="required">*</span>
									</label>
									<div class="col-md-6 col-sm-6">
										<input class="form-control" data-validate-length-range="6"
											data-validate-words="2" name="username" value="${user.username}"
											required />
									</div>
								</div>
								
								<div class="field item form-group">
									<label class="col-form-label col-md-3 col-sm-3  label-align">Email
										<span class="required" >*</span>
									</label>
									<div class="col-md-6 col-sm-6">
										<input class="form-control" name="email" type="email" 
											required='required' required value="${user.email}">
									</div>
								</div>
								<div class="field item form-group">
									<label class="col-form-label col-md-3 col-sm-3  label-align">Số
										điện thoại <span class="required">*</span>
									</label>
									<div class="col-md-6 col-sm-6">
										<input class="form-control" name="phoneNumber" type="text"
											required='required' required value="${user.phoneNumber}">
									</div>
								</div>
								<div class="field item form-group">
									<label class="col-form-label col-md-3 col-sm-3  label-align">Địa
										chỉ <span class="required">*</span>
									</label>
									<div class="col-md-6 col-sm-6">
										<input class="form-control" name="address" type="text"
											required='required' required value="${user.address}">
									</div>
								</div>
								<div class="field item form-group">
									<label class="col-form-label col-md-3 col-sm-3  label-align">Role<span
										class="required">*</span></label>
									<div class="col-md-6 col-sm-6">
										<select name="role" class="form-control" required>
										<c:if test="${user.role eq  ADMIN}">
											<option selected="selected" value="ADMIN">Quản trị viên</option>
										</c:if>
										<c:if test="${user.role eq  SELLER}">
											<option selected="selected" value="SELLER">Nhân viên bán hàng</option>
										</c:if>
										<c:if test="${user.role eq  CUSTOMER}">
											<option selected="selected" value="CUSTOMER">Khách hàng</option>
										</c:if>
										<c:if test="${user.role ne ADMIN}">
											<option value="ADMIN">Quản trị viên</option>
										</c:if>
										<c:if test="${user.role ne  SELLER}">
											<option value="SELLER">Nhân viên bán hàng</option>
										</c:if>
										<c:if test="${user.role ne  CUSTOMER}">
											<option value="CUSTOMER">Khách hàng</option>
										</c:if>
											
										</select>
									</div>
								</div>
								<input type="hidden" name="id" value="${user.userId}">
								<c:if test="${mess != null}">
									<script>
										alert("Tên đăng nhập đã tồn tại hoặc số điện thoại không hợp lệ");
										window.location.href = 'readUser';
									</script>
								</c:if>
								<div class="ln_solid">
									<div class="form-group">
										<div class="col-md-6 offset-md-3">
											<button type='submit' class="btn btn-primary button-primary">Cập nhật</button>
											<button type='reset' class="btn btn-success button-primary">Làm
												mới</button>
										</div>
									</div>
								</div>
								
							</form>
						</div>
					</div>
				</div>

			</div>
			<jsp:include page="inc/adminFooter.jsp"></jsp:include>
			<!-- /footer content -->
		</div>
	</div>

	<!-- jQuery -->
	<script src="admin/vendors/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="admin/vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<!-- FastClick -->
	<script src="admin/vendors/fastclick/lib/fastclick.js"></script>
	<!-- NProgress -->
	<script src="admin/vendors/nprogress/nprogress.js"></script>
	<!-- Chart.js -->
	<script src="admin/vendors/Chart.js/dist/Chart.min.js"></script>
	<!-- gauge.js -->
	<script src="admin/vendors/gauge.js/dist/gauge.min.js"></script>
	<!-- bootstrap-progressbar -->
	<script
		src="admin/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
	<!-- iCheck -->
	<script src="admin/vendors/iCheck/icheck.min.js"></script>
	<!-- Skycons -->
	<script src="admin/vendors/skycons/skycons.js"></script>
	<!-- Flot -->
	<script src="admin/vendors/Flot/jquery.flot.js"></script>
	<script src="admin/vendors/Flot/jquery.flot.pie.js"></script>
	<script src="admin/vendors/Flot/jquery.flot.time.js"></script>
	<script src="admin/vendors/Flot/jquery.flot.stack.js"></script>
	<script src="admin/vendors/Flot/jquery.flot.resize.js"></script>
	<!-- Flot plugins -->
	<script src="admin/vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
	<script src="admin/vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
	<script src="admin/vendors/flot.curvedlines/curvedLines.js"></script>
	<!-- DateJS -->
	<script src="admin/vendors/DateJS/build/date.js"></script>
	<!-- JQVMap -->
	<script src="admin/vendors/jqvmap/dist/jquery.vmap.js"></script>
	<script src="admin/vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
	<script
		src="admin/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
	<!-- bootstrap-daterangepicker -->
	<script src="admin/vendors/moment/min/moment.min.js"></script>
	<script
		src="admin/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>

	<!-- Custom Theme Scripts -->
	<script src="admin/build/js/custom.min.js"></script>

</body>
</html>
