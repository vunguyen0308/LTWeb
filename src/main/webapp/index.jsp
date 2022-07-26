<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
	<title>Perfume Shop</title>
	<!--favicon -->
	<link href="images/faviconn.PNG" rel="icon">
	<!--/tags -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
			function hideURLbar(){ window.scrollTo(0,1); } </script>
	<!--//tags -->
	<link rel="stylesheet" href="css/edit-style.css">
	<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
	<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
	<link href="css/font-awesome.css" rel="stylesheet">
	<link href="css/easy-responsive-tabs.css" rel='stylesheet' type='text/css'/>
	<!-- //for bootstrap working -->
	<link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800" rel="stylesheet">
	<link href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,900,900italic,700italic' rel='stylesheet' type='text/css'>
</head>
<body>
<!-- header -->

	<jsp:include page="header.jsp"/>

	<!-- banner -->
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1" class=""></li>
			<li data-target="#myCarousel" data-slide-to="2" class=""></li>
			<li data-target="#myCarousel" data-slide-to="3" class=""></li>
			<li data-target="#myCarousel" data-slide-to="4" class=""></li>
		</ol>
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<div class="container">
					<div class="carousel-caption">
						<h3>The Biggest <span>Sale</span></h3>
						<p>Special for today</p>
						<a class="hvr-outline-out button2" href="product">Shop Now </a>
					</div>
				</div>
			</div>
			<div class="item item2">
				<div class="container">
					<div class="carousel-caption">
						<h3>Summer <span>Collection</span></h3>
						<p>New Arrivals On Sale</p>
						<a class="hvr-outline-out button2" href="product">Shop Now </a>
					</div>
				</div>
			</div>
			<div class="item item3">
				<div class="container">
					<div class="carousel-caption">
						<h3>The Biggest <span>Sale</span></h3>
						<p>Special for today</p>
						<a class="hvr-outline-out button2" href="product">Shop Now </a>
					</div>
				</div>
			</div>
			<div class="item item4">
				<div class="container">
					<div class="carousel-caption">
						<h3>Summer <span>Collection</span></h3>
						<p>New Arrivals On Sale</p>
						<a class="hvr-outline-out button2" href="product">Shop Now </a>
					</div>
				</div>
			</div>
			<div class="item item5">
				<div class="container">
					<div class="carousel-caption">
						<h3>The Biggest <span>Sale</span></h3>
						<p>Special for today</p>
						<a class="hvr-outline-out button2" href="product">Shop Now </a>
					</div>
				</div>
			</div>
		</div>
		<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			<span class="sr-only">Previous</span>
		</a>
		<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
			<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
		<!-- The Modal -->
	</div>
		<!-- //banner -->
	<div class="banner_bottom_agile_info">
		<div class="container">
			<div class="banner_bottom_agile_info_inner_w3ls">
				   <div class="col-md-6 wthree_banner_bottom_grid_three_left1 grid">
						<figure class="effect-roxy">
							<img src="images/home1.jpg" alt=" " class="img-responsive" />
							<figcaption>
								<h3><span>F</span>all Ahead</h3>
								<p>New Arrivals</p>
							</figcaption>
						</figure>
					</div>
					 <div class="col-md-6 wthree_banner_bottom_grid_three_left1 grid">
						<figure class="effect-roxy">
							<img src="images/home2.jpg" alt=" " class="img-responsive" />
							<figcaption>
								<h3><span>F</span>all Ahead</h3>
								<p>New Arrivals</p>
							</figcaption>
						</figure>
					</div>
					<div class="clearfix"></div>
			</div>
		 </div>
	</div>
		<!-- schedule-bottom -->
	<div class="schedule-bottom">
		<div class="col-md-6 agileinfo_schedule_bottom_left">
			<img src="images/home3.jpg" alt=" " class="img-responsive" />
		</div>
		<div class="col-md-6 agileits_schedule_bottom_right">
			<div class="w3ls_schedule_bottom_right_grid">
				<h3>Save up to <span>50%</span> in this week</h3>
				<p>This week (from May 31, 2021) you can own quality products at the store with a 50% discount on all products.</p>
				<div class="col-md-4 w3l_schedule_bottom_right_grid1">
					<i class="fa fa-user-o" aria-hidden="true"></i>
					<h4>Customers</h4>
					<h5 class="counter">653</h5>
				</div>
				<div class="col-md-4 w3l_schedule_bottom_right_grid1">
					<i class="fa fa-calendar-o" aria-hidden="true"></i>
					<h4>Events</h4>
					<h5 class="counter">823</h5>
				</div>
				<div class="col-md-4 w3l_schedule_bottom_right_grid1">
					<i class="fa fa-shield" aria-hidden="true"></i>
					<h4>Awards</h4>
					<h5 class="counter">45</h5>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
		<div class="clearfix"> </div>
	</div>
	<!-- //schedule-bottom -->
	  <!-- banner-bootom-w3-agileits -->
	<div class="banner-bootom-w3-agileits">
		<div class="container">
			<h3 class="wthree_text_info">What's <span>Trending</span></h3>
			<div class="col-md-5 bb-grids bb-left-agileits-w3layouts">
				   <div class="bb-left-agileits-w3layouts-inner grid">
						<figure class="effect-roxy">
								<img src="images/home4.jpg" alt=" " class="img-responsive" />
								<figcaption>
									<h3><span>S</span>ale </h3>
									<p>Upto 55%</p>
								</figcaption>
							</figure>
					</div>
			</div>
			<div class="col-md-7 bb-grids bb-middle-agileits-w3layouts">
				   <div class="bb-middle-agileits-w3layouts grid">
					   <figure class="effect-roxy">
							<img src="images/home5.jpg" alt=" " class="img-responsive" />
							<figcaption>
								<h3><span>S</span>ale </h3>
								<p>Upto 55%</p>
							</figcaption>
						</figure>
					</div>
				<div class="bb-middle-agileits-w3layouts forth grid">
					<figure class="effect-roxy">
						<img src="images/home6.jpg" alt=" " class="img-responsive">
						<figcaption>
							<h3><span>S</span>ale </h3>
							<p>Upto 65%</p>
						</figcaption>
					</figure>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--/grids-->
	<div class="agile_last_double_sectionw3ls">
		<div class="col-md-6 multi-gd-img multi-gd-text ">
				<a href="product"><img src="images/home7.jpg" alt=" "><h4>Flat <span>50%</span> offer</h4></a>
		</div>
		 <div class="col-md-6 multi-gd-img multi-gd-text ">
				<a href="product"><img src="images/home8.jpg" alt=" "><h4>Flat <span>50%</span> offer</h4></a>
		</div>
		<div class="clearfix"></div>
	</div>
	<!--/grids-->
	<!-- /new_arrivals -->
	<div class="new_arrivals_agile_w3ls_info">
		<div class="container">
			<h3 class="wthree_text_info">New <span>Arrivals</span></h3>
				<div id="horizontalTab">
					<ul class="resp-tabs-list">
						<li class="tab-product" pg="Female"><a>Female</a></li>
						<li class="tab-product" pg="Male"><a>Male</a></li>
						<li class="tab-product" pg="Unisex"><a>Unisex</a></li>
					</ul>
					<div class="resp-tabs-container">
					<!--/tab_one-->
					<div id="tab1" class="tab1">
						<c:forEach items="${listPNA}" var="pna">
							<div class="col-md-3 product-men">
								<div class="men-pro-item simpleCart_shelfItem">
									<div class="men-thumb-item">
										<img src="${pna.img}" alt="" class="pro-image-front">
										<img src="${pna.img}" alt="" class="pro-image-back">
										<div class="men-cart-pro">
											<div class="inner-men-cart-pro">
												<a href="detail?pid=${pna.id}&brand=${pna.brand}" class="link-product-add-cart">Quick View</a>
											</div>
										</div>
										<span class="product-new-top">New</span>

									</div>
									<div class="item-info-product ">
										<h4><a href="detail?pid=${pna.id}&brand=${pna.brand}">${pna.name}</a></h4>
										<div class="info-product-price">
											<span class="item_price">${pna.sellPrice} USD</span>
											<del>${pna.price} USD</del>
										</div>
										<div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out button2 ${pna.quantity == 0 ? "disable-outline" : ""}">
											<form id="add-cart-form" class="add-form" action="" method="post" >
												<fieldset>
													<c:if test="${pna.quantity > 0}">
														<input type="submit" name="submit" value="Add to cart" class="button addToCart" pid="${pna.id}" pname="${pna.name}" pprice="${pna.sellPrice}" pquantity="${pna.quantity}">
													</c:if>
													<c:if test="${pna.quantity == 0}">
														<input type="submit" title="Sold out" disabled name="submit" value="Add to cart" class="button disable-add">
													</c:if>
												</fieldset>
											</form>
										</div>

									</div>
								</div>
							</div>
						</c:forEach>

						<div class="clearfix"></div>
						</div>
						<!--//tab_one-->
						<!--/tab_two-->
						<div id="tab2" class="tab2">
							<c:forEach items="${listPNA}" var="pna">
								<div class="col-md-3 product-men">
									<div class="men-pro-item simpleCart_shelfItem">
										<div class="men-thumb-item">
											<img src="${pna.img}" alt="" class="pro-image-front">
											<img src="${pna.img}" alt="" class="pro-image-back">
											<div class="men-cart-pro">
												<div class="inner-men-cart-pro">
													<a href="detail?pid=${pna.id}&brand=${pna.brand}" class="link-product-add-cart">Quick View</a>
												</div>
											</div>
											<span class="product-new-top">New</span>

										</div>
										<div class="item-info-product ">
											<h4><a href="detail?pid=${pna.id}&brand=${pna.brand}">${pna.name}</a></h4>
											<div class="info-product-price">
												<span class="item_price">${pna.sellPrice} USD</span>
												<del>${pna.price} USD</del>
											</div>
											<div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out button2 ${pna.quantity == 0 ? "disable-outline" : ""}">
												<form id="add-cart-form2" class="add-form" action="" method="post">
													<fieldset>
														<c:if test="${pna.quantity > 0}">
															<input type="submit" name="submit" value="Add to cart" class="button addToCart" pid="${pna.id}" pname="${pna.name}" pprice="${pna.sellPrice}" pquantity="${pna.quantity}">
														</c:if>
														<c:if test="${pna.quantity == 0}">
															<input type="submit" title="Sold out" disabled name="submit" value="Add to cart" class="button disable-add">
														</c:if>
													</fieldset>
												</form>
											</div>

										</div>
									</div>
								</div>
							</c:forEach>

							<div class="clearfix"></div>
						</div>
					 <!--//tab_two-->
						<div id="tab3" class="tab3">
							<c:forEach items="${listPNA}" var="pna">
								<div class="col-md-3 product-men">
									<div class="men-pro-item simpleCart_shelfItem">
										<div class="men-thumb-item">
											<img src="${pna.img}" alt="" class="pro-image-front">
											<img src="${pna.img}" alt="" class="pro-image-back">
											<div class="men-cart-pro">
												<div class="inner-men-cart-pro">
													<a href="detail?pid=${pna.id}&brand=${pna.brand}" class="link-product-add-cart">Quick View</a>
												</div>
											</div>
											<span class="product-new-top">New</span>

										</div>
										<div class="item-info-product ">
											<h4><a href="detail?pid=${pna.id}&brand=${pna.brand}">${pna.name}</a></h4>
											<div class="info-product-price">
												<span class="item_price">${pna.sellPrice} USD</span>
												<del>${pna.price} USD</del>
											</div>
											<div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out button2 ${pna.quantity == 0 ? "disable-outline" : ""}">
												<form id="add-cart-form3" class="add-form" action="" method="post">
													<fieldset>
														<c:if test="${pna.quantity > 0}">
															<input type="submit" name="submit" value="Add to cart" class="button addToCart" pid="${pna.id}" pname="${pna.name}" pprice="${pna.sellPrice}" pquantity="${pna.quantity}" >
														</c:if>
														<c:if test="${pna.quantity == 0}">
															<input type="submit" title="Sold out" disabled name="submit" value="Add to cart" class="button disable-add">
														</c:if>
													</fieldset>
												</form>
											</div>

										</div>
									</div>
								</div>
							</c:forEach>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- //new_arrivals -->
		<!-- /we-offer -->
		<div class="sale-w3ls">
			<div class="container">
				<h6>We Offer Flat <span>40%</span> Discount</h6>
				<a class="hvr-outline-out button2" href="product">Shop Now </a>
			</div>
		</div>
		<!-- //we-offer -->

	<jsp:include page="footer.jsp"/>
	<jsp:include page="modal.jsp"/>


	<a href="#home" class="scroll" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>

	<!-- js -->
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<!-- //js -->
	<script src="js/modernizr.custom.js"></script>
		<!-- Custom-JavaScript-File-Links -->

	<!-- script for responsive tabs -->
	<script src="js/easy-responsive-tabs.js"></script>
	<script>
		$(document).ready(function () {
		$('#horizontalTab').easyResponsiveTabs({
		type: 'default', //Types: default, vertical, accordion
		width: 'auto', //auto or any width like 600px
		fit: true,   // 100% fit in a container
		closed: 'accordion', // Start closed if in accordion view
		activate: function(event) { // Callback function if tab is switched
		var $tab = $(this);
		var $info = $('#tabInfo');
		var $name = $('span', $info);
		$name.text($tab.text());
		$info.show();
		}
		});
		$('#verticalTab').easyResponsiveTabs({
		type: 'vertical',
		width: 'auto',
		fit: true
		});
		});
	</script>
	<!-- //script for responsive tabs -->
	<!-- stats -->
		<script src="js/jquery.waypoints.min.js"></script>
		<script src="js/jquery.countup.js"></script>
		<script>
			$('.counter').countUp();
		</script>
	<!-- //stats -->
	<!-- start-smoth-scrolling -->
	<script type="text/javascript" src="js/move-top.js"></script>

	<script type="text/javascript" src="js/jquery.easing.min.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event){
				event.preventDefault();
				$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
			});
		});
	</script>
	<!-- here stars scrolling icon -->
		<script type="text/javascript">
			$(document).ready(function() {
				/*
					var defaults = {
					containerID: 'toTop', // fading element id
					containerHoverID: 'toTopHover', // fading element hover id
					scrollSpeed: 1200,
					easingType: 'linear'
					};
				*/

				$().UItoTop({ easingType: 'easeOutQuart' });

				});
		</script>

