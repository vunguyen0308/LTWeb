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
	<title>Perfume Shop - Details</title>
	<!--favicon -->
	<link href="images/faviconn.PNG" rel="icon">
	<!--/tags -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
			function hideURLbar(){ window.scrollTo(0,1); } </script>
	<!-- //tags -->
	<link rel="stylesheet" href="css/edit-style.css">
	<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
	<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
	<link href="css/font-awesome.css" rel="stylesheet">
	<link href="css/easy-responsive-tabs.css" rel='stylesheet' type='text/css'/>
	<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />

	<!-- //for bootstrap working -->
	<link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800" rel="stylesheet">
	<link href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,900,900italic,700italic' rel='stylesheet' type='text/css'>
</head>
<body>
	<!-- header -->
	<jsp:include page="header.jsp"/>

	<!--/single_page-->
		   <!-- /banner_bottom_agile_info -->
	<div class="page-head_agile_info_w3l">
			<div class="container">
				<h3>Detail <span>Page</span></h3>
				<!--/w3_short-->
					 <div class="services-breadcrumb">
							<div class="agile_inner_breadcrumb">
							   <ul class="w3_short">
									<li><a href="index">Home</a><i>/</i></li>
								   	<li><a href="product">Product</a><i>/</i></li>
								   <li>Details</li>
								</ul>
							 </div>
					</div>
		   <!--//w3_short-->
		</div>
	</div>

	  <!-- banner-bootom-w3-agileits -->
	<div class="banner-bootom-w3-agileits">
		<div class="container">
			 <div class="col-md-4 single-right-left ">
				<div class="grid images_3_of_2">
					<div class="flexslider">

						<ul class="slides">
							<li data-thumb="${detail.img}">
								<div class="thumb-image"> <img src="${detail.img}" data-imagezoom="true" class="img-responsive"> </div>
							</li>

						</ul>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
			<div class="col-md-8 single-right-left simpleCart_shelfItem">
				<h3>${detail.name}</h3>
				<p><span class="item_price">${detail.sellPrice} USD</span> <del>${detail.price} USD</del></p>

				<div class="occasional">
					<h5 class="title-properties-product">Brand</h5>
					<span class="properties-product">: ${detail.brand}</span>
				</div>

				<div class="occasional">
					<h5 class="title-properties-product">Gender</h5>
					<span class="properties-product">: ${detail.gender}</span>
				</div>

				<div class="occasional">
					<h5 class="title-properties-product">Origin</h5>
					<span class="properties-product">: ${detail.origin}</span>
				</div>

				<div class="occasional">
					<h5 class="title-properties-product">Extension de gamme</h5>
					<span class="properties-product">: ${detail.concentration}</span>
				</div>

				<div class="occasional">
					<h5 class="title-properties-product">Style</h5>
					<span class="properties-product">: ${detail.style}</span>
				</div>

				<div class="occasional">
					<h5 class="title-properties-product">Capacity</h5>
					<span class="properties-product">: ${detail.capacity}</span>
				</div>

				<div class="occasion-cart">
					<div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out button2 ${detail.quantity == 0 ? "disable-outline" : ""}">
						<form id="add-cart-form" class="add-form" action="" method="post">
							<fieldset>
								<c:if test="${detail.quantity > 0}">
									<input type="submit" name="submit" value="Add to cart" class="button addToCart" pid="${detail.id}" pname="${detail.name}" pprice="${detail.sellPrice}" pquantity="${detail.quantity}">
								</c:if>
								<c:if test="${detail.quantity == 0}">
									<input type="submit" disabled name="submit" value="Add to cart" class="button disable-add">
									<span class="tooltiptext"><Strong>Sold out</Strong></span>
								</c:if>
							</fieldset>
						</form>

					</div>
				</div>

			</div>
			<div class="clearfix"> </div>
					<!-- /new_arrivals -->
		<div class="responsive_tabs_agileits">
					<div id="horizontalTab">
							<ul class="resp-tabs-list">
								<li>Description</li>
								<li>Reviews</li>
								<li>Information</li>
							</ul>
						<div class="resp-tabs-container">
						<!--/tab_one-->
						   <div class="tab1">

								<div class="single_page_agile_its_w3ls">
								  <h6>${detail.name}</h6>
								   <p>${detail.description}</p>
								</div>
							</div>
							<!--//tab_one-->
							<div class="tab2">

								<div class="single_page_agile_its_w3ls">
									<div class="bootstrap-tab-text-grids">
										<div class="bootstrap-tab-text-grid">
											<div class="bootstrap-tab-text-grid-left">
												<img src="images/t1.jpg" alt=" " class="img-responsive">
											</div>
											<div class="bootstrap-tab-text-grid-right">
												<ul>
													<li><a href="#">Admin</a></li>
													<li><a href="#"><i class="fa fa-reply-all" aria-hidden="true"></i> Reply</a></li>
												</ul>

											</div>
											<div class="clearfix"> </div>
										 </div>
										 <div class="add-review">
											<h4>add a review</h4>
											<form action="#" method="post">
													<input type="text" name="Name" required="Name">
													<input type="email" name="Email" required="Email">
													<textarea name="Message" required=""></textarea>
												<input type="submit" value="SEND">
											</form>
										</div>
									 </div>

								 </div>
							 </div>
							   <div class="tab3">

								<div class="single_page_agile_its_w3ls">
								  <h6>${detail.name}</h6>
								</div>
							</div>
						</div>
					</div>
				</div>
		<!-- //new_arrivals -->
			<!--/slider_owl-->

				<div class="w3_agile_latest_arrivals">
				<h3 class="wthree_text_info">Related<span> Products</span></h3>

					<c:forEach items="${newp}" var="np">
						  <div class="col-md-3 product-men single">
									<div class="men-pro-item simpleCart_shelfItem">
										<div class="men-thumb-item">
											<img src="${np.img}" alt="" class="pro-image-front">
											<img src="${np.img}" alt="" class="pro-image-back">
												<div class="men-cart-pro">
													<div class="inner-men-cart-pro">
														<a href="detail?pid=${np.id}&brand=${np.brand}" class="link-product-add-cart">Quick View</a>
													</div>
												</div>
												<span class="product-new-top">New</span>

										</div>
										<div class="item-info-product ">
											<h4><a href="detail?pid=${np.id}&brand=${np.brand}">${np.name}</a></h4>
											<div class="info-product-price">
												<span class="item_price">${np.sellPrice} USD</span>
												<del>${np.price} USD</del>
											</div>
											<div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out button2 ${np.quantity == 0 ? "disable-outline" : ""}">
												<form id="add-cart-form2" class="add-form" action="" method="post">
													<fieldset>
														<c:if test="${np.quantity > 0}">
															<input type="submit" name="submit" value="Add to cart" class="button addToCart" pid="${np.id}" pname="${np.name}" pprice="${np.sellPrice}" pquantity="${np.quantity}">
														</c:if>
														<c:if test="${np.quantity == 0}">
															<input type="submit" title="Sold out" disabled name="submit" value="Add to cart" class="button disable-add">
														</c:if>
													</fieldset>
												</form>
											</div>

										</div>
									</div>
								</div>
					</c:forEach>


								<div class="clearfix"> </div>
						<!--//slider_owl-->
					 </div>
				</div>
	 </div>
	<!--//single_page-->
	<!--/grids-->

	<%--footer--%>
	<jsp:include page="footer.jsp"/>
	<jsp:include page="modal.jsp"/>

	<a href="#home" class="scroll" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
	<!-- js -->
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<!-- //js -->
	<script src="js/modernizr.custom.js"></script>
		<!-- Custom-JavaScript-File-Links -->

		<!-- single -->
	<script src="js/imagezoom.js"></script>
	<!-- single -->

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

	<!-- FlexSlider -->
	<script src="js/jquery.flexslider.js"></script>
		<script>
		// Can also be used with $(document).ready()
			$(window).load(function() {
				$('.flexslider').flexslider({
				animation: "slide",
				controlNav: "thumbnails"
				});
			});
		</script>
					<!-- //FlexSlider-->
	<!-- //script for responsive tabs -->
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
<!-- //here ends scrolling icon -->

<%--add to cart--%>
	<script >
		$(".addToCart").click(function() {
			var id = $(this).attr("pid");
			var name =$(this).attr("pname");
			var price = "$" + $(this).attr("pprice");
			var quantity = $(this).attr("pquantity") ;
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

	</script>

<!-- for bootstrap working -->
<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>
