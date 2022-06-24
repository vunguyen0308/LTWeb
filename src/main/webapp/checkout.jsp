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
    <title>Perfume Shop - Checkout</title>
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
        <h3>Ckeck <span>Out </span></h3>
        <!--/w3_short-->
        <div class="services-breadcrumb">
            <div class="agile_inner_breadcrumb">

                <ul class="w3_short">
                    <li><a href="index">Home</a><i>/</i></li>
                    <li><a href="cart">Cart</a><i>/</i></li>
                    <li>Check out</li>
                </ul>
            </div>
        </div>
        <!--//w3_short-->
    </div>
</div>
<!-- /banner_bottom_agile_info -->

<div  class="container wrapper">
    <!-- tittle heading -->
    <h3 class="m-8" ><strong>Checkout</strong></h3>
    <!-- //tittle heading -->
    <div class="row cart-body">
        <form id="checkout-form" class="form-horizontal" method="post" action="order">
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 col-md-push-6 col-sm-push-6">
                <!--REVIEW ORDER-->
                <div class="panel panel-info" id="info">
                    <div class="panel-heading">
                        Review Order <div class="pull-right"><small><a style="color: #fff" class="afix-1" href="cart">Edit Cart</a></small></div>
                    </div>
                    <div style="-webkit-user-select: none" class="panel-body">

                        <c:set var="list" value="${cart.data}"/>
                        <c:forEach items="${list}" var="item" >
                        <div class="form-group">
                            <div class="col-sm-2 col-xs-3">
                                <img class="img-responsive" src="${item.img}" />
                            </div>
                            <div class="col-sm-6 col-xs-6">
                                <div class="col-xs-12">${item.name}</div>
                                <div class="col-xs-12"><small>Quantity: <span>${item.quantitySold}</span></small></div>
                            </div>
                            <div class="col-sm-3 col-xs-3 text-right">
                                <h6><span>$</span>${item.total()}</h6>
                            </div>
                        </div>
                        <div class="form-group"><hr /></div>
                        </c:forEach>

                        <div class="form-group">
                            <div class="col-xs-12">
                                <strong>Subtotal</strong>
                                <div class="pull-right"><span>$</span><span>${cart.total()}</span></div>
                            </div>
                        </div>
                        <div class="form-group"><hr /></div>
                        <div class="form-group">
                            <div class="col-xs-12">
                                <strong>Order Total</strong>
                                <div class="pull-right"><span>$</span><span>${cart.total()}</span></div>
                            </div>
                        </div>


                    </div>
                </div>
                <!--REVIEW ORDER END-->
            </div>

            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 col-md-pull-6 col-sm-pull-6">
                <!--SHIPPING METHOD-->
                <div class="panel panel-info">
                    <div class="panel-heading">Address</div>
                    <div class="panel-body">
                        <div class="form-group">
                            <div class="col-md-12">
                                <h4>Shipping Address</h4>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12"><strong>Full name:</strong></div>
                            <div class="col-md-12">
                                <input type="text" id="fullname" name="fullname" class="form-control" value="" />
                            </div>
                            <span class="col-md-12 form-message"></span>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12"><strong>Country:</strong></div>
                            <div class="col-md-12">
                                <input type="text" class="form-control" id="country" name="country" value="" />
                            </div>
                            <span class="col-md-12 form-message"></span>
                        </div>

                        <div class="form-group">
                            <div class="col-md-12"><strong>Address:</strong></div>
                            <div class="col-md-12">
                                <input type="text" id="address" name="address" class="form-control" value="" />
                            </div>
                            <span class="col-md-12 form-message"></span>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12"><strong>City:</strong></div>
                            <div class="col-md-12">
                                <input type="text" id="city" name="city" class="form-control" value="" />
                            </div>
                            <span class="col-md-12 form-message"></span>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12"><strong>Phone Number:</strong></div>
                            <div class="col-md-12"><input type="text" id="phone_number" name="phone_number" class="form-control" value="" /></div>
                            <span class="col-md-12 form-message"></span>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <button style="width: 100%" type="submit" class="mt-4  btn btn-primary btn-submit-fix">Place Order</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!--SHIPPING METHOD END-->
            </div>

        </form>
    </div>
</div>

<%--footer--%>
<jsp:include page="footer.jsp"/>


<a href="#home" class="scroll" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>

<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<!-- //js -->
<script src="js/modernizr.custom.js"></script>
<!-- Custom-JavaScript-File-Links -->

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

<%--Validate Form--%>
<script src="js/validate.js"></script>
<%--Checkout--%>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        Validator({
            form: '#checkout-form',
            formGroupSelector: '.form-group',
            errorSelector: '.form-message',
            rules: [
                Validator.isRequired('#fullname', 'Please enter your full name'),
                Validator.isRequired('#country', 'Please enter your country'),
                Validator.isRequired('#address', 'Please enter your address'),
                Validator.isRequired('#city', 'Please enter your city'),
                Validator.isRequired('#phone_number', 'Please enter your phone number')
            ]
        });

    });
</script>

<!-- //here ends scrolling icon -->


<!-- for bootstrap working -->
<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>
