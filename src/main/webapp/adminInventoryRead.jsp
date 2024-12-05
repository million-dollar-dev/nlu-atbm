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

<title>${sessionScope.user.role}| Quản lý kho</title>
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
								<th class="th-sm column-title">#</th>
								<th class="th-sm column-title">Tên sản phẩm</th>
								<th class="th-sm column-title">Giá</th>
								<th class="th-sm column-title">Số lượng</th>								
								<th class="th-sm column-title">Chi tiết</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="item">
								<tr>
									<th scope="row">${item.product.id}</th>
									<th scope="row">${item.product.name}</th>
									
									<th scope="row"><fmt:formatNumber type="currency"
											value="${item.product.price}" currencyCode="VND" /></th>
									<th scope="row">${item.quantity}</th>
									<td><a class="btn btn-warning"
										href="updateInventory?id=${item.product.id}"
										role="button">Chi tiết</a></td>
									
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
