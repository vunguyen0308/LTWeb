<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="orderStatus" scope="request" class="vn.hcmuaf.edu.fit.lab6.dao.OrderStatusDao"/>
<jsp:useBean id="payment" scope="request" class="vn.hcmuaf.edu.fit.lab6.dao.PaymentDao"/>

<!DOCTYPE html>
<html>
<head>
    <title>Perfume Shop - Order History</title>
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
        <h3>Orders <span>History </span></h3>
        <!--/w3_short-->
        <div class="services-breadcrumb">
            <div class="agile_inner_breadcrumb">

                <ul class="w3_short">
                    <li><a href="index">Home</a><i>/</i></li>
                    <li>Orders History</li>
                </ul>
            </div>
        </div>
        <!--//w3_short-->
    </div>
</div>
<!-- /banner_bottom_agile_info -->


<%--cart--%>
<div class="privacy py-sm-5 py-4 mt-4">
    <div id="container" class="container py-xl-4 py-lg-2">

        <c:if test="${oList.size() == 0}">
            <div id="empty-cart">
                <h2 class="text-center m-8 "><strong>Your Order Is Empty</strong></h2>
                <button style="display: block; margin: 0 auto" type="button" class="btn btn-lg btn-primary mt-2" onclick="location.href ='product' ">Shopping Now</button>
            </div>
        </c:if>

        <c:if test="${oList.size() > 0}">
            <div class="row justify-content-center">
                <div class="col-auto">
                    <table id="orderhistory-table" class="table table-hover" border="1" frame="void" rules="rows">
                        <thead>
                        <tr>
                            <th scope="col">Order ID</th>
                            <th scope="col">Payment</th>
                            <th scope="col">Date Time</th>
                            <th scope="col">Total Price</th>
                            <th scope="col">Status</th>
                            <th scope="col">Action</th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach var="o" items="${oList}">

                            <tr orderid="${o.id}" data>
                                <td>${o.id}</td>
                                <td>${payment.getPaymentByPaymentId(o.payment).paymentName}</td>
                                <td>${o.createAt}</td>
                                <td>$${o.total}</td>
                                <td>${orderStatus.getStatusByStatusId(o.status).statusName}</td>
                                <td><a class="detail-order" href="javascript:" orderid="${o.id}" status="${o.status}">details</a></td>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
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
<jsp:include page="modal-detailOrder.jsp"/>


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

        $().UItoTop({ easingType: 'easeOutQuart' });

    });
</script>

<script>
    $(document).ready(function() {
        $('.detail-order').click(function () {
            var orderId = $(this).attr("orderid");
            var statusOrder = $(this).attr("status");
            $.ajax({
                type: "GET",
                url: "/lab6_war_exploded/ordersdetail-history",
                data: {
                    orderId: orderId
                },
                success: function(data)
                {
                    $('#order-detail-modal').find('.modal-title').html('Order Details (Order ID: ' + orderId + ')');
                    $('#order-detail-modal').find('tbody').html(data);
                    if(statusOrder == 1){
                        $('#order-detail-modal').find('.modal-footer').html(
                            '<button type="button" onclick="cancelOrder(this)" class="btn btn-danger" orderId='+orderId+' >Cancel</button>'+
                            '<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>'
                        );
                    }else{
                        $('#order-detail-modal').find('.modal-footer').html(
                            '<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>'
                        );
                    }
                    $('#order-detail-modal').modal('show');
                }
            });

        })
    })
</script>

<script>
    function cancelOrder(order) {
        var orderId = $(order).attr("orderId");
        tr = $('#orderhistory-table tr[orderid=' + orderId + ']');

        if(confirm("Are you sure you want to cancel this order?")){
            $.ajax({
                url: "/lab6_war_exploded/cancelOrder",
                method: "POST",
                data: {
                    orderId: orderId
                },
                success: function (data){
                    $('#order-detail-modal').modal('hide');
                    tr.remove();
                    var rowCount = $("#orderhistory-table tr").length;
                    if(rowCount == 1){
                        $("#container").html(data);
                    }

                },
                error: function (data){
                    alert("Order not exist")
                }
            });

        }
    }

</script>



<!-- //here ends scrolling icon -->


<!-- for bootstrap working -->
<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>
