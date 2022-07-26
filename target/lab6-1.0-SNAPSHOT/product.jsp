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
	<title>Perfume Shop - Product</title>
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
	<link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
	<link href="css/style.css" rel="stylesheet"  type="text/css"/>
	<link href="css/font-awesome.css" rel="stylesheet">
	<!-- //for bootstrap working -->
	<link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800" rel="stylesheet">
	<link href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,900,900italic,700italic' rel='stylesheet' type='text/css'>
</head>
<body>
	<!-- header -->
	<jsp:include page="header.jsp"/>

	<!-- /banner_bottom_agile_info -->
	<div class="page-head_agile_info_w3l">
			<div class="container">
				<h3>Products<span></span></h3>
				<!--/w3_short-->
					 <div class="services-breadcrumb">
							<div class="agile_inner_breadcrumb">

							   <ul class="w3_short">
									<li><a href="index">Home</a><i>/</i></li>
									<li>Products</li>
								</ul>
							 </div>
					</div>
		   <!--//w3_short-->
		</div>
	</div>

	  <!-- banner-bottom-w3-agileits -->
		<div class="banner-bootom-w3-agileits">
		<div class="container">
			 <!-- mens -->
			<div class="col-md-3 products-left">
				<div class="css-treeview">
					<h4>Categories</h4>
					<ul>
						<li class="list-group-item ">
							<a href="product">All Product</a>
						</li>
						<c:forEach items="${listC}" var="o">
							<li class="list-group-item ${tagC == o.cId ? "active" : "" }">
								<a href="category?cid=${o.cId}">${o.cName}</a>
							</li>
						</c:forEach>


					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="col-md-9 products-right">
				<h5>Product</h5>
				<div class="sort-grid">
					<div class="sorting">
						<h6>Sort By</h6>
						<form name="sort-form" action="product">
						<select id="country1" name="sort" onchange="document.sort-form.submit();" class="frm-field required sect">
							<option value="0" ${sortCode == 0 ? "selected" : ""}>Default</option>
							<option value="1" ${sortCode == 1 ? "selected" : ""}>Name(A - Z)</option>
							<option value="2" ${sortCode == 2 ? "selected" : ""}>Name(Z - A)</option>
							<option value="3" ${sortCode == 3 ? "selected" : ""}>Price(High - Low)</option>
							<option value="4" ${sortCode == 4 ? "selected" : ""}>Price(Low - High)</option>
							<input style="display: none" name="sizepage" value="${size}">
						</select>
						</form>
						<div class="clearfix"></div>
					</div>
					<div class="sorting">
						<h6>Showing</h6>
						<form name="pagesize-form" action="product">
						<select  id="country2" name="sizepage" onchange="document.pagesize-form.submit();" class="frm-field  sect">
							<option value="8" ${size == 8 ? "selected" : ""} >8</option>
							<option value="16" ${size == 16 ? "selected" : ""} >16</option>
							<option value="20" ${size == 20 ? "selected" : ""} >20</option>
							<option value="32" ${size == 32 ? "selected" : ""}>32</option>
							<option value="40" ${size == 40 ? "selected" : ""}>40</option>
							<input style="display: none" name="sort" value="${sortCode}">
						</select>
						</form>
						<div class="clearfix"></div>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="men-wear-top">

					<div  id="top" class="callbacks_container">
						<ul class="rslides" id="slider3">
							<li>
								<img class="img-responsive" src="images/slider2.jpg" alt=" "/>
							</li>
							<li>
								<img class="img-responsive" src="images/slider2.jpg" alt=" "/>
							</li>
							<li>
								<img class="img-responsive" src="images/slider2.jpg" alt=" "/>
							</li>
						</ul>
					</div>
					<div class="clearfix"></div>
				</div>



					<div class="clearfix"></div>
			</div>
			<div class="clearfix"></div>
			<div class="single-pro">

	<c:forEach var="p" items="${product}">

				<div class="col-md-3 product-men">
					<div class="men-pro-item simpleCart_shelfItem">
						<div class="men-thumb-item">
							<img src="${p.img}" alt="" class="pro-image-front">
							<img src="${p.img}" alt="" class="pro-image-back">
								<div class="men-cart-pro">
									<div class="inner-men-cart-pro">
										<a href="detail?pid=${p.id}&brand=${p.brand}" class="link-product-add-cart">Quick View</a>
									</div>
								</div>
								<span class="product-new-top">New</span>

						</div>
						<div class="item-info-product ">
							<h4><a href="detail?pid=${p.id}&brand=${p.brand}">${p.name}</a></h4>
							<div class="info-product-price">
								<span class="item_price">${p.sellPrice} USD</span>
								<del>${p.price} USD</del>
							</div>
							<div  class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out button2 ${p.quantity == 0 ? "disable-outline" : ""}">
								<form id="add-cart-form" class="add-form" action="" method="post">
									<fieldset>
										<c:if test="${p.quantity > 0}">
											<input type="submit" name="submit" value="Add to cart" class="button addToCart" pid="${p.id}" pname="${p.name}" pprice="${p.sellPrice}" pquantity="${p.quantity}">
										</c:if>
										<c:if test="${p.quantity == 0}">
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

	<%--Pagination--%>
	<div class="text-center">
		<ul class="pagination justify-content-center">
			<c:if test="${tag > 1}">
				<li class="page-item">
					<a class="page-link" href="product?page=${tag-1}&sizepage=${size}&sort=${sortCode}" aria-label="Previous">
						<span aria-hidden="true">&laquo;</span>
						<span class="sr-only">Previous</span>
					</a>
				</li>
			</c:if>
			<c:forEach begin="1" end="${end}" var="i">
				<li class="page-item ${tag == i ? "active" : "" }"><a class="page-link" href="product?page=${i}&sizepage=${size}&sort=${sortCode}">${i}</a></li>
			</c:forEach>
			<c:if test="${tag < end}">
				<li class="page-item">
					<a class="page-link" href="product?page=${tag+1}&sizepage=${size}&sort=${sortCode}" aria-label="Next">
						<span aria-hidden="true">&raquo;</span>
						<span class="sr-only">Next</span>
					</a>
				</li>
			</c:if>

		</ul>
	</div>

	<!-- //mens -->
	<!--/grids-->

	<%--footer--%>
	<jsp:include page="footer.jsp"/>
	<jsp:include page="modal.jsp"/>


	<a href="#home" class="scroll" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
	<!-- js -->
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<!-- //js -->
	<script src="js/responsiveslides.min.js"></script>
	<script>
			// You can also use "$(window).load(function() {"
			$(function () {
			 // Slideshow 4
			$("#slider3").responsiveSlides({
				auto: true,
				pager: true,
				nav: false,
				speed: 500,
				namespace: "callbacks",
				before: function () {
			$('.events').append("<li>before event fired.</li>");
			},
			after: function () {
				$('.events').append("<li>after event fired.</li>");
				}
				});
			});
	</script>

	<script src="js/modernizr.custom.js"></script>
		<!-- Custom-JavaScript-File-Links -->

		<!---->
	<script type='text/javascript'>//<![CDATA[
		$(window).load(function(){
			 $( "#slider-range" ).slider({
					range: true,
					min: 0,
					max: 9000,
					values: [ 1000, 7000 ],
					slide: function( event, ui ) {  $( "#amount" ).val( "$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ] );
					}
		 });
			$( "#amount" ).val( "$" + $( "#slider-range" ).slider( "values", 0 ) + " - $" + $( "#slider-range" ).slider( "values", 1 ) );

		});//]]>

	</script>
	<script type="text/javascript" src="js/jquery-ui.js"></script>
						 <!---->
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

<%--add to cart--%>
	<script >
		$(".addToCart").click(function() {
			 var id = $(this).attr("pid");
			 var name = $(this).attr("pname");
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
