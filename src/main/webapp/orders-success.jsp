<!DOCTYPE html>
<html>
<head>
    <title>Perfume Shop</title>
    <!--favicon -->
    <link href="images/favicon.PNG" rel="icon">
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

<jsp:include page="header.jsp"/>

<!-- /banner_bottom_agile_info -->
<div class="page-head_agile_info_w3l">
    <div class="container">
        <h3>Thank<span> you</span></h3>
        <!--/w3_short-->
        <div class="services-breadcrumb">
            <div class="agile_inner_breadcrumb">

                <ul class="w3_short">
                    <li><a href="index">Home</a><i>/</i></li>
                    <li><a href="cart">Cart</a><i>/</i></li>
                    <li><a href="checkout">Checkout</a><i>/</i></li>
                    <li>Orders Success</li>
                </ul>
            </div>
        </div>
        <!--//w3_short-->
    </div>
</div>
<!-- /banner_bottom_agile_info -->


<div class="container ">
    <div class="block-card">
        <div class="text-error text-center">
            <img src="images/thanks.pn" alt="">
            <h3 class="error-text"><strong>Thanks for your order!</strong></h3>
            <h4 class="error-text"><strong>Please check your email for order details.</strong></h4>
            <button style="margin-top: 16px; padding: 12px 16px" onclick="location.href ='product'" class="btn btn-primary">Continue Shopping</button>
        </div>
    </div>
</div>

<!--/grids-->
<jsp:include page="footer.jsp"/>




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



<!-- for bootstrap working -->
<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>