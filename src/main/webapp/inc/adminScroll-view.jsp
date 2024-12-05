<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="left_col scroll-view" style="background-color: #313645">
	<div class="navbar nav_title"
		style="border: 0; background-color: rgb(42, 195, 125)">

		<a href="index" class="site_title"><span>SAPO STORE</span></a>
	</div>

	<div class="clearfix"></div>

	<!-- menu profile quick info -->
	<div class="profile clearfix">
		<div class="profile_info">
			<c:if test="${empty sessionScope.user}">
				<script>					
					window.location.href = 'index';
				</script>
			</c:if>
			<span style="font-size: 16px">Welcome,</span>
			<h2 style="font-size: 24px">${sessionScope.user.username}</h2>
		</div>
	</div>
	<!-- /menu profile quick info -->

	<br />

	<!-- sidebar menu -->
	<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
		<div class="menu_section">
			<!--                <h3>General</h3>-->
			<ul class="nav side-menu">
				<li><a
					style="background-color: rgb(42, 195, 125); font-size: 16px; color: #FFFFFF; text-transform: uppercase"><i
						class="fa fa-home"></i> Quản lý sản phẩm <span
						class="fa fa-chevron-down"></span></a>
					<ul class="nav child_menu">
						<li style="font-size: 15px"><a href="readProduct">Danh
								sách sản phẩm</a></li>
						<li style="font-size: 15px"><a href="createProduct">Thêm
								sản phẩm</a></li>
						<li style="font-size: 15px"><a href="readOrder">Quản lý
								đơn hàng</a></li>
						<!-- <li style="font-size: 15px"><a href="user.php">Quản lý
								đánh giá</a></li> -->
						<li style="font-size: 15px"><a href="readInventory">Quản
								lý kho</a></li>
					</ul></li>

			</ul>
		</div>


		<c:if test="${sessionScope.user != null}">
			<c:if test="${sessionScope.user.role eq 'ADMIN'}">
				<div class="menu_section">
					<ul class="nav side-menu">
						<li><a
							style="background-color: rgb(42, 195, 125); font-size: 16px; color: #FFFFFF; text-transform: uppercase"><i
								class="fa fa-user"></i> Quản lý tài khoản <span
								class="fa fa-chevron-down"></span></a>
							<ul class="nav child_menu">
								<li style="font-size: 15px"><a href="readUser">Danh
										sách tài khoản</a></li>
								<li style="font-size: 15px"><a
									href="adminAccountCreate.jsp">Thêm tài khoản</a></li>
							</ul></li>
					</ul>
				</div>
			</c:if>
		</c:if>
		
		
	</div>
</div>
