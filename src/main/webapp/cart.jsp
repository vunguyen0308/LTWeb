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
    <title>Perfume Shop - Cart</title>
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

<!-- /banner_bottom_agile_info -->
<div class="page-head_agile_info_w3l">
    <div class="container">
        <h3>Shopping <span>Cart </span></h3>
        <!--/w3_short-->
        <div class="services-breadcrumb">
            <div class="agile_inner_breadcrumb">

                <ul class="w3_short">
                    <li><a href="index">Home</a><i>/</i></li>
                    <li>Cart</li>
                </ul>
            </div>
        </div>
        <!--//w3_short-->
    </div>
</div>
<!-- /banner_bottom_agile_info -->


<%--cart--%>
<div class="privacy py-sm-5 py-4">
    <div id="container" class="container py-xl-4 py-lg-2">

        <c:if test="${sessionScope.cart.data.size() == 0}">
            <div id="empty-cart">
                <h2 class="text-center m-8 "><strong>Your Cart Is Empty</strong></h2>
                <button style="display: block; margin: 0 auto" type="button" class="btn btn-lg btn-primary mt-2" onclick="location.href ='product' ">Shopping Now</button>
            </div>
        </c:if>

        <c:if test="${sessionScope.cart.data.size() != 0}">

            <!-- tittle heading -->
            <h3 class="m-8" >Shopping Cart</h3>
            <!-- //tittle heading -->
            <div id="checkout-right" class="checkout-right">

                <div class="table-responsive">
                    <table id="cart-table" class="timetable_sub table-striped table-hover table-bordered">
                        <thead>
                        <tr>
                            <th>SL No.</th>
                            <th>Product</th>
                            <th>Quantity</th>
                            <th>Product Name</th>
                            <th style="width: 15%">Price</th>
                            <th>Remove</th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach items="${sessionScope.cart.data}" var="item" varStatus="count">
                            <tr class="rem1">
                                <td class="invert">${count.count}</td>
                                <td class="invert-image">
                                    <a href="single?pid=${item.id}">
                                        <img src="${item.img}" alt=" " class="img-responsive">
                                    </a>
                                </td>
                                <td class="invert">
                                    <div class="quantity">
                                        <div class="quantity-select">
                                            <a class="down-quantity entry value-minus" pid="${item.id}" pprice="${item.sellPrice}"></a>
                                            <div class="entry value">
                                                <span class="quantity-sold">${item.quantitySold}</span>
                                            </div>
                                            <a  class="up-quantity entry value-plus active" pid="${item.id}" pprice="${item.sellPrice}" pquantity="${item.quantity}"></a>
                                        </div>
                                    </div>
                                </td>
                                <td class="invert">${item.name}</td>
                                <td class="invert product-total">$${item.total()}</td>
                                <td class="invert ">
                                    <div class="rem">
                                        <a class="close1 cart-remove" pid=${item.id}> </a>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>


                        </tbody>
                    </table>
                </div>
                <!-- / Shopping cart table -->

                <div class="display-flex flex-wrap justify-end align-items-center pb-4">
                    <div class="display-flex mt-4 mb-8">
                        <div class="text-right">
                            <h3 class="text-muted font-weight-normal m-0">Total price</h3>
                            <div style="font-size: 20px" class="text-large mt-1"><strong id="cart-total">$${sessionScope.cart.total()}</strong></div>
                        </div>
                    </div>
                </div>

                <div class="float-right">
                    <button type="button" onclick="history.back()" class="btn btn-lg btn-default md-btn-flat mt-2 mr-3">Back to shopping</button>
                    <button type="button" onclick="location.href='checkout'" class="btn btn-lg btn-primary mt-2">Checkout</button>
                </div>

            </div>

        </c:if>


<%--        --%>
        </div>
    </div>
</div>
<!-- //checkout page -->

<%--footer--%>
<jsp:include page="footer.jsp"/>


<a href="#home" class="scroll" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>

<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<!-- //js -->
<script src="js/modernizr.custom.js"></script>
<!-- Custom-JavaScript-File-Links -->

<%--remove product--%>
<script>
    $(document).ready(function () {
        $(".cart-remove").click(function (){
            var id = $(this).attr("pid");
            tr = $(this).closest("tr");
            if(confirm("Are you sure you want to delete?")){
                $.ajax({
                    url: "/lab6_war_exploded/remove",
                    method: "POST",
                    data: {
                        id: id
                    },
                    success: function (data){
                        tr.remove();
                        var total = document.getElementById('cart-total');
                        var rowCount = $("#cart-table tr").length;
                        if(rowCount == 1){
                            document.getElementById('container').innerHTML = data;
                        }else{
                            total.innerHTML = '$' + data;
                        }
                    },
                    error: function (data){
                        if(data.status === 404){
                            alert("delete failed")
                        }
                    }
                });

            }
        });
    });

</script>


<%--up quantity--%>
<script>

    $(document).ready(function () {
        $(".up-quantity").click(function (){
            var id = $(this).attr("pid");
            var price = $(this).attr("pprice");
            var quantity = $(this).attr("pquantity");
            var updateQuantitySold = $(this).closest(".quantity").find('.quantity-sold');
            var getQuantitySold = parseInt($(this).closest(".quantity").find('.quantity-sold').text());
            var updatePrice = $(this).closest('tr').find('.product-total');
                $.ajax({
                    url: "/lab6_war_exploded/upQuantity",
                    method: "POST",
                    data: {
                        id: id
                    },
                    success: function (data){
                        var upQuantitySold;
                        if(getQuantitySold >= quantity){
                            upQuantitySold = quantity;
                            alert("We are only " + quantity + " quantity for this item");
                        }else{
                            upQuantitySold = getQuantitySold + 1;
                        }
                        updateQuantitySold.html(upQuantitySold);
                        var pTotal = parseFloat(price * upQuantitySold).toFixed(2);
                        updatePrice.html("$" + pTotal);
                        var total = $('#cart-total')
                        total.html("$" + data)

                    },
                    error: function (data){

                    }
                });
        });
    });

</script>

<%--down quantity--%>
<script>

    $(document).ready(function () {
        $(".down-quantity").click(function (){
            tr = $(this).closest('tr');
            var id = $(this).attr("pid");
            var price = $(this).attr("pprice");
            var updateQuantity = $(this).closest(".quantity").find('.quantity-sold');
            var getQuantity = parseInt($(this).closest(".quantity").find('.quantity-sold').text());
            var updatePrice = $(this).closest('tr').find('.product-total');
            $.ajax({
                url: "/lab6_war_exploded/downQuantity",
                method: "POST",
                data: {
                    id: id
                },
                success: function (data){
                    var downQuantitySold = getQuantity - 1;
                    if(downQuantitySold == 0){
                            tr.remove();
                            var total = $('#cart-total');
                            total.html("$" + data);
                            var rowCount = $("#cart-table tr").length;
                            if(rowCount == 1){
                                $("#container").html(data);
                            }
                    }else{
                        updateQuantity.html(downQuantitySold);
                        var pTotal = parseFloat(price * downQuantitySold).toFixed(2);
                        updatePrice.html("$" + pTotal);
                        var total = $('#cart-total')
                        total.html("$" + data)
                    }
                },
                error: function (data){

                }
            });
        });
    });

</script>


<%--// remove product--%>

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

        $().UItoTop({ easingType: 'easeOutQuart' });

    });
</script>




<!-- //here ends scrolling icon -->


<!-- for bootstrap working -->
<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>
