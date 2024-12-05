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

<title>${sessionScope.user.role}|Danhsáchhóađơn</title>
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
<!-- bootstrap-daterangepicker -->
<link href="admin/vendors/bootstrap-daterangepicker/daterangepicker.css"
	rel="stylesheet">

<!-- Custom Theme Style -->
<link href="admin/build/css/custom.min.css" rel="stylesheet">
<link href="admin/css/shoe.css" rel="stylesheet">
<style>
.button-primary {
	-webkit-border-radius: 40px;
	-moz-border-radius: 40px;
	-ms-border-radius: 40px;
	border-radius: 40px;
	border: none;
	padding: 10px 40px;
	font-family: "Archivo Narrow", sans-serif;
	font-weight: 400;
	font-size: 16px;
	text-transform: uppercase;
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
<fmt:setLocale value="vi_VN" />
<fmt:setBundle basename="java.text.resources.LocaleElements" />
<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col">
				<jsp:include page="inc/adminScroll-view.jsp"></jsp:include>
			</div>

			<!-- top navigation -->
			<jsp:include page="inc/adminNav.jsp"></jsp:include>
			<div class="right_col" role="main">


				<div class="table-responsive-sm">
					<table id="table"
						class="table table-striped table-bordered table-sm"
						cellspacing="0" width="100%">
						<thead>
							<tr class="headings">
								<th class="th-sm column-title">Mã đơn</th>
								<th class="th-sm column-title">Khách hàng</th>
								<th class="th-sm column-title">Email</th>
								<th class="th-sm column-title">Số điện thoại</th>
								<th class="th-sm column-title">Ngày đặt hàng</th>
								<th class="th-sm column-title">Tổng tiền</th>
								<th class="th-sm column-title">Địa chỉ</th>
								<th class="th-sm column-title">Trạng thái</th>
								<th class="th-sm column-title">Xác nhận</th>
								<th class="th-sm column-title">Giao hàng</th>
								<th class="th-sm column-title">Hoàn thành</th>
								<th class="th-sm column-title">Hủy</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${listOrder}" var="item">
								<tr>
									<th scope="row">${item.id}</th>
									<th scope="row">${item.user.username}</th>
									<th scope="row">${item.user.email}</th>
									<th scope="row">${item.user.phoneNumber}</th>
									<th scope="row">${item.orderDate}</th>
									<th><fmt:formatNumber type="currency"
											value="${item.totalAmount}" currencyCode="VND" /></th>
									<th>${item.user.address}</th>
									<th scope="row">${item.orderStatus}</th>
									<c:if test="${item.orderStatus eq 'Hoàn thành' || item.orderStatus eq 'Hủy'}">
										<th><a class="btn btn-secondary disabled"
											>Xác nhận</a></th>
										<th><a class="btn btn-secondary disabled"
											>Giao hàng</a></th>
										<th><a class="btn btn-secondary disabled"
											>Hoàn thành</a></th>
										<th><a class="btn btn-danger"
											href="deleteProduct?id=${item.id}" role="button"
											onclick="return confirm('Bạn có muốn xóa sản phẩm');">Hủy</a></th>
									</c:if>
									<c:if test="${item.orderStatus ne 'Hoàn thành' && item.orderStatus ne 'Hủy'}">
										<th><a class="btn btn-warning"
											href="orderStatusChange?status=accept&id=${item.id}" role="button"
											onclick="return confirm('Bạn muốn xác nhận đơn hàng');">Xác nhận</a></th>

										<th><a class="btn btn-primary"
											href="orderStatusChange?status=ship&id=${item.id}" role="button"
											onclick="return confirm('Bạn muốn giao đơn hàng');">Giao
												hàng</a></th>
										<th><a class="btn btn-success"
											href="orderStatusChange?status=done&id=${item.id}" role="button"
											onclick="return confirm('Bạn muốn hoàn thành đơn hàng');">Hoàn
												thành</a></th>
										<th><a class="btn btn-danger"
											href="orderStatusChange?status=delete&id=${item.id}" role="button"
											onclick="return confirm('Bạn muốn hủy đơn hàng');">Hủy</a></th>
									</c:if>

								</tr>
							</c:forEach>
						</tbody>
					</table>
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

	<!-- bootstrap-progressbar -->
	<script
		src="admin/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
	<!-- iCheck -->
	<script src="admin/vendors/iCheck/icheck.min.js"></script>
	<!-- Skycons -->
	<script src="admin/vendors/skycons/skycons.js"></script>
	<!-- DateJS -->
	<script src="admin/vendors/DateJS/build/date.js"></script>
	<!-- bootstrap-daterangepicker -->
	<script src="admin/vendors/moment/min/moment.min.js"></script>
	<script
		src="admin/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>

	<!-- Custom Theme Scripts -->
	<script src="admin/build/js/custom.min.js"></script>

</body>
</html>