<script>
	$(document).ready(function () {
		$(".tab-product").click(function (){
			var pg = $(this).attr("pg");
			$.ajax({
				url: "/lab6_war_exploded/index",
				method: "POST",
				data: {
					pg: pg
				},
				success: function (data){
					var tab1 = document.getElementById("tab1");
					var tab2 = document.getElementById("tab2");
					var tab3 = document.getElementById("tab3");

					tab1.innerHTML = data;
					tab2.innerHTML = data;
					tab3.innerHTML = data;
				},
				error: function (data){

				}
			});
		})

	})

</script>

<%--add to cart--%>
<script >
	$(".addToCart").click(function() {
		var id = $(this).attr("pid");
		var name =$(this).attr("pname");
		var price = "$" + $(this).attr("pprice");
		var quantity = $(this).attr("pquantity");
		$.ajax({
			type: "POST",
			url: "/lab6_war_exploded/add",
			data: {
				id: id
			},
			success: function(data)
			{
				var quantitySold = data;
				if(parseFloat(quantitySold) < parseFloat(quantity)){
					$("#detail-name").html(name);
					$("#detail-price").html(price);
					$("#detail-quantity").html("X" + data);
					$("#addCartModal").modal('show');
				}else{
					alert("We are only " + quantity + " quantity for this item")
				}
			}
		});

		return false;

	});

	// function addToCart(product) {
	// 	var id = $(product).serialize().val[0];
	// 	var name = $(product).serialize()[1];
	// 	var price = $(product).serialize()[2];
	// 	alert(id)
	// 	$.ajax({
	// 		type: "POST",
	// 		url: "/lab6_war_exploded/add",
	// 		data: {
	// 			id: id
	// 		},
	// 		success: function(data)
	// 		{
	// 			$("#detail-name").html(name);
	// 			$("#detail-price").html(price);
	// 			$("#detail-quantity").html(data);
	// 			$("#addCartModal").modal('show');
	// 		}
	// 	});
	//
	// 	return false;
	//
	// }

</script>

	<!-- for bootstrap working -->
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script src="https://uhchat.net/code.php?f=f76730"></script>
</body>
</html>
