<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Khai báo sử dụng JSTL Core Tags -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header class="header">
	<div class="header__top">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-6 col-md-8 col-sm-6 col-xs-12 ">
					<p>SAPO Store - SINCE 2020 - LUÔN CAM KẾT CHÍNH HÃNG</p>
				</div>
				<div class="col-lg-6 col-md-4 col-sm-6 col-xs-12 ">
					<div class="header__actions">

						<c:if test="${sessionScope.user != null}">
							<c:if test="${sessionScope.user.role eq 'ADMIN'}">
								<a href="readProduct">TRUY CẬP TRANG ADMIN</a>
							</c:if>
							<c:if test="${sessionScope.user.role eq 'SELLER'}">
								<a href="readProduct">TRUY CẬP TRANG ADMIN</a>
							</c:if>
							<a href="yourOrder?id=${sessionScope.user.userId}">Đơn hàng của ${sessionScope.user.username}</a>
							<a href="yourInfo?id=${sessionScope.user.userId}">Thông tin của ${sessionScope.user.username}</a>
							<a href="logout">Đăng Xuất</a>
						</c:if>
						<c:if test="${sessionScope.user == null}">
							<a href="login.jsp">Đăng nhập</a>
						</c:if>

					</div>
				</div>
			</div>
		</div>
	</div>
	<nav class="navigation">
		<div class="container-fluid">
			<div class="navigation__column left">
				<div class="header__logo">
					<a class="ps-logo" href="index"><img src="images/logo-head.png"
						alt=""></a>
				</div>
			</div>
			<div class="navigation__column center">
				<ul class="main-menu menu">
					<li class="menu-item menu-item-has-children dropdown"><a
						href="index">Trang chủ</a></li>
					<li class="menu-item menu-item-has-children has-mega-menu dropdown"><a
						href="product-listing?id=1">Giày Bóng Đá <ion-icon
								name="chevron-down-outline"
								style="position: absolute; bottom: 40%;"></ion-icon>
					</a>
						<ul class="sub-menu">
							<li class="menu-item"><a href="category?id=1">Nike</a></li>
							<li class="menu-item"><a href="category?id=2">Adidas</a></li>
							<li class="menu-item"><a href="category?id=3">Puma</a></li>
							<li class="menu-item"><a href="category?id=4">Mizuno</a></li>
						</ul></li>
					<li class="menu-item menu-item-has-children has-mega-menu dropdown"><a
						href="product-listing?id=2">Phụ kiện <ion-icon
								name="chevron-down-outline"
								style="position: absolute; bottom: 40%;"></ion-icon>
					</a>
						<ul class="sub-menu">
							<li class="menu-item"><a href="category?id=5">Áo
									bóng đá chính hãng</a></li>
							<li class="menu-item"><a href="category?id=6">Vớ</a>
							</li>
							<li class="menu-item"><a href="category?id=7">Quả
									bóng</a></li>
							<li class="menu-item"><a href="category?id=8">Găng
									tay thủ môn</a></li>
							<li class="menu-item"><a href="category?id=9">Túi
									đựng giày</a></li>
						</ul></li>
					<li class="menu-item"><a href="blog-detail.jsp">Cách chọn size</a></li>
					<li class="menu-item menu-item-has-children dropdown"><a
						href="contact-us.jsp">Liên hệ</a></li>
				</ul>
			</div>
			<div class="navigation__column right">
				<form class="ps-search--header" method="GET" action="search">
					<input class="form-control" type="text"
						placeholder="Tìm kiếm sản phẩm..." name="txtSearch">
					<button>
						<i class="ps-icon-search"></i>
					</button>
				</form>
				<div class="ps-cart">
					<a class="ps-cart__toggle" href="viewCart"><span><i
							id="sizeCart"></i></span><i class="ps-icon-shopping-cart"></i></a>

				</div>
				<div class="menu-toggle">
					<span></span>
				</div>
			</div>
		</div>
	</nav>
</header>
<script>
	function getCookieValue(cookieName) {
		var name = cookieName + "=";
		var decodedCookie = decodeURIComponent(document.cookie);
		var cookieArray = decodedCookie.split(';');

		for (var i = 0; i < cookieArray.length; i++) {
			var cookie = cookieArray[i];
			while (cookie.charAt(0) === ' ') {
				cookie = cookie.substring(1);
			}
			if (cookie.indexOf(name) === 0) {
				return cookie.substring(name.length, cookie.length);
			}
		}
		return null;
	}


	window.onload = function() {
		var cartCookieValue = getCookieValue("cart");
		var element = document.getElementById("sizeCart");

		if (cartCookieValue !== null) {
			var itemsArray = cartCookieValue.split('/');
            // Đếm số sản phẩm
            var itemCount = itemsArray.length;
			element.textContent = itemCount;
		} else {
			element.textContent = "0";
			cartCookieValue = 0;
		}

	};
</script>